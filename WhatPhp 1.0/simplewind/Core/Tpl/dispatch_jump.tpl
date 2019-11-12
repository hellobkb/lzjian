<?php
    if(C('LAYOUT_ON')) {
        echo '{__NOLAYOUT__}';
    }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>跳转提示</title>
<tc_include file=":function"/>
<script src="__PUBLIC__/js/jquery.js"></script>
<!-- 引用自己Css开始 -->
<link href="__PUBLIC__/css/index.css" rel="stylesheet" type="text/css" />
<!-- 引用自己Css结束 -->
<meta name="author" content="2016 石家庄瑞诺网络科技有限公司" />
<style>
.Validform_checktip{margin-left:0;}
.info{
    border:1px solid #ccc; 
    padding:2px 20px 2px 5px; 
    color:#666; 
    position:absolute;
    display:none;
    line-height:20px;
    background-color:#fff;
   
}
.dec {
    bottom: -8px;
    display: block;
    height: 8px;
    overflow: hidden;
    position: absolute;
    left: 10px;
    width: 17px;
}
.dec s {
    font-family: simsun;
    font-size: 16px;
    height: 19px;
    left: 0;
    line-height: 21px;
    position: absolute;
    text-decoration: none;
    top: -9px;
    width: 17px;
}
.dec .dec1 {
    color: #ccc;
}
.dec .dec2 {
    color: #fff;
    top: -10px;
}
</style>
<style type="text/css">
*{ padding: 0; margin: 0; }
body{ background: #fff; font-family: '微软雅黑'; color: #333; font-size: 16px; }
.system-message{ padding: 24px 48px; }
.system-message h1{ font-size: 100px; font-weight: normal; line-height: 120px; margin-bottom: 12px; }
.system-message .jump{ padding-top: 10px}
.system-message .jump a{ color: #333;}
.system-message .success,.system-message .error{ line-height: 1.8em; font-size: 36px }
.system-message .detail{ font-size: 12px; line-height: 20px; margin-top: 12px; display:none}
</style>
</head>
<body>

<div class="header">
				
				<php>
				$content = json_decode($zcmod['content'],true);
				$content['logourl'] = "";

				 
				</php>

				<!-- logo部分开始 -->
				<div class="head">
					<div class="zong">
				        <div class="logo">
				        <if condition="$content['logourl']">
				        	<a href="__ROOT__" title="{$site_name}"><img src="{$content.logourl}" alt="{$site_name}" title="{$site_name}" /></a>
				        <else />
				        	<a href="__ROOT__" title="{$site_name}"><img src="__PUBLIC__/xinyu/images/logo.png" alt="{$site_name}" title="{$site_name}" /></a>
				        </if>
				        	
				        </div>
				        <div class="logo_wz">
				        	<a href="__ROOT__" title=""><img src="__PUBLIC__/xinyu/images/wenzi.jpg" alt="{$site_name}" title="{$site_name}" /></a>
				        </div>
				        <div class="head_r">
				        	<div class="head_phonelogo"><img src="__PUBLIC__/xinyu/images/phonelogo.jpg" alt="{$site_name}" title="{$site_name}" /></div>
				        	<div class="head_ps">
				            	<div class="head_phone"><img src="__PUBLIC__/xinyu/images/phonenum.jpg" alt="{$site_name}" title="{$site_name}" /></div>
				                <div class="sjmt">
				                	<a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/facebook.jpg" /></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/twitter.jpg" /></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/google.jpg" /></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/linkedin.jpg" /></a>
				                    <a href="" target="_blank" rel="nofollow" class="sjmtlast"><img src="__PUBLIC__/xinyu/images/youtube.jpg" /></a>
				                </div>

				            	<div class="clear"></div>
				            </div>
				            
				            <!-- 小屏开始 -->
				            <div class="head_tright">
				            	<!-- 小屏搜索开始 -->
				            	<form method="post" class="sousuo" action="{:U('Search/Index/index')}" style="margin:18px 0;">
									<input type="text" class="sou" placeholder="Find Something Great..." name="q" value="{:I('get.keyword')}"/>
									<input type="submit" class="suo" value="" />
								</form>
				            	<!-- 小屏搜索结束 -->
				            	 
				            	 <!-- 小屏菜单开始 -->
				                <div class="caidan">
				                    <div id="xianshii">
				                      <div class="anniuuu" onclick="aaAA()">
				                        <input type="submit" name="button" id="button" class="menu2" value=" "  />
				                        <div class="clear"></div>
				                      </div>
				                    </div>
				                    <div id="yingcangg" style="display:none;">
				                      <div class="anniuu" onclick="aaAA()">
				                        <input type="submit" name="button" id="button" class="menu2" value=" " />
				                        <div class="clear"></div>
				                      </div>
				                      <ul class="caidanzhongnei">
				                        <li><a href="__ROOT__" class="yijileiafenleia">Home</a></li>
				                        <content action="category" catid="0" order="listorder asc ">
				                        	<foreach name="data" item="cat_value">
				                        		<li><a href="{$cat_value.url}" class="yijileiafenleia">{$cat_value.catname}</a></li>
				                        	</foreach>
				                        </content>
				                        <li><a href="" class="yijileiafenleia">Contact Us</a></li>
				                      </ul>
				                      <div class="clear"></div>
				                    </div>
				                    <div class="clear"></div>
				                  </div>
				                  <!-- 小屏菜单结束 -->
				                  <script type="text/javascript"> 
				                      function aaAA(){var xiashi=document.getElementById("xianshii").style.display;
				                      var yincang=document.getElementById("yingcangg").style.display;
				                      if(yincang=="block")
				                      {document.getElementById("xianshii").style.display="block";
				                      document.getElementById("yingcangg").style.display="none";}
				                      else
				                      {document.getElementById("xianshii").style.display="none";
				                      document.getElementById("yingcangg").style.display="block";}}
				                  </script>
				            </div>
				            <!-- 小屏结束 -->

				        	<div class="clear"></div>
				        </div>
				        <div class="clear"></div>      
				    </div>
				</div>

				<!-- Logo部分结束 -->


				<div class="top">
				  <div class="zong">
				    <!-- 大屏导航栏开始 -->
				      <content action="category" catid="0"  order="listorder ASC" >
				          <php>$data = zc_children_more($data);</php>
				            <div class="nav">
				              <ul class="ul-yiji">
				                <li class="li-yiji fl"><a href="__ROOT__" title="Home" <if condition="!$catid"> id="xuanzhong" </if> >Home</a></li>
				                <volist name="data" id="r"> 
				                <li class="li-yiji fl"><a href="{:zcurl($r['url'],$r['moveurl'])}" title="{$r.catname}" <if condition="in_array($catid,explode(',',$r['arrchildid']))">id="xuanzhong"</if> >{$r.catname}</a>
				                  <content action="category" catid="$r['catid']"  order="listorder ASC" >
				                    <if condition="count($data)">
				                      <div class="ul-erji">
				                        <volist name="data" id="r">
				                        <div <if condition="$key eq 0"> class="lNav1 currentDd1 currentDt1" <else />class="lNav1"</if>><a href="{:zcurl($r['url'],$r['moveurl'])}" title="{$r.catname}">{$r.catname}</a></div>
				                        </volist>
				                         
				                      </div>
				                    </if>
				                    </content>
				                </li>
				                </volist>
				               
				              </ul>
				            </div>
				       </content>
				    <!-- 大屏导航栏结束 -->
				        <script type="text/javascript">
				                            $(function(){$(".lNav1").click(function(){
				                                        $(this).toggleClass("currentDd1").siblings(".lNav1").removeClass("currentDd1")
				                                        $(this).toggleClass("currentDt1").siblings(".lNav1").removeClass("currentDt1")
				                                        $(this).next(".navContent1").slideToggle(500).siblings(".navContent1").slideUp(500);})  })
				                            </script>
				        <!-- 大屏搜索开始 -->
				        <div class="search">
				            <div id="sb-search" class="sb-search">
				            
				              <form name="productform" method="post"  action="{:U('Search/Index/index')}" >
				          <input type="text" class="sb-search-input" placeholder="" name="q" value="{:I('get.keyword')}"/>
				          <input type="submit" class="sb-search-submit" value="" name="dosubmit"/> 
				          <input class="sb-icon-search" type="submit" value="" name="dosubmit">
				        </form>
				             
				            </div>
				            <script src="__PUBLIC__/xinyu/js/classie.js"></script> 
				            <script src="__PUBLIC__/xinyu/js/uisearch.js"></script> 
				            <script>
				                      new UISearch( document.getElementById( 'sb-search' ) );
				             </script> 
				         </div>
				        <!-- 大屏搜索结束 -->
				        <div class="clear"></div>

				    </div>
				</div>
				<php>
				$category = S("Category");
				$father = zc_father($category,$catid);
				</php>
				<div class="tb">
				  
</div>


    
</div>
<div class="main">
	<div class="bg">
	<div class="body n2">
	<div class="zong">

    			<div class="system-message">
				<?php if(isset($message)) {?>
				<img src="__PUBLIC__Public/img/dui.png" alt="">
				<p class="success"><?php echo($message); ?></p>
				<?php }else{?>
				<img src="__PUBLIC__Public/img/cha.png" alt="">
				<p class="error"><?php echo($error); ?></p>
				<?php }?>
				<p class="detail"></p>
				<p class="jump">
				页面自动 <a id="href" href="<?php echo($jumpUrl); ?>">跳转</a> 等待时间： <b id="wait"><?php echo($waitSecond); ?></b>
				</p>
				</div>
				<script type="text/javascript">
				(function(){
				var wait = document.getElementById('wait'),href = document.getElementById('href').href;
				var interval = setInterval(function(){
					var time = --wait.innerHTML;
					if(time <= 0) {
						location.href = href;
						clearInterval(interval);
					};
				}, 1000);
				})();
				</script>
   
    </div>
    </div>
    </div>
</div>
<div class="foot">
    			<div class="zong">
				        <div class="footer_top">
				            <div class="f1">
				                <div class="f1_title">
				                    <a href="{:U(Content/Pagedis/lists,array('catid'=>101))}" title="contact us"><img src="__PUBLIC__/xinyu/images/footer-title1.png" alt="contact us" title="contact us"></a>
				                </div>
				                <ul>
				                    <li class="f1bg1"><a href="mailto:hbxyhy@163.com" title="">hbxyhy@163.com</a></li>
				                    <li class="f1bg2"><a href="skype:hbxyhy?call" title="">hbxyhy</a></li>
				                    <li class="f1bg3">+86 317 7807 633</li>
				                    <li class="f1bg4">+86 317 7722 909</li>
				                    <li class="f1bg5">No. 38 Jianshe Road, Dongguang County,
				    Hebei Province, China.</li>
				                </ul>
				                
				            </div>
				            <div class="f2">
				            	<div class="f2_title">
				                	<a title="QR code"><img src="__PUBLIC__/xinyu/images/footer-title2.png" alt="QR code" title="QR code"></a>
				                </div>
				                
				            	<div class="f2_nr fl">
				                	<div class="f2_pic"><img src="__PUBLIC__/xinyu/images/erweima1.jpg" alt="Website" title="Website"></div>
				                    <div class="f2_font">Website</div>
				                </div>
				                <div class="f2_nr fr">
				                	<div class="f2_pic"><img src="__PUBLIC__/xinyu/images/erweima2.jpg" alt="Wechat" title="Wechat"></div>
				                    <div class="f2_font">Wechat</div>
				                </div>
				                <div class="clear"></div>
				            </div>
				            
				            <div class="f3">
				            	<div class="f3_tltle">
				                	<a title="newsletter"><img src="__PUBLIC__/xinyu/images/footer-title3.png" alt="newsletter" title="newsletter"></a>
				                </div>
				            	<div class="f3_msg">SIGNUP FOR OUR MONTHLY NEWSLETTER</div>
								<!-- {:xPan()} -->
				<form name='' method='post' action="{:U('api/guestbook/addeml')}" enctype='multipart/form-data' id='formxun'>
				    <input type='hidden' name='type' value=1 />
				    <div>
				        <input name='email' datatype='e' nullmsg='邮箱不能为空哦！' errormsg='邮箱不对哦！'  type='text' class="f3_input" placeholder='Your E-mail' />
				        <div class="info">
				            <span class="Validform_checktip"></span>
				            <span class="dec">
				                <s class="dec1">&#9670;</s>
				                <s class="dec2">&#9670;</s>
				            </span>
				        </div>
				    </div>
				    <input type='submit' value='Send' class="f3_send">
				</form>
				<script src="__ROOT__/public/js/Validform_v5.3.2_min.js"></script>
				<script type="text/javascript">
				$(function(){
				    $("#formxun").Validform({
				        tiptype:function(msg,o,cssctl){
				            if(!o.obj.is("#formxun")){
				                var objtip=o.obj.parents("div").find(".Validform_checktip");
				                cssctl(objtip,o.type);
				                objtip.text(msg);
				                var infoObj=o.obj.parents("div").find(".info");
				                if(o.type==2){
				                    infoObj.fadeOut(200);
				                }else{
				                    if(infoObj.is(":visible")){return;}
				                    var left=o.obj.offset().left,
				                        top=o.obj.offset().top;
				                    infoObj.css({
				                        left:left+170,
				                        top:top-45
				                    }).show().animate({
				                        top:top-35
				                    },200);
				                }
				            }
				        }
				    });
				})
				</script>

				                <div class="fsjmt">
				                	<a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/facebook.png"></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/twitter.png"></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/google.png"></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/linkedin.png"></a>
				                    <a href="" target="_blank" rel="nofollow"><img src="__PUBLIC__/xinyu/images/youtube.png"></a>
				                	<div class="clear"></div>
				                </div>
				            </div>
				            <div class="clear"></div>
				        </div>
				        <div class="fbottom">
				            <div class="banquan">
				            	<div class="fbottom_left">Copyrights © Hebei XINYU Welding Co., Ltd. All Rights Reserved</div>
				            	<div class="fbottom_right">
				                	<a href="" title="" target="_blank">Sitemap</a>
				                    <span>|</span>
				                    <a href="" title="" target="_blank" class="cnzz"><img src="__PUBLIC__/xinyu/images/cnzz.jpg" alt="" title=""></a>
				                    <span>|</span>
				                    <span>Powered by</span>
				                    <a href="" target="_blank" rel="nofollow" class="reanod"><img src="__PUBLIC__/xinyu/images/reanod.png"></a>
				                </div>
				                <div class="clear"></div>
				            </div>
				        </div>
				    </div>
				    <php>$links=sp_getlinks();</php>
				 
				    <if condition="$links">
				 
				    <div class="links">
				        <span>Links:</span>
				        <foreach name="links" item="vo">
				            <a href="{$vo.link_url}" title="{$vo.link_name}" target="{$vo.link_target}">{$vo.link_name}</a>
				        </foreach>
				 
				    </div>
				    </if>


				<div id="online_qq_layer">
				  <div id="online_qq_tab"> <a id="floatShow" style="display: none;" href="javascript:void(0);"></a><a id="floatHide" style="display: block;" href="javascript:void(0);"></a> </div>
				  <div id="onlineService">
				    <div class="onlineMenu"></div>
				    <div class="onlineMenuB">
				        <ul>
				            <li><a href="skype:Helen?call">Helen</a></li>
				            <li><a href="skype:Caroline?call">Caroline</a></li>
				            <li><a href="skype:linda?call">linda</a></li>
				        </ul>
				    </div>
				  </div>
				</div>

				<script>
				$(document).ready(function(){
				$("#floatShow").bind("click",function(){
				$("#onlineService").animate({width:"show", opacity:"show"}, "normal" ,function(){
				$("#onlineService").show();
				});
				$("#floatShow").attr("style","display:none");
				$("#floatHide").attr("style","display:block");
				return false;
				}); 
				$("#floatHide").bind("click",function(){
				$("#onlineService").animate({width:"hide", opacity:"hide"}, "normal" ,function(){
				$("#onlineService").hide();
				});
				$("#floatShow").attr("style","display:block");
				$("#floatHide").attr("style","display:none");
				return false;
				});
				});
				</script>


</div>






</body>
</html>
