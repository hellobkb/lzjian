<?php

/**
 * 附件上传
 */
namespace Asset\Controller;
use Common\Controller\AdminbaseController;
class AssetController extends AdminbaseController {


    function _initialize() {
    	$adminid=sp_get_current_admin_id();
    	$userid=sp_get_current_userid();
    	if(empty($adminid) && empty($userid)){
    		exit("非法上传！");
    	}
    }

    /**
     * swfupload 上传 
     */
    public function swfupload() {
        $args = I('get.args');
        $catid = I('catid','0','int');
        $is_warter = I('get.is_warter');
        $catInfo = getCategory($catid);
        $rel_args = explode(',', $args);
        if (IS_POST) {
            $site_options = get_site_options();
            //设置栏目 是否添加水印
            $iswatercate = 0;
            if($site_options['catids']){
                $op_catids = explode(',', $site_options['catids']);
                foreach ($op_catids as $key => $val) {
                    $op_catInfo = getCategory($val);
                    $op_arrchildid = explode(',', $op_catInfo['arrchildid']);
                    if(in_array($catid,$op_arrchildid)){
                        $iswatercate = 1;
                        break;
                    }
                }
            }
        	$maxSize = I("post.file_size");
        	$filetype = I("post.filetype_post");
			$savepath=date('Ymd').'/';
            //上传处理类
            $config=array(
            		'rootPath' => './'.C("UPLOADPATH"),
            		'savePath' => $savepath,
            		'maxSize' => $maxSize * 1024,    //大小限制
            		'saveName'   =>    array('uniqid',''),
            		'exts'       =>    str_replace("|", ",", $filetype),
            		'autoSub'    =>    false,
            );
			$upload = new \Think\Upload($config);
			$info=$upload->upload();
            //开始上传
            if ($info) {
                //上传成功
                //写入附件数据库信息
                $first=array_shift($info);
                if(!empty($first['url'])){
                	$url=$first['url'];
                }else{
                	$url=C("TMPL_PARSE_STRING.__UPLOAD__").$savepath.$first['savename'];
                }

                /*
                    zckop添加水印
                */
                
                $is_warter = I('post.is_warter');
                if($is_warter == 1){
                    $url = $site_options['site_host'].$url;
                    echo "1," . $url .","."1,".$first['name'];
                }else{
                    if(in_array($first['ext'],array("jpg","jpeg","png","bmp","gif"))){
                        $waterfile = str_replace('upload','watermark',$url);
                        $waterdir = dirname($waterfile);
                        if(!is_dir($waterdir)){
                            mkdir($waterdir);
                        }
                        copy($url, $waterfile);
                        $url = $waterfile;
                        if($site_options['ftppasv'] && in_array($first["ext"],array("jpg","jpeg","png","bmp","gif")) && $iswatercate==1){
                            $smeta = json_decode($site_options['smeta'],true);
                            $image = new \Think\Image();
                            $water = stristr($smeta['thumb'],'data');
                            $image->open($url)->water($water,$site_options['site_water_weiz'],$site_options['site_water_qxd'])->save($url);
                        }
                    }
                    $url = $site_options['site_host'].$url;
                    if(in_array($first['ext'], array("jpg","jpeg","png","bmp","gif"))){
                        echo "1," . $url .","."1,".$first['name'];
                    }else{
                        echo "1," . $url .",".$first["ext"].",".$first['name'];
                    }

                }
                
               
				exit;
            } else {
                //上传失败，返回错误
                exit("0," . $upload->getError());
            }
        } else {
            $this->assign('catInfo',$catInfo);
            $this->assign('limit_num',$rel_args);
            $this->assign('is_warter',$is_warter?$is_warter:0);
            $this->display(':swfupload');
        }
    }


