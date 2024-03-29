<?php

// +----------------------------------------------------------------------

// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]

// +----------------------------------------------------------------------

// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.

// +----------------------------------------------------------------------

// | Author: Dean <zxxjjforever@163.com>

// +----------------------------------------------------------------------



namespace Content\Controller;

use Common\Controller\HomebaseController;

use Content\Model\ContentModel;



/**

 * 首页

 */

class PagedisController extends HomebaseController {



    public function _initialize(){

        parent::_initialize();

        $this->Url = new \Common\Lib\Url();

    }



    //列表

    //列表

    public function lists() {

        //栏目ID

        $catid = I('get.catid', 0, 'intval');

        //分页

        $page = isset($_GET[C("VAR_PAGE")]) ? $_GET[C("VAR_PAGE")] : 1;

        //获取栏目数据

        $category = getCategory($catid);

        if (empty($category)) {

            send_http_status(404);

            exit;

        }

        //栏目扩展配置信息

        $setting = $category['setting'];

        //检查是否禁止访问动态页

        if ($setting['listoffmoving']) {

            send_http_status(404);

            exit;

        }



		

        //生成静态分页数

        $repagenum = (int) $setting['repagenum'];

        if ($repagenum && !$GLOBALS['dynamicRules']) {

            //设置动态访问规则给page分页使用

            $GLOBALS['Rule_Static_Size'] = $repagenum;

            $GLOBALS['dynamicRules'] = CONFIG_SITEURL_MODEL . "index.php?a=lists&catid={$catid}&page=*";

        }

        //父目录

        $parentdir = $category['parentdir'];

        //目录

        $catdir = $category['catdir'];

        //生成路径

        $category_url = $this->Url->category_url($catid, $page);

        //取得URL规则

        $urls = $category_url['page'];

        //生成类型为0的栏目

        if ($category['type'] == 0) {

            //栏目首页模板

            $template = $setting['category_template'] ? $setting['category_template'] : 'category';

            //栏目列表页模板

            $template_list = $setting['list_template'] ? $setting['list_template'] : 'list';

            //判断使用模板类型，如果有子栏目使用频道页模板，终极栏目使用的是列表模板

            //$template = $category['child'] ? "Category/{$template}" : "List/{$template_list}";



            $count_arrchildid = count(explode(',', $category['arrchildid']));

            if($count_arrchildid > 1){

                $template = "Category/{$template}";

            }else{

                $template =  "List/{$template_list}";

            }





            //去除后缀开始

            $tpar = explode(".", $template, 2);

            //去除完后缀的模板

            $template = $tpar[0];

            unset($tpar);

            $GLOBALS['URLRULE'] = $urls;

        } else if ($category['type'] == 1) {//单页

            $db = D('Content/Page');

            $template = $setting['page_template'] ? $setting['page_template'] : 'page';

            //判断使用模板类型，如果有子栏目使用频道页模板，终极栏目使用的是列表模板

            $template = "Page/{$template}";

            //去除后缀开始

            $tpar = explode(".", $template, 2);

            //去除完后缀的模板

            $template = $tpar[0];

            unset($tpar);

            $GLOBALS['URLRULE'] = $urls;

            $info = $db->getPage($catid);

            $this->assign($category['setting']['extend']);

            $this->assign($info);

        }



        //把分页分配到模板

        $this->assign(C("VAR_PAGE"), $page);

        $this->assign('page', $page);

        //分配变量到模板

        $this->assign($category);

        //seo分配到模板

        $seo = seo($catid, $setting['meta_title'], $setting['meta_description'], $setting['meta_keywords']);

        $this->assign("SEO", $seo);

        if(I('get.catid') == $catid){

            if($pid = I('get.hcatid',0,'intval')){

                $pro = M('Product')->where('id='.$pid)->select();

            }elseif($pid = I('post.pro',0,'intval')){

                if(count($pid)){

                    $pid = implode(',',$pid);

                    $pro = M('Product')->where(array('id'=>array('in',$pid)))->select();

                }

            }elseif($zcpro = cookie('pro')){

                $zcpro = implode(',',$zcpro);

                $pro = M('Product')->where(array('id'=>array('in',$zcpro)))->select();

            }

            foreach ($pro as $key => $val) {

            	$pro_href[] = '<a href="'.$val['url'].'" title="'.$val['title'].'" target="_blank">'.$val['title'].'</a>';

            }

			if(I('get.hcatid')){

				$pid=I('get.hcatid');

				$pro = M('Product')->where(array('id'=>array('in',$pid)))->select();

				

				foreach ($pro as $key => $val) {

            	$pro_href2[] = '<a href="'.$val['url'].'" title="'.$val['title'].'"  target="_blank">'.$val['title'].'</a>';

            }

			}

			

            $f_href = implode('', $pro_href);

            $this->assign("pro_href",$pro_href);

			 $this->assign("pro_href2",$pro_href2['0']);

			

			//print_r($pro_href);exit;

            $this->assign('f_href',$f_href);

            $this->assign('pro',$pro);

			//print_r($pro);exit;

        }

        $this->display('/'.$template);

    }





