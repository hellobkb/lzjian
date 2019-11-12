<?php

/**
 * 获取当前登录的管事员id
 * @return int
 */
function get_current_admin_id(){
	return $_SESSION['ADMIN_ID'];
}
//获取管理员信息
function get_admin_info($admin_id){
	$map['id'] = $admin_id;
	$admininfo = M('Users')->where($map)->find();
	if($admininfo)return $admininfo;
	else return false;
}

/**
 * 获取当前登录的管事员id
 * @return int
 */
function sp_get_current_admin_id(){
	return get_current_admin_id();
}

/**
 * 判断前台用户是否登录
 * @return boolean
 */
function sp_is_user_login(){
	return  !empty($_SESSION['user']);
}

/**
 * 获取当前登录的前台用户的信息，未登录时，返回false
 * @return array|boolean
 */
function sp_get_current_user(){
	if(isset($_SESSION['user'])){
		return $_SESSION['user'];
	}else{
		return false;
	}
}

/**
 * 更新当前登录前台用户的信息
 * @param array $user 前台用户的信息
 */
function sp_update_current_user($user){
	$_SESSION['user']=$user;
}

/**
 * 获取当前登录前台用户id,推荐使用sp_get_current_userid
 * @return int
 */
function get_current_userid(){
	
	if(isset($_SESSION['user'])){
		return $_SESSION['user']['id'];
	}else{
		return 0;
	}
}

/**
 * 获取当前登录前台用户id
 * @return int
 */
function sp_get_current_userid(){
	return get_current_userid();
}

/**
 * 返回带协议的域名
 */
function sp_get_host(){
	$host=$_SERVER["HTTP_HOST"];
	$protocol=is_ssl()?"https://":"http://";
	return $protocol.$host;
}

/**
 * 获取前台模板根目录
 */
function sp_get_theme_path(){
	// 获取当前主题名称
	$tmpl_path=C("SP_TMPL_PATH");
	$theme      =    C('SP_DEFAULT_THEME');
	if(C('TMPL_DETECT_THEME')) {// 自动侦测模板主题
		$t = C('VAR_TEMPLATE');
		if (isset($_GET[$t])){
			$theme = $_GET[$t];
		}elseif(cookie('think_template')){
			$theme = cookie('think_template');
		}
		if(!file_exists($tmpl_path."/".$theme)){
			$theme  =   C('SP_DEFAULT_THEME');
		}
		cookie('think_template',$theme,864000);
	}

	return __ROOT__.'/'.$tmpl_path.$theme."/";
}


/**
 * 获取用户头像相对网站根目录的地址
 */
function sp_get_user_avatar_url($avatar){
	
	if($avatar){
		if(strpos($avatar, "http")===0){
			return $avatar;
		}else {
			return sp_get_asset_upload_path("avatar/".$avatar);
		}
		
	}else{
		return $avatar;
	}
	
}

/**
 * CMF密码加密方法
 * @param string $pw 要加密的字符串
 * @return string
 */
function sp_password($pw,$authcode=''){
    if(empty($authcode)){
        $authcode=C("AUTHCODE");
    }
	$result="###".md5(md5($authcode.$pw));
	return $result;
}

/**
 * CMF密码加密方法 (X2.0.0以前的方法)
 * @param string $pw 要加密的字符串
 * @return string
 */
function sp_password_old($pw){
    $decor=md5(C('DB_PREFIX'));
    $mi=md5($pw);
    return substr($decor,0,12).$mi.substr($decor,-4,4);
}

/**
 * CMF密码比较方法,所有涉及密码比较的地方都用这个方法
 * @param string $password 要比较的密码
 * @param string $password_in_db 数据库保存的已经加密过的密码
 * @return boolean 密码相同，返回true
 */
function sp_compare_password($password,$password_in_db){
    if(strpos($password_in_db, "###")===0){
        return sp_password($password)==$password_in_db;
    }else{
        return sp_password_old($password)==$password_in_db;
    }
}


function sp_log($content,$file="log.txt"){
	file_put_contents($file, $content,FILE_APPEND);
}

/**
 * 随机字符串生成
 * @param int $len 生成的字符串长度
 * @return string
 */
function sp_random_string($len = 6) {
	$chars = array(
			"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
			"l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
			"w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
			"H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
			"S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
			"3", "4", "5", "6", "7", "8", "9"
	);
	$charsLen = count($chars) - 1;
	shuffle($chars);    // 将数组打乱
	$output = "";
	for ($i = 0; $i < $len; $i++) {
		$output .= $chars[mt_rand(0, $charsLen)];
	}
	return $output;
}

/**
 * 清空系统缓存，兼容sae
 */
function sp_clear_cache(){
		import ( "ORG.Util.Dir" );
		$dirs = array ();
		// runtime/
		$rootdirs = sp_scan_dir( RUNTIME_PATH."*" );
		//$noneed_clear=array(".","..","Data");
		$noneed_clear=array(".","..");
		$rootdirs=array_diff($rootdirs, $noneed_clear);
		foreach ( $rootdirs as $dir ) {
			
			if ($dir != "." && $dir != "..") {
				$dir = RUNTIME_PATH . $dir;
				if (is_dir ( $dir )) {
					//array_push ( $dirs, $dir );
					$tmprootdirs = sp_scan_dir ( $dir."/*" );
					foreach ( $tmprootdirs as $tdir ) {
						if ($tdir != "." && $tdir != "..") {
							$tdir = $dir . '/' . $tdir;
							if (is_dir ( $tdir )) {
								array_push ( $dirs, $tdir );
							}else{
								@unlink($tdir);
							}
						}
					}
				}else{
					@unlink($dir);
				}
			}
		}
		$dirtool=new \Dir("");
		foreach ( $dirs as $dir ) {
			$dirtool->delDir ( $dir );
		}
		
		if(sp_is_sae()){
			$global_mc=@memcache_init();
			if($global_mc){
				$global_mc->flush();
			}
			
			$no_need_delete=array("THINKCMF_DYNAMIC_CONFIG");
			$kv = new SaeKV();
			// 初始化KVClient对象
			$ret = $kv->init();
			// 循环获取所有key-values
			$ret = $kv->pkrget('', 100);
			while (true) {
				foreach($ret as $key =>$value){
                    if(!in_array($key, $no_need_delete)){
                    	$kv->delete($key);
                    }
                }
				end($ret);
				$start_key = key($ret);
				$i = count($ret);
				if ($i < 100) break;
				$ret = $kv->pkrget('', 100, $start_key);
			}
			
		}
	
}

/**
 * 保存数组变量到php文件
 */
function sp_save_var($path,$value){
	$ret = file_put_contents($path, "<?php\treturn " . var_export($value, true) . ";?>");
	return $ret;
}

/**
 * 更新系统配置文件
 * @param array $data <br>如：array("URL_MODEL"=>0);
 * @return boolean
 */
function sp_set_dynamic_config($data){
	
	if(!is_array($data)){
		return false;
	}
	
	if(sp_is_sae()){
		$kv = new SaeKV();
		$ret = $kv->init();
		$configs=$kv->get("THINKCMF_DYNAMIC_CONFIG");
		$configs=empty($configs)?array():unserialize($configs);
		$configs=array_merge($configs,$data);
		$result = $kv->set('THINKCMF_DYNAMIC_CONFIG', serialize($configs));
	}elseif(defined('IS_BAE') && IS_BAE){
		$bae_mc=new BaeMemcache();
		$configs=$bae_mc->get("THINKCMF_DYNAMIC_CONFIG");
		$configs=empty($configs)?array():unserialize($configs);
		$configs=array_merge($configs,$data);
		$result = $bae_mc->set("THINKCMF_DYNAMIC_CONFIG",serialize($configs),MEMCACHE_COMPRESSED,0);
	}else{
		$config_file="./data/conf/config.php";
		if(file_exists($config_file)){
			$configs=include $config_file;
		}else {
			$configs=array();
		}
		$configs=array_merge($configs,$data);
		$result = file_put_contents($config_file, "<?php\treturn " . var_export($configs, true) . ";");
	}
	sp_clear_cache();
	S("sp_dynamic_config",$configs);
	return $result;
}


/**
 * 生成参数列表,以数组形式返回
 */
function sp_param_lable($tag = ''){
	$param = array();
	$array = explode(';',$tag);
	foreach ($array as $v){
		$v=trim($v);
		if(!empty($v)){
			list($key,$val) = explode(':',$v);
			$param[trim($key)] = trim($val);
		}
	}
	return $param;
}


/**
 * 获取后台管理设置的网站信息，此类信息一般用于前台，推荐使用sp_get_site_options
 */
function get_site_options(){
	$site_options = F("site_options");
	if(empty($site_options)){
		$options_obj = M("Options");
		$option = $options_obj->where("option_name='site_options'")->find();
		if($option){
			$site_options = json_decode($option['option_value'],true);
		}else{
			$site_options = array();
		}
		F("site_options", $site_options);
	}
	$site_options['site_tongji']=htmlspecialchars_decode($site_options['site_tongji']);
	
	return $site_options;	
}

/**
 * 获取后台管理设置的网站信息，此类信息一般用于前台
 */
function sp_get_site_options(){
	return get_site_options();
}

/**
 * 获取CMF系统的设置，此类设置用于全局
 * @param string $key 设置key，为空时返回所有配置信息
 * @return mixed
 */
function sp_get_cmf_settings($key=""){
	$cmf_settings = F("cmf_settings");
	if(empty($cmf_settings)){
		$options_obj = M("Options");
		$option = $options_obj->where("option_name='cmf_settings'")->find();
		if($option){
			$cmf_settings = json_decode($option['option_value'],true);
		}else{
			$cmf_settings = array();
		}
		F("cmf_settings", $cmf_settings);
	}
	if(!empty($key)){
		return $cmf_settings[$key];
	}
	return $cmf_settings;
}
/**
 * 获取CMF系统的设置，此类设置用于全局
 * @param string $key 设置key，为空时返回所有配置信息
 * @return mixed
 */
function sp_get_cmf_settings_ads(){
	$cmf_settings = F("cmf_settings_ads");
	if(empty($cmf_settings)){
		$options_obj = M("Options");
		$option = $options_obj->where("option_name='site_indexads'")->find();
		if($option){
			$cmf_settings = json_decode($option['option_value'],true);
		}else{
			$cmf_settings = array();
		}
		F("cmf_settings_ads", $cmf_settings);
	}
	
	return $cmf_settings;
}


/**
 * 更新CMF系统的设置，此类设置用于全局
 * @param array $data 
 * @return boolean
 */
function sp_set_cmf_setting($data){
	if(!is_array($data) || empty($data) ){
		return false;
	}
	$cmf_settings['option_name']="cmf_settings";
	$options_model=M("Options");
	$find_setting=$options_model->where("option_name='cmf_settings'")->find();
	F("cmf_settings",null);
	if($find_setting){
		$setting=json_decode($find_setting['option_value'],true);
		if($setting){
			$setting=array_merge($setting,$data);
		}else {
			$setting=$data;
		}
		
		$cmf_settings['option_value']=json_encode($setting);
		return $options_model->where("option_name='cmf_settings'")->save($cmf_settings);
	}else{
		$cmf_settings['option_value']=json_encode($data);
		return $options_model->add($cmf_settings);
	}
}




/**
 * 全局获取验证码图片
 * 生成的是个HTML的img标签
 * @param string $imgparam <br>
 * 生成图片样式，可以设置<br>
 * length=4&font_size=20&width=238&height=50&use_curve=1&use_noise=1<br>
 * length:字符长度<br>
 * font_size:字体大小<br>
 * width:生成图片宽度<br>
 * heigh:生成图片高度<br>
 * use_curve:是否画混淆曲线  1:画，0:不画<br>
 * use_noise:是否添加杂点 1:添加，0:不添加<br>
 * @param string $imgattrs<br>
 * img标签原生属性，除src,onclick之外都可以设置<br>
 * 默认值：style="cursor: pointer;" title="点击获取"<br>
 * @return string<br>
 * 原生html的img标签<br>
 * 注，此函数仅生成img标签，应该配合在表单加入name=verify的input标签<br>
 * 如：&lt;input type="text" name="verify"/&gt;<br>
 */
function sp_verifycode_img($imgparam='length=4&font_size=20&width=238&height=50&use_curve=1&use_noise=1',$imgattrs='style="cursor: pointer;" title=""'){
	$src=__ROOT__."/index.php?g=api&m=checkcode&a=index&".$imgparam;
	$img=<<<hello
<img src="$src" onclick="this.src='$src&time='+Math.random();" $imgattrs/>
hello;
	return $img;
}
function sp_verifycode_img2($imgparam='length=4&font_size=20&width=238&height=50&use_curve=1&use_noise=1',$imgattrs='style="cursor: pointer;" title=""'){
	$src=__ROOT__."/index.php?g=api&m=checkcode&a=index&".$imgparam;
	$img=<<<hello
<img  src="$src" onclick="this.src='$src&time='+Math.random();" $imgattrs/>
hello;
	return $img;
}



/**
 * 返回指定id的菜单
 * 同上一类方法，jquery treeview 风格，可伸缩样式
 * @param $myid 表示获得这个ID下的所有子级
 * @param $effected_id 需要生成treeview目录数的id
 * @param $str 末级样式
 * @param $str2 目录级别样式
 * @param $showlevel 直接显示层级数，其余为异步显示，0为全部限制
 * @param $ul_class 内部ul样式 默认空  可增加其他样式如'sub-menu'
 * @param $li_class 内部li样式 默认空  可增加其他样式如'menu-item'
 * @param $style 目录样式 默认 filetree 可增加其他样式如'filetree treeview-famfamfam'
 * @param $dropdown 有子元素时li的class
 * $id="main";
 $effected_id="mainmenu";
 $filetpl="<a href='\$href'><span class='file'>\$label</span></a>";
 $foldertpl="<span class='folder'>\$label</span>";
 $ul_class="" ;
 $li_class="" ;
 $style="filetree";
 $showlevel=6;
 sp_get_menu($id,$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel);
 * such as
 * <ul id="example" class="filetree ">
 <li class="hasChildren" id='1'>
 <span class='folder'>test</span>
 <ul>
 <li class="hasChildren" id='4'>
 <span class='folder'>caidan2</span>
 <ul>
 <li class="hasChildren" id='5'>
 <span class='folder'>sss</span>
 <ul>
 <li id='3'><span class='folder'>test2</span></li>
 </ul>
 </li>
 </ul>
 </li>
 </ul>
 </li>
 <li class="hasChildren" id='6'><span class='file'>ss</span></li>
 </ul>
 */

function sp_get_menu($id="main",$effected_id="mainmenu",$filetpl="<span class='file'>\$label</span>",$foldertpl="<span class='folder'>\$label</span>",$ul_class="" ,$li_class="" ,$style="filetree",$showlevel=6,$dropdown='hasChild'){
	$navs=F("site_nav_".$id);
	if(empty($navs)){
		$navs=_sp_get_menu_datas($id);
	}
	
	import("Tree");
	$tree = new \Tree();
	$tree->init($navs);
	return $tree->get_treeview_menu(0,$effected_id, $filetpl, $foldertpl,  $showlevel,$ul_class,$li_class,  $style,  1, FALSE, $dropdown);
}


function _sp_get_menu_datas($id){
	$nav_obj= M("Nav");
	$oldid=$id;
	$id= intval($id);
	$id = empty($id)?"main":$id;
	if($id=="main"){
		$navcat_obj= M("NavCat");
		$main=$navcat_obj->where("active=1")->find();
		$id=$main['navcid'];
	}
	
	if(empty($id)){
		return array();
	}
	
	$navs= $nav_obj->where(array('cid'=>$id,'status'=>1))->order(array("listorder" => "ASC"))->select();
	foreach ($navs as $key=>$nav){
		$href=htmlspecialchars_decode($nav['href']);
		$hrefold=$href;
		
		if(strpos($hrefold,"{")){//序列 化的数据
			$href=unserialize(stripslashes($nav['href']));
			$default_app=strtolower(C("DEFAULT_MODULE"));
			$href=strtolower(leuu($href['action'],$href['param']));
			$g=C("VAR_MODULE");
			$href=preg_replace("/\/$default_app\//", "/",$href);
			$href=preg_replace("/$g=$default_app&/", "",$href);
		}else{
			if($hrefold=="home"){
				$href=__ROOT__."/";
			}else{
				$href=$hrefold;
			}
		}
		$nav['href']=$href;
		$navs[$key]=$nav;
	}
	F("site_nav_".$oldid,$navs);
	return $navs;
}


