<?php
namespace Api\Controller;
use Common\Controller\HomebaseController;
class GuestbookController extends HomebaseController{
	
	protected $guestbook_model;
	
	function _initialize() {
		parent::_initialize();
		$this->guestbook_model=D("Common/Guestbook");
	}
	
	function index(){
		
	}

	function addeml(){
		if(IS_POST){
			$site_options = get_site_options();
			$site_options['site_admin_email'] = explode(',',$site_options['site_admin_email']);
			$email = I('post.email');
			$reg = '/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/';
			if(!preg_match($reg,$email))$this->error("邮箱格式不正确！");
			$rs = M('Email')->add(array('email'=>$email));
			if($rs){
				foreach($site_options['site_admin_email'] as $v){
					sp_send_email($v,'邮箱询盘','邮箱:'.$email);
				}
				$this->assign('signly',$signly);
				$this->success("留言成功！");
			}
		}
	}
	
	function addmsg1(){
		
		if(!zc_check_verify(I('post.verifyid',0))){
			$this->error(L('VERIFY_CODE_ERROR'));
		}

		
		if (IS_POST) {
			$post = $_POST;
	        if(stristr($post['msg'],'http')!==false)
	        {
	              $this->error(L('RNSORRY'));
	              exit;
	        }

			$site_options = get_site_options();
			$site_options['site_admin_email'] = explode(',',$site_options['site_admin_email']);

			$upload = new \Think\Upload();
			$upload->maxSize = 20971520;  //20M
			$upload->exts = array('doc','docx','xls','xlsx','txt','rar','zip','jpg','jpeg','png','bmp','pdf');
			$upload->subName = date("Ymd",time());
			$upload->rootPath = "./data/upload/";

			if(!empty($_FILES['file']['tmp_name'])){
				$info = $upload->uploadOne($_FILES['file']);
				if(!$info){
					$this->error($upload->getError());
				}else{
					$filename = './data/upload/'.$info['savepath'].$info['savename'];
				}
			}
			$_POST['file'] = $filename;
			$validate = array(
					// array('full_name', 'require', L('NAMETIP'), 1, 'regex', 3 ),
					// array('email', 'require', L('EMAIL_N_TIP'), 1, 'regex', 3 ),
					// array('msg', 'require', L('CONTENT_N_TIP'), 1, 'regex', 3 ),
					// array('email','email',L('EMAIL_E_TIP'),0,'',3 ),
			);
			$auto = array(
					array('createtime','mDate',1,'callback'),
			);
			//新加 存入产品信息
			if($_POST['pids']){
				$pids = $_POST['pids'];
				$ii = 0;
				foreach ($pids as $key => $val) {
					$parr[$ii]["pid"] = intval($val);
					$parr[$ii]["pnum"] = $_POST["num"][$key];
					$ii++;
				}
				$_POST['pid'] = json_encode($parr);
			}
			$position_info = getlocation_ip();
			$_POST['from_country_ip'] = $position_info['ip'];
			// $_POST['from_country'] = $_POST['from_country']?$_POST['from_country']:$position_info['country'];
			
			if ($this->guestbook_model->validate($validate)->auto($auto)->create()) {
				$str = zc_guestbookfield(I('post.'));
				$guojia = getlocation_ip();
				$this->guestbook_model->status=1;
				// if(!empty($guojia['country']))$this->guestbook_model->from_country_ip = $guojia['country'];
				$result=$this->guestbook_model->add();
				cookie('pro',null);
				if ($result!==false) {
					foreach($site_options['site_admin_email'] as $v){

						$params = array();
						$siteOption = sp_get_site_options();
						$params['title']  = $siteOption['site_name'];
						$params['sendname'] = $v; 				// 收件人
						$params['content']  = $str;   // 发送内容
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

						
					}
					$cate = getCategory(5);

					$this->success(L('RNXP_OK'), $cate['url']);
					
				} else {
					$this->error("Sorry");
				}
			} else {
				$this->error($this->guestbook_model->getError());
			}
		}

	}
	function addmsg2(){
		if(!zc_check_verify(I('post.verifyid',0))){
			$this->error(L('VERIFY_CODE_ERROR'));
		}
		
		if (IS_POST) {
			$post = $_POST;
	        if(stristr($post['msg'],'http')!==false)
	        {
	              $this->error(L('RNSORRY'));
	              exit;
	        }

			$site_options = get_site_options();
			$site_options['site_admin_email'] = explode(',',$site_options['site_admin_email']);

			$upload = new \Think\Upload();
			$upload->maxSize = 20971520;  //20M
			$upload->exts = array('doc','docx','xls','xlsx','txt','rar','zip','jpg','jpeg','png','bmp','pdf');
			$upload->subName = date("Ymd",time());
			$upload->rootPath = "./data/upload/";

			if(!empty($_FILES['file']['tmp_name'])){
				$info = $upload->uploadOne($_FILES['file']);
				if(!$info){
					$this->error($upload->getError());
				}else{
					$filename = './data/upload/'.$info['savepath'].$info['savename'];
				}
			}
			$_POST['file'] = $filename;
			$validate = array(
					// array('full_name', 'require', L('NAMETIP'), 1, 'regex', 3 ),
					// array('email', 'require', L('EMAIL_N_TIP'), 1, 'regex', 3 ),
					// array('msg', 'require', L('CONTENT_N_TIP'), 1, 'regex', 3 ),
					// array('email','email',L('EMAIL_E_TIP'),0,'',3 ),
			);
			$auto = array(
					array('createtime','mDate',1,'callback'),
			);
			//新加 存入产品信息
			if($_POST['pids']){
				$pids = $_POST['pids'];
				$ii = 0;
				foreach ($pids as $key => $val) {
					$parr[$ii]["pid"] = intval($val);
					$parr[$ii]["pnum"] = $_POST["num"][$key];
					$ii++;
				}
				$_POST['pid'] = json_encode($parr);
			}
			$position_info = getlocation_ip();
			$_POST['from_country_ip'] = $position_info['ip'];
			// $_POST['from_country'] = $_POST['from_country']?$_POST['from_country']:$position_info['country'];
			
			if ($this->guestbook_model->validate($validate)->auto($auto)->create()) {
				$str = zc_guestbookfield(I('post.'));
				$guojia = getlocation_ip();
				$this->guestbook_model->status=1;
				// if(!empty($guojia['country']))$this->guestbook_model->from_country_ip = $guojia['country'];
				$result=$this->guestbook_model->add();
				cookie('pro',null);
				if ($result!==false) {
					foreach($site_options['site_admin_email'] as $v){

						$siteOption = sp_get_site_options();
						$params = array();
						$params['title']  = $siteOption['site_name'].", Inquiry remind from Reanod";
						$params['sendname'] = $v; 				// 收件人
						$params['content']  = $str;   // 发送内容
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

						
					}
					$cate = getCategory(5);

					$this->success(L('RNXP_OK'), $cate['url']);
					
				} else {
					$this->error("Sorry");
				}
			} else {
				$this->error($this->guestbook_model->getError());
			}
		}

	}
}