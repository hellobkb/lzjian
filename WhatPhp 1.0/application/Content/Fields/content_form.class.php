<?php

// +----------------------------------------------------------------------
// | thinkcmf 处理信息录入表单
// +----------------------------------------------------------------------
// | Copyright (c) 2012-2014 http://www.thinkcmf.com, All rights reserved.
// +----------------------------------------------------------------------
// | Author: sd <995251229@au.com>
// +----------------------------------------------------------------------
namespace Content\Fields;
class content_form {

    //validate表单验证
    public $formValidateRules, $formValidateMessages, $formJavascript;
    //栏目ID
    public $catid = 0;
    //栏目缓存
    public $categorys = array();
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

    /**
     * 构造函数
     * @param type $modelid 模型ID
     * @param type $catid 栏目id
     */
    public function __construct($modelid, $catid, $id='') {
        $this->model = M("Model");
        if ($modelid) {
            $this->setModelid($modelid, $catid, $id);
        }
    }

    /**
     * 初始化
     * @param type $modelid
     * @return boolean
     */
    public function setModelid($modelid, $catid, $id='') {
        $this->modelid = $modelid;
        if(S('Model')){
            $modelinfo=S('Model');
        }else{
            $modelinfo=M("Model")->where(array("modelid"=>$this->modelid))->find();
            S('Model',$modelinfo);
        }
        
        if (empty($modelid)) {
            return false;
        }
        if (empty($modelinfo)) {
            return false;
        }
        $modelField=M("ModelField")->where(array("modelid"=>$modelid))->order('listorder asc')->select();//
        $this->catid = $catid;
        $this->fields = $modelField;
        $this->id = $id;
        $this->tablename = trim($modelinfo['tablename']);
        $this->fieldsurl = APP_PATH . '/Content/Fields/';
        
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

    /**
     * 获取模型字段信息
     * @param type $data
     * @return type 
     */
    public function get($data = array()) {
        $this->data = $data;
        $catid=$this->catid;
        $info = array();
        foreach ($this->fields as $key=>$fieldInfo) {
            $field = $fieldInfo['field']; 
            //判断是否后台
            if (defined('IN_ADMIN') && IN_ADMIN) {
                //判断是否内部字段，如果是，跳过
                if ($fieldInfo['iscore']) {
                    continue;
                }

            } else {
                //判断是否内部字段或者，是否禁止前台投稿字段
                if ($fieldInfo['iscore']) {
                    continue;
                }
                //是否在前台投稿中显示
                if (!$fieldInfo['isadd']) {
                    continue;
                }
            }
             //是否显示
            if ($fieldInfo['disabled']) {
                continue;
            }
            //字段类型
            $func = $fieldInfo['formtype'];
            //判断对应方法是否存在，不存在跳出本次循环
            /*if (!method_exists($this, $func)) {
                continue;
            }*/
            $value = isset($this->data[$field]) ? $this->data[$field] : '';
            //如果是分页类型字段
            if ($func == 'pages' && isset($this->data['maxcharperpage'])) {
                $value = $this->data['paginationtype'] . '|' . $this->data['maxcharperpage'];
            }
            //取得表单HTML代码 传入参数 字段名 字段值 字段信息
            if(!function_exists($func)){
                include $this->fieldsurl . $func.'/'.'form.inc.php';
            }
            if($func == 'omnipotent'){
                $form = $func($field, $value, $fieldInfo ,$catid ,$data);
            }else{
                $form = $func($field, $value, $fieldInfo ,$catid,$this->id);
            }
           
            if ($form['str'] !== false) {
                $star = $fieldInfo['minlength'] || $fieldInfo['pattern'] ? 1 : 0;
                $fieldConfg = array(
                    'name' => $fieldInfo['name'],
                    'tips' => $fieldInfo['tips'],
                    'form' => $form['str'],
                    'star' => $star,
                    'isomnipotent' => $fieldInfo['isomnipotent'],
                    'formtype' => $fieldInfo['formtype']
                );
                //作为基本信息
                if ($fieldInfo['isbase']) {
                    $info['base'][$field] = $fieldConfg;
                } else {
                    $info['senior'][$field] = $fieldConfg;
                }
            }
            if($fieldInfo['minlength']){
                foreach ($form['ruls'] as $k => $v) {
                    $formValidateRules[$k] = $v;
                }
                foreach ($form['mess'] as $km => $vm) {
                    $formValidateMessages[$km] = $vm;
                }
            }
            if(!empty($form['formJavascript'])){
                $formJavascript[] = $form['formJavascript'];
            }
        }
        $formJavascriptrel =substr(implode(" ", $formJavascript) ,0,strlen(implode(" ", $formJavascript))-1);
        //配合 validate 插件，生成对应的js验证规则
        $info['formValidateRules'] = $formValidateRules = $this->ValidateRulesJson($formValidateRules);
        $info['formValidateMessages'] = $formValidateMessages = $this->ValidateRulesJson($formValidateMessages, true);
        $info['formJavascript'] = $formJavascriptrel;
        return $info;
    }

    /**
     * 转换为validate表单验证相关的json数据
     * @param type $ValidateRules
     */
    public function ValidateRulesJson($ValidateRules, $suang = false) {
        foreach ($ValidateRules as $formname => $value) {
            $va = array();
            if (is_array($value)) {
                foreach ($value as $k => $v) {
                    //如果作为消息，消息内容需要加引号，不然会JS报错，是否验证不需要
                    if ($suang) {
                        $va[] = "$k:'$v'";
                    } else {
                        $va[] = "$k:$v";
                    }
                }
            }
            $va = "{" . implode(",", $va) . "}";
            $formValidateRules[] = "'$formname':$va";
        }
        $formValidateRules = "{" . implode(",", $formValidateRules) . "}";
        return $formValidateRules;
    }

    ##{字段处理函数}##
}