function sp_get_menu_tree($id="main"){
	$navs=F("site_nav_".$id);
	if(empty($navs)){
		$navs=_sp_get_menu_datas($id);
	}

	import("Tree");
	$tree = new \Tree();
	$tree->init($navs);
	return $tree->get_tree_array(0, "");
}



/**
 *获取html文本里的img
 * @param string $content
 * @return array
 */
function sp_getcontent_imgs($content){
	import("phpQuery");
	\phpQuery::newDocumentHTML($content);
	$pq=pq();
	$imgs=$pq->find("img");
	$imgs_data=array();
	if($imgs->length()){
		foreach ($imgs as $img){
			$img=pq($img);
			$im['src']=$img->attr("src");
			$im['title']=$img->attr("title");
			$im['alt']=$img->attr("alt");
			$imgs_data[]=$im;
		}
	}
	\phpQuery::$documents=null;
	return $imgs_data;
}


/**
 * 
 * @param unknown_type $navcatname
 * @param unknown_type $datas
 * @param unknown_type $navrule
 * @return string
 */
function sp_get_nav4admin($navcatname,$datas,$navrule){
	$nav['name']=$navcatname;
	$nav['urlrule']=$navrule;
	foreach($datas as $t){
		$urlrule=array();
		$group=strtolower(MODULE_NAME)==strtolower(C("DEFAULT_MODULE"))?"":MODULE_NAME."/";
		$action=$group.$navrule['action'];
		$urlrule['action']=MODULE_NAME."/".$navrule['action'];
		$urlrule['param']=array();
		if(isset($navrule['param'])){
			foreach ($navrule['param'] as $key=>$val){
				$urlrule['param'][$key]=$t[$val];
			}
		}
		
		$nav['items'][]=array(
				"label"=>$t[$navrule['label']],
				"url"=>U($action,$urlrule['param']),
				"rule"=>serialize($urlrule)
		);
	}
	return json_encode($nav);
}

function sp_get_apphome_tpl($tplname,$default_tplname,$default_theme=""){
	$theme      =    C('SP_DEFAULT_THEME');
	if(C('TMPL_DETECT_THEME')){// 自动侦测模板主题
		$t = C('VAR_TEMPLATE');
		if (isset($_GET[$t])){
			$theme = $_GET[$t];
		}elseif(cookie('think_template')){
			$theme = cookie('think_template');
		}
	}
	$theme=empty($default_theme)?$theme:$default_theme;
	$themepath=C("SP_TMPL_PATH").$theme."/".MODULE_NAME."/";
	$tplpath = sp_add_template_file_suffix($themepath.$tplname);
	$defaultpl = sp_add_template_file_suffix($themepath.$default_tplname);
	if(file_exists_case($tplpath)){
	}else if(file_exists_case($defaultpl)){
		$tplname=$default_tplname;
	}else{
		$tplname="404";
	}
	return $tplname;
}


/**
 * 去除字符串中的指定字符
 * @param string $str 待处理字符串
 * @param string $chars 需去掉的特殊字符
 * @return string
 */
function sp_strip_chars($str, $chars='?<*.>\'\"'){
	return preg_replace('/['.$chars.']/is', '', $str);
}

/**
 * 发送邮件
 * @param string $address
 * @param string $subject
 * @param string $message
 * @return array<br>
 * 返回格式：<br>
 * array(<br>
 * 	"error"=>0|1,//0代表出错<br>
 * 	"message"=> "出错信息"<br>
 * );
 */
function sp_send_email($address,$subject,$message,$enclosure=false){

    if($address){
        $address_arr = explode(',', $address);
        $params['from']     = C('SP_MAIL_ADDRESS');
        $params['fromname'] = C('SP_MAIL_SENDER');
        $params['host']     = C('SP_MAIL_SMTP');
        $params['port']     = C('SP_MAIL_SMTP_PORT');
        $params['username'] = C('SP_MAIL_LOGINNAME');
        $params['password'] = C('SP_MAIL_PASSWORD');
        foreach ($address_arr as $k=>$v) {

            $params = array();
            $params['sendname'] = $v; 			// 收件人
            $params['content']  = $message;   										// 发送内容
            $params = http_build_query($params);

            $ch = curl_init();
            curl_setopt( $ch, CURLOPT_HTTP_VERSION , CURL_HTTP_VERSION_1_1 );
            curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT , 60 );
            curl_setopt( $ch, CURLOPT_TIMEOUT , 1);
            curl_setopt( $ch, CURLOPT_RETURNTRANSFER , true );
            if (ini_get('open_basedir') == '' && ini_get('safe_mode' == 'Off')) {
                curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, true);
            }
            curl_setopt( $ch , CURLOPT_URL , 'http://107.150.98.157/zcmail.php'.'?'.$params );
            curl_exec($ch);
            curl_close( $ch );
        }

    }
    return true;

}

/**
 * 转化数据库保存的文件路径，为可以访问的url
 * @param string $file
 * @param boolean $withhost
 * @return string
 */
function sp_get_asset_upload_path($file,$withhost=false){
    if(strpos($file,"http")===0){
        return $file;
    }else if(strpos($file,"/")===0){
        return $file;
    }else{
        if(strpos($file,C("TMPL_PARSE_STRING.__UPLOAD__"))===false){
            $filepath=C("TMPL_PARSE_STRING.__UPLOAD__").$file;
        }else{
            $site_options = get_site_options();
            $filepath=$site_options['site_host'].$file;
        }
        if($withhost){
            if(strpos($filepath,"http")!==0){
                $http = 'http://';
                $http =is_ssl()?'https://':$http;
                $filepath = $http.$_SERVER['HTTP_HOST'].$filepath;
            }
        }
        return $filepath;

    }

}


function sp_authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {
	$ckey_length = 4;

	$key = md5($key ? $key : C("AUTHCODE"));
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}

}

function sp_authencode($string){
	return sp_authcode($string,"ENCODE");
}

function Comments($table,$post_id,$params=array()){
	return  R("Comment/Widget/index",array($table,$post_id,$params));
}
/**
 * 获取评论
 * @param string $tag
 * @param array $where //按照thinkphp where array格式
 */
function sp_get_comments($tag="field:*;limit:0,5;order:createtime desc;",$where=array()){
	$where=array();
	$tag=sp_param_lable($tag);
	$field = !empty($tag['field']) ? $tag['field'] : '*';
	$limit = !empty($tag['limit']) ? $tag['limit'] : '5';
	$order = !empty($tag['order']) ? $tag['order'] : 'createtime desc';
	
	//根据参数生成查询条件
	$mwhere['status'] = array('eq',1);
	
	if(is_array($where)){
		$where=array_merge($mwhere,$where);
	}else{
		$where=$mwhere;
	}
	
	$comments_model=M("Comments");
	
	$comments=$comments_model->field($field)->where($where)->order($order)->limit($limit)->select();
	return $comments;
}

function sp_file_write($file,$content){
	
	if(sp_is_sae()){
		$s=new SaeStorage();
		$arr=explode('/',ltrim($file,'./'));
		$domain=array_shift($arr);
		$save_path=implode('/',$arr);
		return $s->write($domain,$save_path,$content);
	}else{
		try {
			$fp2 = @fopen( $file , "w" );
			fwrite( $fp2 , $content );
			fclose( $fp2 );
			return true;
		} catch ( Exception $e ) {
			return false;
		}
	}
}

function sp_file_read($file){
	if(sp_is_sae()){
		$s=new SaeStorage();
		$arr=explode('/',ltrim($file,'./'));
		$domain=array_shift($arr);
		$save_path=implode('/',$arr);
		return $s->read($domain,$save_path);
	}else{
		file_get_contents($file);
	}
}
/*修复缩略图使用网络地址时，会出现的错误。5iymt 2015年7月10日*/
function sp_asset_relative_url($asset_url){
    if(strpos($asset_url,"http")===0){
    	return $asset_url;
	}else{	
	    return str_replace(C("TMPL_PARSE_STRING.__UPLOAD__"), "", $asset_url);
	}
}

function sp_content_page($content,$pagetpl='{first}{prev}{liststart}{list}{listend}{next}{last}'){
	$contents=explode('_ueditor_page_break_tag_',$content);
	$totalsize=count($contents);
	import('Page');
	$pagesize=1;
	$PageParam = C("VAR_PAGE");
	$page = new \Page($totalsize,$pagesize);
	$page->setLinkWraper("li");
	$page->SetPager('default', $pagetpl, array("listlong" => "9", "first" => "首页", "last" => "尾页", "prev" => "上一页", "next" => "下一页", "list" => "*", "disabledclass" => ""));
	$content=$contents[$page->firstRow];
	$data['content']=$content;
	$data['page']=$page->show('default');
	
	return $data;
}


/**
 * 根据广告名称获取广告内容
 * @param string $ad
 * @return 广告内容
 */

function sp_getad($ad){
	$ad_obj= M("Ad");
	$ad=$ad_obj->field("ad_content")->where("ad_name='$ad' and status=1")->find();
	return htmlspecialchars_decode($ad['ad_content']);
}

/**
 * 根据幻灯片标识获取所有幻灯片
 * @param string $slide 幻灯片标识
 * @return array;
 */
function sp_getslide($slide,$limit=5,$order = "listorder ASC"){
    $slide_obj= M("SlideCat");
	$join = "".C('DB_PREFIX').'slide as b on '.C('DB_PREFIX').'slide_cat.cid =b.slide_cid';
    if($order == ''){
		$order = "listorder ASC";
	}
	if ($limit == 0) {
		$limit = 5;
	}
	return $slide_obj->join($join)->where("cat_idname='$slide' and slide_status=1")->order($order)->limit('0,'.$limit)->select();

}

/**
 * 获取所有友情连接
 * @return array
 */
function sp_getlinks(){
	$links_obj= M("Links");
	return  $links_obj->where("link_status=1")->order("listorder ASC")->select();
}

/**
 * 检查用户对某个url,内容的可访问性，用于记录如是否赞过，是否访问过等等;开发者可以自由控制，对于没有必要做的检查可以不做，以减少服务器压力
 * @param number $object 访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录;如果object为空，表示只检查对某个url访问的合法性
 * @param number $count_limit 访问次数限制,如1，表示只能访问一次
 * @param boolean $ip_limit ip限制,false为不限制，true为限制
 * @param number $expire 距离上次访问的最小时间单位s，0表示不限制，大于0表示最后访问$expire秒后才可以访问
 * @return true 可访问，false不可访问
 */
function sp_check_user_action($object="",$count_limit=1,$ip_limit=false,$expire=0){
	$common_action_log_model=M("CommonActionLog");
	$action=MODULE_NAME."-".CONTROLLER_NAME."-".ACTION_NAME;
	$userid=get_current_userid();
	
	$ip=get_client_ip(0,true);//修复ip获取
	
	$where=array("user"=>$userid,"action"=>$action,"object"=>$object);
	if($ip_limit){
		$where['ip']=$ip;
	}
	
	$find_log=$common_action_log_model->where($where)->find();
	
	$time=time();
	if($find_log){
		$common_action_log_model->where($where)->save(array("count"=>array("exp","count+1"),"last_time"=>$time,"ip"=>$ip));
		if($find_log['count']>=$count_limit){
			return false;
		}
		
		if($expire>0 && ($time-$find_log['last_time'])<$expire){
			return false;
		}
	}else{
		$common_action_log_model->add(array("user"=>$userid,"action"=>$action,"object"=>$object,"count"=>array("exp","count+1"),"last_time"=>$time,"ip"=>$ip));
	}
	
	return true;
}
/**
 * 用于生成收藏内容用的key
 * @param string $table 收藏内容所在表
 * @param int $object_id 收藏内容的id
 */
function sp_get_favorite_key($table,$object_id){
	$auth_code=C("AUTHCODE");
	$string="$auth_code $table $object_id";
	
	return sp_authencode($string);
}


function sp_get_relative_url($url){
	if(strpos($url,"http")===0){
		$url=str_replace(array("https://","http://"), "", $url);
		
		$pos=strpos($url, "/");
		if($pos===false){
			return "";
		}else{
			$url=substr($url, $pos+1);
			$root=preg_replace("/^\//", "", __ROOT__);
			$root=str_replace("/", "\/", $root);
			$url=preg_replace("/^".$root."\//", "", $url);
			return $url;
		}
	}
	return $url;
}

/**
 * 
 * @param string $tag
 * @param array $where
 * @return array
 */

function sp_get_users($tag="field:*;limit:0,8;order:create_time desc;",$where=array()){
	$where=array();
	$tag=sp_param_lable($tag);
	$field = !empty($tag['field']) ? $tag['field'] : '*';
	$limit = !empty($tag['limit']) ? $tag['limit'] : '8';
	$order = !empty($tag['order']) ? $tag['order'] : 'create_time desc';
	
	//根据参数生成查询条件
	$mwhere['user_status'] = array('eq',1);
	$mwhere['user_type'] = array('eq',2);//default user
	
	if(is_array($where)){
		$where=array_merge($mwhere,$where);
	}else{
		$where=$mwhere;
	}
	
	$users_model=M("Users");
	
	$users=$users_model->field($field)->where($where)->order($order)->limit($limit)->select();
	return $users;
}

/**
 * URL组装 支持不同URL模式
 * @param string $url URL表达式，格式：'[模块/控制器/操作#锚点@域名]?参数1=值1&参数2=值2...'
 * @param string|array $vars 传入的参数，支持数组和字符串
 * @param string $suffix 伪静态后缀，默认为true表示获取配置值
 * @param boolean $domain 是否显示域名
 * @return string
 */
