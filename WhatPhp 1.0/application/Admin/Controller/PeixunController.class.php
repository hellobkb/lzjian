<?php 

namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class PeixunController extends AdminbaseController {


	public function index(){
                $url = "http://www.xinguwen.com/video/crm/getHotVideo";
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                //curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array("id"=>$id)));

                $return  = curl_exec($ch);
                curl_close($ch);
                $data = json_decode($return,true);
                if(empty($data)){
                        $this->assign("ifhave" , 0 );
                }else {
                        if(count($data) >3 ){
                                $out_list = array_slice($data, 0,3);
                        }else {
                                $out_list = $data;
                        }
                        $this->assign("ifhave" , 1 );
                }
                $shipin = $this->shippin();
                $this->assign("shipin", $shipin);
                $this->assign("out_list" , $out_list);
                
                gpoint($_SESSION["ADMIN_ID"],3);
                $this->display(":peixun");
        }

        /**
        * 获取新顾问免费视频
        */
        public function shippin(){
                $url = "http://www.xinguwen.com/Video/Freecourse/index";
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_HEADER, 0);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                $return  = curl_exec($ch);
                curl_close($ch);
                $data = json_decode($return,true);
                if(empty($data))return false;
                return $data;
        }

}


?>
