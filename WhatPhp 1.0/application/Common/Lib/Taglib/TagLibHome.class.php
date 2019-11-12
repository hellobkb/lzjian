<?php
namespace Common\Lib\TagLib;
use Think\Template\TagLib;
class TagLibHome extends TagLib {

    /**
     * @var type 
     * 标签定义： 
     *                  attr         属性列表 
     *                  close      标签是否为闭合方式 （0闭合 1不闭合），默认为不闭合 
     *                  alias       标签别名 
     *                  level       标签的嵌套层次（只有不闭合的标签才有嵌套层次）
     * 定义了标签属性后，就需要定义每个标签的解析方法了，
     * 每个标签的解析方法在定义的时候需要添加“_”前缀，
     * 可以传入两个参数，属性字符串和内容字符串（针对非闭合标签）。
     * 必须通过return 返回标签的字符串解析输出，在标签解析类中可以调用模板类的实例。
     */
    protected $tags = array(
        'tc_include' => array("attr" => "file", "close" => 0),
    	'content' => array('attr' => 'action,cache,num,page,pagetp,pagefun,return,where,moreinfo,thumb,order,day,catid,output', 'level' => 3),
        'navigate' => array('attr' => 'cache,catid,space,blank', 'close' => 0),
        'pre' => array('attr' => 'catid,id,target,msg,field,field_key,field_val,symbol', 'close' => 0),
        'next' => array('attr' => 'catid,id,target,msg,field,field_key,field_val,symbol', 'close' => 0),
    );

        /**
     * 获取上一篇标签
     * 使用方法：
     *      用法示例：<pre catid="1" id="1" target="1" msg="已经没有了" />
     * 参数说明：
     *          @catid      栏目id，可以传入数字,在内容页可以不传
     *          @id     信息id，可以传入数字,在内容页可以不传
     *          @target     是否新窗口打开，1 是 0否
     *          @msg        当没有上一篇时的提示语
     * @param type $attr
     * @param type $content
     * @return type
     */
    public function _pre($tag, $content) {
        //当没有内容时的提示语
        $msg = !empty($tag['msg']) ? $tag['msg'] : '已经没有了';
        //是否新窗口打开
        $target = !empty($tag['blank']) ? ' target=\"_blank\" ' : '';
        //返回对应字段内容
        $field = $tag['field'] && in_array($tag['field'], array('id', 'title', 'url')) ? $tag['field'] : '';
        if (!$tag['catid']) {
            $tag['catid'] = '$catid';
        }
        if (!$tag['id']) {
            $tag['id'] = '$id';
        }
        $order = empty($tag['order']) ? 'id asc' : "{$tag['order']}";

        $tag['field_key'] = "{$tag['field_key']}";
        $tag['field_val'] = "{$tag['field_val']}";
        $tag['symbol'] = "{$tag['symbol']}";

        $parsestr = '<?php ';
        $parsestr .= ' $_pre_r = \Content\Model\ContentModel::getInstance(getCategory(' . $tag['catid'] . ',"modelid"))->where(array("catid"=>' . $tag['catid'] . ',"status"=>99,"is_del"=>0,"'.$tag['field_key'].'"=>array("'.$tag['symbol'].'",' . $tag['field_val'] . ')))->order("'.$order.'")->field("id,title,url")->find(); ';
        if ($field) {
            $parsestr .= ' echo $_pre_r?$_pre_r["' . $field . '"]:""';
        } else {
            $parsestr .= ' echo $_pre_r?"<a class=\"pre_a\" href=\"".$_pre_r["url"]."\" ' . $target . '>".$_pre_r["title"]."</a>":"' . str_replace('"', '\"', $msg) . '";';
        }
        $parsestr .= ' ?>';
        return $parsestr;
    }

