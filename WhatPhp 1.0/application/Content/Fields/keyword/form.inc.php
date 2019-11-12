<?php

/**
 * 关键字类型字段，表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type 
 */
function keyword($field, $value, $fieldinfo) {
    //错误提示
    $errortips = $fieldinfo['errortips'];
    //字段最小长度检测
    if ($fieldinfo['minlength']) {
        //验证规则
        $name_r ='"'.'info[' . $field . ']'.'"';
        $formValidateRules['info[' . $field . ']'] = array($name_r => true);
        //验证不通过提示
        $formValidateMessages['info[' . $field . ']'] = array("required" => $errortips ? $errortips : "请输入关键字！");
        $str['ruls'] = $formValidateRules;
        $str['mess'] = $formValidateMessages;
        $tip = $fieldinfo['errortips'] ? $fieldinfo['errortips'] :"不符合格式！";
        if($fieldinfo['pattern']){
        $str['formJavascript'] = "
                //增加验证规则
                jQuery.validator.addMethod('info[". $field."]',function(value, element){
                    var length = value.length;
                    return this.optional(element) || ( ".$fieldinfo['pattern'].".test(value));
            }, '".$tip."');" ;
        }
    }
    $str['str'] = "<input type='text' name='info[{$field}]' id='{$field}' value='". str_replace(array('"', "'"), array('&quot;', '&#039;'), $value) ."' style='width:280px' {$fieldinfo['formattribute']} {$fieldinfo['css']} class='input' placeholder='请输入关键字'>";
    return $str;
}