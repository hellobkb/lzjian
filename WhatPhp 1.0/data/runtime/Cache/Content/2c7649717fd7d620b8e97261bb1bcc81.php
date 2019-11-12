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
			<li class="active"><a href="<?php echo U('Models/index');?>"><?php echo L('MODELS_MANAGE');?></a></li>
			<li><a href="<?php echo U('Models/add');?>"><?php echo L('MODELS_CREATE');?></a></li>
			<li><a href="<?php echo U('Models/import');?>"><?php echo L('MODELS_IMPORT');?></a></li>
		</ul>
		<form class="well form-search" >
			<a>温馨提示：非专业人员，请勿修改或删除模型信息哦！</a>
		</form>
		<form class="js-ajax-form" method="post">
			
			<table class="table table-hover table-bordered table-list">
				<thead>
					<tr>
						<th width="55">ID</th>
						<th width="100"><?php echo L('MODELNAME');?></th>
						<!-- <th>点击量</th> -->
						<th width="80"><?php echo L('TABLE');?></th>
						<th width="120"><?php echo L('DESC');?></th>
						<th width="50"><?php echo L('STATUS');?></th>
						<th width="120"><?php echo L('MANAGE');?></th>
					</tr>
				</thead>
				<?php if(is_array($data)): foreach($data as $key=>$vo): ?><tr>
					<td><?php echo ($vo["modelid"]); ?></td>
					<td><a><?php echo ($vo["name"]); ?></a></td>
					<td><?php echo ($pre); echo ($vo["tablename"]); ?></td>
					<!--  <td>0</td> -->
					<td><?php echo ($vo["description"]); ?></td>
					<td><?php if($vo['disabled'] == '1' ): ?>╳<?php else: ?>√<?php endif; ?></td>
					<td>
						<a href="<?php echo U('Models/edit',array('modelid'=>$vo['modelid']));?>"><?php echo L('X_EDIT');?></a>|
						<a href="<?php echo U('Field/index',array('modelid'=>$vo['modelid']));?>"><?php echo L('FIELDMANE');?></a>|
						<?php if($vo['disabled'] == 0){ ?>
							<a href="<?php echo U('disabled',array('modelid'=>$vo['modelid'],'disabled'=>0));?>"><?php echo L('NOUSE');?></a>|
						<?php }else{ ?>
							<a href="<?php echo U('disabled',array('modelid'=>$vo['modelid'],'disabled'=>1));?>"><?php echo L('DISPLAY');?></a>|

						<?php } ?>
						
						<a href="<?php echo U('delete',array('modelid'=>$vo['modelid']));?>" class="js-ajax-delete"><?php echo L('DEL');?></a>|
						<a href="<?php echo U('export',array('modelid'=>$vo['modelid']));?>"><?php echo L('MODELS_OUT');?></a>
					</td>
				</tr><?php endforeach; endif; ?>
				<tfoot>
					<tr>
						
						<th width="55">ID</th>
						<th width="100"><?php echo L('MODELNAME');?></th>
						<!-- <th>点击量</th> -->
						<th width="80"><?php echo L('TABLE');?></th>
						<th width="120"><?php echo L('DESC');?></th>
						<th width="50"><?php echo L('STATUS');?></th>
						<th width="120"><?php echo L('MANAGE');?></th>
					</tr>
				</tfoot>
			</table>
			
			<div class="pagination"><?php echo ($Page); ?></div>
		</form>
	</div>
	<script src="/a/public/js/common.js"></script>
	<script>
		setCookie('refersh_time', 0);
		function refersh_window() {
			var refersh_time = getCookie('refersh_time');
			if (refersh_time == 1) {
				window.location.reload();
			}
		}
		setInterval(function() {
			refersh_window()
		}, 2000);
	</script>
</body>
</html>