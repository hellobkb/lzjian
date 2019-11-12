<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Tuolaji <479923197@qq.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\AdminbaseController;
use Common\Model\CacheModel;
class AdminTermController extends AdminbaseController {

	protected $terms_model;
	protected $taxonomys;
	protected $tree;
	protected $Url;
	protected $iconvfunc;

	function _initialize() {
		parent::_initialize();

		$this->terms_model = D("Portal/Terms");

		$this->tree = new \Common\Lib\Tree();
		$this->Url = new \Common\Lib\Url();
		$this->iconvfunc = new \Common\Lib\iconvfunc();

		//生成URL规则缓存
		if(!S("Urlrules")){
			$urlrules = M("urlrule")->select();
			$urlarr =array();
			foreach($urlrules as $roleid=>$r){
				$urlarr[$r['urlruleid']] =$r;
				S("Urlrules" ,$urlarr);
			}
		}

		//生成Model缓存
		if(!S("Model")){
			$models = M('model')->select();
			$marr = array();

			foreach($models as $key=>$value){
				$marr[$value['modelid']] =$value;
			}


			S("Model", $marr);
		}

		$this->assign("taxonomys",$this->taxonomys);
	}
	function index(){


		/*
		 * 栏目列表页重写
		 *
		 * @author cx <445712421@qq.com>
		 *
		 * */

		if (IS_POST) {
			$Category = M('Category');

			foreach ($_POST['listorders'] as $id => $listorder) {
				$Category->where(array('catid' => $id))->save(array('listorder' => $listorder));
				//删除缓存
				getCategory($id,'',true);
			}
			$this->cache();
			$this->success("排序更新成功！");
			exit;
		}


		$modelid = I('modelid','','int');

		if($modelid){
			$where['modelid'] = $modelid;
			$resultarr = M("Category")->where($where)->select();

			$result =array();
			foreach($resultarr as $k=>$v){
				$result[$v['catid']] =$v;
			}
		}else{
			$result = S("Category");
		}

		$models = S('Model');



		$categorys = array();
		//栏目数据，可以设置为缓存的方式

		$site = M("options")->where("option_name='site_options'")->find();
		$sitearr = json_decode($site['option_value'],true);

		$siteurl = parse_url($sitearr['site_host']);

		$types = array(0 => '内部栏目', 1 => '<font color="blue">单网页</font>', 2 => '<font color="red">外部链接</font>');

		if (!empty($result)) {
			foreach ($result as $r) {
				$r = getCategory($r['catid']);
				$r['modelname'] = $models[$r['modelid']]['name'];
				$r['str_manage'] = '';
				if ($r['child']) {
					$r['yesadd'] = '';
				} else {
					$r['yesadd'] = 'blue';
				}
				if ($r['type'] != 2) {
					if ($r['child']) {
						if ($r['type'] == 1) {
							$r['str_manage'] .= '<a href="' . U("AdminTerm/singlepage", array("parentid" => $r['catid'])) . '">添加子栏目</a> | ';
						} else {
							$r['str_manage'] .= '<a href="' . U("AdminTerm/add", array("parentid" => $r['catid'])) . '">添加子栏目</a> | ';
						}
					}
				}
				$r['str_manage'] .= '<a href="' . U("AdminTerm/edit", array("catid" => $r['catid'])) . '">修改</a> | <a class="J_ajax_del" href="' . U("AdminTerm/delete", array("catid" => $r['catid'])) . '">删除</a>';
				//终极栏目转换
				if (in_array($r['type'], array(0, 1)) && $r['modelid']) {
					$r['str_manage'] .= ' | <a href="' . U("AdminTerm/categoryshux", array("catid" => $r['catid'])) . '">终极属性转换</a> ';
				}
				$r['typename'] = $types[$r['type']];
				$r['display_icon'] = $r['ismenu'] ? '' : ' <img src ="' . $sitearr['site_host'] . 'public/images/gear_disable.png" title="不在导航显示">';

				$r['help'] = '';
				$setting = $r['setting'];
				if ($r['url']) {
					$parse_url = parse_url($r['url']);
					if ($parse_url['host'] != $siteurl['host'] && strpos($r['url'], '/index.php?') === false) {
						$catdir = $r['catdir'];
						//如果生成静态，将设置一个指定的静态目录
						$catdir = '/' . $r['parentdir'] . $catdir;
						if ($setting['ishtml'] && strpos($r['url'], '?') === false) {
							$r['help'] = '<img src="' . $sitearr['site_host']. 'public/images/help.png" title="将域名：' . $r['url'] . '&#10;绑定到目录&#10;' . $catdir . '/">';
						}
					}
					$r['url'] = "<a href='" . $r['url'] . "' target='_blank'>访问</a>";
				} else {
					$r['url'] = "<a href='" . U("AdminTerm/public_cache") . "'><font color='red'>更新缓存</font></a>";
				}
				$categorys[$r['catid']] = $r;
			}
		}



		$str = "<tr>
	<td align='center'><input name='listorders[\$id]' type='text' size='3' value='\$listorder' class='input'></td>
	<td align='center'><font color='\$yesadd'>\$id</font></td>
	<td >\$spacer\$catname\$display_icon</td>
	<td  align='center'>\$typename</td>
	<td>\$modelname</td>
	<td align='center'>\$url</td>
	<td align='center'>\$help</td>
	<td align='center' >\$str_manage</td>
	</tr>";




		if (!empty($categorys) && is_array($categorys)) {
			$tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
			$tree->nbsp = '&nbsp;&nbsp;&nbsp;';

			$this->tree->init($categorys);

			$categorydata = $this->tree->get_tree(0, $str);
		} else {
			$categorydata = '';
		}


		$this->assign("categorys", $categorydata);
		$this->display();
	}


