<?php

/**
 * 多行文本框 表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return string
 */
function textarea($field, $value, $fieldinfo, $catid='') {
    //扩展配置
    $setting = unserialize($fieldinfo['setting']);
    if (empty($value)) {
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
    //关键词信息
    $tdks = M('Tdks')->where(array('catid'=>$catid))->find();
    $desc = unserialize($tdks['description']);
    if($field == 'seodescription' && $desc['iswrite'] == 1){
        if($value)$descarr=unserialize($value);
        $option=M("Options")->where("option_name='site_options'")->find();
        $option_info = json_decode($option['option_value'],true);
        $list_title_mo = $option_info['list_title_h'];//title默认部分
        $list_desc_mo = $option_info['list_desc_z'];//description句型默认部分
        $str['str'] .= '
        <input type="text" id="des1" value="'.$descarr['des1'].'" name="des1" maxlength="180" style="width:300px;">
        <input type="text" disabled="disabled" id="desc_mo" name="desc_mo" value="'.$list_desc_mo.'" style="width:300px;">
        <input type="hidden"  name="desc_mo" value="'.$list_desc_mo.'">
        <input type="text" id="des2" name="des2" value="'.$descarr['des2'].'" maxlength="180" style="width:300px;">
        <input type="text" id="desc3" name="des3" value="'.$descarr['des3'].'" maxlength="180" style="width:300px;">
        <input type="text" id="desc4" name="des4" value="'.$descarr['des4'].'" maxlength="180" style="width:300px;">';
        return $str;
    }elseif($field == 'seodescription' && $desc['iswrite'] == 0){
        $str['str'] .= '<textarea id="seodescription" maxlength=' . $fieldinfo['maxlength'] . ' name="info[seodescription]" style="width:400px; height:46px;"';
        //长度处理
        if ($fieldinfo['maxlength']) {
            $str['str'] .= " onkeyup=\"strlen_verify(this, '{$field}_len', {$fieldinfo['maxlength']})\"";
        }
        $str['str'] .= ">{$value}</textarea>";
        if ($fieldinfo['maxlength']){
            $str['str'] .= '可以输入<B><span id="' . $field . '_len">' . $fieldinfo['maxlength'] . '</span></B>个字符！ ';
            // 初始化数据
            $str['str'] .= '<script>$(function (){strlen_verify(document.getElementById("'.$field.'"), "'.$field.'_len", '.$fieldinfo['maxlength'].')})</script>';
        }
        return $str;
    }else{
        $str['str'] = "<textarea name='info[{$field}]' maxlength=".$fieldinfo['maxlength']."  id='{$field}' style='width:{$setting['width']}%;height:{$setting['height']}px;' {$fieldinfo['formattribute']} {$fieldinfo['css']}";
        //长度处理
        if ($fieldinfo['maxlength']) {
            $str['str'] .= " onkeyup=\"strlen_verify(this, '{$field}_len', {$fieldinfo['maxlength']})\"";
        }
        $str['str'] .= ">{$value}</textarea>";
        if ($fieldinfo['maxlength']){
            $str['str'] .= '可以输入<B><span id="' . $field . '_len">' . $fieldinfo['maxlength'] . '</span></B>个字符！ ';
            // 初始化数据
            $str['str'] .= '<script>$(function (){strlen_verify(document.getElementById("'.$field.'"), "'.$field.'_len", '.$fieldinfo['maxlength'].')})</script>';
        }
        return $str;
    }

}