function leuu($url='',$vars='',$suffix=true,$domain=false){
	$routes=sp_get_routes();
	if(empty($routes)){
		return U($url,$vars,$suffix,$domain);
	}else{
		// 解析URL
		$info   =  parse_url($url);
		$url    =  !empty($info['path'])?$info['path']:ACTION_NAME;
		if(isset($info['fragment'])) { // 解析锚点
			$anchor =   $info['fragment'];
			if(false !== strpos($anchor,'?')) { // 解析参数
				list($anchor,$info['query']) = explode('?',$anchor,2);
			}
			if(false !== strpos($anchor,'@')) { // 解析域名
				list($anchor,$host)    =   explode('@',$anchor, 2);
			}
		}elseif(false !== strpos($url,'@')) { // 解析域名
			list($url,$host)    =   explode('@',$info['path'], 2);
		}
		
		// 解析子域名
		//TODO
		
		// 解析参数
		if(is_string($vars)) { // aaa=1&bbb=2 转换成数组
			parse_str($vars,$vars);
		}elseif(!is_array($vars)){
			$vars = array();
		}
		if(isset($info['query'])) { // 解析地址里面参数 合并到vars
			parse_str($info['query'],$params);
			$vars = array_merge($params,$vars);
		}
		
		$vars_src=$vars;
		
		ksort($vars);
		
		// URL组装
		$depr       =   C('URL_PATHINFO_DEPR');
		$urlCase    =   C('URL_CASE_INSENSITIVE');
		if('/' != $depr) { // 安全替换
			$url    =   str_replace('/',$depr,$url);
		}
		// 解析模块、控制器和操作
		$url        =   trim($url,$depr);
		$path       =   explode($depr,$url);
		$var        =   array();
		$varModule      =   C('VAR_MODULE');
		$varController  =   C('VAR_CONTROLLER');
		$varAction      =   C('VAR_ACTION');
		$var[$varAction]       =   !empty($path)?array_pop($path):ACTION_NAME;
		$var[$varController]   =   !empty($path)?array_pop($path):CONTROLLER_NAME;
		if($maps = C('URL_ACTION_MAP')) {
			if(isset($maps[strtolower($var[$varController])])) {
				$maps    =   $maps[strtolower($var[$varController])];
				if($action = array_search(strtolower($var[$varAction]),$maps)){
					$var[$varAction] = $action;
				}
			}
		}
		if($maps = C('URL_CONTROLLER_MAP')) {
			if($controller = array_search(strtolower($var[$varController]),$maps)){
				$var[$varController] = $controller;
			}
		}
		if($urlCase) {
			$var[$varController]   =   parse_name($var[$varController]);
		}
		$module =   '';
		
		if(!empty($path)) {
			$var[$varModule]    =   array_pop($path);
		}else{
			if(C('MULTI_MODULE')) {
				if(MODULE_NAME != C('DEFAULT_MODULE') || !C('MODULE_ALLOW_LIST')){
					$var[$varModule]=   MODULE_NAME;
				}
			}
		}
		if($maps = C('URL_MODULE_MAP')) {
			if($_module = array_search(strtolower($var[$varModule]),$maps)){
				$var[$varModule] = $_module;
			}
		}
		if(isset($var[$varModule])){
			$module =   $var[$varModule];
		}
		
		if(C('URL_MODEL') == 0) { // 普通模式URL转换
			$url        =   __APP__.'?'.http_build_query(array_reverse($var));
			
			if($urlCase){
				$url    =   strtolower($url);
			}
			if(!empty($vars)) {
				$vars   =   http_build_query($vars);
				$url   .=   '&'.$vars;
			}
		}else{ // PATHINFO模式或者兼容URL模式
			
			if(empty($var[C('VAR_MODULE')])){
				$var[C('VAR_MODULE')]=MODULE_NAME;
			}
				
			$module_controller_action=strtolower(implode($depr,array_reverse($var)));
			
			$has_route=false;
			$original_url=$module_controller_action.(empty($vars)?"":"?").http_build_query($vars);
			
			if(isset($routes['static'][$original_url])){
			    $has_route=true;
			    $url=__APP__."/".$routes['static'][$original_url];
			}else{
			    if(isset($routes['dynamic'][$module_controller_action])){
			        $urlrules=$routes['dynamic'][$module_controller_action];
			    
			        $empty_query_urlrule=array();
			    
			        foreach ($urlrules as $ur){
			            $intersect=array_intersect_assoc($ur['query'], $vars);
			            if($intersect){
			                $vars=array_diff_key($vars,$ur['query']);
			                $url= $ur['url'];
			                $has_route=true;
			                break;
			            }
			            if(empty($empty_query_urlrule) && empty($ur['query'])){
			                $empty_query_urlrule=$ur;
			            }
			        }
			    
			        if(!empty($empty_query_urlrule)){
			            $has_route=true;
			            $url=$empty_query_urlrule['url'];
			        }
			        
			        $new_vars=array_reverse($vars);
			        foreach ($new_vars as $key =>$value){
			            if(strpos($url, ":$key")!==false){
			                $url=str_replace(":$key", $value, $url);
			                unset($vars[$key]);
			            }
			        }
			        $url=str_replace(array("\d","$"), "", $url);
			    
			        if($has_route){
			            if(!empty($vars)) { // 添加参数
			                foreach ($vars as $var => $val){
			                    if('' !== trim($val))   $url .= $depr . $var . $depr . urlencode($val);
			                }
			            }
			            $url =__APP__."/".$url ;
			        }
			    }
			}
			
			$url=str_replace(array("^","$"), "", $url);
			
			if(!$has_route){
				$module =   defined('BIND_MODULE') ? '' : $module;
				$url    =   __APP__.'/'.implode($depr,array_reverse($var));
					
				if($urlCase){
					$url    =   strtolower($url);
				}
					
				if(!empty($vars)) { // 添加参数
					foreach ($vars as $var => $val){
						if('' !== trim($val))   $url .= $depr . $var . $depr . urlencode($val);
					}
				}
			}
			
			
			if($suffix) {
				$suffix   =  $suffix===true?C('URL_HTML_SUFFIX'):$suffix;
				if($pos = strpos($suffix, '|')){
					$suffix = substr($suffix, 0, $pos);
				}
				if($suffix && '/' != substr($url,-1)){
					$url  .=  '.'.ltrim($suffix,'.');
				}
			}
		}
		
		if(isset($anchor)){
			$url  .= '#'.$anchor;
		}
		if($domain) {
			$url   =  (is_ssl()?'https://':'http://').$domain.$url;
		}

		return $url;
	}
}

/**
 * URL组装 支持不同URL模式
 * @param string $url URL表达式，格式：'[模块/控制器/操作#锚点@域名]?参数1=值1&参数2=值2...'
 * @param string|array $vars 传入的参数，支持数组和字符串
 * @param string $suffix 伪静态后缀，默认为true表示获取配置值
 * @param boolean $domain 是否显示域名
 * @return string
 */
function UU($url='',$vars='',$suffix=true,$domain=false){
	return leuu($url,$vars,$suffix,$domain);
}


function sp_get_routes($refresh=false){
	$routes=F("routes");
	
	if( (!empty($routes)||is_array($routes)) && !$refresh){
		return $routes;
	}
	$routes=M("Route")->where("status=1")->order("listorder asc")->select();
	$all_routes=array();
	$cache_routes=array();
	foreach ($routes as $er){
		$full_url=htmlspecialchars_decode($er['full_url']);
			
		// 解析URL
		$info   =  parse_url($full_url);
			
		$path       =   explode("/",$info['path']);
		if(count($path)!=3){//必须是完整 url
			continue;
		}
			
		$module=strtolower($path[0]);
			
		// 解析参数
		$vars = array();
		if(isset($info['query'])) { // 解析地址里面参数 合并到vars
			parse_str($info['query'],$params);
			$vars = array_merge($params,$vars);
		}
			
		$vars_src=$vars;
			
		ksort($vars);
			
		$path=$info['path'];
			
		$full_url=$path.(empty($vars)?"":"?").http_build_query($vars);
			
		$url=$er['url'];
		
		if(strpos($url,':')===false){
		    $cache_routes['static'][$full_url]=$url;
		}else{
		    $cache_routes['dynamic'][$path][]=array("query"=>$vars,"url"=>$url);
		}
			
		$all_routes[$url]=$full_url;
			
	}
	F("routes",$cache_routes);
	$route_dir=SITE_PATH."/data/conf/";
	if(!file_exists($route_dir)){
		mkdir($route_dir);
	}
		
	$route_file=$route_dir."route.php";
		
	file_put_contents($route_file, "<?php\treturn " . stripslashes(var_export($all_routes, true)) . ";");
	
	return $cache_routes;
	
	
}

/**
 * 判断是否为手机访问
 * @return  boolean
 */
function sp_is_mobile() {
	static $sp_is_mobile;

	if ( isset($sp_is_mobile) )
		return $sp_is_mobile;

	if ( empty($_SERVER['HTTP_USER_AGENT']) ) {
		$sp_is_mobile = false;
	} elseif ( strpos($_SERVER['HTTP_USER_AGENT'], 'Mobile') !== false // many mobile devices (all iPhone, iPad, etc.)
			|| strpos($_SERVER['HTTP_USER_AGENT'], 'Android') !== false
			|| strpos($_SERVER['HTTP_USER_AGENT'], 'Silk/') !== false
			|| strpos($_SERVER['HTTP_USER_AGENT'], 'Kindle') !== false
			|| strpos($_SERVER['HTTP_USER_AGENT'], 'BlackBerry') !== false
			|| strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mini') !== false
			|| strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mobi') !== false ) {
		$sp_is_mobile = true;
	} else {
		$sp_is_mobile = false;
	}

	return $sp_is_mobile;
}

/**
 * 处理插件钩子
 * @param string $hook   钩子名称
 * @param mixed $params 传入参数
 * @return void
 */
function hook($hook,$params=array()){
	tag($hook,$params);
}

/**
 * 处理插件钩子,只执行一个
 * @param string $hook   钩子名称
 * @param mixed $params 传入参数
 * @return void
 */
function hook_one($hook,$params=array()){
    return \Think\Hook::listen_one($hook,$params);
}


/**
 * 获取插件类的类名
 * @param strng $name 插件名
 */
function sp_get_plugin_class($name){
	$class = "plugins\\{$name}\\{$name}Plugin";
	return $class;
}

/**
 * 获取插件类的配置
 * @param string $name 插件名
 * @return array
 */
function sp_get_plugin_config($name){
	$class = sp_get_plugin_class($name);
	if(class_exists($class)) {
		$plugin = new $class();
		return $plugin->getConfig();
	}else {
		return array();
	}
}

/**
 * 替代scan_dir的方法
 * @param string $pattern 检索模式 搜索模式 *.txt,*.doc; (同glog方法)
 * @param int $flags
 */
function sp_scan_dir($pattern,$flags=null){
	$files = array_map('basename',glob($pattern, $flags));
	return $files;
}

/**
 * 获取所有钩子，包括系统，应用，模板
 */
function sp_get_hooks($refresh=false){
	if(!$refresh){
		$return_hooks = F('all_hooks');
		if(!empty($return_hooks)){
			return $return_hooks;
		}
	}
	
	$return_hooks=array();
	$system_hooks=array(
		"url_dispatch","app_init","app_begin","app_end",
		"action_begin","action_end","module_check","path_info",
		"template_filter","view_begin","view_end","view_parse",
		"view_filter","body_start","footer","footer_end","sider","comment",'admin_home'
	);
	
	$app_hooks=array();
	
	$apps=sp_scan_dir(SPAPP."*",GLOB_ONLYDIR);
	foreach ($apps as $app){
		$hooks_file=SPAPP.$app."/hooks.php";
		if(is_file($hooks_file)){
			$hooks=include $hooks_file;
			$app_hooks=is_array($hooks)?array_merge($app_hooks,$hooks):$app_hooks;
		}
	}
	
	$tpl_hooks=array();
	
	$tpls=sp_scan_dir("themes/*",GLOB_ONLYDIR);
	
	foreach ($tpls as $tpl){
		$hooks_file= sp_add_template_file_suffix("themes/$tpl/hooks");
		if(file_exists_case($hooks_file)){
			$hooks=file_get_contents($hooks_file);
			$hooks=preg_replace("/[^0-9A-Za-z_-]/u", ",", $hooks);
			$hooks=explode(",", $hooks);
			$hooks=array_filter($hooks);
			$tpl_hooks=is_array($hooks)?array_merge($tpl_hooks,$hooks):$tpl_hooks;
		}
	}
	
	$return_hooks=array_merge($system_hooks,$app_hooks,$tpl_hooks);
	
	$return_hooks=array_unique($return_hooks);
	
	F('all_hooks',$return_hooks);
	return $return_hooks;
	
}


/**
 * 生成访问插件的url
 * @param string $url url 格式：插件名://控制器名/方法
 * @param array $param 参数
 */
function sp_plugin_url($url, $param = array(),$domain=false){
	$url        = parse_url($url);
	$case       = C('URL_CASE_INSENSITIVE');
	$plugin     = $case ? parse_name($url['scheme']) : $url['scheme'];
	$controller = $case ? parse_name($url['host']) : $url['host'];
	$action     = trim($case ? strtolower($url['path']) : $url['path'], '/');

	/* 解析URL带的参数 */
	if(isset($url['query'])){
		parse_str($url['query'], $query);
		$param = array_merge($query, $param);
	}

	/* 基础参数 */
	$params = array(
			'_plugin'     => $plugin,
			'_controller' => $controller,
			'_action'     => $action,
	);
	$params = array_merge($params, $param); //添加额外参数

	return U('api/plugin/execute', $params,true,$domain);
}

/**
 * 检查权限
 * @param name string|array  需要验证的规则列表,支持逗号分隔的权限规则或索引数组
 * @param uid  int           认证用户的id
 * @param relation string    如果为 'or' 表示满足任一条规则即通过验证;如果为 'and'则表示需满足所有规则才能通过验证
 * @return boolean           通过验证返回true;失败返回false
 */
function sp_auth_check($uid,$name=null,$relation='or'){
	if(empty($uid)){
		return false;
	}
	
	$iauth_obj=new \Common\Lib\iAuth();
	if(empty($name)){
		$name=strtolower(MODULE_NAME."/".CONTROLLER_NAME."/".ACTION_NAME);
	}
	return $iauth_obj->check($uid, $name, $relation);
}

/**
 * 兼容之前版本的ajax的转化方法，如果你之前用参数只有两个可以不用这个转化，如有两个以上的参数请升级一下
 * @param array $data
 * @param string $info
 * @param int $status
 */
function sp_ajax_return($data,$info,$status){
	$return = array();
	$return['data'] = $data;
	$return['info'] = $info;
	$return['status'] = $status;
	$data = $return;
	
	return $data;
}

/**
 * 判断是否为SAE
 */
function sp_is_sae(){
	if(defined('APP_MODE') && APP_MODE=='sae'){
		return true;
	}else{
		return false;
	}
}


function sp_alpha_id($in, $to_num = false, $pad_up = 4, $passKey = null){
	$index = "aBcDeFgHiJkLmNoPqRsTuVwXyZAbCdEfGhIjKlMnOpQrStUvWxYz0123456789";
	if ($passKey !== null) {
		// Although this function's purpose is to just make the
		// ID short - and not so much secure,
		// with this patch by Simon Franz (http://blog.snaky.org/)
		// you can optionally supply a password to make it harder
		// to calculate the corresponding numeric ID

		for ($n = 0; $n<strlen($index); $n++) $i[] = substr( $index,$n ,1);

		$passhash = hash('sha256',$passKey);
		$passhash = (strlen($passhash) < strlen($index)) ? hash('sha512',$passKey) : $passhash;

		for ($n=0; $n < strlen($index); $n++) $p[] =  substr($passhash, $n ,1);

		array_multisort($p,  SORT_DESC, $i);
		$index = implode($i);
	}

	$base  = strlen($index);

	if ($to_num) {
		// Digital number  <<--  alphabet letter code
		$in  = strrev($in);
		$out = 0;
		$len = strlen($in) - 1;
		for ($t = 0; $t <= $len; $t++) {
			$bcpow = pow($base, $len - $t);
			$out   = $out + strpos($index, substr($in, $t, 1)) * $bcpow;
		}

		if (is_numeric($pad_up)) {
			$pad_up--;
			if ($pad_up > 0) $out -= pow($base, $pad_up);
		}
		$out = sprintf('%F', $out);
		$out = substr($out, 0, strpos($out, '.'));
	}else{
		// Digital number  -->>  alphabet letter code
		if (is_numeric($pad_up)) {
			$pad_up--;
			if ($pad_up > 0) $in += pow($base, $pad_up);
		}

		$out = "";
		for ($t = floor(log($in, $base)); $t >= 0; $t--) {
			$bcp = pow($base, $t);
			$a   = floor($in / $bcp) % $base;
			$out = $out . substr($index, $a, 1);
			$in  = $in - ($a * $bcp);
		}
		$out = strrev($out); // reverse
	}

	return $out;
}

/**
 * 验证码检查，验证完后销毁验证码增加安全性 ,<br>返回true验证码正确，false验证码错误
 * @return boolean <br>true：验证码正确，false：验证码错误
 */
function sp_check_verify_code(){
    $id = '';
    if(isset($_GET['id']) && intval($_GET['id'])){
        $id = intval($_GET['id']);
    }
	$verify = new \Think\Verify();
	return $verify->check($_REQUEST['verify'], $id);
}

/**
 * 手机验证码检查，验证完后销毁验证码增加安全性 ,<br>返回true验证码正确，false验证码错误
 * @return boolean <br>true：手机验证码正确，false：手机验证码错误
 */
function sp_check_mobile_verify_code(){
    return true;
}


/**
 * 执行SQL文件  sae 环境下file_get_contents() 函数好像有间歇性bug。
 * @param string $sql_path sql文件路径
 * @author 5iymt <1145769693@qq.com>
 */
function sp_execute_sql_file($sql_path) {
    	
	$context = stream_context_create ( array (
			'http' => array (
					'timeout' => 30 
			) 
	) ) ;// 超时时间，单位为秒
	
	// 读取SQL文件
	$sql = file_get_contents ( $sql_path, 0, $context );
	$sql = str_replace ( "\r", "\n", $sql );
	$sql = explode ( ";\n", $sql );
	
	// 替换表前缀
	$orginal = 'sp_';
	$prefix = C ( 'DB_PREFIX' );
	$sql = str_replace ( "{$orginal}", "{$prefix}", $sql );
	
	// 开始安装
	foreach ( $sql as $value ) {
		$value = trim ( $value );
		if (empty ( $value )){
			continue;
		}
		$res = M ()->execute ( $value );
	}
}

/**
 * 插件R方法扩展 建立多插件之间的互相调用。提供无限可能
 * 使用方式 get_plugns_return('Chat://Index/index',array())
 * @param string $url 调用地址
 * @param array $params 调用参数
 * @author 5iymt <1145769693@qq.com>
 */
