<?php
namespace Demo\Controller;
use Common\Controller\HomebaseController;

class IndexController extends HomebaseController{
	
	function index(){
		echo "hello";
	}
	function views(){
		visits(I('get.zxurl'),I('get.title'));
	}
	function arp(){
		$get = I('get.');
		zc_proart($get['zxurl'],$get['title'],$get['modelid']);
	}
}