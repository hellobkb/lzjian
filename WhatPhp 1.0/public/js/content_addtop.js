
//弹出对话框
function omnipotent(id, linkurl, title, close_type, w, h) {
    if (!w) w = 700;
    if (!h) h = 500;
    Wind.use("artDialog","iframeTools",function(){
        art.dialog.open(linkurl, {
        id: id,
        title: title,
        width: w,
        height: h,
        lock: true,
        fixed: true,
        background:"#CCCCCC",
        opacity:0,
        button: [{
            name: '确定',
            callback: function () {
                if (close_type == 1) {
                    return true;
                } else {
                    var d = this.iframe.contentWindow;
                    var form = d.document.getElementById('dosubmit');
                    form.click();
                }
                return false;
           },
           focus: true
        }]
    });
    });
    
}

/**
swf上传完回调方法
uploadid dialog id
name dialog名称
textareaid 最后数据返回插入的容器id
funcName 回调函数
args 参数
module 所属模块
catid 栏目id
authkey 参数密钥，验证args
**/
function flashupload(uploadid, name, textareaid, funcName, args, module, catid, authkey,is_warter=0) {
    var args = args ? '&args=' + args : '';
    var setting = '&module=' + module + '&catid=' + catid ;
    var is_warter = is_warter ? '&is_warter=' + is_warter : '';
    Wind.use("artDialog","iframeTools",function(){
        art.dialog.open(GV.DIMAUB+'index.php?a=swfupload&m=asset&g=asset' + args + is_warter + setting, {
        title: name,
        id: uploadid,
        width: '650px',
        height: '420px',
        lock: true,
        fixed: true,
        background:"#CCCCCC",
        opacity:0,
        ok: function() {
            if (funcName) {
                funcName.apply(this, [this, textareaid]);
            } else {
                submit_ckeditor(this, textareaid);
            }
        },
        cancel: true
    });
    });
}
function flashupload1(uploadid, name, textareaid, funcName, args, module, catid, authkey) {
    
    
    var args = args ? '&args=' + args : '';
    var setting = '&module=' + module + '&catid=' + catid ;
    Wind.use("artDialog","iframeTools",function(){
        art.dialog.open(GV.DIMAUB+'index.php?a=swfupload1&m=Asset&g=Asset' + args + setting, {
        title: name,
        id: uploadid,
        width: '650px',
        height: '420px',
        lock: true,
        fixed: true,
        background:"#CCCCCC",
        opacity:0,
        ok: function() {
             
            if (funcName) {
                 
                funcName.apply(this, [this, textareaid]);

            } else {
                 
                submit_ckeditor(this, textareaid);
            }
        },
        cancel: true
    });
    });
}


