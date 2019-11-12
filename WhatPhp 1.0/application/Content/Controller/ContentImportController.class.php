<?php

// +----------------------------------------------------------------------
// | thinkcmf 内容管理
// +----------------------------------------------------------------------
// | Copyright (c) thinkcmf
// +----------------------------------------------------------------------
// | Author: sd <995251229@qq.com>
// +----------------------------------------------------------------------

namespace Content\Controller;

use Common\Controller\AdminbaseController;

class ContentImportController extends AdminbaseController
{

    function _initialize()
    {
        parent::_initialize();
        $this->iconvfunc = new \Common\Lib\iconvfunc(); 
        $this->modelid = 5; //产品模型
    }

    /**
     *  批量导入产品页
     */
    public function index()
    {   
        $this->display();
    }

    /**
     *  批量导入产品 提交
     */
    public function import()
    {
        if (IS_POST) {
            $post = I('post.');
            $info_img = $this->uploadFile($_FILES['images_file'], array('zip'),20971520);
            $info_content = $this->uploadFile($_FILES['content_file'], array('xls','xlsx'),20971520);

            if ($info_img['status'] == 0) {
                $this->error($info_img['msg']);
            }
            if ($info_content['status'] == 0) {
                $this->error($info_content['msg']);
            }
            $img_url = $info_img['url'];
            $content_url = $info_content['url'];

            $dir = './data/img_bucket/';
            $this->calearRmdir($dir);
            $this->unzip($img_url, $dir); //解压静态文件到指定目录
            $data = $this->importExcel($content_url, $info_content['ext']);
            
        }
    }

    /*
     * 读取excel, 插入数据
     **/

    private function importExcel($filename, $ext)
    {

        import("Org.PHPExcel.PHPExcel#php",'','');
        $phpexcel = new \PHPExcel();
        if ($ext =="xls") {
            import("Org.PHPExcel.PHPExcel.Reader.Excel5#php");
            $phpreader = new \PHPExcel_Reader_Excel5();
        } elseif ($ext =='xlsx') {
            import("Org.PHPExcel.PHPExcel.Reader.Excel2007#php");
            $phpreader = new \PHPExcel_Reader_Excel2007();
        }

        $phpexcel = $phpreader->load($filename);

        //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet=$phpexcel->getSheet(0);
        //获取总列数
        $allColumn=$currentSheet->getHighestColumn();
        //获取总行数
        $allRow=$currentSheet->getHighestRow();

        //循环插入数据
        $column = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
                        "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
                        "W", "X", "Y", "Z");
        if (!in_array($allColumn, $column)) {
            $this->error('最大限制不能超过26列...');
        }
        $trans = array_flip($column);
        $key = $trans[$allColumn];
        $allColumn = $column[$key+1];
        $data = array();
        for ($x='A'; $x!=$allColumn; $x++) { //按列读取
                for ($i=2; $i<=$allRow; $i++) {
                    $data[$x][] = $currentSheet->getCell($x . $i)->getValue();
                }
        }
        $data_count = $allRow-2;
        foreach ($data as $k=>$v) {
            $fields[] = $v[0];
            $final_fields[$v[0]] = $v;
        }
        if (!in_array('catid', $fields) || !in_array('title', $fields) || !in_array('thumb', $fields)) {
            $this->error('请按要求，设置导入数据内容,必须存在字段：catid, title, thumb');
        }
        
        $error_field = array();

