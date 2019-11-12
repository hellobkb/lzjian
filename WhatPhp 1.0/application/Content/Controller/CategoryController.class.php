<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tuolaji <479923197@qq.com>
// +----------------------------------------------------------------------
namespace Content\Controller;
use Common\Controller\AdminbaseController;
use Common\Model\CacheModel;
class CategoryController extends AdminbaseController {
          
    protected $tree;
    protected $Url;
    protected $iconvfunc;
    
    function _initialize() {
        parent::_initialize();
         
        $this->tree = new \Common\Lib\Tree(); 
        $this->Url = new \Common\Lib\Url();
        $this->iconvfunc = new \Common\Lib\iconvfunc(); 
         
    }
    
    function index(){
        /*  
         * 栏目列表页重写
         * 
         * @author cx <445712421@qq.com>
         * 
         * */ 
        
        if (IS_POST) {
             
            if(!$this->checkPriv("listorder", 0)){
                $this->error("权限不足");
            }
            
            $Category = M('Category');
         
            foreach ($_POST['listorders'] as $id => $listorder) {
                $Category->where(array('catid' => $id))->save(array('listorder' => $listorder));
                //删除缓存
                getCategory($id,'',true);
            }
            $this->cache();
            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ORDER'));
            $this->success("排序更新成功！");
            exit;
        }
        
         
        $modelid = I('modelid','','int');
         
        $result = S("Category");
        
        $models = S('Model');
          
        $categorys = array();
        //栏目数据，可以设置为缓存的方式
        
        $site = M("options")->where("option_name='site_options'")->find();
        $sitearr = json_decode($site['option_value'],true);
         
        $siteurl = parse_url($sitearr['site_host']);
         
        $types = array(0 => '内部栏目', 1 => '<font color="blue">单网页</font>', 2 => '<font color="red">外部链接</font>');
        
        if (!empty($result)) {
            foreach ($result as $r) {
                $r = getCategory($r['catid'],'',true);

                if(empty($r))continue;
                $r['modelname'] = $models[$r['modelid']]['name'];
                $r['str_manage'] = '';
                $r['level'] = $this->_get_level($r['catid'], $result);
                //$r['child'] = get_catgory_product($r['catid'],$r['type']);
                
                $r['parentid_node'] = ($r['parentid']) ? ' class="child-of-node-' . $r['parentid'] . '"' : '';
                /*if ($r['child']) {
                    $r['yesadd'] = '';
                } else {
                    $r['yesadd'] = 'blue';
                }*/
                if($r['type'] != 2){
                    $r['str_manage'] .= '<a href="' . U("Category/tdk", array("catid" => $r['catid'] ,'is_tdk_list' => 0)) . '">关键词管理</a> | ';
                }
                //$isson = get_catgory_son($r['catid']);
                if ($r['type'] != 2) {
                    
                        if ($r['type'] == 1) {
                            $r['str_manage'] .= '<a href="' . U("Category/singlepage", array("parentid" => $r['catid'])) . '">添加子栏目</a> | ';
                        } else {
                            $r['str_manage'] .= '<a href="' . U("Category/add", array("parentid" => $r['catid'])) . '">添加子栏目</a> | ';
                            
                            //if($isson == 0)$r['str_manage'] .=" <a href='".U('Contentshow/add',array('catid'=>$r['catid']))."' target='_blank'>添加内容</a> | ";
                        
                    }

                }
                $r['str_manage'] .= '<a href="' . U("Category/edit", array("catid" => $r['catid'])) . '">修改</a> | <a class="js-ajax-delete" href="' . U("Category/delete", array("catid" => $r['catid'])) . '">删除</a>';
                //终极栏目转换
                /*if (in_array($r['type'], array(0, 1)) && $r['modelid'] && $r['child'] == 1) {
                    $r['str_manage'] .= ' | <a href="' . U("Category/categoryshux", array("catid" => $r['catid'])) . '">终极属性转换</a> ';
                }*/
                
                //添加内容
                /*if($r['type']==0 && $r['child'] && $isson==0){
                    $r['str_manage'] .=" | <a href='".U('Contentshow/add',array('catid'=>$r['catid']))."' target='_blank'>添加内容</a>";
                }*/
                $count_arrchildid = count(explode(',', $r['arrchildid']));
                if($r['type']==0 && $count_arrchildid == 1){
                    $r['str_manage'] .=" | <a href='".U('Contentshow/add',array('catid'=>$r['catid']))."' target='_blank'>添加内容</a>";
                }
                 
                if($r['type']=='1'){
                    $single = M('Page')->where(array('catid'=>$r['catid']))->find();
                    if($single){
                        $r['str_manage'] .= " | <a href='".U('Contentshow/pagedit',array('catid'=>$r['catid']))."' target='_blank'>修改内容</a>";
                    }else{
                        $r['str_manage'] .= " | <a href='".U('Contentshow/pagedit',array('catid'=>$r['catid']))."' target='_blank'>添加内容</a>";
                    }
                    
                }
                $asd=$r['ismenu'];
                //是否首页显示
                if($r['ismenu'] ==1){
                    $r['ismenu'] ="<a href='javascript:;' onclick='changeismenu(".$r['catid'].",this)' ><font color='green'  >是</font></a>";
                }else{
                    $r['ismenu'] ="<a href='javascript:;' onclick='changeismenu(".$r['catid'].",this)' ><font color='red' >否</font></a>";
                }
                
                $r['typename'] = $types[$r['type']];
                $r['display_icon'] = $r['ismenu'] ? '' : ' <img src ="' . $sitearr['site_host'] . 'public/images/gear_disable.png" title="不在导航显示">';
        
                $r['help'] = '';
                $setting = $r['setting'];
                if ($r['url']) {
                    $parse_url = parse_url($r['url']);
                    if ($parse_url['host'] != $siteurl['host'] && strpos($r['url'], '/index.php?') === false) {
                        $catdir = $r['catdir'];
                        //如果生成静态，将设置一个指定的静态目录
                        $catdir = '/' . $r['parentdir'] . $catdir;
                        if ($setting['ishtml'] && strpos($r['url'], '?') === false) {
                            $r['help'] = '<img src="' . $sitearr['site_host']. 'public/images/help.png" title="将域名：' . $r['url'] . '&#10;绑定到目录&#10;' . $catdir . '/">';
                        }
                    }
                    if ($asd == 0){
                    $r['url'] = " ";
                    }else {
                    $r['url'] = "<a href='" . $r['url'] . "' target='_blank'>访问</a>";
                    }
                } else {
                    $r['url'] = "<a href='" . U("Category/public_cache") . "'><font color='red'>更新缓存</font></a>";
                }
                $categorys[$r['catid']] = $r;
            }
        }
        
        
        
        $str = "<tr id='node-\$id' \$parentid_node>
                    <td>
                        <input type='checkbox' class='js-check' data-yid='js-check-y' data-xid='js-check-x' name='ids[]' value='\$catid' level='\$level'  onclick='javascript:checknode(this);'>
                    </td>
                    <td align='center' style='padding-left:20px;'><input name='listorders[\$id]' type='text' size='3' value='\$listorder' class='input input-order'></td>
                    <td align='center'><font color='\$yesadd'>\$id</font></td>
                    <td >\$spacer\$catname\$display_icon</td>
                    <td  align='center'>\$typename</td>
                    <td>\$modelname</td>
                    <td align='center'>\$url</td>
                    <td align='center'>\$help</td>
                    <td align='center'>\$ismenu</td>
                    <td align='center' >\$str_manage</td>
                </tr>";
         
         
         
        
        if (!empty($categorys) && is_array($categorys)) {
            $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
            $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
             
            $this->tree->init($categorys);
            
            $categorydata = $this->tree->get_tree(0, $str);
        } else {
            $categorydata = '';
        }
        
         
        
        $this->assign("categorys", $categorydata);
        $this->display();
    }