//单文件上传回调
function submit_attachment(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_content = in_content.split('|');
    $('#' + returnid).attr("value", in_content[0]);
}
//多图上传，SWF回调函数
function change_images(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = $('#' + returnid).html();
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    $.each(contents, function(i, n) {
        var ids = parseInt(Math.random() * 10000 + 10 * i);
        var filename = filenames[i].substr(0, filenames[i].indexOf('.'));
        str += "<li id='image" + ids + "'>"+
                "<input title='双击查看' type='text' name='" + returnid + "_url[]' value='" + n + "' style='width:310px;' ondblclick='crop_cut_thumb(this.value);' class='input image-url-input' id='thumb_" + n + "'>"+ 
                "<input id='thumb_preview_" + n + "' type='text' name='" + returnid + "_alt[]' value='' style='width:160px;' class='input image-alt-input' onfocus=\"if(this.value == this.defaultValue) this.value = ''\" onblur=\"if(this.value.replace(' ','') == '') this.value = this.defaultValue;\">"+ 
                "<input type='text' name='" + returnid + "_seq[]' value='" + i + "' style='width:100px;' class='input image-url-input'>"+ 
                "<a href=\"javascript:flashupload('replace_albums_images', '图片替换','image"+ids+"',replace_image,'10,gif|jpg|jpeg|png|bmp,0','','','')\">替换</a>"+  
                "&nbsp;&nbsp;<a href=\"javascript:remove_div('image" + ids + "')\">移除</a> </li>";
    });

    $('#' + returnid).html(str);
}
function change_images1(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = $('#' + returnid).html();
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    /*$.each(contents, function(i, n) {
        var ids = parseInt(Math.random() * 10000 + 10 * i);
        var filename = filenames[i].substr(0, filenames[i].indexOf('.'));
        str += "<li id='image" + ids + "'>"+
                "<input title='双击查看' type='text' name='" + returnid + "_url[]' value='" + n + "' style='width:310px;' ondblclick='image_priview(this.value);' class='input image-url-input' id='thumb_" + n + "'>"+ 
                "<input id='thumb_preview_" + n + "' type='text' name='" + returnid + "_alt[]' value='" + filename + "' style='width:160px;' class='input image-alt-input' onfocus=\"if(this.value == this.defaultValue) this.value = ''\" onblur=\"if(this.value.replace(' ','') == '') this.value = this.defaultValue;\">"+ 
                "<input type='text' name='" + returnid + "_href[]' value='' style='width:100px;' class='input image-url-input'>"+
                "<a href=\"javascript:flashupload('replace_albums_images', '图片替换','image"+ids+"',replace_image,'10,gif|jpg|jpeg|png|bmp,0','','','')\">替换</a>"+  
                "&nbsp;&nbsp;<a href=\"javascript:remove_div('image" + ids + "')\">移除</a> </li>";
    });*/
    alert('上传成功!');

    //$('#' + returnid).html(str);
}
function change_images2(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = $('#' + returnid).html();
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    $.each(contents, function(i, n) {
        var ids = parseInt(Math.random() * 10000 + 10 * i);
        var filename = filenames[i].substr(0, filenames[i].indexOf('.'));
        str += "<li id='image" + ids + "'>"+
                "<input title='双击查看' type='text' name='" + returnid + "_url[]' value='" + n + "' style='width:310px;' ondblclick='image_priview(this.value);' class='input image-url-input' id='thumb_" + n + "'>"+ 
                "<input id='thumb_preview_" + n + "' type='text' name='" + returnid + "_alt[]' value='" + filename + "' style='width:160px;' class='input image-alt-input' onfocus=\"if(this.value == this.defaultValue) this.value = ''\" onblur=\"if(this.value.replace(' ','') == '') this.value = this.defaultValue;\">"+ 
                "<input type='text' name='" + returnid + "_href[]' value='' style='width:100px;' class='input image-url-input'>"+
                "<input type='text' name='" + returnid + "_sort[]' value='' style='width:100px;' class='input image-url-input'>"+
                "<a href=\"javascript:flashupload('replace_albums_images', '图片替换','image"+ids+"',replace_image,'10,gif|jpg|jpeg|png|bmp,0','','','')\">替换</a>"+  
                "&nbsp;&nbsp;<a href=\"javascript:remove_div('image" + ids + "')\">移除</a> </li>";
    });
   
    $('#' + returnid).html(str);
}
function replace_image(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = $('#' + returnid).html();
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    
    $("#"+returnid).find(".image-url-input").val(contents[0]);
    var filename = filenames[0].substr(0, filenames[0].indexOf('.'));
    $("#"+returnid).find(".image-alt-input").val(filename);
}

//多图上传，SWF回调函数
function upload_zip(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = $('#' + returnid).html();
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    $.each(contents, function(i, n) {
        var ids = parseInt(Math.random() * 10000 + 10 * i);
        var filename = filenames[i].substr(0, filenames[i].indexOf('.'));
        str += "<li id='image" + ids + "'>" +
        		"<input title='双击查看' type='text' name='" + returnid + "_url' value='" + n + "' style='width:310px;' ondblclick='image_priview(this.value);' class='input'> <input type='text' name='" + returnid + "_alt[]' value='" + filename + "' style='width:160px;' class='input' onfocus=\"if(this.value == this.defaultValue) this.value = ''\" onblur=\"if(this.value.replace(' ','') == '') this.value = this.defaultValue;\"> " +
        		"<a href=\"javascript:remove_div('image" + ids + "')\">移除</a> </li>";
    });

    $('#' + returnid).html(str);
}

