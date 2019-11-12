<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class LinkController extends AdminbaseController{
	
	protected $link_model;
	protected  $targets=array("_blank"=>"新标签页打开","_self"=>"本窗口打开");
	
	function _initialize() {
		parent::_initialize();
		$this->link_model = D("Common/Links");
	}
	
	function index(){
		// $links=$this->link_model->where("link_status=1")->order(array("listorder"=>"asc"))->select();
		$links=$this->link_model->order("listorder asc")->select();
		// print_r($links);
		$this->assign("links",$links);
		$this->display();
	}
	
	function add(){
		$this->assign("targets",$this->targets);
		$this->display();
	}
	
	function add_post(){
		if(IS_POST){
			if ($this->link_model->create()) {
				$_POST['link_time'] = date('Y-m-d H:i:s', time());
				$_POST['link_status'] = 1;
				if ($this->link_model->add($_POST)!==false) {
					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').$_POST['link_name'].L('ADMINLOG_LINKS'));
					$this->success("添加成功！", U("link/index"));
				} else {
					$this->error("添加失败！");
				}
			} else {
				$this->error($this->link_model->getError());
			}
		
		}
	}
	
	function edit(){
		$id=I("get.id");
		$map['link_id'] = $id;
		$link=$this->link_model->where($map)->find();
		$this->assign($link);
		$this->assign("targets",$this->targets);
		$this->display();
	}
	
	function edit_post(){
		if (IS_POST) {
			if ($this->link_model->create()) {
				if ($this->link_model->save()!==false) {
					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').$_POST['link_name'].L('ADMINLOG_LINKS'));
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->link_model->getError());
			}
		}
	}
	
	//排序
	public function listorders() {
		$status = parent::_listorders($this->link_model);
		if ($status) {
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ORDER').L('ADMINLOG_LINKS'));
			$this->success("排序更新成功！");
		} else {
			$this->error("排序更新失败！");
		}
	}
	
	//删除
	function delete(){
		if(isset($_POST['ids'])){
			
		}else{
			$id = intval(I("get.id"));
			if ($this->link_model->delete($id)!==false) {
				$info = $this->link_model->where(array('id'=>$id))->find();
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').$info['link_name'].L('ADMINLOG_LINKS'));
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	
	}
	
	/**
	 * 显示/隐藏
	 */
	function toggle(){
		if(isset($_POST['ids']) && $_GET["display"]){
			$ids = implode(",", $_POST['ids']);
			$data['link_status']=1;
			if ($this->link_model->where("link_id in ($ids)")->save($data)!==false) {
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SHOW').L('ADMINLOG_LINKS'));
				$this->success("显示成功！");
			} else {
				$this->error("显示失败！");
			}
		}
		if(isset($_POST['ids']) && $_GET["hide"]){
			$ids = implode(",", $_POST['ids']);
			$data['link_status']=0;
			if ($this->link_model->where("link_id in ($ids)")->save($data)!==false) {
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_HIDDEN').L('ADMINLOG_LINKS'));
				$this->success("隐藏成功！");
			} else {
				$this->error("隐藏失败！");
			}
		}
	}
	
	
}