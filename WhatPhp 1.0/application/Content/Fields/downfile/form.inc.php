<?php

/**
 * 单文件上传字段表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function downfile($field, $value, $fieldinfo,$catid='') {
    //错误提示
    $errortips = $fieldinfo['errortips'];
    if ($fieldinfo['minlength']) {
        //验证规则
        $formValidateRules['info[' . $field . ']'] = array("required" => true);
        //验证不通过提示
        $formValidateMessages['info[' . $field . ']'] = array("required" => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
        $str['ruls'] = $formValidateRules;
        $str['mess'] = $formValidateMessages;
    }
    //扩展配置
    $setting = unserialize($fieldinfo['setting']);
    //表单长度
    $width = $setting['width'] ? $setting['width'] : 300;
    //生成上传附件验证 //同时允许的上传个数, 允许上传的文件类型, 是否允许从已上传中选择
    
    $authkey = md5("1,{$setting['upload_allowext']},{$setting['isselectimage']}" . md5(C("AUTHCODE") . $_SERVER['HTTP_USER_AGENT']));
    //模块
    $module = MODULE_NAME;
    $site_options = get_site_options();
    $uploadfilesize = $site_options['uploadfilesize']?$site_options['uploadfilesize']:2048;//默认2m,单位kb
    //文本框模式
    $str['str'] = "<input type='text' name='info[$field]' id='$field' value='$value' style='width:{$width}px;' class='input' />  <input type='button' class='button' onclick=\"flashupload('{$field}_downfile', '附件上传','{$field}',submit_attachment,'1,{$setting['upload_allowext']},{$uploadfilesize}','{$module}','$catid','$authkey')\"/ value='上传文件'>";
    return $str;
}