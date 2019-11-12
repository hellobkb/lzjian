<?php

/**
 * 栏目字段
 * @param type $field 字段名
 * @param type $value 字段值
 * @param type $fieldinfo 该字段的配置信息
 * @return type
 */
function catid($field, $value, $fieldinfo ,$catid='') {
    if (empty($value)) {
        //当值为空时，获取当前添加的栏目ID
        $value = $catid;
       
    }//print_r($value);exit;
    //后台管理员搞高级选项
    $publish_str = '';
    if (ACTION_NAME == 'add' && defined("IN_ADMIN") && IN_ADMIN) {
        $str['str'] .= "
            <ul class='three_list cc' id='add_othors_text'></ul>";
    }
    $str['str'] .= '<input type="hidden" name="info[' . $field . ']" value="' . $value . '"/>' . getCategory($catid, 'catname') . $publish_str;
    return $str;
}
