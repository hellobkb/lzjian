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
<style>
.home_info li em {
  float: left;
  width: 120px;
  font-style: normal;
}
li {
  list-style: none;
}
</style>
</head><body>
<div class="wrap" style="margin-left:0; padding-left:0">
	
       <div class="sylunbo">
     
           <div class="synews1">	
              <div class="synews_title"><img src="/a/images/sy-ntitle1.png" alt="" title="" /></div>                
              <div class="sy_tabnr">			

                  <div id="amain2">
                  <?php $temp =array(); foreach($qlist as $qkey=>$qvalue){ if($qkey<2){ $temp[0][] = $qvalue; }elseif($qkey<4 ){ $temp[1][] = $qvalue; }elseif($qkey<6){ $temp[2][] = $qvalue; } } $qklist = $temp; ?>
                  	<?php if(is_array($qklist)): foreach($qklist as $qk=>$qvo): if($qk == 0 ): ?><ul class="block" >
                  				<?php if(is_array($qvo)): foreach($qvo as $key=>$qvc): ?><li><a href="<?php echo ($qvc["url"]); ?>" title="<?php echo ($qvc["post_title"]); ?>" target="_blank"><?php echo ($qvc["post_title"]); ?></a></li><?php endforeach; endif; ?>
                  			</ul>
                  		<?php elseif($qk == 1 ): ?>
                  			<ul>
                  				<?php if(is_array($qvo)): foreach($qvo as $key=>$qvc): ?><li><a href="<?php echo ($qvc["url"]); ?>" title="<?php echo ($qvc["post_title"]); ?>" target="_blank" ><?php echo ($qvc["post_title"]); ?></a></li><?php endforeach; endif; ?>
                      		</ul>
                  		<?php elseif($qk == 2 ): ?>
                  			<ul>
                  				<?php if(is_array($qvo)): foreach($qvo as $key=>$qvc): ?><li><a href="<?php echo ($qvc["url"]); ?>" title="<?php echo ($qvc["post_title"]); ?>" target="_blank" ><?php echo ($qvc["post_title"]); ?></a></li><?php endforeach; endif; ?> 
                      		</ul><?php endif; endforeach; endif; ?>
                      <div class="clear"></div>
                  </div>
                  
                  <ul id="amenu2" class="sy_menu1 sy_tabbg1">
                      <li onMouseOver="asetTab(2,0)" class="hovers"></li>
                      <li onMouseOver="asetTab(2,1)"></li>
                      <li onMouseOver="asetTab(2,2)"></li>
                    <div class="clear"></div>
                  </ul>
                  
              </div>
           </div>
           
           
           <div class="synews2">	
              <div class="synews_title"><img src="/a/images/sy-ntitle2.png" alt="" title="" /></div>                
              <div class="sy_tabnr">			

                  <div id="bmain2">
                  
                  <?php $temp = array(); foreach($tlist as $tkey=>$tvalue ){ if($tkey<2){ $temp[0][] = $tvalue; }elseif ($tkey<4){ $temp[1][] =$tvalue; }elseif ($tkey<6){ $temp[2][] = $tvalue; } } $tklist = $temp; ?>
                   <?php if(is_array($tklist)): foreach($tklist as $tk=>$tvo): if($tk == 0 ): ?><ul class="block" >
                   				<?php if(is_array($tvo)): foreach($tvo as $key=>$tcv): ?><li><a href="<?php echo ($tcv["url"]); ?>" title="<?php echo ($tcv["post_title"]); ?>" target="_blank" ><?php echo ($tcv["post_title"]); ?></a></li><?php endforeach; endif; ?>
                   			</ul>
                   		<?php elseif($tk == 1 ): ?>
                   			<ul>
                   				<?php if(is_array($tvo)): foreach($tvo as $key=>$tcv): ?><li><a href="<?php echo ($tcv["url"]); ?>" title="<?php echo ($tcv["post_title"]); ?>" target="_blank" ><?php echo ($tcv["post_title"]); ?></a></li><?php endforeach; endif; ?>
                   			</ul>
                   		<?php elseif($tk == 2 ): ?>
                   			<ul>
                   			<?php if(is_array($tvo)): foreach($tvo as $key=>$tcv): ?><li><a href="<?php echo ($tcv["url"]); ?>" title="<?php echo ($tcv["post_title"]); ?>" target="_blank" ><?php echo ($tcv["post_title"]); ?></a></li><?php endforeach; endif; ?>
                   			</ul><?php endif; endforeach; endif; ?>          
                      <div class="clear"></div>
                  </div>
                  
                  <ul id="bmenu2" class="sy_menu1 sy_tabbg2">
                      <li onMouseOver="bsetTab(2,0)" class="hovers"></li>
                      <li onMouseOver="bsetTab(2,1)"></li>
                      <li onMouseOver="bsetTab(2,2)"></li>
                    <div class="clear"></div>
                  </ul>
                  
              </div>
           </div>
           
           <div class="synews3">	
              <div class="synews_title"><img src="/a/images/sy-ntitle3.png" alt="" title="" /></div>                
              <div class="sy_tabnr">			

                  <div id="cmain2">
                  
                  <?php $temp = array(); foreach($plist as $pkey=>$pvalue ){ if($pkey<2){ $temp[0][] = $pvalue; }elseif ($pkey<4){ $temp[1][] =$pvalue; }elseif ($tkey<6){ $temp[2][] = $pvalue; } } $pklist = $temp; ?>
                  	<?php if(is_array($pklist)): foreach($pklist as $pk=>$pvo): if($pk == 0 ): ?><ul class="block" >
                  				<?php if(is_array($pvo)): foreach($pvo as $key=>$pcv): ?><li><a href="<?php echo ($pcv["url"]); ?>" title="<?php echo ($pcv["post_title"]); ?>" target="_blank" ><?php echo ($pcv["post_title"]); ?></a></li><?php endforeach; endif; ?>
                  			</ul>
                  		<?php elseif($pk == 1 ): ?>
                  			<ul>
                  				<?php if(is_array($pvo)): foreach($pvo as $key=>$pcv): ?><li><a href="<?php echo ($pcv["url"]); ?>" title="<?php echo ($pcv["post_title"]); ?>" target="_blank" ><?php echo ($pcv["post_title"]); ?></a></li><?php endforeach; endif; ?>
                  			</ul>
                  		<?php elseif($pk == 2 ): ?>
                  			<ul>
                  				<?php if(is_array($pvo)): foreach($pvo as $key=>$pcv): ?><li><a href="<?php echo ($pcv["url"]); ?>" title="<?php echo ($pcv["post_title"]); ?>" target="_blank" ><?php echo ($pcv["post_title"]); ?></a></li><?php endforeach; endif; ?>
                  			</ul><?php endif; endforeach; endif; ?>
                   
                      <div class="clear"></div>
                  </div>
                  
                  <ul id="cmenu2" class="sy_menu1 sy_tabbg3">
                      <li onMouseOver="csetTab(2,0)" class="hovers"></li>
                      <li onMouseOver="csetTab(2,1)"></li>
                      <li onMouseOver="csetTab(2,2)"></li>
                    <div class="clear"></div>
                  </ul>
                  
              </div>
           </div>

           <div class="clear"> </div>

    </div>
    <script type="text/javascript" src="/a/public/js/qiehuan.js"></script>

  <div class="well2 font11">
 
    <div class="sypic1"><img src="/a/images/htsy1.jpg" /></div>
    <div class="sypic1"><img src="/a/images/htsy2.jpg" /></div>
    <div class="sypic"><img src="/a/images/htsy3.jpg" /></div>
    <div class="sypic"><img src="/a/images/htsy4.jpg" /></div>
    <div class="sypic"><img src="/a/images/htsy5.jpg" /></div>

    <div class="sykuai1"><img src="/a/images/htbiao1.png" /></div>
    <div class="sykuai2"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Content/Contents/product',array('modelid'=>5));?>">产品管理</a></div>
    <div class="sykuai3"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Content/Category/index');?>">导航栏目管理</a></div>
    <div class="sykuai5"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Content/Contents/article',array('modelid'=>1));?>">文章管理</a></div>
    <div class="sykuai6"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Content/Createhtml/category');?>">更新栏目页</a></div>



    <div class="sy2kuai1"><img src="/a/images/htbiao2-2.png" /></div>

    <div class="sy2kuai2"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Statistics/Foreignvis/index');?>">访客统计</a></div>
     
    <div class="sy2kuai4"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Statistics/Report/index');?>">营销报告</a></div>
    <div class="sy2kuai5"><img src="/a/images/heidian.jpg" /> <a href="<?php echo U('Statistics/Articlestatistics/statisticsarticle');?>">文章统计</a></div>
     

    <div class="sy3kuai1"><img src="/a/images/htbiao4.png" /></div>

    <div class="sy3kuai2"><img src="/a/images/baidian.jpg" /> <a href="<?php echo U('Admin/Peixun/index');?>">新顾问课程</a></div>
    <div class="sy3kuai4"><img src="/a/images/baidian.jpg" /> <a href="http://www.xinguwen.com" target="_blank">更多精品课程</a></div>

    

    <div class="sy4kuai1"></div>

   
    <div class="sy4kuai2"><a href="javascript:;">敬请期待！</a></div>
    
    
    <div class="sy5kuai1"><img src="/a/images/htbiao5.png" /></div>
    
    <div class="sy5kuai2"><img src="/a/images/baidian.jpg" /> <a href="<?php echo U('Gadgets/Currency/index');?>">货币汇率</a></div>
    <div class="sy5kuai3"><img src="/a/images/baidian.jpg" /> <a href="<?php echo U('Gadgets/Customs/index');?> ">海关查询</a></div>
    <div class="sy5kuai4"><img src="/a/images/baidian.jpg" /> <a href="<?php echo U('Gadgets/Translate/index');?>">翻译</a></div>
<!--     <div class="sy5kuai5"><img src="/a/images/baidian.jpg" /> <a href="<?php echo U('Gadgets/Exchagerate/index');?>">汇率查询</a></div> -->
  </div>
  
</div>
<script src="/a/public/js/common.js"></script> 
<div class="clear"></div>
</body>
</html>