        foreach ($final_fields as $k=>$v) {
            for ($a=1; $a<=$data_count; $a++) {
                if(!empty($k)){
                    $ftype = $this->getFieldType($this->modelid, $k);  //产品表字段类型
                    
                    //允许字段类型 title seourl text textarea image  images(用英文逗号,隔开) editor(图片用 {aa.jpg} )
                    if($ftype){
                        $catid = $final_fields['catid'][$a];
                        if ($ftype == 'image') {  // image  缩略图
                            $v[$a] = $this->manage_img($v[$a], $catid);
                        } elseif ($ftype == 'images') {  //多图
                            $v[$a] = $this->manage_imgs($v[$a], $catid);
                        }  elseif ($ftype == 'editor') {  //编辑器
                            $v[$a] = $this->manage_editor_img($v[$a], $catid);
                        }

                    }else{
                        $error_field[] = $k; //不存在的字段
                    }
                    $con[$a][$k] = (string)$v[$a];
                }
                
            }
        }
        if(!empty($error_field)){
            $error_info = implode(', ', $error_field);
            $this->error('导入失败，不存在字段：'.$error_info);
        }
        
        $error_check = 0;//title重复、seourl重复、栏目不存在 、只能导入产品模型 个数
        $success = 0; //成功个数
        foreach ($con as $k=>$val) {
            //栏目id, 名称， 主图 为必填项
            if (is_numeric($val['catid']) && !empty($val['title'])  && !empty($val['thumb'])) {
               $check_title = $this->check_title($val['catid'], $val['title'], $val['seourl']);
               if ($check_title) {
                    $rel = $this->add_content($val, $val['catid'], $val['seourl']);
                    if ($rel) {
                        $success++; //添加成功
                    } 
                    
               } else {
                    $error_check++; //查重个数
               }
                
            }
        }
        $errorstr = '';
        $errornum = $error_check;
        if($errornum){
            $errorstr = ' 失败：'.$errornum.'个';
        }
        $this->success('导入成功：'.$success.'个;'.$errorstr);
    }

    /**
     *  添加
     */
    private function add_content($data, $catid, $seourl)
    {
        if (!$catid) {
            return false;
        }
        $data['status'] = 99;
        $data['isdelay'] = 0;
        $cons = new \Content\Lib\Content();
        $id = $cons->data($data)->add();
        //不填写seourl,id作为seourl
        if (empty($seourl)) {
            $catInfo = getCategory($catid);
            $model_name = getModel($catInfo['modelid'], 'tablename');
            $seourl = $this->seourl($data['title'], $seourl);
            $seourl = $seourl?$seourl:$id;
            M($model_name)->where(array('id'=>$id))->save(array("seourl"=>$seourl));
        }
        return true;
    }

     /**
     *  产品名称 生成seourl
     */
    private function seourl($title, $seourl)
    {
        if (empty($title)) {
            return false;
        }
        if (empty($seourl)) {
            $title = $this->iconvfunc->gbk_to_pinyin(iconv("utf-8","gbk",$title));
            $title = preg_replace("/[\s@#%&*\/]+/"," " ,strtolower(implode("",$title)));
            $title = trim($title);
            $title = str_replace(" ","-",$title);
            $str = trim($title);
            $str = str_replace('　', ' ', $str); //替换全角空格为半角
            $str = preg_replace("/\s+/",' ',$str); 
            $str = str_replace(' ', '-', $str); //替换连续的空格为一个
            $str = strtolower($str);
            $seourl = $str;
            return $seourl;
        } else {
            return false;
        }
    }

    /**
     *  产品名称 查重
     */
    private function check_title($catid, $title, $seourl)
    {
        if (empty($title)) {
            return false;
        }
        if (empty($seourl)) {
            $seourl = $this->seourl($title, $seourl);
        }
        
        if ($seourl) {
            $map['title'] = $title;
            $map['seourl'] = $seourl;
            $map['_logic'] = 'OR';
            $where['_complex'] = $map;
        } else {
            $where['title'] = $title;
        }
        $catInfo = getCategory($catid);
        if ($catInfo) {
            $model_name = getModel($catInfo['modelid'], 'tablename');
            $model_name = M($model_name);
            if ($catInfo['modelid'] != $this->modelid) {
                return false; //只能导入产品
            }
            $count = $model_name->where($where)->count();
            if ($count) {
                return false; //title 重复
            } else {
                return true; //title 不重复
            }
        } else {
            return false; // 栏目不存在
        }

    }

    /**
     *  编辑器 图片处理
        $content = "hello,[img]ff.jpg[/img] reanod welcome you [img]cc.jpg[/img] ";
     */
    private function manage_editor_img($content, $catid)
    {
        if (empty($content)) {
            return false;
        }
        $pattern = '/\[img\].*?\[\/img\]/is';
        preg_match_all($pattern,$content,$rel);
        if (!empty($rel[0])) {
            foreach ($rel[0] as $key => $val) {
                $img_str = str_replace('[img]','',$val);
                $img_str = str_replace('[/img]','',$img_str);
                $imgurl = $this->manage_img($img_str, $catid);
                $content = str_replace('[img]'.$img_str.'[/img]','<img src="'.$imgurl.'">',$content);
            }
            return $content;
        } else {
            return $content;   
        }
         
    }

     /**
     *  多张 图片处理 
     */
    private function manage_imgs($imgs, $catid)
    {
        if (empty($imgs)) {
            return false;
        }
        $arr_imgs = explode(',', $imgs);
        $i = 0;
        $arr = array();
        foreach ($arr_imgs as $key => $val) {
            $imgurl = $this->manage_img($val, $catid);
            if ($imgurl) {
                $arr[$key]['url'] = $imgurl;
                $arr[$key]['alt'] = '';
                $arr[$key]['seq'] = $i;
                $i++;
            }
        }
        if (!empty($arr)) {
            $images = json_encode($arr);
            return $images;
        } else {
            return false;
        }
    }

    /**
     *  单张 图片处理 
     */
    private function manage_img($img, $catid)
    {
        if (empty($img)) {
            return false;
        }
        
        $img = (string)$img;
        $url = './data/img_bucket/'.$img;
        $dir = C("TMPL_PARSE_STRING.__UPLOAD__").date("Ymd");
        $is = file_exists($dir);
        if (!$is) {
            mkdir($dir,0777,true);
        }
        $waterfile = str_replace('upload','watermark',$dir);
        $is_waterfile = file_exists($waterfile);
        if (!$is_waterfile) {
            mkdir($waterfile,0777,true);
        }

        $img_exists = file_exists($url);
        $to_img_exists = file_exists($dir.'/'.strtolower($img));
        if ($img_exists) {
            copy($url, './'.$dir.'/'.strtolower($img));
            copy($url, './'.$waterfile.'/'.strtolower($img));
        } else {
            return false; //上传压缩包文件中 图片不存在
        }
        $site_options = get_site_options();
        //设置栏目 是否添加水印
        $iswatercate = 0;
        if ($site_options['catids']) {
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
        
        $ext = substr($img, strrpos($img, '.')+1);
        if ($site_options['ftppasv'] && in_array($ext,array("jpg","jpeg","png","bmp")) && $iswatercate==1) {
            $waterfile = $waterfile.'/'.strtolower($img);
            $smeta = json_decode($site_options['smeta'],true);
            $image = new \Think\Image();
            $water = stristr($smeta['thumb'],'data');
            $image->open($waterfile)->water($water,$site_options['site_water_weiz'],$site_options['site_water_qxd'])->save($waterfile);
            $imgurl = $site_options['site_host'].$waterfile;
            return $imgurl;
        } else {
            //copy($url, './'.$waterfile.'/'.strtolower($img));
            $imgurl = $site_options['site_host'].$waterfile.'/'.strtolower($img);
            return $imgurl;
        }

    }



    /**
     *  字段类型 
     */
    private function getFieldType($modelid, $field)
    {
        if(!$modelid || !$field)return false;
        $info = M('ModelField')->where(array('modelid'=>5,'field'=>$field))->find();
        if (!$info) {
            return false;
        }
        return $info['formtype'];
    }

    /**
     *  上传附件
     */
    private function uploadFile($files, $exts, $size)
    {
        if (!$size) {
            $size = 20971520;  //20M
        }
        $upload = new \Think\Upload();
        $upload->maxSize = $size;
        $upload->exts = $exts;
        $upload->subName = date("Ymd", time());
        $upload->rootPath = "./data/upload/";

        if (empty($_FILES['images_file'])) {
            $data['status'] = 0;
            $data['msg'] = '请上传图片压缩包';
            return $data;
        }

        if (empty($_FILES['content_file'])) {
            $data['status'] = 0;
            $data['msg'] = '请上传文件';
            return $data;
        }

        $info = $upload->uploadOne($files);
        if ($info) {
            $url = './data/upload/'.$info['savepath'].$info['savename'];
            $data['status'] = 1;
            $data['msg'] = '';
            $data['url'] = $url;
            $data['ext'] = $info['ext'];
            return $data;
        } else {
            $data['status'] = 0;
            $data['msg'] = $upload->getError();
            return $data;
        }
    }

    /**
     * 解压文件到指定目录
     *
     * @param  string  zip压缩文件的路径
     * @param  string  解压文件的目的路径
     * @param  boolean 是否以压缩文件的名字创建目标文件夹
     * @param  boolean 是否重写已经存在的文件
     * @return boolean 返回成功 或失败
     */
    private function unzip($src_file, $dest_dir=false, $create_zip_name_dir=false, $overwrite=true)
    {
        header("content-type:text/html;charset=utf8");
        if ($zip = zip_open($src_file)) {
            if ($zip) {
                $splitter = ($create_zip_name_dir === true) ? "." : "/";
                if ($dest_dir === false) {
                    $dest_dir = substr($src_file, 0, strrpos($src_file, $splitter))."/";
                }
                // 如果不存在 创建目标解压目录
                $this->createDirs($dest_dir);
                // 对每个文件进行解压
                while ($zip_entry = zip_read($zip)) {
                    // 文件不在根目录
                    $pos_last_slash = strrpos(zip_entry_name($zip_entry), "/");
                    if ($pos_last_slash !== false) {
                        // 创建目录 在末尾带 /
                        $this->createDirs($dest_dir.substr(zip_entry_name($zip_entry), 0, $pos_last_slash+1));
                    }
                    // 打开包
                    if (zip_entry_open($zip, $zip_entry, "r")) {
                        // 文件名保存在磁盘上
                        $file_name = $dest_dir.zip_entry_name($zip_entry);
                        // 检查文件是否需要重写
                        if ($overwrite === true || $overwrite === false && !is_file($file_name)) {
                            // 读取压缩文件的内容
                            $fstream = zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));
                            @file_put_contents($file_name, $fstream);
                            // 设置权限
                            chmod($file_name, 0777);
                            //echo "save: ".$file_name."<br />";
                        }
                        // 关闭入口
                        zip_entry_close($zip_entry);
                    }
                }
                // 关闭压缩包
                zip_close($zip);
            }
        } else {
            return false;
        }
        return true;
    }

    /**
     * 创建目录
     */
    private function createDirs($path)
    {
        if (!is_dir($path)) {
            $directory_path = "";
            $directories = explode("/", $path);
            array_pop($directories);
            foreach ($directories as $directory) {
                $directory_path .= $directory."/";
                if (!is_dir($directory_path)) {
                    mkdir($directory_path);
                    chmod($directory_path, 0777);
                }
            }
        }
    }

    /**
     * 清空/删除 文件夹
     * @param string $dirname 文件夹路径
     * @param bool $self 是否删除当前文件夹
     * @return bool
     */
    private function calearRmdir($dirname, $self = true)
    {
        if (!file_exists($dirname)) {
            return false;
        }
        if (is_file($dirname) || is_link($dirname)) {
            return unlink($dirname);
        }
        $dir = dir($dirname);
        if ($dir) {
            while (false !== $entry = $dir->read()) {
                if ($entry == '.' || $entry == '..') {
                    continue;
                }
                $this->calearRmdir($dirname . '/' . $entry);
            }
        }
        $dir->close();
        $self && rmdir($dirname);
        return true;
    }

}
