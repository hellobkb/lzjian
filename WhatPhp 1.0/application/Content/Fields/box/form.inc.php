<?php

/**
 * 选项字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function box($field, $value, $fieldinfo) {
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
    if (is_null($value) || $value == ''){
        $value = $setting['defaultvalue'];
    }
    $options = explode("\n", $setting['options']);
    foreach ($options as $_k) {
        $v = explode("|", $_k);
        $k = trim($v[1]);
        $option[$k] = $v[0];
    }
    $values = explode(',', $value);
    $value = array();
    foreach ($values as $_k) {
        if ($_k != '')
            $value[] = $_k;
    }
    $value = implode(',', $value);
    switch ($setting['boxtype']) {
        case 'radio':
            $str['str'] = radio($option, $value, "name='info[$field]' {$fieldinfo['formattribute']}", $setting['width'], $field);
            break;

        case 'checkbox':
            $str['str'] = checkbox($option, $value, "name='info[$field][]' {$fieldinfo['formattribute']}", 1, $setting['width'], $field);
            break;

        case 'select':
            $str['str'] = select1($option, $value, "name='info[$field]' id='$field' {$fieldinfo['formattribute']}");
            break;

        case 'multiple':
            $str['str'] = select1($option, $value, "name='info[$field][]' id='$field ' size=2 multiple='multiple' style='height:60px;' {$fieldinfo['formattribute']}");
            break;
    }
    return $str;
}
/**
     * 单选框
     * @param $array 选项 二维数组
     * @param $id 默认选中值
     * @param $str 属性
     */
    function radio($array = array(), $id = 0, $str = '', $width = 0, $field = '') {
        $string = '';
        foreach ($array as $key => $value) {
            $checked = trim($id) == trim($key) ? 'checked' : '';
            if ($width)
                $string .= '<label class="ib" style="width:' . $width . 'px">';
            $string .= '<input type="radio" ' . $str . ' id="' . $field . '_' . htmlspecialchars($key) . '" ' . $checked . ' value="' . $key . '"> ' . $value;
            if ($width)
                $string .= '</label>';
        }
        return $string;
    }
    
    /**
     * 下拉选择框
     * @param type $array 数据
     * @param type $id 默认选择
     * @param type $str 属性
     * @param type $default_option 默认选项
     * @return boolean|string 
     */
     function select1($array = array(), $id = 0, $str = '', $default_option = '') {
        $string = '<select ' . $str . '>';
        $default_selected = (empty($id) && $default_option) ? 'selected' : '';
        if ($default_option)
            $string .= "<option value=\"\" $default_selected>$default_option</option>";
        if (!is_array($array) || count($array) == 0)
            return false;
        $ids = array();
        if (isset($id))
            $ids = explode(',', $id);
        foreach ($array as $key => $value) {
            $selected = in_array($key, $ids) ? 'selected' : '';
            $string .= '<option value="' . $key . '" ' . $selected . '>' . $value . '</option>';
        }
        $string .= '</select>';
        return $string;
    }
    /**
     * 复选框
     * @param $array 选项 二维数组
     * @param $id 默认选中值，多个用 '逗号'分割
     * @param $str 属性
     * @param $defaultvalue 是否增加默认值 默认值为 -99
     * @param $width 宽度
     */
    function checkbox($array = array(), $id = '', $str = '', $defaultvalue = '', $width = 0, $field = '') {
        $string = '';
        $id = trim($id);
        if ($id != '')
            $id = strpos($id, ',') ? explode(',', $id) : array($id);
        if ($defaultvalue)
            $string .= '<input type="hidden" ' . $str . ' value="-99">';
        $i = 1;
        foreach ($array as $key => $value) {
            $key = trim($key);
            $checked = ($id && in_array($key, $id)) ? 'checked' : '';
            if ($width)
                $string .= '<label class="ib" style="width:' . $width . 'px">';
            $string .= '<input type="checkbox" ' . $str . ' id="' . $field . '_' . $i . '" ' . $checked . ' value="' . htmlspecialchars($key) . '"> ' . htmlspecialchars($value);
            if ($width)
                $string .= '</label>';
            $i++;
        }
        return $string;
    }