    /**
     * 获取菜单深度
     * @param $id
     * @param $array
     * @param $i
     */
    protected function _get_level($id, $array = array(), $i = 0) {
        
            if ($array[$id]['parentid']==0 || empty($array[$array[$id]['parentid']]) || $array[$id]['parentid']==$id){
                return  $i;
            }else{
                $i++;
                return $this->_get_level($array[$id]['parentid'],$array,$i);
            }
                
    }
    
    
    function add(){
        
         
        /* 
         * 添加栏目修改
         * @author cx
         *  */
         
        //权限判断
        if(I('get.parentid', 0, 'intval')){
            if(!$this->checkPriv("add", I('get.parentid', 0, 'intval'))){
                $this->error("权限不足");
            }
        }
        
        $parentid = I('get.parentid', 0, 'intval');
         
        if (!empty($parentid)) {
            $Ca = getCategory($parentid);
            if (empty($Ca)) {
                $this->error("父栏目不存在！");
            }
            /*if ($Ca['child'] == '0') {
                $this->error("终极栏目不能添加子栏目！");
            }*/
        }
        
        //输出可用模型
           
        $modelsdata = S('Model');
          
        $models = array();
        foreach ($modelsdata as $v) {
            if ($v['disabled'] == 0 && $v['type'] == 0) {
                $models[] = $v;
            }
        }
        //栏目列表 可以用缓存的方式
        $array = S("Category");
         
        foreach ($array as $k => $v) {
            $array[$k] = getCategory($v['catid']);
            $count_arrchildid = count(explode(',', $array[$k]['arrchildid']));
            if ($count_arrchildid == '1') {
                //$array[$k]['disabled'] = "disabled";
                $array[$k]['disabled'] = "";
            } else {
                $array[$k]['disabled'] = "";
            }
        }
         
        if (!empty($array) && is_array($array)) {
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $str = "<option value='\$catid' \$selected \$disabled>\$spacer \$catname</option>";
             
            $this->tree->init($array);
        
            $categorydata = $this->tree->get_tree(0, $str,$parentid);
             
        } else {
            $categorydata = '';
        }
        
        $listtp = array();      //栏目模板列表
        $categorytp = array();  //栏目频道模板列表
        $showtp =array();       //内容模板列表
        $commenttp =array();    //评论模板模板列表
        $pagetp =array();       //单页模板文件
 
        //模板文件目录下存放的各类静态文件

         
        
        $this->assign("tp_category", getTemlateHtml("Category"));   //分类
        $this->assign("tp_list", getTemlateHtml("List"));           //图片
        $this->assign("tp_show", getTemlateHtml("Show"));           //内容
        $this->assign("tp_comment", getTemlateHtml("Comment"));     //评论
        $this->assign("tp_page", getTemlateHtml("Page"));           //单页
         
         
        
        $this->assign("category", $categorydata);
        $this->assign("models", $models);
        $this->assign('parentid_modelid', $Ca['modelid']);
     
        
        $type = I('get.type', 0, 'intval');
        $this->assign("category_php_ruleid",\Common\Lib\Form::urlrule('content', 'category', 0, "", 'name="category_php_ruleid"'));    //栏目
        $this->assign("category_html_ruleid", \Common\Lib\Form::urlrule('content', 'category', 1, "", 'name="category_html_ruleid"'));
        $this->assign("show_php_ruleid", \Common\Lib\Form::urlrule('content', 'show', 0, "", 'name="show_php_ruleid"'));                //内容
        $this->assign("show_html_ruleid", \Common\Lib\Form::urlrule('content', 'show', 1, "", 'name="show_html_ruleid"')); 
        
        //角色组
        $this->assign("Role_group", M("Role")->order(array("id" => "ASC"))->select());
        $this->assign('parentid',$parentid);
        
        $this->display();
         
    }
    