function sp_get_plugins_return($url, $params = array()){
	$url        = parse_url($url);
	$case       = C('URL_CASE_INSENSITIVE');
	$plugin     = $case ? parse_name($url['scheme']) : $url['scheme'];
	$controller = $case ? parse_name($url['host']) : $url['host'];
	$action     = trim($case ? strtolower($url['path']) : $url['path'], '/');
	
	/* 解析URL带的参数 */
	if(isset($url['query'])){
		parse_str($url['query'], $query);
		$params = array_merge($query, $params);
	}
	return R("plugins://{$plugin}/{$controller}/{$action}", $params);
}

/**
 * 给没有后缀的模板文件，添加后缀名
 * @param string $filename_nosuffix
 */
function sp_add_template_file_suffix($filename_nosuffix){

    if(file_exists_case($filename_nosuffix.C('TMPL_TEMPLATE_SUFFIX'))){
        $filename_nosuffix = $filename_nosuffix.C('TMPL_TEMPLATE_SUFFIX');
    }else if(file_exists_case($filename_nosuffix.".php")){
        $filename_nosuffix = $filename_nosuffix.".php";
    }else{
        $filename_nosuffix = $filename_nosuffix.C('TMPL_TEMPLATE_SUFFIX');
    }
    
    return $filename_nosuffix;
}

/**
 * 获取当前主题名
 * @param string $default_theme 指定的默认模板名
 * @return string
 */
function sp_get_current_theme($default_theme=''){
    $theme      =    C('SP_DEFAULT_THEME');
    if(C('TMPL_DETECT_THEME')){// 自动侦测模板主题
        $t = C('VAR_TEMPLATE');
        if (isset($_GET[$t])){
            $theme = $_GET[$t];
        }elseif(cookie('think_template')){
            $theme = cookie('think_template');
        }
    }
    $theme=empty($default_theme)?$theme:$default_theme;
    
    return $theme;
}

/**
 * 判断模板文件是否存在，区分大小写
 * @param string $file 模板文件路径，相对于当前模板根目录，不带模板后缀名
 */
function sp_template_file_exists($file){
    $theme= sp_get_current_theme();
    $filepath=C("SP_TMPL_PATH").$theme."/".$file;
    $tplpath = sp_add_template_file_suffix($filepath);
    
    if(file_exists_case($tplpath)){
        return true;
    }else{
        return false;
    }
    
}

/**
*根据菜单id获得菜单的详细信息，可以整合进获取菜单数据的方法(_sp_get_menu_datas)中。
*@param num $id  菜单id，每个菜单id
* @author 5iymt <1145769693@qq.com>
*/
function sp_get_menu_info($id,$navdata=false){
    if(empty($id)&&$navdata){
		//若菜单id不存在，且菜单数据存在。
		$nav=$navdata;
	}else{
		$nav_obj= M("Nav");
		$id= intval($id);
		$nav= $nav_obj->where("id=$id")->find();//菜单数据
	}

	$href=htmlspecialchars_decode($nav['href']);
	$hrefold=$href;

	if(strpos($hrefold,"{")){//序列 化的数据
		$href=unserialize(stripslashes($nav['href']));
		$default_app=strtolower(C("DEFAULT_MODULE"));
		$href=strtolower(leuu($href['action'],$href['param']));
		$g=C("VAR_MODULE");
		$href=preg_replace("/\/$default_app\//", "/",$href);
		$href=preg_replace("/$g=$default_app&/", "",$href);
	}else{
		if($hrefold=="home"){
			$href=__ROOT__."/";
		}else{
			$href=$hrefold;
		}
	}
	$nav['href']=$href;
	return $nav;
}

/**
 * 判断当前的语言包，并返回语言包名
 */
function sp_check_lang(){
    $langSet = C('DEFAULT_LANG');
    if (C('LANG_SWITCH_ON',null,false)){
        
        $varLang =  C('VAR_LANGUAGE',null,'l');
        $langList = C('LANG_LIST',null,'zh-cn');
        // 启用了语言包功能
        // 根据是否启用自动侦测设置获取语言选择
        if (C('LANG_AUTO_DETECT',null,true)){
            if(isset($_GET[$varLang])){
                $langSet = $_GET[$varLang];// url中设置了语言变量
                cookie('think_language',$langSet,3600);
            }elseif(cookie('think_language')){// 获取上次用户的选择
                $langSet = cookie('think_language');
            }elseif(isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])){// 自动侦测浏览器语言
                preg_match('/^([a-z\d\-]+)/i', $_SERVER['HTTP_ACCEPT_LANGUAGE'], $matches);
                $langSet = $matches[1];
                cookie('think_language',$langSet,3600);
            }
            if(false === stripos($langList,$langSet)) { // 非法语言参数
                $langSet = C('DEFAULT_LANG');
            }
        }
    }
    
    return strtolower($langSet);
    
}

/**
* 删除图片物理路径
* @param array $imglist 图片路径
* @return bool 是否删除图片
* @author 高钦 <395936482@qq.com>
*/
function sp_delete_physics_img($imglist){
    $file_path = C("UPLOADPATH");
    
    if ($imglist) {
        if ($imglist['thumb']) {
            $file_path = $file_path . $imglist['thumb'];
            if (file_exists($file_path)) {
                $result = @unlink($file_path);
                if ($result == false) {
                    $res = TRUE;
                } else {
                    $res = FALSE;
                }
            } else {
                $res = FALSE;
            }
        }
        
        if ($imglist['photo']) {
            foreach ($imglist['photo'] as $key => $value) {
                $file_path = C("UPLOADPATH");
                $file_path_url = $file_path . $value['url'];
                if (file_exists($file_path_url)) {
                    $result = @unlink($file_path_url);
                    if ($result == false) {
                        $res = TRUE;
                    } else {
                        $res = FALSE;
                    }
                } else {
                    $res = FALSE;
                }
            }
        }
    } else {
        $res = FALSE;
    }
    
    return $res;
}
/**
 * 系统缓存缓存管理
 * @param mixed $name 缓存名称
 * @param mixed $value 缓存值
 * @param mixed $options 缓存参数
 * @author sd <>
 * @return mixed
 */
function cache($name, $value = '', $options = null) {
    static $cache = '';
    if (empty($cache)) {
        $cache = \Think\Cache::getInstance();
    }//print_r($cache);
    // 获取缓存
    if ('' === $value) {
        if (false !== strpos($name, '.')) {
            $vars = explode('.', $name);
            $data = $cache->__get($vars[0]);
            return is_array($data) ? $data[$vars[1]] : $data;
        } else {
            return $cache->__get($name);
        }
    } elseif (is_null($value)) {//删除缓存
        return $cache->__unset($name);
    } else {//缓存数据
        if (is_array($options)) {
            $expire = isset($options['expire']) ? $options['expire'] : NULL;
        } else {
            $expire = is_numeric($options) ? $options : NULL;
        }
        return $cache->__set($name, $value);
    }
}


/**
 * 动态加载文件
 * @param array $imglist 图片路径
 * @return bool 是否删除图片
 * @author zckop <304400612@qq.com>
 */
function zcload($file,$template='reanod'){
    $zc_controller = new \Common\Controller\HomebaseController();
    if($file == 'script'){
        $str = $zc_controller->fetch("{$template}@/Zckop/script");
        //控制鼠标移动加红块边框
        if($_SESSION['editModel'] ==1){
            $str .= $zc_controller->fetch("Public@/reanod/admin");
        }
        return $str;
    }

    // 不能加缓存，否则位置不会改变
    $ModuleBlocks = M('ModuleBlocks')->where('rsign="'.$file.'"')->order('listorder asc')->select();
    $mvc = MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
    switch ($mvc) {
        case 'Content/Pagedis/lists':
            $hash = md5('Content/Pagedis/lists'.$zc_controller->catid);
            break;
        case 'Content/Createhtml/category':
        case 'Content/Createhtml/update_post':
        case 'Content/Createhtml/update_show':
            $parse = parse_url($zc_controller->moveurl);
            parse_str($parse['query'],$zcparse);
            if($zc_controller->type === false)
                $hash = md5('Portal/Index/index');
            elseif($zc_controller->type == 1)
            	$hash = md5($zcparse['g'].'/'.$zcparse['m'].'/'.$zcparse['a'].$zc_controller->catid);
        	else
            	$hash = md5($zcparse['g'].'/'.$zcparse['m'].'/'.$zcparse['a']);
            break;
        case 'Content/Createhtml/index':
            $hash = md5('Portal/Index/index');
            break;

        default:
            $hash = md5($mvc);
            break;
    }

    //控制鼠标移动加操作按钮
    $zcstr = '<div id="' . $file . '">';
    if($_SESSION['editModel'] ==1) {
        foreach($ModuleBlocks as $v) {
            if(!($v['hash']=='_ALL' || $v['hash'] ==$hash))continue;
            $zc_controller->assign('zcmod',$v);
            $content = json_decode($v['content'],true);
            $zcstr .= '<div id="'.$v['alias'].'">';
            $zcstr .= '<div id="rn_'.$v['alias'].'" style="display:none">';
            if($v['action'] != 'searchresult' && $t = $content['zcmsg']['edit']){
                if(($catid = I('get.catid',0,'intval')) && strchr($t['url'],'catid')===false){
                    $t['url'] .= '&catid='.$catid;
                }
                if($id = I('get.id',0,'intval')){
                    $t['url'] .= '&id='.$id.'&sign=1';
                }
                $zcstr .= '<a href="#" title="'.$t['title'].'" onclick="zctan(\''.$t['url'].'\',\''.$t['title'].'\',\''.$t['width'].'\',\''.$t['height'].'\');return false;"><img src="images/edit_icon.gif" border="0" alt="'.$t['title'].'" />'.$t['title'].'</a>';
            }
            //显示属性
            if($t = $content['zcmsg']['attr']){
                $zcstr .= '<a href="#" title="'.$t['title'].'" onclick="zctan(\''.U("Portal/{$v['module']}/{$v['action']}",array(id=>$v['id'])).'\',\''.$t['title'].'\',\''.$t['width'].'\',\''.$t['height'].'\');return false;"><img src="images/edit_icon.gif" border="0" alt="'.$t['title'].'" />'.$t['title'].'</a>';
            }
            $zcstr .= '</div>';
            if($v['show_title']){
                if ($t = $content['zcmsg']['attr']['argu']['title_link']) {
                    $zcstr .= "<h3><a href={$content['zcmsg']['attr']['argu']['title_link']}>{$v['title']}</a></h3>";
                }else {
                    $zcstr .= "<h3>{$v['title']}</h3>";
                }
            }
            $zcstr .= $zc_controller->fetch("{$template}@/{$v['module']}/{$v['action']}");
            $zcstr .= '</div>';
        }
    }else{
        foreach ($ModuleBlocks as $v) {
            if(!($v['hash']=='_ALL' || $v['hash'] ==$hash))continue;
            $zc_controller->assign('zcmod',$v);
            if($v['show_title']){
                $zcstr .= "<h3>{$v['title']}</h3>";
            }
            $zcstr .= $zc_controller->fetch("{$template}@/{$v['module']}/{$v['action']}");
        }
    }
    // $zcstr .= '<div class="clear"></div>';
    $zcstr .= '</div>';
    return $zcstr;
}

/**
 * 验证码检查，验证完后销毁验证码增加安全性 ,<br>返回true验证码正确，false验证码错误
 * @return boolean <br>true：验证码正确，false：验证码错误
 */
function zc_check_verify($id=''){
    $verify = new \Think\Verify();
    return $verify->check($_REQUEST['verify'], $id);
}

/**
 * 语言包前台展示内容
 * @param  string $id
 * @return  array
 */
function getContactValue($id){
	$cValue = M('Contact')->where('id="'.intval($id).'"')->field('contant_name as k,contant_value as v')->find();
	return $cValue;
}

/**
 * 请求接口返回内容
 * @param  string $url [请求的URL地址]
 * @param  string/array $params [请求的参数]
 * @return  string
 */
function zccurl($url,$params='',$vars=''){
    $msg = array();
    $url = C('REANODFWQ').$url.'?'.$vars;
    $ch = curl_init();
    curl_setopt( $ch, CURLOPT_HTTP_VERSION , CURL_HTTP_VERSION_1_1 );
    curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT , 60 );
    curl_setopt( $ch, CURLOPT_TIMEOUT , 60);
    curl_setopt( $ch, CURLOPT_RETURNTRANSFER , true );
    curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, true);
    if(file_exists("data/conf/db.php")){
        $db=include "data/conf/db.php";
        if($db['FWQ_HOST'])$db['DB_HOST'] = $db['FWQ_HOST'];
    }else{
        $msg['status'] = 'fail';
        $msg['msg'] = '数据库配置文件不存在';
        $this->error($msg);
    }

    if($params){
        if(is_array($params)){
            $params['db'] = $db;
        }elseif(is_string($params)){
            $params .= '&db='.$db;
        }
    }else{
        $params = array('db'=>$db);
    }

    curl_setopt( $ch , CURLOPT_POST , true );
    curl_setopt( $ch , CURLOPT_POSTFIELDS , http_build_query($params) );
    curl_setopt( $ch , CURLOPT_URL , $url );
    $response = curl_exec( $ch );
    curl_close( $ch );
    $data = json_decode($response,true);
    if($data['state']=='success'){
    	return $data['msg'];
    }else{
    	echo '本功能需要付费试用，如果以付费，请联系管理员';
        exit;
    }
}

/**
 * 复制文件夹
 * $src 要复制的文件夹
 * $dst 复制到的路径
 * @author zckop <304400612@qq.com>
 */
function zc_copy($src,$dst) {
    $dir = opendir($src);
    @mkdir($dst);
    while(false !== ( $file = readdir($dir))){
        if (( $file != '.' ) && ( $file != '..' )){
            if (is_dir($src . '/' . $file)){
                zc_copy($src . '/' . $file,$dst . '/' . $file);
            }else{
                copy($src . '/' . $file,$dst . '/' . $file);
            }
        }
    }
    closedir($dir);
}

/**
 * 实例化MONGODB
 * @param string $name Model名称 支持指定基础模型 例如 MongoModel:User
 * @author zckop <304400612@qq.com>
 * @return Think\Model
 */

function MG($table_name = ''){
	$db_config = array(
		'DB_TYPE'=>'mongo',
		'DB_USER'=>'Reanod',
		'DB_PWD' =>'ReaNod6688',
		'DB_HOST'=>'localhost',
		'DB_PORT'=>'27017',
		'DB_NAME'=>'xinxiangmu'
	);
	$db_prefix = C('DB_PREFIX');
	if(strpos($table_name,'.') === false) {
		$table_name = $db_config['DB_NAME'].'.'.$table_name;
	}
	return M( '\Think\Model\MongoModel:' . $table_name , $db_prefix , $db_config );
}

/**
 * 生成随机域名
 * @author zckop <304400612@qq.com>
 */
function zc_domain() {
    $string = uniqid();
    $code = '';
    $hex_code = 'qaz2ws3edc4rfv5tgb6yhn7ujm8ik9p';
    $now = microtime(true) * 10000;

    $hash_code = hash('sha256', $string);

    // 这里会为编码定义一个随机的长度，长度取决于step
    $step = rand(8, 16);
    $count = ceil(strlen($hash_code) / $step);

    for($i = 0; $i < $count; $i++) {
      $start = $i * $step;
      $hex_num = substr($hash_code, $start, $step);
      $num = 0x3fffffff & (1 * '0x' . $hex_num);
      $n = $num % $strlen;
      $code .= $hex_code[$n];
    }

    return $code;
}


/**
 * 栏目内容管理过滤（支持跨模型）
 * @author zckop <304400612@qq.com>
 */
function zc_llnrgl($arr,$modelid){
    $del_mode = array();
    foreach($arr as $key=>$value)
    {
        if($value['modelid']!=$modelid)
        {
            $del_mode[$value['catid']] = $value['parentid'];
            unset($arr[$key]);
        }
    }
    while(1)
    {
        $run = 0;
        foreach($arr as $k=>$v)
        {
            if(in_array($v['parentid'],array_keys($del_mode)))
            {
                $arr[$k]['parentid'] = $del_mode[$v['parentid']];
                $run=1;
            }
        }
        if(!$run)
        {
            break;
        }
    }
    return $arr;
}

