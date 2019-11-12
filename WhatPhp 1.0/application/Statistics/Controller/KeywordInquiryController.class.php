<?php
/**
 *关键词排名明细表
*/

namespace Statistics\Controller;
use Common\Controller\AdminbaseController;
class KeywordInquiryController extends AdminbaseController {

	const LIMIT_KEYWORDS = 200;//限制关键词个数

	public function index() {
		$selected = I('post.selected');
		$domain = $_SERVER['SERVER_NAME'];
        $project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
        if (is_null($project_info)) {
            $this->error("请先添加项目！");
            $this->display();
            return;
        }
        $pro_id = $project_info["pro_id"];
        $startdate = date("Y-m-d",strtotime("-3 day"));
		$enddate = date("Y-m-d",strtotime("-1 day"));
        $result = zccurl('AntRanks/ProjectInfo/queryRankings', array('project_id' => $pro_id, 'startdate' => $startdate, "enddate" => $enddate));
        $obj=json_decode($result);
        if ($obj->error == "No data") {
        	$this->display();
        	return;
        }

        $keyword_list = M('keywordsList')->select();
        $page = $this->page(count($keyword_list), 1000);
        $keyword_list = M('keywordsList')->limit($page->firstRow.",".$page->listRows)->select();
        $obj=json_decode($result, true);
        for ($i=0; $i < count($keyword_list); $i++) { 
        	$arr = array("keyword"=>$keyword_list[$i]['keyword'], "id"=>$keyword_list[$i]['id']);
        	foreach ($obj as $key => $dateInfo) {
        		if ($key == $keyword_list[$i]['keyword']) {
				  	foreach ($dateInfo as $key_date => $value) {
				  	 $arr[$key_date] = $value['position'];
				  	 $arr[$key_date.'change'] = $value['change'];
				  	 $arr[$key_date.'class'] = $value['class'];
				  	}
        		}
		    }
		   $listKeyWords[] = $arr;
        }
    	if ($selected == "1") {
    		$listKeyWords = $this->my_sort($listKeyWords, $enddate);
    	}
    	if ($selected == "0") {
    		
    	}
    	session('listKeyWords',null); // 删除listKeyWords
    	session("listKeyWords", $listKeyWords);
		$this->assign('listKeyWords', $listKeyWords);
		$this->assign('Page', $page->show('Admin'));
		$this->display();
	}

	/**
	 * 添加关键词
	*/
	public function addkeywords() {
		if (IS_POST) {
			$backfun= array();
			$keywordsArea_list = trim(I('post.keywordsArea'));
			$keywordsArea_arr = array_unique(explode("\n", $keywordsArea_list));

			$data_keywords =  M('keywordsList')->field("keyword_id")->select();
			$number_exists = M('keywordsList')->where("keyword in ('".implode("','",$keywordsArea_arr)."')")->count();
			$add_curr_keywords = count($keywordsArea_arr) - $number_exists + count($data_keywords);

			if ($add_curr_keywords > self::LIMIT_KEYWORDS) {
				$backfun['status'] = "limit";
	 			$backfun['description'] ="关键词数量上限(200个)";
	 			$this->ajaxReturn($backfun);
            	return;
			}

			$domain = $_SERVER['SERVER_NAME'];
			$project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
			if (is_null($project_info)) {
            	$backfun['status'] = "error";
	 			$backfun['description'] ="请先添加项目！";
	 			$this->ajaxReturn($backfun);
            	return;
        	}
        	$pro_id = $project_info["pro_id"];
        	$result = zccurl('AntRanks/ProjectInfo/postKey', array('project_id' => $pro_id, 'keyword_array' => $keywordsArea_arr));

        	$json_result = json_decode($result);
        	$status = $json_result -> status;
        	$backfun['status'] = $status;
        	$backfun['description'] = $json_result -> description;

        	$keyword_id = $json_result -> keyword_id;
        	$keyword_id = substr($keyword_id, 1, -1);
        	$keyArray = explode(",", $keyword_id);
        	$postSize = count($keyArray);
        	$dataAdd_arr = array();
        	if ($status == "OK") {
        		foreach ($data_keywords as $value) {
					foreach ($value as $value_keyword_id) {
						for ($i=0; $i<$postSize; $i++) {
							if ($value_keyword_id == $keyArray[$i] ) {
								unset($keyArray[$i]);
								unset($keywordsArea_arr[$i]);
							}
						}
					}
	        	}

        		for ($i=0; $i<$postSize; $i++) {
        			if ($keyArray[$i] != null) {
        				$dataAdd = array("keyword_id"=>$keyArray[$i], "keyword"=>$keywordsArea_arr[$i], "gmt_create" =>  date("Y-m-d h:i:s") );
        				$dataAdd_arr[] = $dataAdd;
        			}
        		}
        		$resultAdd = M('keywordsList')->addAll($dataAdd_arr);
        		$backfun['description'] = $dataAdd_arr;
        	}
	 		$this->ajaxReturn($backfun);
	 		return;
		}
		$this->display();
	}

	/**
	 * 批量删除关键词
	*/
	function delkeywords() {
		$ids = I('ids');
		$ids_arr = implode(",",$ids);

		$keyword_ids = M('keywordsList')->where(" id in ($ids_arr)")->field('keyword_id')->select();
		foreach ($keyword_ids as $value) {
			foreach ($value as $keyword_id) {
				$keyword_id_array[] = $keyword_id;
			}
		}
		$domain = $_SERVER['SERVER_NAME'];
		$project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
        if (is_null($project_info)) {
            $this->error("请先添加项目！");
            $this->display();
            return;
        }
        $pro_id = $project_info["pro_id"];
		$result = zccurl('AntRanks/ProjectInfo/delKeyWords', array('project_id' => $pro_id, 'keyword_id_array' => $keyword_id_array));
		$json_result = json_decode($result);
		$status = $json_result -> status;
		if ($status == "OK") {
			$result_del = M('keywordsList')->where(" id in ($ids_arr)")->delete();
			$this->success("删除成功！");
		}else{
			$this->error("删除失败！");
		}
	}

	/**
	 * 导出Excel表格
	*/
	function excelKeywords() {
		$yesterday =date("Y-m-d",strtotime("-1 day"));
		$beforeYesterday = date("Y-m-d",strtotime("-2 day"));
		$bigbeforeday = date("Y-m-d",strtotime("-3 day"));

		$list = session('listKeyWords');
		$arr = array(array('关键词',$bigbeforeday, $beforeYesterday, $yesterday));
		foreach($list as $v){
			$brr = array();
			$brr[] = $v['keyword'];
			$brr[] = $v[$bigbeforeday];
			$brr[] = $v[$beforeYesterday];
			$brr[] = $v[$yesterday];
			$arr[] = $brr;
		}
		zcexcel($arr);
	}

	/**
	 * 复杂数组排序
	*/
	function my_sort($arrays,$sort_key,$sort_order=SORT_ASC,$sort_type=SORT_NUMERIC ){   
        if(is_array($arrays)){   
            foreach ($arrays as $key =>$array){   
                if(is_array($array)){
                	if (is_null($array[$sort_key]) || $array[$sort_key]==0) {
                		unset($arrays[$key]);
                	}else {
                		$key_arrays[] = $array[$sort_key]; 
                	}
                    
                }else{   
                    return false;   
                }   
            }   
        }else{   
            return false;   
        }  
        array_multisort($key_arrays,$sort_order,$sort_type,$arrays);   
        return $arrays;   
    }
}
?>