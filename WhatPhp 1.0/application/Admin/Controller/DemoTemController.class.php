<?php


/* 
 * 
 *  调用模板
 *  @author cx
 *  @time 20160801
 *  
 *  */


namespace Admin\Controller;

use Common\Controller\AdminbaseController;
 
class DemoTemController extends AdminbaseController {
	
	
	
	public function index(){
		 
		//要远程链接数据库得到所有的已有模板 , 缓存
		
		
		//curl 带上key 得到所有的模板
		
		$url = "http://192.168.0.209/demo/demotemp/showdata.php";
		$post_data = array("key"=>"1121212");
		$ch = curl_init();
		
		curl_setopt($ch);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		
		$output = curl_exec($ch);
		
		curl_close($ch);
		
		$output_arr = json_decode($output, true);
		
		if($output !=2){
			$template = $output_arr;
		}

		foreach($template as $key=>$value){
			
			$template[$key]['banner'] = base64_decode($value['url']).$value['id']."/banner.jpg"; 
		}
		//查找已经安装的所有的模板
		$dir= opendir(C("SP_TMPL_PATH"));
		  
		$filename = array();
		while(($file = readdir($dir))!==false){
			 $filename[] = $file;
		}
		  
		$this->assign("filename",$filename); 
		$this->assign("template", $template);
		$this->display();
	}
	
	
	/* 
	 * 添加模板到现有项目中
	 *  
	 *  */
	
	public function addTemplate(){
		 $dir = I('post.dir');
		 $id = I('post.id',0,'int');
		 //得到模板的路径， 根据路径得到文件夹，复制到本项目中
		 $dir = base64_decode($dir);
		 
		 //下载url
		 $url = $dir.$id."/template.rar";
		 //保存文件的路径
	 	 $dst = C("SP_TMPL_PATH")."simplebootx_".$id;
	 	  
	 	 if(!file_exists($dst)){
	 	 	mkdir($dst, 0777,true);
	 	 }
	 	 
	 	  $contents = $this->curl_download($url, $dst."/template.rar");
			
	 	  if($contents){
	 	  	  $this->_unzip($dst."/template.rar",$dst);
	 	  	  unlink($dst."/template.rar");
			  echo 1;
	 	  }else {
	 	  	 echo "下载失败";
	 	  }
	 	  
	}
	
	 
	
	function curl_download($url, $dir) {
		$ch = curl_init($url);
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);;
		$res=curl_exec($ch);
		curl_close($ch);
		 
		
		$fp = fopen($dir, "w");
		fwrite($fp, $res);
		fclose($fp);
		
		return $res;
	}
	 
	
	function _unzip($fileName,$extractTO){
	 
		$rar_file = rar_open($fileName) or die('could not open rar');
		$list = rar_list($rar_file) or die('could not get list');
		
	
		foreach($list as $file) {
			$pattern = '/\".*\"/';
			preg_match($pattern, $file, $matches, PREG_OFFSET_CAPTURE);
			 
			$pathStr=$matches[0][0];
			$pathStr=str_replace("\"",'',$pathStr);
			$entry = rar_entry_get($rar_file, $pathStr) or die('</br>entry not found');
			$entry->extract($extractTO);  
		}
		rar_close($rar_file);
	}
	
}