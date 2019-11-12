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
			<li class="active"><a href="<?php echo U('contentshow/hot_product');?>">热销产品</a></li>
		</ul>
		
		<form class="js-ajax-form" method="post">
			<div class="table-actions" >
				<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('Contentshow/new_listorder');?>"><?php echo L('SORT');?></button>
			</div>
			<table class="table table-hover table-bordered table-list">
				<thead>
					<tr>
						<th width="50"><?php echo L('SORT');?></th>
						<th width="55">ID</th>
						<th width="150">标题</th>
						<th width="150">图片</th>
						<th width="150">更新时间</th>
						
						<th width="100"><?php echo L('MANAGE');?></th>
					</tr>
				</thead>
				<?php if($info): if(is_array($info)): foreach($info as $key=>$vo): ?><tr>
					<td>
						<input name="listorders[<?php echo ($vo["id"]); ?>]" class="input input-order" type="text" size="5" value="<?php echo ($vo["listorder"]); ?>" title="ID:<?php echo ($vo["tid"]); ?>" />
					</td>
					<td><?php echo ($vo["id"]); ?></td>
					<td><a><?php echo ($vo["title"]); ?></a></td>
					<td><img src="<?php echo ($vo['thumb']); ?>" style="width:200px; height:118px;"></td>
					<td><?php echo (date("Y-m-d",$vo["updatetime"])); ?></a></td>
				
					<td>
						<a href="<?php echo U('Contentshow/edit',array('catid'=>$vo['catid'],'id'=>$vo['id']));?>" target="_blank"><?php echo L('EDIT');?></a> | 
						<a href="<?php echo U('Contentshow/istopajax',array('catid'=>$vo['catid'],'id'=>$vo['id'],'istop'=>1));?>" class="js-ajax-delete">取消热销</a>
					</td>
				</tr><?php endforeach; endif; ?>
				<?php else: ?>
					<tr><td colspan="5">暂无产品</td></tr><?php endif; ?>
				<tfoot>
					<tr>
						<th width="50"><?php echo L('SORT');?></th>
						<th width="55">ID</th>
						<th width="150">标题</th>
						<th width="150">图片</th>
						<th width="150">更新时间</th>
						
						<th width="100"><?php echo L('MANAGE');?></th>
					</tr>
				</tfoot>
			</table>
			<div class="pagination"><?php echo ($Page); ?></div>
			<div class="table-actions">
				<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('Contentshow/new_listorder');?>"><?php echo L('SORT');?></button>
			</div>
			
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
		function used_j(id,is_use){
			$.getJSON("/a/index.php?g=Content&m=Tkslibrary&a=used&id=" + id+"&is_use="+is_use, function (json) {
		        	if(json.status){
		        		window.location = "/a/index.php?g=Content&m=Tkslibrary&a=index";
		        	}
		    });
		}
		
	</script>
</body>
</html>