   public function Inquiry(){

    	 

        $pro = cookie('pro');

        $coopro = I('request.pro');



        if(I('post.sign')=='del'){  //post 鎵归噺鎻愪氦

            if(is_array($coopro))

                $goods = array_diff($pro,$coopro);

            else

                $goods = $pro;

        }else{



            if(I("get.signdel") =='del'){ //鍗曚釜鍒犻櫎



                $tmp = $coopro;

                $coopro = array();

                $coopro[] = $tmp;

                

                $goods = array_diff($pro, $coopro);



            }else{

                if(count($pro) && count($coopro)){

                    $goods = array_unique(array_merge($pro,$coopro));

					 $linshi=$pro;

					

					

					if($pro)

					{	

					if(empty($goods))

					{

						

						 $goods =$linshi;

						}

					else

					{

						 $goods=array_unique(array_merge($goods,$linshi));

						}

					

					

						

						}

					else

					{

						 $goods = array_unique(array_merge($pro,$coopro));

				

					

					}

					

                }else{

                    if(count($pro))

                        $goods = $pro;

                    else

                        $goods = $coopro;

                }





            }

           

        }



        cookie('pro',$goods);

         

        if(count($goods)){

            $join = C('DB_PREFIX').'product_data as b on a.id=b.id';

            $data = M('Product')->alias('a')->join($join,'LEFT')->where(array('a.id'=>array('in',$goods)))->select();

        }else{

            $data = '';

        }

        $this->assign('data2',$data);

          $site_seo = get_site_options(); 
          $SEO = array();
          $SEO['title'] = $site_seo['site_seo_title'];
          $SEO['keyword'] = $site_seo['site_seo_keywords'];
          $SEO['description'] = $site_seo['site_seo_description'];
          $this->assign('SEO',$SEO);

        $this->display(inquiry);

    }



    public function _empty($a,$b) {

        $arction = explode('_',$a);

        if(method_exists($this,$arction[0])){

            $method = $arction[0];

            $this->$method();

        }

    }



    //内容页