    /**
     * swfupload 上传 
     */
    public function swfupload2() {
        $args = I('get.args');
        $catid = I('catid','0','int');
        $catInfo = getCategory($catid);
        $rel_args = explode(',', $args);
        if (IS_POST) {
            $site_options = get_site_options();
            //设置栏目 是否添加水印
            $iswatercate = 0;
            if($site_options['catids']){
                $op_catids = explode(',', $site_options['catids']);
                foreach ($op_catids as $key => $val) {
                    $op_catInfo = getCategory($val);
                    $op_arrchildid = explode(',', $op_catInfo['arrchildid']);
                    if(in_array($catid,$op_arrchildid)){
                        $iswatercate = 1;
                        break;
                    }
                }
            }
            $maxSize = I("post.file_size");
            $filetype = I("post.filetype_post");
            $savepath='';
            //上传处理类
            $config=array(
                    'rootPath' => './',
                    'savePath' => $savepath,
                    'maxSize' => $maxSize * 1024,    //大小限制
                    'saveName'   =>    array('uniqid',''),
                    'exts'       =>    str_replace("|", ",", $filetype),
                    'autoSub'    =>    false,
            );
            $upload = new \Think\Upload($config);
            $info=$upload->upload2();
            //开始上传
            if ($info) {
                //上传成功
                //写入附件数据库信息
                $first=array_shift($info);
                if(!empty($first['url'])){
                    $url=$first['url'];
                }else{
                    $url='./'.$first['savename'];
                }

                /*
                    zckop添加水印
                */
                
                if(in_array($first['ext'],array("jpg","jpeg","png","bmp","gif"))){
                    $waterfile = str_replace('upload','watermark',$url);
                    $waterdir = dirname($waterfile);
                    if(!is_dir($waterdir)){
                        mkdir($waterdir);
                    }
                    copy($url, $waterfile);
                    $url = $waterfile;
                    if($site_options['ftppasv'] && in_array($first["ext"],array("jpg","jpeg","png","bmp","gif")) && $iswatercate==1){
                        $smeta = json_decode($site_options['smeta'],true);
                        $image = new \Think\Image();
                        $water = stristr($smeta['thumb'],'data');
                        $image->open($url)->water($water,$site_options['site_water_weiz'],$site_options['site_water_qxd'])->save($url);
                    }
                }
                $url = $site_options['site_host'] . $url;
               
                if(in_array($first['ext'], array("jpg","jpeg","png","bmp","gif"))){
                    echo "1," . $url .","."1,".$first['name'];
                }else{
                    echo "1," . $url .",".$first["ext"].",".$first['name'];
                }
                exit;
            } else {
                //上传失败，返回错误
                exit("0," . $upload->getError());
            }
        } else {
            $this->assign('catInfo',$catInfo);
            $this->assign('limit_num',$rel_args);
            $this->display(':swfupload2');
        }
    }
    //图片管理（替换）
    public function swfupload1() {
        $args = I('get.args');
        $catid = I('get.catid');
        $catInfo = getCategory($catid);
        $rel_args = explode(',', $args);
        if (IS_POST) {
            $site_options = get_site_options();
            $maxSize = I("post.file_size");
            $filetype = I("post.filetype_post");
            
            //$savepath=date('Ymd').'/';
            $savepath='';
            //上传处理类
            $config=array(
                    'rootPath' => './'.C("UPLOADPATHADS"),
                    'savePath' => $savepath,
                    'maxSize' => $maxSize * 1024,    //大小限制，单位B 
                    'saveName'   =>    array('uniqid',''),
                    'exts'       =>    str_replace("|", ",", $filetype),
                    'autoSub'    =>    false,
            );
            $upload = new \Think\Upload($config);
            $info=$upload->upload_s1();
            //开始上传
            if ($info) {
                //上传成功
                //写入附件数据库信息
                $first=array_shift($info);
                if(!empty($first['url'])){
                    $url=$first['url'];
                }else{
                    //$url=C("TMPL_PARSE_STRING.__UPLOAD__").$savepath.$first['savename'];
                    $url=C("TMPL_PARSE_STRING.__UPLOADADS__").$savepath.$first['name'];
                }
                echo "1," . $url.","."1,".$first['name'];
                exit;
            } else {
                //上传失败，返回错误
                exit("0," . $upload->getError());
            }
        } else {
            $this->assign('catInfo',$catInfo);
            $this->assign('limit_num',$rel_args);
            $this->display(':swfupload1');
        }
    }
    // zckop添加图库
    function public_album_load(){
        if (IS_POST) {
            $this->redirect('public_album_load', $_POST);
        }


        $size = isset($_GET['size']) ? htmlspecialchars($_GET['size']) : $listSize;
        $start = isset($_GET['start']) ? htmlspecialchars($_GET['start']) : 0;
        $end = $start + $size;



        $paths = array(SITE_PATH.'data/upload');

        $files = array();
        foreach ( $paths as $path){
            $tmp = $this->_ueditor_getfiles( $path );
            if($tmp){
                $files = array_merge($files,$tmp);
            }
        }

        $page = $this->page(count($files), 10);
        $data = array_slice($files,$page->firstRow,$page->listRows);
        $this->assign("Page", $page->show());
        $this->assign("data", $data);
        $this->assign("config_site", get_site_options());
       
        $this->display(':public_album_load');


    }

    /*
    zckop增加图片浏览
    */
    private function _ueditor_getfiles($path , &$files = array()){
        if ( !is_dir( $path ) ) return null;
        $handle = opendir( $path );
        while ( false !== ( $file = readdir( $handle ) ) ) {
            if ( $file != '.' && $file != '..' ) {
                $path2 = $path . '/' . $file;
                if ( is_dir( $path2 ) ) {
                    $this->_ueditor_getfiles( $path2 , $files );
                } else {
                    if ( preg_match( "/\.(gif|jpeg|jpg|png|bmp)$/i" , $file ) ) {
                        $files[] = array(
                        'url'=> substr($path2, strlen($_SERVER['DOCUMENT_ROOT'])),
                        'mtime'=> filemtime($path2)
                    );
                    }
                }
            }
        }
        return $files;
    }






}
