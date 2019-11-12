<?php

/**
 * 图片字段表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function image($field, $value, $fieldinfo,$catid) {
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
    $width = $setting['width'] ? $setting['width'] : 180;
    $html = '';
    $u=__ROOT__.'/public/';
    $preview_img = $u.'images/upload-pic.png';
    //图片裁减功能只在后台使用
    if (defined('IN_ADMIN') && IN_ADMIN) {
        if($value){
            
            $html = " 
            <input type=\"button\" id='".$field."_del'  class=\"btn\" onclick=\"$('#" . $field . "_preview').attr('src','" .$preview_img . "');$('#" . $field . "').val('');$('#".$field."_del').val('上传');return false;\" value=\"删除图片\">";
           $html .= "<input type=\"button\" name='{$field}_url[]' class=\"btn\" onclick='crop_cutss_".$field."(\"".$value."\");' value='裁剪' >";
        }else{

            $html = " 
            <input type=\"button\" id='".$field."_del'  class=\"btn\" onclick=\"$('#" . $field . "_preview').attr('src','" .$preview_img . "');$('#" . $field . "').val('');$('#".$field."_del').val('上传');return false;\" value=\"上传\">";
        }

        
         $html .=   "<script type=\"text/javascript\">
                        function crop_cutss_" . $field . "(id){
                            	if ( id =='' || id == undefined ) { 
                                                  isalert('请先上传缩略图！');
                                                  return false;
                                                }
                                                var catid = $('input[name=\"info[catid]\"]').val();
                                                if(catid == '' ){
                                                    isalert('请选择栏目ID！');
                                                    return false;
                                                }
                                                Wind.use('artDialog','iframeTools',function(){
                                                  art.dialog.open(GV.DIMAUB+'index.php?g=Content&m=Contentshow&a=public_imagescrop&catid='+catid+'&picurl='+encodeURIComponent(id)+'&input=$field&preview=" . ($setting['show_type'] && defined('IN_ADMIN') ? $field . "_preview" : '') . "', {
                                                    title:'裁减图片', 
                                                    id:'crop',
                                                    ok: function () {
                                                        var iframe = this.iframe.contentWindow;
                                                        if (!iframe.document.body) {
                                                             alert('iframe还没加载完毕呢');
                                                             return false;
                                                        }
                                                        iframe.uploadfile();
                                                        return false;
                                                    },
                                                    cancel: true
                                                  });
                                                });
                                };
                    </script>";
    }
    if($value){
            $preview_img = $value;
        }else{
            $preview_img = $u.'images/upload-pic.png';
        }
    //模块
    $module = MODULE_NAME;
    //生成上传附件验证
    //$authkey = upload_key("1,{$setting['upload_allowext']},{$setting['isselectimage']},{$setting['images_width']},{$setting['images_height']},{$setting['watermark']}");
    $authkey = md5("1,{$setting['upload_allowext']},{$setting['isselectimage']},{$setting['images_width']},{$setting['images_height']},{$setting['watermark']}" . md5(C("AUTHCODE") . $_SERVER['HTTP_USER_AGENT']));
    //图片模式
    $site_options = get_site_options();
    $uploadfilesize = $site_options['uploadimgsize']?$site_options['uploadimgsize']:2048;//默认2m,单位kb
    if ($setting['show_type']) {
        $str['str'] = "<div  style=\"text-align: center;\"><input type='hidden' name='info[$field]' id='$field' value='$value'>
			<a href='javascript:void(0);' onclick=\"flashupload('{$field}_images', '附件上传','{$field}',thumb_images,'1,{$setting['upload_allowext']},$uploadfilesize,{$setting['images_width']},{$setting['images_height']},{$setting['watermark']}','{$module}','$catid','$authkey');return false;\">
			<img src=\"$preview_img\" id='{$field}_preview' width='135' height='113' style='cursor:hand' /></a>
                       <br/> " . $html . "
                   </div>";//print_r($str);exit;
    } else {
        //文本框模式
         $str['str'] = "<input type='text' name='info[$field]' id='$field' value='$value' style='width:{$width}px;' class='input' />  <input type='button' class='button' onclick=\"flashupload('{$field}_images', '附件上传','{$field}',submit_images,'1,{$setting['upload_allowext']},$uploadfilesize,{$setting['images_width']},{$setting['images_height']},{$setting['watermark']}','{$module}','{$catid}','$authkey')\"/ value='上传图片'>" . $html;
    }return $str;
 }