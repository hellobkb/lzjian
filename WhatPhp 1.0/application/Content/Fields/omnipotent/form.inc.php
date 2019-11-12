<?php

/**
 * 万能字段字段类型表单处理
 * @param type $field 字段名 
 * @param type $value 字段内容
 * @param type $fieldinfo 字段配置
 * @return type
 */
function omnipotent($field, $value, $fieldinfo , $catid='',$array='') {

    $view = \Think\Think::instance('\Think\View');
    //错误提示
    $errortips = $fieldinfo['errortips'];
    if ($fieldinfo['minlength']) {
        //验证规则
       $formValidateRules['info[' . $field . ']'] = array("required" => true);
        //验证不通过提示
       $formValidateMessages['info[' . $field . ']'] = array("required" => $errortips ? $errortips : $fieldinfo['name'] . "不能为空！");
       $str['ruls'] = $formValidateRules;
       $str['mess'] = $formValidateMessages;
    }

/*   $a='<input type="button" value="添加相关" onClick="omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加相关文章\',1)" class="btn">";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}';
    $setting1 = unserialize($a);
    $ur=__ROOT__.'/';
    $set['formtext']='<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" ><ul class="list-dot" id="relation_text">{FIELD_DATA}</ul><input type="button" value="添加相关" onClick="omnipotent(\'selectid\',\''.$ur.'index.php?g=Content&m=Contentshow&a=public_relationlist&modelid={MODELID}\',\'添加相关文章\',1)" class="btn">';
    $set['fieldtype']=$setting1['fieldtype'];
    $set['backstagefun']=$setting1['backstagefun'];
    $set['frontfun']=$setting1['frontfun'];
    $new_set = serialize($set);*/


    $setting = unserialize($fieldinfo['setting']);
    //特殊处理
    if (in_array($setting['fieldtype'], array('text', 'mediumtext', 'longtext'))) {

        $_value = unserialize($value);
        if ($value && $_value) {
            $value = $_value;
            //$this->data[$field] = $value;
        }
    }

    //处理已选择的相关
    /*
    |5,139|5,138|5,137|5,143|5,141|5,140|5,139|5,136
    */

    $field_data = "";
    $value_data = explode("|", $value);
    foreach($value_data as $show_data){
        $show = explode(",", $show_data);

        /*
            <li id="v5_139">·<span>Welding Turning-rolls</span><a href="javascript:;" class="close" onclick="remove_relation('v5_139',139)"></a></li>
        */
        if($show[0] >0 && $show[1]>0){

            $model = \Content\Model\ContentModel::getInstance($show[0]);

            $model_data = $model->relation(true)->where(array("id" => $show[1]))->find();
            
            $field_data .="<li id='".$field."_".$show[0]."_".$show[1]."'>.<span>".$model_data['title']."</span><a href='javascript:;' class='close' onclick='remove_relation(\"".$field."\",\"".$field."_".$show[0]."_".$show[1]."\",".$show[1].")'></a></li>";
        }
    }



    $catinfo = getCategory($catid);
    $id = $array['id'];
    $modelid = $catinfo['modelid'];
    $formtext = str_replace('{RUL}', $ur, $formtext);
    $formtext = str_replace('{FIELD_VALUE}', $value, $setting["formtext"]);
    $formtext = str_replace('{MODELID}', $modelid, $formtext);
    $formtext = str_replace('{ID}', $id ? $id : 0, $formtext);
    $formtext = str_replace("{FIELD_DATA}" , $field_data , $formtext);

    $str['str'] = $formtext;
    return $str;
    // 页面缓存
    //ob_start();
    //ob_implicit_flush(0);
    //$view->assign($this->$data);
    //$view->display('', '', '', $formtext, '');
    // 获取并清空缓存
    //$formtext = ob_get_clean();
    //return $str;
}
