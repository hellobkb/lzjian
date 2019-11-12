<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016-2020 http://www.reanod.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: kop
// +----------------------------------------------------------------------


namespace Content\Controller;
use Common\Controller\AdminbaseController;
class SociallyController extends AdminbaseController {

	public function index() {

		$host = $_SERVER['HTTP_HOST'];
		$data = zccurl('Portal/Socially/index',array('host'=>$host));
		$this->assign('url',$data['url']);

		$this->display();
	}

}