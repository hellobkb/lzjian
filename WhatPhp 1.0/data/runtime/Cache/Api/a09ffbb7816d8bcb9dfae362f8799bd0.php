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

	<div class="wrap">

		<ul class="nav nav-tabs">

			<li class="active"><a href="<?php echo U('guestbookadmin/index');?>"><?php echo L('API_GUESTBOOKADMIN_INDEX');?></a></li>

		</ul>

		<form class="well form-search" method="post" action="<?php echo U('guestbookadmin/index');?>">

			时间：

			<input type="text" name="start_time" class="js-date-now" value="<?php echo ((isset($post["start_time"]) && ($post["start_time"] !== ""))?($post["start_time"]):''); ?>" style="width: 80px;" autocomplete="off">-

			<input type="text" class="js-date-now" name="end_time" value="<?php echo ($post["end_time"]); ?>" style="width: 80px;" autocomplete="off"> &nbsp; &nbsp;

			<select class="select_2" name="type" style="width:98px;">

	          <option value='0' <?php if( $post['type'] == '0' ): ?>selected<?php endif; ?>>请选择</option>

	          <option value='1' <?php if( $post['type'] == '1' ): ?>selected<?php endif; ?>>姓名</option>

	          <option value='2' <?php if( $post['type'] == '2' ): ?>selected<?php endif; ?>>邮箱</option>

	          <!-- <option value='3' <?php if( $post['type'] == '3' ): ?>selected<?php endif; ?>>公司</option> -->

	        </select>

			关键字：

			<input type="text" name="keyword" style="width:200px;" value="<?php echo ($post["keyword"]); ?>" placeholder="请输入关键字...">

			<input type="hidden" name="catid" value="<?php echo ($catid); ?>">

			国家：

			<select class="select_2" name="from_country" style="width:162px;">

	          <option value='' <?php if( $post['from_country'] == ' ' ): ?>selected<?php endif; ?>>请选择</option>

	          <?php if(is_array($from_country)): foreach($from_country as $key=>$v): if($v != ''): ?><option value='<?php echo ($v); ?>' <?php if( $v == $post['from_country'] ): ?>selected<?php endif; ?>><?php echo ($v); ?></option><?php endif; endforeach; endif; ?>

	        </select>

	      <!--  业务员：

			<select class="select_2" name="salesman" style="width:162px;">

	          <option value='0' <?php if( $post['salesman'] == '0' ): ?>selected<?php endif; ?>>请选择</option>

	          <?php if(is_array($yw_data)): foreach($yw_data as $key=>$vo): if($vo['ywid'] != '0'): ?><option value='<?php echo ($vo["ywid"]); ?>' <?php if( $vo['ywid'] == $post['salesman'] ): ?>selected<?php endif; ?>><?php echo ($vo["name"]); ?>（<?php echo ($vo["nicename"]); ?>）</option><?php endif; endforeach; endif; ?>

	        </select>-->

<!--

	    询盘位置：

	    	<select class="select_2" name="ltype">

	    		<option value="0">请选择</option>

	    		 <?php if(is_array($group)): foreach($group as $key=>$gv): ?><option value="<?php echo ($gv["id"]); ?>" <?php if($post['ltype'] == $gv['id']): ?>selected<?php endif; ?>  ><?php echo ($gv["name"]); ?></option><?php endforeach; endif; ?>

	    	</select>

