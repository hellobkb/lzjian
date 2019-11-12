<?php
/**
 * 关键词数据汇总
*/
namespace Statistics\Controller;
use Common\Controller\AdminbaseController;
class KeysDataSummaryController extends AdminbaseController {

	public function index() {
		$domain = $_SERVER['SERVER_NAME'];
        $project_info = M('keywordProject')->where("domain='" . $domain . "' and status = 1")->find();
        if (is_null($project_info)) {
            $this->error("请先添加项目！");
            $this->display();
            return;
        }
        $pro_id = $project_info["pro_id"];

        $back = $this->pieKeywords($pro_id);
        if ($back['countKeys']['error'] == "No data") {
        	$this->assign("countKeys", 0);
        	$this->display();
        	return;
        }

        $polylineBack = $this->polylineKeywords($pro_id);
		$this->assign("countKeys", count($back['countKeys']));
		$this->assign("keywords_top_name", $back['keywords_top_name']);
		$this->assign("keywords_top_data", $back['keywords_top_data']);

		$this->assign("dates", $polylineBack['dates']);
		$this->assign("top2_countKeys", $polylineBack['top2_countKeys']);
		$this->assign("top3_5_countKeys", $polylineBack['top3_5_countKeys']);
		$this->display();
	}

	function pieKeywords($pro_id) {
		$startdate = $enddate = date("Y-m-d",strtotime("-1 day"));
        $result = zccurl('AntRanks/ProjectInfo/queryRankings', array('project_id' => $pro_id, 'startdate' => $startdate, "enddate" => $enddate));
        $obj=json_decode($result);
        
        $obj=json_decode($result, true);
        $top_2 = $top_3_5 = $top_6_7 = $top_8_10 = $top_10 = 0;
        foreach ($obj as $key => $dateInfo) {
		  	foreach ($dateInfo as $key_date => $value) {
		  		if ($value['position']>0 && $value['position'] <= 20) {
		  		 	$top_2++;
		  		}
		  	 	if ($value['position']>20 && $value['position'] <= 50) {
		  	 		$top_3_5++;
		  	 	}
		  	 	if ($value['position']>50 && $value['position'] <= 70) {
		  	 		$top_6_7++;
		  	 	}
		  	 	if ($value['position']>70 && $value['position'] <= 100) {
		  	 		$top_8_10++;
		  	 	}
		  	 	if ($value['position'] == 0 || $value['position'] == "clock" ) {
		  	 		$top_10++;
		  	 	}
		  	}
		}
		$keywords_top_name = array("1-2页", "3-5页", "6-7页", "8-10页", ">10页");
		$keywords_top_data =array(
						array("name"=>"1-2页", "value"=>$top_2), 
						array("name"=>"3-5页", "value"=>$top_3_5), 
						array("name"=>"6-7页", "value"=>$top_6_7), 
						array("name"=>"8-10页", "value"=>$top_8_10),
						array("name"=>">10页", "value"=>$top_10));
		return array("countKeys"=>$obj, "keywords_top_name"=>json_encode($keywords_top_name), "keywords_top_data"=>json_encode($keywords_top_data));
	}

	function polylineKeywords($pro_id) {
		$startdate = date("Y-m-d",strtotime("-30 day"));
		$enddate = date("Y-m-d",strtotime("-1 day"));
		$result = zccurl('AntRanks/ProjectInfo/queryRankings', array('project_id' => $pro_id, 'startdate' => $startdate, "enddate" => $enddate));
 		$obj=json_decode($result, true);
        $top_2 = $top_3_5 = 0;
        for ($i=-30; $i < 0; $i++) { 
        	$top_2 = 0;
        	$top_3_5 = 0;
        	$date_for = date("Y-m-d",strtotime("$i day"));
        	$top2_countKeys_temp[$date_for] = 0;
			$top3_5_countKeys_temp[$date_for] = 0;
			foreach ($obj as $key => $dateInfo) {
			  	foreach ($dateInfo as $key_date => $value) {
			  		
			  		if ($date_for == $key_date) {
			  			if ($value['position']>0 && $value['position'] <= 20) {
			  		 		$top2_countKeys_temp[$key_date] = ++$top_2;
			  		 		// echo "test</br>";
				  		}
				  	 	if ($value['position']>20 && $value['position'] <= 50) {
				  	 		$top3_5_countKeys_temp[$key_date] = ++$top_3_5;
				  	 	}
			  		}
			  	}
			}
        }
        
        foreach ($top2_countKeys_temp as $key => $value) {
        	$dates[] = $key;
        	$top2_countKeys[] = $value;
        }
        foreach ($top3_5_countKeys_temp as $key => $value) {
        	$top3_5_countKeys[] = $value;
        }
		return array("dates"=>json_encode($dates), "top2_countKeys"=>json_encode($top2_countKeys), "top3_5_countKeys"=>json_encode($top3_5_countKeys));
	}
}
?>