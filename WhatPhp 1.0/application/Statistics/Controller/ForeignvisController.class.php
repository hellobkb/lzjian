<?php
/*
 * 外商浏览统计数据
 * @author sdcode
 * @time 20160602
 *   
 **/
namespace Statistics\Controller;
use Common\Controller\AdminbaseController;
class ForeignvisController extends AdminbaseController{
	
	public function index_old(){
		
		$backfun = $this->formateForeign($_POST);
		$this->assign("json_country", json_encode($backfun['json_country']));
		$this->assign("json_nums", json_encode($backfun['json_nums']));
		$this->assign("ipmsg" , $backfun['ipmsg']);
		$this->assign("json_countryc", json_encode($backfun['json_countryc']));
		$this->assign("json_numsc", json_encode($backfun['json_numsc']));
		$this->assign("cmsg" , $backfun['cmsg']);
		$this->assign("start_time" , $backfun['stime']);
		$this->assign("end_time" , $backfun['etime']);
		$this->display();
	}
	public function index(){

		if (IS_POST) {
			$_GET = $post = I('post.');
			$backfun = $this->formateForeign_c($post);
		}

		if (IS_GET) {
			$post = I('get.');
			$backfun = $this->formateForeign_c($post);
		}
		
		
		$this->assign("listcoun", $backfun['listcoun']);
		$this->assign("json_countryc", json_encode($backfun['json_countryc']));
		$this->assign("cmsg" , $backfun['cmsg']);
		$this->assign("start_time" , $backfun['stime']?$backfun['stime']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("end_time" , $backfun['etime']?$backfun['etime']:date("Y-m-d", time()));
		$this->assign("Page" , $backfun['Page']);

		$this->assign("total_con" , $backfun['total_con']);
		$this->assign("total_bro" , $backfun['total_bro']);
		$this->assign('where',base64_encode(json_encode($backfun['where'])));
		$this->display();
	}
	public function indexip(){
		$backfun = $this->formateForeign_ip($_POST);
		$this->assign("json_country", json_encode($backfun['json_country']));
		$this->assign("listip", $backfun['listip']);
		$this->assign("ipmsg" , $backfun['ipmsg']);
		$this->assign("start_time" , $backfun['stime']);
		$this->assign("end_time" , $backfun['etime']);
		$this->assign("Page" , $backfun['Page']);
		$this->display();
	}
	public function formateForeign_c($post){
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
		
		//点击量
		$count = M('Visits')->field("count(ip) as ip,sum(`clicks`) as `numclick`,FROM_UNIXTIME(time, '%Y-%m-%d' ) as time")->group("time")->where($where)->order('time asc')->select();

		foreach ($count as $key => $value) {
			$total_con += $value['ip'];
			$total_bro += $value['numclick'];
		}
		$page = $this->page(count($count), 15);
		$list_c = M('Visits')->field("count(ip) as ip,sum(`clicks`) as `numclick`,FROM_UNIXTIME(time, '%Y-%m-%d' ) as time")->group("time")->where($where)->order('time asc')->limit($page->firstRow . ',' . $page->listRows)->select();
		$Page = $page->show('Admin');//print_r($list_c);
		$nums=array();
		foreach ($list_c as $key => $value) {
			$arrc['countrys'][] = $value['country'];
			$arrc['nums'][] = $value['numclick'];
			$nums[] = $value['numclick'];
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
		return array("json_countryc"=>$arrc['countrys'], "cmsg"=>$cmsg , "stime"=>$stime, "etime"=>$etime,"listcoun"=>$list_c, "Page"=>$Page, 'total_con'=>$total_con, 'total_bro'=>$total_bro,"where"=>$where);
		
	}
	function excelForeign_c(){
		$where = I('get.where');
		$where = json_decode(base64_decode($where),true);
		$list = M('Visits')->field("count(ip) as ip,sum(`clicks`) as `numclick`,FROM_UNIXTIME(time, '%Y-%m-%d' ) as time")->group("time")->where($where)->order('time asc')->select();

		foreach ($list as $key => $value) {
			$total_con += $value['ip'];
			$total_bro += $value['numclick'];
		}

		$arr = array(array('时间','会话次数', '网页浏览次数'));
		foreach($list as $v){
			$brr = array();
			$brr[] = $v['time'];
			$brr[] = $v['ip'];
			$brr[] = $v['numclick'];
			$arr[] = $brr;
		}

		zcexcel($arr);
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
		$count = M('Visits')->field("country, count(`ip`) as `num`,time")->group('country')->where($where)->order('time asc')->count();
		$page = $this->page(count($count), 20);
		$list = M('Visits')->field("country, count(`ip`) as `num`,time")->group('country')->where($where)->order('time asc')->limit($page->firstRow . ',' . $page->listRows)->select();
		$Page = $page->show('Admin');
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
	 * IP统计，访问量统计数据
	 * @author cx
	 * @time 20160711
	 * 
	 */
	
	public function formateForeign($post){
		
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
		
		$list = M('Visits')->field("country, count(`ip`) as `num`,time")->group('country')->where($where)->order('time asc')->select();
		$iptotal =0;
		foreach ($list as $key => $value) {
			$arr['countrys'][] = $value['country'];
			$arr['nums'][] = $value['num'];
			$iptotal += $value['num'];
		}
		
		if($stime && $etime){
			$weeks = (strtotime($etime) - strtotime($stime))/(86400*7);
		}else{
			$weeks = (strtotime("today") - strtotime("2010-01-01"))/(86400*7); 
		}
		

		if($iptotal/$weeks <40){
			$ipmsg = "网站访问量太低了，您需要从各个方面提升，加大工作力度，增加网站的曝光度，增加访问量。";
		}else if ($iptotal/$weeks <70){
			$ipmsg = "网站访问量很低，需要加油，多做推广工作，提升关键词，增加曝光度，增加访问量。";
		}else if ($iptotal/$weeks <=100){
			$ipmsg = "网站访问量及格了，还需要加油啊，继续努力，你会有更多的访客。";
		}else if ($iptotal/$weeks <=140){
			$ipmsg = "网站访问量进步了，你的网站已经有一定的曝光度了，这是好兆头，但是仍然需要提升，接下来你需要继续做好推广工作，使访问量迈向新的台阶。";
		}else if ($iptotal/$weeks >140){
			$ipmsg = "恭喜你！你的网站每天都有很稳定的访问量，说明您的网站得到了搜索引擎的认可，加油，您还有很大的潜力，继续增加访问量，增加询盘转化量。";
		}
		
		//点击量
		$list_c = M('Visits')->field("country, sum(`clicks`) as `numclick`,time")->group('country')->where($where)->order('time asc')->select();


		$nums=array();
		foreach ($list_c as $key => $value) {
			
			$arrc['countrys'][] = $value['country'];
			$arrc['nums'][] = $value['numclick'];
			$nums[] = $value['numclick'];
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

		return array("json_country"=>$arr['countrys'],"json_nums"=>$arr['nums'], "ipmsg"=>$ipmsg , "json_countryc"=>$arrc['countrys'], "json_numsc"=>$arrc['nums'],"cmsg"=>$cmsg , "stime"=>$stime, "etime"=>$etime ,"listip"=>$list,"listcoun"=>$list_c);
		
	}
	
	//浏览国家统计
	public function country(){

		
		if (IS_POST) {
			$_GET = $post = I('post.');
			$backfun = $this->formateCountry($post);
		}

		if (IS_GET) {
			$post = I('get.');
			$backfun = $this->formateCountry($post);
		}


		$bt_rel = $this->formateCountry_bt($post);
		$this->assign('country_bt',json_encode($bt_rel['country_bt']));
		$this->assign('country_data_bt',json_encode($bt_rel['rel_bt']));
		$this->assign("start_time" , $backfun['start_time']?$backfun['start_time']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("end_time" ,$backfun['end_time']?$backfun['end_time']:date("Y-m-d", time()));
		$this->assign('list',$backfun['list']);
		$this->assign('Page',$backfun['Page']);
		$this->assign('total_con',$backfun['total_con']);
		$this->assign('total_bro',$backfun['total_bro']);
		$this->assign('where',base64_encode(json_encode($backfun['where'])));
		$this->display();
	}

	
	/*
	 * 浏览国家统计数据
	 * @author cx
	 * @time 20160711
	 * 
	 *   */
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

		$data['country_bt'] = $total_country;
		$data['rel_bt'] = $total_list_data;
		
		return $data;

	}


	
	public function formateCountry($post=''){
		
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

		$count = M('Visits')->field("count(*) as value, country, sum(clicks) as clicks")->group('country')->where($where)->order("time asc")->select();

		foreach ($count as $key => $value) {
			$total_con += $value['value'];
			$total_bro += $value['clicks'];
		}

		$page = $this->page(count($count), 15);

		$list = M('Visits')->field("count(*) as value, country, sum(clicks) as clicks")->group('country')->where($where)->order("time asc")->limit($page->firstRow . ',' . $page->listRows)->select();

		$Page = $page->show('Admin');

		return array("list"=>$list , "start_time"=>$stime, "end_time"=>$etime, "Page"=>$Page,"total_con"=>$total_con, "total_bro"=>$total_bro, "where"=>$where);
	}
	
	function excelCountry(){
		$where = I('get.where');
		$where = json_decode(base64_decode($where),true);
		$list = M('Visits')->field("count(*) as value, country, sum(clicks) as clicks")->group('country')->where($where)->order("time asc")->select();

		foreach ($list as $key => $value) {
			$total_con += $value['value'];
			$total_bro += $value['clicks'];
		}

		$arr = array(array('国家','会话次数','会话次数占比', '网页浏览次数', '网页浏览次数占比'));
		foreach($list as $v){
			$brr = array();
			$brr[] = $v['country'];
			$brr[] = $v['value'];
			$brr[] = round($v['value']*100/$total_con).'%';
			$brr[] = $v['clicks'];
			$brr[] = round($v['clicks']*100/$total_bro).'%';
			$arr[] = $brr;
		}

		zcexcel($arr);
	}


	
	public function pagetj(){

		if (IS_POST) {
			$_GET = $post = I('post.');
			$backfun = $this->formatePage($post);
		}

		if (IS_GET) {
			$post = I('get.');
			$backfun = $this->formatePage($post);
		}

		
		$bt_rel = $this->formatePage_bt($post);
		
		$this->assign('title_bt',json_encode($bt_rel['title_bt']));
		$this->assign('rel_page_bt',json_encode($bt_rel['rel_page_bt']));
		

		$this->assign("list", $backfun['list']);
		$this->assign("list_old", $backfun['list_old']);
		$this->assign("start_time", $backfun['stime']?$backfun['stime']:date('Y-m-01', strtotime(date("Y-m-d"))));
		$this->assign("end_time", $backfun['etime']?$backfun['etime']:date("Y-m-d", time()));
		$this->assign("page", $backfun['page']);
		$this->assign("where", base64_encode(json_encode($backfun['where'])));
		$this->display();
	}

	/*
	 * 浏览页面统计
	 * @author cx
	 * @time 20160711
	 *   
	 *   
	 *   */

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
	
	public function formatePage($post){
		
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

		$list_old = M('Visits')->field("title, url, sum(`clicks`) as `num`")->where($where)->group('title')->order('num desc')->select();

		$page = $this->page(count($list_old), 15);

		$list = M('Visits')->field("title, url, sum(`clicks`) as `num`")->where($where)->group('title')->order('num desc')->limit($page->firstRow . ',' . $page->listRows)->select();
		foreach ($list as $key => $value) {
				$sum += $value['num'];
		}
		$zj = array('title'=>'总计','url'=>'-----','num'=>$sum);
		array_unshift($list,$zj);

		$Page = $page->show('Admin');

		return array("list"=>$list, "stime"=>$stime,"etime"=>$etime, "page"=>$Page, "where"=>$where,"list_old"=>$list_old);
		
	}

	function excelPage(){
		$where = I('get.where');
		$where = json_decode(base64_decode($where),true);

		$list = M('Visits')->field("title, url, sum(`clicks`) as `num`")->where($where)->group('title')->order('num desc')->select();
		$arr = array(array('页面','网址','访问数量'));
		foreach($list as $v){
			$brr = array();
			$brr[] = $v['title'];
			$brr[] = $v['url'];
			$brr[] = $v['num'];
			$arr[] = $brr;
		}

		zcexcel($arr);
	}
}