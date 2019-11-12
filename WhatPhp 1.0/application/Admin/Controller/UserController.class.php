<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class UserController extends AdminbaseController{
	protected $users_model,$role_model;
	
	function _initialize() {
		parent::_initialize();
		$this->users_model = D("Common/Users");
		$this->role_model = D("Common/Role");
		$this->qx_points = array(
						'1'=>'登录',
						'2'=>'浏览帮助中心',
						'3'=>'观看视频',
						'4'=>'发布文章'

			);
		$this->assign('qx_points',$this->qx_points);
		
	}
	function index(){
		$where = array();
		$where['user_type'] = 1;
		$where['user_status'] = array('neq',3);
		$count=$this->users_model->where($where)->count();
		$page = $this->page($count, 20);


		$users = $this->users_model
		->where($where)
		->order("create_time DESC")
		->limit($page->firstRow . ',' . $page->listRows)
		->select();

		$art = M('Article');
		$pro = M('Product');
		$inquiry = M('Guestbook');
		foreach ($users as $k => $v) {
			$users[$k]['numart'] = $art->where('username="'.$v['user_login'].'"')->count();
			$users[$k]['numpro'] = $pro->where('username="'.$v['user_login'].'"')->count();
			$users[$k]['numinquiry'] = $inquiry->where('salesman="'.$v['id'].'"')->count();
			
			$roleuser = M()->table("cmf_role_user as ru left join cmf_role as r on ru.role_id = r.id")->field("r.name")->where("ru.user_id = $v[id]")->select();
			 $rolename = "";
			 foreach($roleuser as $value){
			 	$rolename .=",".$value['name'];
			 }
			 $users[$k]['rolename'] = ltrim($rolename,",");
		}

		$roles_src=$this->role_model->select();
		$roles=array();
		foreach ($roles_src as $r){
			$roleid=$r['id'];
			$roles["$roleid"]=$r;
		}

		$this->assign("page", $page->show('Admin'));
		$this->assign("roles",$roles);
		$this->assign("users",$users);
		$this->display();
	}

	function journal(){
		$id = I('get.id',0,'intval');
		$info = catadminlog($id);
		$this->assign('info',$info);
		$this->display();
	}
	
	function add(){
		$roles=$this->role_model->where("status=1")->order("id desc")->select();
		
		//得到所有的经理
		$crole = M()->table("cmf_role_user as ru left join cmf_users as u on ru.user_id = u.id")->field("u.id, u.user_login")->where("ru.role_id=4")->select();

		//获取登录后台的管理员信息
		$admin_id = get_current_admin_id();
		$admininfo = get_admin_info($admin_id);
		$this->assign('admininfo',$admininfo);
		//客户账号
		$where_p['identity'] = 1;
		$customers = $this->users_model->where($where_p)->select();
		$this->assign('customers',$customers);


		$this->assign("crole", $crole);
		$this->assign("roles",$roles);
		$this->display();
	}

	function add_post(){
		if(IS_POST){
			if($_POST['promoter']){
				$count_promo = $this->users_model->where(array("promoter"=>$_POST['promoter']))->count();
				if($count_promo)$this->error('该客户账号已绑定');
			}
			if(!empty($_POST['role_id']) && is_array($_POST['role_id'])){
				$role_ids=$_POST['role_id'];
				$points_auth = $_POST['points_auths'];
				if(in_array(5, $role_ids) && !in_array(4,$role_ids )){   //有业务员，没有业务经理角色
					$mid = I('salemanager','','int');
					unset($_POST['salemanager']);
					if($mid<=0){
						$this->error("请选择业务经理");
					} 
				}
				unset($_POST['role_id']);
				unset($_POST['points_auths']);
				$_POST['user_status'] = 1;
				$_POST['user_type'] = 1;
				if($points_auth)$_POST['points_auth'] = implode(',', $points_auth);
				if ($this->users_model->create()) {
					$result=$this->users_model->add();
					if ($result!==false) {
						$role_user_model=M("RoleUser");
						foreach ($role_ids as $role_id){
							if(!in_array(4 , $role_ids) && $role_id ==5){ //只是业务员
								M('crm_user')->add(array('uid'=>$result,'mid'=>$mid,'addtime'=>time()));
							}
							
							if ( $role_id ==4){  //只有业务经理
								M('crm_user')->add(array('uid'=>$result,'mid'=>$result,'addtime'=>time()));
							}
							
							$role_user_model->add(array("role_id"=>$role_id,"user_id"=>$result));
						}
					
						adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_ADMINMANA'));
						$this->success("添加成功！", U("user/index"));
					} else {
						$this->error("添加失败！");
					}
				} else {
					$this->error($this->users_model->getError());
				}
			}else{
				$this->error("请为此用户指定角色！");
			}
			
		}
	}
	
	
	function edit(){
		$id= intval(I("get.id"));
		$roles=$this->role_model->where("status=1")->order("id desc")->select();
		 
		$this->assign("roles",$roles);
		$role_user_model=M("RoleUser");
		$role_ids=$role_user_model->where(array("user_id"=>$id))->getField("role_id",true);
		$this->assign("role_ids",$role_ids);
		
		if(in_array("5" , $role_ids)){  //有业务员角色
			
			$mid = M('crm_user')->where(" uid = $id ")->find();
			$this->assign("mid", $mid);
			 
		}
			
		$user=$this->users_model->where(array("id"=>$id))->find();
		
		$crole = M()->table("cmf_role_user as ru left join cmf_users as u on ru.user_id = u.id")->field("u.id, u.user_login")->where("ru.role_id=4")->select();

		//获取登录后台的管理员信息
		$admin_id = get_current_admin_id();
		$admininfo = get_admin_info($admin_id);
		$this->assign('admininfo',$admininfo);
		//客户账号
		$where_p['identity'] = 1;
		$customers = $this->users_model->where($where_p)->select();
		$this->assign('customers',$customers);

		$this->assign($user);
		$this->assign("crole", $crole);
		$this->display();
	}
	
	function edit_post(){
		if (IS_POST) {
			if(!empty($_POST['role_id']) && is_array($_POST['role_id'])){
				if(empty($_POST['user_pass'])){
					unset($_POST['user_pass']);
				}
				if(in_array("5",$_POST['role_id']) && !in_array(4, $_POST['role_id'])){
					 $mid = I('salemanager','','int');
					 unset($_POST['salemanager']);
					 if($mid <=0){
					 	$this->error("请选择业务经理！");
					 }
				}
				 
				$role_ids=$_POST['role_id'];
				$points_auth = $_POST['points_auths'];

				unset($_POST['role_id']);
				unset($_POST['points_auths']);
				if($_POST['identity'] == 1)$_POST['points_auth'] = implode(',', $points_auth);
				else $_POST['points_auth'] = '';
				if ($this->users_model->create()) {
					$result=$this->users_model->save();
					if ($result!==false) {
						$uid=intval($_POST['id']);
						$role_user_model=M("RoleUser");
						$role_user_model->where(array("user_id"=>$uid))->delete();
						M('crm_user')->where("uid=$uid")->delete();
						foreach ($role_ids as $role_id){
							$role_user_model->add(array("role_id"=>$role_id,"user_id"=>$uid));
							if($role_id == 5 && !in_array(4, $role_ids)){  //只业务员角色
								$status = M('crm_user')->add(array('uid'=>$uid,'mid'=>$mid,'addtime'=>time()));//where("uid=$uid")->save(array('mid'=>$mid));
								
								//修改成功后，将所有的业务员归属的客户上级改变
								if($status){
									M('client')->where(" uid=$uid ")->save(array("mid"=>$mid));
								}
							}
							if($role_id ==4){
								$status = M('crm_user')->add(array('uid'=>$uid,'mid'=>$uid,'addtime'=>time()));//where("uid=$uid")->save(array('mid'=>$mid));
								if($status){
									M('client')->where(" uid=$uid")->save(array("mid"=>$uid));
								}
							}
						}
						
						adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_ADMINMANA'));
						$this->success("保存成功！");
					} else {
						$this->error("保存失败！");
					}
				} else {
					$this->error($this->users_model->getError());
				}
			}else{
				$this->error("请为此用户指定角色！");
			}
			
		}
	}
	
	/** 
	 *  删除
	 */
	function delete(){
		$id = intval(I("get.id"));
		if($id==1){
			$this->error("最高管理员不能删除！");
		}
		
		$crmfind =M('crm_user')->where("mid=$id and uid!=$id")->find();
		if($crmfind){
			$this->error("删除失败，业务经理有下属业务员！");
		}
		
		// 改为逻辑删除
		if ($this->users_model->where("id=$id")->save(array('user_status'=>3))!==false) {

			$roles = M('RoleUser')->where(array("user_id"=>$id))->select();
			$roleid = implode(",", $roles);
			
			M("RoleUser")->where(array("user_id"=>$id))->delete();

			if(strpos($roleid ,"4")!=false){ //删除的是业务经理
				
				$status = M('client')->where(" mid=$id")->save(array('status'=>1, 'uid'=>0,"mid"=>0));
				$status1 = M('crm_user')->where("mid=$id")->delete();
				
			}else if (strpos($roleid ,"5")!=false){ //删除的是业务员
	 
				$status = M('client')->where("uid=$id")->save(array('uid'=>0));
				$status1 =M('crm_user')->where("uid=$id")->delete();
				
			}
			
			
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_ADMINMANA'));
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		}
	}
	
	
	function userinfo(){
		$id=get_current_admin_id();
		$user=$this->users_model->where(array("id"=>$id))->find();
		$this->assign($user);
		$this->display();
	}
	
	function userinfo_post(){
		if (IS_POST) {
			$_POST['id']=get_current_admin_id();
			$create_result=$this->users_model
			->field("user_login,user_email,last_login_ip,last_login_time,create_time,user_activation_key,user_status,role_id,score,user_type",true)//排除相关字段
			->create();
			if ($create_result) {
				if ($this->users_model->save()!==false) {
					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_PERINFO'));
					$this->success("保存成功！");
				} else {
					$this->error("保存失败！");
				}
			} else {
				$this->error($this->users_model->getError());
			}
		}
	}
	
	    function ban(){
        $id=intval($_GET['id']);
		
		$crmfind =M('crm_user')->where("mid=$id and uid!=$id")->find();
		if($crmfind){
			$this->error("拉黑失败，业务经理有下属业务员！");
		}

    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','0');
    		if ($rst) {
    			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_NOADMIN'));
    			$this->success("管理员停用成功！", U("user/index"));
    		} else {
    			$this->error('管理员停用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function cancelban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = $this->users_model->where(array("id"=>$id,"user_type"=>1))->setField('user_status','1');
    		if ($rst) {
    			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_YEADMIN'));
    			$this->success("管理员启用成功！", U("user/index"));
    		} else {
    			$this->error('管理员启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }

    /*
    *管理员删除
    */
    function del(){
    	$id = I('id','0','int');
    	if(!$id)$this->error('参数错误');
    	$rel = M('Users')->where('id='.$id)->delete();
    	if($rel){
    		//删除管理员分配的角色
    		$map['user_id'] = $id;
    		M('RoleUser')->where($map)->delete();
    		//删除管理员日志
    		$map['uid'] = $id;
    		M('AdminLog')->where($map)->delete();
    		$this->success('删除成功',U('User/index'));
    	}else{
    		$this->error('删除失败');
    	}
    }
	
	
	
}