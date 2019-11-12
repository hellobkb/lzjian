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
class ContentsController extends AdminbaseController {
	protected $menu_model;
    protected $auth_rule_model;

    function _initialize() {
        parent::_initialize();
        $this->category =M("Category");
        $this->auth_rule_model = D("Common/AuthRule");

        $this->tree = new \Common\Lib\Tree();
        $this->Url = new \Common\Lib\Url();
        $this->iconvfunc = new \Common\Lib\iconvfunc();
    }

    public function _empty(){
        $this->index();
    }
    
     /**
     *  显示菜单
     */
  
    public function index() {
        $modelid = I('modelid');
        $this->assign('modelid',$modelid);
        $result = M('Category')->select();
        $result = zc_llnrgl($result,$modelid);
        if(empty($result)){
            $this->error('栏目不存在！',U('Admin/Main/index'));
        }
        $data = array();
        foreach ($result as $key => $val) {
            if($val['parentid'] == 0){
                $data['catid'][] = $val['catid'];
                $data['type'] = $val['type'];
            }
        }

        $this->assign('data',$data);
        $this->display('index');

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


    //左侧导航
    /*public function public_category(){
        $modelid = I('modelid');
        $result = M('Category')->select();
        $result = zc_llnrgl($result,$modelid);

        $tree = new \Common\Lib\Tree();
        $tree->icon = array('&nbsp;&nbsp;│ ', '&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;└─ ');
        $tree->nbsp = '&nbsp;&nbsp;';
        $newmenus=array();
        foreach ($result as $m){
            $newmenus[$m['catid']]=$m;
        }$result=$newmenus;
        foreach ($result as $n=> $r) {
                if($r['type'] != 2){
                    $result[$n]['level'] = $this->_get_level($r['catid'], $newmenus);
                    $result[$n]['parentid_node'] = ($r['parentid']) ? " class='child-of-node-".$r['parentid']."'" : '';
                    $result[$n]['catname'] = $r['catname'] ;

                    if($r['child'] == 0 && $r['type'] == 0){
                       $result[$n]['str_manage'] = U("Contentshow/classlist", array("catid" => $r['catid'])); 
                    }else if($r['child'] == 1 && $r['type'] == 0){
                        $result[$n]['str_manage'] = U("Contentshow/classlist", array("catid" => $r['catid'])); 
                    }else{
                        $result[$n]['str_manage'] = '';
                    }
                    if($r['type'] == 1){
                       $result[$n]['str_manage'] = U("Contentshow/pagedit", array("catid" => $r['catid'])); 
                    }

                }
        }
        $tree->init($result);
        $str = "<tr id='node-\$catid' \$parentid_node>
                    <td>\$spacer <a target='right' class='zciframe' href='\$str_manage'> \$catname </a></td>
                   
                </tr>";
        $categorys = $tree->get_tree(0, $str);
        if(empty($categorys))$categorys='暂无内容';
        $this->assign("categorys", $categorys);

        $this->display();
    }*/

    public function public_category(){

        $modelid = I('modelid');
        $result = M('Category')->select();

        $result = zc_llnrgl($result,$modelid);
        $result_count = count($result);

        $newmenus=array();
        foreach ($result as $m){
            $newmenus[$m['catid']]=$m;
        }$result=$newmenus;

        foreach ($result as $n=> $r) {
            if($r['type'] != 2){
                $result[$n]['level'] = $this->_get_level($r['catid'], $newmenus);
                $result[$n]['parentid_node'] = ($r['parentid']) ? " class='child-of-node-".$r['parentid']."'" : '';
                $result[$n]['catname'] = $r['catname'] ;

                if($r['child'] == 0 && $r['type'] == 0){
                    $result[$n]['str_manage'] = U("Contentshow/classlist", array("catid" => $r['catid']));
                }else if($r['child'] == 1 && $r['type'] == 0){
                    $result[$n]['str_manage'] = U("Contentshow/classlist", array("catid" => $r['catid']));
                }else{
                    $result[$n]['str_manage'] = '';
                }
                if($r['type'] == 1){
                    $result[$n]['str_manage'] = U("Contentshow/pagedit", array("catid" => $r['catid']));
                }

            }
        }

        $str = "<tr id='node-\$id' \$parentid_node>
					<td>\$spacer <a target='right' class='zciframe' href='\$str_manage'> \$catname </a></td>
				</tr>";
        if (!empty($result) && is_array($result)) {


            $this->tree->init($result);

            $categorys = $this->tree->get_tree(0, $str);
        } else {
            $categorys = '暂无内容';
        }


        if(empty($categorys))$categorys='暂无内容';
        $this->assign("categorys", $categorys);
//        $this->assign("result", $result);
        if($result_count > 15){
            $this->display('public_category_zd');
        } else {
            $this->display();
        }

    }

    public function classlist() {
        $where = array();
        //查询条件
        $catids = I("catids");
        if($catids){
            $arr_catids = explode(',',$catids);
            foreach($arr_catids as $val){
                $map_arr['catid']=$val;
                $catInfos = M("Category")->where($map_arr)->find();
                $all_catids[] = $catInfos['arrchildid'];
            }
            $all_catids=implode(',', array_unique(explode(',',implode(',', $all_catids))));
            $modelid=$catInfos['modelid'];
            $where['catid'] = array('IN', $all_catids);
            $where['is_del'] = 0;
            //实例化模型
            $model_name=getModel($modelid, 'tablename');
            $model=M($model_name);
            //数量统计
            $sum = $model->where($where)->count();
            $checkSum = $model->where(array_merge($where, array('status' => 1)))->count();
            $this->assign('sum', $sum)->assign('checkSum', $checkSum);
        }elseif(I('modelid')){
            //当前栏目信息
            $modelid=I('modelid');
            //$where['modelid'] = $modelid;
            //实例化模型
            $model_name=getModel($modelid, 'tablename');
            $model=M($model_name);

        }else{
            //当前栏目信息
            $this->catid=I('catid')?I('catid'):$_POST['catid'];
            
            $map['catid']=I('catid');
            $catInfo = getCategory($map['catid']);
            $all_catids=$catInfo['arrchildid'];
            if (empty($catInfo)) {
                $this->error('该栏目不存在！', U('Content/Contents/index'));
            }
            //栏目所属模型
            $modelid = $catInfo['modelid'];
            //栏目扩展配置
            $setting = $catInfo['setting'];
            $where['catid'] = array('IN', $all_catids);
            $where['is_del'] = 0;
            //实例化模型
            $model_name=getModel($modelid, 'tablename');
            $model=M($model_name);
            //数量统计
            $sum = $model->where($where)->count();
            $checkSum = $model->where(array_merge($where, array('status' => 1)))->count();
            $this->assign('sum', $sum)->assign('checkSum', $checkSum);
        }
        //检查模型是否被禁用
        if (getModel($modelid, 'disabled')) {
            $this->error('模型被禁用！');
        }
        //搜索
        if(IS_POST){
                //添加开始时间
                $start_time = $_POST['start_time'];
                if (!empty($start_time)) {
                    $start_time = strtotime($start_time);
                    $where['inputtime'] = array("EGT", $start_time);
                    $this->assign('start_time', $_POST['start_time']);
                }
                //添加结束时间
                $end_time = $_POST['end_time'];
                if (!empty($end_time)) {
                    $end_time = strtotime($end_time);
                    $where['inputtime'] = array("LT", $end_time);
                    $this->assign('end_time', $_POST['end_time']);
                }
                if ($end_time > 0 && $start_time > 0) {
                    $where['inputtime'] = array(array('EGT', $start_time), array('LT', $end_time));
                }
                //搜索字段
                $searchtype = $_POST['searchtype'];
                //搜索关键字
                $keyword = $_POST['keyword'];
                if (!empty($keyword)) {
                    $this->assign("searchtype", $searchtype);
                    $this->assign("keyword", $keyword);
                    $type_array = array('title', 'description', 'username');
                    if ($searchtype < 3) {
                        $searchtype = $type_array[$searchtype];
                        $where[$searchtype] = array("LIKE", "%{$keyword}%");
                    } elseif ($searchtype == 3) {
                        $where["id"] = array("EQ", (int)$keyword);
                    }
                }
                //状态
                $status = $_POST['status'];
                if ($status) {
                    $where['status'] = array("EQ", $status);
                }
        }
        //信息总数
        if(!I('modelid')){
            if (empty($search)) {
                $count = $sum;
            } else {
                $count = $model->where($where)->count();
            }
            $page = $this->page($count, 20);
            $this->assign('Page', $page->show());
        }
        //置顶
        if(I("istop")){$order['istop']='desc';}else{$order['listorder']='desc';}
        //推荐
        if(I("recommend")){$order['recommend']='desc';}else{$order['listorder']='desc';}
        $px = I('order');
        if($px)$order = "listorder $px,id $px";
        else $order = 'listorder desc,id desc';
        $where['is_del'] = 0;
        $data = $model->where($where)->limit($page->firstRow . ',' . $page->listRows)->order($order)->select();
        //模板处理
        $template = '';
        //自定义列表
        if (!empty($setting['list_customtemplate'])) {
            $template = "Listtemplate:{$setting['list_customtemplate']}";
        }
        //选择分类
        if($catInfo['child'] == 1){
            $sons = array_splice(explode(',', $catInfo['arrchildid']),1);
            foreach($sons as $val){
                $catinfo_son[] = M('Category')->where(array('catid'=>$val,'child'=>0))->field('catid,catname')->find();
            }
            $catinfo_son = array_filter($catinfo_son);
        }
        $catinfo_son = get_catgory_son($this->catid);

        

        $this->assign($catInfo)
            ->assign('catid', $this->catid)
            ->assign('count', $count)
            ->assign('catinfo_son',$catinfo_son)
            ->assign('data', $data)
            ->assign('modelid', $modelid);
         
        $this->display();
    }

    //单页信息 
    public function pagedit() {
            $catid = I('catid');
            if(is_array($catid)){
                $catid = $catid[0];
            }
            
            //默认部分
            $option=M("Options")->where("option_name='site_options'")->find();
            $option_info =(array)json_decode($option['option_value']);
            $list_title_mo = $option_info['list_title_h'];//title默认部分
            $list_desc_mo = $option_info['list_desc_z'];//description句型默认部分
        if($_POST){
            $article=I("post.post");
            //关键词设置
            $map['catid']=$article['catid'];
            $tdk = M('Tdks')->where($map)->find();
            $seodescription_info = unserialize($tdk['description']);
            $infopage = M('Page')->where(array('catid'=>$article['catid']))->find();
             //相册图集
            foreach ($_POST['photos_url'] as $key=>$url){
                $photourl=sp_asset_relative_url($url);
                $_POST['photo'][]=array("url"=>$photourl,"alt"=>$_POST['photos_alt'][$key]);
            }
            $article['photo']=json_encode($_POST['photo']);
            $article['seotitle']=$article['seotitle'];
            $article['seokeywords']=$article['seokeywords'];
            if($seodescription_info['is_write'] != 1){
                $in_desc['des1']=$_POST['des1'];
                $in_desc['desc_mo']=$_POST['desc_mo'];
                $in_desc['des2']=$_POST['des2'];
                $in_desc['des3']=$_POST['des3'];
                $in_desc['des4']=$_POST['des4'];
                $article['seodescription']=json_encode($in_desc);
               
            }else{
                $article['seodescription']=$article['seodescription'];
            }
            if($infopage){
                $article['title']=$article['title'];
                $article['intro']=$article['intro'];
                $article['content']=htmlspecialchars_decode($article['content']);
                $_POST['smeta']['thumb'] = sp_asset_relative_url($_POST['smeta']['thumb']);
                $article['thumb']=$_POST['smeta']['thumb'];
                $article['updatetime']=time();
                $result=M('Page')->where(array('catid'=>$article['catid']))->save($article);
                if($result){
                    adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_SAVE').$article['title']);
                    $this->success("保存成功！");
                }else{
                    $this->error("保存失败！");
                }
            }else{
                $article['catid']=$article['catid'];
                $article['title']=$article['title'];
                $article['intro']=$article['intro'];
                $article['content']=htmlspecialchars_decode($article['content']);
                $_POST['smeta']['thumb'] = sp_asset_relative_url($_POST['smeta']['thumb']);
                $article['thumb']=$_POST['smeta']['thumb'];
                $article['updatetime']=time();
                $result=M('Page')->add($article);
                if($result){
                    adminlog($_SESSION['ADMIN_ID'],L('ADMINLOG_ADD').$article['title']);
                    $this->success("添加成功！");
                }else{
                    $this->error("添加失败！");
                }

            }
        }else{
            //关键词设置
            $map['catid']=$catid;
            $tdk = M('Tdks')->where($map)->find();
            $seodescription_info = unserialize($tdk['description']);
            //单页信息
            $info = M('Page')->where(array('catid'=>$catid))->find();
            $info['photo'] = json_decode($info['photo'],true);
            if($seodescription_info['is_write'] == 0){
                $info_desc = json_decode($info['seodescription'],true);
                $descarr['des1']=$info_desc['des1'];
                $descarr['desc_mo']=$info_desc['desc_mo'];
                $descarr['des2']=$info_desc['des2'];
                $descarr['des3']=$info_desc['des3'];
                $descarr['des4']=$info_desc['des4'];
                $this->assign("descarr",$descarr);
            }
            $this->assign($info);
            $this->assign("catid",$catid);
            $this->assign("seodescription_info",$seodescription_info);
            $this->assign("list_desc_mo",$list_desc_mo);
            $this->display();
        }
        
    }

}