<?php

// +----------------------------------------------------------------------
// | thinkcmf google api
// +----------------------------------------------------------------------
// | Author:sdcode
// +----------------------------------------------------------------------

namespace Statistics\Controller;

use Common\Controller\AdminbaseController;

class GoogleApiController extends AdminbaseController {

	public function index() {
		$count = M('GoogleApi')->count();
        $page = $this->page($count, 20);
		$info = M('GoogleApi')->limit($page->firstRow . ',' . $page->listRows)->order('id desc')->select();
		$this->assign('info',$info);
		$this->assign("Page", $page->show('Admin'));
		$this->display();
	}
	public function edit() {
		
		$this->display();
	}
	public function add() {
		if($_POST){
			$con['key']= I("post.key");
			$con['cx']= I("post.cx");
			$rel = M('GoogleApi')->add($con);
			if($rel){
				$this->success('添加成功',U('GoogleApi/index'));
			}else{
				$this->error('添加失败',U('GoogleApi/add'));
			}
		}else{
			$this->display();
		}
	}
	public function del() {
		$id = I('id');
		if(!$id)$this->error('api不存在',U('GoogleApi/index'));;
		$map['id'] = $id;
		$rel = M('GoogleApi')->where($map)->delete();
		if($rel){
			$this->success('删除成功',U('GoogleApi/index'));
		}else{
			$this->error('删除失败',U('GoogleApi/index'));
		}
	}
}
