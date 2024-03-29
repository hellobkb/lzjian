<?php

// +----------------------------------------------------------------------
// | ShuipFCMS 搜索
// +----------------------------------------------------------------------
// | Copyright (c) 2012-2014 http://www.shuipfcms.com, All rights reserved.
// +----------------------------------------------------------------------
// | Author: 水平凡 <admin@abc3210.com>
// +----------------------------------------------------------------------

namespace Search\Controller;

use Common\Controller\HomebaseController;

class IndexController extends HomebaseController {

    //搜索配置
    protected $config;

    //初始化
    public function _initialize() {
        parent::_initialize();
        $this->config = cache('Search_config');
        if(!$this->config){
            $this->db = D("Search/Search");
            $this->config = $this->db->search_cache();
        }
    }

    //搜索首页
    public function index() {
        $_GET['q'] = str_replace('+', ' ', $_GET['q']);
        $modelid = I('get.modelid',5,'int');
        $searchfield = M('ModelField')->where(" modelid = $modelid and issearch =1")->getField('field',true);
        $where = array();
        $where['status'] = 99;
        $where['is_del'] = 0;
        $where['isdelay'] = 0;
        $map = array();
        foreach($searchfield as $v){
            $map[$v] = array('like','%'.I('get.q').'%');
        }
        $map['_logic'] = 'or';
        $where['_complex'] = $map;
        $model = cache('Model');
        $table_name = ucwords($model[$modelid]['tablename']);
        if (empty($table_name)) {
            $this->error("该模型不存在！");
        }

        $ContentDb = \Content\Model\ContentModel::getInstance($modelid);
        $rtb = M($ContentDb->getRelationName())->getTableName();
        $join = $rtb.' as b on a.id=b.id';
        $count = $ContentDb->alias('a')->join($join,'LEFT')->where($where)->count();
        import('Page');
        //每页显示个数
        $pagesize = 12;

        $page = new \Page($count,$pagesize);

        //分页设置
        //分页样式
        $pagetpl = '{prev}{liststart}{list}{listend}{next}';
        //分页配置项
        $pagestely = array('listlong' => 4, 'listsidelong' => 2, "first" => "&nbsp;", "last" => "&nbsp;", "prev" => L('RNPREVIOUS'), "next" => L('RNNEXT'), "list" => "*","currentclass" => "active", "disabledclass" => "",'ss'=>true);
        //添加设置
        $page->SetPager('default' , $pagetpl , $pagestely);

        $result = $ContentDb->alias('a')->join($join,'LEFT')->where($where)->order(array("a.id" => "ASC"))->limit($page->firstRow . ',' . $page->listRows)->select();
        /*
        //搜索结果处理
        if ($result && is_array($result)) {
            foreach ($result as $k => $r) {
                $id = $r['id'];
                $result[$k] = \Content\Model\ContentModel::getInstance($modelid)->where(array('id' => $id))->find();
            }
        }
        */
         $site_seo = get_site_options(); 
          $SEO = array();
          $SEO['title'] = $site_seo['site_seo_title'];
          $SEO['keyword'] = $site_seo['site_seo_keywords'];
          $SEO['description'] = $site_seo['site_seo_description'];
        $this->assign('result',$result);
        $this->assign('page',$page->show('default'));
        $this->assign('count', (int) $count)
        // ->assign('keyword', I('request.q'))
        // ->assign('seo', seo('','Search','Search','Search result '.I('post.q')))
        ->assign('time', time())
        ->assign('modelid', $modelid)
        ->assign('SEO',$SEO)

        ->display('search');
        exit;



        C('TOKEN_ON', false);
        $seo = seo();
        $this->assign('seo', $seo);
        $q = I('request.q');
        if ($q) {
            G('search');
            if (empty($q)) {
                header('Location: ' . U("Search/Index/index"));
                exit;
            }
            if (IS_POST) {
                $data = array("q" => I('request.q'));
                $data = array_merge($_POST, $data);
                header('Location: ' . U("Search/Index/index", $data));
                exit;
            }
            //关键字
            //$q = \Input::forSearch(I('request.q', '', 'trim'));
            $q = htmlspecialchars(strip_tags(I('request.q')));
            //时间范围
            $time = I('post.time');
            //模型
            $mid = I('post.modelid', 0, 'intval') ? I('post.modelid', 0, 'intval') : 5;
            //栏目
            $catid = I('post.catid', 0, 'intval');
            //排序
            $order = array("adddate" => "DESC", "searchid" => "DESC");
            //搜索历史记录
            $shistory = cookie("shistory");
            if (!$shistory) {
                $shistory = array();
            }
            $model = cache('Model');
            foreach ($model as $k => $rs) {
                if ($rs['type']) {
                    unset($model[$k]);
                }
            }
            array_unshift($shistory, $q);
            $shistory = array_slice(array_unique($shistory), 0, 10);
            //加入搜索历史
            cookie("shistory", $shistory);
            $where = array();
            //每页显示条数
            $pagesize = $this->config['pagesize'] ? $this->config['pagesize'] : 10;
            //缓存时间
            $cachetime = (int) $this->config['cachetime'];
            //按时间搜索
            if ($time == 'day') {//一天
                $search_time = time() - 86400;
                $where['adddate'] = array("GT", $search_time);
            } elseif ($time == 'week') {//一周
                $search_time = time() - 604800;
                $where['adddate'] = array("GT", $search_time);
            } elseif ($time == 'month') {//一月
                $search_time = time() - 2592000;
                $where['adddate'] = array("GT", $search_time);
            } elseif ($time == 'year') {//一年
                $search_time = time() - 31536000;
                $where['adddate'] = array("GT", $search_time);
            } else {
                $search_time = 0;
            }
            //可用数据源
            $this->config['modelid'] = $this->config['modelid'] ? $this->config['modelid'] : array();

            //按模型搜索
            if ($mid && in_array($mid, $this->config['modelid'])) {
                $where['modelid'] = $mid;
            }
            //按栏目搜索
            if ($catid) {
                //不支持多栏目搜索，和父栏目搜索。
                $where['catid'] = $catid;
            }
            //如果开启sphinx
            if ($this->config['sphinxenable']) {
                import('Sphinxapi', APP_PATH . 'Search/Class/');
                $sphinxhost = $this->config['sphinxhost'];
                $sphinxport = $this->config['sphinxport'];
                $cl = new \SphinxClient ();
                //设置searchd的主机名和TCP端口
                $cl->SetServer($sphinxhost, $sphinxport);
                //设置连接超时
                $cl->SetConnectTimeout(1);
                //控制搜索结果集的返回格式
                $cl->SetArrayResult(true);
                //设置全文查询的匹配模式 api http://docs.php.net/manual/zh/sphinxclient.setmatchmode.php
                $cl->SetMatchMode(SPH_MATCH_EXTENDED2);
                //设置排名模式 api http://docs.php.net/manual/zh/sphinxclient.setrankingmode.php
                $cl->SetRankingMode(SPH_RANK_PROXIMITY_BM25);
                //按一种类似SQL的方式将列组合起来，升序或降序排列。用weight是权重排序
                $cl->SetSortMode(SPH_SORT_EXTENDED, "@weight desc");
                //设置返回结果集偏移量和数目
                $page = I('post.' . C("VAR_PAGE"), 1, 'intval');
                $offset = $pagesize * ($page - 1);
                $cl->SetLimits($offset, $pagesize, ($pagesize > 1000) ? $pagesize : 1000);
                if (in_array($time, array("day", "week", "month", "year"))) {
                    //过滤时间
                    $cl->SetFilterRange('adddate', $search_time, time(), false);
                }
                if ($mid && in_array($mid, $this->config['modelid'])) {
                    //过滤模型
                    $cl->SetFilter('modelid', array((int) $mid));
                }
                if ($catid) {
                    //过滤栏目
                    $cl->SetFilter('catid', array((int) $catid));
                }
                //执行搜索 api http://docs.php.net/manual/zh/sphinxclient.query.php
                $res = $cl->Query($q, "*");
                //信息总数
                $count = $res['total'];
                //如果结果不为空
                if (!empty($res['matches'])) {
                    $result_sphinx = $res['matches'];
                }
                $result = array();
                //数组重新组合
                foreach ($result_sphinx as $k => $v) {
                    $result[$k] = array(
                        "searchid" => $v['id'],
                        "adddate" => $v['attrs']['adddate'],
                        "catid" => $v['attrs']['catid'],
                        "id" => $v['attrs']['id'],
                        "modelid" => $v['attrs']['modelid'],
                    );
                }
                $words = array();
                //搜索关键字
                foreach ($res['words'] as $k => $v) {
                    $words[] = $k;
                }
                $page = page($count, $pagesize, 0, array('currentclass'=>'n1fyxz'));
                $this->assign("Page", $page->show());
            } else {
                //分词结果
                if ($this->config['dzsegment']) {
                    $segment_q = D('Search/Search')->discuzSegment($q);
                } else {
                    $segment_q = D('Search/Search')->segment($q);
                }
                if (!empty($segment_q[0]) && $this->config['segment']) {
                    $words = $segment_q;
                    $segment_q = implode(' ', $segment_q);
                    $where['_string'] = " MATCH (`data`) AGAINST ('{$segment_q}' IN BOOLEAN MODE) ";
                } else {
                    //这种搜索最不行
                    $likeList = explode(' ', $q);
                    if (count($likeList) > 1) {
                        foreach ($likeList as $k => $rs) {
                            $likeList[$k] = "%{$rs}%";
                        }
                        $where['data'] = array('like', $likeList, 'or');
                    } else {
                        $where['data'] = array('like', "%{$q}%");
                    }
                    $words = array($q);
                }
                //查询结果缓存
                if ($cachetime) {
                    //统计
                    $count = M('Search')->where($where)->cache(true, $cachetime)->count();
                    $page = page($count, $pagesize,0,array('currentclass'=>'n1fyxz'));
                    $result = M('Search')->where($where)->cache(true, $cachetime)->limit($page->firstRow . ',' . $page->listRows)->order($order)->select();
                } else {
                    $count = M('Search')->where($where)->count();
                    $page = page($count, $pagesize,0,array('currentclass'=>'n1fyxz'));
                    $result = M('Search')->where($where)->limit($page->firstRow . ',' . $page->listRows)->order($order)->select();
                }
                $this->assign('Page', $page->show());
            }
            //搜索结果处理
            if ($result && is_array($result)) {
                foreach ($result as $k => $r) {
                    $modelid = $r['modelid'];
                    $id = $r['id'];
                    $result[$k] = \Content\Model\ContentModel::getInstance($modelid)->where(array('id' => $id))->find();
                }
            }
            //搜索记录
            if (strlen($q) < 17 && strlen($q) > 1 && $result) {
                $res = M('SearchKeyword')->where(array('keyword' => $q))->count();
                if ($res) {
                    //关键词搜索数+1
                    M('SearchKeyword')->where(array('keyword' => $q))->setInc("searchnums");
                } else {
                    //关键词转换为拼音
                    $iconvfunc = new \Common\Lib\iconvfunc();
                    $pinyin = $iconvfunc->gbk_to_pinyin(iconv('utf-8', 'gbk//IGNORE', $q));
                    if (is_array($pinyin)) {
                        $pinyin = implode('', $pinyin);
                    }
                    M('SearchKeyword')->add(array('keyword' => $q, 'searchnums' => 1, 'data' => $segment_q, 'pinyin' => $pinyin));
                }
            }
            //相关搜索功能
            if ($this->config['relationenble']) {
                $map = array();
                //相关搜索
                if (!empty($segment_q)) {
                    $relation_q = str_replace(' ', '%', $segment_q);
                } else {
                    $relation_q = $q;
                }
                $map['_string'] = " MATCH (`data`) AGAINST ('%$relation_q%' IN BOOLEAN MODE) ";
                $relation = M('SearchKeyword')->where($map)->select();
                $this->assign('relation', $relation);
            }
            foreach ($this->config['modelid'] as $modelid) {
                $source[$modelid] = array(
                    "name" => $model[$modelid]['name'],
                    "modelid" => $modelid
                );
            }
            $result = array_filter($result);

            //搜索结果
            $this->assign('result', $result)
                    ->assign('count', (int) $count)
                    ->assign('keyword', I('post.q'))
                    ->assign('source', $source)
                    ->assign('time', $time)
                    ->assign('modelid', $mid)
                    ->assign('shistory', $shistory)
                    ->assign('words', $words)//分词后的搜索关键字
                    ->assign('search_time', G('search', 'end', 6))//运行时间
                    ->display('search');
        } else {
            $this->display();
        }
    }

}
