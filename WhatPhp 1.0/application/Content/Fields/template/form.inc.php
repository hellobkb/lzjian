<?php

//模板字段
function template($field, $value, $fieldinfo ,$catid='') {
    return select_template("", 'content', $value, 'name="info[' . $field . ']" id="' . $field . '"', 'show',$catid);
}
/**
     * 模板选择
     * @param $style  风格
     * @param $module 模块
     * @param $id 默认选中值
     * @param $str 属性
     * @param $pre 模板前缀
     */
     function select_template($style, $module, $id = '', $str = '', $pre = '' ,$catid = '') {
     	//$map['varname']='theme';
        // $config = M("Config")->where($map)->find();
        // if (empty($config['value'])) {
        //     $config['value'] = "Default";
        // }
        //$filepath = __ROOT__ ."/themes/". $config['value'] . "/Content" . DIRECTORY_SEPARATOR;
        //$tp_show = str_replace($filepath . "Show" . DIRECTORY_SEPARATOR, "", glob($filepath . "Show" . DIRECTORY_SEPARATOR . 'show*'));
        //foreach ($tp_show as $k => $v) {
            //$tp_show[$v] = $v;
            //unset($tp_show[$k]);
        //}
        $catinfo = getCategory($catid);
        $moban = $catinfo['setting']['show_template'];
        $string = "<select><option>$moban</option></select>";
        return $string;
        //return select($tp_show, $id, $str, $moban);
    }
    /**
     * 下拉选择框
     * @param type $array 数据
     * @param type $id 默认选择
     * @param type $str 属性
     * @param type $default_option 默认选项
     * @return boolean|string 
     */
    function select($array = array(), $id = 0, $str = '', $default_option = '') {
        $string = '<select ' . $str . '>';
        $default_selected = (empty($id) && $default_option) ? 'selected' : '';
        if ($default_option)
            $string .= "</select><option value=\"\" $default_selected>$default_option</option></select>";
        if (!is_array($array) || count($array) == 0)
            return false;
        $ids = array();
        if (isset($id))
            $ids = explode(',', $id);
        foreach ($array as $key => $value) {
            $selected = in_array($key, $ids) ? 'selected' : '';
            $string .= '<option value="' . $key . '"'.$selected.'>' . $value . '</option>';
        }
        $string .= '</select>';
        return $string;
    }
