<?php

/*
 * 统计报告
 * @author cx
 * @time 20160601
 *   
 *   */


namespace Statistics\Controller;

use Common\Controller\AdminbaseController;
class ReportController extends AdminbaseController{
	
	/* 
	 * 统计分析总览
	 * 
	 *  */
	
	 public function main(){
	 	if(IS_POST){
	 		//产品统计日期
	 		$start_time =  I("post.stime");
	 		$end_time =  I("post.etime");
	 		if( I("post.stime")){
		 		if( I("post.etime")){
						if( I("post.etime") > I("post.stime") ){
							$map['inputtime'] = array(array('EGT',strtotime($start_time)),array('LT',strtotime($end_time)));
							$time['time'] = array(array('EGT',strtotime($start_time)),array('LT',strtotime($end_time)));
							$map_l['link_time'] = array(array('EGT',$start_time),array('LT',$end_time));
						}else{
							$this->error('结束时间不能小于开始时间');
						}
				}else{
						$map['inputtime'] = array(array('EGT',strtotime($start_time)));
						$time['time'] = array(array('EGT',strtotime($start_time)));
						$map_l['link_time'] = array(array('EGT',$start_time));
				}
			}
	 		$this->assign("search" , I("post."));
	 	}else{
	 		//产品统计日期搜索
	 		$ptype = 3;
	 		$this->assign("search" , $search);
	 	}
	 	$map['status'] = '99';
	 	//文章图表
	 	
	 	$articleBack = A('Articlestatistics')->formateArticle(array("start_time"=>$start_time,"end_time"=>$end_time));
	 	
	 	$articleList = $articleBack['list'];
	 	$articleList_arr['time'] =$articleBack['time'];
	 	$articleList_arr['number'] = $articleBack['num'];
	 	$articleContent = $articleBack['content'];
	 	 
	 	//产品访问量统计图表
	 	 $proSurfBack = A('Productsstatistics')->formateProduct(array("stime"=>$start_time,"etime"=>$end_time));
	 	 $productSurfList = $proSurfBack['list'];
	 	 $productSurfContent = $proSurfBack['msg'];
	  
	 	//产品添加统计图表
	 	$productAddBack =A('Productsstatistics')->formateProTime(array("stime"=>$start_time,"etime"=>$end_time));
	 	$productAddList = $productAddBack['list'];
	 	 
	 	//产品发布人统计图表
	 	$productListBack = A('Productsstatistics')->formateProAdd(array("stime"=>$start_time,"etime"=>$end_time));
	 	$productPubList  = $productListBack['list'];
	 	
	 	//询盘地域统计
	 	$guestBack = A("InquiryStatistics")->formateInquiry(array("stime"=>$start_time,"etime"=>$end_time));
	 	$guestList = $guestBack['list'];
	 	$guestCountry = $guestBack['country'];
	 	//询盘买家统计
	 	$guestBuyerBack = A("InquiryStatistics")->formateBuyer(array('stime'=>$start_time, 'etime'=>$end_time));
	 	$guestBuyerNum= $guestBuyerBack['num'];
	 	$guestBuyerTime = $guestBuyerBack['time'];
	 	 
	 	//外商浏览量统计
	 	$backfun = $this->formateForeign_c(I("post."));
		$this->assign("listcoun", $backfun['listcoun']);
		$this->assign("json_countryc", json_encode($backfun['json_countryc']));
		$this->assign("cmsg" , $backfun['cmsg']);

		$backfun = $this->formateForeign_ip(I("post."));
		$this->assign("json_country", json_encode($backfun['json_country']));
		$this->assign("listip", $backfun['listip']);
		$this->assign("ipmsg" , $backfun['ipmsg']);

	 	/*$forSurfBack = A("Foreignvis")->formateForeign(array("start_time"=>$start_time, "end_time"=>$end_time));
	 	 
	 	$forSurfCountry = $forSurfBack['json_country'];
	 	$forSurfNum = $forSurfBack['json_nums'];
	 	$forSurfIpMsg = $forSurfBack['ipmsg'];
	 	 
	 	$forSurfcCountry = $forSurfBack['json_countryc'];
	 	$forSurfcNum = $forSurfBack['json_numsc'];
	 	$forSurfcMsg = $forSurfBack['cmsg'];*/
	 	
	 	
	 	//浏览国家统计
	 	$foreCountryBack = A("Foreignvis")->formateCountry(array("start_time"=>$start_time,"end_time"=>$end_time));
	 	
	 	$foreCountryList = $foreCountryBack['json_list'];
	 	$foreCountry = $foreCountryBack['json_country'];
	 	//浏览国家统计饼图
	 	$bt_rel = $this->formateCountry_bt($post);
		$this->assign('country_bt',json_encode($bt_rel['country_bt']));
		$this->assign('country_data_bt',json_encode($bt_rel['rel_bt']));
	 	 
	 	
	 	//浏览页面统计
	 	$forePageList = M('visits')->field("title, url,sum(`clicks`) as `num`")->where($time)->group('title')->order('num desc')->select();
	 	$this->assign('forePageList',$forePageList);
	 	//浏览页面统计饼图
	 	$btpag_rel = $this->formatePage_bt($post);
		$this->assign('title_bt',json_encode($btpag_rel['title_bt']));
		$this->assign('rel_page_bt',json_encode($btpag_rel['rel_page_bt']));
	  
	 	//发布链接统计
	 	
	 	$linkBack = A('Links')->formateLinks(array('start_time'=>$start_time,'end_time'=>$end_time));
	 	$link_list_arr['time'] = $linkBack['json_time'];
	 	$link_list_arr['number'] = $linkBack['json_nums'];
		
		$this->assign('link_time' , json_encode($link_list_arr['time']));
	 	$this->assign("link_num" ,json_encode($link_list_arr['number']));
	 	$this->assign("link_msg", $linkBack['msg']);
		
	 	$this->assign("articleCount" , json_encode($articleList_arr['number']));
	 	$this->assign('articleTime', json_encode($articleList_arr['time']));
	 	$this->assign('articleContent',$articleContent);
	 	
	 	$this->assign('productSurfList', json_encode($productSurfList));
	 	$this->assign('productSurfContent', $productSurfContent);
	 	
	 	$this->assign("productAddList", json_encode($productAddList));
	 	$this->assign('productPubList' , json_encode($productPubList));

	 	$this->assign("guestCountry" ,json_encode($guestCountry));
	 	$this->assign('guestList' , json_encode($guestList));
	 	
	 	$this->assign("guestBuyerTime" ,json_encode($guestBuyerTime));
	 	$this->assign("guestBuyerNum" ,json_encode($guestBuyerNum));
	 	
	 	$this->assign("forSurfCountry",json_encode($forSurfCountry));
	 	$this->assign('forSurfNum',json_encode($forSurfNum));
	 	$this->assign("forSurfIpMsg" , $forSurfIpMsg);
	 	$this->assign('forSurfcCountry',json_encode($forSurfcCountry));
	 	$this->assign('forSurfcNum',json_encode($forSurfcNum));
	 	$this->assign("forSurfcMsg" , $forSurfcMsg);
	 	
	 	$this->assign('forCountryList', json_encode($foreCountryList));
	 	$this->assign('forCountry', json_encode($foreCountry));
	 	
	 	 
	 	$this->display();
	 	
	 }
	 public function formateCountry_bt($post=''){
		if($post){
			
			$stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
			$etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());
			
			if(strtotime($stime) - strtotime($etime) >0 ){
				$this->error("结束时间不能小于开始时间");
			}
			
			$where['time'] = array(array('EGT',strtotime($stime)),array('LT',strtotime($etime)));

		}else {
			$where['time'] = array(array('EGT',strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),array('LT',strtotime("today")));
		}