	function add(){

		/*
		 * 添加栏目修改
		 * @author cx
		 *  */


		$parentid = I('get.parentid', 0, 'intval');
		if (!empty($parentid)) {
			$Ca = getCategory($parentid);
			if (empty($Ca)) {
				$this->error("父栏目不存在！");
			}
			if ($Ca['child'] == '0') {
				$this->error("终极栏目不能添加子栏目！");
			}
		}

		//输出可用模型

		$modelsdata = S('Model');

		$models = array();
		foreach ($modelsdata as $v) {
			if ($v['disabled'] == 0 && $v['type'] == 0) {
				$models[] = $v;
			}
		}
		//栏目列表 可以用缓存的方式

		$array = S("Category");

		foreach ($array as $k => $v) {
			$array[$k] = getCategory($v['catid']);
			if ($v['child'] == '0') {
				$array[$k]['disabled'] = "disabled";
			} else {
				$array[$k]['disabled'] = "";
			}
		}

		if (!empty($array) && is_array($array)) {
			$this->tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
			$this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
			$str = "<option value='\$catid' \$selected \$disabled>\$spacer \$catname</option>";

			$this->tree->init($array);

			$categorydata = $this->tree->get_tree(0, $str,$parentid);

		} else {
			$categorydata = '';
		}

		$listtp = array();   	//栏目模板列表
		$categorytp = array();  //栏目频道模板列表
		$showtp =array();       //内容模板列表
		$commenttp =array();	//评论模板模板列表
		$pagetp =array();       //单页模板文件

		//模板文件目录下存放的各类静态文件

		$this->assign("tp_category", getTemlateHtml("Category"));
		$this->assign("tp_list", getTemlateHtml("List"));
		$this->assign("tp_show", getTemlateHtml("Show"));
		$this->assign("tp_comment", getTemlateHtml("Comment"));
		$this->assign("tp_page", getTemlateHtml("Page"));


		$this->assign("category", $categorydata);
		$this->assign("models", $models);
		$this->assign('parentid_modelid', $Ca['modelid']);


		$type = I('get.type', 0, 'intval');
		$this->assign("category_php_ruleid",\Common\Lib\Form::urlrule('content', 'category', 0, "", 'name="category_php_ruleid"'));    //栏目
		$this->assign("category_html_ruleid", \Common\Lib\Form::urlrule('content', 'category', 1, "", 'name="category_html_ruleid"'));
		$this->assign("show_php_ruleid", \Common\Lib\Form::urlrule('content', 'show', 0, "", 'name="show_php_ruleid"'));				//内容
		$this->assign("show_html_ruleid", \Common\Lib\Form::urlrule('content', 'show', 1, "", 'name="show_html_ruleid"'));

		//角色组
		$this->assign("Role_group", M("Role")->order(array("id" => "ASC"))->select());

		$this->display();

	}

	/*
	 * 添加栏目提交
	 * @author cx
	 * @time 20160523
	 *
	 * */