    /*  
     * 添加栏目提交
     * @author cx
     * @time 20160523
     * 
     * */
    
    function add_post(){
      
        if (IS_POST) {
            
            //检查是否有重复名字
            
            $catname = $_POST['info']['catname'];   //catname
            $parent = $_POST['info']['parentid'];   //父级ID
            if($parent ==0){
                $check = M('category')->where(" parentid=0 and catname='".$catname."'")->find();
                if($check){
                    $this->error("一级栏目存在相同的栏目名称");
                }
            }else {  //存在父级ID， 判断现在语言和父级语言是否相同
                $lan_category = M('category')->where("catid= $parent")->find();
                
                if(!$lan_category ){
                    $this->error("当前语言和父级栏目语言不同");
                }
                 
            }
              
            
            $Category = D("Content/Category");
            //批量添加
            $isbatch = I('post.isbatch', 0, 'intval');
             
            
            if ($isbatch) {  //批量添加$p


                $post = $_POST;
                //unset($post['isbatch'], $post['info']['catname'], $post['info']['catdir']);

                $titles = $post['p']['title'];
                $titles = array_unique($titles);

                foreach ($titles as $key => $val) {
                    if($parent ==0){
                        $check = M('Category')->where(" parentid=0 and catname='".$val."'")->find();
                        if($check){
                            $this->error("一级栏目存在相同的栏目名称");
                        }
                    }
                }

                foreach ($titles as $key => $val) {

                    if ($val) {
                        $post['info']['catname'] = $val;
                        $post['info']['catdir'] = $post['p']['catdir'][$key];
                        $post['setting']['meta_title'] = $post['p']['meta_title'][$key];
                        $post['setting']['meta_keywords'] = $post['p']['meta_keywords'][$key];
                        $post['setting']['meta_description'] = $post['p']['meta_description'][$key];

                        if(!$post['info']['catdir']){
                            $py = $this->iconvfunc->gbk_to_pinyin(iconv("utf-8","gbk",$post['info']['catname']));
                            $match = preg_replace("/[\s@#%&.,*\/]+/"," " ,strtolower(implode("",$py)));
                            $post['info']['catdir'] = str_replace(" ","-",$match);
                        }
                        if($post['info']['catdir']){
                            $catdir = str_replace(',', '', $post['info']['catdir']);
                            if(!preg_match("/^[\w-]+$/", $catdir)){
                                $this->error($post['info']['catdir']."栏目目录内请勿出现空格，汉字及特殊符号");
                            }
                        }
                        $catid = $Category->addCategory($post);
             
                        if ($catid) {
                            //更新角色栏目权限
                            D("Content/Category_priv")->update_priv($catid, $_POST['priv_roleid'], 1);
                            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').$post['info']['catname']);
                            if (isModuleInstall('Member')) {
                                //更新会员组权限
                                D("Content/Category_priv")->update_priv($catid, $_POST['priv_groupid'], 0);
                            }
                        }
                    }else{
                        $this->error($Category->getError() ?$Category->getError() : "栏目添加失败！");
                    }


                    
                }

                $this->success("添加成功！", U("Category/public_cache"));
            }else{
                
                if(!$_POST['info']['catname']){
                    $this->error("请输入栏目名称");
                }else{
                    if(!$_POST['info']['catdir']){
                        $py = $this->iconvfunc->gbk_to_pinyin(iconv("utf-8","gbk",$_POST['info']['catname']));
                        $match = preg_replace("/[\s@#%&.,*\/]+/"," " ,strtolower(implode("",$py)));
                        $_POST['info']['catdir'] = str_replace(" ","-",$match);
                            
                    }
                    if($_POST['info']['catdir']){
                        $catdir = str_replace(',', '', $_POST['info']['catdir']);
                        if(!preg_match("/^[\w-]+$/", $catdir)){
                            $this->error("栏目目录内请勿出现空格，汉字及特殊符号");
                        }
                    }
                    
                    
                    //检查catdir 路径是否有重复
                    /*  $checkcatdir = M('category')->where("catdir='".$_POST['info']['catdir']."'")->find();
                     if($checkcatdir){
                        $this->error("栏目目录已经存在，请更换英文目录或栏目名称");
                     }   */
                }

                $catid = $Category->addCategory($_POST);
                if ($catid) {
                    //栏目title关键词使用次数
                    /*$title = explode(',',$_POST['setting']['meta_title']);
                    $tks = M('TksLibrary')->select();
                    array_pop($title);
                    if($title){
                        foreach ($title as $value) {
                            foreach ($tks as $v) {
                                $is = preg_match("/$value/",$v['keywords']);
                                if($is){
                                    $map['keywords'] = array('like',"%".$value."%");
                                    $rel = M('TksLibrary')->where($map)->find();
                                    $data['c_num'] = $rel['c_num']+1;
                                    $where['id'] = $rel['id'];
                                    M('TksLibrary')->where($where)->save($data);
                                }
                            }
                        }
                    }*/
                    //更新角色栏目权限
                    D("Content/Category_priv")->update_priv($catid, $_POST['priv_roleid'], 1);
                    //日志
                    adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').$post['info']['catname']);

                    $this->success("添加成功！", U("Category/public_cache"));
                } else {
                    $error = $Category->getError();
                    $this->error($error ? $error : '栏目添加失败！');
                }
            }
            
        }
    }

