<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class MainController extends AdminbaseController {
	
    public function index(){
        
        $tpl = 'index';
    	$mysql= M()->query("select VERSION() as version");
    	$mysql=$mysql[0]['version'];
    	$mysql=empty($mysql)?L('UNKNOWN'):$mysql;

        $benyue = date('Y-m-01 00:00:00',time());
        $byxps = M('Guestbook')->where('unix_timestamp(`createtime`) > unix_timestamp("'.$benyue.'")')->count();
        $this->assign('byxps',$byxps);

        $benyuesjc = strtotime($benyue);
        $byfksl = M('Visits')->where('time > '.$benyuesjc)->sum('clicks');
        $this->assign('byfksl',$byfksl);

    	//server infomaions
    	$info = array(
    			L('OPERATING_SYSTEM') => PHP_OS,
    			L('OPERATING_ENVIRONMENT') => $_SERVER["SERVER_SOFTWARE"],
    			L('PHP_RUN_MODE') => php_sapi_name(),
    			L('MYSQL_VERSION') =>$mysql,
    			L('PROGRAM_VERSION') => SIMPLEWIND_CMF_VERSION . "&nbsp;&nbsp;&nbsp; [<a href='http://www.thinkcmf.com' target='_blank'>ThinkCMF</a>]",
    			L('UPLOAD_MAX_FILESIZE') => ini_get('upload_max_filesize'),
    			L('MAX_EXECUTION_TIME') => ini_get('max_execution_time') . "s",
    			L('DISK_FREE_SPACE') => round((@disk_free_space(".") / (1024 * 1024)), 2) . 'M',
    	);
 
    	//公共部分数据
    	//获取咨询
    	$this->curlGetInfo();
    	
    	$this->assign('server_info', $info);
    	$this->display(":Main/$tpl");
    }
    
 
    /* 
     * Curl 
     * 
     * @param qnum 前沿资讯返回条数，不传默认返回6
     * @param tnum 通知返回条数，不传默认返回4
     * @param pnum 培训课堂返回条数，不传默认返回6
     *  */
    function curlGetInfo(){

    	$now = time();
    	$status = M('Reminder')->where("status = 0 and endtime < $now")->save(array("status"=>1)); 
    	$count = M('Reminder')->where(" status =0 and btime < $now ")->count();
    	$list = M("Reminder")->where(" status=0 and btime < $now")->select();
    	
    	$temp = array();
    	foreach($list as $value){
    		$val =array();
    		if($value['type'] ==1 ){ //服务器
    			$val['post_title'] = "服务器将于 ".date("Y-m-d", $value['endtime'])." 到期";
    			$val['tid'] =111;
    			$val['url'] ="";
    			
    		}elseif ($value['type'] ==2){ //域名
    			$val['post_title'] = "域名将于".date("Y-m-d",$value['endtime'])."到期";
    			$val['tid'] =111;
    			$val['url'] ="";
    		}
    		
    		$temp[] = $val;
    	}
    	 
    	
    	$url = "http://www.xinguwen.com/video/crm/index";
    	$ch = curl_init();
    	curl_setopt($ch, CURLOPT_URL, $url);
    	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    	curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
    	curl_setopt($ch, CURLOPT_POST, 1);
    	curl_setopt($ch, CURLOPT_HEADER, 0);
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    	curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array("qnum"=>6,"tnum"=>6-$count,"pnum"=>6)));
    	 
    	$return  = curl_exec($ch);
    	curl_close($ch);
    	 
    	$datalist = json_decode($return,true);
    	 
    	$this->assign("qlist" , $datalist['qlist'] ? $datalist['qlist'] : array(
    		"0"=>array(
    			"id"=>0,
    			"post_title"=>"获取数据失败",
    			"url"=>"",
    		),
    	));
    	 
    	$this->assign("tlist" , $datalist['tlist'] ? ($temp ? array_merge($temp, $datalist['tlist']) : $datalist['tlist']) : array(
    			"0"=>array(
    					"id"=>0,
    					"post_title"=>"获取数据失败",
    					"url"=>"",
    			),
    	));
    	
    	$this->assign("plist" ,$datalist['plist'] ? $datalist['plist'] : array(
    			"0"=>array(
    					"id"=>0,
    					"post_title"=>"获取数据失败",
    					"url"=>"",
    			),
    	));
    	 
    }
    

    
}