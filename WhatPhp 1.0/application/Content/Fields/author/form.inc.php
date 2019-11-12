<?php

/**
 * 作者字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function author($field, $value, $fieldinfo) {
    //扩展配置
    $setting = unserialize($fieldinfo['setting']);
    //默认显示
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
        $tip = $fieldinfo['errortips'] ? $fieldinfo['errortips'] :"不符合格式！";
        $str['formJavascript'] = "
                //增加验证规则
                jQuery.validator.addMethod('info[". $field."]',function(value, element){
                    var length = value.length;
                    return this.optional(element) || ( ".$fieldinfo['pattern'].".test(value));
            }, '".$tip."');" ;
    }
    //宽度
    $width = $setting['width'] ? ('width:' . $setting['width'] . 'px') : 'width:180px';
    $str['str'] = '<input type="text" class="input" name="info[' . $field . ']" value="' . str_replace(array('"', "'"), array('&quot;', '&#039;'), $value) . '" style="' . $width . '" placeholder="请输入' . $fieldinfo['name'] . '信息">';
    return $str;
}
