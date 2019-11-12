<?php

/**
 * 推荐字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return string
 */
function posid($field, $value, $fieldinfo) {
    //扩展配置
    $setting = unserialize($fieldinfo['setting']);
    //推荐位缓存
    $position = M('Position')->select();
    if (empty($position)) {
        return '';
    }
    $array = array();
    foreach ($position as $_key => $_value) {
        //如果有设置模型，检查是否有该模型
        if ($_value['modelid'] && !in_array($modelid, explode(',', $_value['modelid']))) {
            continue;
        }
        //如果设置了模型，又设置了栏目
        if ($_value['modelid'] && $_value['catid'] && !in_array($catid, explode(',', $_value['catid']))) {
            continue;
        }
        //如果设置了栏目
        if ($_value['catid'] && !in_array($catid, explode(',', $_value['catid']))) {
            continue;
        }
        $array[$_key] = $_value['name'];
    }
    $posids = array();
    if (ACTION_NAME == 'edit') {
        //$result = M('PositionData')->where(array('id' => $id, 'modelid' => $modelid))->getField("posid,id,catid,posid,module,modelid,thumb,data,listorder,expiration,extention,synedit");
        $posids = implode(',', array_keys($result));
    } else {
        $posids = $setting['defaultvalue'];
    }
    return "<input type='hidden' name='info[{$field}][]' value='-1'>" . checkbox($array, $posids, "name='info[{$field}][]'", '', $setting['width']);
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


