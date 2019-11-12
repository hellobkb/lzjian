<?php

/* 
 * URL规则管理
 * @author cx
 * @time 20160524
 * 
 *  */


namespace Content\Controller;
use Common\Controller\AdminbaseController;
class UrlruleController extends AdminbaseController {
	
	public function _initialize(){
		
		//可用模块列表
		$Module = array(
				'content' => array(
						'module' => 'content',
						'name' => '内容模块',
				),
		);
		
		$this->assign("Module" ,$Module);
		
	}
	
	
	/*  
	 * URL规则列表
	 * @author cx
	 * @time  20160524
	 * */
	 
	public function index(){
		
		$count = M('urlrule')->count();
		
		$page = $this->page($count ,20);
		
		$list = M('urlrule')->order(array('urlruleid' => 'DESC'))->limit($page->firstRow . ',' . $page->listRows)->select();
		 
		 
		$this->assign("Page", $page->show('Admin')); 
		$this->assign("list" , $list);
		$this->display();
	}
	
	
	/* 
	 * URL规则添加
	 * @author cx
	 * @time 20160524
	 *  
	 *  */
	
	public function add(){
		
		$this->display();
	}
	
	/* 
	 * URL规则添加提交
	 * @author cx
	 * @time 20160524
	 *  */
	
	public function add_post(){
		 
		extract($_POST);
		 
		if(!$file){
			$this->error("请填写URL规则名称！");
		}
		
		if(!$example){
			$this->error("请填写URL示例!");
		}
		
		if(!$urlrule){
			$this->error("请填写URL规则!");
		}
		
		$data =array();
		
		$data['module'] =$module;
		$data['file'] = $file;
		$data['ishtml'] = $ishtml;
		$data['urlrule'] =$urlrule;
		$data['example'] =$example;
		
		$status = M('urlrule')->add($data);
		
		if($status){
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_URL').$data['file']);
			$this->success("添加成功！",U('Urlrule/index'));
		}else{
			$this->error("添加失败!");
		}
		 
	}
	
	public function edit(){
		
		$urlruleid = I('urlruleid','','int');
		
		if(!$urlruleid){
			$this->error("ID不存在");
		}
		
		$info = M("urlrule")->where("urlruleid=".$urlruleid)->find();
		if(!$info){
			$this->error("不存在选择规则");
		}
		$this->assign("info" ,$info);
		$this->display();
		
	}
	
	public function edit_post(){
		extract($_POST);
		
		if(!$urlruleid){
			$this->error("没有规则ID!");
		}
		
		if(!$file){
			$this->error("请填写URL规则名称！");
		}
		
		if(!$example){
			$this->error("请填写URL示例!");
		}
		
		if(!$urlrule){
			$this->error("请填写URL规则!");
		}
		
		$data =array();
		
		$data['module'] =$module;
		$data['file'] = $file;
		$data['ishtml'] = $ishtml;
		$data['urlrule'] =$urlrule;
		$data['example'] =$example;
		
		$status = M('urlrule')->where("urlruleid=".$urlruleid)->save($data);
		
		if($status){
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_URL').$data['file']);
			$this->success("修改成功!", U('Urlrule/index'));
		}else{
			$this->error("修改失败!");
		}
		
	}
	
	public function delete(){
		
		$urlruleid = I('urlruleid','','int');
		
		if(!$urlruleid){
			$this->error("没有ID");
		}
		
		$rule = M('urlrule')->where("urlruleid=".$urlruleid)->find();
		
		if(!$rule){
			$this->error("没有找到本条记录");
		}
		 
		
		$status = M('urlrule')->where("urlruleid=".$urlruleid)->delete();
		
		if($status){
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_URL').$rule['file']);
			$this->success("删除成功");
		}else{
			$this->error("删除失败");
		}
		
		
		
	}
	
	
	
}