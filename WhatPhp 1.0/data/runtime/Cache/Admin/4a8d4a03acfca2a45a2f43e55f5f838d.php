<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<!-- Set render engine for 360 browser -->
	<meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo L('ADMIN_CENTER');?></title>

    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->

	<link href="/a/public/simpleboot/themes/<?php echo C('SP_ADMIN_STYLE');?>/theme.min.css" rel="stylesheet">
    <link href="/a/public/simpleboot/css/simplebootadmin.css" rel="stylesheet">
    <?php if( ( CONTROLLER_NAME !="Cdata" || (ACTION_NAME !="index" && ACTION_NAME!="department" && ACTION_NAME!="singleManager" && ACTION_NAME!="saleman" && ACTION_NAME!="singleSale" ) ) && CONTROLLER_NAME !="Main" ){ ?>
    <link href="/a/public/js/artDialog/skins/default.css" rel="stylesheet" />
    <?php } ?>
    <link href="/a/public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
    <style>
		.length_3{width: 180px;}
		form .input-order{margin-bottom: 0px;padding:3px;width:40px;}
		.table-actions{margin-top: 10px; margin-bottom: 5px;padding:0px; padding-bottom:30px;}
		.table-list{margin-bottom: 0px;}
	</style>
	<!--[if IE 7]>
	<link rel="stylesheet" href="/a/public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/a/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};

</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/a/public/js/jquery.js"></script>
    <script src="/a/public/js/wind.js"></script>
    <script src="/a/public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<?php if(APP_DEBUG): ?><style>
		#think_page_trace_open{
			z-index:9999;
		}
	</style><?php endif; ?>
</head>
<body>
	<div class="wrap js-check-wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#A" data-toggle="tab"><?php echo L('WEB_SITE_INFOS');?></a></li><!-- 
			<li><a href="#G" data-toggle="tab"><?php echo L('WATERMARK_SETTING');?></a></li> -->
			<li><a href="#B" data-toggle="tab">首页<?php echo L('SEO_SETTING');?></a></li>



			<li><a href="#C" data-toggle="tab"><?php echo L('URL_SETTING');?></a></li>
			<!-- <li><a href="<?php echo U('route/index');?>"><?php echo L('URL_OPTIMIZATION');?></a></li> -->
			<!-- <li><a href="#E" data-toggle="tab"><?php echo L('COMMENT_SETTING');?></a></li>
			<li><a href="#F" data-toggle="tab"><?php echo L("USERNAME_FILTER");?></a></li> -->



		</ul>
		<form class="form-horizontal js-ajax-forms" action="<?php echo U('setting/site_post');?>" method="post">
			<fieldset>
				<div class="tabbable">
					<div class="tab-content">
						<div class="tab-pane active" id="A">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_NAME');?></label>
									<div class="controls">
										<input type="text" name="options[site_name]" value="<?php echo ($site_name); ?>"><span class="form-required">*</span>
										<?php if($option_id): ?>
										<input type="hidden" name="option_id" value="<?php echo ($option_id); ?>">
										<?php endif; ?>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_DOMAIN');?></label>
									<div class="controls">
										<input type="text" name="options[site_host]" value="<?php echo ($site_host); ?>"><span class="form-required">*</span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_THEME');?></label>
									<div class="controls">
										<select name="options[site_tpl]">
											<?php if(is_array($templates)): foreach($templates as $key=>$vo): if(strrchr($vo,'_') === false): $tpl_selected=$site_tpl==$vo?"selected":""; ?>
												<option value="<?php echo ($vo); ?>" <?php echo ($tpl_selected); ?>><?php echo ($vo); ?></option><?php endif; endforeach; endif; ?>
										</select>
									</div>
								</div>
								<input type="hidden" name="options[site_adminstyle]" value="flat">
								<!-- <div class="control-group">
									<label class="control-label"><?php echo L('HTML_CACHE');?>：</label>
									<div class="controls">
										<?php $html_cache_on_checked=empty($html_cache_on)?'':'checked'; ?>
										<label class="checkbox inline"><input type="checkbox" name="options[html_cache_on]" value="1" <?php echo ($html_cache_on_checked); ?>></label>
									</div>
								</div> -->
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_ICP');?></label>
									<div class="controls">
										<input type="text" name="options[site_icp]" value="<?php echo ($site_icp); ?>">
									</div>
								</div>
