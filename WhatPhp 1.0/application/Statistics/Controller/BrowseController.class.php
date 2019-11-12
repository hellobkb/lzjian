<?php
// +----------------------------------------------------------------------
// | [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2018-2020 rights reserved.
// +----------------------------------------------------------------------
// | Author: Song
// +----------------------------------------------------------------------
// | Date: 2019/6/10 0010 15:22
// +----------------------------------------------------------------------
namespace Statistics\Controller;

use Common\Controller\AdminbaseController;

class BrowseController extends AdminbaseController
{

    /**
     * 访客地区分布
     * Author: Song
     * Date: 2019/6/10 0010 15:26
     */
    public function country()
    {
        if (IS_POST) {
            $_GET = $post = I('post.');
            $backfun = $this->formateCountry($post);
        }
        if (IS_GET) {
            $post = I('get.');
            $backfun = $this->formateCountry($post);
        }
        $bt_rel = $this->formateCountryBt($post);
        $this->assign('country_bt', json_encode($bt_rel['country_bt']));
        $this->assign('country_data_bt', json_encode($bt_rel['rel_bt']));
        $this->assign(
            "start_time",
            $backfun['start_time'] ?
                $backfun['start_time'] :
                date('Y-m-01', strtotime(date("Y-m-d")))
        );
        $this->assign("end_time", $backfun['end_time'] ? $backfun['end_time'] : date("Y-m-d", time()));
        $this->assign('list', $backfun['list']);
        $this->assign('Page', $backfun['Page']);
        $this->assign('total_con', $backfun['total_con']);
        $this->assign('total_bro', $backfun['total_bro']);
        $this->assign('where', base64_encode(json_encode($backfun['where'])));
        $this->display();
    }

    /**
     * 受访页面
     * Author: Song
     * Date: 2019/6/10 0010 15:28
     */
    public function pagetj()
    {
        if (IS_POST) {
            $_GET = $post = I('post.');
            $backfun = $this->formatePage($post);
        }
        if (IS_GET) {
            $post = I('get.');
            $backfun = $this->formatePage($post);
        }
        $bt_rel = $this->formatePageBt($post);
        $this->assign('title_bt', json_encode($bt_rel['title_bt']));
        $this->assign('rel_page_bt', json_encode($bt_rel['rel_page_bt']));
        $this->assign("list", $backfun['list']);
        $this->assign("list_old", $backfun['list_old']);
        $this->assign(
            "start_time",
            $backfun['stime'] ?
                $backfun['stime'] :
                date('Y-m-01', strtotime(date("Y-m-d")))
        );
        $this->assign("end_time", $backfun['etime'] ? $backfun['etime'] : date("Y-m-d", time()));
        $this->assign("page", $backfun['page']);
        $this->assign("where", base64_encode(json_encode($backfun['where'])));
        $this->display();
    }

    /**
     * 访问明细
     * Author: Song
     * Date: 2019/6/10 0010 15:27
     */
    public function detail()
    {
        if (IS_POST) {
            $_GET = $post = I('post.');
            $backfun = $this->formateDetail($post);
        }
        if (IS_GET) {
            $post = I('get.');
            $backfun = $this->formateDetail($post);
        }
        $this->assign("list", $backfun['list']);
        $this->assign(
            "start_time",
            $backfun['stime'] ?
                $backfun['stime'] :
                date('Y-m-01', strtotime(date("Y-m-d")))
        );
        $this->assign("end_time", $backfun['etime'] ? $backfun['etime'] : date("Y-m-d", time()));
        $this->assign("page", $backfun['page']);
        $this->assign("where", base64_encode(json_encode($backfun['where'])));
        $this->display();
    }