		$count = M('Visits')->field("country, sum(clicks) as clicks")->group('country')->where($where)->order('clicks desc')->limit(10)->select();

		foreach ($count as $key => $value) {
			$total_country[] = $value['country'];
			$total_list_data[$key]['value'] = $value['clicks'];
			$total_list_data[$key]['name'] = $value['country'];
		}
		$where['country'] = array('not in',$total_country);
		$qt = M('Visits')->field("sum(clicks) as clicks")->where($where)->group('country')->select();
		if($qt){
			foreach ($qt as $key => $value) {
				$sum += $value['clicks'];
			}
			$other['value'] = $sum;
			$other['name'] = '其他';
			$total_list_data = array_merge($total_list_data,array($other));
			$total_country = array_merge($total_country,array('其他'));
		}
		
		
		$data['country_bt'] = $total_country;
		$data['rel_bt'] = $total_list_data;
		

		return $data;

	}
	public function formatePage_bt($post){

		if($post){
			
			$stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
			$etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d",time());
			
			if(strtotime($stime) - strtotime($etime) >0 ){
				$this->error("结束时间不能小于开始时间");
			}
			
			$where['time'] = array(array('EGT',strtotime($stime)),array('LT',strtotime($etime)));
			
		}else {
			
			$where['time'] = array(array('EGT',strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),array('LT',strtotime("today")));
		}

		$list = M('Visits')->field("title, sum(`clicks`) as `num`")->where($where)->group('title')->order('num desc')->limit(10)->select();
		foreach ($list as $key => $value) {
			$data_title[] = $value['title'];
			$data_title_bt[$key]['value'] = $value['num'];
			$data_title_bt[$key]['name'] = $value['title'];
		}
		$data['title_bt'] = $data_title;
		$data['rel_page_bt'] = $data_title_bt;
		return $data;
	}

	
	public function formateForeign_c($post){
		if($post){
			$stime = $post['start_time'] ? $post['start_time'] : "2010-01-01";
			$etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d",time());
			if(strtotime($stime) - strtotime($etime) >0 ){
				$this->error("结束时间不能小于开始时间");
			}
			$where['time'] = array(array('EGT',strtotime($stime)),array('LT',strtotime($etime)));
		}else {
			$where['time'] = array(array('EGT',strtotime("2010-01-01")),array('LT',strtotime("today")));
		}
		
		//点击量
		$list_c = M('Visits')->field("count(ip) as ip,sum(`clicks`) as `numclick`,FROM_UNIXTIME(time, '%Y-%m-%d' ) as time")->group("time")->where($where)->order('time asc')->select();
		$nums=array();

		foreach ($list_c as $key => $value) {
			$arrc['countrys'][] = $value['country'];
			$arrc['nums'][] = $value['numclick'];
			$nums[] = $value['numclick'];
		}
		
		foreach ($list_c as $key => $value) {
			$total_con += $value['ip'];
			$total_bro += $value['numclick'];
		}

		arsort($nums['nums']);
		
		$countryStr = "";
		$i=0;
		foreach($nums as $k=>$v){
			$countryStr .=",".$arrc['countrys'][$k];
			if($arrc['countrys'][$k] !="中国"){
				$i ++;
			}
			if($i == 3){
				break;
			}
		}
	
		$cmsg = "网站访客占比较高的国家是:".ltrim($countryStr,",")."，说明网站在这些国家的曝光度很高，确认一些这些是您的主推市场吗？如果是，恭喜你，您的网站已经在这些地区受到关注了，如果不是，您需要调整推广策略。";	
		return array("json_countryc"=>$arrc['countrys'], "cmsg"=>$cmsg , "stime"=>$stime, "etime"=>$etime,"listcoun"=>$list_c, 'total_con'=>$total_con, 'total_bro'=>$total_bro);
		
	}
	public function formateForeign_ip($post){
		
		if($post){
			$stime = $post['start_time'] ? $post['start_time'] : "2010-01-01";
			$etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d",time());
			if(strtotime($stime) - strtotime($etime) >0 ){
				$this->error("结束时间不能小于开始时间");
			}
			$where['time'] = array(array('EGT',strtotime($stime)),array('LT',strtotime($etime)));
		}else {
			$where['time'] = array(array('EGT',strtotime("2010-01-01")),array('LT',strtotime("today")));
		}
		
		//ip
		$list = M('Visits')->field("country, count(`ip`) as `num`,time")->group('country')->where($where)->order('time asc')->limit($page->firstRow . ',' . $page->listRows)->select();
		$iptotal =0;
		foreach ($list as $key => $value) {
			$arr['countrys'][] = $value['country'];
			$arr['nums'][] = $value['num'];
			$iptotal += $value['num'];
		}
		 
		if($iptotal <40){
			$ipmsg = "网站访问量太低了，您需要从各个方面提升，加大工作力度，增加网站的曝光度，增加访问量。";
		}else if ($iptotal>=40 && $iptotal<70){
			$ipmsg = "网站访问量很低，需要加油，多做推广工作，提升关键词，增加曝光度，增加访问量。";
		}else if ($iptotal >=70 && $iptotal<=100){
			$ipmsg = "网站访问量及格了，还需要加油啊，继续努力，你会有更多的访客。";
		}else if ($iptotal>100 && $iptotal<=140){
			$ipmsg = "网站访问量进步了，你的网站已经有一定的曝光度了，这是好兆头，但是仍然需要提升，接下来你需要继续做好推广工作，使访问量迈向新的台阶。";
		}else if ($iptotal>140){
			$ipmsg = "恭喜你！你的网站每天都有很稳定的访问量，说明您的网站得到了搜索引擎的认可，加油，您还有很大的潜力，继续增加访问量，增加询盘转化量。";
		}
		
	 
		return array("json_country"=>$arr['countrys'], "ipmsg"=>$ipmsg, "stime"=>$stime, "etime"=>$etime ,"listip"=>$list, "Page"=>$Page);
		
	}
	
	
	
	/* 
	 * 选择生成
	 *  */
	

	public function index(){
		 
		//总的统计评论
		$clist = M('ReportComment')->order(" id desc")->limit(10)->select();
		 
		//形成可选择的checkbox树
		
		import("Tree");
		
		$menu = new \Tree();
		$menu->icon = array('│ ', '├─ ', '└─ ');
		$menu->nbsp = '&nbsp;&nbsp;&nbsp;';
		
		
		$result = array();
		$result[0]['id'] = 1;
		$result[0]['level']= 0;
		$result[0]['parent_node'] ='';
		$result[0]['name'] = "文章统计";
		$result[0]['parentid'] =0;
		
		$result[1]['id'] =2;
		$result[1]['level'] =0;
		$result[1]['parentid_node'] = '';
		$result[1]['name'] ="产品统计";
		$result[1]['parentid']=0;
		
		$result[2]['id'] =3;
		$result[2]['level'] =1;
		$result[2]['parentid_node'] = 'class="child-of-node-2"';
		$result[2]['name'] ="产品访问量统计";
		$result[2]['parentid'] =2;
		
		$result[3]['id'] =4;
		$result[3]['level'] =1;
		$result[3]['parentid_node'] ='class="child-of-node-2"';
		$result[3]['name'] = "产品添加时间统计";
		$result[3]['parentid'] =2;
		
		$result[4]['id'] =5;
		$result[4]['level'] =1;
		$result[4]['parentid_node'] ='class="child-of-node-2"';
		$result[4]['name'] = "产品发布人统计";
		$result[4]['parentid'] =2;
		
		$result[5]['id'] =6;
		$result[5]['level'] =0;
		$result[5]['parentid_node'] ='';
		$result[5]['name'] = "询盘统计";
		$result[5]['parentid'] =0;
		
		$result[6]['id'] =7;
		$result[6]['level'] =1;
		$result[6]['parentid_node'] ='class="child-of-node-6"';
		$result[6]['name'] = "询盘地域统计";
		$result[6]['parentid'] =6;
		
		$result[7]['id'] =8;
		$result[7]['level'] =1;
		$result[7]['parentid_node'] ='class="child-of-node-6"';
		$result[7]['name'] = "询盘买家统计";
		$result[7]['parentid'] =6;
		
		$result[8]['id'] =9;
		$result[8]['level'] =0;
		$result[8]['parentid_node'] ='';
		$result[8]['name'] = "页面浏览统计";
		$result[8]['parentid'] =0;
		
		$result[9]['id'] =10;
		$result[9]['level'] =1;
		$result[9]['parentid_node'] ='class="child-of-node-9"';
		$result[9]['name'] = "外商浏览量统计";
		$result[9]['parentid'] =9;
		
		$result[10]['id'] =11;
		$result[10]['level'] =1;
		$result[10]['parentid_node'] ='class="child-of-node-9"';
		$result[10]['name'] = "浏览国家统计";
		$result[10]['parentid'] =9;
		
		$result[11]['id'] =12;
		$result[11]['level'] =1;
		$result[11]['parentid_node'] ='class="child-of-node-9"';
		$result[11]['name'] = "浏览页面统计";
		$result[11]['parentid'] =9;
		
//		$result[12]['id'] = 13;
//		$result[12]['level']=0;
//		$result[12]['parentid_node'] ='';
//		$result[12]['name'] ="发布链接数";
//		$result[12]['parentid'] =0;
		
		$str = "<tr id='node-\$id' \$parentid_node>
                       <td style='padding-left:30px;'>\$spacer<input type='checkbox' name='menuid[]' value='\$id' level='\$level' \$checked onclick='javascript:checknode(this);'> \$name</td>
	    			</tr>";
		
		$menu->init($result);
		$string = $menu->get_tree(0, $str);
		 
		$this->assign("string" , $string);
		$this->assign("clist" , $clist);
		$this->display();
	
	}
	
	public function creport_pre(){

		$_SESSION['creport_type'] = I("post.type");
		$_SESSION['creport_stime'] = I("post.stime");
		$_SESSION['creport_etime'] = I("post.etime");
		$_SESSION['creport_comment'] = I("post.comment");

		$this->success("已记录");

	}

	/* 
	 * 生成预览
	 * type  1-文章统计  2-产品统计 3-产品访问量统计 4-产品添加时间统计  5-产品发布人统计 6-询盘统计 
	 * 		 7-询盘地域统计 8-询盘买家统计  9-页面浏览量统计  10-外商浏览量统计 11-浏览国家统计   12-浏览页面统计 13-发布链接数统计
	 *  */
	
	
	public function creport(){

		$type = $_SESSION['creport_type']; //I('type');                  //查询类别
		$stime = $_SESSION['creport_stime']; //I('stime');				  //时间选择
		$etime = $_SESSION['creport_etime']; //I('etime');

		$stime = $stime ? $stime : "2010-01-01";    //开始时间
		$etime = $etime ? $etime : date("Y-m-d",time());		  //结束时间

		$typearr = explode(",",$type);

		if($stime > $etime){
			$this->erorr("开始时间不能晚于结束时间");
		}

		foreach($typearr as $value){
			
			if($value ==1 ){      //文章统计
		 
				$backfun = A("Articlestatistics")->formateArticle(array("start_time"=>$stime,"end_time"=>$etime));
				$articleTime = $backfun['time'];
				$articleNumber = $backfun['num'];
				 
				$this->assign("articleTime", $articleTime ? json_encode($articleTime) : '');
				$this->assign("articleNumber" , $articleNumber ? json_encode($articleNumber) : '');
				$this->assign("articleContent", $backfun['content']);
				continue;
				
			}
			if ($value ==3){  //产品访问量统计
				$backfun = A("Productsstatistics")->formateProduct(array("stime"=>$stime,"etime"=>$etime));
				$productSurfList = $backfun['list'];
				$productSurfMsg = $backfun['msg'];
				$this->assign('productSurfList', $productSurfList);
				$this->assign("productSurfMsg",$productSurfMsg);
				continue;
			}
			 if ($value ==4){   //产品添加时间统计
				
				$backfun= A('Productsstatistics')->formateProTime(array('stime'=>$stime,'etime'=>$etime));
				$productAddList = $backfun['list'];
				foreach ($productAddList as $key => $value) {
					$total += $value['value'];
				}


				$this->assign("productAddList", $productAddList);
				$this->assign("total", $total);
				continue;
				
			}
			 if ($value ==5){   //产品发布人统计
				
				$backfun = A('Productsstatistics')->formateProAdd(array('stime'=>$stime,'etime'=>$etime));
				
				$productPubList = $backfun['list'];
				$this->assign('productPubList' , $productPubList ? json_encode($productPubList) : '');
				 continue;
				
			} 
			if ($value ==7){   //询盘地域统计
				
				$backfun = A('InquiryStatistics')->formateInquiry(array('stime'=>$stime,'etime'=>$etime));
				
				$guestList = $backfun['list'];
				$guestCountry = $backfun['country'];
				
				$this->assign("guestCountry" ,$guestCountry ? json_encode($guestCountry) : '');
				$this->assign('guestList' , $guestList ? json_encode($guestList) : '');
				continue;
				
			}
			 if ($value ==8){   //询盘买家统计
				
				$backfun = A('InquiryStatistics')->formateBuyer(array('stime'=>$stime,'etime'=>$etime));
				
				$guestBuyerTime = $backfun['time'];
				$guestBuyerNum = $backfun['num'];
				
				$this->assign("guestBuyerTime" ,$guestBuyerTime ? json_encode($guestBuyerTime) : '');
				$this->assign("guestBuyerNum" ,$guestBuyerNum ? json_encode($guestBuyerNum) : '');
				continue;
				 
			}
			 if ($value ==10){    //外商浏览量统计
				$where_data['start_time'] = $stime;
				$where_data['end_time'] = $etime;
				$backfun = $this->formateForeign_c($where_data);
				$this->assign("listcoun", $backfun['listcoun']);
				$this->assign("json_countryc", json_encode($backfun['json_countryc']));
				$this->assign("cmsg" , $backfun['cmsg']);
				$this->assign("total_con" , $backfun['total_con']);
				$this->assign("total_bro" , $backfun['total_bro']);

				$backfun = $this->formateForeign_ip($where_data);
				$this->assign("json_country", json_encode($backfun['json_country']));
				$this->assign("listip", $backfun['listip']);
				$this->assign("ipmsg" , $backfun['ipmsg']);
				continue;
			}
			 if ($value ==11){    //浏览国家统计
				$backfun = A('Foreignvis')->formateCountry(array('start_time'=>$stime,'end_time'=>$etime));


				$foreCountryList = $backfun['list'];
				$zcdata = array();
				$zcguojia = array();
				foreach($foreCountryList as $k=>$v){
					$zcdata[$k]['value'] = $v['clicks'];
					$zcdata[$k]['name']  = $v['country'];
					$zcguojia[]          = $v['country'];
				}
				$this->assign('zcdata', $zcdata);
				$this->assign('zcguojia', $zcguojia);

				$this->assign('forCountryList', $foreCountryList);
				$this->assign('country_total_con',$backfun['total_con']);
				$this->assign('country_total_bro',$backfun['total_bro']);
				continue;
			}

			if ($value ==12){    //浏览页面统计
				
				$backfun = A('Foreignvis')->formatePage(array('start_time'=>$stime, 'end_time'=>$etime));
				$forePageList = $backfun['list_old'];
				$zcfore  = array();
				$zcforev = array();
				foreach($forePageList as $k=>$v){
					$zcfore[$k]['name']  = $v['title'];
					$zcfore[$k]['value'] = $v['num'];
					$zcforev[]           = $v['title'];
				}
				$this->assign('zcfore',array_slice($zcfore,0,9));
				$this->assign('zcforev',array_slice($zcforev,0,9));
				$this->assign('forePageList',$forePageList);
				continue;
				
			}
			 if ($value ==13){     //发布链接数统计
				
				$backfun = M("ReleaseLinks")->field(" FROM_UNIXTIME(time, '%Y-%m-%d' ) as mtime, sum(num) as number")->where(" time >= ".strtotime($stime)." and time <=".strtotime($etime))->group("mtime")->order(" time asc ")->select();

				$total =0;
				foreach($backfun as $k=>$v){
					$arr['time'][] = $v['mtime'];
					$arr['number'][] = $v['number'];
					$total += $v['number'];
				}

				if($total ==0){
					$msg ="网站近期没有提交链接呦，产品没有曝光，会没有访客的，也会影响搜索引擎抓取网站的频率，建议定期发布网站链接，提升网站外部链接的数量，有利于提升网站权重和关键词排名。";
				}else if($total>0 && $total<=10){
					$msg = "发布链接数量较少，曝光度太低啦，建议增加发布数量，继续加油！";
				}else if ($total>10 && $total<20){
					$msg = "发布链接数量合理，能够提升搜索引擎抓取网站的频率和网站权重，同时有利于网站关键词排名喔。";
				}else if ($total>=20 && $total<30){
					$msg = "发布链接数量偏多，可以放慢点发布频率，来检查一下发布链接取得的效果了。";
				}else if ($total>30){
					$msg = "请注意！！近期发布链接数量过多，不如放慢速度，来检测一下网站效果了。链接发布过多，严重可能会遭到搜索引擎的惩罚的。";
				}

				$fLinkNum = $arr['number'];
				$fLinkTime = $arr['time'];
				$fLinkMsg = $msg;
				$this->assign("fLinkNum" , $fLinkNum ? json_encode($fLinkNum) : '');
				$this->assign("fLinkTime", $fLinkTime ? json_encode($fLinkTime) : '');
			 	$this->assign('fLinkMsg', $fLinkMsg);
			 	continue;
			}
		}
		$comment = $_SESSION['creport_comment'] ; //I('comment','','int');
		if($comment>0){
			$com = M("report_comment")->where(" id = $comment")->find();
			if($com){
				$this->assign("comment" , $com['text']);
			}
		}

	 	$site_options = get_site_options();
	 	$this->assign('site_options',$site_options);
		$this->assign("type" , $type);
		$this->assign('stime' , $stime);
		$this->assign('etime' ,$etime);
		$this->display();
	}

	/*
	*zckop新加导出pdf
	*/
	public function zcpppdf(){
		$data = I('post.');

		if($data['comment']){
			$data['comment'] =html_entity_decode($data['comment']);
		}
		if($data['articleContent']){                   //文章建议
			$data['articleContent'] = html_entity_decode($data['articleContent']);
		}
		if($data['productContent']){                   //产品访问量统计
			$data['productContent'] = html_entity_decode($data['productContent']);
		}
		if($data['ipContent']){                        //外商访问网站IP建议
			$data['ipContent'] = html_entity_decode($data['ipContent']);
		}
		if($data['cContent']){							// 外商访问网站点击量建议
			$data['cContent'] = html_entity_decode($data['cContent']);
		}
		if($data['linkContent']){                       //发布链接建议
			$data['linkContent'] = html_entity_decode($data['linkContent']);
		}

		if($data['product_add_content'])  $data['product_add_content'] = html_entity_decode($data['product_add_content']);   //产品添加时间建议
		if($data['product_add_user'])  $data['product_add_user'] = html_entity_decode($data['product_add_user']);            //产品发布人建议
		if($data['guestbook_position'])  $data['guestbook_position'] = html_entity_decode($data['guestbook_position']);      //询盘地域建议
		if($data['guestbook_buyer'])  $data['guestbook_buyer'] = html_entity_decode($data['guestbook_buyer']);               //询盘买家建议
		if($data['foreign_surf'])  $data['foreign_surf'] = html_entity_decode($data['foreign_surf']);						 //外商浏览量建议
		if($data['surf_country'])  $data['surf_country'] = html_entity_decode($data['surf_country']);						 //访问国家建议
		if($data['surf_webpage'])  $data['surf_webpage'] = html_entity_decode($data['surf_webpage']);						 //浏览页面建议


		
		$stime = $data['stime'];
		$etime = $data['etime'];
		
	 	$site_options = get_site_options();
	 	$this->assign('site_options',$site_options);
		$this->assign('stime' , $stime);
		$this->assign('etime' ,$etime);

		$type = explode("," ,$data['type']);

		$out_list = array();

		foreach($type as $k=>$v){
			if(!array_key_exists($v , $data['zcdata'])){
				//$data['zcdata'][$v] = $v;
				$out_list[$v] = "";
			}else{
				$out_list[$v] = $data['zcdata'][$v];
			}
		}

		ksort($out_list);

		/*
		*产品访问量统计
		*/
		if(  in_array(3 , $type ) ) {

			$backfun = A("Productsstatistics")->formateProduct(array("stime"=>$stime,"etime"=>$etime));
			$productSurfList = $backfun['list'];
			

			$this->assign("pro_vis_list",$productSurfList);
		}

		/*
		*产品添加时间统计
		*/
		if(  in_array(4 , $type )  ) {

			$backfun= A('Productsstatistics')->formateProTime(array('stime'=>$stime,'etime'=>$etime));
			$productAddList = $backfun['list'];
			foreach ($productAddList as $key => $value) {
				$total += $value['value'];
			}

			$this->assign("pro_type_list",$productAddList);
			$this->assign("total_pro_type",$total);
		}

		/*
		*外商浏览量统计和外商访问网站IP统计
		*/
		if ( in_array(10 , $type) ) {
//			$where_data['start_time'] = $stime;
//			$where_data['end_time'] = $etime;
//			$backfun = $this->formateForeign_c($where_data);
//			$this->assign("listcoun", $backfun['listcoun']);
//			$backfun = $this->formateForeign_ip($where_data);
//			$this->assign("listip", $backfun['listip']);
//
            $where_data['start_time'] = $stime;
            $where_data['end_time'] = $etime;
            $backfun = $this->formateForeign_c($where_data);
            $this->assign("listcoun", $backfun['listcoun']);
            $this->assign("json_countryc", json_encode($backfun['json_countryc']));
            $this->assign("cmsg" , $backfun['cmsg']);
            $this->assign("total_con" , $backfun['total_con']);
            $this->assign("total_bro" , $backfun['total_bro']);

            $backfun = $this->formateForeign_ip($where_data);
            $this->assign("json_country", json_encode($backfun['json_country']));
            $this->assign("listip", $backfun['listip']);
            $this->assign("ipmsg" , $backfun['ipmsg']);
		}

		/*
		*浏览国家统计
		*/
		if ( in_array(11 , $type) ) {
			$backfun = A('Foreignvis')->formateCountry(array('start_time'=>$stime,'end_time'=>$etime));
			$foreCountryList = $backfun['list'];
			$this->assign("country_list",$foreCountryList);
			$this->assign("total_con_country",$backfun['total_con']);
			$this->assign("total_bro_country",$backfun['total_bro']);
		}


		if( in_array(12 , $type ) ){   //浏览页面统计
			$backfun = A('Foreignvis')->formatePage(array('start_time'=>$stime, 'end_time'=>$etime));	
			$forePageList = $backfun['list_old'];

			$this->assign("forePageList",$forePageList);
		}


		$this->assign('data',$data);
		$this->assign('out_list' , $out_list);
		$str = $this->fetch();
		zcpdf($str);
	}
	
	
	 
	 
	/* 
	 * 评论列表
	 *  */
	public function commentList(){
		
		$count = M('ReportComment')->count();
		
		$page =  $this->page($count ,20);
		
		$clist = M('ReportComment')->order(" id desc ")->limit($page->firstRow.",".$page->listRows)->select();
		
		$this->assign("clist" , $clist);
		$this->assign("Pages" ,$page->show("admin"));
		$this->display();
	}
	
	/* 
	 * 添加评论
	 *  
	 *  */
	public function addComment(){
	 
		$this->display();
	}
	
 
	
	public function add_post(){
		
		if(IS_POST){
			extract(I("post."));
			
			if(!$title){
				$this->error("请填写评论标题 ");
			}
			
			if(!$content){
				$this->error("请填写评论内容");
			}
			
			$data = array();
			$data['title'] = $title;
			$data['text'] = $content;
			$data['addtime'] = time();
			$data['uid'] = $_SESSION['ADMIN_ID'];
			
			$status = M('ReportComment')->add($data);
			
			if($status){
				adminlog($_SESSION['ADMIN_ID'],"添加生成报表评论");
				$this->success('添加成功');
			}else{
				$this->error("添加失败");
			}
			
		}
	 
	}
	
	/* 
	 * 编辑评论
	 * 
	 * 
	 *  */
	
	public function editComment(){
		
		$id = I('id','','int');
		if(!$id){
			$this->error("所选评论不存在");
		}
		
		$comment = M('ReportComment')->where(" id = $id")->find();
		
		if(!$comment){
			$this->error("未找到评论");
		}
		$this->assign("comment",$comment);
		$this->display();
		
	}
	
	public function edit_post(){
		
		if(IS_POST){
			
			extract(I("post."));
			
			if(!$title){
				$this->error("请填写标题");
			}
			
			if(!$content){
				$this->error("请填写内容");
			}
			
			$status = M('ReportComment')->where(" id = $id")->save(array('title'=>$title,"text"=>$content, "uid"=>$_SESSION['ADMIN_ID']));
			
			if($status){
				$this->success("修改成功");
			}else{
				$this->error("修改失败");
			}
		}
		
		
	}
	
	
	public function delete(){
		 
		$where ="1";
		if( IS_POST){
			$where .= " and id in (".implode(",",I("post.ids")).")"; 
		}
		
		if( IS_GET){
			$where .=" and id = ".I('get.id','','int');
		} 
		
		$status = M('ReportComment')->where($where)->delete();
		
		if($status){
			$this->success("删除成功");
		}else{
			$this->error("删除失败");
		}
		
		 
	}
	
}