<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class MainController extends AdminbaseController {
	
    public function index(){
        $tpl = $this->get_admin_index();
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
    	
    	//各角色数据
    	$this->getTplValue($tpl);
    	 
    	//公共部分数据
    	//获取咨询
    	$this->curlGetInfo();
    	
    	$this->assign('server_info', $info);
    	$this->display(":Main/$tpl");
    }
    
    
    /* 
     * 后台升级提醒
     *  
     *  */
    
    public function getVersion(){
    	 
        exit;

    	$url = "http://192.168.0.209/demo/teset.php";
    	$ch = curl_init($url);
    	
    	curl_setopt($ch,CURLOPT_URL,$url);
    	curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
    	curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);;
    	$res=curl_exec($ch);
    	
    	curl_close($ch);
    	
    	if(version_compare(SIMPLEWIND_CMF_VERSION, $res ,"<")){
    		$backfun['status'] =1;
    		$backfun['msg'] = "最新版本为:".$res.",请更新到最新版本！";
    		 echo json_encode($backfun);die;
    	}else{
    		$backfun['status'] =0;
    		 
    		echo json_encode($backfun);die;
    	}
    	 
    }
    public function get_admin_index(){
        $admin_user = sp_get_current_admin_id();
        if($admin_user == 1){
            $main = 'main_boss';
            return $main;
        }
        $where_admin['user_id'] = $admin_user;
        $datainfo = M('RoleUser')
                ->where($where_admin)
                ->table(C("DB_PREFIX").'role_user ru')
                ->join('left join '.C("DB_PREFIX").'role r on r.id=ru.role_id')
                ->field("r.*")
                ->select();
        foreach ($datainfo as $key => $value) {
            $ym[] = $value['admin_main_index'];
        }
        if(in_array('main_boss', $ym)){
            // $main = 'main_boss';
            $main = 'index';
            return $main;
        }
        if(in_array('main_manager', $ym)){
            $main = 'main_manager';
            return $main;
        } 
        if(in_array('main_salesman', $ym)){
            $main = 'main_salesman';
            return $main;
        } 
        if(in_array('main_yxtj', $ym)){
            $main = 'main_yxtj';
            return $main;
        } 
        if(in_array('index', $ym)){
            $main = 'index';
            return $main;
        } 
        return $main;

    }
    
    
    /* 
     * 根据不同的角色，得到不同的数据
     * 
     * @author cx
     * @time 20161031
     * @param tpl string 
     *  
     *  */
    
    function getTplValue($tpl){
    	
    	$time = time();
    	
    	$start = strtotime(date("Y-m-01", $time));
    	$end = strtotime( date("Y-m-d", $start)." +1 month") -1 ;
    	 
    	$options= M('crmOption')->find();
    	
    	$fday = $options['fly_day'];     //未联系飞出间隔
    	$bday = $options['begin_day'];   //已联系飞出间隔
    	$rday = $options['remind_day'];  //开始提醒飞出天数
    	
    	if($tpl =="index"){   //默认主页
    		
    		
    	}elseif ($tpl == "main_boss" ){  //老板页面
    		
    		//月新增线索阶段客户
    		$monthxz = M("client")->where(" addtime >= $start and addtime<=$end and status!=3 ")->count();
    		//新增已成单客户数量
    		$orderxz = M("client")->where("is_order=2 and order_time >= $start and order_time<=$end ")->count();
    		//阶段变化客户数量
    		$levelChange = M("clientStatus")->where(" confirm=1 and con_time >=$start and con_time<=$end ")->count();
    		//月新增订单数量
    		$orderIncrease = M("clientOrder")->where("addtime>=$start and addtime<=$end and status!=3")->count();
    		//合同金额
    		$contractMoney = M("clientOrder")->where("addtime>=$start and addtime<=$end and status!=3")->field("sum(totalmoney) as money")->find();
    		//实际回款金额
    		$refundMoney = M("orderRefund")->where(" con_time>=$start and con_time<=$end and status=1")->field("sum(refund_money) as money ")->find();
    		//3个月未返单
    		$noOrder = zccurl('Portal/Crm/monthNoOrder',array('where'=>1,'time'=>$time));
    		//出运提醒
    		$orderShip = A("Crm/Cdata")->shippingRemind(" 1 ", $time);
    		//今日沟通提醒
    		$nextContactNum = A("Crm/Cdata")->todayRemind( 1 , "" ,$time );
    		
    		$this->assign(array(
    			"monthxz"=>$monthxz ? $monthxz :0 ,
    			"orderxz"=>$orderxz ? $orderxz : 0,
    			"levelChange"=>$levelChange ? $levelChange : 0,
    			"orderIncrease"=>$orderIncrease ? $orderIncrease: 0,
    			"contractMoney"=>$contractMoney['money'] ?$this->formateMoney($contractMoney['money']): "<span>0</span>美元" ,
    			"refundMoney"=>$refundMoney['money'] ? $this->formateMoney($refundMoney['money']):"<span>0</span>美元",
    			"noOrder"=>$noOrder['noOrder'],
    			"orderShip"=>$orderShip,
    			"nextContactNum"=>$nextContactNum,
    		));
    		
    		//本财年目标总情况
    		$companyYear = zccurl('Portal/Crm/getCompanyYear',array('mids'=>$mids,'uids'=>$uids));
    		$this->assign("yearList", json_encode($companyYear['yearList']));
    		$this->assign("targetList" , json_encode($companyYear['targetList']));
    		$this->assign("currentList" , json_encode($companyYear['currentList']));
    		$this->assign("foreList" ,json_encode($companyYear['foreList']));
    		
    		
    		//各分公司完成情况
    		$branches = zccurl('Portal/Crm/getDeparnts',array('year'=>I("post.year")));
    		 
    		$this->assign("company",json_encode($branches['company']));
    		$this->assign("tList", json_encode($branches['tList']));
    		$this->assign("cList" ,json_encode($branches['cList']));
    		$this->assign("fList", json_encode($branches['fList']));
    		
    		//各分公司完成占比
    		$data = array();
    		foreach($branches['company'] as $key=>$value){
    			$data[$key]['value'] = $branches['cList'][$key];
    			$data[$key]['name'] = $value;
    		}
    		 
    		$this->assign("company2" ,json_encode($branches['company']));
    		$this->assign("cList2", json_encode($data));
    		
    	}elseif ($tpl == "main_manager"){ //业务经理
    		
    		$uid = $_SESSION['ADMIN_ID'];
    		//月新增线索阶段客户
    		$monthxz = M("client")->where(" addtime>=$start and addtime<=$end and status=2 and (uid=$uid or mid=$uid) and is_order=1 ")->count();
    		//新增已成单客户数量
    		$orderxz = M("client")->where(" is_order=2 and order_time >=$start and order_time<=$end and (uid=$uid or mid=$uid) ")->count();
    		//阶段变化客户数量
    		$levelChange = M("clientStatus")->alias("cs")->join(C("DB_PREFIX")."client as c on cs.cid=c.id ","LEFT")->where("cs.confirm=1 and cs.con_time>=$start and cs.con_time<=$end and cs.con_user = $uid and c.is_order=1 ")->count();
    		//月新增订单数量
    		$orderIncrease = M("clientOrder")->where("addtime>=$start and addtime<=$end and status!=3 and mid=$uid")->count();
    		//合同金额
    		$contractMoney = M("clientOrder")->where("addtime>=$start and addtime<=$end and mid=$uid and status!=3")->field("sum(totalmoney) as money")->find();
    		//实际回款金额
    		$refundMoney = M("orderRefund")->alias("orf")->join(C("DB_PREFIX")."client_order as co on orf.order_sn=co.order_sn")->where(" orf.con_time>=$start and orf.con_time<=$end and orf.status=1 and co.mid=$uid ")->field("sum(orf.refund_money) as money ")->find();
    		
    		//3个月未返单客户
    		$underUser = M("crmUser")->where(" mid = $uid ")->select();
    		$underUserStr = "";
    		foreach($underUser as $user){
    			$underUserStr .= ",".$user['uid'];
    		}

    		$noOrder =  zccurl('Portal/Crm/monthNoOrder',array('where'=>" uid in (".ltrim($underUserStr,",").")",'time'=>$time));
    		//出运提醒 
    		$orderShip = A("Crm/Cdata")->shippingRemind(" uid in (".ltrim($underUserStr,",").")", $time);
    		//今日沟通提醒
    		$nextContactNum = A("Crm/Cdata")->todayRemind( 2 , $uid ,$time );
    		
    		$this->assign(array(
    			"monthxz"=>$monthxz ? $monthxz :0 ,
    			"orderxz"=>$orderxz ? $orderxz : 0,
    			"levelChange"=>$levelChange ? $levelChange : 0,
    			"orderIncrease"=>$orderIncrease ? $orderIncrease: 0,
    			"contractMoney"=>$contractMoney['money'] ? $this->formateMoney($contractMoney['money']):"<span>0</span>美元" ,
    			"refundMoney"=>$refundMoney['money'] ? $this->formateMoney($refundMoney['money']):"<span>0</span>美元",
    			"noOrder"=>$noOrder['noOrder'],
    			"orderShip"=>$orderShip,
    			"nextContactNum"=>$nextContactNum,
    		));
    		 
    		
    		
    		//本财年目标总情况
    		$total = zccurl('Portal/Crm/getCompanyYear',array('uids'=>$uid));
    		$this->assign("yearList", json_encode($total['yearList']));
    		$this->assign("targetList" , json_encode($total['targetList']));
    		$this->assign("currentList" , json_encode($total['currentList']));
    		$this->assign("foreList" ,json_encode($total['foreList']));
    		
    		//各业务员完成情况
    		$sales = A("Crm/Cdata")->getSales($uid);
    		 
    		$this->assign("company",json_encode($sales['company']));
    		$this->assign("cList" ,json_encode($sales['clist']));
    		$this->assign("fList", json_encode($sales['flist']));
    		
    		 
    		//各业务员完成占比情况
    		//$saleman = A("Crm/Cdata")->getSaleman($uid);
            $saleman = zccurl('Portal/Crm/getSaleman',array('mid'=>$uid));
    		 
    		$this->assign("company2" ,json_encode($saleman['name']));
    		$this->assign("cList2" ,json_encode($saleman['data']));
    		
    		//业务经理下业务员各阶段用户漏斗图
    		
    		$underUserStr = ltrim($underUserStr ,",");
    		$sale =  zccurl('Portal/Crm/getSaleFun',array('uid'=>$underUserStr ,"mid"=>$uid));  //A("Crm/Cdata")->getSaleFun($underUserStr, $uid);

    		$this->assign("level", json_encode($sale['names']));
    		$this->assign("data", json_encode($sale['data']));
    		
    		
    		
    	}elseif ($tpl =="main_salesman"){  //业务员
    		 
    		$uid = $_SESSION['ADMIN_ID'];
    	  
			$clist = M("Client")->alias("c")->join(C('DB_PREFIX')."users as u on c.uid=u.id",'LEFT')->join(C('DB_PREFIX')."users as uu on c.mid=uu.id",'LEFT')->field(" c.id,c.cname, c.uid, u.user_login, c.gtime,uu.user_login as mname")->where(" c.status=2 and c.uid=$uid  and c.is_order=1 ")->select();
			 
			if($fday !=999 && $bday !=999){
			
				foreach($clist as $value){
						
					 
						$ifcon = M("ClientContact")->where(" uid= $value[uid] and cid=$value[id]")->order(" id desc")->find();
						
						if($ifcon){
							if($time - ($bday-$rday)*86400 >$ifcon['addtime']){
								$value['begin_date'] = $ifcon['addtime'] + $rday*86400;
								$value['end_date'] = $ifcon['addtime'] + $bday*86400;
								$outlist[]= $value;
							}
						}else {
							if($time - ($fday-$rday)*86400 >$value['gtime']){
								$value['begin_date'] = $value['gtime'] +$rday*86400;   //开始提醒时间
								$value['end_date'] = $value['gtime'] + $fday*86400;    //飞出时间
								$outlist[] =$value;
							}
						}
					 
	 	
				}
			
			}else if ($fday ==999 && $bday !=999){
					
				foreach($clist as $value){
					
					 
						$ifcon = M('ClientContact')->where(" uid=$value[uid] and cid=$value[id]")->order(" id desc ")->find();
						if($ifcon){
							if($time - ($bday-$rday)*86400 >$ifcon['addtime']){
								$value['begin_date'] = $ifcon['addtime'] + $rday*86400;
								$value['end_date'] = $ifcon['addtime'] + $bday*86400;
								$outlist[]= $value;
							}
						}
					 
				}

			}else if($fday!=999 && $bday ==999){
			
				foreach($clist as $value){
					
					 
						$ifcon = M('ClientContact')->where(" uid=$value[uid] and cid=$value[id]")->order(" id desc")->find();
						if(!$ifcon){
							if($time - ($fday -$rday)* 86400> $value['gtime']){
								$value['begin_date'] = $value['gtime'] +$rday*86400;   //开始提醒时间
								$value['end_date'] = $value['gtime'] + $fday*86400;    //飞出时间
								$outlist[]=$value;
							}
						}
				}
			}
		 
    		 
    		$this->assign("flynum" ,count($outlist));
    		
    		//3个月未反单用户
    		$noOrder = zccurl('Portal/Crm/monthNoOrder',array('where'=>" uid = $uid ",'time'=>$time));
    		$this->assign("noOrder" ,$noOrder['noOrder']);
    		 
    		//各阶段客户总数
    		$levelCount = M("client")->where(" uid =$uid  and status=2 and is_order=1 ")->count();
    		//新增阶段变化客户数量
    		$levelChange = M("clientStatus")->alias("cs")->join(C("DB_PREFIX")."client as c on cs.cid=c.id ","LEFT")->where("cs.confirm=1 and cs.con_time>=$start and cs.con_time<=$end and cs.uid = $uid and c.is_order=1 ")->count();
    		//新增线索阶段客户数量
    		$clientxz = M("client")->where(" addtime>=$start and addtime<=$end and status=2 and uid=$uid  and is_order=1 ")->count();
    		//新增已成交客户数量
    		$orderxz = M("client")->where(" is_order=2 and order_time >=$start and order_time<=$end and uid=$uid  and is_order=1 ")->count();
    		//出运提醒
    		$ordership = A("Crm/Cdata")->shippingRemind(" uid = $uid " , $time) ; //M("clientOrder")->where("shipping<".($time+$ship)." and status=0 and shipping > $time and uid =$uid ")->count();
    		

            //今日沟通提醒
    		$contact_count = A("Crm/Cdata")->todayRemind( 3 , $uid ,$time );
    		 
    		//团队内排名,计算团队内所有业务员本月回款排名
    		$muser = M("crmUser")->where("uid=$uid")->find();
    		$group = M("crmUser")->where("mid ='".$muser['mid']."'")->select();
    		
    		$month_s = strtotime(date("Y-m-01", $time));
    		$month_e = strtotime(date("Y-m-01",$time)." +1 month");
    		
    		//找出每个业务员的本月业绩
    		
    		$temp = array();
    		$ids = array();
    		$price = array();
    		foreach($group as $k=>$v){
    			$money = M("orderRefund")->where("uid= $v[uid] and con_time >$month_s and con_time<$month_e ")->field(" sum(refund_money) as money ")->find();
    			$temp[$k]['uid'] = $v['uid'];
    			$temp[$k]['money'] = $money['money'];
    		}
    		
    		foreach($temp as $k2=>$v2){
    			$ids[$k2] = $value['uid'];
    			$price[$k2] = $v2['money'];
    		}
    		
    		array_multisort($price,SORT_NUMERIC,SORT_DESC,$ids,SORT_STRING,SORT_ASC,$temp);
    		 
    		foreach($temp as $k3=>$v3){
    			
    			if($v3['uid'] ==$uid){
    				$rank = $k3+1;
    				break;
    			}
    		}
    		 
    		$this->assign(array(
    				"levelCount"=>$levelCount ? $levelCount : 0,
    				"levelChange"=>$levelChange ? $levelChange : 0 ,
    				"clientxz"=>$clientxz ? $clientxz :0 ,
    				"orderxz"=>$orderxz ? $orderxz : 0,
    				"ordership"=>$ordership ? $ordership : 0,
    				"nextContactNum"=>$contact_count,
    				"rank"=>$rank,
    		));
    		 
    		//查询manager
    		$manager = M("crmUser")->where(" uid = $uid")->find();
    		 
    		$total = zccurl('Portal/Crm/getCompanyYear',array('mids'=>$manager['mid'],'uids'=>$uid));
    		$this->assign("yearList", json_encode($total['yearList']));
    		$this->assign("currentList" , json_encode($total['currentList']));
    		$this->assign("foreList" ,json_encode($total['foreList']));
    		 
    		//业务员销售漏斗
    		$sale = zccurl('Portal/Crm/getSaleFun',array('uid'=>$uid)); //A("Crm/Cdata")->getSaleFun($uid);
    			
    		$this->assign("level", json_encode($sale['names']));
    		$this->assign("data", json_encode($sale['data']));
    		$this->assign("salename", $_SESSION['user_login']);
    		  
    	}elseif ($tpl =="main_yxtj"){
    		 
    		$start = strtotime(date("Y-m-d", $time). " -7 day");
    		$end = strtotime(date("Y-m-d",$time) ." +1 day");
    		 
    		//最近7天访问量 ,累计访问量
    		$sDayNum = M('visits')->field("sum(`clicks`) as `numclick`")->where("time>$start and time<$end")->find();
    		$tDayNum = M("visits")->field("sum(clicks) as numclick ")->find();
    		 
    		$this->assign("sDayNum", $sDayNum['numclick'] ? $sDayNum['numclick'] : 0);
    		$this->assign("tDayNum", $tDayNum['numclick'] ? $tDayNum['numclick'] : 0);

    		//最近7天文章发布数量，累计文章数量
    		$article_sDayNum = M("article")->where("inputtime> $start and inputtime<$end ")->count();
    		$article_tDayNum = M("article")->count();
    		 
    		$this->assign("article_sDayNum", $article_sDayNum ? $article_sDayNum :0);
    		$this->assign("article_tDayNum", $article_tDayNum ? $article_tDayNum :0);
    		
    		//最近7天产品发布数量， 累计产品数量
    		$pro_sDayNum = M("product")->where(" inputtime> $start and inputtime<$end")->count();
    		$pro_tDayNum = M("product")->count();
    		
    		$this->assign("pro_sDayNum", $pro_sDayNum ? $pro_sDayNum :0);
    		$this->assign("pro_tDayNum", $pro_tDayNum ? $pro_tDayNum :0);
    		
    		//最近7天链接发布数量, 累计链接数量
    		$where['time'] =array(array('EGT',date("Y-m-d", $start)),array('LT',date("Y-m-d", $end)));
    		$link_sDayNum = M("ReleaseLinks")->where($where)->field("sum(num) as number")->find();
    		$link_tDayNum = M("ReleaseLinks")->field("sum(num) as number")->find();
    		  
            

    		$this->assign("link_sDayNum", $link_sDayNum['number'] ? $link_sDayNum['number'] :0);
    		$this->assign("link_tDayNum", $link_tDayNum['number'] ? $link_tDayNum['number'] :0);
    		
    		//最近7天社交媒体分享数量, 累计分享数量(目前没有)
    		
    		
    		
    		//外商浏览量统计
    		 
    		$this->assign("stime" ,date("Y-m-d",strtotime(date("Y-m-d",$time)." -30 day") ));
    		$this->assign("etime" ,date("Y-m-d", strtotime("today")));
    		
    		$where['time'] = array(array('LT',strtotime("today")),array('EGT',strtotime(date("Y-m-d",$time)." -30 day")));
    		$visit_list = M('Visits')->field("count(ip) as ip,sum(`clicks`) as `numclick`,FROM_UNIXTIME(time, '%Y-%m-%d' ) as time")->group("time")->where($where)->order('time desc')->limit(7)->select();
    		 
    		$this->assign("visit_list", $visit_list);
    		  
    		//询盘统计
    		$where['createtime'] = array(array('LT',date("Y-m-d", $time)),array('EGT', date("Y-m-d",strtotime(date("Y-m-d",$time)." -30 day") )));
    		$gb_list = M("guestbook")->where($where)->order(" id desc ")->limit(7)->select();
    		 
    		foreach($gb_list as $key=>$value){
    			$gb_list[$key]['createtime'] = date("Y-m-d",strtotime($value['createtime']) );
    		}
    		
    		$this->assign("gb_list", $gb_list);
    	}
    }
    
    
    /* 
     * Curl 得到新顾问上的文章
     * 
     * @param qnum 前沿资讯返回条数，不传默认返回6
     * @param tnum 通知返回条数，不传默认返回4
     * @param pnum 培训课堂返回条数，不传默认返回6
     *  */
    function curlGetInfo(){
    	
    	//计算域名和服务器什么时候到期
    	$now = time();
    	$status = M('reminder')->where("status = 0 and endtime < $now")->save(array("status"=>1)); 
    	$count = M('reminder')->where(" status =0 and btime < $now ")->count();
    	$list = M("reminder")->where(" status=0 and btime < $now")->select();
    	
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
    

    //金钱格式化  超过10000， 显示为1W
    
    function formateMoney($money){
    
    	if($money / 10000000 >1 ){
    		 return "<span>".round($money/10000000 ,2 )."</span>千万美元";
    	}elseif($money / 10000>1 ){
    		return "<span>".round($money / 10000 ,2)."</span>万美元";
    	}else {
    		return "<span>".$money."</span>美元";
    	}
    	 
    }
    
    
    
    
}