	function add_post(){

		if (IS_POST) {

			$Category = D("Portal/Category");
			//批量添加
			$isbatch = I('post.isbatch', 0, 'intval');

			if ($isbatch) {  //批量添加
				$post = $_POST;
				unset($post['isbatch'], $post['info']['catname'], $post['info']['catdir']);
				//需要批量添加的栏目
				$batch_add = explode("\n", $_POST['batch_add']);
				if (empty($batch_add) || empty($_POST['batch_add'])) {
					$this->error('请填写需要添加的栏目！');
				}

				foreach ($batch_add as $rs) {
					$cat = explode('|', $rs, 2);
					if ($cat[0] && $cat[1]) {
						$post['info']['catname'] = $cat[0];
						$post['info']['catdir'] = $cat[1];
						$catid = $Category->addCategory($post);
						if ($catid) {
							//更新角色栏目权限
							D("Portal/Category_priv")->update_priv($catid, $_POST['priv_roleid'], 1);
							/* if (isModuleInstall('Member')) {
								//更新会员组权限
								D("Content/Category_priv")->update_priv($catid, $_POST['priv_groupid'], 0);
							} */
						}
					}
				}
				$this->success("添加成功！", U("AdminTerm/index"));
			} else {

				$catid = $Category->addCategory($_POST);
				if ($catid) {
					//更新角色栏目权限
					D("Portal/Category_priv")->update_priv($catid, $_POST['priv_roleid'], 1);
					$this->success("添加成功！", U("AdminTerm/index"));
				} else {
					$error = $Category->getError();
					$this->error($error ? $error : '栏目添加失败！');
				}
			}

		}
	}

	/*
	 * 栏目修改
	 *
	 * @author cx
	 * @time 20160523
	 *
	 *  */

	function edit(){

		$catid = I('get.catid', 0, 'intval');
		$array = S("Category");
		foreach ($array as $k => $v) {
			$array[$k] = getCategory($v['catid']);
			if ($v['child'] == "0") {
				$array[$k]['disabled'] = "disabled";
			} else {
				$array[$k]['disabled'] = "";
			}
		}
		$data = getCategory($catid);

		$setting = $data['setting'];
		//输出可用模型
		$modelsdata = cache("Model");
		$models = array();
		foreach ($modelsdata as $v) {
			if ($v['disabled'] == 0 && $v['type'] == 0) {
				$models[] = $v;
			}
		}
		if (!empty($array) && is_array($array)) {
			$this->tree->icon = array('&nbsp;&nbsp;&nbsp;│ ', '&nbsp;&nbsp;&nbsp;├─ ', '&nbsp;&nbsp;&nbsp;└─ ');
			$this->tree->nbsp = '&nbsp;&nbsp;&nbsp;';
			$this->tree->init($array);
			$str = "<option value='\$catid' \$selected \$disabled>\$spacer \$catname</option>";
			$categorydata = $this->tree->get_tree(0, $str, $data['parentid']);
		} else {
			$categorydata = '';
		}

		$this->assign("category_php_ruleid", \Common\Lib\Form::urlrule('content', 'category', 0, $setting['category_ruleid'], 'name="category_php_ruleid"'));
		$this->assign("category_html_ruleid", \Common\Lib\Form::urlrule('content', 'category', 1, $setting['category_ruleid'], 'name="category_html_ruleid"'));

		$this->assign("show_php_ruleid", \Common\Lib\Form::urlrule('content', 'show', 0, $setting['show_ruleid'], 'name="show_php_ruleid"'));
		$this->assign("show_html_ruleid", \Common\Lib\Form::urlrule('content', 'show', 1, $setting['show_ruleid'], 'name="show_html_ruleid"'));

		$this->assign("tp_category", getTemlateHtml("Category"));
		$this->assign("tp_list",     getTemlateHtml("List"));
		$this->assign("tp_show",     getTemlateHtml("Show"));
		$this->assign("tp_comment",  getTemlateHtml("Comment"));
		$this->assign("tp_page",     getTemlateHtml("Page"));


		$this->assign("category", $categorydata);
		$this->assign("models", $models);
		$this->assign("data", $data);
		$this->assign("setting", $setting);
		//栏目扩展字段
		//$this->assign('extendList', D("Content/Category")->getExtendField($catid));
		//角色组

		$role_group = M("Role")->order(array("id" => "ASC"))->select();

		$privs = M("CategoryPriv")->where(array('catid' => $catid))->select();


		foreach($role_group as $rkey=>$rvalue){
			$role_group[$rkey]['init'] = D("Portal/CategoryPriv")->check_category_priv($privs,"init", $rvalue['id'],1);
			$role_group[$rkey]['add'] = D("Portal/CategoryPriv")->check_category_priv($privs,"add", $rvalue['id'],1);
			$role_group[$rkey]['edit'] = D("Portal/CategoryPriv")->check_category_priv($privs,"edit", $rvalue['id'],1);
			$role_group[$rkey]['delete'] = D("Portal/CategoryPriv")->check_category_priv($privs,"delete", $rvalue['id'],1);
			$role_group[$rkey]['listorder'] = D("Portal/CategoryPriv")->check_category_priv($privs,"listorder", $rvalue['id'],1);
			$role_group[$rkey]['push'] = D("Portal/CategoryPriv")->check_category_priv($privs,"push", $rvalue['id'],1);
			$role_group[$rkey]['remove'] = D("Portal/CategoryPriv")->check_category_priv($privs,"remove", $rvalue['id'],1);
		}
		$this->assign("Role_group", $role_group);

		//权限数据

		$this->assign("big_menu", array(U("Category/index"), "栏目管理"));

		/* if (isModuleInstall('Member')) {
			//会员组
			$this->assign("Member_group", cache("Member_group"));
		} */
		if ($data['type'] == 1) {//单页栏目
			$this->display("singlepage_edit");
		} else if ($data['type'] == 2) {//外部栏目
			$this->display("wedit");
		} else {
			$this->display();
		}

	}

