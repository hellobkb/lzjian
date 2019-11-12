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
	<style>
		.table td input{width: auto;}
    .fixed{
      padding-top: 40px;
    }
    .fixed .fixed-top{
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      padding-left: 20px;
      padding-bottom: 10px !important;
      margin-top: auto;
      background: #fff;
    }
    .table td{
      padding-left: 10px !important;
    }
	</style>
	<div class="wrap">
		<ul class="nav nav-tabs">
			<li class="active"><a href="<?php echo U('Category/index');?>">栏目列表</a></li>
			<li><a href="<?php echo U('Category/add');?>">添加栏目</a></li>
			<li><a href="<?php echo U('Category/singlepage');?>">添加单页</a></li>
			<li><a href="<?php echo U('Category/wadd');?>">添加外部链接</a></li>
		</ul>
		<form method="post" class="js-ajax-form js-check-wrap" action="<?php echo U('Category/index');?>" id="fixed_form">
			<div class="table-actions fixed-top">
				<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('Content/Category/p_delete');?>" data-subcheck="true" data-msg="删除操作不可逆，并且只会删除空栏目">批量删除</button>
				<button type="submit" class="btn btn-primary btn-small js-ajax-submit"><?php echo L('SORT');?></button>
			</div>
			<table class="table table-hover table-bordered table-list" id="menus-table">
				<thead>
					<tr>
						<th width="10">
							<label><input type="checkbox" class="js-check-all" data-direction="x" data-checklist="js-check-x"></label>
						</th>
						<th width="50"><?php echo L('SORT');?></th>
						<th width="50">栏目ID</th>
						<th>栏目名称</th>
						<th>栏目类型</th>
						<th>所属模型</th>
						<th>访问</th>
						<th>域名绑定须知</th>
						<th>是否在首页显示</th>
						<th>管理操作</th>
					</tr>
				</thead>
				<tbody id="sortable">
					<?php echo ($categorys); ?>
				</tbody>
				<tfoot>
					<tr>
						<th width="10">
							<label><input type="checkbox" class="js-check-all" data-direction="x" data-checklist="js-check-x"></label>
						</th>
						<th width="50"><?php echo L('SORT');?></th>
						<th width="50">栏目ID</th>
						<th>栏目名称</th>
						<th>栏目类型</th>
						<th>所属模型</th>
						<th>访问</th>
						<th>域名绑定须知</th>
						<th>是否在首页显示</th>
						<th>管理操作</th>
					</tr>
				</tfoot>
			</table>
			<div class="table-actions">
				<button class="btn btn-primary btn-small js-ajax-submit" type="submit" data-action="<?php echo U('Content/Category/p_delete');?>" data-subcheck="true" data-msg="删除操作不可逆，并且只会删除空栏目">批量删除</button>
				<button type="submit" class="btn btn-primary btn-small js-ajax-submit"><?php echo L('SORT');?></button>
			</div>
		</form>
	</div>
	<script src="/a/public/js/common.js"></script>
	<script src="/a/public/js/content_addtop.js"></script>
	<script>
		$(function() {
		  // 固定头部
      var sform = $('#fixed_form'),
        thead = sform.find('thead'),
        thtop = thead.offset().top;

      $(window).scroll(function() {
        var sctop = $(this).scrollTop();
        if(sctop > 60){
          var ty = sctop - thtop + 40;
          thead.css({'transform':'translateY('+ ty +'px)'});
          sform.addClass('fixed');
        } else{
          thead.css({'transform':'translateY(0px)'});
          sform.removeClass('fixed');
        }
      })
    })


	function changeismenu(id,obj){

		$.get("<?php echo U('Category/changeismenu');?>", {id:id},function(str){

			if(str.status ==1){

				obj.innerHTML= str.msg;
			}

		},'json');


	}
	</script>
	<script>
		$(document).ready(function() {
			Wind.css('treeTable');
			Wind.use('treeTable', function() {
				$("#menus-table").treeTable({
					indent : 20
				});
			});
		});

		setInterval(function() {
			var refersh_time = getCookie('refersh_time_admin_menu_index');
			if (refersh_time == 1) {
				reloadPage(window);
			}
		}, 2000);
		setCookie('refersh_time_admin_menu_index', 0);
		function checknode(obj) {
		    var chk = $("input[type='checkbox']");
		    var count = chk.length;
		    var num = chk.index(obj);
		    var level_top = level_bottom = chk.eq(num).attr('level');
		    for (var i = num; i >= 0; i--) {
		        var le = chk.eq(i).attr('level');
		        if (eval(le) < eval(level_top)) {
		            chk.eq(i).attr("checked", true);
		            var level_top = level_top - 1;
		        }
		    }
		    for (var j = num + 1; j < count; j++) {
		        var le = chk.eq(j).attr('level');
		        if (chk.eq(num).attr("checked") == "checked") {
		            if (eval(le) > eval(level_bottom)){
		            	chk.eq(j).attr("checked", true);
		            }
		            else if (eval(le) == eval(level_bottom)){
		            	break;
		            }
		        } else {
		            if (eval(le) > eval(level_bottom)){
		            	chk.eq(j).attr("checked", false);
		            }else if(eval(le) == eval(level_bottom)){
		            	break;
		            }
		        }
		    }
		}
	</script>
</body>
</html>