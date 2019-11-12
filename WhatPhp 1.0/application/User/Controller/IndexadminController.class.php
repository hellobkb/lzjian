<?php

/**
 * 会员
 */
namespace User\Controller;
use Common\Controller\AdminbaseController;
class IndexadminController extends AdminbaseController {
    function index(){
    	$users_model=M("Users");
    	$count=$users_model->where(array("user_type"=>2))->count();
    	$page = $this->page($count, 20);
    	$lists = $users_model
    	->where(array("user_type"=>2))
    	->order("create_time DESC")
    	->limit($page->firstRow . ',' . $page->listRows)
    	->select();
    	$this->assign('lists', $lists);
    	$this->assign("page", $page->show('Admin'));
    	
    	$this->display(":index");
    }
    
    function ban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = M("Users")->where(array("id"=>$id,"user_type"=>2))->setField('user_status','0');
    		if ($rst) {
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_HYLH'));
    			$this->success("会员拉黑成功！", U("indexadmin/index"));
    		} else {
    			$this->error('会员拉黑失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }
    
    function cancelban(){
    	$id=intval($_GET['id']);
    	if ($id) {
    		$rst = M("Users")->where(array("id"=>$id,"user_type"=>2))->setField('user_status','1');
    		if ($rst) {
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_QY'));
    			$this->success("会员启用成功！", U("indexadmin/index"));
    		} else {
    			$this->error('会员启用失败！');
    		}
    	} else {
    		$this->error('数据传入失败！');
    	}
    }

    function salesman(){
        $salesman = M('Salesman')->select();
        $this->assign('salesman',$salesman);
        $this->display();
    }

    function add(){
        if(IS_POST){
            $post = I('post.');
            $salesman = M('Salesman')->add($post['post']);
            if($salesman){
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_YEWUYAUN'));
                $this->success("业务员添加成功");
                exit;
            }else{
                $this->error('业务员添加失败');
            }
        }
        $this->display();
    }

    function edit(){
        $id = I('get.id',0,'intval');
        $Salesman = M('Salesman')->where('id='.$id)->find();
        if(IS_POST){
            $post = I('post.');
            $save = M('Salesman')->save($post['post']);
            if($save){
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_YEWUYAUN'));
                $this->success("业务员修改成功",U('User/Indexadmin/salesman'));
                exit;
            }else{
                $this->error('业务员修改失败');
            }
        }
        $this->assign('Salesman',$Salesman);
        $this->display();
    }

    function del(){
        $id = I('get.id',0,'intval');
        $rs = M('Salesman')->where('id='.$id)->delete();
        if($rs !== false){
            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_YEWUYAUN'));
            $this->success("业务员删除成功",U('User/Indexadmin/salesman'));
        }else{
            $this->error('业务员删除失败');
        }
    }
}
