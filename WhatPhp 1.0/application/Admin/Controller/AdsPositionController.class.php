<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class AdsPositionController extends AdminbaseController{
	
	function _initialize() {
		parent::_initialize();
		
	}
	//广告位列表
	function index(){
		$count = M('AdsPosition')->count();
        $page = $this->page($count, 20);
        $ads_position = M('AdsPosition')->limit($page->firstRow . ',' . $page->listRows)->order('id desc')->select();
        $this->assign('ads_position',$ads_position);
        $this->assign("Page", $page->show('Admin'));
		$this->display();
	}
	//添加广告位
	function add(){
		$this->display();
	}
	function add_post(){
		if(IS_POST){
			$post = I('post.');
			$map['title'] = $post['title'];
			$count = M('AdsPosition')->where($map)->count();
			if($count)$this->error('此广告位已经添加过...');
			$rel = M('AdsPosition')->add($post);
			if($rel){
				$this->success('广告位添加成功');
			}else{
				$this->success('广告位添加失败');
			}
		}

	}
	//编辑
	function edit(){
		$id = I('id');
		$map['id'] = $id;
		$info = M('AdsPosition')->where($map)->find();
		$this->assign($info);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			$post = I('post.');
			$con = $post['p'];
			$map['id'] = $post['id'];
			$rel = M('AdsPosition')->where($map)->save($con);
			if($rel){
				$this->success('修改成功');
			}else{
				$this->error('修改失败');
			}
		}
	}
	//删除广告位
	function delete(){
		$id = I('id');
		$where['position_id'] = $id;
		$count = M('Ads')->where($where)->count();
		if($count)$this->error('广告位下有广告图，请先删掉此广告位下的广告图');
		$map['id'] = $id;
		$rel = M('AdsPosition')->where($map)->delete();
		if($rel){
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}

	}


	
	
}