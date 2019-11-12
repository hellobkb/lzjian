<?php

/**
 * 多图片字段类型表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段值
 * @return string
 */
function images($field, $value, $fieldinfo, $catid) {
    //错误提示
    $errortips = $fieldinfo['errortips'];
    //长度
    if ($fieldinfo['minlength']) {
        //验证规则
        $formValidateRules['info[' . $field . ']'] = array("required" => true);
        //验证不通过提示
        $formValidateMessages['info[' . $field . ']'] = array("required" => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
        $str1['ruls'] = $formValidateRules;
        $str1['mess'] = $formValidateMessages;
    }
    //字段扩展配置
    $setting = unserialize($fieldinfo['setting']);
    if(!defined('ZCIMGS')){
        define('ZCIMGS',true);
        $tmpl_path = C("SP_TMPL_PATH");       //TMPL 路径
        $theme = C('SP_DEFAULT_THEME');       // 模板
        $tmpl = __ROOT__."/".$tmpl_path.$theme."/";
        $list_str = '<script src="'.$tmpl.'Public/js/jquery-ui.js"></script><script type="text/javascript" src="'.$tmpl.'Public/js/zDrag.js"></script><script type="text/javascript" src="'.$tmpl.'Public/js/zDialog.js"></script><style type="text/css">.reanod_sortable{background: red;height:30px;}</style>';
    }else{
        $list_str = '';
    }

    if ($value) {
        $value = json_decode($value,true);
        if (is_array($value)) {
            $list_str .= '<div id="zctz'.$field.'">';
            foreach ($value as $_k => $_v) {
                $list_str .= "<div id='image_{$field}_{$_k}' style='padding:1px'>
                <input title='双击查看' type='text' name='{$field}_url[]' value='{$_v['url']}' style='width:310px;' ondblclick='crop_cut_thumb(this.value);' class='input image-url-input' id='thumb_{$_v['url']}'>
                <input type='text' name='{$field}_alt[]' value='{$_v['alt']}' style='width:160px;' class='input' id='thumb_preview_{$_v['url']}'> 
                <input  type='text' name='{$field}_seq[]' value='{$_v['seq']}' style='width:100px;'  class='input image-url-input' disabled>  
                <a href=\"javascript:remove_div('image_{$field}_{$_k}')\">移除</a></div>";
            }
            $list_str .= '</div>';
            $list_str .= <<<EOT
<script>
    var zcont{$field} = '#zctz{$field}';
    $(zcont{$field}).sortable({
        connectWith: zcont{$field},
        dropOnEmpty: true,
        placeholder: "reanod_sortable",
        cursor: "move",
        tolerance: "pointer"
    }).disableSelection();
    $(zcont{$field}).children().hover(function (){
        $(this).css({'border':'2px dashed red'});
    },function (){
        $(this).css("border",'none');
    })
</script>
EOT;
        }
    } else {
        $list_str .= "<center><div class='onShow' id='nameTip'>您最多每次可以同时上传 <font color='red'>{$setting['upload_number']}</font> 张</div></center>";
    }
    $str1['str'] = '<input name="info[' . $field . ']" type="hidden" value="1">
		<fieldset class="blue pad-10">
        <legend>图片列表</legend>';

    $str1['str'] .= '<div id="' . $field . '" class="picList"></div>
		</fieldset>';
	
	$value&&$str1['str'] .= $list_str.'<div class="bk10"></div>';
	
    //模块
    $module = MODULE_NAME;
    //生成上传附件验证
    $site_options = get_site_options();
    $uploadfilesize = $site_options['uploadimgsize']?$site_options['uploadimgsize']:2048;//默认2m,单位kb
    $authkey = md5("{$setting['upload_number']},{$setting['upload_allowext']},{$setting['isselectimage']},,,{$setting['watermark']}" . md5(C("AUTHCODE") . $_SERVER['HTTP_USER_AGENT']));
    $str1['str'] .= $str . "<a herf='javascript:void(0);' onclick=\"javascript:flashupload('{$field}_images', '图片上传','{$field}',change_images,'{$setting['upload_number']},{$setting['upload_allowext']},$uploadfilesize,,,{$setting['watermark']}','{$module}','{$catid}','{$authkey}')\" class=\"btn\"><span class=\"add\"></span>选择图片 </a>";
    

    !$value&&$str1['str'] .= $list_str;
    
    return $str1;
}