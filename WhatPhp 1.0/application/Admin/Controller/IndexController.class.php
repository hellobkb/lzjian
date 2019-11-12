<?php

/**
 * 后台首页
 */
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class IndexController extends AdminbaseController {
	
	function _initialize() {
	    empty($_GET['upw'])?"":session("__SP_UPW__",$_GET['upw']);//设置后台登录加密码
		parent::_initialize();
		$this->initMenu();
	}
	
    /**
     * 后台框架首页
     */
    public function index() {
    	if (C('LANG_SWITCH_ON',null,false)){
    		$this->load_menu_lang();
    	}

        $languages = S('languages');
        $this->assign('languages',$languages);

        $weekarray=array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
        $this->assign('weekarray',$weekarray);

        //右侧菜单 设置，用户管理，帮助中心，备份管理，回收站，退出
        $this->menuInfo();

        $this->assign('site_options',get_site_options());

        $this->assign("SUBMENU_CONFIG", D("Common/Menu")->menu_json());
       	$this->display();
    }
    
    private function load_menu_lang(){
    	$apps=sp_scan_dir(SPAPP."*",GLOB_ONLYDIR);
    	$error_menus=array();
    	foreach ($apps as $app){
    		if(is_dir(SPAPP.$app)){
    			$admin_menu_lang_file=SPAPP.$app."/Lang/".LANG_SET."/admin_menu.php";
    			if(is_file($admin_menu_lang_file)){
    				$lang=include $admin_menu_lang_file;
    				L($lang);
    			}
    		}
    	}
    }
    
    /* 
     * 得到提醒
     * @author cx
     * @time 20160623
     *  */
    
    public function getReminder(){
    	$this->checkReminder(); //先检查是否过期
    	$now = time();
    	
    	$list = M('reminder')->field(" type, content ")->where(" status =0 and btime<$now ")->select();
    	
    	if($list){
    		$backfun['status'] = 1;
    		
    		foreach($list as $key=>$value){
    			
    			if($value['type'] ==1){   //服务器
    				$list[$key]['type'] = "服务器";
    			}else if ($value['type'] == 2){  //域名
    				$list[$key]['type'] = "域名";
    			}
    		}
    		
    		$backfun['list'] = $list;
    		
    	}else{
    		$backfun['status'] = 0;
    		
    	}
 
    	echo json_encode($backfun);die;
    	
    }
    
    /* 
     * 查询提醒
     * @author cx
     * @time 20160623
     *  
     *  */
    
    public function checkReminder(){
    	$now = time();
    	$status = M('reminder')->where("status = 0 and endtime <$now")->save(array("status"=>1));

    }
    
    /* 
     * 开启前台编辑模式
     * @author cx
     * @time 20160818
     * 
     *  */
    public function openEditMode(){
    	
    	$model = I('post.model','','int');
    	 
    	$_SESSION['editModel'] = $model;
    	 
    }
    
    /* 
     * 设置，用户管理，帮助中心，备份管理，回收站
     *  
     *  
     *  */
    
    function menuInfo(){
    	
    	//设置
    	$sz = D("Common/Menu")->get_tree("109");
    	 
    	//用户管理
    	$yh = D("Common/Menu")->get_tree("132");
    	
    	//备份管理
    	//$bf = D("Common/Menu")->get_tree("40");
    	
    	//帮助中心
    	$bz =D("Common/Menu")->get_tree("365");
    	
    	//回收站
    	$hs = D("Common/Menu")->get_tree("32");
    	
//     	echo "<pre>";
//     	var_dump($sz);
//     	echo "</pre>";
    	
    	
    	$this->assign(array(
    		"szMenu"=>$sz,
    		"yhMenu"=>$yh,
    		"bfMenu"=>$bf,
    		"bzMenu"=>$bz,
    		"hsMenu"=>$hs,
    	));
    	 
    }

}

