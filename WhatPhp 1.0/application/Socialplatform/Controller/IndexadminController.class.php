<?php

/**
 * 社交管理
 */
namespace Socialplatform\Controller;
use Common\Controller\AdminbaseController;
class IndexadminController extends AdminbaseController {
    function index(){
    }
    function show(){
        $SocialPlatform = M('SocialPlatform')->select();
        $this->assign('SocialPlatform',$SocialPlatform);
        $this->display();
    }
    function addedit(){
        $SocialPlatform = M('SocialPlatform');
        $id = I('get.id');
        if(IS_POST){
            $post = I('post.');
            $data = $post['post'];
            $data['imageurl'] = json_encode($post['smeta']);
//            $data['content'] = htmlspecialchars($data['content']);
            unset($data['smeta']);
            if($data['id']){
                $rs = $SocialPlatform->save($data);
            }else{
                $rs = $SocialPlatform->add($data);
            }

            if($rs === false){
                $this->error("保存失败！");
            }else{
                adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').$post['post']['socurl']);
                $this->success("保存成功！");
            }
        }
        if($id){
            $post = $SocialPlatform->where('id='.$id)->find();
            $post['imageurl'] = json_decode($post['imageurl'],true);
            $post['content'] = htmlspecialchars_decode($post['content']);
            $this->assign('post',$post);
        }
        $this->display();
    }
    function del(){
        $SocialPlatform = M('SocialPlatform');
        $id = I('get.id');
        if($id){
            $rs = $SocialPlatform->delete($id);
        }
        if($rs){
            $info = $SocialPlatform->where(array('id'=>$id))->find();
            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').$info['socurl']);
            $this->success("删除成功！");
        }else{
            $this->error("删除失败！");
        }
        
    }

    function technical(){
        echo '技术顾问：abc，电话，456';
    }
    
    
    /*
     * 服务器，域名到期提醒
     * @author cx
     * @time 20160623
     *
     * */
    public function reminder(){
    	
		$count = M('reminder')->count();
    	
		$page = $this->page($count ,20);
    	
		$list = M('reminder')->order(" id desc")->limit($page->firstRow . ',' . $page->listRows)->select();
		
		$this->assign("Page", $page->show('Admin'));
		$this->assign("list" ,$list);
    	$this->display();
    	
    }
    
    
    /* 
     * 添加域名服务器
     * @auther cx
     * @time 20160623
     * 
     *  */
    public function addReminder(){
    	
    	if(IS_POST){
    		
    		$endtime = strtotime(I('endtime'));
    		$rday = I('rday','','int');
    		
    		$now = time();   //统一时间
    		
    		if($endtime <$now){
    			$this->error("时间不能早于今天");
    		}
    		
    		if( $rday <=0 ){
    			$this->error("提前提醒天数必须是正整数");
    		}
    		
    		if($endtime - $rday*86400 <$now ){
    			$this->error("开始提醒的时间不能早于今天");
    		}
    		
    		$data =array();
    		$data['type'] = I('type','','int');
    		$data['endtime'] = $endtime;
    		$data['addtime'] = $now;
    		$data['content'] = I('content');
    		$data['rday'] = $rday;
    		$data['btime'] = $endtime - $rday*86400;
    		
    		$status = M('reminder')->add($data);
    		 
    		if($status){
    		 	$this->success("添加成功");
    		}else{
    			$this->error("添加失败");
    		}
    	 
    	}else{
    		$this->display();
    	}
    	 
    	
    }
    
    
    /* 
     * 
     * 编辑提醒
     * @auther cx
     * @time 20160623
     * 
     *  */
    public function editReminder(){
    	
    	if(IS_POST){
    		
    		
    		$id = I('id','','int');

    		$endtime = strtotime(I('endtime'));
    		$rday = I('rday','','int');
    		
    		$now = time();
    		if($endtime <$now){
    			$this->error("时间不能早于今天");
    		}
    		
    		if( $rday <=0 ){
    			$this->error("提前提醒天数必须是正整数");
    		}
    		
    		if($endtime - $rday*86400 <$now ){
    			$this->error("开始提醒的时间不能早于今天");
    		}
    		
    		
    		$data = array();
    		$data['type'] = I('type','','int');
    		$data['endtime'] = $endtime;
    		$data['content'] = I('content');
    		$data['rday'] = $rday;
    		$data['status'] =0;
    		$data['btime'] = $endtime - $rday*86400;
    		
    		 $status = M('reminder')->where(" id = $id ")->save($data);
    		 
    		 if($status){
    		 	$this->success("修改成功");
    		 }else{
    		 	$this->error("修改失败");
    		 }
  
    	}else {
    		
    		$id =I('id','','int');
    		
    		$find = M('reminder')->where(" id = $id")->find();
    		if(!$find){
    			$this->error("查找的提醒不存在");
    		}
  
    		$this->assign("info" ,$find);
    		$this->display();
    	}
    
    }
    
    /* 
     * 删除提醒
     * @author cx
     * @time 20160624
     *  
     *  */
    
    public function delReminder(){
     
    	$id = I('id' , '' ,'int');
    	
    	if($id){
    		
    		$status = M('reminder')->where(" id = $id")->delete();
    		if($status){
    			$this->success("删除成功");
    		}else{
    			$this->error("删除失败");
    		}
    	}else{
    		$this->error("ID 不存在");
    	}
    	
    }
    

    public function site(){
    	 
    	$this->display();
    }
    
    
    
    /* 
     * 
     * 生成sitemap
     * @author cx
     * @time   20160801
     *  
     *  */
    
    public function siteMap(){
    	
    	$cat_score=0.9;   //分类分数
    	$score =0.8;  //详情页分数
    	$day = "Monthly" ;   //显示更新频率
    	 
    	
    	$sitemap = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\r\n";
     	
     	//所有的分类
    	$catlist = M('category')->field(" url ")->select();
    	foreach($catlist as $value){ 
    		$sitemap .=$this->formatemap($value ,$cat_score,$day);
    	}
    	
    	//所有模型
    	$modlist = M("model")->where("disabled =0")->field("tablename")->select();
    	foreach($modlist as $mvalue){
    		
    		$datalist = M($mvalue['tablename'])->field("url , updatetime as addtime")->select();
    		foreach($datalist as $dvalue){
    			$sitemap .=$this->formatemap($dvalue, $score ,$day);
    		}
    		
    	}
    	
    	$sitemap .= '</urlset>';
    	
    	$file = fopen("sitemap.xml","w");
    	fwrite($file,$sitemap);
    	fclose($file);
    	$this->success('地图生成成功');
    	 
    }
    
  
    /* 
     * 格式化函数
     * @author cx
     * @time 20160801
     * 
     *  */
    
    function formatemap($info ,$score ,$day){
    	
    	$sitemap ="";
    	$sitemap .= "<url>\r\n";
    	$sitemap .="<loc>".htmlspecialchars($info['url'])."</loc>\r\n";
    	$sitemap .="<lastmod>".($info['addtime'] ? date("Y-m-d", $info['addtime']) : date("Y-m-d",time()))."</lastmod>\r\n";
    	$sitemap .="<changefreq>".$day."</changefreq>\r\n</url>\r\n";
    	$sitemap .="<priority>".$score."</priority>\r\n";
    	
    	return $sitemap;
    }
    

}
