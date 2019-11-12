<?php

// +----------------------------------------------------------------------
// | thinkcmf 货币汇率
// +----------------------------------------------------------------------
// | Author: xgj
// +----------------------------------------------------------------------

namespace Gadgets\Controller;
use Common\Controller\AdminbaseController;

class CurrencyController extends AdminbaseController {
	
	// 人民币牌价
	public function index() {
		if($_POST){
			$bank=$_POST['bank'];
			$this->assign('bank',$_POST['bank']);
		}
		$total = zccurl('Portal/Assistant/rmb',array('bank'=>$_POST['bank']));
		$this->assign('list',$total['list']);
		$this->display();
	}
	
	// 外汇汇率
	public function waihui(){
		$total = zccurl('Portal/Assistant/waihui');
		$this->assign('list',$total['list']);
		$this->display();
	}

}
