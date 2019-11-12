<?php

/**
 * 数字字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function number($field, $value, $fieldinfo) {
    $setting = unserialize($fieldinfo['setting']);
    $size = $setting['size']?"style=\"width:{$setting['size']}px;\"":"";
    if ($value == '') {
        $value = $setting['defaultvalue'];
    }
    //错误提示
    $errortips = $fieldinfo['errortips'];
    if ($fieldinfo['minlength']) {
        //验证规则
        $name_r ='"'.'info[' . $field . ']'.'"';
        $formValidateRules['info[' . $field . ']'] = array($name_r => true);
        //验证不通过提示
        $formValidateMessages['info[' . $field . ']'] = array("required" => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
        $str['ruls'] = $formValidateRules;
        $str['mess'] = $formValidateMessages;
    }
    $tip = $fieldinfo['errortips'] ? $fieldinfo['errortips'] :"请填写数字！";
    if(!empty($fieldinfo['pattern'])){
        $str['formJavascript'] = "
            //增加验证规则
            jQuery.validator.addMethod('info[". $field."]',function(value, element){
                var length = value.length;
                return this.optional(element) || ( ".$fieldinfo['pattern'].".test(value));
        }, '".$tip."');" ;
    }
  
    $str['str'] = "<input type='number' name='info[{$field}]' id='{$field}' value='{$value}' class='input' {$size} {$fieldinfo['formattribute']} {$fieldinfo['css']} />";
    return $str;
}