    public function formateDetail($post = '')
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());

            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }
            $where['time'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));

        } else {
            $where['time'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today"))
            );
        }
        $listAll = M('VisitDetail')
            ->where($where)
            ->order("id desc")
            ->select();
        $page = $this->page(count($listAll), 15);
        $list = M('VisitDetail')
            ->where($where)->order("clicks desc, time asc")
            ->limit($page->firstRow . ',' . $page->listRows)
            ->order("id desc")
            ->select();
        $pagestr = $page->show('Admin');
        return array(
            "list" => $list,
            "allList" => $listAll,
            "start_time" => $stime,
            "end_time" => $etime,
            "Page" => $pagestr,
            "where" => $where
        );
    }

    /**
     * 访客地区分布--饼图
     * Author: Song
     * Date: 2019/6/11 0011 16:14
     */
    public function formateCountryBt($post = '')
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());

            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }

            $where['addtime'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));

        } else {
            $where['addtime'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today")));
        }
        $where['country'] = array('neq', '');
        $count = M('VisitDeep')
            ->field("country, sum(clicks) as clicks")
            ->group('country')
            ->where($where)
            ->order('clicks desc')->limit(10)->select();
        foreach ($count as $key => $value) {
            $visitInfo = $this->visitorNumber($value['country'], $post);
            $total_list_data[$key]['value'] = $visitInfo['visit_num'];
            $total_list_data[$key]['name'] = $value['country'];
        }
        $total_list_data = $this->multiArraySort($total_list_data, 'value');
        $total_list_data_need = array_slice($total_list_data, 0, 5);
        $total_list_data_surplus = array_slice($total_list_data, 5);
        if ($total_list_data_surplus) {
            $surplusSum = 0;
            foreach ($total_list_data_surplus as $val) {
                $surplusSum += $val['value'];
            }
            array_push($total_list_data_need, array('value' => $surplusSum, 'name' => '其它'));
            $total_list_data_need = $this->multiArraySort($total_list_data_need, 'value');
        }
        foreach ($total_list_data_need as $val) {
            $total_country[] = $val['name'];
        }
        $data['country_bt'] = $total_country;
        $data['rel_bt'] = $total_list_data_need;
        return $data;
    }

    /**
     * 访客地区分布--列表
     * Author: Song
     * Date: 2019/6/11 0011 16:13
     */
    public function formateCountry($post = '')
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());

            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }
            $where['addtime'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));

        } else {
            $where['addtime'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today"))
            );
        }
        $where['country'] = array('neq', '');
        $listAll = M('VisitDeep')
            ->field("count(*) as value, country, sum(clicks) as clicks")
            ->group('country')
            ->where($where)
            ->order("addtime asc")
            ->select();
        foreach ($listAll as $key => $val) {
            $visitInfo = $this->visitorNumber($val['country'], $post);
            //$listAll[$key]['visit_num'] = $visitInfo['visit_num'];
            $listAll[$key]['visit_num'] = $val['value'];
            $listAll[$key]['visit_new_num'] = $visitInfo['visit_new_num'];
            $listAll[$key]['new_rate'] = $visitInfo['new_rate'];

            $sumNewVisit += $visitInfo['visit_new_num'];
            $sumVisit += $visitInfo['visit_num'];
            $sum += $val['clicks'];
        }

        foreach ($listAll as $key => $value) {
            $total_con += $value['value'];
            $total_bro += $value['clicks'];
        }
        $page = $this->page(count($listAll), 15);
        $list = M('VisitDeep')
            ->field("count(*) as value, country, sum(clicks) as clicks")
            ->group('country')
            ->where($where)->order("clicks desc, addtime asc")
            ->limit($page->firstRow . ',' . $page->listRows)
            ->select();
        $sumNewVisit = 0;
        $sumVisit = 0;
        $sum = 0;
        foreach ($list as $key => $val) {
            $visitInfo = $this->visitorNumber($val['country'], $post);
            $list[$key]['visit_num'] = $val['value'];
            $list[$key]['visit_new_num'] = $visitInfo['visit_new_num'];
            $list[$key]['new_rate'] = $visitInfo['new_rate'];

            $sumNewVisit += $visitInfo['visit_new_num'];
            $sumVisit += $val['value'];
            $sum += $val['clicks'];
        }
        $zj = array(
            'country' => '总计',
            'visit_num' => $sumVisit, 'visit_new_num' => $sumNewVisit,
            'new_rate'=>round(($sumNewVisit/$sumVisit), 2)*100,
            'clicks'=>$sum);
        array_unshift($list, $zj);
        $pagestr = $page->show('Admin');
        return array(
            "list" => $list,
            "allList" => $listAll,
            "start_time" => $stime,
            "end_time" => $etime,
            "Page" => $pagestr,
            "total_con" => $total_con,
            "total_bro" => $total_bro,
            "where" => $where
        );
    }

    /**
     * 获取访客数量，新访客数量，新访客占比
     * param $country
     * param string $post
     * return mixed
     * Author: Song
     * Date: 2019/6/11 0011 15:35
     */
    public function visitorNumber($country, $post = '')
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());

            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }
            $where['addtime'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));

        } else {
            $stime = strtotime(date('Y-m-01', strtotime(date("Y-m-d"))));
            $where['addtime'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today"))
            );
        }
        $where['country'] = $country;
        $list = M('VisitDeep')
            ->field("country,ip")
            ->where($where)
            ->order("addtime asc")
            ->select();
        $ips = array();
        foreach ($list as $k => $val) {
            $ips[] = $val['ip'];
        }
        $ips = array_unique($ips);
        //$data['visit_num'] = count($ips);
        $data['visit_num'] = count($list);

        $where = array();

        //新访客
        $new = 0;
        foreach ($ips as $val) {
            $res = $this->checkNewVisit($val, $stime);
            if ($res) {
                $new++;
            }
        }

        $data['visit_new_num'] = $new;
        $data['new_rate'] = round(($new / $data['visit_num']), 2) * 100;
        return $data;
    }

    /**
     * 检查指定ip是不是新访客
     * @param $ip
     * @param $start
     * @return bool
     * @throws \think\Exception
     * Author: Song
     * Date: 2019/7/12 15:49
     */
    public function checkNewVisit($ip, $start)
    {
        if (empty($ip) || empty($start)) {
            return false;
        }
        $map['ip'] = $ip;
        $map['addtime'] = array('LT', $start);
        $count = M('VisitDeep')->where($map)->count();
        if (!$count) {
            return true; // 是新访客
        }
        return false; //  不是新访客

    }

    /**
     * 受访页面--饼图
     * Author: Song
     * Date: 2019/6/11 0011 16:21
     */
    public function formatePageBt($post)
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());
            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }
            $where['addtime'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));
        } else {
            $where['addtime'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today")));
        }
        $list = M('VisitPage')
            ->field("url, sum(`clicks`) as `num`")
            ->where($where)
            ->group('title')
            ->order('num desc')
            ->select();
        foreach ($list as $key => $value) {
            $visitInfo = $this->visitorPageNumber($value['url'], $post);
            $total_list_data[$key]['value'] = $visitInfo['visit_num'];
            $total_list_data[$key]['name'] = $value['url'];
        }
        $total_list_data = $this->multiArraySort($total_list_data, 'value');
        $total_list_data_need = array_slice($total_list_data, 0, 9);
        $total_list_data_surplus = array_slice($total_list_data, 9);
        if ($total_list_data_surplus) {
            $surplusSum = 0;
            foreach ($total_list_data_surplus as $val) {
                $surplusSum += $val['value'];
            }
            array_push($total_list_data_need, array('value' => $surplusSum, 'name' => '其它'));
            $total_list_data_need = $this->multiArraySort($total_list_data_need, 'value');
        }
        foreach ($total_list_data_need as $val) {
            $total_title[] = $val['name'];
        }

        $data['title_bt'] = $total_title;
        $data['rel_page_bt'] = $total_list_data_need;
        return $data;
    }

    /**
     * 受访页面--列表
     * Author: Song
     * Date: 2019/6/11 0011 16:21
     */
    public function formatePage($post)
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());
            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }
            $where['addtime'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));
        } else {
            $where['addtime'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today")));
        }
        $list_old = M('VisitPage')
            ->field("title, url,count(ip) as `vnum`, sum(`clicks`) as `num`")
            ->where($where)
            ->group('url')
            ->order('num desc')
            ->select();
        foreach ($list_old as $key => $value) {
            $visitInfo = $this->visitorPageNumber($value['url'], $post);
            $list_old[$key]['visit_num'] = $value['vnum'];
            $list_old[$key]['visit_new_num'] = $visitInfo['visit_new_num'];
            $list_old[$key]['new_rate'] = $visitInfo['new_rate'];

            $sumNewVisit += $visitInfo['visit_new_num'];
            $sumVisit += $visitInfo['visit_num'];
            $sum += $value['num'];
        }
        $page = $this->page(count($list_old), 15);

        $allZj = array(
            'url' => '总计',
            'visit_num' => $sumVisit, 'visit_new_num' => $sumNewVisit,
            'new_rate'=>round(($sumNewVisit/$sumVisit), 2)*100,
            'num'=>$sum);
        array_unshift($list_old, $allZj);
        $list = M('VisitPage')
            ->field("title, url,count(ip) as `vnum`, sum(`clicks`) as `num`")
            ->where($where)
            ->group('url')
            ->order('num desc')
            ->limit($page->firstRow . ',' . $page->listRows)
            ->select();
        $sumNewVisit = 0;
        $sumVisit = 0;
        $sum = 0;
        foreach ($list as $key => $value) {
            $visitInfo = $this->visitorPageNumber($value['url'], $post);
            $list[$key]['visit_num'] = $value['vnum'];
            $list[$key]['visit_new_num'] = $visitInfo['visit_new_num'];
            $list[$key]['new_rate'] = $visitInfo['new_rate'];

            $sumNewVisit += $visitInfo['visit_new_num'];
            $sumVisit += $value['vnum'];
            $sum += $value['num'];
        }
        $zj = array(
            'url' => '总计',
            'visit_num' => $sumVisit, 'visit_new_num' => $sumNewVisit,
            'new_rate'=>round(($sumNewVisit/$sumVisit), 2)*100,
            'num'=>$sum);
        array_unshift($list, $zj);
        $Page = $page->show('Admin');
        return array(
            "list" => $list,
            "allList" => $list_old,
            "stime" => $stime,
            "etime" => $etime,
            "page" => $Page,
            "where" => $where,
            "list_old" => $list_old
        );
    }

    /**
     * 受访页面--访客数量，新访客数量、访客占比
     * Author: Song
     * Date: 2019/6/11 0011 16:52
     */
    public function visitorPageNumber($url, $post = '')
    {
        if ($post) {
            $stime = $post['start_time'] ? $post['start_time'] : date('Y-m-01', strtotime(date("Y-m-d")));
            $etime = $post['end_time'] ? $post['end_time'] : date("Y-m-d", time());

            if (strtotime($stime) - strtotime($etime) > 0) {
                $this->error("结束时间不能小于开始时间");
            }
            $where['addtime'] = array(array('EGT', strtotime($stime)), array('ELT', strtotime($etime)));

        } else {
            $stime = strtotime(date('Y-m-01', strtotime(date("Y-m-d"))));
            $where['addtime'] = array(
                array('EGT', strtotime(date('Y-m-01', strtotime(date("Y-m-d"))))),
                array('ELT', strtotime("today"))
            );
        }
        $where['url'] = $url;
        $list = M('VisitPage')
            ->field("url,ip")
            ->where($where)
            ->order("addtime asc")
            ->select();
        $ips = array();
        foreach ($list as $k => $val) {
            $ips[] = $val['ip'];
        }
        $ips = array_unique($ips);

        //新访客
        $new = 0;
        foreach ($ips as $val) {
            $res = $this->checkPageNewVisit($val, $stime);
            if ($res) {
                $new++;
            }
        }
        $data['visit_num'] = count($list);
        $data['visit_new_num'] = $new;
        $data['new_rate'] = round(($data['visit_new_num'] / $data['visit_num']), 2) * 100;
        return $data;
    }

    /**
     * 检查指定页面 新访客
     * @param $ip
     * @param $start
     * @return bool
     * @throws \think\Exception
     * Author: Song
     * Date: 2019/7/12 15:49
     */
    public function checkPageNewVisit($ip, $start)
    {
        if (empty($ip) || empty($start)) {
            return false;
        }
        $map['ip'] = $ip;
        $map['addtime'] = array('LT', $start);
        $count = M('VisitPage')->where($map)->count();
        if (!$count) {
            return true; // 是新访客
        }
        return false; //  不是新访客

    }

    /**
     * 二维数组排序
     * @param $multi_array 数组
     * @param $sort_key 需要排序所根据的索引
     * @param $sort 升序，降序
     * @return array
     */
    public function multiArraySort($multi_array, $sort_key, $sort = SORT_DESC)
    {
        if (is_array($multi_array)) {
            foreach ($multi_array as $row_array) {
                if (is_array($row_array)) {
                    $key_array[] = $row_array[$sort_key];
                } else {
                    return false;
                }
            }
        } else {
            return false;
        }
        array_multisort($key_array, $sort, $multi_array);
        return $multi_array;
    }
}
