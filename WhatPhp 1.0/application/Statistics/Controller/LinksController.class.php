<?php
/*
 * 外商浏览统计数据
 * @author sdcode
 * @time 20160602
 *   
 **/
namespace Statistics\Controller;
use Common\Controller\AdminbaseController;
class LinksController extends AdminbaseController{
	
	public function index(){
		
		$backfun = $this->formateLinks($_POST);
		
		 
		$this->assign("start_time" , $backfun['stime']?$backfun['stime']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("end_time", $backfun['etime']?$backfun['etime']:date("Y-m-d", time()));
		$this->assign("json_time", json_encode($backfun['json_time']));
		$this->assign("json_nums", json_encode($backfun['json_nums']));
		$this->assign("msg" , $backfun['msg']);
		$this->display();
	}
	
	
	/* 
	 * 发布链接统计数据
	 * @author cx
	 * @time 20160711
	 *  
	 *  */
	
	public function formateLinks($post){
		
		if($post){
			
			$stime = $post['start_time'] ? $post['start_time'] : "2010-01-01";
			$etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());
			
			if(strtotime($stime) - strtotime($etime) > 0 ){
				$this->error("结束时间不能小于开始时间");
			}
			
			$where['link_time'] =array(array('EGT',$stime),array('LT',$etime));
			
		}else {
			$where['link_time'] =array(array('EGT',"2010-01-01"),array('LT',date('Y-m-d',time())));
		}
		
		
		$list = M('links')->field("DATE_FORMAT(link_time, '%Y-%m-%d' ) as time, count(*) as number")->group('time')->where($where)->order('link_time asc')->select();
		$total =0;
		foreach ($list as $key => $value) {
			$arr['time'][] = $value['time'];
			$arr['number'][] = $value['number'];
			$total += $value['number'];
		}
		
		if($total ==0){
			$msg ="网站近期没有提交链接呦，产品没有曝光，会没有访客的，也会影响搜索引擎抓取网站的频率，建议定期发布网站链接，提升网站外部链接的数量，有利于提升网站权重和关键词排名。";
		}else if($total>0 && $total<=10){
			$msg = "发布链接数量较少，曝光度太低啦，建议增加发布数量，继续加油！";
		}else if ($total>10 && $total<20){
			$msg = "发布链接数量合理，能够提升搜索引擎抓取网站的频率和网站权重，同时有利于网站关键词排名喔。";
		}else if ($total>=20 && $total<30){
			$msg = "发布链接数量偏多，可以放慢点发布频率，来检查一下发布链接取得的效果了。";
		}else if ($total>30){
			$msg = "请注意！！近期发布链接数量过多，不如放慢速度，来检测一下网站效果了。链接发布过多，严重可能会遭到搜索引擎的惩罚的。";
		}
		
		
		return array("json_time"=>$arr['time'] , "json_nums"=>$arr['number'] ,"msg"=>$msg,"stime"=>$stime,"etime"=>$etime);
		
	}
	
}