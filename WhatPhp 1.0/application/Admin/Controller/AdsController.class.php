<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class AdsController extends AdminbaseController{
	protected $ad_model;
	
	function _initialize() {
		parent::_initialize();
		$this->ad_model = D("Common/Ads");
		$site_options = get_site_options();
    	$uploadimgsize = $site_options['uploadimgsize']?$site_options['uploadimgsize']:2048;//默认2m,单位kb
    	$this->assign('uploadimgsize',$uploadimgsize);
	}
	//
	function index(){
		$position_id = I('id');
		$where['position_id'] = $position_id;
		$count = M('Ads')->where($where)->count();
        $page = $this->page($count, 20);
        $ads = M('Ads')->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('sort asc,id desc')->select();
        $this->assign('ads',$ads);
        $this->assign("Page", $page->show());
        $this->assign('position_id',$position_id);
		$this->display();
	}
	//
	function add(){
		$position_id = I('id');
		$this->assign('position_id',$position_id);
		$this->display();
	}
	function add_post(){
		if(IS_POST){
			$post = I('post.');
			$post['url1'] = $post['url1'];
			$rel = M('Ads')->add($post);
			if($rel){
				$this->success('添加成功');
			}else{
				$this->success('添加失败');
			}
		}

	}
	//
	function edit(){
		echo iconv( 'euc-kr' , 'utf-8' );
		$id = I('id');
		$map['id'] = $id;
		$info = M('Ads')->where($map)->find();
		$this->assign($info);
		$this->display();
	}
	function edit_post(){
		if(IS_POST){
			$post = I('post.');
			if(!$post['w']['id'])$this->error('参数错误');
			$post['url1'] = $post['url1'];
			$where['id'] = $post['w']['id'];
			$rel = M('Ads')->where($where)->save($post);
			if($rel){
				$this->success('编辑成功');
			}else{
				$this->error('编辑失败');
			}
		}

	}
	//
	function delete(){
		$id = I('id');
		$map['id'] = $id;
		$rel = M('Ads')->where($map)->delete();
		if($rel){
			$this->success('删除成功');
		}else{
			$this->error('删除失败');
		}
	}


	
	
}