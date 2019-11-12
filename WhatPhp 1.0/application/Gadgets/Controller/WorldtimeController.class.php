<?php

// +----------------------------------------------------------------------
// | thinkcmf 世界时间
// +----------------------------------------------------------------------
// | Author: xgj
// +----------------------------------------------------------------------

namespace Gadgets\Controller;

use Common\Controller\AdminbaseController;

class WorldtimeController extends AdminbaseController {

	public function index() {
		$this->display();
	}

	public function getTime(){
		$country = I('post.country');
		$city = I('post.city');
		$total = zccurl('Portal/Assistant/get_timee',array('country'=>$country,'city'=>$city));
		$timez = $total['timez'];
		$d = new \DateTime("now", new \DateTimeZone($timez['timeZoneId']));
		$this->success(array("status"=>1, "msg"=>$d->format('Y-m-d H:i:s')));
	}
}