/**
 * 产品和文章访问记录
 * @author zckop <304400612@qq.com>
 */
function zc_proart($durl,$title,$modelid){
    $urlinfo = array('url'=>$durl,'title'=>$title,'modelid'=>$modelid);
    $ipinfo = getlocation_ip();
    $zcoe = md5("last_access_".$durl.$modelid);
    $last_access = cookie($zcoe);
    if(!isset($last_access)||(time()-$last_access)>30){
        $map['ip']=$ipinfo['ip'];
        $map['country']=$ipinfo['country']?$ipinfo['country']:'中国';
        $map['url']=$urlinfo['url'];
        $map['modelid']=$urlinfo['modelid'];
        $map['time']=strtotime(date("Y-m-d",time()));
        $v_info = M("Artpro")->where($map)->find();
        if($v_info){
            $data['clicks'] = $v_info['clicks']+1;
            $re = M("Artpro")->where($map)->save($data);
        }else{
            $map['title']=$urlinfo['title'];
            $re = M("Artpro")->add($map);
        }

        cookie($zcoe,time());
        if($re){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}

/**
 * 前台语言选择
 * @param array $argv post数组
 * @author zckop <304400612@qq.com>
 */
function zc_lang(){
    $languages = S('languages');
    if($_SESSION['ADMIN_ID']){

    }
}

/**
 * 'cmf_guestbook_field'内容缓存
 * @param array $argv post数组
 * @author zckop <304400612@qq.com>
 */
function zc_guestbookfield($argv){
    $arr = F('guestbookfield');
    if(!$arr){
        $arr = M('GuestbookField')->field('name,desc')->select();
        F('guestbookfield',$arr);
    }
    $str = '';
    if(isset($argv['file']))unset($argv['file']);
    if(isset($argv['verify']))unset($argv['verify']);
    foreach($arr as $v){
        if(isset($argv[$v['name']])){
        	if($v['name']==='pid'){
        		$argv[$v['name']] = stripslashes($argv[$v['name']]);
        	}
            $str .= $v['desc'].':'.$argv[$v['name']].'<br />';
        }
    }
    return $str;
}



/**
 * 生成EXCEL
 * @param array $arr 需要生成的数组
 * @author zckop <304400612@qq.com>
 */
function zcexcel($arr){
    import("Org.PHPExcel.PHPExcel#php",'','');
    $objPHPExcel = new \PHPExcel();
    $letter = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
    if(($count = count($arr[0])) > 26){
        return false;
    }

    foreach($arr as $k=>$v){
        for($i=0;$i<$count;$i++){
            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue($letter[$i].($k+1),$v[$i]);
            $objPHPExcel->getActiveSheet()->getColumnDimension($letter[$i])->setAutoSize(true);
        }
    }

    $objPHPExcel->getActiveSheet()->setTitle('Reanod');
    $objPHPExcel->setActiveSheetIndex(0);



    // 下载
    ob_end_clean();
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Inquiry.xls"');
    header('Cache-Control: max-age=0');
    header('Cache-Control: max-age=1');
    header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
    header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');
    header ('Cache-Control: cache, must-revalidate');
    header ('Pragma: public');
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    $objWriter->save('php://output');


/*
    //保存
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save('Inquiry.xls');
*/

}

/**
 * 生成PDF
 * @param string $a 静态地址
 * @param string $b 动态地址
 * @author zckop <304400612@qq.com>
 */
function zcpdf($str){

    import("Org.tcpdf.tcpdf#php",'','');
    $pdf = new \TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);

// 设置文档信息
    $pdf->SetCreator('Helloweba');
    $pdf->SetAuthor('yueguangguang');
    $pdf->SetTitle('Welcome to helloweba.com!');
    $pdf->SetSubject('TCPDF Tutorial');
    $pdf->SetKeywords('TCPDF, PDF, PHP');
// 设置页眉和页脚信息
    $pdf->SetHeaderData('logo.jpg', 40,'','互联网+出口 助力中国制造腾飞                                                                                                                                   www.reanod.com');
    $pdf->setFooterData(array(0, 64, 0), array(0, 64, 128));
// 设置页眉和页脚字体
    $pdf->setHeaderFont(array('stsongstdlight', '', '8'));
    $pdf->setFooterFont(array('helvetica', '', '8'));
// 设置默认等宽字体
    $pdf->SetDefaultMonospacedFont('courier');
// 设置间距
    $pdf->SetMargins(15, 27, 15);
    $pdf->SetHeaderMargin(5);
    $pdf->SetFooterMargin(10);
// 设置分页
    $pdf->SetAutoPageBreak(TRUE, 25);
// 缩放
    $pdf->setImageScale(1.25);

    $l = Array();
    $l['a_meta_charset'] = 'UTF-8';
    $l['a_meta_dir'] = 'ltr';
    $l['a_meta_language'] = 'en';
    $l['w_page'] = 'page';
    $pdf->setLanguageArray($l);

// set default font subsetting mode
    $pdf->setFontSubsetting(true);
//设置字体
    $pdf->SetFont('stsongstdlight', '', 14);
    $pdf->AddPage();

    $pdf->writeHTMLCell(0, 0, '', '', $str, 0, 1, 0, true, 'center', true);

    ob_get_clean();
    $pdf->Output('report.pdf', 'D');
}

/**
 * 生成url
 * @param string $a 静态地址
 * @param string $b 动态地址
 * @author zckop <304400612@qq.com>
 */
function zcurl($a,$b){
	if(session('editModel') && $b)
		return $b;
	else
		return $a;
}

/**
 * 写入管理员操作记录
 * @author zckop <304400612@qq.com>
 */
function adminlog($uid,$info){
    $data = array();
    $data['uid'] = $uid;
    $data['info'] = $info;
    $data['ltime'] = time();
    $data['ip'] = get_client_ip();
    M('AdminLog')->add($data);
}

/**
 * 查看管理员操作记录
 * @author zckop <304400612@qq.com>
 */
function catadminlog($id){
    $id = intval($id);
    if($id){
        return M('AdminLog')->where('uid='.$id)->select();
    }else{
        return M('AdminLog')->select();
    }
}

/**
 * 获取全部业务员
 * @author zckop <304400612@qq.com>
 */
function get_salesman(){
    $zsale = array();
    $salesman = F("salesman");
    if(empty($salesman)){
        $salesman = M('Users')->where('user_type=1')->select();
        foreach($salesman as $k=>$v){
            $zsale[$v['id']] = $v;
        }
        F("salesman", $zsale);
    }else{
        $zsale = $salesman;
    }
    return $zsale;
}

/**
 * 分页处理
 * @param type $total 信息总数
 * @param type $size 每页数量
 * @param type $number 当前分页号（页码）
 * @param type $config 配置，会覆盖默认设置
 * @author zckop <304400612@qq.com>
 * @return \Page|array
 */
function page($total, $size = 0, $number = 0, $config = array()) {
    //配置
    $defaultConfig = array(
        //当前分页号
        'number' => $number,
        //接收分页号参数的标识符
        'param' => C("VAR_PAGE"),
        //分页规则
        'rule' => '',
        //是否启用自定义规则
        'isrule' => false,
        //分页模板
        'tpl' => '',
        //分页具体可控制配置参数默认配置
        'tplconfig' => array('listlong' => 6, 'listsidelong' => 2, "first" => "首页", "last" => "尾页", "prev" => "上一页", "next" => "下一页", "list" => "*", "disabledclass" => ""),
    );
    //分页具体可控制配置参数
    $cfg = array(
        //每次显示几个分页导航链接
        'listlong' => 6,
        //分页链接列表首尾导航页码数量，默认为2，html 参数中有”{liststart}”或”{listend}”时才有效
        'listsidelong' => 2,
        //分页链接列表
        'list' => '*',
        //当前页码的CSS样式名称，默认为”current”
        'currentclass' => 'current',
        //第一页链接的HTML代码，默认为 ”«”，即显示为 «
        'first' => '&laquo;',
        //上一页链接的HTML代码，默认为”‹”,即显示为 ‹
        'prev' => '&#8249;',
        //下一页链接的HTML代码，默认为”›”,即显示为 ›
        'next' => '&#8250;',
        //最后一页链接的HTML代码，默认为”»”,即显示为 »
        'last' => '&raquo;',
        //被省略的页码链接显示为，默认为”…”
        'more' => '...',
        //当处于首尾页时不可用链接的CSS样式名称，默认为”disabled”
        'disabledclass' => 'disabled',
        //页面跳转方式，默认为”input”文本框，可设置为”select”下拉菜单
        'jump' => '',
        //页面跳转文本框或下拉菜单的附加内部代码
        'jumpplus' => '',
        //跳转时要执行的javascript代码，用*代表页码，可用于Ajax分页
        'jumpaction' => '',
        //当跳转方式为下拉菜单时最多同时显示的页码数量，0为全部显示，默认为50
        'jumplong' => 50,
    );
    //覆盖配置
    if (!empty($config) && is_array($config)) {
        $defaultConfig = array_merge($defaultConfig, $config);
    }
    //每页显示信息数量
    $defaultConfig['size'] = $size ? $size : C("PAGE_LISTROWS");
    //把默认配置选项设置到tplconfig
    foreach ($cfg as $key => $value) {
        if (isset($defaultConfig[$key])) {
            $defaultConfig['tplconfig'][$key] = isset($defaultConfig[$key]) ? $defaultConfig[$key] : $value;
        }
    }
    //是否启用自定义规则，规则是一个数组，index和list。不启用的情况下，直接以当前$_GET的参数组成地址
    if ($defaultConfig['isrule'] && empty($defaultConfig['rule'])) {
        //通过全局参数获取分页规则
        $URLRULE = isset($GLOBALS['URLRULE']) ? $GLOBALS['URLRULE'] : (defined('URLRULE') ? URLRULE : '');
        $PageLink = array();
        if (!is_array($URLRULE)) {
            $URLRULE = explode('~', $URLRULE);
        }
        $PageLink['index'] = isset($URLRULE['index']) && $URLRULE['index'] ? $URLRULE['index'] : $URLRULE[0];
        $PageLink['list'] = isset($URLRULE['list']) && $URLRULE['list'] ? $URLRULE['list'] : $URLRULE[1];
        $defaultConfig['rule'] = $PageLink;
    } else if ($defaultConfig['isrule'] && !is_array($defaultConfig['rule'])) {
        $URLRULE = explode('|', $defaultConfig['rule']);
        $PageLink = array();
        $PageLink['index'] = $URLRULE[0];
        $PageLink['list'] = $URLRULE[1];
        $defaultConfig['rule'] = $PageLink;
    }
    $Page = new Page($total, $defaultConfig['size'], $defaultConfig['number'], $defaultConfig['list'], $defaultConfig['param'], $defaultConfig['rule'], $defaultConfig['isrule']);
    $Page->SetPager('default', $defaultConfig['tpl'], $defaultConfig['tplconfig']);
    return $Page;
}

/**
 * 查询文章列表，不做分页
 * @param string $tag  查询标签，以字符串方式传入,例："cid:1,2;field:post_title,post_content;limit:0,8;order:post_date desc,listorder desc;where:id>0;"<br>
 *  ids:调用指定id的一个或多个数据,如 1,2,3<br>
 * 	cid:数据所在分类,可调出一个或多个分类数据,如 1,2,3 默认值为全部,在当前分类为:'.$cid.'<br>
 * 	field:调用post指定字段,如(id,post_title...) 默认全部<br>
 * 	limit:数据条数,默认值为10,可以指定从第几条开始,如3,8(表示共调用8条,从第3条开始)<br>
 * 	order:排序方式，如：post_date desc<br>
 *	where:查询条件，字符串形式，和sql语句一样
 * @param array $where 查询条件，（暂只支持数组），格式和thinkphp where方法一样；
 * @author zckop <304400612@qq.com>
 */
function sp_sql_posts($tag,$where=array()){
    if(!is_array($where)){
        $where=array();
    }

    $tag=sp_param_lable($tag);
    $field = !empty($tag['field']) ? $tag['field'] : '*';
    $limit = !empty($tag['limit']) ? $tag['limit'] : '';
    $order = !empty($tag['order']) ? $tag['order'] : 'post_date';


    //根据参数生成查询条件
    $where['status'] = array('eq',1);
    $where['post_status'] = array('eq',1);

    if (isset($tag['cid'])) {
        $where['term_id'] = array('in',$tag['cid']);
    }

    if (isset($tag['ids'])) {
        $where['object_id'] = array('in',$tag['ids']);
    }



    $join = "".C('DB_PREFIX').'posts as b on a.object_id =b.id';
    $join2= "".C('DB_PREFIX').'users as c on b.post_author = c.id';
    $rs= M("TermRelationships");

    $posts=$rs->alias("a")->join($join)->join($join2)->field($field)->where($where)->order($order)->limit($limit)->select();
    return $posts;
}

/**
 * 文章分页查询方法
 * @param string $tag  查询标签，以字符串方式传入,例："cid:1,2;field:post_title,post_content;limit:0,8;order:post_date desc,listorder desc;where:id>0;"<br>
 * 	ids:调用指定id的一个或多个数据,如 1,2,3<br>
 * 	cid:数据所在分类,可调出一个或多个分类数据,如 1,2,3 默认值为全部,在当前分类为:'.$cid.'<br>
 * 	field:调用post指定字段,如(id,post_title...) 默认全部<br>
 * 	limit:数据条数,默认值为10,可以指定从第几条开始,如3,8(表示共调用8条,从第3条开始)<br>
 * 	order:排序方式，如：post_date desc<br>
 *	where:查询条件，字符串形式，和sql语句一样
 * @param int $pagesize 每页条数.
 * @param string $pagetpl 以字符串方式传入,例："{first}{prev}{liststart}{list}{listend}{next}{last}"
 * @return array 带分页数据的文章列表
 * @author zckop <304400612@qq.com>
 */

function sp_sql_posts_paged($tag,$pagesize=20,$pagetpl='{first}{prev}{liststart}{list}{listend}{next}{last}'){
    $where=array();
    $tag=sp_param_lable($tag);
    $field = !empty($tag['field']) ? $tag['field'] : '*';
    $limit = !empty($tag['limit']) ? $tag['limit'] : '';
    $order = !empty($tag['order']) ? $tag['order'] : 'post_date';

    //根据参数生成查询条件
    $where['status'] = array('eq',1);
    $where['post_status'] = array('eq',1);

    if (isset($tag['cid'])) {
        $where['term_id'] = array('in',$tag['cid']);
    }

    if (isset($tag['ids'])) {
        $where['object_id'] = array('in',$tag['ids']);
    }

    if (isset($tag['where'])) {
        $where['_string'] = $tag['where'];
    }

    $join = "".C('DB_PREFIX').'posts as b on a.object_id =b.id';
    $join2= "".C('DB_PREFIX').'users as c on b.post_author = c.id';
    $rs= M("TermRelationships");
    $totalsize=$rs->alias("a")->join($join)->join($join2)->field($field)->where($where)->count();

    import('Page');
    if ($pagesize == 0) {
        $pagesize = 20;
    }
    $PageParam = C("VAR_PAGE");
    $page = new \Page($totalsize,$pagesize);
    $page->setLinkWraper("li");
    $page->__set("PageParam", $PageParam);
    $page->SetPager('default', $pagetpl, array("listlong" => "9", "first" => "首页", "last" => "尾页", "prev" => "上一页", "next" => "下一页", "list" => "*", "disabledclass" => ""));
    $posts=$rs->alias("a")->join($join)->join($join2)->field($field)->where($where)->order($order)->limit($page->firstRow . ',' . $page->listRows)->select();

    $content['posts']=$posts;
    $content['page']=$page->show('default');
    $content['count']=$totalsize;
    return $content;
}
/**
 * 无限极分类找父ID
 * @author zckop <304400612@qq.com>
 */
function zc_father($arr,$catid){
	$arr2 = array();
	foreach($arr as $v){
		if($v['catid']==$catid){
			if($v['parentid']==0){
				$arr2 = $v;
			}else{
				$arr2 = zc_father($arr,$v['parentid']);
			}
		}
	}
	return $arr2;
}

/**
 * 无限极分类多维数组
 * @author zckop <304400612@qq.com>
 */
function zc_children_more($arr,$id=0){
    $children = array();
    foreach($arr as $k=>$v){
        if($v['parentid']==$id){
            unset($arr[$k]);
            $v['child'] = zc_children_more($arr,$v['catid']);
            $children[] = $v;
        }
    }

    return $children;
}

/**
 * 无限极分类一维数组
 * @author zckop <304400612@qq.com>
 */
function zc_children_one($arr,$id=0,$lev=1){
    $children = array();
    foreach($arr as $k=>$v){
        if($v['parentid']==$id){
            unset($arr[$k]);
            $v['lev'] = $lev;
            $children[] = $v;
            $children = array_merge($children,zc_children_one($arr,$v['catid'],$lev+1));
        }
    }

    return $children;
}

/**
 * 根据栏目模型，返回栏目分类（支持跨模型）
 * @param $model 模型ID
 * @author zckop <304400612@qq.com>
 */
function zc_modellist($model){
    $arr = M('Category')->where()->cache(true)->select();
    $arr = zc_llnrgl($arr,$model);
    return zc_children_one($arr);
}
/**
 * 生成SEO
 * @param $catid        栏目ID
 * @param $title        标题
 * @param $description  描述
 * @param $keyword      关键词
 * @author zckop <304400612@qq.com>
 */
/*function seo($catid = '', $title = '', $description = '', $keyword = '') {
    if (!empty($title))
        $title = strip_tags($title);
    if (!empty($description))
        $description = strip_tags($description);
    // if (!empty($keyword))
    //     $keyword = str_replace(' ', ',', strip_tags($keyword));
    $site = cache("Config");
    $cat = getCategory($catid);
    $web = get_site_options();
    $seo['site_title'] = $site['sitename'];
    $titleKeywords = "";
    $seo['keyword'] = $keyword != $cat['setting']['meta_keywords'] ? (isset($keyword) && !empty($keyword) ? $keyword . (isset($cat['setting']['meta_keywords']) && !empty($cat['setting']['meta_keywords']) ? "," . $cat['setting']['meta_keywords'] : "") : $titleKeywords . (isset($cat['setting']['meta_keywords']) && !empty($cat['setting']['meta_keywords']) ? "," . $cat['setting']['meta_keywords'] : "")) : (isset($keyword) && !empty($keyword) ? $keyword : $cat['catname']);
    $seo['description'] = isset($description) && !empty($description) ? $description : $title . (isset($keyword) && !empty($keyword) ? $keyword : "");
    $zctitle = array();
	if(isset($title) && !empty($title)){
		$zctitle[] = $title;
	}
	if(isset($cat['setting']['meta_title']) && !empty($cat['setting']['meta_title'])){
		$zctitle[] = $cat['setting']['meta_title'];
	}
	if(isset($cat['catname']) && !empty($cat['catname'])){
		$zctitle[] = $cat['catname'];
	}
    $seo['title'] = implode(' - ',$zctitle);
    foreach ($seo as $k => $v) {
        $seo[$k] = str_replace(array("\n", "\r"), '', $v);
    }
    if(empty($seo['site_title']))$seo['site_title']=$web['site_name'];
    if(empty($seo['keyword']))$seo['keyword']=$web['site_seo_keywords'];
    if(empty($seo['description']))$seo['description']=$web['site_seo_description'];
    if(empty($seo['title']))$seo['title']=$web['site_seo_title'];

    return $seo;
}*/
function seo($catid = '', $title = '', $description = '', $keyword = '') {
    if (!empty($title))
        $title = strip_tags($title);
    if (!empty($description))
        $description = strip_tags($description);
    // if (!empty($keyword))
    //     $keyword = str_replace(' ', ',', strip_tags($keyword));
    $site = cache("Config");
    $cat = getCategory($catid);
    $web = get_site_options();
    $seo['site_title'] = $site['sitename'];
    $titleKeywords = "";
    $seo['keyword'] = $keyword != $cat['setting']['meta_keywords'] ? (isset($keyword) && !empty($keyword) ? $keyword . (isset($cat['setting']['meta_keywords']) && !empty($cat['setting']['meta_keywords']) ? "" : "") : $titleKeywords . (isset($cat['setting']['meta_keywords']) && !empty($cat['setting']['meta_keywords']) ? "," . $cat['setting']['meta_keywords'] : "")) : (isset($keyword) && !empty($keyword) ? $keyword : $cat['catname']);
    $seo['description'] = isset($description) && !empty($description) ? $description : $title . (isset($keyword) && !empty($keyword) ? $keyword : "");
    $zctitle = array();
	if(isset($title) && !empty($title)){
		$zctitle[] = $title;
	}
	/*if(isset($cat['setting']['meta_title']) && !empty($cat['setting']['meta_title'])){
		$zctitle[] = $cat['setting']['meta_title'];
	}*/
	/*if(isset($cat['catname']) && !empty($cat['catname'])){
		$zctitle[] = $cat['catname'];
	}*/
  //  $seo['title'] = implode(' - ',$zctitle);
	$seo['title'] = $title;
    foreach ($seo as $k => $v) {
        $seo[$k] = str_replace(array("\n", "\r"), '', $v);
    }
    if(empty($seo['site_title']))$seo['site_title']=$web['site_name'];
    if(empty($seo['keyword']))$seo['keyword']=$web['site_seo_keywords'];
    if(empty($seo['description']))$seo['description']=$web['site_seo_description'];
    if(empty($seo['title']))$seo['title']=$web['site_seo_title'];

    return $seo;
}

/**
 * 获取栏目相关信息
 * @param type $catid 栏目id
 * @param type $field 返回的字段，默认返回全部，数组
 * @param type $newCache 是否强制刷新
 * @author cx 
 * @time 20160519
 * @return boolean
 */
function getCategory($catid, $field = '', $newCache = false) {

	if (empty($catid)) {
		return false;
	}
	$key = 'getCategory_' . $catid;
	//强制刷新缓存
	if ($newCache) {
		S($key, NULL);
	}
	$cache = S($key);
	if ($cache === 'false') {
		return false;
	}

	if (empty($cache)) {
		//读取数据
 	 
		$cache = M('Category')->where(array('catid' => $catid))->find();

		if (empty($cache)) {
			S($key, 'false', 60);
			return false;
		} else {
			//扩展配置
			$cache['setting'] = unserialize($cache['setting']);
			//栏目扩展字段
			$cache['extend'] = $cache['setting']['extend'];
			S($key, $cache, 3600);
		}
	}
	if ($field) {

		//支持var.property，不过只支持一维数组
		if (false !== strpos($field, '.')) {
			$vars = explode('.', $field);
			return $cache[$vars[0]][$vars[1]];
		} else {
			return $cache[$field];
		}
	} else {
		return $cache;
	}
}
 
 
/**
 * 获取模型数据
 * @param type $modelid 模型ID
 * @param type $field 返回的字段，默认返回全部，数组
 * @author cx 
 * @time 20160519
 * @return boolean
 */
function getModel($modelid, $field = '') {
	if (empty($modelid)) {
		return false;
	}
	$key = 'getModel_' . $modelid;
	$cache = S($key);
	if ($cache === 'false') {
		return false;
	}
	if (empty($cache)) {
		//读取数据
		$cache = M('Model')->where(array('modelid' => $modelid))->find();
		if (empty($cache)) {
			S($key, 'false', 60);
			return false;
		} else {
			S($key, $cache, 3600);
		}
	}
	if ($field) {
		return $cache[$field];
	} else {
		return $cache;
	}
}

/**
 * 检查模块是否已经安装
 * @param type $moduleName 模块名称
 * @author cx
 * @time 20160519
 * @return boolean
 */
function isModuleInstall($moduleName) {
	$appCache = cache('Module');
	if (isset($appCache[$moduleName])) {
		return true;
	}
	return false;
}

/* 
 * 得到固定页面模板
 *  @param string $dir 固定页面模板名  Category,List,Show,Comment,Page
 *  @author cx
 *  @time 20160520
 *  return array   固定页面模板文件夹下文件名
 *  
 *  */


function getTemlateHtml($dir){
	
	$filepath = C("SP_TMPL_PATH").C("SP_DEFAULT_THEME")."/Content/";
	
	switch($dir){
		case "Category":
			return str_replace($filepath.'Category/', '', glob($filepath .'Category/*'));break;
		case "List":
			return str_replace($filepath.'List/' ,'', glob($filepath.'List/*'));break;
		case "Show":
			return str_replace($filepath.'Show/' ,'', glob($filepath.'Show/*'));break;
		case "Comment":
			return str_replace($filepath.'Comment/' ,'', glob($filepath.'Comment/*'));break;
		case "Page":
			return str_replace($filepath.'Page/' ,'', glob($filepath.'Page/*'));break;
			
	}
	 
}
/**
 * 取得URL地址中域名部分
 * @param type $url 
 * @return \url 返回域名
 */
function urlDomain($url) {
    if ($url) {
        $pathinfo = parse_url($url);
        return $pathinfo['scheme'] . "://" . $pathinfo['host'] . "/";
    }
    return false;
}


/**
 * 字符截取
 * @param $string 需要截取的字符串
 * @param $length 长度
 * @param $dot
 * @author cx
 * @time 20160525
 */
function str_cut($sourcestr, $length, $dot = '...') {
	$returnstr = '';
	$i = 0;
	$n = 0;
	$str_length = strlen($sourcestr); //字符串的字节数
	while (($n < $length) && ($i <= $str_length)) {
		$temp_str = substr($sourcestr, $i, 1);
		$ascnum = Ord($temp_str); //得到字符串中第$i位字符的ascii码
		if ($ascnum >= 224) {//如果ASCII位高与224，
			$returnstr = $returnstr . substr($sourcestr, $i, 3); //根据UTF-8编码规范，将3个连续的字符计为单个字符
			$i = $i + 3; //实际Byte计为3
			$n++; //字串长度计1
		} elseif ($ascnum >= 192) { //如果ASCII位高与192，
			$returnstr = $returnstr . substr($sourcestr, $i, 2); //根据UTF-8编码规范，将2个连续的字符计为单个字符
			$i = $i + 2; //实际Byte计为2
			$n++; //字串长度计1
		} elseif ($ascnum >= 65 && $ascnum <= 90) { //如果是大写字母，
			$returnstr = $returnstr . substr($sourcestr, $i, 1);
			$i = $i + 1; //实际的Byte数仍计1个
			$n++; //但考虑整体美观，大写字母计成一个高位字符
		} else {//其他情况下，包括小写字母和半角标点符号，
			$returnstr = $returnstr . substr($sourcestr, $i, 1);
			$i = $i + 1;            //实际的Byte数计1个
			$n = $n + 0.5;        //小写字母和半角标点等与半个高位字符宽...
		}
	}
	if ($str_length > strlen($returnstr)) {
		$returnstr = $returnstr . $dot; //超过长度时在尾处加上省略号
	}
	return $returnstr;
}


/**
 * 获取模版文件 格式 主题://模块/控制器/方法
 * @param type $templateFile
 * @return boolean|string
 * @author cx
 * @time 20160527
 */
function parseTemplateFile($templateFile = '') {

	static $TemplateFileCache = array();
 
	//模板路径
	$TemplatePath = SITE_PATH.C('SP_TMPL_PATH');
	 
	//模板主题
	$Theme = C('DEFAULT_THEME') ? C('DEFAULT_THEME') : 'simplebootx'; 
	//如果有指定 GROUP_MODULE 则模块名直接是GROUP_MODULE，否则使用 MODULE_NAME，这样做的目的是防止其他模块需要生成
	$group = 'Content';
	
	//兼容 Add:ss 这种写法
	if (!empty($templateFile) && strpos($templateFile, ':') && false === strpos($templateFile, C('TMPL_TEMPLATE_SUFFIX'))) {
		 
		if (strpos($templateFile, '://')) {
			$temp = explode('://', $templateFile);
			$fxg = str_replace(':', '/', $temp[1]);
			$templateFile = $temp[0] . $fxg;
		} else {
			$templateFile = str_replace(':', '/', $templateFile);
		}
	}
	if ($templateFile != '' && strpos($templateFile, '://')) {
		
		$exp = explode('://', $templateFile);
		$Theme = $exp[0];
		$templateFile = $exp[1];
	}
	// 分析模板文件规则
	$depr = C('TMPL_FILE_DEPR');
	 
	 
	 
	//模板标识
	if ('' == $templateFile) {
		$templateFile = $TemplatePath . $Theme . '/' . $group . '/' . CONTROLLER_NAME . '/' . ACTION_NAME . C('TMPL_TEMPLATE_SUFFIX');
	}
	$key = md5($templateFile);
	
	if (isset($TemplateFileCache[$key])) {
		 
		return $TemplateFileCache[$key];
	}
	 
	if (false === strpos($templateFile, '/') && false === strpos($templateFile, C('TMPL_TEMPLATE_SUFFIX'))) {
		$templateFile = $TemplatePath . $Theme . '/' . $group . '/' . CONTROLLER_NAME . '/' . $templateFile . C('TMPL_TEMPLATE_SUFFIX');
	} else if (false === strpos($templateFile, C('TMPL_TEMPLATE_SUFFIX'))) {
		$path = explode('/', $templateFile);
		$action = array_pop($path);
		$controller = !empty($path) ? array_pop($path) : CONTROLLER_NAME;
		if (!empty($path)) {
			$group = array_pop($path)? : $group;
		}
		$depr = defined('MODULE_NAME') ? C('TMPL_FILE_DEPR') : '/';
		
		$templateFile = $TemplatePath . $Theme . '/' . $group . '/' . $controller . $depr . $action . C('TMPL_TEMPLATE_SUFFIX');
	}
	//区分大小写的文件判断，如果不存在，尝试一次使用默认主题
	if (!file_exists_case($templateFile)) {
		$log = '模板:[' . $templateFile . '] 不存在！';
		\Think\Log::record($log);
		//启用默认主题模板
		$templateFile = str_replace($TemplatePath . $Theme, $TemplatePath . 'simplebootx', $templateFile);
		//判断默认主题是否存在，不存在直接报错提示
		if (!file_exists_case($templateFile)) {
			if (defined('APP_DEBUG') && APP_DEBUG) {
				E($log);
			}
			$TemplateFileCache[$key] = false;
			return false;
		}
	}
	$TemplateFileCache[$key] = $templateFile;
	return $TemplateFileCache[$key];
}

/*
 * 获取模版文件
 * @param type $templateFile
 * @return boolean|string
 * @author cx
 * @time 20160608
 * 
 *   */


function parseIndexTemplateFile($templateFile =''){

	static $TemplateFileCache = array();
	
	//模板路径
	$TemplatePath = C('SP_TMPL_PATH');
	//模板主题
	$Theme = sp_get_current_theme();
	$group = 'Portal'; //前台哪个模块下

	//模板标识
	 
	$key = md5($templateFile);
	
	if (isset($TemplateFileCache[$key])) {
			
		return $TemplateFileCache[$key];
	}
	
	$path = explode('/', $templateFile);
	$action = array_pop($path);
	  
	$templateFile = $TemplatePath . $Theme . '/' . $group . '/' . $action.C('HTML_FILE_SUFFIX');
	 
	 
	$TemplateFileCache[$key] = $templateFile;
	return $TemplateFileCache[$key];
	
}


/**
 * 返回ip的位置信息
 * @return array
 * @author sdcode
 * @time 20160601
 */
function getlocation_ip(){

    //返回访问者ip
    if (isset($_SERVER)){
        if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
            $realip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } else if (isset($_SERVER["HTTP_CLIENT_IP"])) {
            $realip = $_SERVER["HTTP_CLIENT_IP"];
        } else {
            $realip = $_SERVER["REMOTE_ADDR"];
        }
    } else {
        if (getenv("HTTP_X_FORWARDED_FOR")){
            $realip = getenv("HTTP_X_FORWARDED_FOR");
        } else if (getenv("HTTP_CLIENT_IP")) {
            $realip = getenv("HTTP_CLIENT_IP");
        } else {
            $realip = getenv("REMOTE_ADDR");
        }
    }

    $str = file_get_contents("http://api.hostip.info/get_html.php?ip=".$realip);
	$arr = explode(PHP_EOL, $str);
	$country = substr($arr[0],9);
    $location['ip'] = $realip;//访问者ip
    $location['country'] = $country;//访问者国家
    return $location;
}

