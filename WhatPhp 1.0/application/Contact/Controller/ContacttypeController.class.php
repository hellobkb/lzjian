<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016-2020 http://www.reanod.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 从小就坏
// +----------------------------------------------------------------------

namespace Contact\Controller;

use Common\Controller\AdminbaseController;
/**
 * 联系方式
 */
class ContacttypeController extends AdminbaseController{

	/**
	 * 联系方式列表
	 */
	public function index() {
		$count = M('Contact')->count();
		$page = $this->page($count,20);
		$list = M('Contact')->order("id asc")->limit($page->firstRow.",".$page->listRows)->select();
		$this->assign("list" ,$list);
		$this->assign("page", $page->show('Admin'));
		$this->display();
	}

	public function add() {
		$this->display();
	}

	/**
	* 添加联系方式
	*/
	public function add_post() {
		if (IS_POST) {

			$post = I('post.');

			$reginfo = array();
			foreach ($_POST as $key => $value) {
				if(strpos($key,"Bname")!==false && !empty($value)){  //注册字段
					$reginfo[$value] = $_POST[str_replace("Bname","Bvalue",$key )];
				}
			}

			$data =array();
			$i = 0;
			foreach ($reginfo as $key => $value) {

//				$contant_value = M('Contact')-> where("contant_name = '$key'")->getField('contant_value');

//				if (empty($key) || empty($value) ) {
//					$this->error("字段名或值不允许为空!");
//				}

                if (empty($key) ) {
                    $this->error("字段名或值不允许为空!");
                }

//				if ($contant_value ) {
//					$this->error($key.'联系方式已存在!');
//				}


				$data[$i] = array('contant_name'=>$key,'contant_value' =>$value);
				$i++;
			}

			$status = M('Contact')->addAll($data);

			if($status){
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_YINGXIAO'));
				$this->success("添加成功",U('Contacttype/index'));
			}else{
				$this->error("添加失败");
			}
		}
	}

	/**
	* 跳转到编辑页面
	*/
	public function edit() {
		$id = I('id','','int');
		$contactInfo = M('Contact')->field("contant_name, contant_value")->where(" id = $id")->find();

		$result = array($contactInfo['contant_name'] => $contactInfo['contant_value']);

		$this->assign("contactInfo", $result);
		$this->assign("id", $id);
		$this->display();
	}

	/**
	* 提交编辑信息
	*/
	public function edit_post() {
		if(IS_POST){

			$id = I('id','','int'); //编辑id

			$data = array();

			$data['contant_name'] = $_POST['reg_1'];

			$data['contant_value'] = $_POST['B_1'];

			$status = M('contact')->where(" id = $id")->save($data);
			if($status!==false){

				if($status ==0){
					$this->error("没有改变");
				}else {
					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_YINGXIAO'));
					$this->success("修改成功" , U('Contacttype/index'));
				}

			}else{
				$this->error("修改失败");
			}
		}
	}


	public function delete() {
		//单个删除
		if(IS_GET){
			 
			$id = I('id','','int');
			$contact = M('contact')->where(" id =$id")->find();
			
			if($contact){
				$status = M('contact')->where(" id = $id")->delete();
				if($status){
					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_YINGXIAO'));
					$this->success("删除成功");
				}else{
					$this->error("删除失败");
				}
			}else{
				$this->error("不存在要删除的记录!");
			}
		}
	}
}



