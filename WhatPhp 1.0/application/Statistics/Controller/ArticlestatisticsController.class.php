<?php

// +----------------------------------------------------------------------
// | thinkcmf 文章统计
// +----------------------------------------------------------------------
// | Author: xgj
// +----------------------------------------------------------------------

namespace Statistics\Controller;

use Common\Controller\AdminbaseController;

class ArticleStatisticsController extends AdminbaseController {


     //输出文章统计柱状图
     
	/* 
	 * 文章统计修改
	 * @author cx 
	 * @time 20160622
	 *  
	 *  */
	
	public function statisticsarticle() {
		$backfun = $this->formateArticle($_POST);
		$this->assign('start_time',$backfun['stime']);
		$this->assign('end_time',$backfun['etime']);
		$this->assign('content', $backfun['content']);
		$this->assign('count',json_encode($backfun['num']));
		$this->assign("time" ,json_encode($backfun['time']));
		$this->display();
	}
	
	/* 
	 * 文章统计数据函数
	 * @author cx
	 * @time 20160709
	 *  */
	
	public function formateArticle($post){
		$where['status'] = array("EQ",'99');
		$where['isdelay'] =array("EQ",'0');
		$where['is_del'] = array("EQ","0");
		
		$start_time = $post['start_time'] ? $post['start_time'] : date('Y-m-d',time()-28*24*3600);
		$end_time = $post['end_time'] ? $post['end_time'] : date("Y-m-d",time());

		if(strtotime($start_time) - strtotime($end_time) >0 ){
				$this->error("结束时间不能小于开始时间");
		}

		$begin = strtotime($start_time);
		$end = strtotime($end_time);

		$dateArray = array();
		$articleArray = array();

		while ($begin <= $end) {
			$dateArray[] = date('Y-m-d', $begin);

			$where['inputtime'] = array('LT',$begin) ;

			$sumArray = M('Article')->field("count(*) as number")->where($where)->find();

			$articleArray[] = $sumArray['number'];

			$begin += 3600*24*7;

		}

		//如果选择日期区间小于一周
		if ($end-3600*24*7 < strtotime($start_time)) {
			$where['inputtime'] = array('LT',$begin) ;

			$sumArray = M('Article')->field("count(*) as number")->where($where)->find();

			$articleArray[] = $sumArray['number'];

			$dateArray[] = date('Y-m-d', $end);
		}

		$totalnum = M('Article')->where($where)->count();

		$cont = zccurl('Portal/Statistics/formateArticle',array('start_time'=>$start_time,'end_time'=>$end_time));

		if($start_time && $end_time){
			$weeks = (strtotime($end_time) - strtotime($start_time))/(86400*7);
		}else{
			$weeks = (strtotime("today") - strtotime("2010-01-01"))/(86400*7);
		}

		$weeks = $cont['weeks'];

		if($totalnum/$weeks ==0){
			$content ="网站近期没有更新新闻资讯，公信力表现较差，且不利于关键词排名，建议应定时更新企业或产品相关内容，并设置关键词吧！";
		}elseif($totalnum/$weeks <=3){
			$content ="网站内容更新频率合理，对网站的收录和关键词排名有帮助，且提升了用户体验度和网站公信力，继续添加吧！";
		}elseif($totalnum/$weeks <=6){
			$content ="网站内容更新频率完美，建议筛选最为合理的内容展示给客户，择优添加，并适当添加资讯至博客，去检查你的关键词排名吧，坚持下去，会有惊喜哒！";
		}elseif($totalnum/$weeks >6){
			$content ="更新太快会让用户错过有价值的信息喔！";
		}
		
		return array("stime"=>$start_time, "etime"=>$end_time,"content"=>$content, "time"=>$dateArray, "num"=>$articleArray);
		
	}
	
	
}
