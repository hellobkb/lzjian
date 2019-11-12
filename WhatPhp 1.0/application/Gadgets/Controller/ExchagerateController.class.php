<?php

// +----------------------------------------------------------------------
// | thinkcmf 汇率
// +----------------------------------------------------------------------
// | Author: xgj
// +----------------------------------------------------------------------

namespace Gadgets\Controller;

use Common\Controller\AdminbaseController;

class ExchagerateController extends AdminbaseController {

	// 常用汇率查询
	public function index() {
		$total = zccurl('Portal/Assistant/comexate');
		$this->assign('list',$total['list']);
		$this->assign('update',$total['update']);
		$this->display();
	}
	// 货币列表
	public function currency_list() {
		$total = zccurl('Portal/Assistant/currency_list');
		$this->assign('list',$total['list']);
		$this->display();
	}
	// 实时汇率查询换算
	public function real_rate() {
		if(IS_POST){
			$from = I('post.from');
			$to = I('post.to');
			if(empty(trim($from)) || empty(trim($to))) {
				$this->error('汇率查询不能为空');
			}
			$total = zccurl('Portal/Assistant/real_rate',array('from'=>$from,'to'=>$to));
			$this->assign('list',$total['list']);
		}
		$this->display();
	}
}