	/*
	 * 栏目编辑提交
	 * @author cx
	 * @time 20160523
	 *
	 * */

	function edit_post(){

		if (IS_POST) {
			/* if ($this->terms_model->create()) {
				if ($this->terms_model->save()!==false) {
				    F('all_terms',null);
					$this->success("修改成功！");
				} else {
					$this->error("修改失败！");
				}
			} else {
				$this->error($this->terms_model->getError());
			} */



			$catid = I("post.catid", "", "intval");
			if (empty($catid)) {
				$this->error('请选择需要修改的栏目！');
			}
			$Category = D("Portal/Category");
			$status = $Category->editCategory($_POST);
			if ($status) {
				//应用权限设置到子栏目
				if ($_POST['priv_child']) {
					//子栏目
					$arrchildid = $Category->where(array('catid' => $catid))->getField('arrchildid');
					$arrchildid_arr = explode(',', $arrchildid);
					foreach ($arrchildid_arr as $arr_v) {
						D("Portal/Category_priv")->update_priv($arr_v, $_POST['priv_roleid'], 1);
					}
				} else {
					//更新角色栏目权限
					D("Portal/Category_priv")->update_priv($catid, $_POST['priv_roleid'], 1);
					/* if (isModuleInstall('Member')) {
						//更新会员组权限
						D("Content/Category_priv")->update_priv($catid, $_POST['priv_groupid'], 0);
					} */
				}
				$this->success("更新成功！", U("AdminTerm/index"));
			} else {
				$error = $Category->getError();
				$this->error($error ? $error : '栏目修改失败！');
			}


		}
	}

	//排序
	public function listorders() {
		$status = parent::_listorders($this->terms_model);
		if ($status) {
			$this->success("排序更新成功！");
		} else {
			$this->error("排序更新失败！");
		}
	}

	/**
	 *  删除
	 *  @author cx
	 *  @time 20160523
	 */
	public function delete() {
		/* $id = intval(I("get.id"));
		$count = $this->terms_model->where(array("parent" => $id))->count();

		if ($count > 0) {
			$this->error("该菜单下还有子类，无法删除！");
		}

		if ($this->terms_model->delete($id)!==false) {
			$this->success("删除成功！");
		} else {
			$this->error("删除失败！");
		} */


		$catid = I("get.catid", "", "intval");
		if (!$catid) {
			$this->error("请指定需要删除的栏目！");
		}
		if (false == D("Portal/Category")->deleteCatid($catid)) {
			$this->error("栏目删除失败，错误原因可能是栏目下存在信息，无法删除！");
		}
		$this->success("栏目删除成功！", U("AdminTerm/public_cache"));



	}

	/*
	 * 更新缓存
	 *
	 * @author cx
	 *
	 * */
	public function public_cache() {
		$db = D("Portal/Category");

		//当前
		$number = I('get.number', 1, 'intval');
		//每次处理多少栏目
		$handlesum = 100;
		//计算栏目总数
		$count = I('get.count', $db->count(), 'intval');
		//需要处理几次
		$handlecount = ceil($count / $handlesum);
		if ($number > $handlecount) {
			$this->cache();
			$this->success("缓存更新成功！", U("AdminTerm/index"));
			return true;
		}
		$page = $this->page($count, $handlesum, $number);
		//取出需要处理的栏目数据
		$data = $db->order(array('catid' => 'ASC'))->limit($page->firstRow . ',' . $page->listRows)->select();
		if (empty($data)) {
			$this->cache();
			$this->success("缓存更新成功！", U("AdminTerm/index"));
			return true;
		}
		$categorys = array();
		foreach ($data as $v) {
			$categorys[$v['catid']] = $v;
		}
		$this->repair($categorys);
		$this->assign("waitSecond", 200);
		//跳转到下一轮
		$this->success("栏目总数:<font color=\"#FF0000\">{$count}</font>,每次处理:<font color=\"#FF0000\">{$handlesum}</font>,进度:<font color=\"#FF0000\">{$number}/{$handlecount}</font>,栏目缓存更新中...", U('public_cache', array('count' => $count, 'number' => $number + 1)));
	}

