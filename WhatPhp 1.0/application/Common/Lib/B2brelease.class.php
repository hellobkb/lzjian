<?php

/* 
 * B2B营销管理，发布产品到B2B平台
 * @author cx
 * @time 20160531
 *  
 *  */
 
namespace Common\Lib;
set_time_limit(0);
class B2brelease {
	
	public $release;     //平台
	public $product;     //产品
	public $reginfo;     //注册信息
	public $loginfo;     //登录信息
	public $postinfo;    //发布信息
	public $model ;      //根据参数不同取不同的表
	
	//判断是否开启CURL
	public function __construct($mmodel='release'){
		  
		$this->model = $mmodel;
		if(!function_exists('curl_init')){
			
			echo "请先开启CRUL";
			exit;
		}
		
	}

	// 初始化平台信息
	function cshptxx($rid,$pid){
		$release = M($this->model)->where("id=$rid")->find();

		if($release){
			$release['reginfo'] = unserialize($release['reginfo']);   //注册信息
			$release['logininfo'] = unserialize($release['logininfo']);  //登录信息
			$release['postinfo'] = unserialize($release['postinfo']);  //发布信息

			$data =array();
			foreach($release['postinfo'] as $pk=>$pv){
				if($pv[1]!=0){
					$modelfield = M('model_field')->field('field')->where(" fieldid ='".$pv[1]."'")->find();
					$release['postinfo'][$pk][1] = $modelfield['field'];
				}
			}
			$this->release = $release;
		}else{
			return false;
		}

		return true;
	}

	// 初始化目录信息
	public function mlxx($rid , $pid){
		$rs = $this->cshptxx($rid , $pid);
		if(!$rs)return false;
		$mllj = S('mllj');
		if($mllj[$pid]){
			$this->product = $mllj[$pid];
			return true;
		}

		return false;
	}

	//初始化产品信息
	public function init($rid , $pid){
		$rs = $this->cshptxx($rid , $pid);
		if(!$rs)return false;

		//得到产品表所有字段
		$product = M('product')->where("id = $pid")->find();
		$product_data = M('product_data')->where("id=$pid")->find();
		$product = array_merge($product, $product_data);

		if($product){
			$this->product = $product;
		}else{
			return false;
		}

		return true;
	}

	/*
	 * 发布产品初始化
	* @author cx
	* zckop改
	* @time 20160525
	*
	*  */
	
	public function release(){

		$this->reginfo = $this->release['reginfo'];      //组装注册信息
		$this->loginfo = $this->release['logininfo']; 	 //组装登录信息
		//组装发布信息
		$data = array();
		if($this->release['regorpost'] == 2){  //针对黄页平台直接发布无需注册和登录
			foreach($this->release['postinfo'] as $dk=>$dv){
				switch ($dv[0]) {
					case 'zctitle':
						$data[$dk] = $this->product['title'];
						break;
					case 'zcurl':
						$data[$dk] = $this->product['url'];
						break;
					case 'zcemail':
						$data[$dk] = $this->product['email'];
						break;
					case 'zctt':
						$data[$dk] = $this->product['setting']['meta_title'];
						break;
					case 'zckw':
						$data[$dk] = $this->product['setting']['meta_keywords'];
						break;
					case 'zcdesc':
						$data[$dk] = $this->product['setting']['meta_description'];
						break;
					case 'zccate':
						$data[$dk] = $this->release['zzxzfl'];
						break;

					default:
						if($dv[2] ==1 && $this->release['ifhide'] ==1){   //是隐藏字段
							$data[$dk][]= $dv[2];
						}else{
							$data[$dk] = $dv[0];
						}
						break;
				}
			}
	
			$this->postinfo = $data;
			return $this->yellowpost();
		}

		foreach($this->release['postinfo'] as $dk=>$dv){
			if($dv[1]!='0'){
				$data[$dk] = $this->product[$dv[1]];
			}else{
				if($dv[2] ==1 && $this->release['ifhide'] ==1){   //是隐藏字段
					$data[$dk][]= $dv[2];
				}else{
					$data[$dk] = $dv[0];
				}
			}
		}
		$this->postinfo = $data;
		if($this->release['ifreg']==1){  //已经注册
			return $this->logandpost();  //直接登录并发布
		}else{  //没有注册
			return $this->register();   //注册开始
		}

	}

	/*
	 * 统一Curl 数据提交
	 * @author cx
	 * @time 20160525
	 *  
	 *  */
	
	public function dourl($type){

		$ch = curl_init();   //启动CURL 会话
		static $zckop = array();
		if($type=='register'){
			$cookie = RUNTIME_PATH.md5('reg'.$this->release['reginfo']['code']);
			curl_setopt($ch, CURLOPT_URL, $this->release['regurl']);  //要访问的地址
            curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
			curl_setopt($ch, CURLOPT_POST, 1);	 // 发送一个常规的Post请求
			//curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.97 Safari/537.11');  //模拟用户使用的浏览器
			curl_setopt($ch, CURLOPT_AUTOREFERER, 1);   //自动设置referer
			curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			//显示返回的Header区域内容
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);  //获取的信息以文件流的形式返回
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($this->reginfo));   //Post提交的数据

