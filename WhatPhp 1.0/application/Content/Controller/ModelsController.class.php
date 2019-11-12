<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: sd
// +----------------------------------------------------------------------
namespace Content\Controller;
use Common\Controller\AdminbaseController;
class ModelsController extends AdminbaseController {
	
	function index(){
		$data = D("Content/Model")->where(array("type" => 0))->select();
        $this->assign("data", $data);//print_r($data);
        $this->assign("pre",C("DB_PREFIX").'_');
		$this->display();
	}
	
	function add(){
		$data = I('post.');
		if ($data) {
            if (empty($data)) {
                $this->error('提交数据不能为空！');
            }
            if (D("Content/Model")->addModel($data)) {
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_MOXING').$data['name']);
                $this->success("添加模型成功！");
            } else {
                $error = D("Content/Model")->getError();
                $this->error($error ? $error : '添加失败！');
            }
        } else {
            $this->display();
        }
	}
	//编辑模型
    public function edit() {
        if (IS_POST) {
            $data = I('post.');
            if (empty($data)) {
                $this->error('提交数据不能为空！');
            }
            if (D("Content/Model")->editModel($data)) {
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_MOXING').$data['name']);
                $this->success('模型修改成功！', U('index'));
            } else {
                $error = D("Content/Model")->getError();
                $this->error($error ? $error : '修改失败！');
            }
        } else {
            $modelid = I('get.modelid', 0, 'intval');
            $data = D("Content/Model")->where(array("modelid" => $modelid))->find();
            $this->assign("data", $data);
            $this->display();
        }
    }
	
	//删除模型
    public function delete() {
        $modelid = I('get.modelid', 0, 'intval');
        //检查该模型是否已经被使用
        $count = M("Category")->where(array("modelid" => $modelid))->count();
        if ($count) {
            $this->error("该模型已经在使用中，请删除栏目后再进行删除！");
        }
        //这里可以根据缓存获取表名
        $modeldata = D("Content/Model")->where(array("modelid" => $modelid))->find();
        if (!$modeldata) {
            $this->error("要删除的模型不存在！");
        }
        $rel = D("Content/Model")->deleteModel($modelid);
        if ($rel) {
            $name=getModel($modelid, 'name');
            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_MOXING').$name);
            $this->success("删除成功！", U("Models/index"));
        } else {
            $this->error("删除失败！");
        }
    }

    //检查表是否已经存在
    public function public_check_tablename() {
        $tablename = I('get.tablename');
        $count = D("Content/Model")->where(array("tablename" => $tablename))->count();
        if ($count == 0) {
            $this->success('表名不存在！');
        } else {
            $this->error('表名已经存在！');
        }
    }

    //模型的禁用与启用
    public function disabled() {
        $modelid = I('get.modelid', 0, 'intval');
        $disabled = I('get.disabled') ? 0 : 1;
        $status = D("Content/Model")->where(array('modelid' => $modelid))->save(array('disabled' => $disabled));
        if ($status !== false) {
            $name=getModel($modelid, 'name');
            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_QIYONG').L('ADMINLOG_JINYONG').L('ADMINLOG_MOXING').$name);
            $this->success("操作成功！");
        } else {
            $this->error("操作失败！");
        }
    }

    //模型导入
    public function import() {
        if (IS_POST) {
            if (empty($_FILES['file'])) {
                $this->error("请选择上传文件！");
            }
            $filename = $_FILES['file']['tmp_name'];
            if (strtolower(substr($_FILES['file']['name'], -3, 3)) != 'txt') {
                $this->error("上传的文件格式有误！");
            }
            //读取文件
            $data = file_get_contents($filename);
            //删除
            @unlink($filename);
            //模型名称
            $name = I('post.name');
            //模型表键名
            $tablename = I('post.tablename');
            //导入
            $status = D("Content/Model")->import($data, $tablename, $name);
            if ($status) {
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DAORU').L('ADMINLOG_MOXING').$name);
                $this->success("模型导入成功，请及时更新缓存！");
            } else {
                $this->error(D("Content/Model")->getError() ? D("Content/Model")->getError() : '模型导入失败！');
            }
        } else {
            $this->display();
        }
    }

    //模型导出
    public function export() {
        //需要导出的模型ID
        $modelid = I('get.modelid', 0, 'intval');
        if (empty($modelid)) {
            $this->error('请指定需要导出的模型！');
        }
        C('SHOW_PAGE_TRACE',false);
        //导出模型
        $status = D("Content/Model")->export($modelid);
        $name=getModel($modelid, 'name');
        adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DAOCHU').L('ADMINLOG_MOXING').$name);
        if ($status) {
            header("Content-type: application/octet-stream");
            header("Content-Disposition: attachment; filename=spf_model_" . $modelid . '.txt');
            echo $status;
        } else {
            $this->error(D("Content/Model")->getError() ? D("Content/Model")->getError() : '模型导出失败！');
        }
    }

}