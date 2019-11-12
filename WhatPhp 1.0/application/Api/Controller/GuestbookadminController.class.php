<?php



namespace Api\Controller;



use Common\Controller\AdminbaseController;



class GuestbookadminController extends AdminbaseController{



	



	protected $guestbook_model;



	



	function _initialize() {



		parent::_initialize();



		$this->guestbook_model=D("Common/Guestbook");



	}







	function email(){



		$email = M('Email')->where('status=1')->select();



		$this->assign('email',$email);



		$this->display();



	}







	function delemail(){



		$id = I('get.id');



		$data = array();



		$data['status'] = 0;



		$data['del_time'] = time();



		M('Email')->where('status=1')->save($data);



	}



	



	function index(){



		$join = 'left join '.C('DB_PREFIX').'users b on a.salesman=b.id';



		$guestmsgs_info = $this->guestbook_model->field('a.*,b.user_login,b.user_nicename')->alias('a')->join($join)->where(array("a.status"=>1))->select();



		//搜索项



		foreach($guestmsgs_info as $key=>$val){



			$salesman[] = $val['salesman'];



			$from_country[] = $val['from_country'];



		}



		$salesmans = array_unique($salesman);



		$from_country = array_unique($from_country);



		foreach ($salesmans as $k => $v) {



			$map['salesman'] = $v;



			$map['status'] = 1;



			$infos = $this->guestbook_model->field('a.*,b.user_login,b.user_nicename')->alias('a')->join($join)->where($map)->find();



			if($infos['salesman']){



			$yw_data[$k]['ywid'] = $infos['salesman'];



			$yw_data[$k]['name'] = $infos['user_login'];



			$yw_data[$k]['nicename'] = $infos['user_nicename'];



			}



		}



		$this->assign('yw_data',$yw_data);



		$this->assign('from_country',$from_country);



		if(IS_POST){



			if($_POST['start_time'] && empty($_POST['end_time'])){



				$wheres['createtime'] = array(array('EGT',$_POST['start_time']));



			}



			if($_POST['start_time'] < $_POST['end_time']){



				$wheres['createtime'] = array(array('EGT',$_POST['start_time']),array('LT',$_POST['end_time']));



			}



			if($_POST['type'] == 1 && $_POST['keyword']){



				$wheres['full_name'] = array('LIKE',"%{$_POST['keyword']}%");



			}elseif($_POST['type'] == 2 && $_POST['keyword']){



				$wheres['email'] = array('LIKE',"%{$_POST['keyword']}%");



			}elseif($_POST['type'] == 3 && $_POST['keyword']){



				$wheres['company_name'] = array('LIKE',"%{$_POST['keyword']}%");



			}



			if($_POST['salesman']){



				$wheres['salesman'] = $_POST['salesman'];



			}



			if($_POST['from_country']){



				$wheres['from_country'] = $_POST['from_country'];



			}



			



			if($_POST['ltype']){



				$wheres['type'] = I('ltype','','int');



			}



			



			$this->assign('post',$_POST);



		}



		



		if(IS_GET){



			if($_GET['ltype']){



				$wheres['type'] =I('ltype','','int');



				$this->assign('post',$_GET);



			}



		}



		



		//从数据库清空删除一个月后的



		$del_info = $this->guestbook_model->where('status=0')->select();



		if($del_info){



			foreach($del_info as $val){



				$cha = time()-$val['del_time'];



				$day = ceil($cha/3600/24);



				if($day >= 31){



					$where['del_time'] = array('eq',$val['del_time']);



					$this->guestbook_model->where($where)->delete();



				}



			}



		}



		$wheres['status'] = 1;



		$count=$this->guestbook_model->where($wheres)->count();



		$page = $this->page($count, 10);



		$guestmsgs = $this->guestbook_model->field('a.*,b.user_login,b.user_nicename')->alias('a')->join($join)->where($wheres)->order(array("createtime"=>"DESC"))->limit($page->firstRow . ',' . $page->listRows)->select();























		$group = M('guestbook_group')->select();



		$this->assign("group", $group);



		$this->assign("where", base64_encode(json_encode($wheres)));



		$this->assign("Page", $page->show('Admin'));



		$this->assign("guestmsgs",$guestmsgs);



		$this->display();



	}







