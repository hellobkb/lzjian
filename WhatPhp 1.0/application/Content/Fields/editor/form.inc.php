<?php

/**
 * 编辑器字段 表单组合处理
 * @param type $field 字段名
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function editor($field, $value, $fieldinfo) {
    
    $setting = unserialize($fieldinfo['setting']);
    //是否禁用分页和子标题 基本没用。。。
    $disabled_page = isset($disabled_page) ? $disabled_page : 0;
    //编辑器高度
    $height = $setting['height'];
    if (empty($setting['height'])) {
        $height = 300;
    }
    if (defined('IN_ADMIN') && IN_ADMIN) {
        //是否允许上传
        $allowupload = 1;
        //编辑器类型，简洁型还是标准型
        $toolbar = $setting['toolbar'];
    } else {
        //获取当前登陆会员组id
        $groupid = cookie('groupid');
        if (isModuleInstall('Member')) {
            $Member_group = cache("Member_group");
            //是否允许上传
            $allowupload = $Member_group[$groupid]['allowattachment'] ? 1 : 0;
        } else {
            $allowupload = 0;
        }
        //编辑器类型，简洁型还是标准型
        $toolbar = $setting['mbtoolbar'] ? $setting['mbtoolbar'] : "basic";
    }
    //内容
    /*if (empty($value)) {
        $value = $setting['defaultvalue'] ? $setting['defaultvalue'] : '<p></p>';
    }*/
    if ($setting['minlength'] || $fieldinfo['pattern']) {
        $allow_empty = '';
    }
    //模块
    $module = MODULE_NAME;
    $form = editort($field, $toolbar, $module, $catid, $allowupload, $allowupload, '', 10, $height, $disabled_page);
    //javascript
    $str['formJavascript'] .= "
            //增加编辑器验证规则
            jQuery.validator.addMethod('editor{$field}',function(){
                return " . ($fieldinfo['minlength'] ? "editor{$field}.getContent();" : "true") . "
            });
    ";
    //错误提示
    $errortips = $fields[$field]['errortips'];
    //20130428 由于没有设置必须输入时，ajax提交会造成获取不到编辑器的值。所以这里强制进行验证，使其触发编辑器的sync()方法
    if ($fieldinfo['minlength']){
    //验证规则
    $formValidateRules['info[' . $field . ']'] = array("editor$field" => "true");
    //验证不通过提示
    $formValidateMessages['info[' . $field . ']'] = array("editor$field" => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
    $str['ruls'] = $formValidateRules;
    $str['mess'] = $formValidateMessages;
    }
    //print_r($form);exit;
    $str['str'] = "<div id='{$field}_tip'></div>" . '<script type="text/plain" id="' . $field . '" name="info[' . $field . ']">' . $value . '</script>' . $form;
    return $str;
}
/**
     * 编辑器
     * @param int $textareaid 字段名
     * @param int $toolbar 标准型 full 简洁型 basic
     * @param string $module 模块名称
     * @param int $catid 栏目id
     * @param boole $allowupload  是否允许上传
     * @param boole $allowbrowser 是否允许浏览文件
     * @param string $alowuploadexts 允许上传类型
     * @param string $allowuploadnum 每次允许上传的文件数量
     * @param string $height 编辑器高度
     * @param string $disabled_page 是否禁用分页和子标题
     * 附件上传，要引入这两个JS content_addtop.js swf2ckeditor.js
     * 注意：使用这个，需另外单独增加编辑的实例化代码！
     */
     function editort($textareaid = 'content', $toolbar = 'basic', $module = '', $catid = '', $allowupload = 0, $allowbrowser = 1, $alowuploadexts = '', $allowuploadnum = '10', $height = 200, $disabled_page = 0) {
        $str = "";
        $root_url=__ROOT__.'/public/';
        //加载编辑器所需JS，多编辑器字段防止重复加载
        if (!defined('EDITOR_INIT')) {
            $str .= '
                <script type="text/javascript">
                //编辑器路径定义
                var editorURL = GV.DIMAUB;
                </script>
                <script type="text/javascript"  src="' . $root_url . 'js/ueditor/ueditor.config.js"></script>
                <script type="text/javascript"  src="' . $root_url . 'js/ueditor/ueditor.all.min.js"></script>';
            define('EDITOR_INIT', 1);
        }

        //编辑器类型
        if ($toolbar == 'basic') {//简洁型
            $toolbar = "['FullScreen', 'Source', '|', 'Undo', 'Redo', '|','FontSize','Bold', 'forecolor', 'Italic', 'Underline', 'Link',  '|',  'InsertImage', 
                 'ClearDoc',  'CheckImage','Emotion',  " . ($allowupload && $allowbrowser ? "'attachment'," : "") . " 'PageBreak','insertcode', 'WordImage','RemoveFormat', 'FormatMatch','AutoTypeSet']
                ";
        } elseif ($toolbar == 'full') {//标准型
            $toolbar = "[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', 'zc_clear','|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'directionalityltr', 'directionalityrtl', 'indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
            'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
            'print', 'preview', 'searchreplace', 'help', 'drafts'
        ]";
        }
        $sess_id = time();
       // $isadmin = \Admin\Service\User::getInstance()->id ? 1 : 0;
        if ($isadmin) {
           // $userid = \Admin\Service\User::getInstance()->id;
            $groupid = 0;
        } else {
           // $userid = service('Passport')->userid;
            //$groupid = service('Passport')->groupid ? service('Passport')->groupid : 8;
        }
        $authkey = md5(C("AUTHCODE") . $sess_id . $userid . $isadmin);
        $str .= "\r\n<script type=\"text/javascript\">\r\n";
        $str .= " var editor{$textareaid} = UE.getEditor('{$textareaid}',{  
                            textarea:'" . ( in_array($module, array("Content", "content")) ? "info[$textareaid]" : "$textareaid" ) . "',
                            toolbars:[$toolbar],
                            autoHeightEnabled:false
                      });
                      editor{$textareaid}.ready(function(){
                            editor{$textareaid}.execCommand('serverparam', {
                                  'catid': '{$catid}',
                                  '_https':'" . $root_url . "',
                                  'isadmin':'{$isadmin}',
                                  'module':'{$module}',
                                  'uid':'{$userid}',
                                  'groupid':'{$groupid}',
                                  'sessid':'{$sess_id}',
                                  'authkey':'$authkey',
                                  'allowupload':'{$allowupload}',
                                  'allowbrowser':'{$allowbrowser}',
                                  'alowuploadexts':'{$alowuploadexts}'
                             });
                             editor{$textareaid}.setHeight($height);
                      });
                      ";
        $str .= "\r\n</script>";
        return $str;
    }
