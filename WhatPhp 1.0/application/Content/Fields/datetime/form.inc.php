<?php

/**
 * 日期时间字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function datetime($field, $value, $fieldinfo) {
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
    $setting = unserialize($fieldinfo['setting']);
    $isdatetime = 0;
    $timesystem = 0;
    //时间格式
    if ($setting['fieldtype'] == 'int') {//整数 显示格式
        if (empty($value) && $setting['defaulttype']) {
            $value = time();
        }
        //整数 显示格式
        $format_txt = $setting['format'] == 'm-d' ? 'm-d' : $setting['format'];
        if ($setting['format'] == 'Y-m-d Ah:i:s') {
            $format_txt = 'Y-m-d h:i:s';
        }
        $value = $value ? date($format_txt, $value) : '';
        $isdatetime = strlen($setting['format']) > 6 ? 1 : 0;
        if ($setting['format'] == 'Y-m-d Ah:i:s') {
            $timesystem = 0;
        } else {
            $timesystem = 1;
        }
    } elseif ($setting['fieldtype'] == 'datetime') {
        $isdatetime = 1;
        $timesystem = 1;
    } elseif ($setting['fieldtype'] == 'datetime_a') {
        $isdatetime = 1;
        $timesystem = 0;
    }
    $str['str'] = datet("info[{$field}]", $value, $isdatetime, 1, 'true', $timesystem);
    return $str;
}
/**
     * 日期时间控件
     * @param $name 控件name，id
     * @param $value 选中值
     * @param $isdatetime 是否显示时间
     * @param $loadjs 是否重复加载js，防止页面程序加载不规则导致的控件无法显示
     * @param $showweek 是否显示周，使用，true | false
     */
    function datet($name, $value = '', $isdatetime = 0, $loadjs = 0, $showweek = 'true', $timesystem = 1) {
        if ($value == '0000-00-00 00:00:00')
            $value = '';
        $id = preg_match("/\[(.*)\]/", $name, $m) ? $m[1] : $name;
        if ($isdatetime) {
            $size = 21;
            $format = '%Y-%m-%d %H:%M:%S';
            if ($timesystem) {
                $showsTime = 'true';
            } else {
                $showsTime = '12';
            }
        } else {
            $size = 10;
            $format = '%Y-%m-%d';
            $showsTime = 'false';
        }
        $str = '';
        if($name == 'info[updatetime]'){
            $str .= '<input type="text" name="' . $name . '" id="' . $id . '" value="' . $value . '" size="' . $size . '" class="js-date">';
        }else{
            $str .= '<input type="text" name="' . $name . '" id="' . $id . '" value="' . $value . '" size="' . $size . '" class="input length_3 J_datetime ">';
        }
        
        return $str;
    }