    public function shows() {

        $catid = I('get.catid', 0, 'intval');

        $id = I('get.id', 0, 'intval');

        $page = intval($_GET[C("VAR_PAGE")]);

        $page = max($page, 1);

        //获取当前栏目数据

        $category = getCategory($catid);

        if (empty($category)) {

            send_http_status(404);

            exit;

        }



        //反序列化栏目配置

        $category['setting'] = $category['setting'];

        //检查是否禁止访问动态页

        if ($category['setting']['showoffmoving']) {

            send_http_status(404);

            exit;

        }

        //模型ID

        $modelid = $category['modelid'];

        $data = ContentModel::getInstance($modelid)->relation(true)->where(array("id" => $id, 'status' => 99))->find();

        if (empty($data)) {

            send_http_status(404);

            exit;

        }

        ContentModel::getInstance($modelid)->dataMerger($data);

        //分页方式

        if (isset($data['paginationtype'])) {

            //分页方式 

            $paginationtype = $data['paginationtype'];

            //自动分页字符数

            $maxcharperpage = (int) $data['maxcharperpage'];

        } else {

            //默认不分页

            $paginationtype = 0;

        }

        //tag

        tag('html_shwo_buildhtml', $data);

        $content_output = new \Content\Fields\content_output($modelid);

        //获取字段类型处理以后的数据

        $output_data = $content_output->get($data);

        $output_data['id'] = $id;

        $output_data['title'] = strip_tags($output_data['title']);

        //SEO

        $seo_keywords = '';

        if (!empty($output_data['keywords'])) {

            $seo_keywords = implode(',', $output_data['keywords']);

        }

        $seo = seo($catid, $output_data['title'], $output_data['description'], $seo_keywords);



        //内容页模板

        $template = $output_data['template'] ? $output_data['template'] : $category['setting']['show_template'];

        //去除模板文件后缀

        $newstempid = explode(".", $template);

        $template = $newstempid[0];

        unset($newstempid);

        //分页处理

        $pages = $titles = '';

        //分配解析后的文章数据到模板 

        $this->assign($output_data);

        //seo分配到模板

        $this->assign("SEO", $seo);

        //栏目ID

        $this->assign("catid", $catid);

        //分页生成处理

        

        //分页方式 0不分页 1自动分页 2手动分页



        if ($data['paginationtype'] > 0) {

            $urlrules = $this->Url->show($data, $page);

            //手动分页

            $CONTENT_POS = strpos($output_data['content'], '[page]');

            if ($CONTENT_POS !== false) {

                $contents = array_filter(explode('[page]', $output_data['content']));

                $pagenumber = count($contents);

                $pages = page($pagenumber, 1, $page, array(

                    'isrule' => true,

                    'rule' => $urlrules['page'],

                        ))->show("default");

                //判断[page]出现的位置是否在第一位 

                if ($CONTENT_POS < 7) {

                    $content = $contents[$page];

                } else {

                    $content = $contents[$page - 1];

                }

                //分页

                $this->assign("pages", $pages);

                $this->assign("content", $content);

            }

        } else {

            $this->assign("content", $output_data['content']);

        }//print_r($template);exit;

        $this->assign('modelid',$modelid);

        $this->assign("content", $output_data['content']);

        $this->display(":Show/{$template}");

    }



    //tags标签

    public function tags() {

        $tagid = I('get.tagid', 0, 'intval');

        $tag = I('get.tag', '', '');

        $where = array();

        if (!empty($tagid)) {

            $where['tagid'] = $tagid;

        } else if (!empty($tag)) {

            $where['tag'] = $tag;

        }

        //如果条件为空，则显示标签首页

        if (empty($where)) {

            $key = 'Tags_Index_index';

            $dataCache = S($key);

            if (empty($dataCache)) {

                $data = M('Tags')->order(array('hits' => 'DESC'))->limit(100)->select();

                if (!empty($data)) {

                    //查询每个tag最新的一条数据

                    $tagsContent = M('TagsContent');

                    foreach ($data as $k => $r) {

                        $url = $this->Url->tags($r);

                        $data[$k]['url'] = $url['url'];

                        $data[$k]['info'] = $tagsContent->where(array('tag' => $r['tag']))->order(array('updatetime' => 'DESC'))->find();

                    }

                    //进行缓存

                    S($key, $data, 3600);

                }

            } else {

                $data = $dataCache;

            }

            $SEO = seo('', '标签');

            //seo分配到模板

            $this->assign("SEO", $SEO);

            $this->assign('list', $data);

            $this->display("Tags/index");

            return true;

        }

        //分页号

        $page = isset($_GET[C("VAR_PAGE")]) ? $_GET[C("VAR_PAGE")] : 1;

        //根据条件获取tag信息

        $info = M('Tags')->where($where)->find();

        if (empty($info)) {

            $this->error('抱歉，沒有找到您需要的内容！');

        }

        //访问数+1

        M('Tags')->where($where)->setInc("hits");

        //更新最后访问时间

        M('Tags')->where($where)->save(array("lasthittime" => time()));

        $this->assign($data);

        $Urlrules = cache('Urlrules');

        //取得tag分页规则

        $urlrules = $Urlrules[self::$Cache['Config']['tagurl']];

        if (empty($urlrules)) {

            $urlrules = 'index.php?g=Tags&tagid={$tagid}|index.php?g=Tags&tagid={$tagid}&page={$page}';

        }else{

            $urlrules = $urlrules['urlrule'];

        }

        $GLOBALS['URLRULE'] = str_replace('|', '~', str_replace(array('{$tag}', '{$tagid}'), array($info['tag'], $info['tagid']), $urlrules));

        $SEO = seo();

        //seo分配到模板

        $this->assign("SEO", $SEO);

        //把分页分配到模板

        $this->assign(C("VAR_PAGE"), $page);

        $this->assign($info);

        $this->display("Tags/tag");

    }

}