    /**
     * 获取下一篇标签
     * 使用方法：
     *      用法示例：<next catid="1" id="1" target="1" msg="已经没有了" />
     * 参数说明：
     *          @catid      栏目id，可以传入数字,在内容页可以不传
     *          @id         信息id，可以传入数字,在内容页可以不传
     *          @target     是否新窗口打开，1 是 0否
     *          @msg        当没有上一篇时的提示语
     * @param type $attr
     * @param type $content
     * @return type
     */
    public function _next($tag, $content) {
        //当没有内容时的提示语
        $msg = !empty($tag['msg']) ? $tag['msg'] : '已经没有了';
        //是否新窗口打开
        $target = !empty($tag['blank']) ? ' target=\"_blank\" ' : '';
        //返回对应字段内容
        $field = $tag['field'] && in_array($tag['field'], array('id', 'title', 'url')) ? $tag['field'] : '';
        if (!$tag['catid']) {
            $tag['catid'] = '$catid';
        }
        if (!$tag['id']) {
            $tag['id'] = '$id';
        }

        $order = empty($tag['order']) ? 'id asc' : "{$tag['order']}";

        $tag['field_key'] = "{$tag['field_key']}";
        $tag['field_val'] = "{$tag['field_val']}";
        $tag['symbol'] = "{$tag['symbol']}";

        $parsestr = '<?php ';
        $parsestr .= ' $_pre_n = \Content\Model\ContentModel::getInstance(getCategory(' . $tag['catid'] . ',"modelid"))->where(array("catid"=>' . $tag['catid'] . ',"status"=>99,"is_del"=>0,"'.$tag['field_key'].'"=>array("'.$tag['symbol'].'",' . $tag['field_val'] . ')))->order("'.$order.'")->field("id,title,url")->find(); ';
         
        if ($field) {
            $parsestr .= ' echo $_pre_n?$_pre_n["' . $field . '"]:""';
              
        } else {
            
           /* $parsestr .= ' if($_pre_n){ echo "<a class=\"pre_a\" href=\"".$_pre_n["url"]."\" ' . $target . '>".$_pre_n["title"]."</a>" ;  }else{  $new = \Content\Model\ContentModel::getInstance(getCategory(' . $tag['catid'] . ',"modelid"))->where(array("status"=>99))->order(array("id" => "ASC"))->field("id,title,url")->find(); if($new){ echo "<a class=\"pre_a\" href=\"".$new["url"]."\" ' . $target . '>".$new["title"]."</a>" ;  }  } ';*/

            $parsestr .= ' echo $_pre_n?"<a class=\"pre_a\" href=\"".$_pre_n["url"]."\" ' . $target . '>".$_pre_n["title"]."</a>":"' . str_replace('"', '\"', '<a href="javascript:;" title="Next Product">'.$msg.'</a>') . '";';  
        }
        $parsestr .= ' ?>';
         
        return $parsestr;
    }

    /**
     * 获取下一篇标签
     * 使用方法：
     *      用法示例：<next catid="1" id="1" target="1" msg="已经没有了" />
     * 参数说明：
     *          @catid      栏目id，可以传入数字,在内容页可以不传
     *          @id         信息id，可以传入数字,在内容页可以不传
     *          @target     是否新窗口打开，1 是 0否
     *          @msg        当没有上一篇时的提示语
     * @param type $attr
     * @param type $content
     * @return type
     */
    /*public function _next($tag, $content) {
        //当没有内容时的提示语
        $msg = !empty($tag['msg']) ? $tag['msg'] : '已经没有了';
        //是否新窗口打开
        $target = !empty($tag['blank']) ? ' target=\"_blank\" ' : '';
        //返回对应字段内容
        $field = $tag['field'] && in_array($tag['field'], array('id', 'title', 'url')) ? $tag['field'] : '';
        if (!$tag['catid']) {
            $tag['catid'] = '$catid';
        }
        if (!$tag['id']) {
            $tag['id'] = '$id';
        }

        $order = empty($tag['order']) ? 'id asc' : "{$tag['order']}";

        $parsestr = '<?php ';
        $parsestr .= ' $_pre_n = \Content\Model\ContentModel::getInstance(getCategory(' . $tag['catid'] . ',"modelid"))->where(array("catid"=>' . $tag['catid'] . ',"status"=>99,"id"=>array("GT",' . $tag['id'] . ')))->order("'.$order.'")->field("id,title,url")->find(); ';
         
        if ($field) {
            $parsestr .= ' echo $_pre_n?$_pre_n["' . $field . '"]:""';
              
        } else {
        	
            $parsestr .= ' if($_pre_n){ echo "<a class=\"pre_a\" href=\"".$_pre_n["url"]."\" ' . $target . '>".$_pre_n["title"]."</a>" ;  }else{  $new = \Content\Model\ContentModel::getInstance(getCategory(' . $tag['catid'] . ',"modelid"))->where(array("status"=>99))->order(array("id" => "ASC"))->field("id,title,url")->find(); if($new){ echo "<a class=\"pre_a\" href=\"".$new["url"]."\" ' . $target . '>".$new["title"]."</a>" ;  }  } ';

            //$parsestr .= ' echo $_pre_n?"<a class=\"pre_a\" href=\"".$_pre_n["url"]."\" ' . $target . '>".$_pre_n["title"]."</a>":"' . str_replace('"', '\"', '<a href="javascript:;" title="Next Product">'.$msg.'</a>') . '";';  
        }
        $parsestr .= ' ?>';
         
        return $parsestr;
    }*/

