<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class PointsController extends AdminbaseController{
	protected $users_model,$role_model;
	
	function _initialize() {
		parent::_initialize();
		$this->users_model = D("Common/Users");
		$this->points = M('Points');
		
		$this->qx_points = array(
						'1'=>'登录',
						'2'=>'浏览帮助中心',
						'3'=>'观看视频',
						'4'=>'发布文章',
						'5'=>'提供原创文章',
						'6'=>'提供视频',
						'7'=>'提供图片',
						'8'=>'提供Facebook账号',
						'9'=>'提供Linkedin账号',
						'10'=>'提供Google+账号',
						'11'=>'积分兑换'

		);
		
		$admininfo = get_admin_info($_SESSION['ADMIN_ID']);
		$this->assign('admininfo',$admininfo);
		$this->assign('qx_points',$this->qx_points);
		
		
	}
	function index(){
		$info = get_admin_info($_SESSION['ADMIN_ID']);
		if($info['identity'] == 2){
			$map['adminid'] = $info['customer'];
			$map1['adminid'] = $info['customer'];
		}else if($info['identity'] == 1){
			$adminid = get_current_admin_id();
			$map['adminid'] = $adminid;
			$map1['adminid'] = $adminid;
		}else{
			$map['adminid'] = $_SESSION['ADMIN_ID'];
			$map1['adminid'] = $_SESSION['ADMIN_ID'];
		}
		$map['contentid'] = array(array('in','1,2,3,4,5,6,7,8,9,10'));
		$info = $this->points->field('sum(points) as pointsall')->where($map)->find();//总积分
		$d['adminid'] = $map['adminid'];
		$d['contentid'] = 11;
		$dh_point = $this->points->field('sum(points) as points_dh')->where($d)->find();//兑换的积分
		
		$this->assign($info);
		$this->assign('dh',$dh_point);
		

		$map1['points'] = array('neq',0);
		$count=$this->points->where($map1)->count();
		$page = $this->page($count, 10);
		$points = $this->points
			->where($map1)
			->order("addtime DESC,id desc")
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign('points',$points);





		
		$this->display();
	}

	function listpoint(){
		
		
		$this->display();
	}
	function listpoint1(){
		$info = get_admin_info($_SESSION['ADMIN_ID']);
		if($info['identity'] == 2){
			$map['adminid'] = $info['customer'];
		}else if($info['identity'] == 1){
			$adminid = get_current_admin_id();
			$map['adminid'] = $adminid;
		}else{
			$map['adminid'] = $_SESSION['ADMIN_ID'];
		}
		
		$map['type'] = 1;
		$count=$this->points->where($map)->count();
		$page = $this->page($count, 20);
		$points = $this->points
			->where($map)
			->order("addtime DESC,id desc")
			->limit($page->firstRow . ',' . $page->listRows)
			->select();
		$this->assign("page", $page->show('Admin'));
		$this->assign('points',$points);
		$this->display();
	}

	
	function add(){
		
		$this->display();
	}
	
	function add_post(){
		if(IS_POST){
			
			
			$info = get_admin_info($_SESSION['ADMIN_ID']);
			if($info['identity'] == 2){
				if(!$info['customer'])$this->error('此推广账号没有绑定客户账号');
				$_POST['adminid'] = $info['customer'];
				
			}else if($info['identity'] == 1){
				$_POST['adminid'] = $_SESSION['ADMIN_ID'];
				
			}else{
				$this->error('此账号没有积分权限，请联系管理员');
			}
			if($_POST['contentid'] == 11){
				$m['adminid'] = $_POST['adminid'];
				$m['contentid'] = array(array('in','1,2,3,4,5,6,7,8,9,10'));
				$info = $this->points->field('sum(points) as pointsall')->where($map)->find();
				if($info['pointsall'] < $_POST['change_points']){
					$this->error("兑换积分不能超过当前积分");
				}elseif($_POST['change_points'] < 0){
					$this->error("请填写正确的积分，积分不能小于0");
				}
			}else{
				if(!$_POST['sendnum'] || $_POST['sendnum'] < 0)$this->error('请填写发送数量');
			}
			
			
			$_POST['type'] = 1;
			if ($this->points->create()) {
				$result=$this->points->add();
				if ($result!==false) {
					adminlog($_SESSION['ADMIN_ID'],'添加积分');
					$this->success("提交成功！", U("Points/add"));
				} else {
					$this->error("提交失败！");
				}
			} else {
				$this->error($this->points->getError());
			}
			
		}
	}
	
	
	function edit(){
		$id= intval(I("get.id"));
		$map['id'] = $id;
		$points = $this->points->where($map)->find();
		$this->assign($points);
		
		$this->display();
	}
	
	function edit_post(){
		if (IS_POST) {
			$id = $_POST['id'];
			$map['id'] = $id;
			$data['authnum'] = $_POST['authnum'];
			$data['points'] = $_POST['points'];

			$rel = $this->points->where($map)->save($data);
			if ($rel!==false) {
				$this->success("提交成功！", U("Points/listpoint1"));
			} else {
				$this->error("提交失败！", U("Points/listpoint1"));
			}
		}
	}
	
	

}