    /* 
     * 获取英文目录
     * @time 20180308
     *  
     *  */
    function addcatdir(){
        $catname = trim(I('catname'));
        if(!$catname){
            $data['status'] = 0;
            $data['dir'] = '';
            $this->ajaxReturn($data);
        }
        $py = $this->iconvfunc->gbk_to_pinyin(iconv("utf-8","gbk",$catname));
        $match = preg_replace("/[\s@#%&.,*\/]+/"," " ,strtolower(implode("",$py)));
        $match = trim($match);
        $catdir = str_replace(" ","-",$match);
        $data['status'] = 1;
        $data['dir'] = $catdir;
        $this->ajaxReturn($data);
        
    }
    
    /* 
     * 栏目修改
     * 
     * @author cx
     * @time 20160523
     *  
     *  */
    
    function edit(){
        
        //权限
        if(!$this->checkPriv("edit", I('get.catid', 0, 'intval'))){
            $this->error("权限不足");
        }
        
        
        $catid = I('get.catid', 0, 'intval');
        $data = getCategory($catid);
        $data['count_arrchildid'] = count(explode(',', $data['arrchildid']));
        $array = S("Category");
         
        foreach ($array as $k => $v) {
            $array[$k] = getCategory($v['catid']);
            $count_arrchildid = count(explode(',', $array[$k]['arrchildid']));
            if ($count_arrchildid == "1" || $v['modelid'] != $data['modelid']) {
                $array[$k]['disabled'] = "disabled";
            } else {
                $array[$k]['disabled'] = "";
            }
        }
         
        $setting = $data['setting'];
        //输出可用模型
        $modelsdata = cache("Model");
          
        $models = array();
        foreach ($modelsdata as $v) {
            if ($v['disabled'] == 0 && $v['type'] == 0 ) {
                $models[] = $v;
            }
        }
        if (!empty($array) && is_array($array)) {
            $this->tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
            $this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($array);
            $str = "<option value='\$catid' \$selected \$disabled>\$spacer \$catname</option>";
            $categorydata = $this->tree->get_tree(0, $str, $data['parentid']);
        } else {
            $categorydata = '';
        }
        
        $this->assign("category_php_ruleid", \Common\Lib\Form::urlrule('content', 'category', 0, $setting['category_ruleid'], 'name="category_php_ruleid"'));
        $this->assign("category_html_ruleid", \Common\Lib\Form::urlrule('content', 'category', 1, $setting['category_ruleid'], 'name="category_html_ruleid"'));
        
        $this->assign("show_php_ruleid", \Common\Lib\Form::urlrule('content', 'show', 0, $setting['show_ruleid'], 'name="show_php_ruleid"'));
        $this->assign("show_html_ruleid", \Common\Lib\Form::urlrule('content', 'show', 1, $setting['show_ruleid'], 'name="show_html_ruleid"'));
        
        $this->assign("tp_category", getTemlateHtml("Category"));
        $this->assign("tp_list",     getTemlateHtml("List"));
        $this->assign("tp_show",     getTemlateHtml("Show"));
        $this->assign("tp_comment",  getTemlateHtml("Comment"));
        $this->assign("tp_page",     getTemlateHtml("Page"));
        
         
        
        $this->assign("category", $categorydata);
        $this->assign("models", $models);
        $this->assign("data", $data);
        $this->assign("setting", $setting);
         
         
        //栏目扩展字段
        //$this->assign('extendList', D("Content/Category")->getExtendField($catid));
        //角色组
        
        $role_group = M("Role")->order(array("id" => "ASC"))->select();
        
        $privs = M("CategoryPriv")->where(array('catid' => $catid))->select();
         
         
        foreach($role_group as $rkey=>$rvalue){
            $role_group[$rkey]['init'] = D("Content/CategoryPriv")->check_category_priv($privs,"init", $rvalue['id'],1);
            $role_group[$rkey]['add'] = D("Content/CategoryPriv")->check_category_priv($privs,"add", $rvalue['id'],1);
            $role_group[$rkey]['edit'] = D("Content/CategoryPriv")->check_category_priv($privs,"edit", $rvalue['id'],1);
            $role_group[$rkey]['delete'] = D("Content/CategoryPriv")->check_category_priv($privs,"delete", $rvalue['id'],1);
            $role_group[$rkey]['listorder'] = D("Content/CategoryPriv")->check_category_priv($privs,"listorder", $rvalue['id'],1);
            $role_group[$rkey]['push'] = D("Content/CategoryPriv")->check_category_priv($privs,"push", $rvalue['id'],1);
            $role_group[$rkey]['remove'] = D("Content/CategoryPriv")->check_category_priv($privs,"remove", $rvalue['id'],1);
        }
        $this->assign("Role_group", $role_group);
         
        //权限数据
         
        $this->assign("big_menu", array(U("Category/index"), "栏目管理"));
        
        /* if (isModuleInstall('Member')) {
            //会员组
            $this->assign("Member_group", cache("Member_group"));
        } */
        
        
        if ($data['type'] == 1) {//单页栏目
             
            $this->display("singlepage_edit");
        } else if ($data['type'] == 2) {//外部栏目
             
            $this->display("wedit");
        } else {
            $this->display();
        }
         
    }
    