//编辑器ue附件上传
function ueAttachment(uploadid, returnid){
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    if (in_content == ''){
        return false;
    }
    in_content = in_content.split("|");
    var i;
    var in_filename = d.$("#att-name").html().substring(1);
    var filenames = in_filename.split('|');

    eval("var ue = editor"+ returnid);
    
    for(i=0; i<in_content.length; i++){
        ue.execCommand('inserthtml', '<a href="'+in_content[i]+'" target="_blank">附件：'+filenames[i]+'</a>');
    }
    
}

//多文件上传回调
function change_multifile(uploadid, returnid) {
	 
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = '';
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    
    //判断是否超出个数限制
     
    $.each(contents, function(i, n) {
        var ids = parseInt(Math.random() * 10000 + 10 * i);
        var filename = filenames[i].substr(0, filenames[i].indexOf('.'));
        str += "<li id='multifile" + ids + "'>" +
        		"<input type='text' name='" + returnid + "_fileurl[]' value='" + n + "' style='width:310px;' class='input'> " +
        		"<select name='filetype[]'><option value='0'>请选择</option><option value='1'>报价</option><option value='2'>合同</option><option value='3'>图片</option><option value='4'>产品图纸</option><option value='5'>包装</option><option value='6'>其他文件</option></select>" +
        		"<a href=\"javascript:remove_div('multifile" + ids + "')\">移除</a> </li>";
    });
    $('#' + returnid).append(str);
    
}

//缩图上传回调
function thumb_images(uploadid, returnid) {
    //取得iframe对象
    var d = uploadid.iframe.contentWindow;
    //取得选择的图片
    var in_content = d.$("#att-status").html().substring(1);
    if (in_content == '') return false;
    if (!IsImg(in_content)) {
        isalert('选择的类型必须为图片类型！');
        return false;
    }

    if ($('#' + returnid + '_preview').attr('src')) {
        $('#' + returnid + '_preview').attr('src', in_content);
        $('#'+returnid+'_del').val('删除图片');

    }
    $('#' + returnid).val(in_content);
    $('#'+returnid+'_del').val('删除图片');

   
}

function change_onefile(uploadid, returnid){
	var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_filename = d.$("#att-name").html().substring(1);
    var str = '';
    var contents = in_content.split('|');
    var filenames = in_filename.split('|');
    $('#' + returnid + '_tips').css('display', 'none');
    if (contents == '') return true;
    $('#' + returnid).val(contents[0]);
}

//提示框 alert
function isalert(content,icon){
    if(content == ''){
        return;
    }
    icon = icon|| "error";
    Wind.use("artDialog",function(){
        art.dialog({
            id:icon,
            icon: icon,
            fixed: true,
            lock: true,
            background:"#CCCCCC",
            opacity:0,
            content: content,
            cancelVal: '确定',
            cancel: true
        });
    });
}

//图片使用dialog查看
function image_priview(img) {
    if(img == ''){
        return;
    }
    if (!IsImg(img)) {
        isalert('选择的类型必须为图片类型！');
        return false;
    }
    Wind.use("artDialog",function(){
        art.dialog({
            title: '图片查看',
            fixed: true,
            width:"600px",
            height: '420px',
            id:"image_priview",
            lock: true,
            background:"#CCCCCC",
            opacity:0,
            content: '<img src="' + img + '" />',
            time: 5
        });
    });
}

