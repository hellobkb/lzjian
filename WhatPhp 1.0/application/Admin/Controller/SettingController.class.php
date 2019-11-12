<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class SettingController extends AdminbaseController{

	protected $options_model;

	function _initialize() {
		parent::_initialize();
		$this->options_model = D("Common/Options");
		$this->file_robots = SITE_PATH.'robots.txt';
	}

	function site(){
	    C(S('sp_dynamic_config'));//加载动态配置
		$option=$this->options_model->where("option_name='site_options'")->find();
		$cmf_settings=$this->options_model->where("option_name='cmf_settings'")->getField("option_value");
		// ^[A-Za-z0-9.]*$
		$tpls=sp_scan_dir(C("SP_TMPL_PATH")."*",GLOB_ONLYDIR);
		$noneed=array(".","..",".svn");
		$tpls=array_diff($tpls, $noneed);
		$this->assign("templates",$tpls);

		$adminstyles=sp_scan_dir("public/simpleboot/themes/*",GLOB_ONLYDIR);
		$adminstyles=array_diff($adminstyles, $noneed);
		$this->assign("adminstyles",$adminstyles);
		if($option){
			$this->assign((array)json_decode($option['option_value']));
			$this->assign("option_id",$option['option_id']);
		}
		//栏目一级分类
		$categorys = M('Category')->where('parentid=0')->select();
		//Robots
		if(file_exists($this->file_robots)){
			$this->assign('is_robots',1);
        }else{
        	$this->assign('is_robots',0);
        }
		$this->assign("cmf_settings",json_decode($cmf_settings,true));
		$this->assign('categorys',$categorys);

		$this->display();
	}

	public function sitemap(){
		$this->display();
	}
	
	public function robots(){
		$this->display();
	}
	function site_post(){
		if (IS_POST) {
			if(isset($_POST['option_id'])){
				$data['option_id']=intval($_POST['option_id']);
			}

			$configs["SP_SITE_ADMIN_URL_PASSWORD"]=empty($_POST['options']['site_admin_url_password'])?"":md5(md5(C("AUTHCODE").$_POST['options']['site_admin_url_password']));
			$configs["SP_DEFAULT_THEME"]=$_POST['options']['site_tpl'];
			$configs["DEFAULT_THEME"]=$_POST['options']['site_tpl'];
			$configs["SP_ADMIN_STYLE"]=$_POST['options']['site_adminstyle'];
			$configs["URL_MODEL"]=$_POST['options']['urlmode'];
			$configs["URL_HTML_SUFFIX"]=$_POST['options']['html_suffix'];
			$configs["UCENTER_ENABLED"]=empty($_POST['options']['ucenter_enabled'])?0:1;
			$configs["COMMENT_NEED_CHECK"]=empty($_POST['options']['comment_need_check'])?0:1;
			$comment_time_interval=intval($_POST['options']['comment_time_interval']);
			$configs["COMMENT_TIME_INTERVAL"]=$comment_time_interval;
			$_POST['options']['comment_time_interval']=$comment_time_interval;
			$configs["MOBILE_TPL_ENABLED"]=empty($_POST['options']['mobile_tpl_enabled'])?0:1;
			$configs["HTML_CACHE_ON"]=empty($_POST['options']['html_cache_on'])?false:true;

			sp_set_dynamic_config($configs);//sae use same function

			$data['option_name']="site_options";
			$smeta = I('post.smeta');
			if($smeta['thumb']){
				$smeta['thumb'] = str_replace('watermark','upload',$smeta['thumb']);
			}
			$_POST['options']['smeta'] = json_encode($smeta);
			//栏目水印设置
			if($_POST['catids']){
				$_POST['options']['catids'] = implode(',', $_POST['catids']);
			}
			$data['option_value']=json_encode($_POST['options']);

			if($this->options_model->where("option_name='site_options'")->find()){
				$r=$this->options_model->where("option_name='site_options'")->save($data);
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_SITE'));
			}else{
				$r=$this->options_model->add($data);
				adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_SITE'));
			}

			$banned_usernames=preg_replace("/[^0-9A-Za-z_\x{4e00}-\x{9fa5}-]/u", ",", $_POST['cmf_settings']['banned_usernames']);
			$_POST['cmf_settings']['banned_usernames']=$banned_usernames;

			sp_set_cmf_setting($_POST['cmf_settings']);

			if ($r!==false) {
				$this->success("保存成功！");
			} else {
				$this->error("保存失败！");
			}

		}
	}

	function password(){
		$this->display();
	}

	function logo(){
		$logo = M('ModuleBlocks')->where('rsign="logo"')->find();
		$content = json_decode($logo['content'],true);
		if(IS_POST){
			$post = I('post.');
			$content['logo'] = $post;

			$save = array();
			$save['id'] = $logo['id'];
			$save['content'] = json_encode($content);
			M('ModuleBlocks')->save($save);
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').'logo');
			$this->success("修改成功！");
		}
		$this->assign('content',$content['logo']);
		$this->display();
	}

	function lunbo(){
		$cmbid = intval(I('get.cmbid'));
		$lunbo = M('ModuleBlocks')->where('id='.$cmbid)->find();
		$content = json_decode($lunbo['content'],true);
		if(IS_POST){
			$post = I('post.');
			if(!empty($post['photos_alt']) && !empty($post['photos_url'])){
				$content['image'] = array();
				foreach ($post['photos_url'] as $key=>$url){
					// $photourl=sp_asset_relative_url($url);
					$content['image'][]=array("url"=>$url,"alt"=>$post['photos_alt'][$key],"tar"=>$post['photos_tar'][$key],"seq"=>$post['photos_seq'][$key]);
				}
				$content['image'] = multi_array_sort($content['image'],'seq');
			}
			$content['yangshi'] = $post['yangshi'];
			$save = array();
			$save['id'] = $cmbid;
			$save['content'] = json_encode($content);
			M('ModuleBlocks')->save($save);
			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').'logo');
			$this->success("修改成功！请刷新主页面！");
			exit;
		}

		$this->assign('cmbid',$cmbid);
		$this->assign('content',$content);
		$this->display();
	}

	function languages(){
		$options = M('Langset')->select();
		if(IS_POST){
			$post = I('post.');
			foreach($options as $v){
				if(in_array($v['lsign'],$post['lang'])){
					$v['status'] = 1;
				}else{
					$v['status'] = 0;
				}

				if($post['default']==$v['lsign']){
					$v['def'] = 1;
				}else{
					$v['def'] = 0;
				}

				M('Langset')->save($v);
			}
			$this->success('修改成功');
			exit;
		}

		$this->assign('options',$options);
		$this->display();
	}

	function zcinstall($str){
		set_time_limit(0);
		$site_options = get_site_options();
		$mode = '/(.*[\\\\\/])([\w_-]*)[\\\\\/]application[\\\\\/].*/';
		preg_match_all($mode,__DIR__,$arr);
		// 原项目名
		$xm = $arr[2][0];
		// 原项目路径
		$lj = $arr[1][0].$xm;
		// 新项目名
		if($str=='en-us'){
			if(strripos($xm,'_')===false){
				$xmm = $xm;
			}else{
				$zcz = explode('_',$xm);
				$xmm = $zcz[0];
			}
		}else{
			if(strripos($xm,'_')===false){
				$xmm = $xm.'_'.$str;
			}else{
				$zcz = explode('_',$xm);
				$xmm = $zcz[0].'_'.$str;
			}
		}
		// 新项目路径
		$xmu = $arr[1][0].$xmm;
		$lj = 'D:\WWW\xinxiangmu2';
		if(is_dir($xmu)){
			$this->error('该语种已经存在！');
		}else{
			zc_copy($lj,$xmu);
			$str = "<form id='form1' method='post' action='http://192.168.0.68/{$xmm}/index.php?g=Install&m=Index&a=zckopinstall'>
			<input name='dbhost' type='hidden' value='localhost' />
			<input name='dbuser' type='hidden' value='root'/>
			<input name='dbpw' type='hidden' value='root'/>
			<input name='dbport' type='hidden' value='3306'/>
			<input name='dbname' type='hidden' value='{$xmm}'/>
			<input name='dbprefix' type='hidden' value='cmf_'/>
			<input name='sitename' type='hidden' value='{$site_options['site_name']}'/>
			<input name='manager_email' type='hidden' value='{$site_options['site_admin_email']}'/>
			<input name='siteurl' type='hidden' value='{$site_options['site_host']}'/>
			<input name='sitekeywords' type='hidden' value='{$site_options['site_seo_keywords']}'/>
			<input name='siteinfo' type='hidden' value='{$site_options['site_seo_description']}'/>
			</form>";
			$str .= "<script type='text/javascript'>document.getElementById('form1').submit()</script>";
			echo $str;

		}

	}

	function password_post(){
		if (IS_POST) {
			if(empty($_POST['old_password'])){
				$this->error("原始密码不能为空！");
			}
			if(empty($_POST['password'])){
				$this->error("新密码不能为空！");
			}
			$user_obj = D("Common/Users");
			$uid=get_current_admin_id();
			$admin=$user_obj->where(array("id"=>$uid))->find();
			$old_password=$_POST['old_password'];
			$password=$_POST['password'];
			if(sp_compare_password($old_password,$admin['user_pass'])){
				if($_POST['password']==$_POST['repassword']){
					if(sp_compare_password($password,$admin['user_pass'])){
						$this->error("新密码不能和原始密码相同！");
					}else{
						$data['user_pass']=sp_password($password);
						$data['id']=$uid;
						$r=$user_obj->save($data);
						adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_PASS'));
						if ($r!==false) {
							$this->success("修改成功！");
						} else {
							$this->error("修改失败！");
						}
					}
				}else{
					$this->error("密码输入不一致！");
				}

			}else{
				$this->error("原始密码不正确！");
			}
		}
	}

	//清除缓存
	function clearcache(){

		sp_clear_cache();
		$this->display();
	}
	//删除Robots文件
	function del_robots(){
		if(file_exists($this->file_robots)){
			$rel = unlink($this->file_robots);
            if($rel)$this->success('Robots文件成功删除');
            else $this->error('Robots文件删除失败');
		}else{
			$this->error('Robots文件不存在');
		}
	}


}
