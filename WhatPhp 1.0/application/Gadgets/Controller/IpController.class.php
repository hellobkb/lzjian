<?php

// +----------------------------------------------------------------------
// | thinkcmf 世界时间
// +----------------------------------------------------------------------
// | Author: xgj
// +----------------------------------------------------------------------

namespace Gadgets\Controller;
use Common\Controller\AdminbaseController;

class IpController extends AdminbaseController {

	public function index() {
		$this->display();
	}

	public function chaxun(){
		$ip = I('post.ip');
		$s = file_get_contents("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js&ip=".$ip);
		preg_match('/{.+}/',$s,$r);
		$this->success($r[0]);
	}

}