			if(strpos($this->release['regurl'], "https")!==false){   //https  协议
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,false);
				curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
			}
			
			
            if(is_file($cookie)){
                curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie);
            }
			curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);

			$return  = curl_exec($ch);
			curl_close($ch);
            return $return;
		} else if($type =="login"){
            // medincn
            $zck = md5($this->release['loginurl']);
            if(empty($zckop[$zck])){
                $cookie = RUNTIME_PATH.md5('login'.$this->release['reginfo']['code']);
                $cookie_file = RUNTIME_PATH.uniqid().'.txt';
                curl_setopt($ch, CURLOPT_URL, $this->release['loginurl']);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_POSTFIELDS,http_build_query($this->loginfo));
                curl_setopt($ch, CURLOPT_COOKIEJAR, $cookie_file);

                if(is_file($cookie)){
                    curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie);
                }

                if(strpos($this->release['loginurl'], "https")!==false){   //https  协议
                    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,false);
                    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
                }

                curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
                curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
                $zckop[$zck] = curl_exec($ch);
                curl_close($ch);
            }
            $return = $zckop[$zck];

			if(strpos($return ,$this->release['loginsuccess'])!==false){
			  
			    //判断是否登录成功
				//如果有隐藏字段,重新组装提交字段
				if($this->release['ifhide'] ==1){
					$this->hidedata($cookie_file);
				}

				//继续执行发布产品
				$ch1 = curl_init();
				curl_setopt($ch1, CURLOPT_URL, $this->release['posturl']);
				curl_setopt($ch1, CURLOPT_POST, 1);
                curl_setopt($ch1, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
                curl_setopt($ch1, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($ch1, CURLOPT_HEADER, 0);
				curl_setopt($ch1, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch1, CURLOPT_POSTFIELDS, http_build_query($this->postinfo));
				curl_setopt($ch1, CURLOPT_COOKIEFILE, $cookie_file);
				
				if(strpos($this->release['posturl'], "https")!==false){
					curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,false);
					curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
					 
				}
				
				$return1  = curl_exec($ch1);
				curl_close($ch1);

				if($this->release['postsuccess']){
					if(strpos($return1,$this->release['postsuccess'])!==false){
						
						return 1;
						
					}else {
						
						return 5;
					}
					
				}else {
					return 1;
				}
			}else {
                unset($zckop[$zck]);
				return 4;
			}
		}else if ($type =='yellowpost'){   //黄页直接发布
			$ch2 = curl_init();
			curl_setopt($ch2, CURLOPT_URL, $this->release['posturl']);
			curl_setopt($ch2, CURLOPT_POST, 1);
			curl_setopt($ch2, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
			curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch2, CURLOPT_HEADER, 0);
			curl_setopt($ch2, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch2, CURLOPT_POSTFIELDS, http_build_query($this->postinfo));
			curl_setopt($ch2, CURLOPT_FOLLOWLOCATION, 1);
			curl_setopt($ch2, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727;http://www.reanod.com)');

			if(strpos($this->release['posturl'], "https")!==false){
				curl_setopt($ch2, CURLOPT_SSL_VERIFYPEER,false);
				curl_setopt($ch2, CURLOPT_SSL_VERIFYHOST, 2);
			}

			$return2  = curl_exec($ch2);
			curl_close($ch2);

			if($this->release['postsuccess']){
				if(strpos($return2,$this->release['postsuccess'])!==false){
					return 1;
				}else {
					return 5;
				}
			}else {
				return 1;
			}
		}

	}

	/*
	 * 注册
	 * @author cx
	 * @time 20160525
	 *
	 **/

	public function register(){

		$backfun = $this->dourl("register");

		if(strpos($backfun, $this->release['regsuccess'])!==false || $this->release['regsuccess'] ==""){   //注册成功
			$where = array();
			$where['id'] = $this->release['id'];
			$status = M('release')->where($where)->save(array('ifreg'=>1));
			
			if($status){
				
				return $this->logandpost();   //登录
				
			}else{
				return 3;
			}
		 
		}else{
			
			return 2;   //返回false
		}
		
		
	}
	
	/* 
	 * 登录
	 * @author cx
	 * @time 20160525 
	 *  */
	
	public function logandpost(){
		   
		return $this->dourl("login");
		
		 
	}
	 
	
	public function yellowpost(){
		return $this->dourl('yellowpost');
		
	}
	
	
	/* 
	 * 如果有隐藏字段，得到隐藏字段的值，重新组装发布数据
	 * @author cx
	 * @time 20160606
	 * 
	 *  */
	
	public function hidedata($cookie_file){
		 
		$url = $this->release['preposturl'];   //得到隐藏字段的url
		include_once 'simple_html_dom.php';
		$html = file_get_html($url, $cookie_file);
		 
		//重新组装提交数据
		foreach($this->postinfo as $key=>$value){
			if(is_array($value)){  //如果是数组那么是隐藏字段
				foreach($html->find("input[name=".$key."]") as $e){
					$this->postinfo[$key] = $e->value;
				}
			}
		}

		$html->clear();  //清除内存过大

	}
}