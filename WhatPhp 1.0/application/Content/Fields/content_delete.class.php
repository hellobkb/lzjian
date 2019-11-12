<?php

// +----------------------------------------------------------------------
// | thincmf 数据删除时回调
// +----------------------------------------------------------------------
// | Copyright (c) 2012-2014 http://www.thincmf.com, All rights reserved.
// +----------------------------------------------------------------------
// | Author: sdcode
// +----------------------------------------------------------------------
namespace Content\Fields;
class content_delete {

    //信息ID
    public $id = 0;
    //栏目ID
    public $catid = 0;
    //模型ID
    public $modelid = 0;
    //字段信息
    public $fields = array();
    //模型缓存
    protected $model = array();
    //数据
    protected $data = array();
    //最近错误信息
    protected $error = '';
    // 数据表名（不包含表前缀）
    protected $tablename = '';

    public function __construct($modelid) {
        $this->model = M("Model");
        if ($modelid) {
            $this->setModelid($modelid);
        }
    }
    
    /**
     * 初始化
     * @param type $modelid
     * @return boolean
     */
    public function setModelid($modelid) {
        if (empty($modelid)) {
            return false;
        }
        $this->modelid = $modelid;
        $model_info=$this->model->where(array("modelid"=>$modelid))->find();
        
        if (empty($model_info)) {
            return false;
        }
        $modelField = M("ModelField")->where(array("modelid"=>$modelid))->select();
        $this->fields = $modelField;
        $this->tablename = trim($model_info['tablename']);
    }

    /**
     * 魔术方法，获取配置
     * @param type $name
     * @return type
     */
    public function __get($name) {
        return isset($this->data[$name]) ? $this->data[$name] : (isset($this->$name) ? $this->$name : NULL);
    }

    /**
     *  魔术方法，设置options参数
     * @param type $name
     * @param type $value
     */
    public function __set($name, $value) {
        $this->data[$name] = $value;
    }

    public function get($data) {
        if (empty($data)) {
            $this->error = '数据不能为空！';
            return false;
        }
        $this->data = $data;
        $this->id = (int) $data['id'];
        $this->catid = (int) $data['catid'];
        $info = array();
        foreach ($this->fields as $fieldInfo) {
            $field = $fieldInfo['field'];
            //字段类型
            $func = $fieldInfo['formtype'];
            if (!$func || !isset($this->data[$field])) {
                continue;
            }
            //字段内容
            $value = $this->data[$field];
            if (method_exists($this, $func)) {
                $this->$func($field, $value);
            }
        }
        return true;
    }

    ##{字段处理函数}##
}
