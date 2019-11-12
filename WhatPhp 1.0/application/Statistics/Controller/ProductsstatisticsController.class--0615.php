<?php
/*产品统计类
*Author：徐广建
*
* 修改记录：20160804 修改sql添加查询条件status是否删除，isdelay是否推迟
* 修改记录：20160903 展示由柱状图改为表格
*/
namespace Statistics\Controller;

use Common\Controller\AdminbaseController;

class ProductsstatisticsController extends AdminbaseController{

	/*输出产品统计饼状图*/
	
	/*
	 * 产品统计修改
	 * @author cx
	 * @time 20160622
	 *   
	 *   */
	
	public function statisticsProducts(){

		if (IS_POST) {
			$_GET = $post = I('post.');
			$backfun = $this->formateProduct($post);
		}
		
		if (IS_GET) {
			$post = I('get.');
			$backfun = $this->formateProduct($post);
		}
		$cont = zccurl('Portal/Cindex/addList');
		$this->assign("stime",$post['stime']?$post['stime']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("etime",$post['etime']?$post['etime']:date("Y-m-d", time()));
		$this->assign("list",$backfun['list']);
		$this->assign("msg",$backfun['msg']);
		$this->assign("Page", $backfun['Page']);
		$this->display();

	}

	/*
	 * 产品统计数据函数
	 * @author cx
	 * @time 20160709
	 *
	 * */
	
	public function formateProduct($post){

		$where = array();
		$where['modelid'] = 5;

		if($post){
			$start_time = $post['stime'] ? $post['stime'] : date('Y-m-01', strtotime(date("Y-m-d")));
			$end_time = $post['etime'] ? $post['etime'] : date("Y-m-d",time());
			$where['time'] = array(array('EGT',strtotime($start_time)),array('LT',strtotime($end_time)));
		}else {
			$where['time'] = array(array('EGT',strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),array('LT',strtotime("today")));
		}

		$jiange = strtotime($start_time)-strtotime($end_time);

		if($jiange >0 ){
			$this->error("结束时间不能小于开始时间");
		}else{
			$jiange = $jiange/86400;
		}

		$total = M('Artpro')->field('sum(clicks) as num')->where($where)->find();
		$list = M('Artpro')->field('title, url, sum(clicks) as clicks, FROM_UNIXTIME( time, "%Y%m%d" ) as time')->where($where)->group('title')->select();

		$page = $this->page(count($list), 15);

		$list = M('Artpro')->limit($page->firstRow . ',' . $page->listRows)->field('title, url, sum(clicks) as clicks, FROM_UNIXTIME( time, "%Y-%m-%d" ) as time')->where($where)->group('title')->select();

		$cont = zccurl('Portal/Statistics/formateProduct',array('num'=>$total['num'],'jiange'=>$jiange));

		$msg = $cont['msg'];

		return array("list"=>$list,"msg"=>$msg, "Page"=>$page->show('Admin'));
	}
	
	
	
	//产品添加统计
	public function staProTime(){
		
		if (IS_POST) {
			$_GET = $post = I('post.');
			$backfun = $this->formateProTime($post);
		}
		
		if (IS_GET) {
			$post = I('get.');
			$backfun = $this->formateProTime($post);
		}
		
		  
		 
		$this->assign("stime", $backfun['stime']?$backfun['stime']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("etime", $backfun['etime']?$backfun['etime']:date("Y-m-d", time()));
		// $this->assign("list", json_encode($backfun['list']));
		$this->assign("list",$backfun['list']);
		$this->assign("Page", $backfun['Page']);
		$this->assign("total", $backfun['total']);
		$this->display();
		
	}
	
	/* 
	 * 产品添加数据函数
	 * @author cx
	 * @time 20160709
	 *  
	 *  */
	
	public function formateProTime($post =''){
		 
		$where['status'] =array("EQ", "99");
		$where['isdelay'] = array("EQ","0");
		$where['is_del'] = array("EQ",'0');
		
		if($post ){

			$start_time = $post['stime'] ? $post['stime'] : date('Y-m-01', strtotime(date("Y-m-d")));
			$end_time = $post['etime'] ? $post['etime'] : date("Y-m-d", time());
			
			if(strtotime($start_time) - strtotime($end_time) >0 ){
				$this->error("结束时间不能小于开始时间");
			}
			$where['inputtime'] = array(array('EGT',strtotime($start_time)), array("LT", strtotime($end_time)));
		}else {
			  
			$where['inputtime'] = array(array('EGT',strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))), array("LT", strtotime("today")));
		}

		$join = 'left join cmf_category c on c.catid = p.catid';
		$list = M('Product')->field("c.catname as name, FROM_UNIXTIME(inputtime, '%Y-%m-%d' ) as  time, count(*) as value")->alias('p')->join($join)->where($where)->group("name")->select();

		$cont = zccurl('Portal/Statistics/formateProTime',array('list'=>$list));
		$list_size = $cont['list_size'];
		$total = $cont['total'];

		$page = $this->page($list_size, 15);
		$list = M('Product')->limit($page->firstRow . ',' . $page->listRows)->field("c.catname as name, FROM_UNIXTIME(inputtime, '%Y-%m-%d' ) as  time, count(*) as value")->alias('p')->join($join)->where($where)->group("name")->select();
		return array("list"=>$list ,"stime"=>$start_time, "etime"=>$end_time, "Page"=>$page->show('Admin'),"total"=>$total);

	}
	
	
	//产品发布人统计
	public function staProAdd(){
		
		$backfun = $this->formateProAdd($_POST);
		 
		$this->assign("stime", $backfun['stime']?$backfun['stime']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("etime", $backfun['etime']?$backfun['etime']:date("Y-m-d", time()));
		$this->assign("list", json_encode($backfun['list']));
		$this->display();
	}
	
	
	/*
	 * 产品发布人数据函数
	 * @author cx
	 * @time 20160709
	 *
	 * */
	public function formateProAdd($post=""){
		$where['status'] =array("EQ", "99");
		$where['isdelay'] = array("EQ","0");
		$where['is_del'] = array("EQ",'0');
		
		if($post){
			$start_time = $post['stime'] ? $post['stime'] : date('Y-m-01', strtotime(date("Y-m-d")));
			$end_time = $post['etime'] ? $post['etime'] : date("Y-m-d",time());
			if(strtotime($start_time) - strtotime($end_time) >0 ){
				$this->error("结束时间不能小于开始时间");
			}
			$where['inputtime'] = array(array('EGT',strtotime($start_time)), array("LT", strtotime($end_time)));
		}else {
			$where['inputtime'] = array(array('EGT',strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))), array("LT", strtotime("today")));
		}

		$list = M('Product')->field("username as name, count(*) as value")->where($where)->group("name")->select();

		return array("list"=>$list, "stime"=>$start_time, "etime"=>$end_time);
	}

}

?>