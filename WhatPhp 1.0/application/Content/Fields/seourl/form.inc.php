<?php

/**
 * 标题字段，表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return string
 */
function seourl($field, $value, $fieldinfo, $catid='',$id='') {
	
    $u=__ROOT__.'/public/';
    //取得标题样式
    $style_arr = explode(';', $data['style']);
    //取得标题颜色
    $style_color = $style_arr[0];
    //是否粗体
    $style_font_weight = $style_arr[1] ? $style_arr[1] : '';
    //组合成CSS样式
    $style = 'color:' . $data['style'];
    //错误提示
    $errortips = $fieldinfo['errortips'];
    if($id){
      $modelid = getCategory($catid,'modelid'); 
      $tablename = getModel($modelid,'tablename');
      $datainfo = M($tablename)->where(array('id'=>$id))->find();
       
    }
    //是否进行最小长度验证
    if ($fieldinfo['minlength']) {
        //验证规则
        $name_r ='"'.'info[' . $field . ']'.'"';
        $formValidateRules['info[' . $field . ']'] = array($name_r => true);
        //验证不通过提示
        $formValidateMessages['info[' . $field . ']'] = array($name_r => $fieldinfo['errortips'] ? $fieldinfo['errortips'] : "seourl为英文字母或-！");
        $str['ruls'] = $formValidateRules;
        $str['mess'] = $formValidateMessages;
    }
    $tip = $fieldinfo['errortips'] ? $fieldinfo['errortips'] :"请填写字母、数字、下划线或连接符-！";
    $str['formJavascript'] = "
            //增加验证规则
            jQuery.validator.addMethod('info[". $field."]',function(value, element){
                var length = value.length;
                return this.optional(element) || ( /^[A-Za-z0-9_-]*$/g.test(value));
        }, '".$tip."');" ;
  
    $str['str'] = '<input type="text"  style="width:400px;" name="info[' . $field . ']" id="'.$field.'" placeholder="" value="'.$value.'" />';
 
    return $str;
}