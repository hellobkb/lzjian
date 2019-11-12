<?php
/**
 * 单行文本框字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function text($field, $value, $fieldinfo,$catid='') {
    //扩展配置
    $setting = unserialize($fieldinfo['setting']);
    $size = $setting['size'] ? "style=\"width:{$setting['size']}px;\"" : '';
    if (empty($value)) {
        $value = $setting['defaultvalue'];
    }
    //文本框类型
    $type = $setting['ispassword'] ? 'password' : 'text';
    //错误提示
    $errortips = $fieldinfo['errortips'];
    if ($fieldinfo['minlength']) {
        //验证规则
        $name_r ='"'.'info[' . $field . ']'.'"';
        $formValidateRules['info[' . $field . ']'] = array($name_r => true);
        //验证不通过提示
        $formValidateMessages['info[' . $field . ']'] = array($name_r => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
        $str['ruls'] = $formValidateRules;
        $str['mess'] = $formValidateMessages;
        $tip = $fieldinfo['errortips'] ? $fieldinfo['errortips'] :"不能为空！";
        if($fieldinfo['pattern']){
        $str['formJavascript'] = "
                //增加验证规则
                jQuery.validator.addMethod('info[". $field."]',function(value, element){
                    var length = value.length;
                    return this.optional(element) || ( ".$fieldinfo['pattern'].".test(value));
            }, '".$tip."');" ;
        }
    }
    $str['str'] = '<input type="' . $type . '" name="info[' . $field . ']" id="' . $field . '" ' . $size . ' value="' . $value . '" class="input" ' . $fieldinfo['formattribute'] . ' ' . $fieldinfo['css'] . '>';
    return $str;exit;
}