	function excel(){



		$where = I('get.where');



		$where = json_decode(base64_decode($where),true);



		$join = 'left join '.C('DB_PREFIX').'users b on a.salesman=b.id';



		$guestmsgs=$this->guestbook_model->field('a.*,b.user_login,b.user_nicename')->alias('a')->join($join)->where($where)->order(array("createtime"=>"DESC"))->select();



		// $arr = array(array('ID','姓名','邮箱','留言内容','国家','电话','产品','留言时间','业务员','备注'));
		$arr = array(array('ID','姓名','邮箱','留言内容','国家','电话','产品','留言时间'));


		foreach($guestmsgs as $v){



			$brr = array();



			$brr[] = $v['id'];



			$brr[] = $v['full_name'];



			$brr[] = $v['email'];



			// $brr[] = $v['title'];



			$brr[] = $v['msg'];



			$brr[] = $v['from_country'];



			$brr[] = $v['tel'];



			// $brr[] = $v['fax'];



			// $brr[] = $v['address'];

			$gullv=htmlspecialchars_decode(str_replace("\'","",$v['pid']));
			
			$brr[]=strip_tags(str_replace("<br />",", ",$gullv)); 



			$brr[] = $v['createtime'];



			// $brr[] = $v['user_login']?$v['user_login'].'('.$v['user_nicename'].')':'未分配';

   //          $brr[] = $v['content'];

			$arr[] = $brr;



		}
		zcexcel($arr);



	}



	

	

	function manage_string($string)

	{

		if (empty($string)) {

			return false;

		}

		$reg1='/<a .*?>.*?<\/a>/';
		//$string = "<a href='http://policecamera.reanodb2b.com/body-worn-camera/m852-police-camera.html' target='_blank'> M852 Police Camera</a><br />";
		preg_match_all($reg1, $string, $aarray);

		print_r($string);echo '<br />';
		print_r($aarray);exit();

		if (empty($aarray[0])) {

			return false;

		}

		foreach ($aarray[0] as $key => $val) {

			$con[] = strip_tags($val);

		}

		$str = implode(', ', $con);

		return $str;

	}



	function setting(){



		$GuestbookSet = M('GuestbookSet');



		if(IS_POST){



			$post = I('post.');



			foreach ($post as $k=>$v) {



				$rs = $GuestbookSet->where("zkey='$k'")->find();



				if($rs){



					$GuestbookSet->where("zkey='$k'")->save(array('zvalue'=>$v));



				}else{



					$GuestbookSet->add(array('zkey'=>$k,'zvalue'=>$v));



				}



			}



			$this->success("修改成功");



			exit;



		}



		$list = $GuestbookSet->select();



		$ldat = array();



		foreach($list as $v){



			$ldat[$v['zkey']] = $v['zvalue'];



		}



		$this->assign('ldat',$ldat);



		$this->display();



	}







	function see(){



		$id=intval(I("get.id"));







		$gs = S('GuestbookSet');



		if(!$gs){



			$cs = M('GuestbookSet')->select();



			foreach($cs as $v){



				$gs[$v['zkey']] = $v['zvalue'];



			}



			S('GuestbookSet',$gs);



		}







		$ywjlyuy = S('ywjlyuy');



		if(!$ywjlyuy){



			$join = 'left join '.C('DB_PREFIX').'users b on a.user_id=b.id';



			$ywjlyuy = M('RoleUser')->alias('a')->join($join)->where('role_id = 4 and user_status=1')->select();



			foreach($ywjlyuy as $k=>$v){



				$join = 'left join '.C('DB_PREFIX').'users b on a.uid=b.id';



				$ywjlyuy[$k]['child'] = M('CrmUser')->alias('a')->join($join)->where('user_status=1 and mid='.$v['user_id'])->select();



			}



			S('ywjlyuy',$ywjlyuy);



		}







		$this->assign('gs',$gs);



		$this->assign('ywjlyuy',$ywjlyuy);



		



		$guestmsgs=$this->guestbook_model->where(array("id"=>$id))->find();



		//询盘产品



		$pros = array();



		if($guestmsgs['pid']){



			$pros = json_decode(str_replace('&quot;', '"', $guestmsgs['pid']),true);



			foreach ($pros as $key => $val) {



				$pinfo = M('Product')->where('id='.$val['pid'])->find();



				$pros[$key]['title'] = $pinfo['title'];



				$pros[$key]['short_title'] = str_cut($pinfo['title'],15);



				$pros[$key]['thumb'] = $pinfo['thumb'];



				$pros[$key]['url'] = $pinfo['url'];



				$pros[$key]['moveurl'] = $pinfo['moveurl'];



			}



		}



		$Users = M('Users')->cache(true)->where('user_type=1')->select();



		$this->assign('guestmsgs',$guestmsgs);



		$this->assign('Users',$Users);



		$this->assign('id',$id);



		$this->assign('pros',$pros);



		$this->display();



	}