    /*  
     * 栏目编辑提交
     * @author cx
     * @time 20160523
     * 
     * */
    
    function edit_post(){
        
        if (IS_POST) {
            $post = I('post.');
            /* if ($this->terms_model->create()) {
                if ($this->terms_model->save()!==false) {
                    F('all_terms',null);
                    $this->success("修改成功！");
                } else {
                    $this->error("修改失败！");
                }
            } else {
                $this->error($this->terms_model->getError());
            } */
            
             //var_dump($_POST);exit;

         
            $catid = I("post.catid", "", "intval");
            if (empty($catid)) {
                $this->error('请选择需要修改的栏目！');
            }
            
            //检查路径是否重复
            //$checkdir = M('category')->where("catdir='".$_POST['info']."'")->find();
            
            $Category = D("Content/Category");
             
            $status = $Category->editCategory($_POST);
            if ($status) {
                //应用权限设置，模板设置，缩略图大小 到子栏目
                if ($_POST['priv_child']) {
                    //子栏目
                    $catInfo = getCategory($catid);
                    $arrchildid_arr = explode(',', $catInfo['arrchildid']);
                    
                    $arr['category_template'] = $post['setting']['category_template'];
                    $arr['list_template'] = $post['setting']['list_template'];
                    $arr['show_template'] = $post['setting']['show_template'];
                    $arr['width'] = $post['setting']['width'];
                    $arr['height'] = $post['setting']['height'];

                    //内部栏目
                    if ((int)$catInfo['type'] != 2) {
                        if ($post['setting']['ishtml']) {
                            $arr['category_ruleid'] = $post['category_html_ruleid'];
                        } else {
                            $arr['category_ruleid'] = $post['category_php_ruleid'];
                            $arr['url'] = '';
                        }
                    }
                    //栏目生成静态配置
                    if ($post['setting']['ishtml']) {
                        $arr['category_ruleid'] = $post['category_html_ruleid'];
                    } else {
                        $arr['category_ruleid'] = $post['category_php_ruleid'];
                    }
                    //内容生成静态配置
                    if ($post['setting']['content_ishtml']) {
                        $arr['show_ruleid'] = $post['show_html_ruleid'];
                    } else {
                        $arr['show_ruleid'] = $post['show_php_ruleid'];
                    }
                    //栏目是否生成静态
                    $arr['sethtml'] = $post['setting']['ishtml'] ? 1 : 0;
                    $arr['ishtml'] = $post['setting']['ishtml'] ? 1 : 0;
                    //内容页是否生成静态
                    $arr['content_ishtml'] = $post['setting']['content_ishtml'] ? 1 : 0;

                    foreach ($arrchildid_arr as $arr_v) {
                        $catInfo_2 = getCategory($arr_v);
                        if($catInfo_2['modelid'] == $catInfo['modelid']){
                            D("Content/Category_priv")->update_priv($arr_v, $_POST['priv_roleid'], 1);
                            D("Content/Category_priv")->update_cateother($arr_v,$arr);
                        }
                    }
                } else {
                    //更新角色栏目权限
                    D("Content/Category_priv")->update_priv($catid, $_POST['priv_roleid'], 1);
                    adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').$_POST['info']['catname']);
                    /* if (isModuleInstall('Member')) {
                        //更新会员组权限
                        D("Content/Category_priv")->update_priv($catid, $_POST['priv_groupid'], 0);
                    } */
                }
                $this->success("更新成功！", U("Category/public_cache"));
            } else {
                $error = $Category->getError();
                $this->error($error ? $error : '栏目修改失败！');
            }
            
            
        }
    }
    
    //排序
    public function listorders() {
        $status = parent::_listorders($this->terms_model);
        if ($status) {
            $this->success("排序更新成功！");
        } else {
            $this->error("排序更新失败！");
        }
    }
    
    /**
     *  删除
     *  @author cx
     *  @time 20160523
     */
    public function delete() {
        
        if(!$this->checkPriv("delete", I("get.catid", "", "intval"))){
            $this->error("权限不足");
        }
        
        $catid = I("get.catid", "", "intval");
        if (!$catid) {
            $this->error("请指定需要删除的栏目！");
        }
        if (false == D("Content/Category")->deleteCatid($catid)) {
            $cateinfo = getCategory($catid);
            adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_DEL').$cateinfo['catname']);
            $this->error("栏目删除失败，错误原因可能是栏目下存在信息，无法删除！");
        }
        $this->success("栏目删除成功！", U("Category/public_cache"));
        
        
        
    }

