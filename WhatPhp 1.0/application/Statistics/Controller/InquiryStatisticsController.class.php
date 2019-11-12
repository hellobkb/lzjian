<?php
	/*
	*询盘统计类
	*Author：徐广建
	*/
	namespace Statistics\Controller;

	use Common\Controller\AdminbaseController;

	class InquiryStatisticsController extends AdminbaseController {

		private $Guestbook;

		function _initialize() {
			parent::_initialize();
			$this->Guestbook = M('Guestbook');
		}

		/*输出询盘地域统计图*/
		public function statisticsInquiry () {

			$option_name = "询盘地域统计";
 
			$backfun = $this->formateInquiry(I('post.'));
			$json_list = json_encode($backfun['list']);
			$json_country = json_encode($backfun['country']);

			$this->assign("option_name", $option_name);
			$this->assign("json_country", $json_country);
			$this->assign('json_list',$json_list);
			$this->assign('stime' , $backfun['stime']);
			$this->assign("etime" , $backfun['etime']);
			$this->display();
		}

		/* 
		 * 询盘地域数据
		 * @author cx
		 * @time 20160709
		 *  
		 *  */
		
		public function formateInquiry($post){
			if($post){
				$stime = $post['stime'] ? date("Y-m",strtotime($post['stime'])) : "2010-01";  //开始时间
				$etime = $post['etime'] ? date("Y-m",strtotime($post['etime'])) : date("Y-m",time());	 //结束时间
				if(strtotime($stime) - strtotime($etime) >0 ){
					$this->error("结束时间不能早于开始时间");
				}
				$where['UNIX_TIMESTAMP(createtime)']= array(array('EGT',strtotime($stime)), array("LT", strtotime($etime)));
			}else {
				$where['UNIX_TIMESTAMP(createtime)']= array(array('EGT',strtotime("2010-01")), array("LT", strtotime(date("Y-m",strtotime("today")))));
			}

			$list = $this->Guestbook->field("from_country as name, count(*) as value")->where($where)->group('name')->select();
			foreach ($list as $key => $value) {
				$arr['country'][] = $value['name'];
			}

			return array('list'=>$list, 'country'=>$arr['country'],"stime"=>$stime,"etime"=>$etime);
		}

		/*输出询盘买家统计图（折线图）*/
		public function statisticsBuyer () {

			$backfun = $this->formateBuyer($_POST);
			$this->assign('json_createtime',json_encode($backfun['time']));
			$this->assign('json_number',json_encode($backfun['num']));
			$this->assign('stime' , $backfun['stime']);
			$this->assign("etime" , $backfun['etime']);

			$this->display();
		}
		
		/* 
		 * 询盘买家数据
		 * @author cx
		 * @time 20160709
		 * 
		 *  */
		
		public function formateBuyer($post){
			
			if($post){
			
				$stime = $post['stime'] ? date("Y-m",strtotime($post['stime'])) : "2010-01";  //开始时间
				$etime = $post['etime'] ? date("Y-m",strtotime($post['etime'])) : date("Y-m",time());	 //结束时间
			
				if(strtotime($stime) - strtotime($etime) >0 ){
					$this->error("结束时间不能早于开始时间");
				}
				
				$where['UNIX_TIMESTAMP(createtime)']= array(array('EGT',strtotime($stime)), array("LT", strtotime($etime)));
			}else {
				 
				$where['UNIX_TIMESTAMP(createtime)']= array(array('EGT',strtotime("2010-01")), array("LT", strtotime(date("Y-m",strtotime("today")))));
			}
			
			$list_buyer = $this->Guestbook->field("DATE_FORMAT(createtime, '%Y-%m' ) as time, count(*) as number")->where($where)->group('time')->select();
			
			foreach ($list_buyer as $key => $value) {
				$arr['time'][] = $value['time'];
				$arr['number'][] = $value['number'];
			}
		
			return array("stime"=>$stime,"etime"=>$etime ,  "time"=>$arr['time'],"num"=>$arr['number']);
		}

	}

?>