	/**
	 * 修复栏目数据
	 * @param type $categorys 需要修复的栏目数组
	 * @author cx
	 * @return boolean
	 */
	protected function repair($categorys) {
		if (is_array($categorys)) {
			foreach ($categorys as $catid => $cat) {
				//外部栏目无需修复
				if ($cat['type'] == 2) {
					continue;
				}
				//获取父栏目ID列表
				$arrparentid = D("Portal/Category")->getArrparentid($catid);
				//栏目配置信息反序列化
				$setting = unserialize($cat['setting']);
				//获取子栏目ID列表
				$arrchildid = D("Portal/Category")->getArrchildid($catid);
				//检查所有父id 子栏目id 等相关数据是否正确，不正确更新
				if ($categorys[$catid]['arrparentid'] != $arrparentid || $categorys[$catid]['arrchildid'] != $arrchildid) {
					D("Portal/Category")->where(array('catid' => $catid))->save(array('arrparentid' => $arrparentid, 'arrchildid' => $arrchildid));
				}
				//获取父栏目路径
				$parentdir = $this->Url->get_categorydir($catid);
				//获取栏目名称
				$catname = iconv('utf-8', 'gbk', $cat['catname']);
				//返回拼音
				$letters = $this->iconvfunc->gbk_to_pinyin($catname);
				$letter = strtolower(implode('', $letters));
				//取得栏目相关地址和分页规则
				$category_url = $this->Url->category_url($catid);
				if (false == $category_url) {
					return false;
				}
				$url = $category_url['url'];
				//更新数据
				$save = array();
				//更新URL
				if ($cat['url'] != $url) {
					$save['url'] = $url;
				}
				if ($categorys[$catid]['parentdir'] != $parentdir || $categorys[$catid]['letter'] != $letter) {
					$save['parentdir'] = $parentdir;
					$save['letter'] = $letter;
				}
				if (count($save) > 0) {
					D("Portal/Category")->where(array('catid' => $catid))->save($save);
				}
				//刷新单栏目缓存
				getCategory($catid, '', true);
			}
		}
		return true;
	}

	/**
	 * 清除栏目缓存
	 * @author cx
	 */
	protected function cache() {
		cache('Category', NULL);
	}

	/*
	 * 栏目属性转换  child 字段的转换
	 *
	 * @author cx
	 * @time 20160519
	 * */


	public function categoryshux() {
		$catid = I('get.catid', 0, 'intval');
		$r = M("Category")->where(array("catid" => $catid))->find();
		if ($r) {
			//栏目类型非0，不允许使用属性转换
			if (!in_array($r['type'], array(0, 1)) || empty($r['modelid'])) {
				$this->error("该栏目类型不允许进行属性转换！", U('AdminTerm/index'));
			}
			$count = M("Category")->where(array("parentid" => $catid))->count();
			if ($count > 0) {
				$this->error("该栏目下已经存在栏目，无法转换！");
			} else {
				$count = M(ucwords(getModel($r['modelid'], 'tablename')))->where(array("catid" => $catid))->count();
				//echo M()->getLastSql();exit;

				if ($count) {
					$this->error("该栏目下已经存在数据，无法转换！");
				}
				$child = $r['child'] ? 0 : 1;
				$status = D("Portal/Category")->where(array("catid" => $catid))->save(array("child" => $child));
				if ($status !== false) {
					getCategory($catid, '', true);
					$this->repair();
					$this->cache();
					$this->success("栏目属性转换成功！");
				} else {
					$this->error("栏目属性转换失败！");
				}
			}
		} else {
			$this->error("栏目不存在！");
		}
	}

	/*
	 * 添加单页
	 * @author cx
	 * @time 20160523
	 *
	 *  */

	public function singlepage(){

		$this->add();

		//$this->display();
	}

	/*
	 * 添加外部链接栏目
	 * @author cx
	 * @time 20160523
	 *
	 *  */

	public function wadd(){
		$this->add();

	}


}