function crop_cut_thumb(id){
    if ( id =='' || id == undefined ) { 
                      isalert('请先上传缩略图！');
                      return false;
                    }
                    var catid = $('input[name="info[catid]"]').val();
                    if(catid == '' ){
                        isalert('请选择栏目ID！');
                        return false;
                    }
                    Wind.use('artDialog','iframeTools',function(){
                      art.dialog.open(GV.DIMAUB+'index.php?a=public_imagescrop&m=contentshow&g=content&catid='+catid+'&picurl='+encodeURIComponent(id)+'&input=thumb_'+encodeURIComponent(id)+'&preview=thumb_preview_'+encodeURIComponent(id), {
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

//添加/修改文章时，标题加粗
function input_font_bold() {
    if ($('#title').css('font-weight') == '700' || $('#title').css('font-weight') == 'bold') {
        $('#title').css('font-weight', 'normal');
        $('#style_font_weight').val('');
    } else {
        $('#title').css('font-weight', 'bold');
        $('#style_font_weight').val('bold');
    }
}


//图片上传回调
function submit_images(uploadid, returnid) {
    var d = uploadid.iframe.contentWindow;
    var in_content = d.$("#att-status").html().substring(1);
    var in_content = in_content.split('|');
    IsImg(in_content[0]) ? $('#' + returnid).attr("value", in_content[0]) : alert('选择的类型必须为图片类型');
}

//移除ID
function remove_id(id) {
    $('#' + id).remove();
}

//输入长度提示
function strlen_verify(obj, checklen, maxlen) {
    var v = obj.value,
        charlen = 0,
        maxlen = !maxlen ? 200 : maxlen,
        curlen = maxlen,
        len = strlen(v);
    var charset = 'utf-8';
    for (var i = 0; i < v.length; i++) {
        if (v.charCodeAt(i) < 0 || v.charCodeAt(i) > 255) {
            curlen -= charset == 'utf-8' ? 2 : 1;
        }
    }
    if (curlen >= len) {
        $('#' + checklen).html(curlen - len);
    } else {
        obj.value = mb_cutstr(v, maxlen, true);
    }
}

//长度统计
function strlen(str) {
    return ($.browser.msie && str.indexOf('\n') != -1) ? str.replace(/\r?\n/g, '_').length : str.length;
}
function mb_cutstr(str, maxlen, dot) {
    var len = 0;
    var ret = '';
    var dot = !dot ? '...' : '';

    var charset = 'utf-8';
    maxlen = maxlen - dot.length;
    for (var i = 0; i < str.length; i++) {
        len += str.charCodeAt(i) < 0 || str.charCodeAt(i) > 255 ? (charset == 'utf-8' ? 3 : 2) : 1;
        if (len > maxlen) {
            ret += dot;
            break;
        }
        ret += str.substr(i, 1);
    }
    return ret;
}

//移除指定id内容
function remove_div(id) {
    $('#' + id).remove();
}

//转向地址
function ruselinkurl() {
    if ($('#islink').is(':checked') == true) {
        $('#linkurl').attr('disabled', null);
        return false;
    } else {
        $('#linkurl').attr('disabled', 'true');
    }
}

//验证地址是否为图片
function IsImg(url) {
    var sTemp;
    var b = false;
    var opt = "jpg|gif|png|bmp|jpeg|zip";
    var s = opt.toUpperCase().split("|");
    for (var i = 0; i < s.length; i++) {
        sTemp = url.substr(url.length - s[i].length - 1);
        sTemp = sTemp.toUpperCase();
        s[i] = "." + s[i];
        if (s[i] == sTemp) {
            b = true;
            break;
        }
    }
    return b;
}

//验证地址是否为Flash
function IsSwf(url) {
    var sTemp;
    var b = false;
    var opt = "swf";
    var s = opt.toUpperCase().split("|");
    for (var i = 0; i < s.length; i++) {
        sTemp = url.substr(url.length - s[i].length - 1);
        sTemp = sTemp.toUpperCase();
        s[i] = "." + s[i];
        if (s[i] == sTemp) {
            b = true;
            break;
        }
    }
    return b;
}

//添加地址
function add_multifile(returnid) {
    var ids = parseInt(Math.random() * 10000);
    var str = "<li id='multifile" + ids + "'><input type='text' name='" + returnid + "_fileurl[]' value='' style='width:310px;' class='input'> <input type='text' name='" + returnid + "_filename[]' value='附件说明' style='width:160px;' class='input'> <a href=\"javascript:remove_div('multifile" + ids + "')\">移除</a> </li>";
    $('#' + returnid).append(str);
}