    /**
     * 模板包含标签 
     * 格式
     * <tc_include file=""/>
     * @staticvar array $_tc_include_templateParseCache
     * @param type $tag 属性数据
     * @param type $content 标签内容
     * @return array 
     */
    public function _tc_include($tag, $content) {
        static $_tc_include_templateParseCache = array();
        $file = str_replace(":", "/", $tag['file']);
        $cacheIterateId = md5($file . $content);
        if (isset($_tc_include_templateParseCache[$cacheIterateId])) {
           return $_tc_include_templateParseCache[$cacheIterateId];
        }
        //模板路径
        $TemplatePath = sp_add_template_file_suffix( C("SP_TMPL_PATH") .C('SP_DEFAULT_THEME')."/". $file ) ;
        //判断模板是否存在
        if (!file_exists_case($TemplatePath)) {
            return false;
        }
        //读取内容
        $tmplContent = file_get_contents($TemplatePath);
        //解析模板内容
        $parseStr = $this->tpl->parse($tmplContent);
        $_tc_include_templateParseCache[$cacheIterateId] = $parseStr;
        return $_tc_include_templateParseCache[$cacheIterateId];
    }
    
    

    // 数据库where表达式
    protected $comparisonShuipfcms = array(
    		'{eq}' => '=',
    		'{neq}' => '<>',
    		'{elt}' => '<=',
    		'{egt}' => '>=',
    		'{gt}' => '>',
    		'{lt}' => '<',
    );



    /**
     * 导航标签
     * 使用方法：
     *      用法示例：<navigate catid="$catid" space=" &gt; " />
     * 参数说明：
     *          @catid      栏目id，可以传入数字，也可以传递变量 $catid
     *          @space      分隔符，支持html代码
     *          @blank      是否新窗口打开
     *          @cache                              缓存时间
     * @staticvar array $_navigateCache
     * @param type $attr 标签属性
     * @param type $content 表情内容
     * @return array|string
     */
    public function _navigate($tag, $content) {
        $key = to_guid_string(array($tag, $content));
        $cache = (int) $tag['cache'];
        if ($cache) {
            $data = S($key);
            if ($data) {
                return $data;
            }
        }
        //分隔符，支持html代码
        $space = !empty($tag['space']) ? $tag['space'] : '&gt;';
        //是否新窗口打开
        $target = !empty($tag['blank']) ? ' target="_blank" ' : '';
        $catid = $tag['catid'];
        $parsestr = '';
        // 面包屑导航的最后一个class
        $mmc = $tag['mmc'];

        //如果传入的是纯数字
        if (is_numeric($catid)) {
            $catid = (int) $catid;
            if (getCategory($catid) == false) {
                return '';
            }
            //获取当前栏目的 父栏目列表
            $arrparentid = array_filter(explode(',', getCategory($catid, 'arrparentid') . ',' . $catid));
            $zc_mmc = end($arrparentid);
            foreach ($arrparentid as $cid) {
                if($cid==$zc_mmc){
                    $parsestr[] = '<a href="' . getCategory($cid, 'url') . '" ' . $target . ' class="'.$mmc.'">' . getCategory($cid, 'catname') . '</a>';
                }else{
                    $parsestr[] = '<a href="' . getCategory($cid, 'url') . '" ' . $target . '>' . getCategory($cid, 'catname') . '</a>';
                }

            }
            $parsestr = implode($space, $parsestr);
        } else {
            $parsestr = '';
            $parsestr .= '<?php';
            $parsestr .= '  $arrparentid = array_filter(explode(\',\', getCategory(' . $catid . ',"arrparentid") . \',\' . ' . $catid . ')); ';
            $parsestr .= '  $zc_mmc = end($arrparentid);';
            $parsestr .= '  foreach ($arrparentid as $cid) {';
            $parsestr .= '      if($zc_mmc==$cid)';
            $parsestr .= '      $parsestr[] = \'<a href="\' . getCategory($cid,\'url\')  . \'" ' . $target . ' class="'.$mmc.'">\' . getCategory($cid,\'catname\') . \'</a>\';';
            $parsestr .= '      else';
            $parsestr .= '      $parsestr[] = \'<a href="\' . getCategory($cid,\'url\')  . \'" ' . $target . '>\' . getCategory($cid,\'catname\') . \'</a>\';';
            $parsestr .= '  }';
            $parsestr .= '  echo  implode("' . $space . '", $parsestr);';
            $parsestr .= '?>';
        }
        if ($cache) {
            S($key, $parsestr, $cache);
        }
        return $parsestr;
    }

