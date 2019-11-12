<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class IndexController extends HomebaseController {
    
    //首页
    public function index() {
        $ads = getPsitionAds(1);
        $this->assign('ads',$ads);
        $this->assign('home',1);
        $this->display(":index");
    }

    //保存布局
    public function zc($bcbj=''){
        if(!$_SESSION['ADMIN_ID']){
            $this->error('login');
        }
        $post = $bcbj?$bcbj:I('post.');
        $data = array();
        $data['rsign'] = $post['sign'];
        $ModuleBlocks = M('ModuleBlocks');
        $i = 1;
        foreach($post['zc'] as $v){
            $data['listorder'] = $i++;
            $ModuleBlocks->where('alias="zc_'.$v.'"')->save($data);
        }

        if(empty($bcbj)){
            echo 'ok';
        }else{
            return 'ok';
        }
    }

    // 新增模块
    public function kop(){
        if(!$_SESSION['ADMIN_ID']){
            $this->error('login');
        }
        $get = I('get.');
        $zcsign1 = explode('_', $get['zcsign']);
        $zcsign2 = str_replace('_','', $get['zcsign']);
        $get['zcxz'] = 1;

        A('Portal/Zckop')->$get['zcsign']($get);
    }

    
    /*
    * 得到网站地图
    *  @nbsp string 分类之间的分隔符
    *  @author cx
    *  @time 20160604
    *  return string
    * */
    
  public function getMap(){
        $nbsp="&nbsp;&nbsp;";
        $data = S("Category");
        $result = zc_children_more($data);
        $string = "";
    
        foreach($result as $key=>$value){
                
            $string .="<a href=".$value['url'].">".$value['catname']."</a>";
                
            if($value['child']){
                $string .=":<br><div>";
                foreach($value['child'] as $k=>$v){
                    $string.="<a href=".$v['url'].">".$v['catname']."</a>".$nbsp;
                }
                $string .="</div><br>";

            }else{
                $string .="<br>";
            }
        }

        $this->assign('string',$string);
        $this->display(":getmap");
    }
  public function error_html()
    {
        $this->display(":404");
    }

}


