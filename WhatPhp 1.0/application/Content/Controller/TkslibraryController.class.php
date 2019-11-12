<?php

// +----------------------------------------------------------------------
// | thinkcmf 关键词库
// +----------------------------------------------------------------------
// | Copyright (c) thinkcmf
// +----------------------------------------------------------------------
// | Author: sd <995251229@qq.com>
// +----------------------------------------------------------------------

namespace Content\Controller;
use Common\Controller\AdminbaseController;
class TkslibraryController extends AdminbaseController {

    public function index() {
        $count = M('TksLibrary')->count();
        $page = $this->page($count, 20);
        $info = M('TksLibrary')->limit($page->firstRow . ',' . $page->listRows)->order('id desc')->select();
        $this->assign('info',$info);
        $this->assign("Page", $page->show('Admin'));
        $this->display();
    }

    public function add() {
        if(IS_POST){
            if(!$_POST['keywords'])$this->error('关键词不能为空', U('Tkslibrary/index'));
            $arr_keywords = explode('<br />', nl2br($_POST['keywords']));
            foreach ($arr_keywords as $key => $value) {
                $data['keywords'] = trim($value);
                M('TksLibrary')->add($data);
            }
            $this->success('添加成功', U('Tkslibrary/index'));
        }else{
            $this->display();  
        }
    }
    public function edit() {
        if(IS_POST){
            if(!$_POST['keywords'])$this->error('关键词不能为空', U('Tkslibrary/index'));
            $where['id'] = $_POST['id'];
            $data['keywords'] = $_POST['keywords'];
            $rel = M('TksLibrary')->where($where)->save($data);
            if($rel){
                $this->success('修改成功', U('Tkslibrary/index'));
            }else{
                $this->error('修改失败', U('Tkslibrary/index'));
            }
        }else{
            $get = I('get.');
            $map['id'] = $get['id'];
            $info = M('TksLibrary')->where($map)->find();
            $this->assign($info);
            $this->display();  
        }
    }
    public function delete() {
        $id = I('id');
        if($id){
            $where['id'] = $id;
            $rel = M('TksLibrary')->where($where)->delete();
            if($rel){
                $this->success('删除成功', U('Tkslibrary/index'));
            }else{
                $this->success('删除失败', U('Tkslibrary/index'));
            }
        }else{
            if (empty($_POST['ids'])) {
                $this->error('没有信息被选中！');
            }
            foreach ($_POST['ids'] as $val) {
                $map['id'] = $val;
                M('TksLibrary')->where($map)->delete();
            }
            $this->success('删除成功！');
        }
        
        
    }
    public function selecttks() {
        $get = I('get.');
        $count = M('TksLibrary')->count();
        $page = $this->page($count, 20);
        $info = M('TksLibrary')->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign("Page", $page->show("default"));
        $this->assign('info',$info);
        $this->assign('type',$get['type']);
        $this->display();
    }
    public function used(){
        $get= I('get.');
        $where['id'] = $get['id'];
        if($get['is_use'] == 1){
            $data['is_use'] = 0;
        }else{
            $data['is_use'] = 1;
        }
        $rel = M('TksLibrary')->where($where)->save($data);
        $con['status'] = 1;
        $this->ajaxReturn($con);

    }
  
}