/**
 * 页面访问量(zckop改)
 * @return boolean
 * @author sdcode
 * @time 20160601
 */
function visits($durl,$title){
    $urlinfo = array('url'=>$durl,'title'=>$title);
    $ipinfo = getlocation_ip();
    $zcoe = md5("last_access_".$durl);
    $last_access = cookie($zcoe);
    if(!isset($last_access)||(time()-$last_access)>30){
        $map['ip']=$ipinfo['ip'];
        $map['country']=$ipinfo['country']?$ipinfo['country']:'中国';
        $map['url']=$urlinfo['url'];
        $map['time']=strtotime(date("Y-m-d",time()));
        $v_info = M("Visits")->where($map)->find();
        if($v_info){
            $data['clicks'] = $v_info['clicks']+1;
            $re = M("Visits")->where($map)->save($data);
        }else{
            $map['title']=$urlinfo['title'];
            $re = M("Visits")->add($map);
        }

        cookie($zcoe,time());
        if($re){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}
/**
 * 显示相关
 * @return array
 * @author sdcode
 * @time 20160602
 */
function show_relation($catid='',$id,$modelid=1,$field="relation"){
	if($catid){
		$category = getCategory($catid);
		$modelid = $category['modelid'];
	}
    $model = \Content\Model\ContentModel::getInstance($modelid);
    if (empty($model)) {
        return false;
    }
    $r = $model->relation(true)->where(array('id' => $id))->find();
    $model->dataMerger($r);
    $where = array();
    if ($r[$field]) {
        if (strpos($r[$field], ',')) {
            $relations = explode('|', $r[$field]);
            $newRela = array();
            foreach ($relations as $rs) {
                if (strpos($rs, ',')) {
                    $rs = explode(',', $rs);
                } else {
                    $rs = array($modelid, $rs);
                }
                $newRela[$rs[0]][] = $rs[1];
            }
            $datas = array();
            foreach ($newRela as $modelid => $catidList) {
                $where['id'] = array('IN', $catidList);

                $_list = \Content\Model\ContentModel::getInstance($modelid)->relation(true)->where($where)->select();
                if (!empty($_list)) {
                    $datas = array_merge($datas, $_list);
                }
            }
            //\Content\Model\ContentModel::getInstance($modelid)->dataMerger($datas);
        } else {
            $relation = str_replace('|', ',', $r[$field]);
            $where['id'] = array("in", $relation);
            $datas = $model->relation(true)->where($where)->select();
           // $model->dataMerger($datas);
        }
        foreach ($datas as $_v) {
            $_v['sid'] = 'v' . getCategory($_v['catid'], 'modelid') . '_' . $_v['id'];
            $infos[] = $_v;

        }
    }
	
	return $infos;
}

/*
 * 增加点击数 
* @param type $r 点击相关数据
* @return boolean
*/
function hits($r) {
    if (empty($r)) {
        return false;
    }
    if(empty($r['catid']))return false;
    if(empty($r['id']))return false;
    //当前时间
    $time = time();
    //总点击+1
    $views = $r['views'] + 1;
    //昨日
    $yesterdayviews = (date('Ymd', $r['viewsupdatetime']) == date('Ymd', strtotime('-1 day'))) ? $r['dayviews'] : $r['yesterdayviews'];
    //今日点击
    $dayviews = (date('Ymd', $r['viewsupdatetime']) == date('Ymd', $time)) ? ($r['dayviews'] + 1) : 1;
    //本周点击
    $weekviews = (date('YW', $r['viewsupdatetime']) == date('YW', $time)) ? ($r['weekviews'] + 1) : 1;
    //本月点击
    $monthviews = (date('Ym', $r['viewsupdatetime']) == date('Ym', $time)) ? ($r['monthviews'] + 1) : 1;
    $data = array(
        'views' => $views,
        'yesterdayviews' => $yesterdayviews,
        'dayviews' => $dayviews,
        'weekviews' => $weekviews,
        'monthviews' => $monthviews,
        'viewsupdatetime' => $time
    );
    $info = getCategory($r['catid']);
    $table = getModel($info['modelid'], 'tablename');
    $status = M($table)->where(array('id' => $r['id']))->save($data);
    return false !== $status ? true : false;
}

/* 
 * 得到不同的询盘
 * @author cx
 * @time 20160719
 * @param int 1-底部 2-侧边栏 
 * @param boolean true 需要提示
 *  */
 
function xPan($id =1 , $show=true){

	$field = M("GuestbookData")->alias("gd")->join(C("DB_PREFIX")."guestbook_field as gf on gd.fieldid = gf.id ",'LEFT')->field(" gd.if_show, gd.if_require ,gf.id, gf.name")->where("gd.guestbook_group_id=$id ")->select();
	
	$str = "<form name='' method='post' action='".U('api/guestbook/addmsg')."' enctype='multipart/form-data' id='formxun'>";
	$str .="<input type='hidden' name='type' value=".$id." />";
	foreach($field as $value){
		if($value['if_show'] ==1){
			if($value['id'] ==1){   // 询盘人姓名
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_N_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('NAMETIP')."' errormsg='".L('NAMETIP')."' type='text' placeholder='".L('XPAN_N_TIP')."' />";
				}else {
					$str .="</span><input name='".$value['name']."' type='text' placeholder='".L('XPAN_N_TIP')."' />";
				}
				
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
					
			}else if ($value['id'] ==2){   // 邮箱
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_E_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='e' nullmsg='".L('EMAIL_N_TIP')."' errormsg='".L('EMAIL_E_TIP')."'  type='text' placeholder='".L('XPAN_E_TIP')."' />";
				}else{
					$str .="<input name='".$value['name']."'  type='text' placeholder='".L('XPAN_E_TIP')."' />";
				}
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
		
			}else if ($value['id'] ==3){  // 标题
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_T_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('TITLTIP')."' errormsg='".L('TITLTIP')."'  type='text' placeholder='".L('XPAN_T_TIP')."' />";
				}else {
					$str .="<input name='".$value['name']."' type='text' placeholder='".L('XPAN_T_TIP')."' />";
				}
				
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';	
				
			}else if ($value['id'] ==4){  //  内容
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_M_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<textarea name='".$value['name']."' datatype='*' nullmsg='".L('CONTENT_N_TIP')."' errormsg='".L('CONTENT_E_TIP')."'  placeholder='".L('XPAN_M_TIP')."' ></textarea>";
				}else {
					$str .="<textarea name='".$value['name']."' placeholder='".L('XPAN_M_TIP')."' ></textarea>";
				}
				
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==5){  //公司名称
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_C_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('COMPTYNAME_N_TIP')."' errormsg='".L('COMPTYNAME_E_TIP')."'  type='text' placeholder='".L('XPAN_C_TIP')."' />";
				}else {
					$str .="<input name='".$value['name']."' type='text' placeholder='".L('XPAN_C_TIP')."' />";
				}
				
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==6){   //电话
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_TEL_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='m' nullmsg='".L('PHONE_N_TIP')."' errormsg='".L('PHONE_E_TIP')."'  type='text' placeholder='".L('XPAN_TEL_TIP')."' />";
				}else{
					$str .="<input name='".$value['name']."' type='text' placeholder='".L('XPAN_TEL_TIP')."' />";
				}
				
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==7){    //传真
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_F_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('CZ_N_TIP')."' errormsg='".L('CZ_E_TIP')."'  type='text' placeholder='".L('XPAN_F_TIP')."' />";
				}else {
					$str .="<input name='".$value['name']."' type='text' placeholder='".L('XPAN_F_TIP')."' />";
				}
				
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==8){    //详细地址
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_F_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('ADDRESS_N_TIP')."' errormsg='".L('ADDRESS_E_TIP')."'  type='text' placeholder='".L('XPAN_F_TIP')."' />";
				}else {
					$str .="<input name='".$value['name']."' type='text' placeholder='".L('XPAN_F_TIP')."' />";
				}
				 
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==9){     //国家
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_COUN_TIP')."</span>";
				}
				if($value['if_require'] ==1){
					//$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('COMPTY_N_TIP')."' errormsg='".L('COMPTY_E_TIP')."' type='text' placeholder='".L('XPAN_COUN_TIP')."' />";
                    $str .='<select id="country" name="'.$value['name'].'" datatype="*" nullmsg="'.L('COMPTY_N_TIP').'" errormsg="'.L('COMPTY_E_TIP').'"><option value="">Select Country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d\'Ivoire">Cote d\'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong(China)">Hong Kong(China)</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan(China)">Taiwan(China)</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>';
                }else{
					//$str .="<input name='".$value['name']."'  type='text' placeholder='".L('XPAN_COUN_TIP')."' />";
				    $str .='<select id="country" name="'.$value['name'].'"><option value="">Select Country</option><option value="Afghanistan">Afghanistan</option><option value="Albania">Albania</option><option value="Algeria">Algeria</option><option value="American Samoa">American Samoa</option><option value="Angola">Angola</option><option value="Anguilla">Anguilla</option><option value="Antartica">Antartica</option><option value="Antigua and Barbuda">Antigua and Barbuda</option><option value="Argentina">Argentina</option><option value="Armenia">Armenia</option><option value="Aruba">Aruba</option><option value="Ashmore and Cartier Island">Ashmore and Cartier Island</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Azerbaijan">Azerbaijan</option><option value="Bahamas">Bahamas</option><option value="Bahrain">Bahrain</option><option value="Bangladesh">Bangladesh</option><option value="Barbados">Barbados</option><option value="Belarus">Belarus</option><option value="Belgium">Belgium</option><option value="Belize">Belize</option><option value="Benin">Benin</option><option value="Bermuda">Bermuda</option><option value="Bhutan">Bhutan</option><option value="Bolivia">Bolivia</option><option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option><option value="Botswana">Botswana</option><option value="Brazil">Brazil</option><option value="British Virgin Islands">British Virgin Islands</option><option value="Brunei">Brunei</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Burma">Burma</option><option value="Burundi">Burundi</option><option value="Cambodia">Cambodia</option><option value="Cameroon">Cameroon</option><option value="Canada">Canada</option><option value="Cape Verde">Cape Verde</option><option value="Cayman Islands">Cayman Islands</option><option value="Central African Republic">Central African Republic</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Christmas Island">Christmas Island</option><option value="Clipperton Island">Clipperton Island</option><option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option><option value="Colombia">Colombia</option><option value="Comoros">Comoros</option><option value="Congo, Democratic Republic of the">Congo, Democratic Republic of the</option><option value="Congo, Republic of the">Congo, Republic of the</option><option value="Cook Islands">Cook Islands</option><option value="Costa Rica">Costa Rica</option><option value="Cote d\'Ivoire">Cote d\'Ivoire</option><option value="Croatia">Croatia</option><option value="Cuba">Cuba</option><option value="Cyprus">Cyprus</option><option value="Czeck Republic">Czeck Republic</option><option value="Denmark">Denmark</option><option value="Djibouti">Djibouti</option><option value="Dominica">Dominica</option><option value="Dominican Republic">Dominican Republic</option><option value="Ecuador">Ecuador</option><option value="Egypt">Egypt</option><option value="El Salvador">El Salvador</option><option value="Equatorial Guinea">Equatorial Guinea</option><option value="Eritrea">Eritrea</option><option value="Estonia">Estonia</option><option value="Ethiopia">Ethiopia</option><option value="Europa Island">Europa Island</option><option value="Falkland Islands (Islas Malvinas)">Falkland Islands (Islas Malvinas)</option><option value="Faroe Islands">Faroe Islands</option><option value="Fiji">Fiji</option><option value="Finland">Finland</option><option value="France">France</option><option value="French Guiana">French Guiana</option><option value="French Polynesia">French Polynesia</option><option value="French Southern and Antarctic Lands">French Southern and Antarctic Lands</option><option value="Gabon">Gabon</option><option value="Gambia, The">Gambia, The</option><option value="Gaza Strip">Gaza Strip</option><option value="Georgia">Georgia</option><option value="Germany">Germany</option><option value="Ghana">Ghana</option><option value="Gibraltar">Gibraltar</option><option value="Glorioso Islands">Glorioso Islands</option><option value="Greece">Greece</option><option value="Greenland">Greenland</option><option value="Grenada">Grenada</option><option value="Guadeloupe">Guadeloupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guernsey">Guernsey</option><option value="Guinea">Guinea</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haiti">Haiti</option><option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option><option value="Holy See (Vatican City)">Holy See (Vatican City)</option><option value="Honduras">Honduras</option><option value="Hong Kong(China)">Hong Kong(China)</option><option value="Howland Island">Howland Island</option><option value="Hungary">Hungary</option><option value="Iceland">Iceland</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Iran">Iran</option><option value="Iraq">Iraq</option><option value="Ireland">Ireland</option><option value="Ireland, Northern">Ireland, Northern</option><option value="Israel">Israel</option><option value="Italy">Italy</option><option value="Jamaica">Jamaica</option><option value="Jan Mayen">Jan Mayen</option><option value="Japan">Japan</option><option value="Jarvis Island">Jarvis Island</option><option value="Jersey">Jersey</option><option value="Johnston Atoll">Johnston Atoll</option><option value="Jordan">Jordan</option><option value="Juan de Nova Island">Juan de Nova Island</option><option value="Kazakhstan">Kazakhstan</option><option value="Kenya">Kenya</option><option value="Kiribati">Kiribati</option><option value="Korea, North">Korea, North</option><option value="Korea, South">Korea, South</option><option value="Kuwait">Kuwait</option><option value="Kyrgyzstan">Kyrgyzstan</option><option value="Laos">Laos</option><option value="Latvia">Latvia</option><option value="Lebanon">Lebanon</option><option value="Lesotho">Lesotho</option><option value="Liberia">Liberia</option><option value="Libya">Libya</option><option value="Liechtenstein">Liechtenstein</option><option value="Lithuania">Lithuania</option><option value="Luxembourg">Luxembourg</option><option value="Macau">Macau</option><option value="Macedonia, Former Yugoslav Republic of">Macedonia, Former Yugoslav Republic of</option><option value="Madagascar">Madagascar</option><option value="Malawi">Malawi</option><option value="Malaysia">Malaysia</option><option value="Maldives">Maldives</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Man, Isle of">Man, Isle of</option><option value="Marshall Islands">Marshall Islands</option><option value="Martinique">Martinique</option><option value="Mauritania">Mauritania</option><option value="Mauritius">Mauritius</option><option value="Mayotte">Mayotte</option><option value="Mexico">Mexico</option><option value="Micronesia, Federated States of">Micronesia, Federated States of</option><option value="Midway Islands">Midway Islands</option><option value="Moldova">Moldova</option><option value="Monaco">Monaco</option><option value="Mongolia">Mongolia</option><option value="Montserrat">Montserrat</option><option value="Morocco">Morocco</option><option value="Mozambique">Mozambique</option><option value="Namibia">Namibia</option><option value="Nauru">Nauru</option><option value="Nepal">Nepal</option><option value="Netherlands">Netherlands</option><option value="Netherlands Antilles">Netherlands Antilles</option><option value="New Caledonia">New Caledonia</option><option value="New Zealand">New Zealand</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Niue">Niue</option><option value="Norfolk Island">Norfolk Island</option><option value="Northern Mariana Islands">Northern Mariana Islands</option><option value="Norway">Norway</option><option value="Oman">Oman</option><option value="Pakistan">Pakistan</option><option value="Palau">Palau</option><option value="Panama">Panama</option><option value="Papua New Guinea">Papua New Guinea</option><option value="Paraguay">Paraguay</option><option value="Peru">Peru</option><option value="Philippines">Philippines</option><option value="Pitcaim Islands">Pitcaim Islands</option><option value="Poland">Poland</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="Qatar">Qatar</option><option value="Reunion">Reunion</option><option value="Romainia">Romainia</option><option value="Russia">Russia</option><option value="Rwanda">Rwanda</option><option value="Saint Helena">Saint Helena</option><option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option><option value="Saint Lucia">Saint Lucia</option><option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option><option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option><option value="Samoa">Samoa</option><option value="San Marino">San Marino</option><option value="Sao Tome and Principe">Sao Tome and Principe</option><option value="Saudi Arabia">Saudi Arabia</option><option value="Scotland">Scotland</option><option value="Senegal">Senegal</option><option value="Seychelles">Seychelles</option><option value="Sierra Leone">Sierra Leone</option><option value="Singapore">Singapore</option><option value="Slovakia">Slovakia</option><option value="Slovenia">Slovenia</option><option value="Solomon Islands">Solomon Islands</option><option value="Somalia">Somalia</option><option value="South Africa">South Africa</option><option value="South Georgia and South Sandwich Islands">South Georgia and South Sandwich Islands</option><option value="Spain">Spain</option><option value="Spratly Islands">Spratly Islands</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudan">Sudan</option><option value="Suriname">Suriname</option><option value="Svalbard">Svalbard</option><option value="Swaziland">Swaziland</option><option value="Sweden">Sweden</option><option value="Switzerland">Switzerland</option><option value="Syria">Syria</option><option value="Taiwan(China)">Taiwan(China)</option><option value="Tajikistan">Tajikistan</option><option value="Tanzania">Tanzania</option><option value="Thailand">Thailand</option><option value="Tobago">Tobago</option><option value="Toga">Toga</option><option value="Tokelau">Tokelau</option><option value="Tonga">Tonga</option><option value="Trinidad">Trinidad</option><option value="Tunisia">Tunisia</option><option value="Turkey">Turkey</option><option value="Turkmenistan">Turkmenistan</option><option value="Tuvalu">Tuvalu</option><option value="Uganda">Uganda</option><option value="Ukraine">Ukraine</option><option value="United Arab Emirates">United Arab Emirates</option><option value="United Kingdom">United Kingdom</option><option value="Uruguay">Uruguay</option><option value="USA">USA</option><option value="Uzbekistan">Uzbekistan</option><option value="Vanuatu">Vanuatu</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Virgin Islands">Virgin Islands</option><option value="Wales">Wales</option><option value="Wallis and Futuna">Wallis and Futuna</option><option value="West Bank">West Bank</option><option value="Western Sahara">Western Sahara</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option></select>';
                }
		 
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==10){    //验证码
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_YZ_TIP')."</span>";
				}
				$str .="<input name='".$value['name']."' datatype='*' nullmsg='".L('YZ_N_TIP')."' errormsg='".L('YZ_E_TIP')."'  type='text' placeholder='".L('XPAN_YZ_TIP')."' />";
				$str .=sp_verifycode_img('length=4&font_size=20&width=248&height=42&use_noise=1&use_curve=0','style="cursor: pointer;" title="'.L('DJ_TIP').'"') ;
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}else if ($value['id'] ==11){    //附件上传
				$str .= "<div>";
				if($show){
					$str .="<span>".L('XPAN_FILE_TIP')."</span>";
				}
				$str .="<input name='".$value['name']."' type='file'  />";
				$str .='<div class="info"><span class="Validform_checktip"></span><span class="dec"><s class="dec1">&#9670;</s><s class="dec2">&#9670;</s></span></div></div>';
			}
		
		}
		
	}
	$str .="<input type='submit' value='Send' >";
	$str .="</form>";
	$url = __ROOT__.'/public';
	$str .= '<script src="'.$url.'/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript">