    /**
     * 内容标签 output参数等于1时，调用content_output.class.php处理
     * 标签：<content></content>
     * 作用：内容模型相关标签，可调用栏目，列表等常用信息
     * 用法示例：<content action="lists" catid="$catid"  order="id DESC" num="4" page="$page"> .. HTML ..</content>
     * 参数说明：
     * 	基本参数
     * 		@action		调用方法（必填）
     * 		@page		当前分页号，默认$page，当传入该参数表示启用分页，一个页面只允许有一个page，多个标签使用多个page会造成不可预知的问题。
     * 		@num		每次返回数据量
     * 		@catid		栏目id（必填），列表页，内容页可以使用 $catid 获取当前栏目。
     * 	公用参数：
     * 		@cache		数据缓存时间，单位秒
     * 		@pagefun                      分页函数，默认page
     * 		@pagetp		分页模板，必须是变量传递
     * 		@return		返回值变量名称，默认data
     * 	#当action为lists时，调用栏目信息列表标签
     * 	#用法示例：<content action="lists" catid="$catid"  order="id DESC" num="4" page="$page"> .. HTML ..</content>
     * 	独有参数：
     * 		@order		排序，例如“id DESC”
     * 		@where		sql语句的where部分 例如：`thumb`!='' AND `status`=99
     * 		@thumb		是否仅必须缩略图，1为调用带缩略图的
     * 		@moreinfo                    是否调用副表数据 1为是
     * 	#当action为hits时，调用排行榜
     * 	#用法示例：<content action="hits" catid="$catid"  order="weekviews DESC" num="10"> .. HTML ..</content>
     * 	独有参数：
     * 		@order		排序，例如“weekviews DESC”
     * 		@day		调用多少天内的排行
     * 		@where		sql语句的where部分
     * 	#当action为relation时，调用相关文章
     * 	#用法示例：<content action="relation" relation="$relation" catid="$catid"  order="id DESC" num="5" keywords="$keywords"> .. HTML ..</content>
     * 	独有参数：
     * 		@nid		排除id 一般是 $id，排除当前文章
     * 		@keywords	内容页面取值：$keywords，也就是关键字
     * 		@relation		内容页取值$relation，当有$relation时keywords参数失效
     * 		@where		sql语句的where部分
     * 	#当action为category时，调用栏目列表
     * 	#用法示例：<content action="category" catid="$catid"  order="listorder ASC" > .. HTML ..</content>
     * 	独有参数：
     * 		@order		排序，例如“id DESC”
     * 		@where                          sql语句的where部分 例如：`child` = 0
     *
     * +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $attr 标签属性
     * @param string $content  标签内容
     +----------------------------------------------------------
     * @return string|void
     +----------------------------------------------------------
    */
    public function _content($tag, $content) {
    	$tag['catid'] = $catid = $tag['catid'];
    	//每页显示总数
    	$tag['num'] = $num = $tag['num'];
    	//当前分页参数
    	$tag['page'] = $page = (isset($tag['page'])) ? ( (substr($tag['page'], 0, 1) == '$') ? $tag['page'] : (int) $tag['page'] ) : 0;
         
    	//分页函数，默认page
    	$tag['pagefun'] = $pagefun = empty($tag['pagefun']) ? "page" : trim($tag['pagefun']);
    	//数据返回变量
    	$tag['return'] = $return = empty($tag['return']) ? "data" : $tag['return'];
    	//方法
    	$tag['action'] = $action = trim($tag['action']);
    	//sql语句的where部分
    	if (isset($tag['where']) && $tag['where']) {
    		$tag['where'] = $this->parseSqlCondition($tag['where']);
    	}
    	//拼接php代码
    	$parseStr = '<?php';
    	$parseStr .= ' $content_tag = \Think\Think::instance("\Content\TagLib\Content");' . "\r\n";
    	//如果有传入$page参数，则启用分页。
    	if ($page && in_array($action, array('lists'))) {
    		//分页配置处理

            // $tag['page_jump'] = 'select';
            // $tag['page_tplconfig'] = array('listlong' => 6, 'listsidelong' => 2, "first" => "首页", "last" => "尾页", "prev" => "上一页", "next" => "Next", "list" => "*", "disabledclass" => "",'ss'=>'adettedc');

    		$pageConfig = $this->resolvePageParameter($tag);
    		//进行信息数量统计 需要 action catid where
    		$parseStr .= ' $count = $content_tag->count(' . self::arr_to_html($tag) . ');' . "\r\n";
    		//分页函数
    		$parseStr .= ' $_page_ = ' . $pagefun . '($count ,' . $num . ',' . $page . ',' . self::arr_to_html($pageConfig) . ');';
    		$tag['count'] = '$count';
    		$tag['limit'] = '$_page_->firstRow.",".$_page_->listRows';
    		//总分页数，生成静态时需要
    		$parseStr .= ' $GLOBALS["Total_Pages"] = $_page_->Total_Pages;';
    		//显示分页导航
    		$parseStr .= ' $pages = $_page_->show("default");';
    		//分页总数
    		$parseStr .= ' $pagetotal = $_page_->Total_Pages;';
    		//总信息数
    		$parseStr .= ' $totalsize = $_page_->Total_Size;';
    	}
    	$parseStr .= ' if(method_exists($content_tag, "' . $action . '")){';
    	$parseStr .= ' $' . $return . ' = $content_tag->' . $action . '(' . self::arr_to_html($tag) . ');';
    	$parseStr .= ' }';
    
    	$parseStr .= ' ?>';
    	//解析模板
    	$parseStr .= $this->tpl->parse($content);
    	return $parseStr;
    }
    
    
    /**
     * 解析条件表达式
     * @access public
     * @param string $condition 表达式标签内容
     * @return array
     */
    protected function parseSqlCondition($condition) {
    	$condition = str_ireplace(array_keys($this->comparisonShuipfcms), array_values($this->comparisonShuipfcms), $condition);
    	return $condition;
    }
    
