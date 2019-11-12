<?php

/**
 * 标题字段，表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return string
 */
function title($field, $value, $fieldinfo, $catid='',$id='') {
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
        if($fieldinfo['pattern']){
        //验证规则
        $name_r ='"'.'info[' . $field . ']'.'"';
        if($field == 'title'){
            $formValidateRules['info[' . $field . ']'] = array("required" => true);
            $formValidateMessages['info[' . $field . ']'] = array("required" => $errortips ? $errortips : "标题不能为空！");
        }else{
            $formValidateRules['info[' . $field . ']'] = array($name_r => true);
            $formValidateMessages['info[' . $field . ']'] = array($name_r => $errortips ? $errortips : "标题不能为空！");
        }
        
        //验证不通过提示
        
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
        
    }
    $str['str'] = '<input type="text" style="width:400px;'. ($style_font_weight ? 'font-weight:' . $style_font_weight . ';' : '') . '" name="info[' . $field . ']" id="' . $field . '" value="' . str_replace(array('"', "'"), array('&quot;', '&#039;'), $value) . '" style="' . $datainfo['style'] . '" class="input input_hd J_title_color" placeholder="请输入标题" onblur="auto_seo('.$catid.',this.value);GetSeourl(this.value);"/>
                <input type="hidden" name="style_font_weight" id="style_font_weight" value="' . $style_font_weight . '">';
    if($field == 'title'){
        $str['str'] = '<input type="text" required style="width:400px;'. ($style_font_weight ? 'font-weight:' . $style_font_weight . ';' : '') . '" name="info[' . $field . ']" id="sdtitlecx" value="' . str_replace(array('"', "'"), array('&quot;', '&#039;'), $value) . '" class="input input_hd J_title_color" placeholder="请输入标题" onblur="auto_seo('.$catid.',this.value);GetSeourl(this.value);"/>
                <input type="hidden" name="style_font_weight" id="style_font_weight" value="' . $style_font_weight . '">';
    }else{
        $str['str'] = '<input type="text" style="width:400px;'. ($style_font_weight ? 'font-weight:' . $style_font_weight . ';' : '') . '" name="info[' . $field . ']" id="' . $field . '" value="' . str_replace(array('"', "'"), array('&quot;', '&#039;'), $value) . '"  class="input input_hd J_title_color" placeholder="请输入标题")" />
                <input type="hidden" name="style_font_weight" id="style_font_weight" value="' . $style_font_weight . '">';
    }
    //后台的情况下
    if (defined('IN_ADMIN') && IN_ADMIN)
        if($field == 'title'){
            $str['str'] .= '<input type="button" class="btn" id="check_title_alt" value="标题检测" onclick="$.get(\'' . U('Content/Contentshow/public_check_title',array('catid'=>$catid)) . '\', {data:$(\'#title\').val()}, function(data){if(data.status==false) {$(\'#check_title_alt\').val(\'标题重复\');$(\'#check_title_alt\').css(\'background-color\',\'#FFCC66\');} else if(data.status==true) {$(\'#check_title_alt\').val(\'标题不重复\');$(\'#check_title_alt\').css(\'background-color\',\'#e1e8ca\')}},\'json\')" style="width:95px;"/>
                    <span class="color_pick J_color_pick"><em style="background:' . $datainfo['style'] . ';" class="J_bg"></em></span><input type="hidden" name="style_color" id="style_color" class="J_hidden_color" value="' . $style_color . '">
                    <img src="' . $u . 'images/bold.png" width="10" height="10" onclick="input_font_bold()" style="cursor:hand"/>';
    //$str['str'] .= ' <span>还可输入<B><span id="title_len">' . $fieldinfo['maxlength'] . '</span></B> 个字符</span>';
        }else{
            //$str['str'] .= ' <span>还可输入<B><span id="title_len">' . $fieldinfo['maxlength'] . '</span></B> 个字符</span>';
        }
        
    return $str;
}