    /**
     *  批量删除
     *  @time 20180330
     */
    public function p_delete(){
        $ids = I('ids');
        $s = 0;
        if($ids){
            foreach ($ids as $k => $catid) {
                $cinfo = getCategory($catid);
                $arrchild = explode(',', $cinfo['arrchildid']);
                $child_count = count($arrchild);
                $arrcha = array_diff($arrchild,$ids);
                if($cinfo['arrchildid']==$catid || empty($arrcha)){
                    $rel = D("Content/Category")->deleteCatidone($catid,$ids);
                    if($rel){
                        $s++;
                        $arr[] = $catid;
                    }
                }
            }
            $this->success("栏目删除成功！".$s.'个', U("Category/public_cache"));
        }
        
    }

    
    /*  
     * 更新缓存
     * 
     * @author cx
     * 
     * */
    public function public_cache() {
        $db = D("Content/Category");
          
        //当前
        $number = I('get.number', 1, 'intval');
        //每次处理多少栏目
        $handlesum = 100;
        //计算栏目总数
        $count = I('get.count', $db->count(), 'intval');
        //需要处理几次
        $handlecount = ceil($count / $handlesum);
        if ($number > $handlecount) {
            $this->cache();
            $this->success("缓存更新成功！", U("Category/index"));
            return true;
        }
        $page = $this->page($count, $handlesum, $number);
        //取出需要处理的栏目数据
        $data = $db->order(array('catid' => 'ASC'))->limit($page->firstRow . ',' . $page->listRows)->select();

        if (empty($data)) {
            $this->cache();
            $this->success("缓存更新成功！", U("Category/index"));
            return true;
        }
         
        $categorys = array();
        foreach ($data as $v) {
            $categorys[$v['catid']] = $v;
        }
         
        $this->repair($categorys);
        $this->assign("waitSecond", 200);
        //跳转到下一轮
        $this->success("栏目总数:<font color=\"#FF0000\">{$count}</font>,每次处理:<font color=\"#FF0000\">{$handlesum}</font>,进度:<font color=\"#FF0000\">{$number}/{$handlecount}</font>,栏目缓存更新中...", U('public_cache', array('count' => $count, 'number' => $number + 1)));
    }

    /**
     * 修复栏目数据
     * @param type $categorys 需要修复的栏目数组
     * @author cx
     * @return boolean
     */
    protected function repair($categorys=array()) {
        
        if (is_array($categorys)) {
              
            foreach ($categorys as $catid => $cat) {
                 
                //外部栏目无需修复
                if ($cat['type'] == 2) {
                    continue;
                }
                 
                //获取父栏目ID列表
                $arrparentid = D("Content/Category")->getArrparentid($catid);
                //栏目配置信息反序列化
                $setting = unserialize($cat['setting']);
                //获取子栏目ID列表
                $arrchildid = D("Content/Category")->getArrchildid($catid);
                //检查所有父id 子栏目id 等相关数据是否正确，不正确更新

                if ($categorys[$catid]['arrparentid'] !== $arrparentid || $categorys[$catid]['arrchildid'] !== $arrchildid) {
                     
                    D("Content/Category")->where(array('catid' => $catid))->save(array('arrparentid' => $arrparentid, 'arrchildid' => $arrchildid));
                }
                 
                //获取父栏目路径
                $parentdir = $this->Url->get_categorydir($catid);
                //获取栏目名称
                $catname = iconv('utf-8', 'gbk', $cat['catname']);
                //返回拼音
                $letters = $this->iconvfunc->gbk_to_pinyin($catname);
                $letter = strtolower(implode('', $letters));
                //取得栏目相关地址和分页规则
                $category_url = $this->Url->category_url($catid);
                 
                if (false == $category_url) {
                    //return false;
                    continue;
                }
                $url = $category_url['url'];
                //更新数据
                $save = array();
                //更新URL
                 
                if ($cat['url'] != $url) {
                    $save['url'] = $url;
                }
                
                //更新动态URL
                $save['moveurl'] = $category_url['moveurl'];  //只保存动态地址
                 
                if ($categorys[$catid]['parentdir'] != $parentdir || $categorys[$catid]['letter'] != $letter) {
                    $save['parentdir'] = $parentdir;
                    $save['letter'] = $letter;
                }
     
                 
                if (count($save) > 0) {
                     
                    D("Content/Category")->where(array('catid' => $catid))->save($save);
                }
                //刷新单栏目缓存
                getCategory($catid, '', true);
                
            }
             
        }
        return true;
    }

    /**
     * 清除栏目缓存
     * @author cx
     */
    protected function cache() {
        cache('Category', NULL);
    }
    
    /*  
     * 栏目属性转换  child 字段的转换
     * 
     * @author cx 
     * @time 20160519
     * */
    
     
    public function categoryshux() {
        $catid = I('get.catid', 0, 'intval');
        $r = M("Category")->where(array("catid" => $catid))->find();
        if ($r) {
            //栏目类型非0，不允许使用属性转换
            if (!in_array($r['type'], array(0, 1)) || empty($r['modelid'])) {
                $this->error("该栏目类型不允许进行属性转换！", U('Category/index'));
            }
            $count = M("Category")->where(array("parentid" => $catid))->count();
            if ($count > 0) {
                $this->error("该栏目下已经存在栏目，无法转换！");
            } else {
                $count = M(ucwords(getModel($r['modelid'], 'tablename')))->where(array("catid" => $catid))->count();
                //echo M()->getLastSql();exit;
                
                if ($count) {
                    $this->error("该栏目下已经存在数据，无法转换！");
                }
                $count_arrchildid = count(explode(',', $r['arrchildid']));
                if($count_arrchildid > 1){
                    $child = 0;
                }else{
                    $child = 1;
                }
                //$child = $r['child'] ? 0 : 1;
                $status = D("Content/Category")->where(array("catid" => $catid))->save(array("child" => $child));
                if ($status !== false) {
                    getCategory($catid, '', true);
                    $this->repair();
                    $this->cache();
                    adminlog($_SESSION['ADMIN_ID'],$r['catname'].L('ADMINLOG_CHANGEFINAL'));
                    $this->success("栏目属性转换成功！");
                } else {
                    $this->error("栏目属性转换失败！");
                }
            }
        } else {
            $this->error("栏目不存在！");
        }
    }
    