-->

			<input type="submit" class="btn btn-primary" value="搜索" />

		</form>

		<?php $xplx = array('联系我们','底部','首页','侧栏'); ?>

		<form method="post" class="js-ajax-form js-check-wrap">

		<a href="<?php echo U('guestbookadmin/excel',array('where'=>$where));?>" class="btn">导出excel</a>

		<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('guestbookadmin/deleteall',array('uncheck'=>1));?>" data-subcheck="true">批量删除</button>

		<!--<span class="btn" onClick="zccheck()">批量分配</span>-->

			<table class="table table-hover table-bordered">

				<thead>

					<tr>

						<th width="80">

							<label><input type="checkbox" class="js-check-all" data-direction="x" data-checklist="js-check-x">全部</label>

						</th>

						<!--<th width="300">公司</th>-->

						<th width="100">联系人</th>

						<th width="100">邮箱</th>

						<th width="150">国家（客户填写）</th>

						<th width="300">询盘类型</th>

						<th width="100">发送时间</th>

					<!--	<th width="100">业务归属</th>-->

						<th width="100">操作</th>

					</tr>

				</thead>

				<tbody>

					<?php if(is_array($guestmsgs)): foreach($guestmsgs as $key=>$vo): ?><tr <?php if($vo['read'] == 0): ?>style="font-weight:bold;"<?php endif; ?>>

						<td>

							<input type="checkbox" class="js-check" data-yid="js-check-y" data-xid="js-check-x" name="ids[]" value="<?php echo ($vo["id"]); ?>">

						</td>

						<!--<td><?php echo ($vo["company_name"]); ?></td>-->

						<td><?php echo ($vo["full_name"]); ?></td>

						<td><?php echo ($vo["email"]); ?></td>

						<td><?php echo ($vo["from_country"]); ?></td>

						<td><?php echo ($xplx[$vo[type]]); ?></td>

						<td><?php echo ($vo["createtime"]); ?></td>

						<!--<?php if($vo['user_login']): ?><td><?php echo ($vo["user_login"]); ?>（<?php echo ($vo["user_nicename"]); ?>）</td>

						<?php else: ?>

<?php if(!empty($vo['company_name']) && !empty($vo['email'])){ $zccount = M('Client')->field('id')->where('cname="'.$vo['company_name'].'" or email="'.$vo['email'].'"')->find(); $url = U('Crm/Cindex/editClient',array('id'=>$zccount['id'],'status'=>2)); }else{ $zccount = ''; } ?>

<?php if($zccount): ?>

<td><span style="color:red">未分配<a href="javascript:open_iframe_dialog('<?php echo ($url); ?>','存在客户详情')">（客户信息已经存在）</a></span></td>

<?php else: ?>

							<td><span style="color:red">未分配</span></td>

<?php endif; endif; ?>-->

						<td>

<!--

javascript:open_iframe_dialog('<?php echo U('guestbookadmin/distribution',array('id'=>$vo['id']));?>','分配：<?php echo ($vo["company_name"]); ?>')

-->

							<a href="<?php echo U('guestbookadmin/delete',array('id'=>$vo['id']));?>" class="js-ajax-delete"><?php echo L('DELETE');?></a>

							<?php if($vo['user_login']): ?><a href="javascript:open_iframe_dialog('<?php echo U('guestbookadmin/see',array('id'=>$vo['id']));?>','详情：<?php echo ($vo["company_name"]); ?>')">详情</a>

							<?php else: ?>

							<a href="<?php echo U('guestbookadmin/distribution',array('id'=>$vo['id']));?>">详情</a>

							<!-- <a href="javascript:open_iframe_dialog('<?php echo U('guestbookadmin/distribution',array('id'=>$vo['id']));?>','分配：<?php echo ($vo["company_name"]); ?>')">分配</a> --><?php endif; ?>

						</td>

					</tr><?php endforeach; endif; ?>

				</tbody>

			</table>

			<div class="pagination"><?php echo ($Page); ?></div>

		</form>

	</div>

<script type="text/javascript">
function zccheck(){
	var zczz = '';
	$('.js-check').each(function (k,v){
		if($(v).attr('checked')=='checked'){
			zczz += ','+$(v).val();
		}
	});

if(zczz){
zczz = zczz.substring(1);
window.location.href = "<?php echo U('guestbookadmin/distributionall','','',true);?>"+'?zczz='+zczz;
}else{
isalert('请先选择需要分配的询盘！');
}
}
</script>

<script src="/a/public/js/common.js"></script>

<script src="/a/public/js/content_addtop.js"></script>

</body>

</html>