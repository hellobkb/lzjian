<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: zckop <304400612@qq.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController;
/**
 * 属性列表
 */
class ZckopController extends HomebaseController {

    public $ModuleBlocks;
    public $argu;
    public $id;

    public function _initialize() {
        if(!$_SESSION['ADMIN_ID']){
            $this->error('login');
        }
        parent::_initialize();
        $this->id = I('get.id')?I('get.id'):I('post.id');
        if(!empty($this->id)){
            $this->ModuleBlocks = M('ModuleBlocks')->field(true)->where("id='$this->id'")->find();
            $this->ModuleBlocks['content'] = json_decode($this->ModuleBlocks['content'],true);
            $this->argu = $this->ModuleBlocks['content']['zcmsg']['attr']['argu'];
            $this->assign('ModuleBlocks',$this->ModuleBlocks);
        }

        $this->assign('action',U(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME));
    }

    public function __call($fun,$args){
        if(!empty($args)&&$args[0]['zcxz']==1)$zcxz=true;
        $arr = explode('_',$fun);
        $sign = explode('-',$arr[1]);
        switch ($sign[0]) {
            case 'list':
                if(IS_POST){
                    $post = I('post.');
                    $id = intval($this->id);
                    if($id){
                        $content = $this->ModuleBlocks['content'];
                        $content['zcmsg']['attr']['argu']['limit'] = intval($post['limit']);
                        $data = array();
                        $data['title'] = $post['title'];
                        $data['content'] = json_encode($content);

                        M('ModuleBlocks')->where("id=$id")->save($data);
                        $status = json_encode(array('status'=>1,'msg'=>'修改列表成功'));
                        echo $status;
                        exit;
                    }elseif($post['zcxz']){
                        // 摘自分类
                        $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                        $data = array();
                        $data['module'] = 'Zckop';
                        $data['action'] = $post['zcxz']['zcsign'];
                        $uniqid = uniqid();
                        $data['alias'] = 'zc_'.$uniqid;
                        $data['title'] = $post['title'];
                        $data['show_title'] = $post['show_title']?1:0;
                        $data['rsign'] = $post['zcxz']['currpos'];
                        $data['content'] = json_encode(array(
                            'zcmsg'=>array(
                                    'edit'=>array(
                                            'url'=>'index.php?g=Content&m=Contentshow&a=classlist',
                                            'title'=>'内容编辑',
                                            'width'=>900,
                                            'height'=>700
                                        ),
                                    'attr'=>array(
                                            'title'=>'属性',
                                            'argu'=>array(
                                                'title_link'=>'',
                                                'limit'=>$post['limit']
                                                )
                                        ),
                                    'modelid'=>$post['modelid'],
                                )
                            ));
                        $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];

                        M('ModuleBlocks')->add($data);
                        // 保存布局
                        $bcbj = array();
                        $bcbj['sign'] = $post['zcxz']['currpos'];
                        $bcbj['zc'] = explode(',',str_replace($arr[0].$arr[1],$uniqid,$post['zcxz']['zczjd']));
                        A('Portal/Index')->zc($bcbj);

                        $status = json_encode(array('status'=>1,'msg'=>'添加列表成功'));
                        echo $status;
                        exit;
                    }
                }

                $str = '<tr>';
                $str .= '<td>显示信息数：</td>';
                $str .= '<td><input name="limit" type="text" value="'.$this->argu['limit'].'"></td>';
                $str .= '</tr>';
                if(isset($zcxz)){
                    $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args[0])).'\'>';
                    $str .= '<input type="hidden" name="modelid" value="'.$args[0]['modelid'].'" />';
                }else{
                    $str .= '<input name="id" type="hidden" value="'.I('get.id').'">';
                }

                if(isset($args[0]['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args[0]['zcsign']));

                break;
            case 'category':
                if(IS_POST){
                    $post = I('post.');
                    $id = intval($this->id);
                    if($id){
                        $content = $this->ModuleBlocks['content'];
                        $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                        $data = array();
                        $data['title'] = $post['title'];
                        $data['content'] = json_encode($content);
                        $data['hash'] = $post['dispallpg']?'_ALL':$post['hash'];

                        M('ModuleBlocks')->where("id=$id")->save($data);
                        $status = json_encode(array('status'=>1,'msg'=>'修改分类成功'));
                        echo $status;
                        exit;
                    }elseif($post['zcxz']){
                        $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                        $data = array();
                        $data['module'] = 'Zckop';
                        $data['action'] = $post['zcxz']['zcsign'];
                        $uniqid = uniqid();
                        $data['alias'] = 'zc_'.$uniqid;
                        $data['title'] = $post['title'];
                        $data['show_title'] = $post['show_title']?1:0;
                        $data['rsign'] = $post['zcxz']['currpos'];
                        $data['content'] = json_encode(array(
                            'zcmsg'=>array(
                                    'edit'=>array(
                                            'url'=>U('Portal/AdminTerm/index'),
                                            'title'=>'内容编辑',
                                            'width'=>1000,
                                            'height'=>700
                                        ),
                                    'attr'=>array(
                                            'title'=>'属性',
                                            'argu'=>array(
                                                'title_link'=>''
                                                )
                                        )
                                )
                            ));
                        $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];

                        M('ModuleBlocks')->add($data);
                        // 保存布局
                        $bcbj = array();
                        $bcbj['sign'] = $post['zcxz']['currpos'];
                        $bcbj['zc'] = explode(',',str_replace($arr[0].$arr[1],$uniqid,$post['zcxz']['zczjd']));
                        A('Portal/Index')->zc($bcbj);
                        /*
                        先屏蔽，如果改名的话也自动创建将不容易找到前台问题
                        // 新加模型如果没有html则自动创建
                        $themes = C("SP_TMPL_PATH").C("SP_DEFAULT_THEME");
                        $file = $themes.'/'.'reanod/Zckop/'.$fun.'.html';
                        if(!is_file($file)){
                            touch($file);
                        }
                        */
                        $status = json_encode(array('status'=>1,'msg'=>'添加分类成功'));
                        echo $status;
                        exit;
                    }
                }

                if(isset($zcxz)){
                    $str = '<tr>';
                    $str .= '<td>标题链接：</td>';
                    $str .= '<td><input name="title_link" type="text"></td>';
                    $str .= '</tr>';
                    $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args[0])).'\'>';
                }else{
                    $str = '<tr>';
                    $str .= '<td>标题链接：</td>';
                    $str .= '<td><input name="title_link" type="text" value="'.$this->argu['title_link'].'"></td>';
                    $str .= '</tr>';
                    $str .= '<input name="id" type="hidden" value="'.$this->id.'">';
                }
                if(isset($args[0]['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args[0]['zcsign']));
                break;
            case 'new':
                if(IS_POST){

                    $post = I('post.');
                    $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                    $content = $this->ModuleBlocks['content'];
                    if(is_array($post['catid']))
                        $catid = implode(',',$post['catid']);
                    else
                        $catid = $post['catid'];
                    $content['zcmsg']['edit']['url'] = U('Content/Contentshow/classlist',array('catid'=>$catid));
                    $content['zcmsg']['attr']['argu']['catid'] = $catid;
                    $content['zcmsg']['attr']['argu']['limit'] = intval($post['limit']);
                    $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                    $data = array();
                    if($post['zcxz']){
                        $content['zcmsg']['edit'] = array(
                                        'url'=>U('Content/Contentshow/classlist',array('catid'=>$catid)),
                                        'title'=>'内容编辑',
                                        'width'=>900,
                                        'height'=>700
                                        );
                        $content['zcmsg']['attr']['title'] = '属性';
                        $content['zcmsg']['attr']['argu']['modelid'] = $post['modelid'];
                        $data['module'] = 'Zckop';
                        $data['action'] = $post['zcxz']['zcsign'];
                        $uniqid = uniqid();
                        $data['alias'] = 'zc_'.$uniqid;
                        $data['title'] = $post['title'];
                        $data['show_title'] = $post['show_title']?1:0;
                        $data['rsign'] = $post['zcxz']['currpos'];
                        $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];
                    }

                    $data['title'] = $post['title'];
                    $data['content'] = json_encode($content);
                    if($post['zcxz']){
                        $rs = M('ModuleBlocks')->add($data);

                        // 保存布局
                        $bcbj = array();
                        $bcbj['sign'] = $post['zcxz']['currpos'];
                        $bcbj['zc'] = explode(',',str_replace($arr[0].$arr[1],$uniqid,$post['zcxz']['zczjd']));
                        A('Portal/Index')->zc($bcbj);
                        if($rs !== false){
                            $status = json_encode(array('status'=>1,'msg'=>'增加最新成功'));
                            echo $status;
                        }
                    }else{
                        $rs = M('ModuleBlocks')->where("id='$this->id'")->save($data);
                        if($rs !== false){
                            $status = json_encode(array('status'=>1,'msg'=>'修改最新成功'));
                            echo $status;
                        }
                    }

                    exit;
                }

                $str = '<tr>';
                $str .= '<td>标题链接：</td>';
                $str .= '<td><input name="title_link" type="text" value="'.$this->argu['title_link'].'"></td>';
                $str .= '</tr>';
                if($this->argu['catid']){
                    $str .= '<tr>';
                    $str .= '<td>分类：</td>';
                    $category = zc_modellist($this->argu['modelid']);
                    $argu = ','.$this->argu['catid'].',';
                    $str .= '<td><select name="catid" multiple="multiple" size="8">';
                    foreach($category as $v){
                        if(stristr($argu,','.$v['catid'].',') !== false){
                            $selected = "selected='selected'";
                        }else{
                            $selected = "";
                        }
                        $str .='<option '.$selected.' value ="'.$v['catid'].'">'.str_repeat("&nbsp;",$v['lev']*2).$v['catname'].'</option>';
                    }
                    $str .= '</select></td>';
                    $str .= '</tr>';
                }else{
                    $str .= '<tr>';
                    $str .= '<td>分类：</td>';
                    $category = zc_modellist($args[0]['modelid']);
                    $str .= '<td><select name="catid" multiple="multiple" size="8">';
                    foreach($category as $v){
                        $str .='<option '.$selected.' value ="'.$v['catid'].'">'.str_repeat("&nbsp;",$v['lev']*2).$v['catname'].'</option>';
                    }
                    $str .= '</select></td>';
                    $str .= '</tr>';
                }
                $str .= '<tr>';
                $str .= '<td>显示条数：</td>';
                $str .= '<td><input name="limit" type="text" value="'.$this->argu['limit'].'"></td>';
                $str .= '</tr>';
                $str .= '<input name="id" type="hidden" value="'.I('get.id').'">';
                if(isset($zcxz)){
                    $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args[0])).'\'>';
                    $str .= '<input type="hidden" name="modelid" value="'.$args[0]['modelid'].'" />';
                }
                if(isset($args[0]['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args[0]['zcsign']));

                break;
            case 'hot':
                if(IS_POST){

                    $post = I('post.');
                    $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                    $content = $this->ModuleBlocks['content'];
                    if(is_array($post['catid']))
                        $catid = implode(',',$post['catid']);
                    else
                        $catid = $post['catid'];
                    $content['zcmsg']['edit']['url'] = U('Content/Contentshow/classlist',array('catid'=>$catid));
                    $content['zcmsg']['attr']['argu']['catid'] = $catid;
                    $content['zcmsg']['attr']['argu']['limit'] = intval($post['limit']);
                    $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                    $data = array();
                    if($post['zcxz']){
                        $content['zcmsg']['edit'] = array(
                                        'title'=>'内容编辑',
                                        'width'=>900,
                                        'height'=>700
                                        );
                        $content['zcmsg']['attr']['title'] = '属性';
                        $content['zcmsg']['attr']['argu']['modelid'] = $post['modelid'];
                        $data['module'] = 'Zckop';
                        $data['action'] = $post['zcxz']['zcsign'];
                        $uniqid = uniqid();
                        $data['alias'] = 'zc_'.$uniqid;
                        $data['title'] = $post['title'];
                        $data['show_title'] = $post['show_title']?1:0;
                        $data['rsign'] = $post['zcxz']['currpos'];
                        $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];
                    }

                    $data['title'] = $post['title'];
                    $data['content'] = json_encode($content);
                    if($post['zcxz']){
                        $rs = M('ModuleBlocks')->add($data);

                        // 保存布局
                        $bcbj = array();
                        $bcbj['sign'] = $post['zcxz']['currpos'];
                        $bcbj['zc'] = explode(',',str_replace($arr[0].$arr[1],$uniqid,$post['zcxz']['zczjd']));
                        A('Portal/Index')->zc($bcbj);
                        if($rs !== false){
                            $status = json_encode(array('status'=>1,'msg'=>'增加最热成功'));
                            echo $status;
                        }
                    }else{
                         $rs = M('ModuleBlocks')->where("id='$this->id'")->save($data);
                        if($rs !== false){
                            $status = json_encode(array('status'=>1,'msg'=>'修改最热成功'));
                            echo $status;
                        }
                    }

                    exit;
                }

                $str = '<tr>';
                $str .= '<td>标题链接：</td>';
                $str .= '<td><input name="title_link" type="text" value="'.$this->argu['title_link'].'"></td>';
                $str .= '</tr>';
                if($this->argu['catid']){
                    $str .= '<tr>';
                    $str .= '<td>分类：</td>';
                    $category = zc_modellist($this->argu['modelid']);
                    $argu = ','.$this->argu['catid'].',';
                    $str .= '<td><select name="catid" multiple="multiple" size="8">';
                    foreach($category as $v){
                        if(stristr($argu,','.$v['catid'].',') !== false){
                            $selected = "selected='selected'";
                        }else{
                            $selected = "";
                        }
                        $str .='<option '.$selected.' value ="'.$v['catid'].'">'.str_repeat("&nbsp;",$v['lev']*2).$v['catname'].'</option>';
                    }
                    $str .= '</select></td>';
                    $str .= '</tr>';
                }else{
                    $str .= '<tr>';
                    $str .= '<td>分类：</td>';
                    $category = zc_modellist($args[0]['modelid']);
                    $str .= '<td><select name="catid" multiple="multiple" size="8">';
                    foreach($category as $v){
                        $str .='<option '.$selected.' value ="'.$v['catid'].'">'.str_repeat("&nbsp;",$v['lev']*2).$v['catname'].'</option>';
                    }
                    $str .= '</select></td>';
                    $str .= '</tr>';
                }
                $str .= '<tr>';
                $str .= '<td>显示条数：</td>';
                $str .= '<td><input name="limit" type="text" value="'.$this->argu['limit'].'"></td>';
                $str .= '</tr>';
                $str .= '<input name="id" type="hidden" value="'.I('get.id').'">';
                if(isset($zcxz)){
                    $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args[0])).'\'>';
                    $str .= '<input type="hidden" name="modelid" value="'.$args[0]['modelid'].'" />';
                }
                if(isset($args[0]['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args[0]['zcsign']));

                break;

                default:
                    // var_dump($fun,$args);
                    break;

        }

        $this->assign('str',$str);
        $this->display('Public@/reanod/attr');
    }

    // 添加单页
    function single_page($args=''){
        $id = intval($this->id);
        if(IS_POST){
            $post = I('post.');
            if($post['zcxz']){
                $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                $data = array();
                $data['module'] = 'Zckop';
                $data['action'] = $post['zcxz']['zcsign'];
                $uniqid = uniqid();
                $data['alias'] = 'zc_'.$uniqid;
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['rsign'] = $post['zcxz']['currpos'];
                $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];
                $data['content'] = json_encode(array(
                            'zcmsg'=>array(
                                    'edit'=>array(
                                            'url'=>U('Content/Contentshow/pagedit',array('catid'=>$post['catid'])),
                                            'title'=>'内容编辑',
                                            'width'=>900,
                                            'height'=>700
                                        ),
                                    'attr'=>array(
                                            'title'=>'属性',
                                            'argu'=>array(
                                                'title_link'=>$post['title_link'],
                                                'catid'=>$post['catid']
                                                )
                                        )
                                ),
                            'strnum'=>$post['strnum']
                            )
                );

                $rs = M('ModuleBlocks')->add($data);

                // 保存布局
                $bcbj = array();
                $bcbj['sign'] = $post['zcxz']['currpos'];
                $bcbj['zc'] = explode(',',str_replace('singlepage',$uniqid,$post['zcxz']['zczjd']));
                A('Portal/Index')->zc($bcbj);
                if($rs !== false){
                    $status = json_encode(array('status'=>1,'msg'=>'增加单页成功'));
                    echo $status;
                }

            }elseif($id){
                $content = $this->ModuleBlocks['content'];
                $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                $data = array();
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['content'] = json_encode($content);
                $data['hash'] = $post['dispallpg']?'_ALL':$post['hash'];
                M('ModuleBlocks')->where("id=$id")->save($data);
                $status = json_encode(array('status'=>1,'msg'=>'修改单页成功'));
                echo $status;
            }

            exit;
        }
        $str = '<tr>';
        $str .= '<td>单页内容</td>';
        $str .= '<td><select name="catid">';
        $page = zc_modellist(0);
        if($id){
            foreach($page as $v){
                if($v['catid'] == $this->argu['catid']){
                    $selected = "selected='selected'";
                }else{
                    $selected = "";
                }
                $str .= '<option value="'.$v['catid'].'" '.$selected.'>'.$v['catname'].'</option>';
            }
        }elseif($args['zcxz']){
            foreach($page as $v){
                $str .= '<option value="'.$v['catid'].'">'.$v['catname'].'</option>';
            }
        }

        $str .= '</select></td>';
        $str .= '</tr>';
        $str .= '<tr>';
        $str .= '<tr>';
        $str .= '<td>标题链接：</td>';
        $str .= '<td><input name="title_link" type="text" value="'.$this->argu['title_link'].'"></td>';
        $str .= '</tr>';
        $str .= '<td>显示字符数：</td>';
        $str .= '<td><input name="strnum" type="text" value="'.$this->ModuleBlocks['content']['strnum'].'"></td>';
        $str .= '</tr>';
        $str .= '<input name="id" type="hidden" value="'.$this->id.'">';

        if(isset($args['zcxz'])){
            $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args)).'\'>';
        }
        if(isset($args['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args['zcsign']));

        $this->assign('str',$str);
        $this->display('Public@/reanod/attr');

    }

    // 联系方式
    public function contact_information($args=''){
        $id = intval($this->id);
        if(IS_POST){
            $post = I('post.');
            if($id){
                $content = $this->ModuleBlocks['content'];
                $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                $data = array();
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['content'] = json_encode($content);
                $data['hash'] = $post['dispallpg']?'_ALL':$post['hash'];
                M('ModuleBlocks')->where("id=$id")->save($data);
                $status = json_encode(array('status'=>1,'msg'=>'修改分类成功'));
                echo $status;
            }elseif($post['zcxz']){
                $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                $data = array();
                $data['module'] = 'Zckop';
                $data['action'] = $post['zcxz']['zcsign'];
                $uniqid = uniqid();
                $data['alias'] = 'zc_'.$uniqid;
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['rsign'] = $post['zcxz']['currpos'];
                $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];
                $data['content'] = json_encode(array(
                            'zcmsg'=>array(
                                    'attr'=>array(
                                            'title'=>'属性',
                                            'argu'=>array(
                                                'title_link'=>$post['title_link']
                                                )
                                        )
                                )
                            )
                );

                $rs = M('ModuleBlocks')->add($data);

                // 保存布局
                $bcbj = array();
                $bcbj['sign'] = $post['zcxz']['currpos'];
                $bcbj['zc'] = explode(',',str_replace('contactinformation',$uniqid,$post['zcxz']['zczjd']));
                A('Portal/Index')->zc($bcbj);
                if($rs !== false){
                    $status = json_encode(array('status'=>1,'msg'=>'增加联系我们成功'));
                    echo $status;
                }
            }

            exit;
        }
        $str = '<tr>';
        $str .= '<td>标题链接：</td>';
        $str .= '<td><input name="title_link" type="text" value="'.$this->argu['title_link'].'"></td>';
        $str .= '</tr>';
        $str .= '<input name="id" type="hidden" value="'.$this->id.'">';
        if(isset($args['zcxz'])){
            $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args)).'\'>';
        }
        if(isset($args['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args['zcsign']));

        $this->assign('str',$str);
        $this->display('Public@/reanod/attr');
    }

    // 友情连接
    public function friendly_links($args=''){
        $id = intval($this->id);
        if(IS_POST){
            $post = I('post.');
            if($id){
                $content = $this->ModuleBlocks['content'];
                $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                $data = array();
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['content'] = json_encode($content);
                $data['hash'] = $post['dispallpg']?'_ALL':$post['hash'];
                M('ModuleBlocks')->where("id=$id")->save($data);
                $status = json_encode(array('status'=>1,'msg'=>'修改联系我们成功'));
                echo $status;
            }elseif($post['zcxz']){
                $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                $data = array();
                $data['module'] = 'Zckop';
                $data['action'] = $post['zcxz']['zcsign'];
                $uniqid = uniqid();
                $data['alias'] = 'zc_'.$uniqid;
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['rsign'] = $post['zcxz']['currpos'];
                $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];
                $data['content'] = json_encode(array(
                    'zcmsg'=>array(
                            'edit'=>array(
                                    'url'=>U('Admin/Link/index'),
                                    'title'=>'内容编辑',
                                    'width'=>1000,
                                    'height'=>700
                                ),
                            'attr'=>array(
                                    'title'=>'属性'
                                )
                        )
                    ));

                $rs = M('ModuleBlocks')->add($data);

                // 保存布局
                $bcbj = array();
                $bcbj['sign'] = $post['zcxz']['currpos'];
                $bcbj['zc'] = explode(',',str_replace('friendlylinks',$uniqid,$post['zcxz']['zczjd']));
                A('Portal/Index')->zc($bcbj);
                if($rs !== false){
                    $status = json_encode(array('status'=>1,'msg'=>'增加联系我们成功'));
                    echo $status;
                }
            }

            exit;
        }

        $str = '<input name="id" type="hidden" value="'.$this->id.'">';
        if(isset($args['zcxz'])){
            $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args)).'\'>';
        }
        if(isset($args['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args['zcsign']));

        $this->assign('str',$str);
        $this->display('Public@/reanod/attr');
    }

    // 自定义html
    public function html($args=''){
        $id = intval($this->id);
        if(IS_POST){
            $post = I('post.');
            if($id){
                $content = $this->ModuleBlocks['content'];
                $content['zcmsg']['attr']['argu']['title_link'] = $post['title_link'];
                $content['zcmsg']['attr']['argu']['zchtml'] = $post['zchtml'];
                $data = array();
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['content'] = json_encode($content);
                $data['hash'] = $post['dispallpg']?'_ALL':$post['hash'];
                M('ModuleBlocks')->where("id=$id")->save($data);
                $status = json_encode(array('status'=>1,'msg'=>'修改html成功'));
                echo $status;
            }elseif($post['zcxz']){
                $post['zcxz'] = json_decode(urldecode($post['zcxz']),true);
                $data = array();
                $data['module'] = 'Zckop';
                $data['action'] = $post['zcxz']['zcsign'];
                $uniqid = uniqid();
                $data['alias'] = 'zc_'.$uniqid;
                $data['title'] = $post['title'];
                $data['show_title'] = $post['show_title']?1:0;
                $data['rsign'] = $post['zcxz']['currpos'];
                $data['hash'] = $post['dispallpg']?'_ALL':$post['zcxz']['hash'];
                $data['content'] = json_encode(array(
                    'zcmsg'=>array(
                            'attr'=>array(
                                    'title'=>'属性',
                                    'argu'=>array(
                                        'title_link'=>$post['title_link'],
                                        'zchtml'=>$post['zchtml']
                                        )
                                )
                        )
                    ));

                $rs = M('ModuleBlocks')->add($data);

                // 保存布局
                $bcbj = array();
                $bcbj['sign'] = $post['zcxz']['currpos'];
                $bcbj['zc'] = explode(',',str_replace('html',$uniqid,$post['zcxz']['zczjd']));
                A('Portal/Index')->zc($bcbj);
                if($rs !== false){
                    $status = json_encode(array('status'=>1,'msg'=>'增加html我们成功'));
                    echo $status;
                }
            }

            exit;
        }
        $str = '<tr>';
        $str .= '<td>标题链接：</td>';
        $str .= '<td><input name="title_link" type="text" value="'.$this->argu['title_link'].'"></td>';
        $str .= '</tr>';
        $str .= '<input name="id" type="hidden" value="'.$this->id.'">';
        $str .= '<tr><td>html内容：</td><td><textarea name="zchtml" rows="10" cols="50">'.$this->argu['zchtml'].'</textarea></td></tr>';
        if(isset($args['zcxz'])){
            $str .= '<input name="zcxz" type="hidden" value=\''.urlencode(json_encode($args)).'\'>';
        }
        if(isset($args['zcsign']))$this->assign('action',U('Portal/Zckop/'.$args['zcsign']));

        $this->assign('str',$str);
        $this->display('Public@/reanod/attr');
    }

    //logo
    public function show_image(){
         if(IS_POST){
            $post = I('post.');
            $id = intval($this->id);
            if(!$id){
                echo 'no';
                exit;
            }
            $content = $this->ModuleBlocks['content'];
            $content['zcmsg']['attr']['argu']['alt'] = $post['alt'];
            $data = array();
            $data['title'] = $post['title'];
            $data['content'] = json_encode($content);

            M('ModuleBlocks')->where("id=$id")->save($data);
            echo 'ok';
            exit;
        }

        $str = '<tr>';
        $str .= '<td>alt属性</td>';
        $str .= '<td><input name="alt" type="text" value="'.$this->argu['alt'].'"></td>';
        $str .= '</tr>';
        $str .= '<input name="id" type="hidden" value="'.$this->id.'">';
        $this->assign('str',$str);
       $this->display('Public@/reanod/attr');
    }


    //logo修改
    public function logo(){
        echo 'logo';
    }

    //底部修改
    public function foot(){
        echo 'foot';
    }

}