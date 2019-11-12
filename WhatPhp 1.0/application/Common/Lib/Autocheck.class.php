<?php


/* 
 * 自动检测程序
 * 
 * @author cx
 * @time 20160615
 *  
 *  */

namespace Common\Lib;


class Autocheck {
	
	/* 
	 * 自动入口程序
	 * 
	 *  */
	
	protected $model;
	protected $createhtml;
	protected $Html;
	
	public function __construct(){

		$this->model = M('model')->select();
	  
		$this->Html = new \Common\Lib\Html();
		
		  
	}
	
	public function index(){
		 
		//检查延迟发布
		$this->checkmodel();

		//自动飞出
	 	$this->fly();
	}
	
	/* 
	 * 检测所有的模型表，查找里面是否有推迟发布的内容，如果已到发布时间则发布,如果是静态就要更新内容页
	 * 
	 *  */
	
	public function checkmodel(){
		 
		$stime = strtotime("today");
		 
		$data['isdelay'] =0;
		$site = get_site_options();
		unset($_POST);
		foreach($this->model as $value){
			
			if($value['disabled'] ==0){
				
				$list = M($value['tablename'])->where(" updatetime<=$stime  and isdelay=1 ")->select();
					 
				if($list){
					 
					foreach($list as $v){
						
						$status = M($value['tablename'])->where("id = $v[id]")->save($data);
							
						if($status){
								
							$category = M('category')->where("catid = ".$v['catid'])->find();
								
							if($category['sethtml'] ==1){  //是静态需要重新生成这个栏目下的内容页面
								$catids = array();
								$catids[] = $v['catid'];
									
								//组装数据
								$_POST['dosubmit'] =1;
								//$_POST['type'] ='lastinput';
								//$_POST['fromdate'] = date("Y-m-d",strtotime("today"));
								//$_POST['todate'] =date("Y-m-d",strtotime("today"));
								$_POST['modelid'] =$value['modelid'];
								$_POST['catids'] = $catids;
				
								$this->docurl($site['site_host']."index.php?g=Content&m=Createhtml&a=update_show", $_POST);
								
								 
								unset($_POST);
								
								$_POST['dosubmit']=1;
								$_POST['type'] ="all";
								$_POST['modelid'] = '';
								$_POST['catids'] = $catids;
								$_POST['pagesize'] =10;
								$_POST['set_catid'] =1;
								
								
								$this->docurl($site['site_host'].'index.php?g=Content&m=Createhtml&a=category', $_POST,2);
							}
						}
					
					}
				}
			 
			}

		}
		 
	}




	
	//进行curl提交
	public function docurl($url , $data, $type=1){
		 
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		$return  = curl_exec($ch);
		curl_close($ch);
		 
	}

	/*
		crm 客户飞出
	*/
	public function fly(){

		$option = M("CrmOption")->where(" id = 1 ")->find();

		$fday = $option['fly_day'];      //未添加沟通记录飞出时间限制
		$bday = $option['begin_day'];    //已经添加沟通记录飞出时间限制

		$time = time();
		 
		$clist = M("Client")->where(" status =2 ")->select();

		$id=array();
		 foreach($clist as $value){
 	  
		 	$ifcon = M("ClientContact")->where(" uid = $value[uid] and cid=$value[id] and status=1 ")->order(" id desc ")->find();

		 	if($ifcon){  //有沟通已经确认的记录
		 		//如果有沟通记录，那么沟通记录的时间要大于抓取时间才算数。
		 		
		 		if($ifcon['addtime'] > $value['gtime'] && $time- $bday*86400>$ifcon['addtime']){
		 			
		 			//如果有订单，并且订单未完成也不飞出
		 			
		 			$order = M("ClientOrder")->where(" cid= $value[id] and uid= $value[uid] and status =0 ")->find();

		 			if(!$order){
		 				$id[] = $value['id'];
		 			}
		 		}else if ($ifcon['addtime']<$value['gtime'] && $time - $fday*86400 >$value['gtime']){
		 			//如果有订单，并且订单未完成也不飞出
		 			 
		 			$order = M("ClientOrder")->where(" cid=$value[id] and uid=$value[uid] and status=0 ")->find();

		 			if(!$order){
		 				$id[] = $value['id'];
		 			}
		 			
		 		}
		  
		 	}else {       //没有沟通记录
		 		
		 		if($time - $fday*86400 > $value['gtime']){
		 			
		 			//如果有订单，并且订单未完成也不飞出
		 			 
		 			$order = M("ClientOrder")->where(" cid=$value[id] and uid=$value[uid] and status=0 ")->find();

		 			if(!$order){

		 				$id[]= $value['id'];
		 			}
		 
		 		}

		 	}
		  
		 }

		if($id){
	 	 
		 	foreach($id as $newcid){ //将需要飞出的企业ID做阶段删除,飞出操作,然后增加新的阶段.
		 		
		 		//将之前沟通记录状态改为已沟通
		 		 
			 		$con_status = M("ClientContact")->where(" cid = $newcid ")->save(array("status"=>1));

			 		$client = M("Client")->where(" id = $newcid ")->find();

			 		$res = M("Client")->where(" id = $newcid ")->save(array("uid"=>0, "mid"=>0, "status"=>1, "level"=>4, "ktime"=>$time));
			 		
			 		if($res){ //更新client成功，进行删除修改阶段
			 			
			 			//try catch 执行操作判断异常
			 			
			 			try {
			 				
			 				$del_status = M("ClientStatus")->where(" cid =$newcid ")->delete();

			 				if($del_status){

			 					$data = array();
			 					$data['cid'] = $newcid;
			 					$data['uid'] = 0;
			 					$data['status'] =1;
			 					$data['confirm'] =1;
			 					$data['req_time'] = $time;
			 					$data['con_time'] = $time;
			 					$data['con_user'] = 0;
			 					$data['remark'] = "自动飞入公海";
			 					$data['type'] =4;

			 					$add_status = M("ClientStatus")->add($data);

			 					if($add_status){
			 						 echo $newcid."执行成功<br />";
			 					}else{
			 						echo $newcid."添加阶段执行失败<br />";
			 					}

			 				}else{
			 					echo $newcid."删除阶段错误<br />";
			 				}

			 				//报价申请自动拒绝
			 				$offer_status = M("ClientOffer")->where(" cid=$newcid and uid= $client[uid] and status=0  ")->save(array("con_user"=>1 ,"con_time"=>time() ,"con_content"=>'客户飞出，申请自动拒绝' ,'status'=>2));

			 				//沟通关注申请自动拒绝
			 				$req_status = M("ContactRequire")->where("uid = $client[uid] and cid=$newcid and status=0")->save(array("replytime"=>time(), 'content'=>'客户飞出，自动拒绝', 'status'=>1) );

			 				 
			 			}catch (Exception $e){
			 				print_r($e->getMessage());
			 			}
			 		}else{
			 			echo $newcid."更新客户表，执行失败<br />";
			 		}
			}
 
 		}

	}
	  
}