    /* 
     * 添加单页
     * @author cx
     * @time 20160523
     *  
     *  */
    
    public function singlepage(){
        
        $this->add();
        
        //$this->display();
    }
    
    /* 
     * 添加外部链接栏目
     * @author cx
     * @time 20160523
     *  
     *  */
    
    
    public function wadd(){
        $this->add();
        
    }
    
     
    
    //关键词添加，修改
    public function tdk(){
        $option=M("Options")->where("option_name='site_options'")->find();
        $option_info =(array)json_decode($option['option_value']);
        $list_title_mo = $option_info['list_title_h'];
        $list_desc_mo = $option_info['list_desc_z'];
        $this->assign('list_title_mo',$list_title_mo);
        $this->assign('list_desc_mo',$list_desc_mo);
        $this->assign('is_tdk_list',I('is_tdk_list'));
        $catid = I('catid');
        if($_POST){
            $con['title']=serialize($_POST['setting']['title']);
            $con['keywords']=serialize($_POST['setting']['keywords']);
            $arr['iswrite']=$_POST['iswrite'];
            $arr['description_j']=$_POST['description'];
            $con['description']=serialize($arr);
            $con['catid']=$_POST['setting']['catid'];
            $catname = getCategory($catid,'catname');
            if($_POST['id']){
                $where['id']=$_POST['id'];
                $re = M('Tdks')->where($where)->save($con);
                if($re){
                    adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').L('ADMINLOG_LANMU').$catname.L('ADMINLOG_KEYWORDS'));
                    if($_POST['is_tdk_list']){
                        $this->success("修改成功！", U("Category/listtdk"));
                    }else{
                        $this->success("修改成功！", U("Category/index"));
                    }
                }else{
                    if($_POST['is_tdk_list']){
                        $this->error("修改失败！", U("Category/listtdk"));
                    }else{
                        $this->error("修改失败！", U("Category/index"));
                    }
                }
            }else{
                $re = M('Tdks')->add($con);
                if($re){
                    adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').L('ADMINLOG_LANMU').$catname.L('ADMINLOG_KEYWORDS'));
                    if($_POST['is_tdk_list']){
                        $this->success("添加成功！", U("Category/listtdk"));
                    }else{
                        $this->success("添加成功！", U("Category/index"));
                    }
                }else{
                    if($_POST['is_tdk_list']){
                        $this->error("添加失败！", U("Category/listtdk"));
                    }else{
                        $this->error("添加失败！", U("Category/index"));
                    }
                }
            }
        }else{
            $map['catid']=$catid;
            $info = M('Tdks')->where($map)->find();
            $info['catname'] = getCategory($catid,'catname');
            $info['title']=unserialize($info['title']);
            $info['keywords']=unserialize($info['keywords']);
            $info['description']=unserialize($info['description']);
            $this->assign('data',$info);
            $this->assign('catid',$catid);
            $this->display();
        }
    }
    //匹配关键词
    function seo_random(){
        $data = I('data');
        $option=M("Options")->where("option_name='site_options'")->find();
        $option_info =(array)json_decode($option['option_value']);
        $list_title_mo = $option_info['list_title_h'];
        $arr['title']=$data.' '.$list_title_mo;
        $arr['keywords']=$data;
        $this->ajaxReturn($arr);
    }
    //匹配关键词_添加列表
    function seo_random_list(){
        $catid = I('catid');
        $tdk_info = M('Tdks')->where(array('catid'=>$catid))->find();
        if($tdk_info){
            $seotitles_arr = explode(',', unserialize($tdk_info['title']));
            $seotitles_keywords = explode(',', unserialize($tdk_info['keywords']));
            $three_tit = array_rand($seotitles_arr,3);
            $three_keywords = array_rand($seotitles_keywords,3);
            foreach ($three_tit as $k => $v) {
                $tit[] = $seotitles_arr[$v];
            }
            foreach ($three_keywords as $k => $v) {
                $keywords[] = $seotitles_keywords[$v];
            }
        }else{
            $tdk_info = M('TksLibrary')->select();
            foreach ($tdk_info as $key => $value) {
                $keywords_all[$value['id']] = $value['keywords'];
            }
            $three_tit = array_rand($keywords_all,3);
            $three_keywords = array_rand($keywords_all,3);
            foreach ($three_tit as $k => $v) {
                $tit[] = $keywords_all[$v];
            }
            foreach ($three_keywords as $k => $v) {
                $keywords[] = $keywords_all[$v];
            }
        }
        $thir_tits = implode(',',$tit);
        $thir_tits = str_replace("*","",$thir_tits);
        $thir_keywords = implode(',',$keywords);
        $thir_keywords = str_replace("*","",$thir_keywords);
        //title默认部分
        $option=M("Options")->where("option_name='site_options'")->find();
        $option_info = json_decode($option['option_value'],true);
        $list_title_mo = $option_info['list_title_h'];
        $thir_tits = $thir_tits.','.$list_title_mo;
        $thir_keywords = $thir_keywords;
        $data['status'] = 1;
        $data['title'] = $thir_tits?$thir_tits:'';
        $data['keywords'] = $thir_keywords?$thir_keywords:'';
        $this->ajaxReturn($data);
    }
    