<!-- 								<div class="control-group">
									<label class="control-label"><?php echo L('WEBMASTER_EMAIL');?></label>
									<div class="controls">
										<input type="text" name="options[site_admin_email]" value="<?php echo ($site_admin_email); ?>">
										<span class="text-tip"><i>用于询盘提醒邮箱，平台自动发布邮箱，多个邮箱之间用英文逗号隔开</i></span>
									</div>

								</div> -->
								<div class="control-group">
									<label class="control-label">站长姓名</label>
									<div class="controls">
										<input type="text" name="options[site_zhanzhang_name]" value="<?php echo ($site_zhanzhang_name); ?>">
									</div>
								</div>
								<!-- 上传文件大小设置 -->
	<!-- 							<div class="control-group">
									<label class="control-label">上传附件大小设置</label>
									<div class="controls">
										<input type="text" name="options[uploadfilesize]" value="<?php echo ($uploadfilesize); ?>">
										<span class="text-tip"><i>KB,如果不设置默认是：2048KB</i></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">上传图片大小设置</label>
									<div class="controls">
										<input type="text" name="options[uploadimgsize]" value="<?php echo ($uploadimgsize); ?>">
										<span class="text-tip"><i>KB,如果不设置默认是：2048KB</i></span>
									</div>
								</div> -->
								<!-- <div class="control-group">
									<label class="control-label">上传视频大小设置</label>
									<div class="controls">
										<input type="text" name="options[uploadvideosize]" value="<?php echo ($uploadvideosize); ?>">KB,
										如果不设置默认是：2048KB
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">上传PDF大小设置</label>
									<div class="controls">
										<input type="text" name="options[uploadpdfsize]" value="<?php echo ($uploadpdfsize); ?>">KB,
										如果不设置默认是：2048KB
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">上传压缩包大小设置</label>
									<div class="controls">
										<input type="text" name="options[uploadpacksize]" value="<?php echo ($uploadpacksize); ?>">KB,
										如果不设置默认是：2048KB
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">上传其它大小设置</label>
									<div class="controls">
										<input type="text" name="options[uploadotherize]" value="<?php echo ($uploadotherize); ?>">KB,
										如果不设置默认是：2048KB
									</div>
								</div>
								 -->
                                 <div class="control-group">
									<label class="control-label">公司地图</label>
									<div class="controls">
										<textarea name="options[site_ditu]" rows="5" cols="57"><?php echo ($site_ditu); ?></textarea>
									</div>
								</div>
                                
                                
                                
								<div class="control-group">
									<label class="control-label"><?php echo L("WEBSITE_STATISTICAL_CODE");?></label>
									<div class="controls">
										<textarea name="options[site_tongji]" rows="5" cols="57"><?php echo ($site_tongji); ?></textarea>
									</div>
								</div>
	<!-- 							<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_COPYRIGHT_INFOMATION');?></label>
									<div class="controls">
										<textarea name="options[site_copyright]" rows="5" cols="57"><?php echo ($site_copyright); ?></textarea>
									</div>
								</div> -->
								<div class="control-group">
									<label class="control-label">一级栏目title默认</label>
									<div class="controls">
										<textarea name='options[list_title_h]' placeholder="manufacturer & supplier in china" ><?php echo ($list_title_h); ?></textarea>
										<span class="text-tip"><i>不超过60个字符。例：***,***,***,manufacturer & supplier in china</i></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">详情页description默认</label>
									<div class="controls">
										<textarea name="options[list_desc_z]" placeholder="manufacturer & supplier in china" ><?php echo ($list_desc_z); ?></textarea>
										<span class="text-tip"><i>不超过200个字符。例：***,Manufacturer China in many factory,***,***</i></span>
									</div>
								</div>
								<?php if($is_robots): ?><div class="control-group">
									<label class="control-label">Robots</label>
									<div class="controls">
										<a href="<?php echo U('setting/del_robots');?>">删除Robots文件</a>
									</div>
								</div><?php endif; ?>
								
							</fieldset>
						</div>
						<div class="tab-pane" id="B">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_SEO_TITLE');?></label>
									<div class="controls">
										<textarea name="options[site_seo_title]"><?php echo ($site_seo_title); ?></textarea>
										 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_SEO_KEYWORDS');?></label>
									<div class="controls">
										<textarea name="options[site_seo_keywords]" ><?php echo ($site_seo_keywords); ?></textarea>
										 
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WEBSITE_SEO_DESCRIPTION');?></label>
									<div class="controls">
									
										<textarea name="options[site_seo_description]" rows="5" cols="57"><?php echo ($site_seo_description); ?></textarea>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="C">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><?php echo L('URL_MODE');?></label>
									<div class="controls">
										<?php $urlmodes=array( "0"=>L('URL_NORMAL_MODE'), "1"=>L('URL_PATHINFO_MODE'), "2"=>L('URL_REWRITE_MODE')); ?>
										<select name="options[urlmode]">
											<?php if(is_array($urlmodes)): foreach($urlmodes as $key=>$vo): $urlmode_selected=$key==$urlmode?"selected":""; ?>
											<option value="<?php echo ($key); ?>" <?php echo ($urlmode_selected); ?>><?php echo ($vo); ?></option><?php endforeach; endif; ?>
										</select>
										<span class="form-required">* <?php echo L('URL_MODE_HELP_TEXT');?></span>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('URL_REWRITE_SUFFIX');?></label>
									<div class="controls">
										<input type="text" name="options[html_suffix]" value="<?php echo ($html_suffix); ?>">
										<span class="form-required"><?php echo L('URL_REWRITE_SUFFIX_HELP_TEXT');?></span>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="E">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><?php echo L('COMMENT_CHECK');?></label>
									<div class="controls">
										<?php $comment_need_checked=empty($comment_need_check)?"":"checked"; ?>
										<input type="checkbox" class="js-check" name="options[comment_need_check]" value="1" <?php echo ($comment_need_checked); ?>>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('COMMENT_TIME_INTERVAL');?></label>
									<div class="controls">
										<input type="number" name="options[comment_time_interval]" value="<?php echo ((isset($comment_time_interval) && ($comment_time_interval !== ""))?($comment_time_interval):60); ?>" style="width:40px;"><?php echo L('SECONDS');?>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="F">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><?php echo L('SPECAIL_USERNAME');?></label>
									<div class="controls">
										<textarea name="cmf_settings[banned_usernames]" rows="5" cols="57"><?php echo ($cmf_settings["banned_usernames"]); ?></textarea>
									</div>
								</div>
							</fieldset>
						</div>
						<div class="tab-pane" id="G">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><?php echo L('WATERMARK_ENABLE');?></label>
									<div class="controls">
										<label><input name="options[ftppasv]" type="radio" value="1" <?php if($ftppasv == 1): ?>checked=""<?php endif; ?>>打开</label>
										<label><input name="options[ftppasv]" type="radio" value="0" <?php if($ftppasv == 0): ?>checked=""<?php endif; ?>>关闭</label>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WATERMARK_IMG');?></label>
								<div class="controls">
									<?php $smeta = json_decode($smeta,true); $uploadfilesizexx = $uploadimgsize?$uploadimgsize:2048;?>
									<input type="hidden" name="smeta[thumb]" id="thumb" value="<?php echo ($smeta['thumb']); ?>">
									<a href="javascript:void(0);" onClick="flashupload('thumb_images', '附件上传','thumb',thumb_images,'1,jpg|jpeg|gif|png|bmp,<?php echo ($uploadfilesizexx); ?>,,,1','','','',1);return false;">
										<?php if($smeta['thumb']): ?><img src="<?php echo ($smeta['thumb']); ?>" id="thumb_preview" width="135" style="cursor: hand">
									    <?php else: ?>
									    	<img src="/a/admin/themes/simplebootx/Public/assets/images/default-thumbnail.png" id="thumb_preview" width="135" style="cursor: hand"><?php endif; ?>
									</a>
									<?php if($smeta['thumb']): ?><input type="button" class="btn btn-small" id="thumb_del" onClick="$('#thumb_preview').attr('src','/admin/themes/simplebootx/Public/assets/images/default-thumbnail.png');$('#thumb').val('');$('#thumb_del').val('上传');return false;" value="删除图片">
									<?php else: ?>
										<input type="button" class="btn btn-small" id="thumb_del"  onclick="$('#thumb_preview').attr('src','/admin/themes/simplebootx/Public/assets/images/default-thumbnail.png');$('#thumb').val('');$('#thumb_del').val('上传');return false;" value="上传"><?php endif; ?>
								</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WATERMARK_PCT');?></label>
									<div class="controls">
										<input type="text" name="options[site_water_qxd]" value="<?php echo ($site_water_qxd); ?>">&nbsp;(1-100)
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><?php echo L('WATERMARK_LOCATION');?></label>
									<?php $sww = array( '1' => '左上', '4' => '左中', '7' => '左下', '2' => '中上', '5' => '中心', '8' => '中下', '3' => '右上', '6' => '右中', '9' => '右下' ); ?>
									<div class="controls">
										<select name="options[site_water_weiz]" id="">
											<?php if(is_array($sww)): foreach($sww as $key=>$v): ?><option value="<?php echo ($key); ?>" <?php if($key == $site_water_weiz): ?>selected<?php endif; ?>><?php echo ($v); ?></option><?php endforeach; endif; ?>
										</select>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label">选择栏目</label>
									<div class="controls">
									<?php $arrcatids = explode(',', $catids); ?>
										<table>
											<tr>
												<?php if(is_array($categorys)): $i = 0; $__LIST__ = $categorys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if(in_array($vo['catid'],$arrcatids)){ $checked = 'checked'; }else{ $checked = ''; } ?>
													<td><input type="checkbox" name="catids[]" value="<?php echo ($vo["catid"]); ?>" <?php echo ($checked); ?>><?php echo ($vo["catname"]); ?></input>&nbsp;</td>
													<?php if($key%8 == 0 && $key != 0): ?></tr><tr><?php endif; endforeach; endif; else: echo "" ;endif; ?>
											</tr>
										</table>
									</div>
								</div>


							</fieldset>
						</div>
					</div>
				</div>



	<script type="text/javascript" src="/a/public/js/content_addtop.js"></script>

				<div class="form-actions">
					<button type="submit" class="btn btn-primary  js-ajax-submit"><?php echo L("SAVE");?></button>
				</div>

			</fieldset>
		</form>

	</div>
	<script type="text/javascript" src="/a/public/js/common.js"></script>
	<script>

		/////---------------------
		$(function(){
			$("#urlmode-select").change(function(){
				if($(this).val()==1){
					alert("更改后，若发现前台链接不能正常访问，可能是您的服务器不支持PATHINFO，请先修改data/conf/config.php文件的URL_MODEL为0保证网站正常运行,在配置服务器PATHINFO功能后再更新为PATHINFO模式！");
				}
				
				if($(this).val()==2){
					alert("更改后，若发现前台链接不能正常访问，可能是您的服务器不支持REWRITE，请先修改data/conf/config.php文件的URL_MODEL为0保证网站正常运行，在开启服务器REWRITE功能后再更新为REWRITE模式！");
				}
			});
			$("#js-site-admin-url-password").change(function(){
				$(this).data("changed",true);
			});
		});
		Wind.use('validate', 'ajaxForm', 'artDialog', function() {
			//javascript
			var form = $('form.js-ajax-forms');
			//ie处理placeholder提交问题
			if ($.browser.msie) {
				form.find('[placeholder]').each(function() {
					var input = $(this);
					if (input.val() == input.attr('placeholder')) {
						input.val('');
					}
				});
			}
			//表单验证开始
			form.validate({
				//是否在获取焦点时验证
				onfocusout : false,
				//是否在敲击键盘时验证
				onkeyup : false,
				//当鼠标掉级时验证
				onclick : false,
				//验证错误
				showErrors : function(errorMap, errorArr) {
					//errorMap {'name':'错误信息'}
					//errorArr [{'message':'错误信息',element:({})}]
					try {
						$(errorArr[0].element).focus();
						art.dialog({
							id : 'error',
							icon : 'error',
							lock : true,
							fixed : true,
							background : "#CCCCCC",
							opacity : 0,
							content : errorArr[0].message,
							cancelVal : "<?php echo L('OK');?>",
							cancel : function() {
								$(errorArr[0].element).focus();
							}
						});
					} catch (err) {
					}
				},
				//验证规则
				rules : {
					'options[site_name]' : {
						required : 1
					},
					'options[site_host]' : {
						required : 1
					},
					'options[site_root]' : {
						required : 1
					},
					'options[list_title_h]' :{
						maxlength:60
					},
					'options[list_desc_z]' :{
						maxlength:200
					}
					
				},
				//验证未通过提示消息
				messages : {
					'options[site_name]' : {
						required : "<?php echo L('WEBSITE_SITE_NAME_REQUIRED_MESSAGE');?>"
					},
					'options[site_host]' : {
						required : "<?php echo L('WEBSITE_SITE_HOST_REQUIRED_MESSAGE');?>"
					},
					'options[list_title_h]' : {
						maxlength : "<?php echo L('WEBSITE_SITE_TITLE_MESSAGE');?>"
					},
					'options[list_desc_z]' :{
						maxlength : "<?php echo L('WEBSITE_SITE_DESCRIPTION_MESSAGE');?>"
					}
					
				},
				//给未通过验证的元素加效果,闪烁等
				highlight : false,
				//是否在获取焦点时验证
				onfocusout : false,
				//验证通过，提交表单
				submitHandler : function(forms) {
					$(forms).ajaxSubmit({
						url : form.attr('action'), //按钮上是否自定义提交地址(多按钮情况)
						dataType : 'json',
						beforeSubmit : function(arr, $form, options) {

						},
						success : function(data, statusText, xhr, $form) {
							if (data.status) {
								setCookie("refersh_time", 1);
								var admin_url_changed=$("#js-site-admin-url-password").data("changed");
								var message =admin_url_changed?data.info+'<br><span style="color:red;">后台地址已更新(请劳记！)</span>':data.info;
								
								//添加成功
								Wind.use("artDialog", function() {
									art.dialog({
										id : "succeed",
										icon : "succeed",
										fixed : true,
										lock : true,
										background : "#CCCCCC",
										opacity : 0,
										content : message,
										button : [ {
											name : "<?php echo L('OK');?>",
											callback : function() {
												reloadPage(window);
												return true;
											},
											focus : true
										}, {
											name : "<?php echo L('CLOSE');?>",
											callback : function() {
												reloadPage(window);
												return true;
											}
										} ]
									});
								});
							} else {
								alert(data.info);
							}
						}
					});
				}
			});
		});
		////-------------------------
	</script>
</body>
</html>