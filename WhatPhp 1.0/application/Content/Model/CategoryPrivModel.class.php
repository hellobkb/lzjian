<?php

// +----------------------------------------------------------------------
// |  栏目权限与角色之间的授权
// +----------------------------------------------------------------------
// |
// +----------------------------------------------------------------------
// | Author cx
// +----------------------------------------------------------------------

namespace Content\Model;

use Common\Model\Model;

class CategoryPrivModel extends Model {

    //自动验证
    protected $_validate = array(
        //array(验证字段,验证规则,错误提示,验证条件,附加规则,验证时间)
        array('roleid', 'require', '角色ID不能为空！', 1, 'regex', 3),
        array('catid', 'require', '栏目ID不能为空！', 1, 'regex', 3),
        array('action', 'require', '权限动作不能为空！', 1, 'regex', 3),
    );

    /**
     * 更新权限
     * @param  $catid 栏目ID
     * @param  $priv_datas
     * @param  $is_admin 1为管理员
     */
    public function update_priv($catid, $priv_datas, $is_admin = 1) {
        //删除旧的
        $this->where(array('catid' => $catid, 'is_admin' => $is_admin))->delete();
        if (is_array($priv_datas) && !empty($priv_datas)) {
            foreach ($priv_datas as $r) {
                $r = explode(',', $r);
                //动作
                $action = $r[0];
                //角色或者会员用户组
                $roleid = $r[1];
                $this->add(array('catid' => $catid, 'roleid' => $roleid, 'is_admin' => $is_admin, 'action' => $action));
            }
        }
    }
    /**
     * 应用到子栏目 ：模板，缩略图大小
     * @param  $catid 栏目ID
     * @param  
     * @param  $is_admin 1为管理员
     */
    public function update_cateother($catid,$arr) {
        if(!$catid || !$arr)return false;
       $data = getCategory($catid);
       $setting = $data['setting'];
       $setting = array_merge($setting,$arr);
       $con['setting'] = serialize($setting);
       $map['catid'] = $catid;
       M('Category')->where($map)->save($con);
       return true;
    }

    /**
     * 应用到子栏目 ：排序
     * @param  $from_catid 栏目ID
     * @param  $to_catid   栏目ID 应用到哪个栏目ID
     */
    public function update_consorder($from_catid,$to_catid){
        if(!$from_catid || !$to_catid)return false;
        $info = getCategory($from_catid);
        $orderinfo = M('Sortorder')->where('catid='.$from_catid)->find();
        if(!$orderinfo)return false;
        $info_2 = M('Sortorder')->where('catid='.$to_catid)->find();
        $data['sort'] = $orderinfo['sort']?$orderinfo['sort']:'';
        $data['order'] = $orderinfo['order']?$orderinfo['order']:'';
        if($info_2){
            $rel = M('Sortorder')->where('catid='.$to_catid)->save($data);
        }else{
            $data['catid'] = $to_catid;
            $data['modelid'] = $info['modelid'];
            $rel = M('Sortorder')->add($data);
        }
        return true;
    }


    /**
     * 检查栏目权限
     * @param $privs 权限数据
     * @param $action 动作
     * @param $roleid 角色
     * @param $is_admin 是否为管理组
     */
    public function check_category_priv($privs, $action, $roleid, $is_admin = 1) {
        $checked = '';
        foreach ($privs as $priv) {
            if ($priv['is_admin'] == $is_admin && $priv['roleid'] == $roleid && $priv['action'] == $action)
                $checked = 'checked';
        }
        return $checked;
    }

}

?>