    /**
     * 解析分页参数
     * @param type $tag
     * @return type\
     */
    protected function resolvePageParameter(&$tag) {
    	if (empty($tag)) {
    		return array();
    	}
    	//分页设置
    	$config = array();
    	foreach ($tag as $key => $value) {
    		if ($key && substr($key, 0, 5) == "page_") {
    			//配置名称
    			$name = str_replace('page_', '', $key);
    			if (substr($value, 0, 1) == '$') {
    				$config[$name] = $value;
    			} else {
    				$config[$name] = $this->parseSqlCondition($value);
    			}
    			unset($tag[$key]);
    		}
    	}
    	//兼容 pagetp 参数
    	if (!empty($tag['pagetp'])) {
    		$config['tpl'] = (substr($tag['pagetp'], 0, 1) == '$') ? $tag['pagetp'] : '';
    	}
    	//标签默认开启自定义分页规则
    	$config['isrule'] = true;
    	return $config;
    }
    
    
    /**
     * 转换数据为HTML代码
     * @param array $data 数组
     */
    private static function arr_to_html($data) {
    	if (is_array($data)) {
    		$str = 'array(';
    		foreach ($data as $key => $val) {
    			if (is_array($val)) {
    				$str .= "'$key'=>" . self::arr_to_html($val) . ",";
    			} else {
    				//如果是变量的情况
    				if (strpos($val, '$') === 0) {
    					$str .= "'$key'=>$val,";
    				} else if (preg_match("/^([a-zA-Z_].*)\(/i", $val, $matches)) {//判断是否使用函数
    					if (function_exists($matches[1])) {
    						$str .= "'$key'=>$val,";
    					} else {
    						$str .= "'$key'=>'" . self::newAddslashes($val) . "',";
    					}
    				} else {
    					$str .= "'$key'=>'" . self::newAddslashes($val) . "',";
    				}
    			}
    		}
    		return $str . ')';
    	}
    	return false;
    }
    
    /**
     * 返回经addslashes处理过的字符串或数组
     * @param $string 需要处理的字符串或数组
     * @return mixed
     */
    protected static function newAddslashes($string) {
    	if (!is_array($string))
    		return addslashes($string);
    	foreach ($string as $key => $val)
    		$string[$key] = $this->newAddslashes($val);
    	return $string;
    }
    

}