$(function(){
    $("#formxun").Validform({
        tiptype:function(msg,o,cssctl){
            if(!o.obj.is("#formxun")){
                var objtip=o.obj.parents("div").next().find(".Validform_checktip");
                cssctl(objtip,o.type);
                objtip.text(msg);
               
                var infoObj=o.obj.parents("div").next().find(".info");
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
</script>';

	return $str;
 }




 
/* 
 * 关注我们（社交平台展示）
 * @author xgj
 * @time 20160805
 * @param int id
 *  
 * */
 
 function showSocially($id) {
 	$list = M()
 				->table('cmf_follow_us_type as type	
 							join
 						 cmf_follow_us_rela as rela
 						 	on
 						 type.typeid = rela.type_id 
 						    join
 						 cmf_follow_us as cfu 
 						  ON  
 						 rela.socially_id = cfu.socially_id ')
 				->field('cfu.logo_url, cfu.socially_name,cfu.socially_url')
 				->where("type.id = '$id' and rela.is_show=0")
 				->select();


 	$str = "";
 	foreach ($list as $value) {
 		$str.= '<a href="'.$value['socially_url'].'"  target="_blank" ><img src="'.$value['logo_url'].'" alt="" width="200px"/>';
 		$str.="<p>".$value['socially_name']."</P>";
 		$str.='</a>';
 	}



 	return $str;
 }
/**
 * 取得文件扩展
 * @param type $filename 文件名
 * @return type 后缀
 */
function fileext($filename) {
    $pathinfo = pathinfo($filename);
    return $pathinfo['extension'];
}
/**
 * 根据文件扩展名来判断是否为图片类型
 * @param type $file 文件名
 * @return type 是图片类型返回 true，否则返回 false
 */
function isImage($file) {
    $ext_arr = array('jpg', 'gif', 'png', 'bmp', 'jpeg', 'tiff');
    //取得扩展名
    $ext = fileext($file);
    return in_array($ext, $ext_arr) ? true : false;
}
   //根据大小排序
    function multi_array_sort($multi_array,$sort_key,$sort=SORT_ASC){
        if(is_array($multi_array)){
            foreach ($multi_array as $row_array){
                if(is_array($row_array)){
                    $key_array[] = $row_array[$sort_key];
                }else{
                    return false;
                }
            }
        }else{
            return false;
        }
        array_multisort($key_array,$sort,$multi_array);
        return $multi_array;
    }
/**
* 请求接口返回内容
* @param  string $url [请求的URL地址]
* @param  string/array $params [请求的参数]
* @param  int $ipost [是否采用POST形式]
* @return  string
*/
function juhecurl($url,$params=false,$ispost=0){
	$ch = curl_init();
	curl_setopt( $ch, CURLOPT_HTTP_VERSION , CURL_HTTP_VERSION_1_1 );
	curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT , 60 );
	curl_setopt( $ch, CURLOPT_TIMEOUT , 60);
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER , true );
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	if( $ispost )
	{
	    curl_setopt( $ch , CURLOPT_POST , true );
	    curl_setopt( $ch , CURLOPT_POSTFIELDS , $params );
	    curl_setopt( $ch , CURLOPT_URL , $url );
	}
	else
	{
	    if($params){
            if(is_array($params)){
                $params = http_build_query($params);
            }
	        curl_setopt( $ch , CURLOPT_URL , $url.'?'.$params );
	    }else{
	        curl_setopt( $ch , CURLOPT_URL , $url);
	    }
	}
	$response = curl_exec( $ch );
	curl_close( $ch );
	return $response;
}
function banks(){
	$bank = array(
			'工商银行'=> 0,
			'招商银行'=> 1,
			'建设银行'=> 2,
			'中国银行'=> 3,
			'交通银行'=> 4,
			'农业银行'=> 5,
		);
	return $bank;
}
function currency_list(){
	//配置您申请的appkey
		$appkey = "23bbcd6675880265c674a3f9a880c8f5";
		
	//货币
		$url = "http://op.juhe.cn/onebox/exchange/list";
		$params = array(
		      "key" => $appkey,//应用APPKEY(应用详细页查询)
		);
		$paramstring = http_build_query($params);
		$content = juhecurl($url,$paramstring);
		$results = json_decode($content,true);
		if($results){
		    if($results['error_code']=='0'){
		    	return $results['result']['list'];
		    }else{
		    	return false;
		    }
		}else{
			return false;
		}


}
//是否给积分
function gpoint($adminid,$cotenttype){
	$admininfo = get_admin_info($adminid);
    $points_auth = explode(',', $admininfo['points_auth']);
    if($admininfo['identity'] == 1 && in_array($cotenttype, $points_auth)){
           
           $year = date('Y',time());
           $month = date('m',time());
           $month_start = $year.'-'.$month.'-01';
           $month_end = mktime(23, 59, 59, date('m', strtotime($month))+1, 00);//指定月份月末时间戳 
           $month_end = date("Y-m-d",$month_end);
           
           $m['contentid'] = array(array('in','1,2,3'));
           $m['addtime'] = array(array('EGT',$month_start),array('ELT',$month_end));
           $sum = M('Points')->field('sum(points) as pointssum')->where($m)->find();//当前月系统自动记录总积分
        
           $w['addtime'] = array('eq',date('Y-m-d',time()));
           $w['contentid'] = $cotenttype;
           $w['adminid'] = $adminid;
           $pointnum = M('Points')->where($w)->count();//今天登录是否记录积分
         
           if(!$pointnum && $sum['pointssum'] < 30){
                $point_data['adminid'] = $adminid;
                $point_data['contentid'] = $cotenttype;
                $point_data['points'] = 1;
                $point_data['addtime'] = date("Y-m-d",time());
                $rel = M('Points')->add($point_data);
                return true;
           }else{
           	return false;
           }
    }else{
    	return false;
    }
}
//该分类下是否存在产品
function get_catgory_product($catid,$type=0){
	if($type){$rel=0; return $rel;}
	$modelid = getCategory($catid, 'modelid');
	$model_name=getModel($modelid, 'tablename');
	$map['catid'] = $catid;
	$prolist = M($model_name)->where($map)->count();
	if($prolist)$rel=1;
	else $rel=0;
	return $rel;
}
//该分类下是否存在子类
function get_catgory_son($catid){
	$map['parentid'] = $catid;
	$sonnum = M('Category')->where($map)->count();
	if($sonnum)$rel=1;
	else $rel=0;
	return $rel;
}
//排序方式
function get_sort_order($catid){
	if(!$catid){
		$data['order'] = 'listorder desc,id desc';
		return $data;
	}
	$map['catid'] = $catid;
	$info = M('Sortorder')->where($map)->find();
	if($info){
		$data['order'] = $info['sort'].' '.$info['order'];
	}else{
		$data['order'] = 'listorder desc,id desc';
	}
	return $data;
}
//广告图————没广告位的
function getOpAds(){
	$map['option_name'] = 'site_indexads';
    $adinfo = M('Options')->where($map)->find();
    $ads = json_decode($adinfo['option_value'],true);
    $sort = array(  
            'direction' => 'SORT_ASC', //排序顺序标志 SORT_DESC 降序；SORT_ASC 升序  
            'field'     => 'sort',       //排序字段  
    );  
    $arrSort = array();  
    foreach($ads AS $uniqid => $row){  
        foreach($row AS $key=>$value){  
            $arrSort[$key][$uniqid] = $value;  
        }  
    }  
    array_multisort($arrSort[$sort['field']], constant($sort['direction']), $ads);
    if($ads)return $ads;
    else return false;
}
//获取某一广告位下的广告图 ,广告位：$position_id
function getPsitionAds($position_id){
	if(!$position_id)return false;
	$map['position_id'] = $position_id;
	$map['status'] = 0;
	$ads = M('Ads')->where($map)->order('sort asc,id desc')->select();
	if($ads)return $ads;
	else return false;
}

function recursiveDelete($dir)
{ 
	if(is_dir($dir)){
	  if ($handle = @opendir($dir))
	  {
	  while (($file = readdir($handle)) !== false)
	  {
	   if (($file == ".") || ($file == ".."))
	   {
	    continue;
	   }
	   if (is_dir($dir . '/' . $file))
	   {
	    recursiveDelete($dir . '/' . $file);
	   }
	   else
	   {
	    unlink($dir . '/' . $file); // remove this file
	   }
	  }
	  @closedir($handle);
	  rmdir ($dir);
	  }
	}else{
	    if(file_exists($dir)) unlink($dir);
	} 
}


function get_category_url($catid){

	$cate = M("Category")->where(" catid = $catid ")->find();

	return $cate['url'];
}


function wps_getcatname($catid){
	 $arr = M('Category')->where("catid =".$catid)->select();
	 $catname=$arr[0]['catname'];
	 return $catname;
}
function wps_getcatimage($catid){
	 $arr = M('Category')->where("catid =".$catid)->select();
	 $catimage=$arr[0]['image'];
	 return $catimage;
}

function wps_getcatdescription($catid){
	 $arr = M('Category')->where("catid =".$catid)->select();
	 $catdescription=$arr[0]['description'];
	 return $catdescription;
}
function wps_getcatparentid($catid){
	 $arr = M('Category')->where("catid =".$catid)->select();
	 $catparentid=$arr[0]['parentid'];
	 return $catparentid;
}

/**
* 获取指定栏目 排序
*/
function get_cat_sortorder($catid)
{
	if (!$catid) {
		return false;
	}
	//排序 先后顺序 页面设置order->后台设置排序->默认（id desc, updatetime desc）
    $maporder['catid'] = $catid;
    $sortorder = M('Sortorder')->where($maporder)->find();
    if($sortorder['sort'] && empty($data['order'])){
        $sort = !empty($sortorder['sort'])?$sortorder['sort']:'id';
        $order = !empty($sortorder['order'])?$sortorder['order']:'desc';
        $sortorder = $sort.' '.$order;
    }else {
        $sortorder = 'id desc';
    }
    return $sortorder;
}

/**
* 详情（文章，产品，project）页,上一个
*/
function get_prev_param($catid, $id)
{
	if (!$id) {
		return false;
	}
	$sortorder = get_cat_sortorder($catid);
	if (!$sortorder) {
		$sortorder = 'id desc';
	}
	$sort_arr = explode(' ', $sortorder);
	if ($sort_arr[1] == 'asc') {
		$data['symbol'] = 'lt';
		$data['order'] = 'desc';
	} else {
		$data['symbol'] = 'gt';
		$data['order'] = 'asc';
	}
	$data['field_key'] = $sort_arr[0];

	$info = \Content\Model\ContentModel::getInstance(getCategory($catid,"modelid"))->where(array("id"=>$id))->field("id,listorder,updatetime,inputtime")->find();
	$data['field_val'] = $info[$sort_arr[0]];
	return $data;
}

/**
* 详情（文章，产品，project）页,下一个
*/
function get_next_param($catid, $id)
{
	if (!$id) {
		return false;
	}
	$sortorder = get_cat_sortorder($catid);
	if (!$sortorder) {
		$sortorder = 'id desc';
	}
	$sort_arr = explode(' ', $sortorder);
	if ($sort_arr[1] == 'asc') {
		$data['symbol'] = 'gt';
		$data['order'] = 'asc';
	} else {
		$data['symbol'] = 'lt';
		$data['order'] = 'desc';
	}
	$data['field_key'] = $sort_arr[0];

	$info = \Content\Model\ContentModel::getInstance(getCategory($catid,"modelid"))->where(array("id"=>$id))->field("id,listorder,updatetime,inputtime")->find();
	$data['field_val'] = $info[$sort_arr[0]];
	return $data;
}


function get_c_url($catid){

	$cate = M("Category")->where(" catid = $catid ")->find();

	return $cate['url'];
}


function get_c_name($catid){
	 $arr = M('Category')->where("catid =".$catid)->select();
	 $catname=$arr[0]['catname'];
	 return $catname;
}
function get_c_img($catid){
	 $arr = M('Category')->where("catid =".$catid)->select();
	 $catimage=$arr[0]['image'];
	 return $catimage;
}



function sp_send_email_2($address,$subject,$message)
{
	$params = array();
	$params['sendname'] = $address; 				// 收件人
	$params['title'] = $subject; 				// 标题
	$params['content']  = $message;   // 发送内容
	$ch = curl_init();
	curl_setopt( $ch, CURLOPT_HTTP_VERSION , CURL_HTTP_VERSION_1_1 );
	curl_setopt( $ch, CURLOPT_CONNECTTIMEOUT , 60 );
	curl_setopt( $ch, CURLOPT_TIMEOUT , 1);
	curl_setopt( $ch, CURLOPT_RETURNTRANSFER , true );
	curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, true);
	$params = http_build_query($params);
	curl_setopt( $ch , CURLOPT_URL , 'http://107.150.98.157/zcmail.php'.'?'.$params );
	curl_exec($ch);
	curl_close( $ch );
	// 发送邮件。
	return array("error"=>0,"message"=>"success");
}

/**
 * [get_c_photo 首页获取单页面组图]
 * @param  [type] $catid [description]
 * @return [type]        [description]
 */
function get_c_photo($catid){

	 $arr = M('Page')->where("catid =".$catid)->select();

	 $catparentid=$arr[0]['photo'];

	 return $catparentid;

}


function wps_getarrparentid($catid){

     $arr = M('Category')->where("catid =".$catid)->select();

     $arrparentid=$arr[0]['arrparentid'];

     $arrparentid = explode(",", $arrparentid);

     return $arrparentid[1];

}