    //查看是否有权限
    function checkPriv($action, $catid){
     
        $roleid = $_SESSION['role_id'];  //用户角色
         
        if( strpos($roleid,"1")!==false){     //超级管理员
            return true;
        }else{
            if($catid){
                $priv = M('category_priv')->where("roleid in(".$roleid.") and action ='".$action."' and catid=$catid")->find();
                if($priv){
                    return true;
                }else{
                    return false;
                }
            }else {
                $status = 1;
                foreach(S('Category') as $value){
                    $priv = M('category_priv')->where("roleid in(".$roleid.") and action ='".$action."' and catid=$value[catid]")->find();
                    if(!$priv){
                        $status=0;break;
                    }
                }
                
                if($status ==1){
                    return true;
                }else {
                    return false;
                }
            }
         
        }
        
        
    }
    //关键词管理列表页
    function listtdk(){
        $modelid = I('modelid','','int');
        $result = S("Category");
        $models = S('Model');
        $categorys = array();
        //栏目数据，可以设置为缓存的方式
        $site = M("options")->where("option_name='site_options'")->find();
        $sitearr = json_decode($site['option_value'],true);
        $siteurl = parse_url($sitearr['site_host']);
        $types = array(0 => '内部栏目', 1 => '<font color="blue">单网页</font>', 2 => '<font color="red">外部链接</font>');
        if (!empty($result)) {
            foreach ($result as $r) {
                $r = getCategory($r['catid']);
                if($r == false){
                    continue;
                }
                $r['modelname'] = $models[$r['modelid']]['name'];
                $r['str_manage'] = '';
                $count_arrchildid = count(explode(',', $r['arrchildid']));
                if ($count_arrchildid > 1) {
                    $r['yesadd'] = '';
                } else {
                    $r['yesadd'] = 'blue';
                }
                if($r['type'] != 2){
                    $r['str_manage'] .= '<a href="' . U("Category/tdk", array("catid" => $r['catid'],'is_tdk_list' => 1)) . '">关键词管理</a> | ';
                    $r['str_manage'] .= '<a href="' . U("Category/edittdk", array("catid" => $r['catid'],'is_tdk_list' => 1)) . '">编辑</a>';

                }
                $r['typename'] = $types[$r['type']];
                $r['help'] = '';
                $setting = $r['setting'];
                if ($r['url']) {
                    $parse_url = parse_url($r['url']);
                    $r['url'] = "<a href='" . $r['url'] . "' target='_blank'>访问</a>";
                } else {
                    $r['url'] = "<a href='" . U("Category/public_cache") . "'><font color='red'>更新缓存</font></a>";
                }
                $categorys[$r['catid']] = $r;
            }
        }
        $str = "<tr>
                <td align='center'><font color='\$yesadd'>\$id</font></td>
                <td >\$spacer\$catname\$display_icon</td>
                <td  align='center'>\$typename</td>
                <td>\$modelname</td>
                <td align='center' >\$str_manage</td>
                </tr>";
        if (!empty($categorys) && is_array($categorys)) {
            $tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
            $tree->nbsp = '&nbsp;&nbsp;&nbsp;';
            $this->tree->init($categorys);
            $categorydata = $this->tree->get_tree(0, $str);
        } else {
            $categorydata = '';
        }
        $this->assign("is_tdk_list", 1);
        $this->assign("categorys", $categorydata);
        $this->display();
    }
    //关键词编辑
    function edittdk(){
        if(IS_POST){
            $cateinfo = getCategory($_POST['catid']);
            $post = array_merge($cateinfo['setting'],$_POST['setting']);
            $con['setting'] = serialize($post);
            $where['catid']=$_POST['catid'];
            $rel = M('Category')->where($where)->save($con);
            if($rel){
                $this->success("编辑成功！", U("Category/listtdk"));
            }else{
                $this->error("编辑失败！", U("Category/listtdk"));
            }

        }else{
            $catid = I('get.catid', 0, 'intval');
            $data = getCategory($catid,'',true);
            $setting = $data['setting'];
            $this->assign("data", $data);
            $this->display();

        }
         
    }
    
    /* 
     * 检查分类名字是否重复
     * 一级栏目不要求有重复,二级，三级可重复
     * 
     * @param catname string 栏目名称
     * @return boolen
     * @author cx
     * @time 20160614
     * 
     *  */
    
     
    public function checkcatname(){
        
        $catname = I('catname');
        
        $check = M('category')->where(" parentid=0 and catname='".$catname."'")->find();
        if($check){
            echo 1;die;
        }else{
            echo 0;die;
        }
     
    }
    
    public function changeismenu(){
        $id = I('id','','int');
        
        $category = M('category')->where("catid = $id")->find();
        
        if($category['ismenu'] ==1){
            $status =M('category')->where("catid= $id")->save(array('ismenu'=>0));
            if($status){
                $backdata['status'] =1;
                $backdata['msg'] ="<font color='red'>否</font>";
                echo json_encode($backdata);die;
            }else {
                $backdata['status'] =2;
                echo json_encode($backdata);die;
            }
        }else if ($category['ismenu'] ==0){
            $status = M('category')->where(" catid =$id")->save(array("ismenu"=>1));
            if($status){
                $backdata['status'] =1;
                $backdata['msg'] ="<font color='green'>是</font>";
                echo json_encode($backdata);die;
            }else {
                $backdata['status'] =2;
                echo json_encode($backdata);die;
            }
        }
        
    }
    
}