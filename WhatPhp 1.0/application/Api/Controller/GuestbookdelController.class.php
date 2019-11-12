<?php
namespace Api\Controller;
use Common\Controller\AdminbaseController;
class GuestbookdelController extends AdminbaseController{
	
	protected $guestbook_model;
	
	function _initialize() {
		parent::_initialize();
		$this->guestbook_model=D("Common/Guestbook");
	}
	
	function index(){
		//从数据库清空删除一个月后的
		$map['status'] = 0;
		$del_info = $this->guestbook_model->where($map)->select();
		if($del_info){
			foreach($del_info as $val){
				$cha = time()-$val['del_time'];
				$day = ceil($cha/3600/24);
				if($day >= 31){
					$where['del_time'] = array('eq',$val['del_time']);
					$this->guestbook_model->where($where)->delete();
				}
				
			}
		}
		$now = date('Y-m-d',time());
		if($_POST && $_POST['start_time']){
			if($_POST['end_time'] && $_POST['start_time']<$_POST['end_time']){
				$map['createtime'] = array(array('egt',$_POST['start_time']),array('lt',$_POST['end_time']));
			}else{
				$map['createtime'] = array(array('egt',$_POST['start_time']));
			}
			$this->assign('formget',$_POST);
		}
		$map['status'] = 0;
		$count=$this->guestbook_model->where($map)->count();
		$page = $this->page($count, 20);
		$join = 'left join '.C('DB_PREFIX').'users b on a.salesman=b.id';
		$guestmsgs=$this->guestbook_model->field('a.*,b.user_login,b.user_nicename')->alias('a')->join($join)->where($map)->order(array("createtime"=>"DESC"))->limit($page->firstRow . ',' . $page->listRows)->select();
		$this->assign("Page", $page->show('Admin'));
		$this->assign("guestmsgs",$guestmsgs);
		$this->display();
	}
	function clean(){
		if(isset($_GET['id'])){
			$id=intval(I("get.id"));
			$result=$this->guestbook_model->where(array("id"=>$id))->delete();
			if($result!==false){
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_XUNPAN'));
				$this->success("删除成功！", U("Guestbookdel/index"));
			}else{
				$this->error('删除失败！');
			}
		}
		if(isset($_POST['ids'])){

			$result = $this->guestbook_model->where("id in (".join(",",I("post.ids")).")")->delete();

			if($result !==false){
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_XUNPAN'));
				$this->success("清空成功！", U("Guestbookdel/index"));
			}else {
				$this->error('清空失败！');
			}

		/*	foreach($_POST['ids'] as $val){
		
				$result=$this->guestbook_model->where(array("id"=>$val))->delete();
				if($result!==false){
					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_XUNPAN'));
					$this->success("清空成功！", U("Guestbookdel/index"));
				}else{
					$this->error('清空失败！');
				}
			}*/
			
		}

	}
	function restore(){
		$id = I('id');
		$where['id'] = $id;
		$data['status'] = 1;
		$result=$this->guestbook_model->where($where)->save($data);
		if($result!==false){
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_XUNPAN').L('ADMINLOG_HF').'ID:'.$id);
				$this->success("还原成功！", U("Guestbookdel/index"));
		}else{
				$this->error('还原失败！');
		}
	}




}