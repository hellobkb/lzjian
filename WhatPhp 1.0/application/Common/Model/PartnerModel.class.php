<?php
namespace Common\Model;
use Common\Model\CommonModel;
class PartnerModel extends CommonModel{

	//自动验证
	protected $_validate = array(
			//array(验证字段,验证规则,错误提示,验证条件,附加规则,验证时间)
			array('partner_name', 'require', '合作伙伴名称不能为空！', 1, 'regex', 3),
			array('partner_url', 'require', '合作伙伴链接地址不能为空！', 1, 'regex', 3),
	);
	
	protected function _before_write(&$data) {
		parent::_before_write($data);
	}
}