	function distributionall(){







		$gs = S('GuestbookSet');



		if(!$gs){



			$cs = M('GuestbookSet')->select();



			foreach($cs as $v){



				$gs[$v['zkey']] = $v['zvalue'];



			}



			S('GuestbookSet',$gs);



		}







		if(IS_POST){



			$post = I('post.post');



			$salesman = get_salesman();



			foreach($post as $k=>$v){



				$v['id'] = $k;



				$v['salesman'] = $v['salesman2']?$v['salesman2']:$v['salesman'];



				if(!isset($v['salesman']))continue;



				$rs = $this->guestbook_model->save($v);



				if($rs === false){



					$this->error('失败请重试');



				}else{



					$guestmsgs=$this->guestbook_model->where(array("id"=>$post['id']))->find();







					$str = zc_guestbookfield($v);



					$rs = sp_send_email($salesman[$v['salesman']]['user_email'],$v['title']?$v['title']:'有新的询盘',$str);







					$data = array();



					$RoleUser = M('RoleUser')->field('role_id')->cache(true)->where('user_id='.$v['salesman'])->find();



					if($RoleUser['role_id']==4){



						// 分配给业务经理



						$data['level'] = 4;



						$data['uid'] = 0;



						$data['mid'] = $v['salesman'];



					}else{



						// 分配给业务员



						$CrmUser = M('CrmUser')->field('mid')->where('uid='.$v['salesman'])->find();



						$data['level'] = 5;



						$data['gtime'] =time();



						$data['uid'] = $v['salesman'];



						$data['mid'] = $CrmUser['mid'];



					}



					$data['status'] =2;



					$data['username'] = $v['full_name'];



					$data['email'] = $v['email'];



					$data['guest_title'] = $v['title'];



					$data['guest_msg'] = $v['msg'];



					$data['guest_pid'] = $guestmsgs['pid']?$guestmsgs['pid']:'';//询盘产品



					$data['telephone'] = $v['tel'];



					$data['remark'] = $v['content'];



					$data['addtime'] = time();



					$data['gtime'] =time();



					$data['cname'] = $v['company_name'];



					$data['fax'] = $v['fax'];



					$data['address'] = $v['address'];



					$data['country'] = $v['from_country'];



					$cid = M('Client')->add($data);







					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_FPXP').'('.$v['full_name'].')');



				}







				if($cid){



					$data = array();



					if($RoleUser['role_id']==4){



						// 分配给业务经理



						$data['cid'] = $cid;



						$data['uid'] = 0;



						$data['status'] = 1;



						$data['confirm'] = 1;



						$data['req_time'] = time();



						$data['con_time'] = time();



						$data['con_user'] = $_SESSION['ADMIN_ID'];



						$data['remark'] = '询盘分配';



						$data['type'] = 4;



					}else{



						// 分配给业务员



						$data['cid'] = $cid;



						$data['uid'] = $v['salesman'];



						$data['status'] = 1;



						$data['confirm'] = 1;



						$data['req_time'] = time();



						$data['con_time'] = time();



						$data['con_user'] = $_SESSION['ADMIN_ID'];



						$data['remark'] = '询盘分配';



						$data['type'] = 4;



						$data['type'] = 5;



					}



					M('ClientStatus')->add($data);



				}







			}







			$this->success("分配成功，邮件已发送", U("Guestbookadmin/index"));



			exit;



		}







		$ywjlyuy = S('ywjlyuy');



		if(!$ywjlyuy){



			$join = 'left join '.C('DB_PREFIX').'users b on a.user_id=b.id';



			$ywjlyuy = M('RoleUser')->alias('a')->join($join)->where('role_id = 4 and user_status=1')->select();



			foreach($ywjlyuy as $k=>$v){



				$join = 'left join '.C('DB_PREFIX').'users b on a.uid=b.id';



				$ywjlyuy[$k]['child'] = M('CrmUser')->alias('a')->join($join)->where('b.id != '.$v['user_id'].' and user_status=1 and mid='.$v['user_id'])->select();



			}



			S('ywjlyuy',$ywjlyuy);



		}







		$this->assign('gs',$gs);



		$this->assign('ywjlyuy',$ywjlyuy);







		$ids = I('get.zczz');



		$data = array();



		$data['id'] = array('in',$ids);



		$data['salesman'] = 0;



		$arr = $this->guestbook_model->where($data)->select();



		$join = 'left join '.C('DB_PREFIX').'role_user as b on a.id=b.user_id';



		$Users = M('Users')->alias('a')->join($join)->where('a.user_type=1 and b.role_id=4')->select();



		$this->assign('Users',$Users);



		$this->assign('arr',$arr);



		$this->display();



	}







function distribution(){



		$id=intval(I("get.id"));







		$gs = S('GuestbookSet');



		if(!$gs){



			$cs = M('GuestbookSet')->select();



			foreach($cs as $v){



				$gs[$v['zkey']] = $v['zvalue'];



			}



			S('GuestbookSet',$gs);



		}







		if(IS_POST){



			$post = I('post.post');



			$post['salesman'] = $post['salesman2'] ? $post['salesman2'] : $post['salesman'];



			$rs = $this->guestbook_model->save($post);



			if($rs === false){



				$this->error('失败请重试');



			}else{



				$salesman = get_salesman();



				$str = zc_guestbookfield($post);



				

				$yewuyx[0]=$salesman[$post['salesman']]['user_email'];

			

				//$rs = sp_send_email($salesman[$post['salesman']]['user_email'],$post['title']?$post['title']:'有新的询盘',$str);

				

				

				foreach($yewuyx as $v){



						$params = array();

						$params['sendname'] = $v; 	  // 收件人

						$params['title'] = "有新的询盘"; 	  // 收件人

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

				

				



				if($rs['error']){



					$this->error($rs['message']);



				}else{



					//询盘产品



					$guestmsgs=$this->guestbook_model->where(array("id"=>$post['id']))->find();



					



					$data = array();



					$RoleUser = M('RoleUser')->field('role_id')->cache(true)->where('user_id='.$post['salesman'])->find();



					if($RoleUser['role_id']==4){



						// 分配给业务经理



						$data['level'] = 4;



						$data['uid'] = 0;



						$data['mid'] = $post['salesman'];



					}else{



						// 分配给业务员



						$CrmUser = M('CrmUser')->field('mid')->where('uid='.$post['salesman'])->find();



						$data['level'] = 5;



						$data['gtime'] =time();



						$data['uid'] = $post['salesman'];



						$data['mid'] = $CrmUser['mid'];



					}



					$data['status'] =2;



					$data['username'] = $post['full_name'];



					$data['email'] = $post['email'];



					$data['guest_title'] = $post['title'];



					$data['guest_msg'] = $post['msg'];



					$data['guest_pid'] = $guestmsgs['pid']?$guestmsgs['pid']:'';//询盘产品



					$data['telephone'] = $post['tel'];



					$data['remark'] = $post['content'];



					$data['addtime'] = time();



					$data['gtime'] =time();



					$data['cname'] = $post['company_name'];



					$data['fax'] = $post['fax'];



					$data['address'] = $post['address'];



					$data['country'] = $post['from_country'];



					$cid = M('Client')->add($data);



					adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_FPXP').'('.$post['full_name'].')');



				}



			}







			if($cid){



				$data = array();



				if($RoleUser['role_id']==4){



					// 分配给业务经理



					$data['cid'] = $cid;



					$data['uid'] = 0;



					$data['status'] = 1;



					$data['confirm'] = 1;



					$data['req_time'] = time();



					$data['con_time'] = time();



					$data['con_user'] = $_SESSION['ADMIN_ID'];



					$data['remark'] = '询盘分配';



					$data['type'] = 4;



				}else{



					// 分配给业务员



					$data['cid'] = $cid;



					$data['uid'] = $post['salesman'];



					$data['status'] = 1;



					$data['confirm'] = 1;



					$data['req_time'] = time();



					$data['con_time'] = time();



					$data['con_user'] = $_SESSION['ADMIN_ID'];



					$data['remark'] = '询盘分配';



					$data['type'] = 4;



					M('ClientStatus')->add($data);



					$data['type'] = 5;



				}



				M('ClientStatus')->add($data);



			}







			$this->success("分配成功，邮件已发送", U("Guestbookadmin/index"));



			exit;







		}







		$ywjlyuy = S('ywjlyuy');



		if(!$ywjlyuy){



			$join = 'left join '.C('DB_PREFIX').'users b on a.user_id=b.id';



			$ywjlyuy = M('RoleUser')->alias('a')->join($join)->where('role_id = 4 and user_status=1')->select();



			foreach($ywjlyuy as $k=>$v){



				$join = 'left join '.C('DB_PREFIX').'users b on a.uid=b.id';



				$ywjlyuy[$k]['child'] = M('CrmUser')->alias('a')->join($join)->where('b.id != '.$v['user_id'].' and user_status=1 and mid='.$v['user_id'])->select();



			}



			S('ywjlyuy',$ywjlyuy);



		}







		$this->assign('gs',$gs);



		$this->assign('ywjlyuy',$ywjlyuy);



		$guestmsgs=$this->guestbook_model->where(array("id"=>$id))->find();



		//标为已读



		if($guestmsgs['read']==0)$this->guestbook_model->where(array("id"=>$id))->save(array('read'=>1));



		//询盘产品



		$pros = array();



		if($guestmsgs['pid']){



			$pros = json_decode(str_replace('&quot;', '"', $guestmsgs['pid']),true);



			foreach ($pros as $key => $val) {



				$pinfo = M('Product')->where('id='.$val['pid'])->find();



				$pros[$key]['title'] = $pinfo['title'];



				$pros[$key]['short_title'] = str_cut($pinfo['title'],15);



				$pros[$key]['thumb'] = $pinfo['thumb'];



				$pros[$key]['url'] = $pinfo['url'];



				$pros[$key]['moveurl'] = $pinfo['moveurl'];



			}



		}



		$Users = M('Users')->cache(true)->where('user_type=1')->select();



		$this->assign('guestmsgs',$guestmsgs);



		$this->assign('Users',$Users);



		$this->assign('id',$id);



		$this->assign('pros',$pros);



		$this->display();







	}







	function deleteall(){



		$ids = I('post.ids');



		$data['status'] = 0;



		$data['del_time'] = time();



		$result=$this->guestbook_model->where(array('id'=>array('in',$ids)))->save($data);



		// echo M()->_sql();



		if($result!==false){



			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_XUNPAN'));



			$this->success("删除成功！", U("Guestbookadmin/index"));



		}else{



			$this->error('删除失败！');



		}







	}







	function delete(){



		$id=intval(I("get.id"));



		$data['status'] = 0;



		$data['del_time'] = time();//strtotime(" +1 month");//清空时间



		$result=$this->guestbook_model->where(array("id"=>$id))->save($data);



		if($result!==false){



			adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').L('ADMINLOG_XUNPAN'));



			$this->success("删除成功！", U("Guestbookadmin/index"));



		}else{



			$this->error('删除失败！');



		}



	}



	function search_keyword(){



		$keywords = I('keywords');







		$where['a.user_login'] = array("LIKE", "%".$keywords."%");



		$where['a.user_type'] = 1;



		$where['b.role_id'] = 4;







		$join = 'left join '.C('DB_PREFIX').'role_user as b on a.id=b.user_id';



		$Users = M('Users')->alias('a')->join($join)->where($where)->select();







		$this->ajaxReturn(array('data' => $Users, 'status' => 1));



	}







	/* 



	 * 询盘显示字段管理



	 * @author cx



	 * @time 20160718



	 *  



	 *  */



	



	



	public function guestBookGroup(){



		 



		$count = M('guestbook_group')->count();



		



		$page = $this->page($count, 20);



		$list = M('guestbook_group')->order(" id asc ")->limit($page->firstRow.",".$page->listRows)->select(); 



		



		$this->assign("Page",$page->show("Admin"));



		$this->assign("list" , $list);



		$this->display();



		



	}







	



	/* 



	 * 添加询盘显示类别



	 * @author cx



	 * @time 20160718



	 *  



	 *  */



	public function addGroup(){



		



		



		//得到所有询盘的字段



		$list = M('guestbook_field')->select(); 



		



		$this->assign("list", $list);



		$this->display();



	}



	



	



	/* 



	 * 添加类别提交



	 * @author cx



	 * @time 20160718



	 *  



	 *  */



	



	public function add_post(){



		



		if(IS_POST){



			 $time = time();



			



			$title = I('title','','trim');		 //类别名称



			$ifshow = I('ifshow','','trim');    //显示的字段



			$ifr = I('ifr','','trim'); 			//必填字段



			



			if(!$title){



				$this->error("请填写类别名称！");



			}



			



			if(!$ifshow){



				$this->error("请选择显示字段！");



			}



			



			//将新类别保存至 guestbook_group表



			$status = M('guestbook_group')->add(array('name'=>$title,'addtime'=>$time));



			if($status){



				$field = M('guestbook_field')->select();



				$showarr = explode(",", $ifshow);



				 



				foreach($field as $value){



					$data = array();



					$data['guestbook_group_id'] = $status;



					$data['fieldid'] = $value['id'];



					if(strpos($ifshow, $value['id'])!==false){   //确定显示



						



						$data['if_show'] =1;



						if(strpos($ifr,$value['id'])!==false){   //确定必须



							$data['if_require'] =1;



						}



						



					}



					



					$data['addtime'] =$time;



					 



					$status2 = M('guestbook_data')->add($data);



			 



				}



			 



				$this->success("添加成功！");



				



			}else {



				$this->error("保存类别表失败！");



			}



			



		}



		



		



	}



	



	/*



	 * 修改类型



	 * @author cx



	 * @time 20160718



	 *   



	 *   */



	



	public function editGroup(){



		



		$id = I('id','','int');



		



		if(!$id){



			$this->error("请选择询盘类型！");



		}



		



		$info = M("guestbook_group")->where(" id = $id")->find();



		if(!$info){



			$this->error("未找到选择询盘类型！");



		}



		



		



		$field = M()->table("cmf_guestbook_data as ga left join cmf_guestbook_field as gf on ga.fieldid = gf.id")->field("ga.fieldid, ga.if_show, ga.if_require, gf.name, gf.desc")->where(" ga.guestbook_group_id = $info[id]")->order(" ga.fieldid asc ")->select();



		



		$this->assign("list" , $field);



		$this->assign("info" , $info);



		$this->display();



		



		



	}



	



	



	/* 



	 * 类型修改提交



	 * @author cx



	 * @time 20160718



	 *  



	 *  */



	



	public function edit_post(){



		



		



		if(IS_POST){



			 



			$gid = I('gid','','int');



			



			$field = M('guestbook_field')->select();



			$ifshow = I('ifshow','','trim');           //是否显示



			$ifr = I('ifr','','trim'); 					// 是否必须



			 



			foreach($field as $value){



				



				if(strpos($ifshow, $value['id'])!==false){   //确定显示



				



					$data['if_show'] =1;



					if(strpos($ifr,$value['id'])!==false){   //确定必须



						$data['if_require'] =1;



					}else {



						$data['if_require'] =2;



					}



				



				}else {



					$data['if_show'] =2;



					$data['if_require'] =2;



				}



				



				 



				$status = M('guestbook_data')->where("guestbook_group_id= $gid and fieldid =".$value['id'])->save($data);



				



			}



			 



			$this->success("修改成功！");



			



		}



		



	}



	 



}