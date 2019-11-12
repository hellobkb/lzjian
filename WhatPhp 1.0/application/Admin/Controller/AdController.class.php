<?phpnamespace Admin\Controller;use Common\Controller\AdminbaseController;class AdController extends AdminbaseController{	protected $ad_model;		function _initialize() {		parent::_initialize();		$this->ad_model = D("Common/Ad");		$this->tdir = array(				'1'=> './data/upload/',				'2'=>'./themes/simplebootx/picbanners/'			);		$this->tdirlook = array(				'1'=> __ROOT__.'/data/upload/',				'2'=>__ROOT__.'/themes/simplebootx/picbanners/'			);		$this->assign('tdir',$this->tdir);	}		function index(){		//$ads=$this->ad_model->select();		//$this->assign("ads",$ads);		$this->display();	}		function add(){		$this->display();	}	function site(){		$options_obj = M("Options");				$option = $options_obj->where("option_name='site_indexads'")->find();		if($option){			$site_options = json_decode($option['option_value'],true);			//$this->assign('ads',$site_options);		}$this->assign('option',$option);		$images = $this->getpiclist($directory);		$this->assign('images',$images);		/*$dir = "./img/";  //要获取的目录				//先判断指定的路径是不是一个文件夹		if (is_dir($dir)){			if ($dh = opendir($dir)){				while (($file = readdir($dh))!= false){					//文件名的全路径 包含文件名					$filePath = $dir.$file;					//echo "<img src='".$filePath."'/>";					$pic[] = $filePath;				}				closedir($dh);			}			print_r($pic);		}*/		$this->display();	}	function site1(){		//echo "<script>window.open('http://www.reanod.com');window.history.back(-1);</script>";		$options_obj = M("Options");				$option = $options_obj->where("option_name='site_indexads'")->find();		if($option){			$site_options = json_decode($option['option_value'],true);			$this->assign('ads',$site_options);		}$this->assign('option',$option);		/*$dir = "./img/";  //要获取的目录				//先判断指定的路径是不是一个文件夹		if (is_dir($dir)){			if ($dh = opendir($dir)){				while (($file = readdir($dh))!= false){					//文件名的全路径 包含文件名					$filePath = $dir.$file;					//echo "<img src='".$filePath."'/>";					$pic[] = $filePath;				}				closedir($dh);			}			//print_r($pic);		}*/		$this->display();	}	function site_post(){		if($_POST){			foreach ($_POST['photos_url'] as $key => $value) {				$data[$key]['url'] = $value;				$data[$key]['alt'] = $_POST['photos_alt'][$key];				$data[$key]['href'] = $_POST['photos_href'][$key];				$data[$key]['sort'] = $_POST['photos_sort'][$key];			}			$d['option_value'] = json_encode($data);			$options_obj = M("Options");			$option = $options_obj->where("option_name='site_indexads'")->find();			if($option){				$rel = $options_obj->where("option_name='site_indexads'")->save($d);			}else{				$d['option_name'] = 'site_indexads';				$rel = $options_obj->where("option_name='site_indexads'")->add($d);			}			if($rel){				$this->success('操作成功');			}else{				$this->error('操作失败');			}		}	}		function add_post(){		if(IS_POST){			if ($this->ad_model->create()){				if ($this->ad_model->add()!==false) {					$this->success(L('ADD_SUCCESS'), U("ad/index"));				} else {					$this->error(L('ADD_FAILED'));				}			} else {				$this->error($this->ad_model->getError());			}				}	}		function edit(){		$id=I("get.id");		$ad=$this->ad_model->where("ad_id=$id")->find();		$this->assign($ad);		$this->display();	}		function edit_post(){		if (IS_POST) {			if ($this->ad_model->create()) {				if ($this->ad_model->save()!==false) {					$this->success("保存成功！", U("ad/index"));				} else {					$this->error("保存失败！");				}			} else {				$this->error($this->ad_model->getError());			}		}	}		/**	 *  删除	 */	function delete(){		$id = I("get.id",0,"intval");		if ($this->ad_model->delete($id)!==false) {			$this->success("删除成功！");		} else {			$this->error("删除失败！");		}	}		function toggle(){		if(isset($_POST['ids']) && $_GET["display"]){			$ids = implode(",", $_POST['ids']);			$data['status']=1;			if ($this->ad_model->where("ad_id in ($ids)")->save($data)!==false) {				$this->success("显示成功！");			} else {				$this->error("显示失败！");			}		}		if(isset($_POST['ids']) && $_GET["hide"]){			$ids = implode(",", $_POST['ids']);			$data['status']=0;			if ($this->ad_model->where("ad_id in ($ids)")->save($data)!==false) {				$this->success("隐藏成功！");			} else {				$this->error("隐藏失败！");			}		}	}	function picbanners(){		$directory = I('directory');		if($directory){			$directory = $directory.'/';		}else{			$directory = '';		}		$data = $this->getpiclist($directory);		$this->assign('images',$data['images']);		//print_r($images);		$this->display();	}	/*function getxon(){		$directory = I('directory');		$py = I('p');		$p = $py?$py:1;				$datac = $this->getpiclist($directory,$p);		$images = $datac['images'];		if($images){							$str = '<div class="row">';				foreach ($images as $k=>$image) {					if($k%4 == 0){						$maln = "maln";					}else{						$maln='';					}					$str .= '<div class="col-sm-3 col-xs-6 text-center '.$maln.'">';					if ($image['type'] == 'directory') {						$str .= '<div class="text-center"><a onClick="cin(\''.$image['directory'].'\')" class="directory" style="vertical-align: middle;"><i class="fa fa-folder fa-5x"></i></a></div>';						$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" />'.$image['name'].'</label>';											}					if ($image['type'] == 'image') {						$str .= '<a href="'.$image['href'].'" class="thumbnail"><img src="'.$image['thumb'].'" alt="'.$image['name'].'" title="'.$image['name'].'" /></a>';												$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" />'.$image['name'].'</label>';					}					$str .= '</div>';				}			}							$data['status'] = 1;		if($directory){			$dirarr = array_filter(explode('/', $directory));			array_pop($dirarr);			$dir = implode('/', $dirarr);			if($dnum >= 0){				$data['parentdir'] = $dir.'/';			}else{				$data['parentdir'] = '';			}		}else{			$data['parentdir'] = '';		}				$data['curdir'] = $directory;		$data['str'] = $str?$str:'';		$data['type'] = $type;		$data['p'] = $p;		$data['page'] = $datac['page'];		$this->ajaxReturn($data);	}*/	function getxon2(){		$directory = I('directory');		$type = I('type');		$py = I('p');		$p = $py?$py:1;		$w = I('ws')?I('ws'):0;		if ($this->checkPath($directory, './.')) {   		 exit;		}		$datac = $this->getpiclist($directory,$p,$type,$w);		$images = $datac['images'];				if($images){			$str = '<div class="row">';			foreach ($images as $k=>$image) {				if($k%4 == 0){					$maln = "maln";				}else{					$maln='';				}				$str .= '<div class="col-sm-3 col-xs-6 text-center '.$maln.'">';				if ($image['type'] == 'directory') {					$str .= '<div class="text-center"><a onClick="cin(\''.$image['directory'].'\',\''.$type.'\')" class="directory" style="vertical-align: middle;"><i class="fa fa-folder fa-5x"></i></a></div>';					if($w){						$str .= '<label>'.$image['name'].'</label>';					}else{						$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" />'.$image['name'].'</label>';					}														}				if ($image['type'] == 'image') {										if($w){						$str .= '<a href="javascript:;" id="aid-'.$image['mtime'].'" class="get"><img onClick="album_cancel(this,\''.$image['mtime'].'\',\''.$image['thumb'].'\')" date-id="'.$image['mtime'].'" data-path="'.$image['thumb'].'" src="'.$image['thumb'].'" alt="'.$image['name'].'" title="'.$image['name'].'" /></a>';						$str .= '<label>'.$image['name'].'</label>';					}else{						$is_catch = rand(0,9999);						$str .= '<a href="javascript:;" class="get"><img src="'.$image['thumb'].'?s='.$is_catch.'" alt="'.$image['name'].'" title="'.$image['name'].'" /></a>';						$imgname = explode('.', $image['name']);						$imgname = $imgname[0];						$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" /><a>'.$image['name'].'</a><br /><a onclick="edit(\''.$image['path'].'\',\''.$type.'\',\''.$image['name'].'\')">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="delp(\''.$image['path'].'\',\''.$type.'\');">删除</a></label>';					}										/*$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" /><a>'.$image['name'].'</a><br /><a onclick="edit(\''.$image['path'].'\',\''.$type.'\')">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="delp(\''.$image['path'].'\',\''.$type.'\');">删除</a></label>';*/				}				$str .= '</div>';			}		}		$data['status'] = 1;		if($directory){			$dirarr = array_filter(explode('/', $directory));			array_pop($dirarr);			$dir = implode('/', $dirarr);			if($dnum >= 0){				$data['parentdir'] = $dir.'/';			}else{				$data['parentdir'] = '';			}		}else{			$data['parentdir'] = '';		}				$data['curdir'] = $directory;		$data['str'] = $str?$str:'';		$data['type'] = $type;		$data['p'] = $p;		$data['page'] = $datac['page'];		$this->ajaxReturn($data);	}	//编辑器 上传多图 -在线管理	function getxon3(){		$directory = I('directory');		$type = I('type');		$py = I('p');		$p = $py?$py:1;		$w = I('ws')?I('ws'):0;			if ($this->checkPath($directory, './.')) {   		 exit;		}				$datac = $this->getpiclist($directory,$p,$type,$w);		$images = $datac['images'];				if($images){			$str = '<div class="row">';			foreach ($images as $k=>$image) {				if($k%4 == 0){					$maln = "maln";				}else{					$maln='';				}				$str .= '<div class="col-sm-3 col-xs-6 text-center '.$maln.'">';				if ($image['type'] == 'directory') {					$str .= '<div class="text-center"><a onClick="cin(\''.$image['directory'].'\',\''.$type.'\')" class="directory" style="vertical-align: middle;"><i class="fa fa-folder fa-5x"></i></a></div>';					if($w){						$str .= '<label>'.$image['name'].'</label>';					}else{						$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" />'.$image['name'].'</label>';					}														}				if ($image['type'] == 'image') {										if($w){						$str .= '<li class=""><img width="113" src="'.$image['thumb'].'?noCache=jeny0hpi" _src="'.$image['thumb'].'" height="113" style="margin-left: 0px;" title="'.$image['name'].'">'.$image['name'].'<span class="icon"></span></li>';					}else{						$is_catch = rand(0,9999);						$str .= '<a href="javascript:;" class="get"><img src="'.$image['thumb'].'?s='.$is_catch.'" alt="'.$image['name'].'" title="'.$image['name'].'" /></a>';						$imgname = explode('.', $image['name']);						$imgname = $imgname[0];						$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" /><a>'.$image['name'].'</a><br /><a onclick="edit(\''.$image['path'].'\',\''.$type.'\',\''.$image['name'].'\')">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="delp(\''.$image['path'].'\',\''.$type.'\');">删除</a></label>';					}										/*$str .= '<label><input type="checkbox" name="path[]" value="'.$image['path'].'" /><a>'.$image['name'].'</a><br /><a onclick="edit(\''.$image['path'].'\',\''.$type.'\')">编辑</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="delp(\''.$image['path'].'\',\''.$type.'\');">删除</a></label>';*/				}				$str .= '</div>';			}		}		$data['status'] = 1;		if($directory){			$dirarr = array_filter(explode('/', $directory));			array_pop($dirarr);			$dir = implode('/', $dirarr);			if($dnum >= 0){				$data['parentdir'] = $dir.'/';			}else{				$data['parentdir'] = '';			}		}else{			$data['parentdir'] = '';		}				$data['curdir'] = $directory;		$data['str'] = $str?$str:'';		$data['type'] = $type;		$data['p'] = $p;		$data['page'] = $datac['page'];		$this->ajaxReturn($data);	} 	//图片列表	function getpiclist($directory='/',$nowPage=0,$type=1,$w='0'){		$nowPage = $nowPage?$nowPage:1;		$directory2=$directory?$directory:'/';		$dirf = $this->tdir[$type];		if($directory=='/')$directory='';		$directories = glob($dirf.$directory. '*', GLOB_ONLYDIR);		if (!$directories) {			$directories = array();		}		// Get files		$files = glob($dirf.$directory. '*.{jpg,jpeg,png,gif,JPG,JPEG,PNG,GIF}', GLOB_BRACE);		if (!$files) {			$files = array();		}		$images = array_merge($directories, $files);		$count = count($images);		if($w){			$pnum=8;		}else{			$pnum=20;		}		if($pnum<$count)$images = array_splice($images, ($nowPage - 1) * $pnum, $pnum);				foreach ($images as $image) {			$name = str_split(basename($image), 14);			if (is_dir($image)) {				$dir = $directory.implode('', $name).'/';				$data['images'][] = array(					'thumb' => '',					'name'  => implode('', $name),					'type'  => 'directory',					'path'  => $directory2.implode('', $name),					'directory'  => $dir,					'href'  => U('Admin/Ad/picbanners',array('directory'=>$dir))				);			} elseif (is_file($image)) {				$dirlook = $this->tdirlook[$type];				$dir55 = $this->tdir[$type];				$data['images'][] = array(					'thumb' => $dirlook.$directory.implode('', $name),					'name'  => implode('', $name),					'type'  => 'image',					'path'  => $directory2.implode('', $name),					'href'  => '',					'mtime'=> md5_file($dir55.$directory.implode('', $name))				);			}		}		$rollPage = $pnum;//每页个数		$totalPages = ceil($count/$rollPage);//总页数				$now_cool_page      = $rollPage/2;		$now_cool_page_ceil = ceil($now_cool_page);		//上一页        $up_row  = $nowPage - 1;        $up_page = $up_row > 0 ? '<a class="prev" onClick="cin2(\''.$up_row.'\',\''.$directory.'\',\'' . $type . '\')"> << </a>' : '';        //下一页        $down_row  = $nowPage + 1;        $down_page = ($down_row <= $totalPages) ? '<a class="next" onClick="cin2(\'' . $down_row . '\',\''.$directory.'\',\'' . $type . '\')" > >> </a>' : '';        //第一页        $the_first = '';        if($totalPages > $rollPage && ($nowPage - $now_cool_page) >= 1){            $the_first = '<a class="first" onClick="cin2(\'1\',\''.$directory.'\',\'' . $type . '\')" >首页</a>';        }        //最后一页        $the_end = '';        if($totalPages > $rollPage && ($nowPage + $now_cool_page) < $totalPages){            $the_end = '<a class="end" onClick="cin2(\''.$totalPages.'\',\''.$directory.'\',\'' . $type . '\')" >尾页</a>';        }		for($i = 1; $i <= $rollPage; $i++){			if(($nowPage - $now_cool_page) <= 0 ){				$page = $i;			}elseif(($nowPage + $now_cool_page - 1) >= $totalPages){				$page = $totalPages - $rollPage + $i;			}else{				$page = $nowPage - $now_cool_page_ceil + $i;			}            if($page > 0 && $page != $nowPage){                if($page <= $totalPages){                    $link_page .= '<a class="num" onClick="cin2(\'' . $page . '\',\''.$directory.'\',\'' . $type . '\')">' . $page . '</a>';                }else{                    break;                }            }else{                if($page > 0 && $totalPages != 1 && $totalPages>0){                    $link_page .= '<span class="current">' . $page . '</span>';                }            }		}		//替换分页内容		$theme = array(		        'header' => '<span class="rows">共 %TOTAL_ROW% 条记录</span>',		        'prev'   => '<<',		        'next'   => '>>',		        'first'  => '1...',		        'last'   => '...%TOTAL_PAGE%',		        'theme'  => '%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%',		        );        $page_str = str_replace(            array('%HEADER%', '%NOW_PAGE%', '%UP_PAGE%', '%DOWN_PAGE%', '%FIRST%', '%LINK_PAGE%', '%END%', '%TOTAL_ROW%', '%TOTAL_PAGE%'),            array($count, $nowPage, $up_page, $down_page, $the_first, $link_page, $the_end, $totalRows, $totalPages),$theme);        $data['page'] = $page_str['theme'];        		return $data;	}	function upload(){		$post = I('post.');		$type = I('type');		if($post['directory']){			$directory = $post['directory'];		}else{			$directory = '';		}		$site_options = get_site_options();	    $uploadfilesize = $site_options['uploadimgsize']?$site_options['uploadimgsize']*1024:2097152;//默认2m,单位b	    $filetype = array('jpg','jpeg','png','gif','JPG','JPEG','PNG','GIF','bmp');	    $dir = $this->tdir[$type];		if($type == 1){			$config=array(            		'rootPath' => './'.C("UPLOADPATH"),            		'savePath' => $directory,            		'maxSize' => $uploadfilesize,    //大小限制            		'saveName'   =>    array('uniqid',''),            		'exts'       =>    str_replace("|", ",", $filetype),            		'autoSub'    =>    false,            		'imgname'    => $post['imgname']            );            /*if($post['ptype'] == 1){				if(file_exists($dir)) unlink($dir.$post['oldpath']);			}*/			$upload = new \Think\Upload($config);			$info=$upload->upload();		}else{			/*$dir = $this->tdir[$type];			$config=array(            		'rootPath' => './themes/simplebootx/picbanners/',            		'savePath' => $directory,            		'maxSize' => $uploadfilesize,    //大小限制            		'saveName'   =>    array('getSaveName',$post['imgname']),            		'exts'       =>    str_replace("|", ",", $filetype),            		'autoSub'    =>    false,            );			$upload = new \Think\Upload($config);			if($_FILES['file']['size'] > $config->maxSize){				$data['status'] = 0;				$data['msg'] = '上传文件大小超过设定值';				$this->ajaxReturn($data);			}			$info=$upload->uploadOne2($_FILES['file']);*/			/*if($post['ptype'] == 1){				if(file_exists($dir)) unlink($dir.$post['oldpath']);			}*/			$upload = new \Think\Upload();			$upload->maxSize = $uploadfilesize;  //单位B			$upload->exts = $filetype;			$upload->subName = '';			$upload->rootPath = $dir.$directory;			$upload->savePath = '';			$upload->imgname = $post['imgname'];			if($_FILES['file']['size'] > $upload->maxSize){				$data['status'] = 0;				$data['msg'] = '上传文件大小超过设定值';				$this->ajaxReturn($data);			}			$info = $upload->uploadOne2($_FILES['file']);		}		if(!$info){			$data['status'] = 0;			$data['msg'] = '上传失败';		}else{			$data['status'] = 1;			$data['msg'] = '上传成功';		}				$this->ajaxReturn($data);	}	function sysupload($directory,$uploadfilesize,$filetype){		$config=array(            		'rootPath' => './'.C("UPLOADPATH"),            		'savePath' => $directory,            		'maxSize' => $uploadfilesize,    //大小限制            		'saveName'   =>    array('uniqid',''),            		'exts'       =>    str_replace("|", ",", $filetype),            		'autoSub'    =>    false,            );		$upload = new \Think\Upload($config);		$info=$upload->upload();		if($info){			return true;		}else{			return false;		}	}	function folder(){		$post = I('post.');		$directory = $post['directory']?$post['directory']:'';		$folder = $post['folder']?$post['folder']:'';		if(!$folder){			$data['status']=0;			$data['msg']='请填写文件夹名称';			$this->ajaxReturn($data);		}		$dirsq = $this->tdir[$post['type']];		$dir = $dirsq.$directory.$folder;		if(is_dir($dir)){			$data['status']=0;			$data['msg']='此文件夹已存在';			$this->ajaxReturn($data);		}		$m = mkdir($dir,0777,true);		if($m){			$data['status']=1;			$data['msg']='添加成功';		}else{			$data['status']=0;			$data['msg']='添加失败';		} $this->ajaxReturn($data);			}	function delimg(){		$post = I('post.');		if(!$post['path']){			$data['status'] = 0;			$data['msg'] = '请指定删除文件';			$this->ajaxReturn($data);		}		if(!$post['type']){			$data['status'] = 0;			$data['msg'] = '参数错误.';			$this->ajaxReturn($data);		}		$dirl = $this->tdir[$post['type']];		$s='0';		$e='0';		$paths = array_filter(explode(',', $post['path']));		foreach ($paths as $k => $val) {			$arr = count(array_filter(explode('/', $val)));			if($arr <= 1){				$count=strpos($val,'/');				$str = substr_replace($val,"",$count,1);				$dir = $dirl.$str;			}else{				$dir = $dirl.$val;			}						$a = recursiveDelete($dir);					}		$data['status'] = 1;		$data['msg'] = '删除成功';		$this->ajaxReturn($data);	}	function delp(){		$path =I('path');		$type = I('type');		$directory = $post['directory']?$post['directory']:'';		if(!$path){			$data['status'] = 0;			$this->ajaxReturn($data);		}		$dir = $this->tdir[$type].$directory.$path;		if(file_exists($dir)){			unlink($dir);			$data['status'] = 1;		}else{			$data['status'] = 0;		}		$this->ajaxReturn($data);	}	public function checkPath($str, $find)	{	    $find_str = $find;	    $tmparray = explode($find_str, $str);	    if (count($tmparray) > 1) {	        return true;	    } else {	        return false;	    }	}	}