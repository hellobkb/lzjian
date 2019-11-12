-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 11 月 11 日 13:49
-- 服务器版本: 5.5.47-log
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `xinfu`
--

-- --------------------------------------------------------

--
-- 表的结构 `cmf_ad`
--

CREATE TABLE IF NOT EXISTS `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_admin_log`
--

CREATE TABLE IF NOT EXISTS `cmf_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ltime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `uid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'uid',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
  PRIMARY KEY (`id`),
  KEY `ltime` (`ltime`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4561 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_article`
--

CREATE TABLE IF NOT EXISTS `cmf_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` varchar(40) NOT NULL DEFAULT '',
  `description` mediumtext,
  `url` char(100) NOT NULL DEFAULT '',
  `moveurl` char(100) NOT NULL COMMENT '动态url地址',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `istop` tinyint(2) NOT NULL COMMENT '置顶 0否，1是',
  `recommend` tinyint(2) NOT NULL COMMENT '推荐 0否1是',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `prefix` varchar(255) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  `seotitle` mediumtext,
  `seokeywords` mediumtext,
  `seodescription` mediumtext,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  `is_del` tinyint(10) NOT NULL DEFAULT '0' COMMENT '0存在，1回收站',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `cmf_article`
--

INSERT INTO `cmf_article` (`id`, `catid`, `title`, `style`, `thumb`, `keywords`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `prefix`, `tags`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay`, `is_del`) VALUES
(20, 61, '这是动静子栏目2内容', '', '', '', 'adsfadsfasdf', 'http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=61&id=20', 'http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=61&id=20', 0, 99, 1, 0, 1, 0, 'admin', 1466760553, 1466760553, '', '', 0, 0, 0, 0, 0, 0, '这是动静子栏目2内容 Supply', '这是动静子栏目2内容  Manufacturer', '', 'lasldflasdfasdf', 0, 0),
(43, 96, 'woshifu', '', 'data/upload/20161024/580d7712536ab.jpg', '', '', 'http://localhost/xinxiangmu/news/43-43.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=43', 0, 99, 0, 1, 1, 0, 'admin', 1477365369, 1477365369, '', '', 0, 0, 0, 0, 0, 0, 'How to carry out the welding of steel ... Supplier', 'How to carry out the welding of steel ...  Manufacturer', NULL, '43', 0, 0),
(46, 96, 'it is winter', '', 'data/upload/20161029/58140c6d44f71.jpg', '', 'it is winter', 'http://localhost/xinxiangmu/news/46-46.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=46', 0, 99, 0, 0, 1, 0, 'admin', 1477708915, 1477708915, '', '', 0, 0, 0, 0, 0, 0, '', '', 'a:5:{s:4:"des1";N;s:7:"desc_mo";N;s:4:"des2";N;s:4:"des3";N;s:4:"des4";N;}', '46', 0, 0),
(31, 96, 'HIGH-QUALITY PRODUCTS', '', 'data/upload/20160924/57e5dfbb6e88e.jpg', '', '', 'http://localhost/xinxiangmu/news/31-31.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=31', 0, 99, 1, 0, 1, 0, 'admin', 1474598033, 1474598033, '', '', 0, 0, 0, 0, 0, 0, 'China HIGH-QUALITY PRODUCTS', 'HIGH-QUALITY PRODUCTS Wholesale', NULL, '31', 0, 0),
(32, 96, 'PROFESSIONAL EXPORT EXPERINCE', '', 'data/upload/20160924/57e5dfd276ab4.jpg', '', '', 'http://localhost/xinxiangmu/news/32-32.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=32', 0, 99, 1, 0, 1, 0, 'admin', 1474598101, 1474598101, '', '', 0, 0, 0, 0, 0, 0, 'ODM PROFESSIONAL EXPORT EXPERINCE', 'Sale PROFESSIONAL EXPORT EXPERINCE', NULL, '32', 0, 0),
(33, 96, 'MUTAL COOPRATION AND DEVELOPMENT', '', 'data/upload/20160924/57e5dfe788c91.jpg', '', '', 'http://localhost/xinxiangmu/news/33-33.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=33', 0, 99, 1, 0, 1, 0, 'admin', 1474598158, 1474598158, '', '', 0, 0, 0, 0, 0, 0, 'MUTAL COOPRATION AND DEVELOPMENT Wholesaler', 'MUTAL COOPRATION AND DEVELOPMENT Wholesaler', NULL, '33', 0, 0),
(30, 96, 'WE ARE FACTORY', '', 'data/upload/20160924/57e5dffa4e742.jpg', '', '', 'http://localhost/xinxiangmu/news/30-30.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=30', 0, 99, 1, 0, 1, 0, 'admin', 1474597967, 1474597967, '', '', 0, 0, 0, 0, 0, 0, 'Custom WE ARE FACTORY', 'WE ARE FACTORY for Sale', NULL, '30', 0, 0),
(38, 94, 'certificate5', '', 'data/upload/20160923/57e4c02c67a87.jpg', '', '', 'http://localhost/xinxiangmu/cn/certificates/38.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=show_art&catid=94&id=38', 0, 99, 0, 0, 1, 0, 'admin', 1474609198, 1474609198, '', '', 0, 0, 0, 0, 0, 0, 'certificate5 Wholesaler', 'rebar coupler', NULL, '38', 0, 0),
(41, 96, 'Professional Export Experince', '', 'data/upload/20161024/580d759937952.jpg', '', 'heloooooooo', 'http://localhost/xinxiangmu/news/41-41.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=41', 2, 99, 0, 1, 1, 0, 'admin', 1474612706, 1474612706, '', '', 0, 0, 0, 0, 0, 0, 'rebar coupler', 'Professional Export Experince Exporter China', NULL, '41', 0, 0),
(42, 96, 'How to carry out the welding of steel...', '', 'data/upload/20161024/580d7712536ab.jpg', '', '', 'http://localhost/xinxiangmu/news/42-42.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_art&catid=96&id=42', 0, 99, 0, 1, 1, 0, 'admin', 1474612744, 1474612744, '', '', 0, 0, 0, 0, 0, 0, 'How to carry out the welding of steel ... Supplier', 'How to carry out the welding of steel ...  Manufacturer', NULL, '42', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_article_data`
--

CREATE TABLE IF NOT EXISTS `cmf_article_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_article_data`
--

INSERT INTO `cmf_article_data` (`id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `copyfrom`) VALUES
(1, '<p><img src="http://localhost/thinkcmf/data/upload/ueditor/20160606/575540af25bf9.jpg" title="download(1).jpg" alt="download(1).jpg"/>我是最新的新闻一</p>', 0, 0, '', 0, 1, '', ''),
(2, '<p style="white-space: normal;">Mid east customer visit Frengrass factory</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">Jan.18,\n mid east customer visit Frengrass factory, and check many landscaping \ngrass samples, at last they decide to buy 4 color grass the first order.</p><p><br/></p><p style="white-space: normal;">Mid east customer visit Frengrass factory</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">Jan.18,\n mid east customer visit Frengrass factory, and check many landscaping \ngrass samples, at last they decide to buy 4 color grass the first order.</p><p><br/></p>', 0, 0, '', 0, 1, '', ''),
(3, '<p>稀里哗啦的下雨啊<br/></p>', 0, 0, '', 0, 1, '', ''),
(20, '<p>adsfadsfasdf</p>', 0, 0, '', 0, 1, '', ''),
(31, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D ...</span></p>', 0, 0, '', 0, 1, '', ''),
(30, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Established in 1958, Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, &nbsp;Non-copper-coated solid wire, &nbsp;submerged arc &amp; stainless steel welding wire. </span></p>', 0, 0, '', 0, 1, '', ''),
(0, '<p>炸弹打飞了。。。。</p><p><img alt="240914090494B.jpg" src="http://localhost/thinkcmf/data/upload/ueditor/20160818/57b571dfa44df.jpg" title="240914090494B.jpg"/></p>', 0, 0, '', 0, 1, '', ''),
(32, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Our Welding wires and welding wire equipment are exported to many countries and regions such as USA, Italy, Brazil, Russia and India etc...</span></p>', 0, 0, '', 0, 1, '', ''),
(33, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Hebei XINYU Welding Co., Ltd Welcome you to our factory any time.</span></p>', 0, 0, '', 0, 1, '', ''),
(34, '<p>one certificate</p>', 0, 0, '', 0, 1, '', ''),
(35, '<p>certificate2<br/></p>', 0, 0, '', 0, 1, '', ''),
(36, '<p>certificate3</p>', 0, 0, '', 0, 1, '', ''),
(37, '<p>certificate4</p>', 0, 0, '', 0, 1, '', ''),
(38, '<p>certificate5</p>', 0, 0, '', 0, 1, '', ''),
(39, '<p>what&#39;s your name</p>', 0, 0, '', 0, 1, '', ''),
(40, '<p>how old are you&nbsp;</p>', 0, 0, '', 0, 1, '', ''),
(41, '<p class="n2_wz">Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, &nbsp;Non-copper-coated solid wire, &nbsp;submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p>', 0, 0, '', 0, 1, '', ''),
(42, '<p>How to carry out the welding of steel ...</p>', 0, 0, '', 0, 1, '', ''),
(43, '<p>How to carry out the welding of steel ...</p>', 0, 0, '', 0, 1, '', ''),
(46, '<p>it is winter, and you?<img src="data/upload/ueditor/20161029/58140c61450ab.jpg" title="it is winter" alt="it is winter"/></p>', 0, 0, '', 0, 1, '', ''),
(47, '<p>It is a well-known fact that positioning equipment can assist welders in maneuvering and welding large assemblies. What might not be so well-known is that many small assemblies also can be mechanically positioned to provide the welding positioner with the same benefits.</p><p>The principles of positioning are the same for all weldments, large or small. The base product is affixed to the positioning equipment and then maneuvered by mechanical means into a position that allows the most effective welding and assembly. As parts or subassemblies are added, the entire weldment is moved to allow easy access to weld joints.</p><p>A properly positioned weldment, regardless of the size, reduces welder fatigue, increases safety, improves weld quality, and saves on production floor space. By moving the weldment using mechanical means and positioning the welding area into a comfortable range, welders are not forced to weld out of position or in an uncomfortable position.</p><p>Safety is improved when the weldment is anchored to a suitable positioning device. Cranes, chains, slings, and other nonrigid methods of moving a part might create uncontrolled motion, which can be dangerous. With the help of a positioner, welders don’t have to maneuver themselves underneath a possibly heavy weldment, reducing the risk of injury from falling sparks, slag, or parts.</p><p>Learn more at: www.weldingrotatorchina.com.</p><p><br/></p>', 0, 0, '', 0, 1, '', ''),
(48, '<p>It is a well-known fact that positioning equipment can assist welders in maneuvering and welding large assemblies. What might not be so well-known is that many small assemblies also can be mechanically positioned to provide the welding positioner with the same benefits.</p><p>The principles of positioning are the same for all weldments, large or small. The base product is affixed to the positioning equipment and then maneuvered by mechanical means into a position that allows the most effective welding and assembly. As parts or subassemblies are added, the entire weldment is moved to allow easy access to weld joints.</p><p>A properly positioned weldment, regardless of the size, reduces welder fatigue, increases safety, improves weld quality, and saves on production floor space. By moving the weldment using mechanical means and positioning the welding area into a comfortable range, welders are not forced to weld out of position or in an uncomfortable position.</p><p>Safety is improved when the weldment is anchored to a suitable positioning device. Cranes, chains, slings, and other nonrigid methods of moving a part might create uncontrolled motion, which can be dangerous. With the help of a positioner, welders don’t have to maneuver themselves underneath a possibly heavy weldment, reducing the risk of injury from falling sparks, slag, or parts.</p><p>Learn more at: www.weldingrotatorchina.com.</p><p><br/></p>', 0, 0, '', 0, 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_artpro`
--

CREATE TABLE IF NOT EXISTS `cmf_artpro` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型：1，文章，5，产品',
  `country` varchar(100) NOT NULL DEFAULT '中国' COMMENT '国家',
  `url` varchar(100) NOT NULL COMMENT '页面链接',
  `title` varchar(200) NOT NULL COMMENT '头部',
  `clicks` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '点击量',
  `time` int(10) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=359 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_asset`
--

CREATE TABLE IF NOT EXISTS `cmf_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_access`
--

CREATE TABLE IF NOT EXISTS `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_auth_access`
--

INSERT INTO `cmf_auth_access` (`role_id`, `rule_name`, `type`) VALUES
(3, 'content/contents/index', 'admin_url'),
(3, 'admin/content/default', 'admin_url'),
(4, 'content/urlrule/edit', 'admin_url'),
(4, 'content/urlrule/add_post', 'admin_url'),
(4, 'content/urlrule/add', 'admin_url'),
(4, 'content/urlrule/index', 'admin_url'),
(4, 'comment/commentadmin/check', 'admin_url'),
(4, 'comment/commentadmin/delete', 'admin_url'),
(4, 'comment/commentadmin/index', 'admin_url'),
(4, 'admin/content/default', 'admin_url'),
(4, 'portal/adminpage/restore', 'admin_url'),
(4, 'portal/adminpage/clean', 'admin_url'),
(4, 'portal/adminpage/recyclebin', 'admin_url'),
(5, 'admin/backup/import', 'admin_url'),
(4, 'api/guestbookdel/index', 'admin_url'),
(4, 'portal/adminpost/clean', 'admin_url'),
(4, 'portal/adminpost/restore', 'admin_url'),
(5, 'admin/backup/download', 'admin_url'),
(5, 'admin/backup/del_backup', 'admin_url'),
(5, 'admin/backup/index_post', 'admin_url'),
(5, 'admin/backup/index', 'admin_url'),
(5, 'admin/backup/restore', 'admin_url'),
(4, 'portal/adminpost/recyclebin', 'admin_url'),
(4, 'admin/recycle/default', 'admin_url'),
(4, 'admin/backup/import', 'admin_url'),
(4, 'admin/backup/del_backup', 'admin_url'),
(4, 'admin/backup/index_post', 'admin_url'),
(4, 'admin/backup/download', 'admin_url'),
(4, 'admin/backup/index', 'admin_url'),
(5, 'admin/backup/default', 'admin_url'),
(5, 'admin/setting/logo', 'admin_url'),
(4, 'admin/backup/restore', 'admin_url'),
(4, 'admin/backup/default', 'admin_url'),
(4, 'admin/setting/logo', 'admin_url'),
(4, 'socialplatform/indexadmin/technical', 'admin_url'),
(4, 'socialplatform/indexadmin/reminder', 'admin_url'),
(4, 'admin/demotem/index', 'admin_url'),
(4, 'content/models/index', 'admin_url'),
(4, 'admin/setting/languages', 'admin_url'),
(4, 'admin/mailer/active_post', 'admin_url'),
(5, 'socialplatform/indexadmin/technical', 'admin_url'),
(5, 'socialplatform/indexadmin/reminder', 'admin_url'),
(5, 'admin/demotem/index', 'admin_url'),
(5, 'content/models/index', 'admin_url'),
(5, 'admin/mailer/active_post', 'admin_url'),
(5, 'admin/main/getversion', 'admin_url'),
(5, 'admin/setting/languages', 'admin_url'),
(5, 'admin/mailer/active', 'admin_url'),
(5, 'admin/mailer/index_post', 'admin_url'),
(5, 'admin/mailer/index', 'admin_url'),
(5, 'admin/mailer/default', 'admin_url'),
(5, 'admin/setting/password_post', 'admin_url'),
(5, 'admin/setting/password', 'admin_url'),
(5, 'admin/user/userinfo_post', 'admin_url'),
(5, 'admin/user/userinfo', 'admin_url'),
(5, 'admin/setting/default', 'admin_url'),
(5, 'admin/setting/userdefault', 'admin_url'),
(5, 'gadgets/translate/index', 'admin_url'),
(5, 'gadgets/exchagerate/index', 'admin_url'),
(5, 'gadgets/customs/index', 'admin_url'),
(5, 'gadgets/worldtime/index', 'admin_url'),
(5, 'gadgets/ip/index', 'admin_url'),
(5, 'gadgets/currency/index', 'admin_url'),
(5, 'gadgets/currency/default', 'admin_url'),
(5, 'release/release/abc', 'admin_url'),
(5, 'crm/corder/confirmorder', 'admin_url'),
(4, 'admin/main/getversion', 'admin_url'),
(4, 'admin/mailer/active', 'admin_url'),
(4, 'admin/mailer/index_post', 'admin_url'),
(4, 'admin/mailer/index', 'admin_url'),
(4, 'admin/mailer/default', 'admin_url'),
(4, 'admin/setting/password_post', 'admin_url'),
(4, 'admin/setting/password', 'admin_url'),
(4, 'admin/user/userinfo_post', 'admin_url'),
(4, 'admin/user/userinfo', 'admin_url'),
(4, 'admin/setting/userdefault', 'admin_url'),
(4, 'admin/setting/default', 'admin_url'),
(5, 'crm/corder/cancelorder', 'admin_url'),
(5, 'crm/corder/delrefund', 'admin_url'),
(5, 'crm/corder/confirmrefund', 'admin_url'),
(5, 'crm/corder/refundpost', 'admin_url'),
(5, 'crm/corder/addrefund', 'admin_url'),
(5, 'crm/corder/editorder', 'admin_url'),
(5, 'crm/corder/editpost', 'admin_url'),
(5, 'crm/cindex/outputorder', 'admin_url'),
(5, 'crm/corder/orderlist', 'admin_url'),
(5, 'crm/corder/ordership', 'admin_url'),
(5, 'crm/cindex/listadd', 'admin_url'),
(5, 'crm/cindex/addlist', 'admin_url'),
(4, 'gadgets/translate/index', 'admin_url'),
(4, 'gadgets/exchagerate/index', 'admin_url'),
(4, 'gadgets/customs/index', 'admin_url'),
(4, 'gadgets/worldtime/index', 'admin_url'),
(4, 'gadgets/ip/index', 'admin_url'),
(4, 'gadgets/currency/index', 'admin_url'),
(4, 'gadgets/currency/default', 'admin_url'),
(4, 'release/release/abc', 'admin_url'),
(5, 'crm/cindex/getsale', 'admin_url'),
(5, 'crm/cindex/oneadd', 'admin_url'),
(5, 'crm/cindex/deleteclient', 'admin_url'),
(5, 'crm/cindex/addcustomer', 'admin_url'),
(5, 'crm/cindex/addone', 'admin_url'),
(5, 'crm/cindex/getclient', 'admin_url'),
(5, 'crm/cindex/totalclient', 'admin_url'),
(5, 'crm/cmanage/flyclient', 'admin_url'),
(4, 'crm/cindex/approvepost', 'admin_url'),
(5, 'crm/cindex/hasorder', 'admin_url'),
(5, 'crm/cindex/reqoffer', 'admin_url'),
(4, 'crm/cindex/approvestatus', 'admin_url'),
(5, 'crm/cindex/requirehelp', 'admin_url'),
(5, 'crm/cindex/addorder', 'admin_url'),
(5, 'crm/cindex/orderpost', 'admin_url'),
(5, 'crm/cindex/reqclientpost', 'admin_url'),
(4, 'crm/cindex/manageclientstatus', 'admin_url'),
(4, 'crm/cindex/confirmoffer', 'admin_url'),
(4, 'crm/cindex/replyhelp', 'admin_url'),
(5, 'crm/cindex/reqclientstatus', 'admin_url'),
(5, 'crm/cindex/edittypepost', 'admin_url'),
(4, 'crm/cindex/offerclient', 'admin_url'),
(4, 'crm/cindex/helplist', 'admin_url'),
(5, 'crm/cindex/gogh', 'admin_url'),
(5, 'crm/cindex/deleteseconduser', 'admin_url'),
(4, 'crm/corder/delrefund', 'admin_url'),
(4, 'crm/corder/confirmrefund', 'admin_url'),
(4, 'crm/corder/refundpost', 'admin_url'),
(4, 'crm/corder/addrefund', 'admin_url'),
(4, 'crm/corder/editpost', 'admin_url'),
(4, 'crm/corder/editorder', 'admin_url'),
(4, 'crm/cindex/outputorder', 'admin_url'),
(4, 'crm/corder/orderlist', 'admin_url'),
(4, 'crm/cindex/listadd', 'admin_url'),
(4, 'crm/cindex/addlist', 'admin_url'),
(4, 'crm/cindex/oneadd', 'admin_url'),
(4, 'crm/cindex/getsale', 'admin_url'),
(4, 'crm/cindex/addone', 'admin_url'),
(4, 'crm/cindex/addcustomer', 'admin_url'),
(4, 'crm/cindex/editpost', 'admin_url'),
(4, 'crm/cindex/editclient', 'admin_url'),
(4, 'crm/cindex/deleteclient', 'admin_url'),
(4, 'crm/cindex/allotclient', 'admin_url'),
(5, 'crm/cindex/editsecondpost', 'admin_url'),
(5, 'crm/cindex/editseconduser', 'admin_url'),
(5, 'crm/cindex/addmoreuser', 'admin_url'),
(5, 'crm/cindex/addmore', 'admin_url'),
(5, 'crm/cindex/contactadd', 'admin_url'),
(5, 'crm/cindex/addcontact', 'admin_url'),
(5, 'crm/cindex/editmytype', 'admin_url'),
(5, 'crm/cindex/editmylevel', 'admin_url'),
(5, 'crm/cindex/editlevelpost', 'admin_url'),
(5, 'crm/cindex/exportmyclient', 'admin_url'),
(5, 'crm/cindex/ownclient', 'admin_url'),
(5, 'crm/cindex/client', 'admin_url'),
(5, 'crm/cdata/contactremind', 'admin_url'),
(5, 'api/guestbookadmin/edit_post', 'admin_url'),
(5, 'crm/cindex/default', 'admin_url'),
(5, 'crm/cmanage/main', 'admin_url'),
(5, 'api/guestbookadmin/editgroup', 'admin_url'),
(5, 'api/guestbookadmin/add_post', 'admin_url'),
(5, 'api/guestbookadmin/guestbookgroup', 'admin_url'),
(5, 'api/guestbookadmin/addgroup', 'admin_url'),
(5, 'api/guestbookadmin/delete', 'admin_url'),
(5, 'api/guestbookadmin/index', 'admin_url'),
(5, 'statistics/inquirystatistics/statisticsinquiry', 'admin_url'),
(4, 'crm/cindex/getclient', 'admin_url'),
(4, 'crm/cindex/allotpost', 'admin_url'),
(4, 'crm/cindex/totalclient', 'admin_url'),
(4, 'crm/cmanage/flyclient', 'admin_url'),
(4, 'crm/cindex/hasorder', 'admin_url'),
(4, 'crm/cindex/reqoffer', 'admin_url'),
(4, 'crm/cindex/requirehelp', 'admin_url'),
(6, 'admin/slide/default', 'admin_url'),
(6, 'admin/storage/setting_post', 'admin_url'),
(6, 'admin/storage/index', 'admin_url'),
(6, 'admin/plugin/update', 'admin_url'),
(6, 'admin/plugin/uninstall', 'admin_url'),
(6, 'admin/plugin/install', 'admin_url'),
(6, 'admin/plugin/setting_post', 'admin_url'),
(6, 'admin/plugin/setting', 'admin_url'),
(6, 'admin/plugin/toggle', 'admin_url'),
(6, 'admin/plugin/index', 'admin_url'),
(6, 'admin/extension/default', 'admin_url'),
(6, 'portal/adminpage/add_post', 'admin_url'),
(6, 'portal/adminpage/add', 'admin_url'),
(6, 'portal/adminpage/edit_post', 'admin_url'),
(6, 'portal/adminpage/edit', 'admin_url'),
(6, 'portal/adminpage/delete', 'admin_url'),
(6, 'portal/adminpage/index', 'admin_url'),
(6, 'portal/adminpage/listorders', 'admin_url'),
(6, 'portal/adminpost/add_post', 'admin_url'),
(6, 'portal/adminpost/add', 'admin_url'),
(6, 'portal/adminpost/edit_post', 'admin_url'),
(6, 'portal/adminpost/delete', 'admin_url'),
(6, 'portal/adminpost/edit', 'admin_url'),
(6, 'portal/adminpost/check', 'admin_url'),
(6, 'portal/adminpost/move', 'admin_url'),
(6, 'portal/adminpost/recommend', 'admin_url'),
(6, 'portal/adminpost/top', 'admin_url'),
(6, 'portal/adminpost/listorders', 'admin_url'),
(6, 'portal/adminpost/index', 'admin_url'),
(6, 'content/urlrule/edit', 'admin_url'),
(6, 'content/urlrule/edit_post', 'admin_url'),
(6, 'content/urlrule/delete', 'admin_url'),
(6, 'content/urlrule/add_post', 'admin_url'),
(6, 'content/urlrule/index', 'admin_url'),
(6, 'content/urlrule/add', 'admin_url'),
(6, 'comment/commentadmin/check', 'admin_url'),
(6, 'comment/commentadmin/delete', 'admin_url'),
(6, 'comment/commentadmin/index', 'admin_url'),
(6, 'admin/menu/lists', 'admin_url'),
(6, 'admin/content/default', 'admin_url'),
(6, 'admin/menu/delete', 'admin_url'),
(6, 'admin/menu/edit', 'admin_url'),
(6, 'admin/menu/edit_post', 'admin_url'),
(6, 'admin/menu/export_menu', 'admin_url'),
(6, 'admin/menu/add_post', 'admin_url'),
(6, 'admin/menu/listorders', 'admin_url'),
(6, 'admin/menu/add', 'admin_url'),
(6, 'admin/menu/index', 'admin_url'),
(6, 'admin/navcat/add_post', 'admin_url'),
(6, 'admin/navcat/add', 'admin_url'),
(6, 'admin/navcat/edit_post', 'admin_url'),
(6, 'admin/navcat/edit', 'admin_url'),
(6, 'admin/navcat/delete', 'admin_url'),
(6, 'admin/navcat/index', 'admin_url'),
(6, 'admin/nav/add_post', 'admin_url'),
(6, 'admin/nav/add', 'admin_url'),
(6, 'admin/nav/edit_post', 'admin_url'),
(6, 'admin/nav/edit', 'admin_url'),
(6, 'admin/nav/delete', 'admin_url'),
(6, 'admin/nav/listorders', 'admin_url'),
(6, 'admin/nav/index', 'admin_url'),
(6, 'admin/navcat/default1', 'admin_url'),
(6, 'admin/menu/default', 'admin_url'),
(6, 'portal/adminpage/restore', 'admin_url'),
(6, 'portal/adminpage/clean', 'admin_url'),
(6, 'portal/adminpage/recyclebin', 'admin_url'),
(6, 'content/contentshow/recycle', 'admin_url'),
(6, 'api/guestbookdel/index', 'admin_url'),
(6, 'portal/adminpost/clean', 'admin_url'),
(6, 'portal/adminpost/restore', 'admin_url'),
(6, 'portal/adminpost/recyclebin', 'admin_url'),
(6, 'admin/recycle/default', 'admin_url'),
(6, 'admin/backup/import', 'admin_url'),
(6, 'admin/backup/del_backup', 'admin_url'),
(6, 'admin/backup/download', 'admin_url'),
(6, 'admin/backup/index_post', 'admin_url'),
(6, 'admin/backup/index', 'admin_url'),
(6, 'admin/backup/restore', 'admin_url'),
(6, 'admin/backup/default', 'admin_url'),
(6, 'user/indexadmin/salesman', 'admin_url'),
(6, 'user/indexadmin/default3', 'admin_url'),
(6, 'user/oauthadmin/delete', 'admin_url'),
(6, 'user/oauthadmin/index', 'admin_url'),
(6, 'user/indexadmin/cancelban', 'admin_url'),
(6, 'user/indexadmin/ban', 'admin_url'),
(6, 'user/indexadmin/index', 'admin_url'),
(6, 'user/indexadmin/default1', 'admin_url'),
(6, 'admin/user/add', 'admin_url'),
(6, 'admin/user/add_post', 'admin_url'),
(6, 'admin/user/edit', 'admin_url'),
(6, 'admin/user/edit_post', 'admin_url'),
(6, 'admin/user/delete', 'admin_url'),
(6, 'admin/user/ban', 'admin_url'),
(6, 'admin/user/cancelban', 'admin_url'),
(6, 'admin/user/index', 'admin_url'),
(6, 'admin/rbac/roleadd_post', 'admin_url'),
(6, 'admin/rbac/roleadd', 'admin_url'),
(6, 'admin/rbac/roledelete', 'admin_url'),
(6, 'admin/rbac/roleedit_post', 'admin_url'),
(6, 'admin/rbac/roleedit', 'admin_url'),
(6, 'admin/rbac/authorize_post', 'admin_url'),
(6, 'admin/rbac/authorize', 'admin_url'),
(6, 'admin/rbac/member', 'admin_url'),
(6, 'admin/rbac/index', 'admin_url'),
(6, 'admin/setting/logo', 'admin_url'),
(6, 'user/indexadmin/default', 'admin_url'),
(6, 'socialplatform/indexadmin/technical', 'admin_url'),
(6, 'socialplatform/indexadmin/reminder', 'admin_url'),
(6, 'admin/demotem/index', 'admin_url'),
(6, 'content/models/index', 'admin_url'),
(6, 'admin/setting/languages', 'admin_url'),
(6, 'admin/main/getversion', 'admin_url'),
(6, 'admin/mailer/active_post', 'admin_url'),
(6, 'admin/mailer/active', 'admin_url'),
(6, 'admin/mailer/index_post', 'admin_url'),
(6, 'admin/mailer/index', 'admin_url'),
(6, 'admin/mailer/default', 'admin_url'),
(6, 'admin/setting/password_post', 'admin_url'),
(6, 'admin/setting/password', 'admin_url'),
(6, 'admin/user/userinfo_post', 'admin_url'),
(6, 'admin/setting/userdefault', 'admin_url'),
(6, 'admin/user/userinfo', 'admin_url'),
(6, 'admin/setting/default', 'admin_url'),
(6, 'gadgets/translate/index', 'admin_url'),
(6, 'gadgets/exchagerate/index', 'admin_url'),
(6, 'gadgets/customs/index', 'admin_url'),
(6, 'gadgets/ip/index', 'admin_url'),
(6, 'gadgets/worldtime/index', 'admin_url'),
(6, 'gadgets/currency/default', 'admin_url'),
(6, 'gadgets/currency/index', 'admin_url'),
(6, 'release/release/abc', 'admin_url'),
(6, 'crm/cindex/pdeleteclient', 'admin_url'),
(6, 'crm/cindex/restoreclient', 'admin_url'),
(6, 'crm/cindex/restore', 'admin_url'),
(6, 'crm/cmanage/editoption', 'admin_url'),
(6, 'crm/cmanage/branchcompany', 'admin_url'),
(6, 'crm/cmanage/coption', 'admin_url'),
(6, 'crm/cmanage/typedelete', 'admin_url'),
(6, 'crm/cmanage/edittype', 'admin_url'),
(6, 'crm/cmanage/typeedit', 'admin_url'),
(6, 'crm/cmanage/addtype', 'admin_url'),
(6, 'crm/cmanage/typeadd', 'admin_url'),
(6, 'crm/cmanage/ctype', 'admin_url'),
(6, 'crm/cmanage/leveledit', 'admin_url'),
(6, 'crm/cmanage/editlevel', 'admin_url'),
(6, 'crm/cmanage/default', 'admin_url'),
(6, 'crm/cmanage/clevel', 'admin_url'),
(6, 'crm/cdata/editpost', 'admin_url'),
(6, 'crm/cdata/deletemonthdata', 'admin_url'),
(6, 'crm/cdata/editmonthdata', 'admin_url'),
(6, 'crm/cdata/monthdata', 'admin_url'),
(6, 'crm/cdata/addpost', 'admin_url'),
(6, 'crm/cindex/approvestatus', 'admin_url'),
(6, 'crm/cdata/addmonthdata', 'admin_url'),
(6, 'crm/cindex/approvepost', 'admin_url'),
(6, 'crm/cindex/manageclientstatus', 'admin_url'),
(6, 'crm/cindex/offerclient', 'admin_url'),
(6, 'crm/cindex/confirmoffer', 'admin_url'),
(6, 'crm/cindex/helplist', 'admin_url'),
(6, 'crm/cindex/replyhelp', 'admin_url'),
(6, 'crm/corder/confirmorder', 'admin_url'),
(6, 'crm/corder/cancelorder', 'admin_url'),
(6, 'crm/corder/delrefund', 'admin_url'),
(6, 'crm/corder/confirmrefund', 'admin_url'),
(6, 'crm/corder/refundpost', 'admin_url'),
(6, 'crm/corder/addrefund', 'admin_url'),
(6, 'crm/corder/editpost', 'admin_url'),
(6, 'crm/corder/editorder', 'admin_url'),
(6, 'crm/cindex/listadd', 'admin_url'),
(6, 'crm/corder/orderlist', 'admin_url'),
(6, 'crm/cindex/getsale', 'admin_url'),
(6, 'crm/cindex/addlist', 'admin_url'),
(6, 'crm/cindex/oneadd', 'admin_url'),
(6, 'crm/cindex/addone', 'admin_url'),
(6, 'crm/cindex/addcustomer', 'admin_url'),
(6, 'crm/cmanage/flyclient', 'admin_url'),
(6, 'crm/cindex/hasorder', 'admin_url'),
(6, 'crm/cindex/reqoffer', 'admin_url'),
(6, 'crm/cindex/requirehelp', 'admin_url'),
(6, 'crm/cindex/orderpost', 'admin_url'),
(6, 'crm/cindex/addorder', 'admin_url'),
(6, 'crm/cindex/reqclientpost', 'admin_url'),
(6, 'crm/cindex/reqclientstatus', 'admin_url'),
(6, 'crm/cindex/edittypepost', 'admin_url'),
(6, 'crm/cindex/gogh', 'admin_url'),
(6, 'crm/cindex/editsecondpost', 'admin_url'),
(6, 'crm/cindex/deleteseconduser', 'admin_url'),
(6, 'crm/cindex/editseconduser', 'admin_url'),
(6, 'crm/cindex/addmoreuser', 'admin_url'),
(6, 'crm/cindex/addmore', 'admin_url'),
(6, 'crm/cindex/contactadd', 'admin_url'),
(6, 'crm/cindex/editmytype', 'admin_url'),
(6, 'crm/cindex/addcontact', 'admin_url'),
(6, 'crm/cindex/editlevelpost', 'admin_url'),
(6, 'crm/cindex/editmylevel', 'admin_url'),
(6, 'crm/cindex/exportmyclient', 'admin_url'),
(6, 'crm/cindex/ownclient', 'admin_url'),
(6, 'crm/cindex/editclient', 'admin_url'),
(6, 'crm/cindex/editpost', 'admin_url'),
(6, 'crm/cindex/deleteclient', 'admin_url'),
(6, 'crm/cindex/allotclient', 'admin_url'),
(6, 'crm/cindex/getclient', 'admin_url'),
(6, 'crm/cindex/totalclient', 'admin_url'),
(6, 'crm/cindex/allotpost', 'admin_url'),
(6, 'crm/cdata/report', 'admin_url'),
(6, 'crm/cindex/client', 'admin_url'),
(6, 'crm/cdata/saleman', 'admin_url'),
(6, 'crm/cdata/singlemanager', 'admin_url'),
(6, 'crm/cdata/department', 'admin_url'),
(6, 'crm/cdata/singlesale', 'admin_url'),
(6, 'crm/cdata/behav_step2', 'admin_url'),
(6, 'crm/cdata/behaviour', 'admin_url'),
(6, 'crm/cdata/behav_step', 'admin_url'),
(6, 'crm/cdata/saleprocess', 'admin_url'),
(6, 'crm/cdata/index', 'admin_url'),
(6, 'crm/cmanage/main', 'admin_url'),
(6, 'crm/cindex/default', 'admin_url'),
(6, 'api/guestbookadmin/setting', 'admin_url'),
(6, 'api/guestbookadmin/email', 'admin_url'),
(6, 'api/guestbookadmin/edit_post', 'admin_url'),
(6, 'api/guestbookadmin/editgroup', 'admin_url'),
(6, 'api/guestbookadmin/add_post', 'admin_url'),
(6, 'api/guestbookadmin/addgroup', 'admin_url'),
(6, 'api/guestbookadmin/guestbookgroup', 'admin_url'),
(6, 'api/guestbookadmin/delete', 'admin_url'),
(6, 'api/guestbookadmin/index', 'admin_url'),
(6, 'api/guestbookadmin/mydefault', 'admin_url'),
(6, 'statistics/report/add_post', 'admin_url'),
(6, 'statistics/inquirystatistics/statisticsinquiry', 'admin_url'),
(6, 'statistics/report/addcomment', 'admin_url'),
(6, 'statistics/report/delete', 'admin_url'),
(6, 'statistics/report/edit_post', 'admin_url'),
(6, 'statistics/report/editcomment', 'admin_url'),
(6, 'statistics/report/commentlist', 'admin_url'),
(6, 'statistics/report/zcpppdf', 'admin_url'),
(6, 'statistics/report/creport', 'admin_url'),
(6, 'statistics/report/index', 'admin_url'),
(6, 'statistics/googleapi/index', 'admin_url'),
(6, 'statistics/links/index', 'admin_url'),
(6, 'statistics/keywordsrank/index', 'admin_url'),
(6, 'statistics/foreignvis/index', 'admin_url'),
(6, 'statistics/productsstatistics/statisticsproducts', 'admin_url'),
(6, 'statistics/articlestatistics/statisticsarticle', 'admin_url'),
(6, 'content/socially/index', 'admin_url'),
(6, 'statistics/report/main', 'admin_url'),
(6, 'socialplatform/indexadmin/show', 'admin_url'),
(6, 'socialplatform/indexadmin/mydefault', 'admin_url'),
(6, 'content/tkslibrary/index', 'admin_url'),
(6, 'content/category/listtdk', 'admin_url'),
(6, 'content/category/mydefault', 'admin_url'),
(6, 'admin/link/add', 'admin_url'),
(6, 'admin/link/add_post', 'admin_url'),
(6, 'admin/link/edit', 'admin_url'),
(6, 'admin/link/edit_post', 'admin_url'),
(6, 'admin/link/toggle', 'admin_url'),
(6, 'admin/link/delete', 'admin_url'),
(6, 'admin/link/listorders', 'admin_url'),
(6, 'admin/link/index', 'admin_url'),
(6, 'release/release/yellowpage', 'admin_url'),
(6, 'release/release/addyellow', 'admin_url'),
(6, 'release/release/index', 'admin_url'),
(6, 'release/release/post_product', 'admin_url'),
(6, 'release/release/product', 'admin_url'),
(6, 'release/release/delete', 'admin_url'),
(6, 'release/release/edit_post', 'admin_url'),
(6, 'release/release/edit', 'admin_url'),
(6, 'release/release/add_post', 'admin_url'),
(6, 'release/release/add', 'admin_url'),
(6, 'release/release/mydefault', 'admin_url'),
(6, 'admin/partner/index', 'admin_url'),
(6, 'release/release/default', 'admin_url'),
(6, 'contact/contacttype/index', 'admin_url'),
(6, 'admin/setting/clearcache', 'admin_url'),
(6, 'socialplatform/indexadmin/site', 'admin_url'),
(6, 'content/createhtml/update_show', 'admin_url'),
(6, 'content/createhtml/update_urls', 'admin_url'),
(6, 'content/createhtml/category', 'admin_url'),
(6, 'content/createhtml/index', 'admin_url'),
(6, 'content/createhtml/update_all', 'admin_url'),
(6, 'content/createhtml/default', 'admin_url'),
(6, 'content/contents/testsd', 'admin_url'),
(6, 'content/contents/faq', 'admin_url'),
(6, 'content/contents/singlepage', 'admin_url'),
(6, 'content/contents/cxtest', 'admin_url'),
(6, 'content/contents/product', 'admin_url'),
(6, 'content/contents/photo', 'admin_url'),
(6, 'content/contents/download', 'admin_url'),
(6, 'content/contents/article', 'admin_url'),
(6, 'content/contents/index', 'admin_url'),
(6, 'content/category/add_post', 'admin_url'),
(6, 'content/category/add', 'admin_url'),
(6, 'content/category/edit_post', 'admin_url'),
(6, 'content/category/edit', 'admin_url'),
(6, 'content/category/delete', 'admin_url'),
(6, 'content/category/changeismenu', 'admin_url'),
(6, 'content/category/public_cache', 'admin_url'),
(6, 'content/category/categoryshux', 'admin_url'),
(6, 'content/category/wadd', 'admin_url'),
(6, 'content/category/singlepage', 'admin_url'),
(6, 'content/category/listorders', 'admin_url'),
(6, 'content/category/index', 'admin_url'),
(6, 'search/search/index', 'admin_url'),
(6, 'admin/route/listorders', 'admin_url'),
(6, 'admin/route/open', 'admin_url'),
(6, 'admin/route/ban', 'admin_url'),
(6, 'admin/route/delete', 'admin_url'),
(6, 'admin/route/edit_post', 'admin_url'),
(6, 'admin/route/edit', 'admin_url'),
(6, 'admin/route/add_post', 'admin_url'),
(6, 'admin/route/add', 'admin_url'),
(6, 'admin/route/index', 'admin_url'),
(6, 'admin/setting/site_post', 'admin_url'),
(6, 'admin/setting/site', 'admin_url'),
(6, 'website/management/configure', 'admin_url'),
(6, 'website/management/set', 'admin_url'),
(6, 'admin/slide/index', 'admin_url'),
(6, 'admin/slide/listorders', 'admin_url'),
(6, 'admin/slide/toggle', 'admin_url'),
(6, 'admin/slide/ban', 'admin_url'),
(6, 'admin/slide/cancelban', 'admin_url'),
(6, 'admin/slide/delete', 'admin_url'),
(6, 'admin/slide/edit', 'admin_url'),
(6, 'admin/slide/edit_post', 'admin_url'),
(6, 'admin/slide/add', 'admin_url'),
(6, 'admin/slide/add_post', 'admin_url'),
(6, 'admin/slidecat/index', 'admin_url'),
(6, 'admin/slidecat/delete', 'admin_url'),
(6, 'admin/slidecat/edit', 'admin_url'),
(6, 'admin/slidecat/edit_post', 'admin_url'),
(6, 'admin/slidecat/add', 'admin_url'),
(6, 'admin/slidecat/add_post', 'admin_url'),
(6, 'admin/ad/index', 'admin_url'),
(6, 'admin/ad/toggle', 'admin_url'),
(6, 'admin/ad/delete', 'admin_url'),
(6, 'admin/ad/edit', 'admin_url'),
(6, 'admin/ad/edit_post', 'admin_url'),
(6, 'admin/ad/add', 'admin_url'),
(6, 'admin/ad/add_post', 'admin_url'),
(6, 'api/oauthadmin/setting', 'admin_url'),
(6, 'api/oauthadmin/setting_post', 'admin_url'),
(6, 'socialplatform/indexadmin/index', 'admin_url'),
(7, 'website/management/set', 'admin_url'),
(7, 'website/management/configure', 'admin_url'),
(7, 'admin/setting/site', 'admin_url'),
(7, 'admin/setting/site_post', 'admin_url'),
(7, 'admin/route/index', 'admin_url'),
(7, 'admin/route/add', 'admin_url'),
(7, 'admin/route/add_post', 'admin_url'),
(7, 'admin/route/edit', 'admin_url'),
(7, 'admin/route/edit_post', 'admin_url'),
(7, 'admin/route/delete', 'admin_url'),
(7, 'admin/route/ban', 'admin_url'),
(7, 'admin/route/open', 'admin_url'),
(7, 'admin/route/listorders', 'admin_url'),
(7, 'search/search/index', 'admin_url'),
(7, 'content/category/index', 'admin_url'),
(7, 'content/category/listorders', 'admin_url'),
(7, 'content/category/singlepage', 'admin_url'),
(7, 'content/category/wadd', 'admin_url'),
(7, 'content/category/categoryshux', 'admin_url'),
(7, 'content/category/public_cache', 'admin_url'),
(7, 'content/category/changeismenu', 'admin_url'),
(7, 'content/category/delete', 'admin_url'),
(7, 'content/category/edit', 'admin_url'),
(7, 'content/category/edit_post', 'admin_url'),
(7, 'content/category/add', 'admin_url'),
(7, 'content/category/add_post', 'admin_url'),
(7, 'content/contents/index', 'admin_url'),
(7, 'content/contents/article', 'admin_url'),
(7, 'content/contents/download', 'admin_url'),
(7, 'content/contents/photo', 'admin_url'),
(7, 'content/contents/product', 'admin_url'),
(7, 'content/contents/cxtest', 'admin_url'),
(7, 'content/contents/singlepage', 'admin_url'),
(7, 'content/contents/faq', 'admin_url'),
(7, 'content/contents/testsd', 'admin_url'),
(7, 'content/createhtml/default', 'admin_url'),
(7, 'content/createhtml/update_all', 'admin_url'),
(7, 'content/createhtml/index', 'admin_url'),
(7, 'content/createhtml/category', 'admin_url'),
(7, 'content/createhtml/update_urls', 'admin_url'),
(7, 'content/createhtml/update_show', 'admin_url'),
(7, 'socialplatform/indexadmin/site', 'admin_url'),
(7, 'admin/setting/clearcache', 'admin_url'),
(7, 'contact/contacttype/index', 'admin_url'),
(7, 'admin/partner/index', 'admin_url'),
(7, 'release/release/default', 'admin_url'),
(7, 'release/release/mydefault', 'admin_url'),
(7, 'release/release/add', 'admin_url'),
(7, 'release/release/add_post', 'admin_url'),
(7, 'release/release/edit', 'admin_url'),
(7, 'release/release/edit_post', 'admin_url'),
(7, 'release/release/delete', 'admin_url'),
(7, 'release/release/product', 'admin_url'),
(7, 'release/release/post_product', 'admin_url'),
(7, 'release/release/index', 'admin_url'),
(7, 'release/release/addyellow', 'admin_url'),
(7, 'release/release/yellowpage', 'admin_url'),
(7, 'admin/link/index', 'admin_url'),
(7, 'admin/link/listorders', 'admin_url'),
(7, 'admin/link/toggle', 'admin_url'),
(7, 'admin/link/delete', 'admin_url'),
(7, 'admin/link/edit', 'admin_url'),
(7, 'admin/link/edit_post', 'admin_url'),
(7, 'admin/link/add', 'admin_url'),
(7, 'admin/link/add_post', 'admin_url'),
(7, 'content/category/mydefault', 'admin_url'),
(7, 'content/category/listtdk', 'admin_url'),
(7, 'content/tkslibrary/index', 'admin_url'),
(7, 'socialplatform/indexadmin/mydefault', 'admin_url'),
(7, 'socialplatform/indexadmin/show', 'admin_url'),
(7, 'content/socially/index', 'admin_url'),
(7, 'statistics/report/main', 'admin_url'),
(7, 'statistics/articlestatistics/statisticsarticle', 'admin_url'),
(7, 'statistics/productsstatistics/statisticsproducts', 'admin_url'),
(7, 'statistics/foreignvis/index', 'admin_url'),
(7, 'statistics/keywordsrank/index', 'admin_url'),
(7, 'statistics/links/index', 'admin_url'),
(7, 'statistics/googleapi/index', 'admin_url'),
(7, 'statistics/report/index', 'admin_url'),
(7, 'statistics/report/creport', 'admin_url'),
(7, 'statistics/report/zcpppdf', 'admin_url'),
(7, 'statistics/report/commentlist', 'admin_url'),
(7, 'statistics/report/editcomment', 'admin_url'),
(7, 'statistics/report/edit_post', 'admin_url'),
(7, 'statistics/report/delete', 'admin_url'),
(7, 'statistics/report/addcomment', 'admin_url'),
(7, 'statistics/report/add_post', 'admin_url'),
(7, 'statistics/inquirystatistics/statisticsinquiry', 'admin_url'),
(7, 'api/guestbookadmin/mydefault', 'admin_url'),
(7, 'api/guestbookadmin/index', 'admin_url'),
(7, 'api/guestbookadmin/delete', 'admin_url'),
(7, 'api/guestbookadmin/guestbookgroup', 'admin_url'),
(7, 'api/guestbookadmin/addgroup', 'admin_url'),
(7, 'api/guestbookadmin/add_post', 'admin_url'),
(7, 'api/guestbookadmin/editgroup', 'admin_url'),
(7, 'api/guestbookadmin/edit_post', 'admin_url'),
(7, 'api/guestbookadmin/email', 'admin_url'),
(7, 'api/guestbookadmin/setting', 'admin_url'),
(7, 'admin/setting/default', 'admin_url'),
(7, 'admin/setting/userdefault', 'admin_url'),
(7, 'admin/user/userinfo', 'admin_url'),
(7, 'admin/user/userinfo_post', 'admin_url'),
(7, 'admin/setting/password', 'admin_url'),
(7, 'admin/setting/password_post', 'admin_url'),
(7, 'admin/mailer/default', 'admin_url'),
(7, 'admin/mailer/index', 'admin_url'),
(7, 'admin/mailer/index_post', 'admin_url'),
(7, 'admin/mailer/active', 'admin_url'),
(7, 'admin/mailer/active_post', 'admin_url'),
(7, 'admin/main/getversion', 'admin_url'),
(7, 'admin/setting/languages', 'admin_url'),
(7, 'content/models/index', 'admin_url'),
(7, 'admin/demotem/index', 'admin_url'),
(7, 'socialplatform/indexadmin/reminder', 'admin_url'),
(7, 'socialplatform/indexadmin/technical', 'admin_url'),
(7, 'admin/setting/logo', 'admin_url'),
(7, 'user/indexadmin/default', 'admin_url'),
(7, 'admin/rbac/index', 'admin_url'),
(7, 'admin/rbac/member', 'admin_url'),
(7, 'admin/rbac/authorize', 'admin_url'),
(7, 'admin/rbac/authorize_post', 'admin_url'),
(7, 'admin/rbac/roleedit', 'admin_url'),
(7, 'admin/rbac/roleedit_post', 'admin_url'),
(7, 'admin/rbac/roledelete', 'admin_url'),
(7, 'admin/rbac/roleadd', 'admin_url'),
(7, 'admin/rbac/roleadd_post', 'admin_url'),
(7, 'admin/user/index', 'admin_url'),
(7, 'admin/user/ban', 'admin_url'),
(7, 'admin/user/cancelban', 'admin_url'),
(7, 'admin/user/delete', 'admin_url'),
(7, 'admin/user/edit', 'admin_url'),
(7, 'admin/user/edit_post', 'admin_url'),
(7, 'admin/user/add', 'admin_url'),
(7, 'admin/user/add_post', 'admin_url'),
(7, 'user/indexadmin/default1', 'admin_url'),
(7, 'user/indexadmin/index', 'admin_url'),
(7, 'user/indexadmin/ban', 'admin_url'),
(7, 'user/indexadmin/cancelban', 'admin_url'),
(7, 'user/oauthadmin/index', 'admin_url'),
(7, 'user/oauthadmin/delete', 'admin_url'),
(7, 'user/indexadmin/default3', 'admin_url'),
(7, 'user/indexadmin/salesman', 'admin_url'),
(7, 'admin/backup/default', 'admin_url'),
(7, 'admin/backup/restore', 'admin_url'),
(7, 'admin/backup/index', 'admin_url'),
(7, 'admin/backup/index_post', 'admin_url'),
(7, 'admin/backup/download', 'admin_url'),
(7, 'admin/backup/del_backup', 'admin_url'),
(7, 'admin/backup/import', 'admin_url'),
(5, 'statistics/report/add_post', 'admin_url'),
(5, 'statistics/report/addcomment', 'admin_url'),
(5, 'statistics/report/edit_post', 'admin_url'),
(5, 'statistics/report/delete', 'admin_url'),
(5, 'statistics/report/editcomment', 'admin_url'),
(5, 'statistics/report/commentlist', 'admin_url'),
(5, 'statistics/report/zcpppdf', 'admin_url'),
(5, 'statistics/report/creport', 'admin_url'),
(5, 'statistics/report/index', 'admin_url'),
(5, 'statistics/googleapi/index', 'admin_url'),
(5, 'statistics/keywordsrank/index', 'admin_url'),
(5, 'statistics/links/index', 'admin_url'),
(5, 'statistics/foreignvis/index', 'admin_url'),
(5, 'statistics/productsstatistics/statisticsproducts', 'admin_url'),
(5, 'statistics/report/main', 'admin_url'),
(4, 'crm/cindex/orderpost', 'admin_url'),
(4, 'crm/cindex/addorder', 'admin_url'),
(4, 'crm/cindex/reqclientpost', 'admin_url'),
(4, 'crm/cindex/reqclientstatus', 'admin_url'),
(4, 'crm/cindex/edittypepost', 'admin_url'),
(4, 'crm/cindex/gogh', 'admin_url'),
(4, 'crm/cindex/deleteseconduser', 'admin_url'),
(4, 'crm/cindex/editsecondpost', 'admin_url'),
(4, 'crm/cindex/addmore', 'admin_url'),
(4, 'crm/cindex/editseconduser', 'admin_url'),
(4, 'crm/cindex/addmoreuser', 'admin_url'),
(4, 'crm/cindex/contactadd', 'admin_url'),
(4, 'crm/cindex/addcontact', 'admin_url'),
(4, 'crm/cindex/editlevelpost', 'admin_url'),
(4, 'crm/cindex/editmytype', 'admin_url'),
(4, 'crm/cindex/editmylevel', 'admin_url'),
(4, 'crm/cindex/ownclient', 'admin_url'),
(4, 'crm/cindex/exportmyclient', 'admin_url'),
(4, 'crm/cindex/client', 'admin_url'),
(4, 'crm/cdata/report', 'admin_url'),
(4, 'crm/cdata/singlesale', 'admin_url'),
(4, 'crm/cdata/saleman', 'admin_url'),
(4, 'crm/cdata/behav_step2', 'admin_url'),
(4, 'crm/cdata/behav_step', 'admin_url'),
(4, 'crm/cdata/saleprocess', 'admin_url'),
(4, 'crm/cdata/behaviour', 'admin_url'),
(4, 'crm/cdata/index', 'admin_url'),
(4, 'crm/cindex/default', 'admin_url'),
(4, 'crm/cmanage/main', 'admin_url'),
(4, 'api/guestbookadmin/edit_post', 'admin_url'),
(4, 'api/guestbookadmin/editgroup', 'admin_url'),
(4, 'api/guestbookadmin/add_post', 'admin_url'),
(4, 'api/guestbookadmin/addgroup', 'admin_url'),
(4, 'api/guestbookadmin/guestbookgroup', 'admin_url'),
(4, 'api/guestbookadmin/delete', 'admin_url'),
(4, 'content/tkslibrary/index', 'admin_url'),
(4, 'api/guestbookadmin/index', 'admin_url'),
(4, 'content/category/listtdk', 'admin_url'),
(4, 'admin/partner/index', 'admin_url'),
(4, 'contact/contacttype/index', 'admin_url'),
(4, 'admin/setting/clearcache', 'admin_url'),
(4, 'socialplatform/indexadmin/site', 'admin_url'),
(4, 'content/createhtml/update_show', 'admin_url'),
(4, 'content/createhtml/update_urls', 'admin_url'),
(4, 'content/createhtml/category', 'admin_url'),
(4, 'content/createhtml/index', 'admin_url'),
(4, 'content/createhtml/update_all', 'admin_url'),
(4, 'content/createhtml/default', 'admin_url'),
(5, 'statistics/articlestatistics/statisticsarticle', 'admin_url'),
(5, 'content/tkslibrary/index', 'admin_url'),
(5, 'content/socially/index', 'admin_url'),
(5, 'content/category/listtdk', 'admin_url'),
(5, 'admin/partner/index', 'admin_url'),
(5, 'admin/setting/clearcache', 'admin_url'),
(5, 'contact/contacttype/index', 'admin_url'),
(5, 'socialplatform/indexadmin/site', 'admin_url'),
(5, 'content/createhtml/update_show', 'admin_url'),
(5, 'content/createhtml/update_urls', 'admin_url'),
(5, 'content/createhtml/category', 'admin_url'),
(5, 'content/createhtml/index', 'admin_url'),
(5, 'content/createhtml/update_all', 'admin_url'),
(5, 'content/createhtml/default', 'admin_url'),
(5, 'content/contents/testsd', 'admin_url'),
(5, 'content/contents/faq', 'admin_url'),
(5, 'content/contents/singlepage', 'admin_url'),
(5, 'content/contents/cxtest', 'admin_url'),
(5, 'content/contents/product', 'admin_url'),
(5, 'content/contents/photo', 'admin_url'),
(5, 'content/contents/download', 'admin_url'),
(5, 'content/contents/article', 'admin_url'),
(5, 'content/contents/index', 'admin_url'),
(5, 'content/category/add_post', 'admin_url'),
(5, 'content/category/add', 'admin_url'),
(5, 'content/category/edit_post', 'admin_url'),
(5, 'content/category/edit', 'admin_url'),
(5, 'content/category/delete', 'admin_url'),
(5, 'content/category/changeismenu', 'admin_url'),
(5, 'content/category/public_cache', 'admin_url'),
(5, 'content/category/categoryshux', 'admin_url'),
(5, 'content/category/wadd', 'admin_url'),
(5, 'content/category/listorders', 'admin_url'),
(5, 'content/category/singlepage', 'admin_url'),
(5, 'content/category/index', 'admin_url'),
(4, 'content/urlrule/edit_post', 'admin_url'),
(4, 'content/contents/testsd', 'admin_url'),
(4, 'content/contents/faq', 'admin_url'),
(4, 'content/contents/singlepage', 'admin_url'),
(4, 'content/contents/cxtest', 'admin_url'),
(4, 'content/contents/product', 'admin_url'),
(4, 'content/contents/photo', 'admin_url'),
(4, 'content/contents/download', 'admin_url'),
(4, 'content/contents/article', 'admin_url'),
(4, 'content/contents/index', 'admin_url'),
(4, 'content/category/add_post', 'admin_url'),
(4, 'content/category/add', 'admin_url'),
(4, 'content/category/edit_post', 'admin_url'),
(4, 'content/category/edit', 'admin_url'),
(4, 'content/category/delete', 'admin_url'),
(4, 'content/category/changeismenu', 'admin_url'),
(4, 'content/category/public_cache', 'admin_url'),
(4, 'content/category/categoryshux', 'admin_url'),
(4, 'content/category/wadd', 'admin_url'),
(4, 'content/category/singlepage', 'admin_url'),
(4, 'content/category/listorders', 'admin_url'),
(4, 'content/category/index', 'admin_url'),
(4, 'search/search/index', 'admin_url'),
(4, 'admin/route/listorders', 'admin_url'),
(4, 'admin/route/open', 'admin_url'),
(4, 'admin/route/ban', 'admin_url'),
(4, 'admin/route/delete', 'admin_url'),
(4, 'admin/route/edit_post', 'admin_url'),
(4, 'admin/route/edit', 'admin_url'),
(4, 'admin/route/add_post', 'admin_url'),
(4, 'admin/route/add', 'admin_url'),
(4, 'admin/route/index', 'admin_url'),
(4, 'admin/setting/site_post', 'admin_url'),
(4, 'admin/setting/site', 'admin_url'),
(4, 'website/management/configure', 'admin_url'),
(4, 'website/management/set', 'admin_url'),
(5, 'search/search/index', 'admin_url'),
(5, 'admin/route/listorders', 'admin_url'),
(5, 'admin/route/open', 'admin_url'),
(5, 'admin/route/ban', 'admin_url'),
(5, 'admin/route/delete', 'admin_url'),
(5, 'admin/route/edit_post', 'admin_url'),
(5, 'admin/route/edit', 'admin_url'),
(5, 'admin/route/add_post', 'admin_url'),
(5, 'admin/route/add', 'admin_url'),
(5, 'admin/route/index', 'admin_url'),
(5, 'admin/setting/site_post', 'admin_url'),
(5, 'admin/setting/site', 'admin_url'),
(5, 'website/management/configure', 'admin_url'),
(5, 'website/management/set', 'admin_url'),
(4, 'content/urlrule/delete', 'admin_url'),
(4, 'portal/adminpost/index', 'admin_url'),
(4, 'portal/adminpost/listorders', 'admin_url'),
(4, 'portal/adminpost/top', 'admin_url'),
(4, 'portal/adminpost/recommend', 'admin_url'),
(4, 'portal/adminpost/move', 'admin_url'),
(4, 'portal/adminpost/check', 'admin_url'),
(4, 'portal/adminpost/delete', 'admin_url'),
(4, 'portal/adminpost/edit', 'admin_url'),
(4, 'portal/adminpost/edit_post', 'admin_url'),
(4, 'portal/adminpost/add', 'admin_url'),
(4, 'portal/adminpost/add_post', 'admin_url'),
(4, 'portal/adminpage/index', 'admin_url'),
(4, 'portal/adminpage/listorders', 'admin_url'),
(4, 'portal/adminpage/delete', 'admin_url'),
(4, 'portal/adminpage/edit', 'admin_url'),
(4, 'portal/adminpage/edit_post', 'admin_url'),
(4, 'portal/adminpage/add', 'admin_url'),
(4, 'portal/adminpage/add_post', 'admin_url'),
(4, 'admin/user/helpcenter', 'admin_url'),
(5, 'admin/recycle/default', 'admin_url'),
(5, 'portal/adminpost/recyclebin', 'admin_url'),
(5, 'portal/adminpost/restore', 'admin_url'),
(5, 'portal/adminpost/clean', 'admin_url'),
(5, 'api/guestbookdel/index', 'admin_url'),
(5, 'portal/adminpage/recyclebin', 'admin_url'),
(5, 'portal/adminpage/clean', 'admin_url'),
(5, 'portal/adminpage/restore', 'admin_url'),
(5, 'admin/user/helpcenter', 'admin_url');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_auth_rule`
--

CREATE TABLE IF NOT EXISTS `cmf_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=389 ;

--
-- 转存表中的数据 `cmf_auth_rule`
--

INSERT INTO `cmf_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', '', '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', '', '询盘管理', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', '', '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', '', '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', '', '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', '', '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', '', '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', '', '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', '', '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', '', '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', '', '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', '', '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', '', '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', '', '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', '', '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', '', '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', '', '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', '', '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', '', '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', '', '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', '', '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', '', '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', '', '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', '', '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', '', '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', '', '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', '', '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', '', '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', '', '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', '', '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', '', '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', '', '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', '', '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', '', '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', '', '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', '', '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', '', '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', '', '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', '', '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', '', '备份恢复', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', '', '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', '', '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', '', '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', '', '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', '', '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', '', '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', '', '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', '', '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', '', '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', '', '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', '', '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', '', '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', '', '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', '', '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', '', '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', '', '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', '', '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', '', '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', '', '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', '', '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', '', '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', '', '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', '', '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', '', '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', '', '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', '', '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', '', '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', '', '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', '', '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', '', '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', '', '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', '', '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', '', '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', '', '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', '', '友情链接管理', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', '', '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', '', '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', '', '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', '', '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', '', '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', '', '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', '', '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', '', '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', '', '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', '', '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', '', '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', '', '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', '', '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', '', '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', '', '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', '', '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', '', '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', '', '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', '', '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', '', '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', '', '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', '', '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', '', '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', '', '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', '', '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', '', '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', '', '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', '', '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', '', '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', '', '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', '', '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', '', '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', '', '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', '', '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', '', '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', '', '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', '', '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', '', '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', '', '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', '', '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', '', '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', '', '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', '', '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', '', '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', '', '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', '', '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', '', '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', '', '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', '', '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', '', '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', '', '邮箱设置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', '', 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', '', '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', '', '邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', '', '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', '', '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', '', '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', '', '用户管理', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', '', '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', '', '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', '', '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', '', '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', '', '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', '', '管理员管理', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', '', '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', '', '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', '', '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', '', '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', '', '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', '', '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', '', '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', '', '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', '', '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', '', '管理员管理', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', '', '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', '', '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', '', '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', '', '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', '', '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', '', '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', '', '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', '', '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', '', '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', '', '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', '', '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', '', '启用管理员', 1, ''),
(162, 'Content', 'admin_url', 'content/models/index', '', '模型管理', 1, ''),
(163, 'Content', 'admin_url', 'content/createhtml/default', '', '网站更新', 1, ''),
(164, 'Content', 'admin_url', 'content/createhtml/index', '', '生成首页', 1, ''),
(165, 'Content', 'admin_url', 'content/createhtml/category', '', '批量生成栏目页', 1, ''),
(166, 'Content', 'admin_url', 'content/createhtml/update_urls', '', '批量更新URL', 1, ''),
(167, 'Content', 'admin_url', 'content/createhtml/update_show', '', '批量更新内容页', 1, ''),
(168, 'Socialplatform', 'admin_url', 'socialplatform/index/index', '', '社交平台', 1, ''),
(169, 'Socialplatform', 'admin_url', 'socialplatform/index/show', '', '社交', 1, ''),
(170, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/index', '', '其它', 1, ''),
(171, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/show', '', '社交', 1, ''),
(172, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/technical', '', '技术顾问', 1, ''),
(173, 'Content', 'admin_url', 'content/contents/index', '', '栏目内容管理', 1, ''),
(174, 'Admin', 'admin_url', 'admin/statistical/default', '', '统计分析', 1, ''),
(175, 'Statistics', 'admin_url', 'statistics/articlestatistics/statisticsarticle', '', '文章统计', 1, ''),
(176, 'Portal', 'admin_url', 'portal/adminterm/singlepage', '', '添加单页', 1, ''),
(177, 'Portal', 'admin_url', 'portal/adminterm/wadd', '', '添加外部链接', 1, ''),
(178, 'Portal', 'admin_url', 'portal/adminterm/categoryshux', '', '终极属性转换', 1, ''),
(179, 'Portal', 'admin_url', 'portal/adminterm/public_cache', '', '分类更新缓存', 1, ''),
(180, 'Content', 'admin_url', 'content/urlrule/index', '', 'URL规则管理', 1, ''),
(181, 'Content', 'admin_url', 'content/urlrule/add', '', 'URL规则添加', 1, ''),
(182, 'Content', 'admin_url', 'content/urlrule/add_post', '', 'URL规则添加提交', 1, ''),
(183, 'Content', 'admin_url', 'content/urlrule/edit', '', 'URL规则编辑', 1, ''),
(184, 'Content', 'admin_url', 'content/urlrule/edit_post', '', 'Url规则编辑提交', 1, ''),
(185, 'Content', 'admin_url', 'content/urlrule/delete', '', 'URL规则删除', 1, ''),
(186, 'Content', 'admin_url', 'content/category/index', '', '导航栏目管理', 1, ''),
(187, 'Content', 'admin_url', 'content/category/add', '', '添加分类', 1, ''),
(188, 'Content', 'admin_url', 'content/category/add_post', '', '提交添加', 1, ''),
(189, 'Content', 'admin_url', 'content/category/categoryshux', '', '终极属性转换', 1, ''),
(190, 'Content', 'admin_url', 'content/category/delete', '', '删除分类', 1, ''),
(191, 'Content', 'admin_url', 'content/category/edit', '', '编辑分类', 1, ''),
(192, 'Content', 'admin_url', 'content/category/edit_post', '', '提交编辑', 1, ''),
(193, 'Content', 'admin_url', 'content/category/listorders', '', '文章分类排序', 1, ''),
(194, 'Content', 'admin_url', 'content/category/public_cache', '', '分类更新缓存', 1, ''),
(195, 'Content', 'admin_url', 'content/category/singlepage', '', '添加单页', 1, ''),
(196, 'Content', 'admin_url', 'content/category/wadd', '', '添加外部链接', 1, ''),
(197, 'Statistics', 'admin_url', 'statistics/productsstatistics/statisticsproducts', '', '产品统计', 1, ''),
(198, 'Release', 'admin_url', 'release/release/default', '', '营销管理', 1, ''),
(199, 'Release', 'admin_url', 'release/release/index', '', '平台管理', 1, ''),
(200, 'Release', 'admin_url', 'release/release/add', '', '添加B2B平台', 1, ''),
(201, 'Statistics', 'admin_url', 'statistics/inquirystatistics/statisticsinauiry', '', '询盘统计', 1, ''),
(202, 'Statistics', 'admin_url', 'statistics/inquirystatistics/statisticsinquiry', '', '询盘统计', 1, ''),
(203, 'Release', 'admin_url', 'release/release/add_post', '', 'B2B平台添加提交', 1, ''),
(204, 'Admin', 'admin_url', 'admin/setting/logo', '', 'logo管理', 1, ''),
(205, 'Release', 'admin_url', 'release/release/edit', '', '修改信息', 1, ''),
(206, 'Release', 'admin_url', 'release/release/edit_post', '', '修改信息提交', 1, ''),
(207, 'Release', 'admin_url', 'release/release/delete', '', '营销平台删除', 1, ''),
(208, 'Release', 'admin_url', 'release/release/product', '', '选择产品', 1, ''),
(209, 'Release', 'admin_url', 'release/release/post_product', '', '发布产品到营销平台', 1, ''),
(210, 'Content', 'admin_url', 'content/report/default', '', '统计报告', 1, ''),
(211, 'Content', 'admin_url', 'content/report/index', '', '统计列表', 1, ''),
(212, 'Statistics', 'admin_url', 'statistics/report/index', '', '生成统计报告', 1, ''),
(213, 'Statistics', 'admin_url', 'statistics/foreignvis/index', '', '外商浏览量统计', 1, ''),
(214, 'User', 'admin_url', 'user/indexadmin/salesman', '', '业务员', 1, ''),
(215, 'Statistics', 'admin_url', 'statistics/keywordsrank/index', '', '关键词排名查询', 1, ''),
(216, 'Content', 'admin_url', 'content/category/listtdk', '', '关键词管理', 1, ''),
(217, 'Content', 'admin_url', 'content/tkslibrary/index', '', '关键词库', 1, ''),
(218, 'Statistics', 'admin_url', 'statistics/report/creport', '', '生成报告预览', 1, ''),
(219, 'Statistics', 'admin_url', 'statistics/report/zcpppdf', '', '生成报告', 1, ''),
(220, 'Statistics', 'admin_url', 'statistics/report/commentlist', '', '报告评论列表', 1, ''),
(221, 'Statistics', 'admin_url', 'statistics/report/editcomment', '', '修改评论', 1, ''),
(222, 'Statistics', 'admin_url', 'statistics/report/edit_post', '', '修改评论提交', 1, ''),
(223, 'Statistics', 'admin_url', 'statistics/report/delete', '', '删除评论', 1, ''),
(224, 'Statistics', 'admin_url', 'statistics/report/addcomment', '', '新增评论', 1, ''),
(225, 'Statistics', 'admin_url', 'statistics/report/add_post', '', '新增评论提交', 1, ''),
(226, 'Search', 'admin_url', 'search/search/index', '', '搜索设置', 1, ''),
(227, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/reminder', '', '域名和服务器到期提醒', 1, ''),
(228, 'Statistics', 'admin_url', 'statistics/report/default', '', '统计分析', 1, ''),
(229, 'Statistics', 'admin_url', 'statistics/report/main', '', '统计分析', 1, ''),
(230, 'Statistics', 'admin_url', 'statistics/googleapi/index', NULL, '谷歌API', 1, ''),
(231, 'Statistics', 'admin_url', 'statistics/links/index', NULL, '发布链接统计', 1, ''),
(232, 'Api', 'admin_url', 'api/guestbookdel/index', NULL, '询盘回收', 1, ''),
(233, 'api', 'admin_url', 'api/guestbookadmin/guestbookgroup', NULL, '询盘显示管理', 1, ''),
(234, 'Api', 'admin_url', 'api/guestbookadmin/addgroup', NULL, '询盘类型添加', 1, ''),
(235, 'Api', 'admin_url', 'api/guestbookadmin/add_post', NULL, '询盘类型添加提交', 1, ''),
(236, 'Api', 'admin_url', 'api/guestbookadmin/editgroup', NULL, '询盘类型修改', 1, ''),
(237, 'Api', 'admin_url', 'api/guestbookadmin/edit_post', NULL, '询盘类型修改提交', 1, ''),
(238, 'Crm', 'admin_url', 'crm/cindex/default', NULL, 'CRM系统', 1, ''),
(239, 'Crm', 'admin_url', 'crm/cmanage/default', NULL, 'CRM系统设置', 1, ''),
(240, 'Crm', 'admin_url', 'crm/cindex/client', NULL, '归属客户', 1, ''),
(241, 'Crm', 'admin_url', 'crm/cindex/totalclient', NULL, '公海客户', 1, ''),
(242, 'Crm', 'admin_url', 'crm/cindex/ownclient', NULL, '未成交客户', 1, ''),
(243, 'Crm', 'admin_url', 'crm/cindex/addclient', NULL, '添加客户', 1, ''),
(244, 'Crm', 'admin_url', 'crm/cindex/addone', NULL, '单个添加', 1, ''),
(245, 'Crm', 'admin_url', 'crm/cindex/addlist', NULL, '批量导入', 1, ''),
(246, 'Crm', 'admin_url', 'crm/corder/index', NULL, '订单管理', 1, ''),
(247, 'Crm', 'admin_url', 'crm/cmanage/cstatus', NULL, '客户状态管理', 1, ''),
(248, 'Crm', 'admin_url', 'crm/cmanage/clevel', NULL, '客户阶段管理', 1, ''),
(249, 'Crm', 'admin_url', 'crm/cmanage/ctype', NULL, '客户类型管理', 1, ''),
(250, 'Crm', 'admin_url', 'crm/cmanage/cfly', NULL, '客户飞出管理', 1, ''),
(251, 'Crm', 'admin_url', 'crm/cmanage/coption', NULL, 'CRM常规设置', 1, ''),
(252, 'Contact', 'admin_url', 'contact/contacttype/index', NULL, '联系方式管理', 1, ''),
(253, 'Crm', 'admin_url', 'crm/cmanage/addlevel', NULL, '添加级别', 1, ''),
(254, 'Crm', 'admin_url', 'crm/cmanage/leveladd', NULL, '添加级别提交', 1, ''),
(255, 'Crm', 'admin_url', 'crm/cmanage/edittype', NULL, '修改类型', 1, ''),
(256, 'Crm', 'admin_url', 'crm/cmanage/typeadd', NULL, '添加类型提交', 1, ''),
(257, 'Crm', 'admin_url', 'crm/cmanage/typedelete', NULL, '删除类型', 1, ''),
(258, 'Crm', 'admin_url', 'crm/cmanage/addtype', NULL, '添加类型', 1, ''),
(259, 'Crm', 'admin_url', 'crm/cmanage/editlevel', NULL, '修改级别', 1, ''),
(260, 'Crm', 'admin_url', 'crm/cmanage/leveledit', NULL, '修改级别提交', 1, ''),
(261, 'Crm', 'admin_url', 'crm/cmanage/typeedit', NULL, '修改类型提交', 1, ''),
(262, 'Crm', 'admin_url', 'crm/cmanage/leveldelete', NULL, '删除级别', 1, ''),
(263, 'Crm', 'admin_url', 'crm/cmanage/editoption', NULL, 'CRM常规设置提交', 1, ''),
(264, 'Crm', 'admin_url', 'crm/cindex/getclient', NULL, '抓取客户', 1, ''),
(265, 'Crm', 'admin_url', 'crm/cindex/allotclient', NULL, '分配客户', 1, ''),
(266, 'Crm', 'admin_url', 'crm/cindex/deleteclient', NULL, '删除客户', 1, ''),
(267, 'Crm', 'admin_url', 'crm/cindex/oneadd', NULL, '单个添加提交', 1, ''),
(268, 'Crm', 'admin_url', 'crm/cindex/listadd', NULL, '批量导入提交', 1, ''),
(269, 'Crm', 'admin_url', 'crm/cindex/allotpost', NULL, '分配客户提交', 1, ''),
(270, 'Crm', 'admin_url', 'crm/cindex/getsale', NULL, '获得下级业务员', 1, ''),
(271, 'Crm', 'admin_url', 'crm/cindex/editclient', NULL, '编辑客户资料', 1, ''),
(272, 'Crm', 'admin_url', 'crm/cindex/editpost', NULL, '编辑客户资料提交', 1, ''),
(273, 'Crm', 'admin_url', 'crm/cindex/orderlist', NULL, '成交客户', 1, ''),
(274, 'Crm', 'admin_url', 'crm/cindex/editmylevel', NULL, '修改客户级别', 1, ''),
(275, 'Crm', 'admin_url', 'crm/cindex/editlevelpost', NULL, '修改客户级别提交', 1, ''),
(276, 'Crm', 'admin_url', 'crm/cindex/edittypepost', NULL, '修改客户类别', 1, ''),
(277, 'Crm', 'admin_url', 'crm/cindex/addcontact', NULL, '添加沟通记录', 1, ''),
(278, 'Crm', 'admin_url', 'crm/cindex/contactadd', NULL, '添加沟通记录提交', 1, ''),
(279, 'Crm', 'admin_url', 'crm/cindex/addmoreuser', NULL, '添加第二联系人', 1, ''),
(280, 'Crm', 'admin_url', 'crm/cindex/addmore', NULL, '添加第二联系人提交', 1, ''),
(281, 'Crm', 'admin_url', 'crm/cindex/editseconduser', NULL, '修改第二联系人', 1, ''),
(282, 'Crm', 'admin_url', 'crm/cindex/editsecondpost', NULL, '修改第二联系人提交', 1, ''),
(283, 'Crm', 'admin_url', 'crm/cindex/deleteseconduser', NULL, '删除第二联系人', 1, ''),
(284, 'Crm', 'admin_url', 'crm/cmange/main', NULL, '总览', 1, ''),
(285, 'Crm', 'admin_url', 'crm/cmanage/main', NULL, '总览', 1, ''),
(286, 'Crm', 'admin_url', 'crm/cindex/orderclient', NULL, '成交客户', 1, ''),
(287, 'Crm', 'admin_url', 'crm/corder/orderclient', NULL, '成交客户', 1, ''),
(288, 'Crm', 'admin_url', 'crm/cindex/exportmyclient', NULL, '导出客户列表', 1, ''),
(289, 'Crm', 'admin_url', 'crm/cindex/flyclient', NULL, '明日飞出客户', 1, ''),
(290, 'Crm', 'admin_url', 'crm/cindex/restore', NULL, '客户回收站', 1, ''),
(291, 'Crm', 'admin_url', 'crm/cmanage/flyclient', NULL, '飞出客户', 1, ''),
(292, 'Crm', 'admin_url', 'crm/cindex/gogh', NULL, '扔入公海', 1, ''),
(293, 'Crm', 'admin_url', 'crm/cindex/restoreclient', NULL, '客户恢复', 1, ''),
(294, 'Crm', 'admin_url', 'crm/cindex/pdeleteclient', NULL, '永久删除客户', 1, ''),
(295, 'Crm', 'admin_url', 'crm/cindex/editmytype', NULL, '修改客户类别', 1, ''),
(296, 'Content', 'admin_url', 'content/socially/index', NULL, '关注我们', 1, ''),
(297, 'Content', 'admin_url', 'content/category/changeismenu', NULL, '是否首页显示', 1, ''),
(298, 'Admin', 'admin_url', 'admin/setting/languages', NULL, '多语言设置', 1, ''),
(299, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/sitemap', NULL, '生成sitemap', 1, ''),
(300, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/site', NULL, '生成sitemap', 1, ''),
(301, 'Admin', 'admin_url', 'admin/demotem/index', NULL, '模板管理', 1, ''),
(302, 'Admin', 'admin_url', 'admin/main/getversion', NULL, '检查更新', 1, ''),
(303, 'Content', 'admin_url', 'content/contentshow/recycle', NULL, '内容回收', 1, ''),
(304, 'dadasd', 'admin_url', 'dadasd/dadasd/dadasd', NULL, 'asdas', 1, ''),
(305, 'Content', 'admin_url', 'content/contentshow/art_reycle', NULL, '文章回收', 1, ''),
(306, 'Content', 'admin_url', 'content/contentshow/art_recycle', NULL, '文章回收', 1, ''),
(307, 'Content', 'admin_url', 'content/createhtml/update_all', NULL, '一键更新', 1, ''),
(308, 'Gadgets', 'admin_url', 'gadgets/currency/default', NULL, '工作助手', 1, ''),
(309, 'Gadgets', 'admin_url', 'gadgets/currency/index', NULL, '货币汇率', 1, ''),
(310, 'Gadgets', 'admin_url', 'gadgets/exchagerate/index', NULL, '汇率查询', 1, ''),
(311, 'Gadgets', 'admin_url', 'gadgets/customs/index', NULL, '海关', 1, ''),
(312, 'Gadgets', 'admin_url', 'gadgets/translate/index', NULL, '翻译', 1, ''),
(313, 'Gadgets', 'admin_url', 'gadgets/worldtime/index', NULL, '世界时间', 1, ''),
(314, 'Admin', 'admin_url', 'admin/partner/index', NULL, '合作伙伴', 1, ''),
(315, 'Admin', 'admin_url', 'admin/test/index', NULL, '合作伙伴', 1, ''),
(316, 'Partner', 'admin_url', 'partner/test/index', NULL, '合作伙伴', 1, ''),
(317, 'Release', 'admin_url', 'release/release/abc', NULL, '培训提高', 1, ''),
(318, 'Release', 'admin_url', 'release/release/yellowpage', NULL, '目录列表', 1, ''),
(319, 'Release', 'admin_url', 'release/release/addyellow', NULL, '添加目录平台', 1, ''),
(320, 'Crm', 'admin_url', 'crm/cdata/index', NULL, '数据看板', 1, ''),
(321, 'Crm', 'admin_url', 'crm/cdata/monthdata', NULL, '年度目标金额设置', 1, ''),
(322, 'Crm', 'admin_url', 'crm/cindex/manageclientstatus', NULL, '申请阶段审批', 1, ''),
(323, 'Crm', 'admin_url', 'crm/cindex/reqclientstatus', NULL, '阶段申请', 1, ''),
(324, 'Crm', 'admin_url', 'crm/cindex/reqclientpost', NULL, '归属客户提交', 1, ''),
(325, 'Crm', 'admin_url', 'crm/cindex/approvestatus', NULL, '审批阶段', 1, ''),
(326, 'Crm', 'admin_url', 'crm/cindex/approvepost', NULL, '审批提交', 1, ''),
(327, 'Crm', 'admin_url', 'crm/cindex/addorder', NULL, '下订单', 1, ''),
(328, 'Crm', 'admin_url', 'crm/cindex/orderpost', NULL, '提交新订单', 1, ''),
(329, 'Crm', 'admin_url', 'crm/corder/default', NULL, '订单管理', 1, ''),
(330, 'Crm', 'admin_url', 'crm/corder/orderlist', NULL, '订单管理', 1, ''),
(331, 'Crm', 'admin_url', 'crm/corder/editorder', NULL, '修改订单信息', 1, ''),
(332, 'Crm', 'admin_url', 'crm/corder/editpost', NULL, '修改订单提交', 1, ''),
(333, 'Crm', 'admin_url', 'crm/corder/addrefund', NULL, '添加回款记录', 1, ''),
(334, 'Crm', 'admin_url', 'crm/corder/refundpost', NULL, '回款记录提交', 1, ''),
(335, 'Api', 'admin_url', 'api/guestbookadmin/setting', NULL, '询盘设置', 1, ''),
(336, 'Crm', 'admin_url', 'crm/cmanage/branchcompany', NULL, '分公司设置', 1, ''),
(337, 'Crm', 'admin_url', 'crm/corder/confirmrefund', NULL, '确认回款信息', 1, ''),
(338, 'Crm', 'admin_url', 'crm/corder/delrefund', NULL, '删除回款信息', 1, ''),
(339, 'Crm', 'admin_url', 'crm/cdata/saleprocess', NULL, '销售流程分析', 1, ''),
(340, 'Crm', 'admin_url', 'crm/cdata/behaviour', NULL, '行为分析', 1, ''),
(341, 'Crm', 'admin_url', 'crm/cdata/behav_step', NULL, '客户拜访情况', 1, ''),
(342, 'Crm', 'admin_url', 'crm/cdata/report', NULL, '智能简报', 1, ''),
(343, 'Crm', 'admin_url', 'crm/cdata/behav_step2', NULL, '客户沟通情况', 1, ''),
(344, 'Crm', 'admin_url', 'crm/cdata/addmonthdata', NULL, '新增目标', 1, ''),
(345, 'Crm', 'admin_url', 'crm/cdata/addpost', NULL, '增加目标提交', 1, ''),
(350, 'wangzhan', 'admin_url', 'wangzhan/guanli/fangfa', NULL, '网站管理', 1, ''),
(346, 'Crm', 'admin_url', 'crm/cdata/editmonthdata', NULL, '编辑目标金额', 1, ''),
(347, 'Crm', 'admin_url', 'crm/cdata/editpost', NULL, '编辑目标金额提交', 1, ''),
(348, 'Crm', 'admin_url', 'crm/cdata/deletemonthdata', NULL, '删除目标设置', 1, ''),
(349, 'Admin', 'admin_url', 'admin/setting/default2', NULL, '网站配置', 1, ''),
(351, 'website', 'admin_url', 'website/management/set', NULL, '网站管理', 1, ''),
(352, 'website', 'admin_url', 'website/management/configure', NULL, '网站配置', 1, ''),
(353, 'Release', 'admin_url', 'release/release/mydefault', NULL, '平台管理', 1, ''),
(354, 'Content', 'admin_url', 'content/category/mydefault', NULL, '关键词管理', 1, ''),
(355, 'Socialplatform', 'admin_url', 'socialplatform/indexadmin/mydefault', NULL, '社交平台', 1, ''),
(356, 'Api', 'admin_url', 'api/guestbookadmin/mydefault', NULL, '询盘管理', 1, ''),
(357, 'Content', 'admin_url', 'content/contents/testuu', NULL, '测试999', 1, ''),
(358, 'Content', 'admin_url', 'content/contents/testsd', NULL, '测试', 1, ''),
(359, 'Content', 'admin_url', 'content/contents/article', NULL, '文章模型', 1, ''),
(360, 'Content', 'admin_url', 'content/contents/download', NULL, '下载模型', 1, ''),
(361, 'Content', 'admin_url', 'content/contents/photo', NULL, '图片模型', 1, ''),
(362, 'Content', 'admin_url', 'content/contents/product', NULL, '产品', 1, ''),
(363, 'Content', 'admin_url', 'content/contents/cxtest', NULL, '陈枭测试', 1, ''),
(364, 'Content', 'admin_url', 'content/contents/faq', NULL, 'FAQ', 1, ''),
(365, 'Api', 'admin_url', 'api/guestbookadmin/email', NULL, '邮箱管理', 1, ''),
(366, 'Ip', 'admin_url', 'ip/index/ip地址查询', NULL, 'Gadgets', 1, ''),
(367, 'Gadgets', 'admin_url', 'gadgets/ip/index', NULL, 'IP地址查询', 1, ''),
(368, 'Crm', 'admin_url', 'crm/cindex/requirehelp', NULL, '申请经理关注', 1, ''),
(369, 'Crm', 'admin_url', 'crm/cindex/reqoffer', NULL, '申请报价审批', 1, ''),
(370, 'Crm', 'admin_url', 'crm/cindex/hasorder', NULL, '成交客户', 1, ''),
(371, 'Crm', 'admin_url', 'crm/cindex/addcustomer', NULL, '添加客户', 1, ''),
(372, 'Crm', 'admin_url', 'crm/cindex/offerclient', NULL, '申请报价审批', 1, ''),
(373, 'Crm', 'admin_url', 'crm/cindex/helplist', NULL, '沟通关注审批', 1, ''),
(374, 'Crm', 'admin_url', 'crm/corder/cancelorder', NULL, '删除订单', 1, ''),
(375, 'Crm', 'admin_url', 'crm/corder/confirmorder', NULL, '确认订单完成', 1, ''),
(376, 'Crm', 'admin_url', 'crm/cindex/replyhelp', NULL, '经理审批提交', 1, ''),
(377, 'Crm', 'admin_url', 'crm/cindex/confirmoffer', NULL, '经理审批报价提交', 1, ''),
(378, 'Crm', 'admin_url', 'crm/cdata/singlesale', NULL, '业务经理查看单个人业绩', 1, ''),
(379, 'Crm', 'admin_url', 'crm/cdata/department', NULL, '跳转分公司', 1, ''),
(380, 'Crm', 'admin_url', 'crm/cdata/singlemanager', NULL, '查看某个业务经理', 1, ''),
(381, 'Crm', 'admin_url', 'crm/cdata/saleman', NULL, '查看个人', 1, ''),
(382, 'Admin', 'admin_url', 'admin/user/helpcenter', NULL, '帮助中心', 1, ''),
(383, 'Crm', 'admin_url', 'crm/cdata/contactremind', NULL, '今日沟通提醒', 1, ''),
(384, 'Crm', 'admin_url', 'crm/corder/ordership', NULL, '出运时间提醒列表', 1, ''),
(385, 'Crm', 'admin_url', 'crm/cdata/outputorder', NULL, '查看订单合同', 1, ''),
(386, 'Crm', 'admin_url', 'crm/cindex/outputorder', NULL, '查看订单合同', 1, ''),
(387, 'Content', 'admin_url', 'content/contents/asdfas', NULL, 'asdfas', 1, ''),
(388, 'Content', 'admin_url', 'content/contents/ceshi', NULL, 'ceshi', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_category`
--

CREATE TABLE IF NOT EXISTS `cmf_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类别',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `domain` varchar(200) NOT NULL DEFAULT '' COMMENT '栏目绑定域名',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `arrparentid` varchar(255) NOT NULL DEFAULT '' COMMENT '所有父ID',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否存在子栏目，1存在',
  `arrchildid` mediumtext COMMENT '所有子栏目ID',
  `catname` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目图片',
  `description` mediumtext COMMENT '栏目描述',
  `parentdir` varchar(100) NOT NULL DEFAULT '' COMMENT '父目录',
  `catdir` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目目录',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接地址',
  `moveurl` varchar(100) NOT NULL COMMENT '动态URL路径',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目点击数',
  `setting` mediumtext COMMENT '相关配置信息',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否生成静态',
  `letter` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目拼音',
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- 转存表中的数据 `cmf_category`
--

INSERT INTO `cmf_category` (`catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`) VALUES
(21, 'content', 1, 0, '', 0, '0', 1, '21,22', 'ABOUT US', '', '', '', 'about-us', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists&catid=21', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists&catid=21', 0, 'a:8:{s:6:"seturl";s:0:"";s:10:"meta_title";s:2:"22";s:13:"meta_keywords";s:2:"23";s:16:"meta_description";s:2:"24";s:13:"page_template";s:9:"page.html";s:6:"ishtml";s:1:"0";s:15:"category_ruleid";s:1:"1";s:11:"show_ruleid";N;}', 2, 1, 0, 'about us'),
(81, 'content', 0, 5, '', 72, '0,72', 0, '81', 'SAW wire', '', '', 'zwcp/', 'morenshengchengjingtai', 'http://localhost/xinxiangmu/zwcp/morenshengchengjingtai/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=81', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:77:" Supply, Manufacturer China, Supplier China,manufacturer & supplier in china ";s:13:"meta_keywords";s:32:" Company, for Sale,High Quality ";s:16:"meta_description";s:0:"";s:13:"list_template";s:13:"list_pro.html";s:13:"show_template";s:13:"show_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";s:2:"31";}', 0, 1, 1, 'saw wire'),
(91, 'content', 0, 5, '', 72, '0,72', 1, '91,97', 'Non-copper-coated wire', '', '', 'zwcp/', 'nonecopper', 'http://localhost/xinxiangmu/zwcp/nonecopper/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=91', 0, 'a:14:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:57:"China , Supply, for Sale,manufacturer & supplier in china";s:13:"meta_keywords";s:42:"  Manufacturer,Manufacture , Factory China";s:16:"meta_description";s:0:"";s:17:"category_template";s:17:"category_pro.html";s:13:"list_template";s:13:"list_pro.html";s:13:"show_template";s:13:"show_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";s:2:"31";}', 0, 1, 1, 'non-copper-coated wire'),
(78, 'content', 0, 5, '', 72, '0,72', 0, '78', 'Stainless steel wire', '', '', 'zwcp/', 'sold', 'http://localhost/xinxiangmu/zwcp/sold/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=78', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:66:"  Manufacturer, Wholesale, Price,manufacturer & supplier in china ";s:13:"meta_keywords";s:41:"  Manufacturer,Manufacture ,rebar coupler";s:16:"meta_description";s:0:"";s:13:"list_template";s:13:"list_pro.html";s:13:"show_template";s:13:"show_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";s:2:"31";}', 0, 1, 1, 'stainless steel wire'),
(72, 'content', 0, 5, '', 0, '0', 1, '72,73,77,78,81,91,97', 'PRODUCTS', '', '<p>&nbsp;&nbsp;&nbsp;&nbsp;我是中文产品<br/></p>', '', 'zwcp', 'http://localhost/xinxiangmu/zwcp/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=72', 0, 'a:12:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:69:"Manufacture ,Export , Factory China,manufacturer & supplier in china ";s:13:"meta_keywords";s:25:" Supply,Export , for Sale";s:16:"meta_description";s:7:"my desc";s:17:"category_template";s:17:"category_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"0";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";N;}', 0, 1, 1, 'products'),
(73, 'content', 0, 5, '', 72, '0,72', 0, '73', 'High tensile steel wire', '', '<p>中文产品二</p>', 'zwcp/', 'zwcpe', 'http://localhost/xinxiangmu/zwcp/zwcpe/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=73', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:59:" Factory,China , Supplier,manufacturer & supplier in china ";s:13:"meta_keywords";s:24:"China , from China,Sale ";s:16:"meta_description";s:8:"good....";s:13:"list_template";s:13:"list_pro.html";s:13:"show_template";s:13:"show_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";s:2:"31";}', 0, 1, 1, 'high tensile steel wire'),
(77, 'content', 0, 5, '', 72, '0,72', 0, '77,86', 'Co2 wire(TIG,MIG)', '', '', 'zwcp/', 'world', 'http://localhost/xinxiangmu/zwcp/world/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=77', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:66:"  Manufacturer, Wholesale, Price,manufacturer & supplier in china ";s:13:"meta_keywords";s:41:"  Manufacturer,Manufacture ,rebar coupler";s:16:"meta_description";s:0:"";s:13:"list_template";s:13:"list_pro.html";s:13:"show_template";s:13:"show_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";s:2:"31";}', 0, 1, 1, 'co2 wire(tig,mig)'),
(100, 'content', 1, 0, '', 0, '0', 0, '100', '搜索结果', '', '', '', 'sousuojieguo', 'http://localhost/xinxiangmu/html/sousuojieguo/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists&catid=100', 0, 'a:8:{s:6:"seturl";s:0:"";s:10:"meta_title";s:67:" Price,rebar coupler,rebar coupler,manufacturer & supplier in china";s:13:"meta_keywords";s:21:" Price,,rebar coupler";s:16:"meta_description";s:0:"";s:13:"page_template";s:9:"page.html";s:6:"ishtml";s:1:"1";s:15:"category_ruleid";s:1:"2";s:11:"show_ruleid";N;}', 0, 0, 1, 'sousuojieguo'),
(101, 'content', 1, 0, '', 0, '0', 1, '101', 'CONTACT US', '', '', '', 'contactus', 'http://localhost/xinxiangmu/html/contactus/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists&catid=101', 0, 'a:8:{s:6:"seturl";s:0:"";s:10:"meta_title";s:58:" Wholesale, Price,Custom ,manufacturer & supplier in china";s:13:"meta_keywords";s:26:" Supplier, Company,Custom ";s:16:"meta_description";s:0:"";s:13:"page_template";s:9:"page.html";s:6:"ishtml";s:1:"1";s:15:"category_ruleid";s:1:"2";s:11:"show_ruleid";N;}', 6, 1, 1, 'contact us'),
(102, 'content', 1, 0, '', 0, '0', 1, '102', 'CUSTOMERS', '', '', '', 'customers', 'http://localhost/xinxiangmu/html/customers/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists&catid=102', 0, 'a:8:{s:6:"seturl";s:0:"";s:10:"meta_title";s:54:"China , Price,Custom ,manufacturer & supplier in china";s:13:"meta_keywords";s:25:" Wholesale, for Sale,ODM ";s:16:"meta_description";s:0:"";s:13:"page_template";s:9:"page.html";s:6:"ishtml";s:1:"1";s:15:"category_ruleid";s:1:"2";s:11:"show_ruleid";N;}', 0, 0, 1, 'customers'),
(97, 'content', 0, 5, '', 91, '0,72,91', 0, '97', 'child1', '', '', 'zwcp/nonecopper/', 'child1', 'http://localhost/xinxiangmu/zwcp/nonecopper/child1/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pro&catid=97', 0, 'a:14:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:66:"Export , for Sale, Exporter China,manufacturer & supplier in china";s:13:"meta_keywords";s:31:" Wholesale, Manufacturer China,";s:16:"meta_description";s:0:"";s:17:"category_template";s:17:"category_pro.html";s:13:"list_template";s:13:"list_pro.html";s:13:"show_template";s:13:"show_pro.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"26";s:11:"show_ruleid";s:2:"31";}', 0, 1, 1, 'child1'),
(94, 'content', 0, 3, '', 0, '0', 0, '94', 'CERTIFICATES', '', '', '', 'certificates', 'http://localhost/xinxiangmu/certificates/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_pic&catid=94', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:65:" China, for Sale, Exporter China,manufacturer & supplier in china";s:13:"meta_keywords";s:32:" Company, Supplier,rebar coupler";s:16:"meta_description";s:0:"";s:13:"list_template";s:13:"list_pic.html";s:13:"show_template";s:13:"show_pic.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"28";s:11:"show_ruleid";s:2:"29";}', 3, 1, 1, 'certificates'),
(95, 'content', 0, 31, '', 0, '0', 0, '95', 'FAQ', '', '', '', 'faq', 'http://localhost/xinxiangmu/faq/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_faq&catid=95', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:67:"Sale , Factory China,rebar coupler,manufacturer & supplier in china";s:13:"meta_keywords";s:31:" Supplier,Custom ,rebar coupler";s:16:"meta_description";s:0:"";s:13:"list_template";s:13:"list_faq.html";s:13:"show_template";s:13:"show_faq.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"35";s:11:"show_ruleid";s:2:"36";}', 4, 1, 1, 'faq'),
(99, 'content', 0, 2, '', 0, '0', 0, '99', 'Factory tour', '', '', '', 'factory-tour', 'http://localhost/xinxiangmu/factory-tour/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_down&catid=99', 0, 'a:14:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:57:" Factory, for Sale,Sale ,manufacturer & supplier in china";s:13:"meta_keywords";s:20:" Company, China,ODM ";s:16:"meta_description";s:0:"";s:17:"category_template";s:18:"category_down.html";s:13:"list_template";s:14:"list_down.html";s:13:"show_template";s:14:"show_down.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"25";s:11:"show_ruleid";s:2:"32";}', 0, 0, 1, 'factory tour'),
(96, 'content', 0, 1, '', 0, '0', 0, '96', 'NEWS', '', '', '', 'news', 'http://localhost/xinxiangmu/news/', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=lists_art&catid=96', 0, 'a:13:{s:6:"seturl";s:0:"";s:12:"generatehtml";s:1:"1";s:12:"generatelish";s:1:"0";s:10:"meta_title";s:74:" Supplier, Exporter China, Supplier China,manufacturer & supplier in china";s:13:"meta_keywords";s:38:" Wholesale,High Quality ,rebar coupler";s:16:"meta_description";s:0:"";s:13:"list_template";s:13:"list_new.html";s:13:"show_template";s:13:"show_new.html";s:6:"ishtml";s:1:"1";s:9:"repagenum";s:0:"";s:14:"content_ishtml";s:1:"1";s:15:"category_ruleid";s:2:"27";s:11:"show_ruleid";s:2:"30";}', 5, 1, 1, 'news');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_category_field`
--

CREATE TABLE IF NOT EXISTS `cmf_category_field` (
  `fid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `fieldname` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '类型,input',
  `setting` mediumtext COMMENT '其他',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_category_priv`
--

CREATE TABLE IF NOT EXISTS `cmf_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色或者组ID',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为管理员 1、管理员',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '动作',
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_category_priv`
--

INSERT INTO `cmf_category_priv` (`catid`, `roleid`, `is_admin`, `action`) VALUES
(6, 2, 1, 'add'),
(6, 2, 1, 'edit'),
(11, 2, 1, 'delete'),
(11, 2, 1, 'edit'),
(11, 2, 1, 'listorder'),
(11, 2, 1, 'push'),
(11, 2, 1, 'remove'),
(81, 2, 1, 'add'),
(81, 2, 1, 'delete'),
(81, 2, 1, 'edit'),
(81, 2, 1, 'listorder'),
(81, 2, 1, 'push'),
(81, 2, 1, 'remove'),
(81, 3, 1, 'add'),
(81, 3, 1, 'delete'),
(81, 3, 1, 'edit'),
(81, 3, 1, 'listorder'),
(81, 3, 1, 'push'),
(81, 3, 1, 'remove'),
(81, 4, 1, 'add'),
(81, 4, 1, 'delete'),
(81, 4, 1, 'edit'),
(81, 4, 1, 'listorder'),
(81, 4, 1, 'push'),
(81, 4, 1, 'remove'),
(81, 5, 1, 'add'),
(81, 5, 1, 'delete'),
(81, 5, 1, 'edit'),
(81, 5, 1, 'listorder'),
(81, 5, 1, 'push'),
(81, 5, 1, 'remove'),
(91, 2, 1, 'add'),
(91, 2, 1, 'auth'),
(91, 2, 1, 'delete'),
(91, 2, 1, 'edit'),
(91, 2, 1, 'listorder'),
(91, 2, 1, 'push'),
(91, 2, 1, 'remove'),
(91, 3, 1, 'add'),
(91, 3, 1, 'auth'),
(91, 3, 1, 'delete'),
(91, 3, 1, 'edit'),
(91, 3, 1, 'listorder'),
(91, 3, 1, 'push'),
(91, 3, 1, 'remove'),
(91, 4, 1, 'add'),
(91, 4, 1, 'auth'),
(91, 4, 1, 'delete'),
(91, 4, 1, 'edit'),
(91, 4, 1, 'listorder'),
(91, 4, 1, 'push'),
(91, 4, 1, 'remove'),
(91, 5, 1, 'add'),
(91, 5, 1, 'auth'),
(91, 5, 1, 'delete'),
(91, 5, 1, 'edit'),
(91, 5, 1, 'listorder'),
(91, 5, 1, 'push'),
(91, 5, 1, 'remove'),
(94, 2, 1, 'add'),
(94, 2, 1, 'delete'),
(94, 2, 1, 'edit'),
(94, 2, 1, 'listorder'),
(94, 2, 1, 'push'),
(94, 2, 1, 'remove'),
(94, 3, 1, 'add'),
(94, 3, 1, 'delete'),
(94, 3, 1, 'edit'),
(94, 3, 1, 'listorder'),
(94, 3, 1, 'push'),
(94, 3, 1, 'remove'),
(94, 4, 1, 'add'),
(94, 4, 1, 'delete'),
(94, 4, 1, 'edit'),
(94, 4, 1, 'listorder'),
(94, 4, 1, 'push'),
(94, 4, 1, 'remove'),
(94, 5, 1, 'add'),
(94, 5, 1, 'delete'),
(94, 5, 1, 'edit'),
(94, 5, 1, 'listorder'),
(94, 5, 1, 'push'),
(94, 5, 1, 'remove'),
(95, 2, 1, 'add'),
(95, 2, 1, 'delete'),
(95, 2, 1, 'edit'),
(95, 2, 1, 'listorder'),
(95, 2, 1, 'push'),
(95, 2, 1, 'remove'),
(95, 3, 1, 'add'),
(95, 3, 1, 'delete'),
(95, 3, 1, 'edit'),
(95, 3, 1, 'listorder'),
(95, 3, 1, 'push'),
(95, 3, 1, 'remove'),
(95, 4, 1, 'add'),
(95, 4, 1, 'delete'),
(95, 4, 1, 'edit'),
(95, 4, 1, 'listorder'),
(95, 4, 1, 'push'),
(95, 4, 1, 'remove'),
(95, 5, 1, 'add'),
(95, 5, 1, 'delete'),
(95, 5, 1, 'edit'),
(95, 5, 1, 'listorder'),
(95, 5, 1, 'push'),
(95, 5, 1, 'remove'),
(96, 2, 1, 'add'),
(96, 2, 1, 'delete'),
(96, 2, 1, 'edit'),
(96, 2, 1, 'listorder'),
(96, 2, 1, 'push'),
(96, 2, 1, 'remove'),
(96, 3, 1, 'add'),
(96, 3, 1, 'delete'),
(96, 3, 1, 'edit'),
(96, 3, 1, 'listorder'),
(96, 3, 1, 'push'),
(96, 3, 1, 'remove'),
(96, 4, 1, 'add'),
(96, 4, 1, 'delete'),
(96, 4, 1, 'edit'),
(96, 4, 1, 'listorder'),
(96, 4, 1, 'push'),
(96, 4, 1, 'remove'),
(96, 5, 1, 'add'),
(96, 5, 1, 'delete'),
(96, 5, 1, 'edit'),
(96, 5, 1, 'listorder'),
(96, 5, 1, 'push'),
(96, 5, 1, 'remove'),
(97, 2, 1, 'add'),
(97, 2, 1, 'auth'),
(97, 2, 1, 'delete'),
(97, 2, 1, 'edit'),
(97, 2, 1, 'listorder'),
(97, 2, 1, 'push'),
(97, 2, 1, 'remove'),
(97, 3, 1, 'add'),
(97, 3, 1, 'auth'),
(97, 3, 1, 'delete'),
(97, 3, 1, 'edit'),
(97, 3, 1, 'listorder'),
(97, 3, 1, 'push'),
(97, 3, 1, 'remove'),
(97, 4, 1, 'add'),
(97, 4, 1, 'auth'),
(97, 4, 1, 'delete'),
(97, 4, 1, 'edit'),
(97, 4, 1, 'listorder'),
(97, 4, 1, 'push'),
(97, 4, 1, 'remove'),
(97, 5, 1, 'add'),
(97, 5, 1, 'auth'),
(97, 5, 1, 'delete'),
(97, 5, 1, 'edit'),
(97, 5, 1, 'listorder'),
(97, 5, 1, 'push'),
(97, 5, 1, 'remove'),
(99, 2, 1, 'add'),
(99, 2, 1, 'auth'),
(99, 2, 1, 'delete'),
(99, 2, 1, 'edit'),
(99, 2, 1, 'listorder'),
(99, 2, 1, 'push'),
(99, 2, 1, 'remove'),
(99, 3, 1, 'add'),
(99, 3, 1, 'auth'),
(99, 3, 1, 'delete'),
(99, 3, 1, 'edit'),
(99, 3, 1, 'listorder'),
(99, 3, 1, 'push'),
(99, 3, 1, 'remove'),
(99, 4, 1, 'add'),
(99, 4, 1, 'auth'),
(99, 4, 1, 'delete'),
(99, 4, 1, 'edit'),
(99, 4, 1, 'listorder'),
(99, 4, 1, 'push'),
(99, 4, 1, 'remove'),
(99, 5, 1, 'add'),
(99, 5, 1, 'auth'),
(99, 5, 1, 'delete'),
(99, 5, 1, 'edit'),
(99, 5, 1, 'listorder'),
(99, 5, 1, 'push'),
(99, 5, 1, 'remove'),
(100, 2, 1, 'add'),
(100, 2, 1, 'auth'),
(100, 2, 1, 'delete'),
(100, 2, 1, 'edit'),
(100, 2, 1, 'listorder'),
(100, 2, 1, 'push'),
(100, 2, 1, 'remove'),
(100, 3, 1, 'add'),
(100, 3, 1, 'auth'),
(100, 3, 1, 'delete'),
(100, 3, 1, 'edit'),
(100, 3, 1, 'listorder'),
(100, 3, 1, 'push'),
(100, 3, 1, 'remove'),
(100, 4, 1, 'add'),
(100, 4, 1, 'auth'),
(100, 4, 1, 'delete'),
(100, 4, 1, 'edit'),
(100, 4, 1, 'listorder'),
(100, 4, 1, 'push'),
(100, 4, 1, 'remove'),
(100, 5, 1, 'add'),
(100, 5, 1, 'auth'),
(100, 5, 1, 'delete'),
(100, 5, 1, 'edit'),
(100, 5, 1, 'listorder'),
(100, 5, 1, 'push'),
(100, 5, 1, 'remove'),
(101, 2, 1, 'add'),
(101, 2, 1, 'auth'),
(101, 2, 1, 'delete'),
(101, 2, 1, 'edit'),
(101, 2, 1, 'listorder'),
(101, 2, 1, 'push'),
(101, 2, 1, 'remove'),
(101, 3, 1, 'add'),
(101, 3, 1, 'auth'),
(101, 3, 1, 'delete'),
(101, 3, 1, 'edit'),
(101, 3, 1, 'listorder'),
(101, 3, 1, 'push'),
(101, 3, 1, 'remove'),
(101, 4, 1, 'add'),
(101, 4, 1, 'auth'),
(101, 4, 1, 'delete'),
(101, 4, 1, 'edit'),
(101, 4, 1, 'listorder'),
(101, 4, 1, 'push'),
(101, 4, 1, 'remove'),
(101, 5, 1, 'add'),
(101, 5, 1, 'auth'),
(101, 5, 1, 'delete'),
(101, 5, 1, 'edit'),
(101, 5, 1, 'listorder'),
(101, 5, 1, 'push'),
(101, 5, 1, 'remove'),
(102, 2, 1, 'add'),
(102, 2, 1, 'auth'),
(102, 2, 1, 'delete'),
(102, 2, 1, 'edit'),
(102, 2, 1, 'listorder'),
(102, 2, 1, 'push'),
(102, 2, 1, 'remove'),
(102, 3, 1, 'add'),
(102, 3, 1, 'auth'),
(102, 3, 1, 'delete'),
(102, 3, 1, 'edit'),
(102, 3, 1, 'listorder'),
(102, 3, 1, 'push'),
(102, 3, 1, 'remove'),
(102, 4, 1, 'add'),
(102, 4, 1, 'auth'),
(102, 4, 1, 'delete'),
(102, 4, 1, 'edit'),
(102, 4, 1, 'listorder'),
(102, 4, 1, 'push'),
(102, 4, 1, 'remove'),
(102, 5, 1, 'add'),
(102, 5, 1, 'auth'),
(102, 5, 1, 'delete'),
(102, 5, 1, 'edit'),
(102, 5, 1, 'listorder'),
(102, 5, 1, 'push'),
(102, 5, 1, 'remove');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client`
--

CREATE TABLE IF NOT EXISTS `cmf_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `username` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话',
  `fax` varchar(50) DEFAULT NULL COMMENT '传真',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `level` int(11) NOT NULL DEFAULT '8' COMMENT '客户所处阶段',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `guest_title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `guest_msg` text COMMENT '留言内容',
  `remark` text COMMENT '备注',
  `is_order` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否成交 1-未成交 2-成交(未使用)',
  `order_time` int(11) DEFAULT NULL COMMENT '成交时间(未使用)',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `uid` int(11) DEFAULT '0' COMMENT '归属业务员UID',
  `mid` int(11) DEFAULT '0' COMMENT '归属业务经理UID',
  `status` tinyint(1) DEFAULT '1' COMMENT '1-公海 2-归属 3-删除',
  `gtime` int(11) DEFAULT NULL COMMENT '抓取时间',
  `ktime` int(11) DEFAULT NULL COMMENT '飞出时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='CRM客户表' AUTO_INCREMENT=75 ;

--
-- 转存表中的数据 `cmf_client`
--

INSERT INTO `cmf_client` (`id`, `cname`, `username`, `email`, `telephone`, `fax`, `address`, `country`, `level`, `type`, `guest_title`, `guest_msg`, `remark`, `is_order`, `order_time`, `addtime`, `uid`, `mid`, `status`, `gtime`, `ktime`) VALUES
(1, '石家庄瑞诺', '陈枭', 'chenxiao@chenxiao.com', '18633452430', '详细地址', NULL, NULL, 5, 3, '询盘标题', '询盘留言', NULL, 2, 1469672070, 1469080424, 19, 19, 2, 1477276388, 1473147066),
(2, '公司2', '联系人2', 'chenxiao@chenxiao.com', '18766567890', 'ldsfka', '详细地址', 'China', 8, 5, '标题', '留言', NULL, 1, NULL, 1469080585, 21, 15, 2, 1473299217, 1469668446),
(3, '公司1', NULL, '111@11.com', '18788889981', '12345678', '地址1', '国家1', 4, 2, '留言1', '内容1', NULL, 1, NULL, 1469093157, 0, 0, 1, 1473299217, 1473468168),
(4, '公司5', '', '115@11.com', '18788889985', '12345678', '地址1', '国家1', 8, 5, '留言1', '内容1', '', 1, 0, 1469093157, 17, 19, 2, 1477277859, 1477277764),
(5, '公司11', '姓名1', '111@11.com', '18788889911', '12345678', '地址1', '国家1', 7, 2, '留言1', '内容1', '', 1, NULL, 1469093314, 19, 19, 2, 1472787935, NULL),
(7, '公司61', '姓名6', '116@11.com', '18788889916', '12345678', '地址1', '国家1', 5, 5, '留言1', '内容1', NULL, 1, NULL, 1469093314, 21, 15, 2, 1473299217, 1473147044),
(17, '杭州智慧鸟科技', '陈女士', '556737@qq.com', '18500000001', '', '杭州', '中国', 5, 3, '想订购商品', '', '', 1, NULL, 1472797047, 17, 19, 2, NULL, NULL),
(13, '瑞诺国际专门测试分配', '张先生', '123456@qq.com', '13800000000', '', '中国杭州啊啊啊啊', 'Afghanistan', 8, 4, '我来看看1', '想要订购产品', '这个客户好好跟', 1, 1472801136, 1470212904, 22, 19, 2, 1476931529, 1476931529),
(22, '杭州智慧鸟', '张女士', '12345555@qq.com', '13803200001', '', '中国杭州', '中国', 5, 4, '', '', '', 1, NULL, 1472804291, 19, 19, 2, 1472804338, NULL),
(24, '公司2号', '2号联系人', '222222@qq.com', '13800000022', '', '石家庄', '中国', 9, 3, '', '', '上次添加没有保存添加人到阶段表', 2, 1477106990, 1472862827, 17, 19, 2, 1472868989, 1472864374),
(20, '瑞诺国际石家庄', '张女士', 'reanod@qq.com', '13803200000', '', '石家庄', '中国', 7, 5, '', '', '', 1, NULL, 1472802497, 17, 19, 2, 1472803969, NULL),
(23, '公司1号', '1号联系人', '11111@qq.com', '13800000011', '', '石家庄', '中国', 4, 2, '', '', '', 1, NULL, 1472862622, 0, 19, 2, 1472864523, 1472864089),
(25, NULL, 'chenxiao', 'chenxiao@chenxiao.com', '', NULL, NULL, NULL, 8, NULL, 'title', 'nice', '', 1, NULL, 1473152147, 0, 15, 3, 1473152147, NULL),
(35, NULL, 'wangwu', 'wangwu@qq.com', '15511111111', NULL, NULL, NULL, 8, NULL, '', 'hahahahaha', '', 1, NULL, 1473390280, 0, 20, 3, 1473390280, NULL),
(36, NULL, '姓名', 'qq@qq.com', '', NULL, NULL, NULL, 8, NULL, '', '内容', '', 1, NULL, 1473390585, 0, 21, 3, 1473390585, NULL),
(39, NULL, '123321', '123321@qq.com', '15511111111', NULL, NULL, NULL, 4, NULL, '', '123123123', '给了cxtest', 1, NULL, 1473407222, 19, 0, 3, NULL, NULL),
(41, NULL, '123321', '123321@qq.com', '15511111111', NULL, NULL, NULL, 4, NULL, '', '123123123', '给了cxtest', 1, NULL, 1473407299, 19, 0, 3, NULL, NULL),
(43, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 4, NULL, '房子免费不要钱', '不要，不要，真不要', '', 1, NULL, 1473474915, 0, 19, 3, NULL, NULL),
(44, NULL, '老好人', '789@qq.com', '', NULL, NULL, NULL, 4, NULL, '扳子要不要钱？', '不要，还给你钱', '', 1, NULL, 1473475047, 0, 15, 3, NULL, NULL),
(45, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 5, NULL, '房子免费不要钱', '不要，不要，真不要', '', 1, NULL, 1473475047, 21, 15, 3, 1473475047, NULL),
(46, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 4, NULL, '房子免费不要钱', '不要，不要，真不要', 'fdadf', 1, NULL, 1473475100, 0, 15, 3, NULL, NULL),
(47, NULL, '帅气', 'sdu@qq.com', '', NULL, NULL, NULL, 4, NULL, '', '这是太好了，你好的', 'test', 1, NULL, 1473475042, 0, 19, 3, NULL, NULL),
(48, NULL, '老好人', '789@qq.com', '', NULL, NULL, NULL, 5, NULL, '扳子要不要钱？', '不要，还给你钱', 'asdfr', 1, NULL, 1473475097, 17, 19, 3, 1473475097, NULL),
(49, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 4, NULL, '房子免费不要钱', '不要，不要，真不要', 'asdr', 1, NULL, 1473475098, 0, 19, 3, NULL, NULL),
(50, NULL, '老好人', '789@qq.com', '', NULL, NULL, NULL, 4, NULL, '扳子要不要钱？', '不要，还给你钱', '你又来了', 1, NULL, 1473475468, 0, 19, 3, NULL, NULL),
(51, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 5, NULL, '房子免费不要钱', '不要，不要，真不要', '我又来了', 1, NULL, 1473475469, 17, 19, 3, 1473475469, NULL),
(52, '杭州达利', '李先生', '789@qq.com', '', '', '', '', 9, 0, '扳子要不要钱？', '不要，还给你钱', '一个个', 2, 1476865698, 1473475826, 17, 19, 2, 1474684952, NULL),
(53, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 5, NULL, '房子免费不要钱', '不要，不要，真不要', '我看看', 1, NULL, 1473475826, 17, 19, 3, 1473475826, NULL),
(54, '深圳起点科技', '张小二', '778458745@qq.com', '13800003692', '', '深圳市长风街', '法国', 4, 4, '网站服务', '网站做的不错，哪个公司做的', '这个客户要好好跟啊', 1, NULL, 1473649897, 0, 19, 2, NULL, NULL),
(55, NULL, '帅气', 'sdu@qq.com', '', NULL, NULL, NULL, 5, NULL, '', '这是太好了，你好的', '分配给你', 1, NULL, 1474187957, 17, 19, 2, 1474684964, NULL),
(56, NULL, '郝仁', '369@qq.com', '', NULL, NULL, NULL, 5, NULL, '房子免费不要钱', '不要，不要，真不要', '分配', 1, NULL, 1474188073, 17, 19, 2, 1474188073, NULL),
(57, NULL, 'chen11', '445768@123.com', '', NULL, NULL, NULL, 4, NULL, '测试添加', '有添加成功吗', '分配给业务员，是否正确', 1, NULL, 1474275663, 0, 19, 2, 1474275663, NULL),
(58, NULL, 'chen123', '12321@qq.com', '', NULL, NULL, NULL, 5, NULL, 'lala', 'neirong', '啊啊阿斯蒂芬 ', 1, NULL, 1474276930, 17, 19, 2, 1474276930, NULL),
(59, NULL, 'who am i ', 'youknow@11.11', '', NULL, NULL, NULL, 5, NULL, 'klr', '我知道你是谁', '', 1, NULL, 1474344229, 21, 15, 2, 1474344229, NULL),
(60, NULL, '我是谁', 'whowho@11.11', '', NULL, NULL, NULL, 5, NULL, 'who am i ', 'i dont know', '', 1, NULL, 1474346795, 21, 15, 2, 1474346795, NULL),
(61, NULL, '我是谁', 'niknow@11.11', '', NULL, NULL, NULL, 5, NULL, 'mytitle', 'mycontent', '', 1, NULL, 1474346960, 17, 19, 2, 1474346960, NULL),
(62, NULL, '123123', '1111@qq.com', '15511111111', NULL, NULL, NULL, 5, NULL, '1', '111', '', 1, NULL, 1474347224, 21, 15, 2, 1474347224, NULL),
(63, NULL, 'asdfas', 'asdfa@qq.com', '', NULL, NULL, NULL, 5, NULL, 'afdsfds', 'asfd', '', 1, NULL, 1474348224, 21, 15, 2, 1474348224, NULL),
(64, 'dfa432345', 'afdsa', 'aasdfsaaa@qq.com', '', '', '', 'Bahamas', 5, NULL, 'asfd', 'ssfas', 'asdfasdddddddddddddddddddddddddddddddddddddddddddddddd', 1, NULL, 1474348426, 21, 15, 2, 1474348426, NULL),
(65, NULL, 'asf', 'sdu@qq.com', 'asdfsaf', '', '', 'Bahamas', 5, NULL, 'asdfasdf', 'asdfasfd', 'afdsa', 1, NULL, 1474348516, 21, 15, 2, 1474348516, NULL),
(66, NULL, 'asdfa', 'asjdddkfjalk@qq.com', '', '', '', 'Bahrain', 5, NULL, 'dfasdf', 'asdf', 'sdfasdfsaasdfd', 1, NULL, 1474348516, 17, 19, 2, 1474348516, NULL),
(67, NULL, 'asdfasa', 'asdfasdf@qq.com', '', '', '', 'Barbados', 5, NULL, 'asdfas', 'ddd', 'dfasasdf', 1, NULL, 1474348763, 17, 19, 2, 1474348763, NULL),
(68, NULL, 'asdfas', 'asfdd@qq.com', '', '', '', 'Bahamas', 5, NULL, 'adfsdfsad', 'dsafsddgff', 'fgfhjfgjhghjghhhh', 1, NULL, 1474348899, 21, 15, 2, 1474348899, NULL),
(69, NULL, 'dfgh', 'dfhdfg@qq.com', '', '', '', 'Bahrain', 5, NULL, 'df', 'dfgsdfgdsfg', 'asdfghf6878678', 1, NULL, 1474348964, 17, 19, 2, 1474348964, NULL),
(70, 'dfgd4444', 'fdh', 'dfhf@qq.com', '', '', '', 'Azerbaijan', 5, NULL, 'asdf213', 'fsdgfdsg', 'afdsdfrty5555555555555', 1, NULL, 1474349103, 17, 19, 2, 1474349103, NULL),
(71, 'reanod', '测试haaaa', 'djfh@ww.com', '15712345678', '', '', 'china', 5, NULL, NULL, NULL, '分配给张三', 1, NULL, 1477357354, 21, 15, 2, 1477357354, NULL),
(72, 'bad', 'aaaaaaa', 'aaaaa@qq.com', '', '', '', 'china', 4, NULL, NULL, NULL, '给经理', 1, NULL, 1477357486, 0, 15, 2, 1477357486, NULL),
(73, 'china', 'hello11', '78910@qq.com', '15712345678', '', '', '', 4, NULL, NULL, NULL, '给经理', 1, NULL, 1477358040, 0, 19, 2, 1477358040, NULL),
(74, '批量导入公司3', '姓名6', 'cx133@qq.com', '18738889916', '12345678', '地址1', 'Anguilla', 5, 5, '留言1', '内容1', NULL, 1, NULL, 1478577620, 17, 19, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_branch`
--

CREATE TABLE IF NOT EXISTS `cmf_client_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) NOT NULL COMMENT '分公司名',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `mids` varchar(100) DEFAULT NULL COMMENT '下属业务经理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分公司表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_client_branch`
--

INSERT INTO `cmf_client_branch` (`id`, `cname`, `addtime`, `mids`) VALUES
(2, '石家庄本部', 1473216842, '19'),
(3, '深圳分公司', 1473298972, '15');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_contact`
--

CREATE TABLE IF NOT EXISTS `cmf_client_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT 'client ID',
  `uid` int(11) NOT NULL COMMENT '业务员ID',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `nexttime` int(11) NOT NULL COMMENT '下次拜访时间',
  `remark` text NOT NULL COMMENT '备注',
  `upload_file` text COMMENT '上传文件 类型和路径 realize格式化',
  `level` varchar(100) NOT NULL COMMENT '所处阶段',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 0-未拜访 1-已拜访',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='沟通记录表' AUTO_INCREMENT=36 ;

--
-- 转存表中的数据 `cmf_client_contact`
--

INSERT INTO `cmf_client_contact` (`id`, `cid`, `uid`, `addtime`, `nexttime`, `remark`, `upload_file`, `level`, `status`) VALUES
(1, 2, 1, 1469499510, 0, '沟通不错', '5', '', 1),
(2, 2, 1, 1469499540, 0, '沟通2', '3', '', 1),
(3, 2, 1, 1469581277, 0, '沟通3', '4', '', 1),
(4, 2, 1, 1469581291, 0, '沟通4', '5', '', 1),
(5, 2, 1, 1469581334, 0, '沟通6', '5', '', 1),
(6, 1, 19, 1469582808, 0, '沟通1', '5', '', 1),
(7, 1, 19, 1469582977, 0, '勾通2', '4', '', 1),
(8, 1, 19, 1469582992, 0, '沟通3', '3', '', 1),
(9, 1, 19, 1469583010, 0, '沟通5', '1', '', 1),
(10, 1, 1, 1470643299, 0, '讨论了半年和全年的折扣，客户要同老板商量\n讨论了半年和全年的折扣，客户要同老板商量\n讨论了半年和全年的折扣，客户要同老板商量\n讨论了半年和全年的折扣，客户要同老板商量\n讨论了半年和全年的折扣，客户要同老板商量', '5', '', 1),
(11, 5, 19, 1462035600, 0, '这条记录会被记录到有多少个沟通', '5', '', 1),
(12, 5, 19, 1473386518, 0, '这又是一个记录啊。怎么没有星级', '4', '', 1),
(13, 5, 19, 1473386551, 0, '这是一个问题', '5', '', 1),
(14, 5, 19, 1473386714, 0, 'firefox 不兼容星级插件', '5', '', 1),
(15, 5, 19, 1474352368, 0, '沟通的很好', '4', '', 1),
(16, 5, 19, 1474352400, 0, '有分页吗', '1', '', 1),
(17, 70, 1, 1474680955, 0, '第一次沟通', '5', '', 1),
(18, 2, 1, 1476429243, 0, '这是一个测试', 'a:3:{i:0;a:2:{s:4:"type";s:1:"1";s:4:"path";s:39:"data/upload/20161014//580085baf0bb4.png";}i:1;a:2:{s:4:"type";s:1:"3";s:4:"path";s:39:"data/upload/20161014//580085baf270c.png";}i:2;a:2:{s:4:"type";s:1:"6";s:4:"path";s:39:"data/upload/20161014//580085bb03abd.png";}}', '', 1),
(19, 2, 1, 1476431960, 0, 'asdf', '', '', 1),
(20, 2, 1, 1476432374, 0, 'fasdf', 'a:1:{i:0;a:2:{s:4:"type";s:1:"3";s:4:"path";s:38:"data/upload/20161014/580091f63291b.zip";}}', '签单阶段', 1),
(21, 20, 17, 1476434902, 0, '新的沟通记录', 'a:1:{i:0;a:2:{s:4:"type";s:1:"1";s:4:"path";s:38:"data/upload/20161014/58009bd6d225a.jpg";}}', '沟通阶段', 1),
(22, 20, 17, 1476437335, 0, '拉萨的了', '', '沟通阶段', 1),
(23, 13, 17, 0, 0, '这是一个沟通记录', 'a:1:{i:0;a:2:{s:4:"type";s:1:"3";s:4:"path";s:38:"data/upload/20161018/58059618dc6e9.png";}}', '报价阶段', 1),
(24, 13, 17, 1476761360, 0, '再来一次啊啊', 'a:1:{i:0;a:2:{s:4:"type";s:1:"3";s:4:"path";s:38:"data/upload/20161018/58059710dfd25.png";}}', '报价阶段', 1),
(25, 13, 17, 1476762010, 0, '我来第三次', 'a:1:{i:0;a:2:{s:4:"type";s:1:"4";s:4:"path";s:38:"data/upload/20161018/5805999a16b09.png";}}', '报价阶段', 1),
(26, 2, 1, 1476846589, 0, 'asdf', 'a:2:{i:0;a:2:{s:4:"type";s:1:"2";s:4:"path";s:38:"data/upload/20161019/5806e3f93c069.zip";}i:1;a:2:{s:4:"type";s:1:"2";s:4:"path";s:38:"data/upload/20161019/5806e3f95a0e8.zip";}}', '签单阶段', 1),
(27, 2, 1, 1476846616, 0, 'asdrddddddd', '', '签单阶段', 1),
(28, 24, 17, 1476847048, 0, '拉上的人', 'a:1:{i:0;a:2:{s:4:"type";s:1:"2";s:4:"path";s:38:"data/upload/20161019/5806e5c2cf48f.zip";}}', '签单阶段', 1),
(29, 24, 17, 1476847237, 0, '这是合同啊啊啊', 'a:1:{i:0;a:2:{s:4:"type";s:1:"2";s:4:"path";s:38:"data/upload/20161019/5806e6804703a.zip";}}', '签单阶段', 1),
(30, 24, 17, 1476848454, 0, '打瞌睡的人', 'a:1:{i:0;a:2:{s:4:"type";s:1:"1";s:4:"path";s:38:"data/upload/20161019/5806eb41d7754.png";}}', '签单阶段', 1),
(31, 4, 17, 1477278749, 0, '这是一次沟通内容', '', '沟通阶段', 1),
(32, 4, 17, 1477281193, 0, '这是报价', 'a:2:{i:0;a:2:{s:4:"type";s:1:"1";s:4:"path";s:38:"data/upload/20161024/580d85a052834.png";}i:1;a:2:{s:4:"type";s:1:"1";s:4:"path";s:38:"data/upload/20161024/580d85a0c2177.zip";}}', '沟通阶段', 1),
(33, 4, 17, 1477289092, 0, '的点点滴滴', '', '报价阶段', 1),
(34, 4, 17, 1478501757, 2016, '我来添加一条记录', '', '签单收款阶段', 1),
(35, 4, 17, 1478501801, 1478624461, '我又来了', '', '签单收款阶段', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_level`
--

CREATE TABLE IF NOT EXISTS `cmf_client_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名字',
  `desc` varchar(100) NOT NULL COMMENT '描述',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='客户级别表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `cmf_client_level`
--

INSERT INTO `cmf_client_level` (`id`, `name`, `desc`, `addtime`, `sort`) VALUES
(5, '沟通阶段', '<p>客户有回复</p>', 1468910011, 1),
(6, '报价阶段', '<p><span style="font-size:14px;font-family:宋体">按客户要求，非主动，发送报价单</span></p>', 1468910022, 2),
(7, '订单细节阶段', '<p><span style="font-size:14px;font-family:宋体">寄送样品、产品颜色、包装等</span></p>', 1468910034, 3),
(8, '签单收款阶段', '<p><span style="font-size:14px;font-family:宋体">货物已出运、收到客户回款</span></p>', 1468910045, 4),
(4, '线索阶段', '<p>分配询盘</p>', 1473385526, 0),
(9, '已成单阶段', '<p><span style="font-size:14px;font-family:宋体">此阶段经理确认后，进入已成单客户</span></p>', 1472623968, 5);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_offer`
--

CREATE TABLE IF NOT EXISTS `cmf_client_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '申请人UID',
  `reqtime` int(11) NOT NULL COMMENT '申请时间',
  `content` text COMMENT '内容',
  `path` varchar(255) DEFAULT NULL COMMENT '附件路径',
  `con_user` int(11) DEFAULT '0' COMMENT '审批人UID',
  `con_time` int(11) DEFAULT NULL COMMENT '审批时间',
  `con_content` text COMMENT '审批内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审批状态 0-未审批 1-已审批 2-拒绝',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='报价表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `cmf_client_offer`
--

INSERT INTO `cmf_client_offer` (`id`, `cid`, `uid`, `reqtime`, `content`, `path`, `con_user`, `con_time`, `con_content`, `status`) VALUES
(1, 17, 1, 1476688273, '报价啦', 'data/upload/20161017/580479919d586.zip', 1, 1476757913, '不错', 1),
(2, 13, 17, 1476689482, '我来申请报价审批来了', 'data/upload/20161017/58047e4ad3d41.zip', 19, 1476862134, '通过', 1),
(3, 24, 17, 1476848813, '这是报价审批', 'data/upload/20161019/5806ecac8a7dd.rar', 0, NULL, NULL, 0),
(4, 20, 17, 1476932227, '2000', 'data/upload/20161020/58083283955c7.zip', 19, 1476932262, '可以', 1),
(5, 4, 17, 1477288094, '爱上仍然', 'data/upload/20161024/580da09e44a6f.zip', 19, 1477288965, '人', 2),
(6, 4, 17, 1477288979, '爱上的人仍然', 'data/upload/20161024/580da4136d16b.zip', 19, 1477289121, '已阅', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_order`
--

CREATE TABLE IF NOT EXISTS `cmf_client_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL COMMENT '订单编号',
  `cname` varchar(255) NOT NULL COMMENT '客户名',
  `cid` int(11) NOT NULL COMMENT '客户UID',
  `uname` varchar(255) NOT NULL COMMENT '业务员名',
  `uid` int(11) NOT NULL COMMENT '业务员UID',
  `mid` int(11) NOT NULL COMMENT '业务经理ID',
  `mname` varchar(255) NOT NULL COMMENT '业务经理名',
  `addtime` int(11) NOT NULL COMMENT '下订单时间',
  `shipping` int(11) NOT NULL COMMENT '预计出运时间',
  `description` text COMMENT '订单描述',
  `totalmoney` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额 元',
  `remark` text COMMENT '订单备注',
  `path` varchar(255) DEFAULT NULL COMMENT '订单附件',
  `path_ys` varchar(255) DEFAULT NULL COMMENT '订单附件',
  `ownmoney` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '回款总额 元',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-完成  0-未完成 2-申请完成 3-取消',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单表' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `cmf_client_order`
--

INSERT INTO `cmf_client_order` (`id`, `order_sn`, `cname`, `cid`, `uname`, `uid`, `mid`, `mname`, `addtime`, `shipping`, `description`, `totalmoney`, `remark`, `path`, `path_ys`, `ownmoney`, `status`, `endtime`) VALUES
(3, '20160905152138', '公司2号', 24, 'chenxiao', 17, 19, 'cxtest', 1473060109, 0, '1W订单当面付，啦啦啦啦', 10000.00, '这是这是', NULL, NULL, 1000.00, 1, 1451667677),
(4, '20160908094829', '公司2', 2, '张三', 21, 15, 'ywjl', 1473299322, 1478620800, '大订单', 200000.00, '请批准', NULL, NULL, 2000.00, 0, 0),
(5, '20161018163212', '公司2号', 24, 'chenxiao', 17, 19, 'cxtest', 1476779610, 0, '在来一个订单', 10000.00, '又一个订单', '', NULL, 0.00, 1, 1451667699),
(6, '20161018163356', '公司2号', 24, 'chenxiao', 17, 19, 'cxtest', 1476779651, 0, '哈哈', 30000.00, '又一个', '', NULL, 0.00, 3, 0),
(7, '20161018163500', '公司2号', 24, 'chenxiao', 17, 19, 'cxtest', 1476779835, 0, '阿斯蒂芬', 77777.00, '阿斯蒂芬', '', NULL, 0.00, 3, 0),
(8, '', '', 0, 'chenxiao', 17, 19, 'cxtest', 1476780078, 0, '', 0.00, '', '', NULL, 0.00, 3, 0),
(9, '20161019114801', '公司2号', 24, 'chenxiao', 17, 19, 'cxtest', 1476849081, 0, '续费订单', 500000.00, '这是个老用户', 'data/upload/20161019/5806edb9267b7.zip', NULL, 405100.00, 3, 0),
(10, '20161019162251', '杭州达利', 52, 'chenxiao', 17, 19, 'cxtest', 1476865389, 0, '这是个订单', 5000.00, '啊啊', 'data/upload/20161019/58072d6d7410e.rar', NULL, 2000.00, 1, 1451667661),
(11, '20161020094434', '瑞诺国际专门测试分配', 13, 'chenxiao', 17, 19, 'cxtest', 1476927897, 0, '订单描述', 1000.00, '专门测试分配', 'data/upload/20161020/580821993c82d.rar', NULL, 0.00, 1, 1451577600),
(12, '20161020094434', '瑞诺国际专门测试分配', 13, 'chenxiao', 22, 19, 'cxtest', 1476931529, 0, '订单描述', 1000.00, '客户重新分配业务员，订单拆分。专门测试分配', 'data/upload/20161020/580821993c82d.rar', NULL, 0.00, 3, 0),
(13, '20161024140627', '公司5', 4, 'chenxiao', 17, 19, 'cxtest', 1477289433, 0, '这是一个订单', 10000.00, '拉萨的日日', 'data/upload/20161024/580da5d9d93dc.zip', NULL, 0.00, 3, 0),
(14, 'SN20161108135223', '公司2号', 24, 'chenxiao', 17, 19, 'cxtest', 1478584524, 1479225600, '这次订单还可以', 30000.00, '改了时间了', 'data/upload/20161108/582168cc1c865.zip', NULL, 0.00, 0, 0),
(15, 'SN20161109144324', '公司5', 4, 'chenxiao', 17, 19, 'cxtest', 1478673823, 1479398400, 'asdf', 2000.00, 'asdf', 'data/upload/20161109/5822c59fc1152.pdf', 'data/upload/20161109/5822c59fc1152.pdf20161109/5822c59fcc11c.zip', 0.00, 0, 0),
(16, 'SN20161109144714', '公司5', 4, 'chenxiao', 17, 19, 'cxtest', 1478674120, 1479484800, 'asrrrrrr', 10000.00, 'eeeeeeeee', 'data/upload/20161109/5822c6c80802a.pdf', 'data/upload/20161109/5822c6c80802a.pdf20161109/5822c6c8137c4.zip', 0.00, 0, 0),
(17, 'SN20161109144858', '公司5', 4, 'chenxiao', 17, 19, 'cxtest', 1478674461, 1479398400, 'afsdf', 666.00, 'asdfsadf', 'data/upload/20161109/5822c81cef93f.pdf', 'data/upload/20161109/5822c81d05729.zip', 0.00, 0, 0),
(18, 'SN20161109152213', '公司5', 4, 'chenxiao', 17, 19, 'cxtest', 1478676160, 1478707200, '这是一个excel', 111111.00, 'adsr', 'data/upload/20161109/5822cec09aab5.xls', 'data/upload/', 0.00, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_second_user`
--

CREATE TABLE IF NOT EXISTS `cmf_client_second_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT 'client ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `telephone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='CRM客户第二联系人表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `cmf_client_second_user`
--

INSERT INTO `cmf_client_second_user` (`id`, `cid`, `username`, `telephone`, `email`) VALUES
(2, 2, 'adfddf', '18922234343', 'asdf@ad.com'),
(3, 1, '张三', '18633452430', '445712421@qq.com'),
(4, 56, '李先生', '13800001234', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_status`
--

CREATE TABLE IF NOT EXISTS `cmf_client_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '客户UID',
  `uid` int(11) NOT NULL COMMENT '业务员UID',
  `status` tinyint(1) DEFAULT '0' COMMENT '1-申请状态  0-没有申请状态',
  `confirm` tinyint(1) DEFAULT '0' COMMENT '1-已确认  0-未确认 2-已否定',
  `req_time` int(11) DEFAULT '0' COMMENT '申请时间',
  `con_time` int(11) DEFAULT '0' COMMENT '确认时间',
  `con_user` int(11) NOT NULL COMMENT '确认人UID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` int(1) NOT NULL COMMENT '状态ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='归属客户阶段状态表' AUTO_INCREMENT=131 ;

--
-- 转存表中的数据 `cmf_client_status`
--

INSERT INTO `cmf_client_status` (`id`, `cid`, `uid`, `status`, `confirm`, `req_time`, `con_time`, `con_user`, `remark`, `type`) VALUES
(10, 5, 19, 1, 1, 1472787935, 1472787935, 19, '分配客户给业务员', 5),
(3, 13, 17, 1, 1, 1472778649, 1472778649, 19, '分配客户给业务员', 5),
(123, 4, 17, 1, 1, 1477278200, 1477281347, 19, '通过了', 6),
(15, 21, 0, 1, 1, 1472803863, 1472803863, 19, '添加新客户到公海', 4),
(14, 17, 17, 1, 1, 1472797047, 1472797047, 17, '添加新客户', 5),
(16, 20, 17, 1, 1, 1472803969, 1472803969, 19, '分配客户给业务员', 5),
(17, 22, 0, 1, 1, 1472804291, 1472804291, 0, '添加新客户到公海', 4),
(18, 22, 19, 1, 1, 1472804338, 1472804338, 19, '从公海抓取客户', 5),
(42, 7, 0, 1, 1, 1473147044, 1473147044, 1, '重新回到公海', 4),
(65, 42, 0, 1, 1, 1473474676, 1473474676, 0, '询盘分配', 4),
(36, 24, 17, 1, 1, 1472877645, 1472883949, 19, '不错，通过了', 6),
(37, 24, 17, 1, 2, 1472884533, 1472884668, 19, '不行，定价太低', 7),
(38, 24, 17, 1, 2, 1472884782, 1472884805, 19, '定价还是底， 按照130%报价', 7),
(35, 24, 17, 1, 1, 1472868989, 1472868989, 19, '分配客户给业务员', 5),
(33, 23, 0, 1, 1, 1472864523, 1472864523, 19, '分配客户给业务经理', 4),
(34, 24, 0, 1, 1, 1472864523, 1472864523, 19, '分配客户给业务经理', 4),
(39, 24, 17, 1, 1, 1472884831, 1472884852, 19, '这次可以了', 7),
(40, 24, 17, 1, 1, 1472885088, 1472885104, 19, '', 8),
(43, 1, 0, 1, 1, 1473147066, 1473147066, 1, '重新回到公海', 4),
(44, 2, 21, 1, 1, 1473299217, 1473299217, 21, '从公海抓取客户', 5),
(62, 3, 0, 1, 1, 1473468168, 1473468168, 0, '椋炲叆鍏?捣', 4),
(64, 6, 0, 1, 1, 1473468667, 1473468667, 0, '飞入公海', 4),
(47, 7, 21, 1, 1, 1473299217, 1473299217, 21, '从公海抓取客户', 5),
(48, 2, 21, 1, 1, 1473299232, 1473299246, 15, '通过', 6),
(49, 2, 21, 1, 1, 1473299264, 1473299277, 15, '通过', 7),
(50, 2, 21, 1, 1, 1473299288, 1473299303, 15, '不错，签单很快', 8),
(51, 32, 20, 1, 1, 1473390072, 1473390072, 0, '询盘分配', 4),
(52, 32, 20, 1, 1, 1473390072, 1473390072, 0, '询盘分配', 5),
(53, 33, 21, 1, 1, 1473390142, 1473390142, 0, '询盘分配', 4),
(54, 33, 21, 1, 1, 1473390142, 1473390142, 0, '询盘分配', 5),
(55, 34, 20, 1, 1, 1473390224, 1473390224, 0, '询盘分配', 4),
(56, 34, 20, 1, 1, 1473390224, 1473390224, 0, '询盘分配', 5),
(57, 35, 20, 1, 1, 1473390280, 1473390280, 0, '询盘分配', 4),
(58, 35, 20, 1, 1, 1473390280, 1473390280, 0, '询盘分配', 5),
(59, 36, 21, 1, 1, 1473390585, 1473390585, 0, '询盘分配', 4),
(60, 36, 21, 1, 1, 1473390585, 1473390585, 0, '询盘分配', 5),
(61, 41, 0, 1, 1, 1473407299, 1473407299, 0, '询盘分配', 4),
(66, 43, 0, 1, 1, 1473474915, 1473474915, 0, '询盘分配', 4),
(67, 46, 0, 1, 1, 1473475100, 1473475100, 0, '询盘分配', 4),
(68, 47, 0, 1, 1, 1473475042, 1473475042, 0, '询盘分配', 4),
(69, 50, 0, 1, 1, 1473475468, 1473475468, 0, '询盘分配', 4),
(70, 51, 17, 1, 1, 1473475469, 1473475469, 0, '询盘分配', 4),
(71, 51, 17, 1, 1, 1473475469, 1473475469, 0, '询盘分配', 5),
(72, 52, 0, 1, 1, 1473475826, 1473475826, 1, '询盘分配', 4),
(73, 53, 17, 1, 1, 1473475826, 1473475826, 1, '询盘分配', 4),
(74, 53, 17, 1, 1, 1473475826, 1473475826, 1, '询盘分配', 5),
(75, 54, 19, 1, 1, 1473649897, 1473649897, 19, '添加新客户', 4),
(76, 13, 17, 1, 1, 1473651016, 1473651073, 19, '速度跟进', 6),
(77, 55, 0, 1, 1, 1474187957, 1474187957, 1, '询盘分配', 4),
(78, 56, 17, 1, 1, 1474188073, 1474188073, 1, '询盘分配', 4),
(79, 56, 17, 1, 1, 1474188073, 1474188073, 1, '询盘分配', 5),
(80, 57, 0, 1, 1, 1474275663, 1474275663, 1, '询盘分配', 4),
(81, 58, 17, 1, 1, 1474276930, 1474276930, 1, '询盘分配', 4),
(82, 58, 17, 1, 1, 1474276930, 1474276930, 1, '询盘分配', 5),
(83, 59, 21, 1, 1, 1474344230, 1474344230, 1, '询盘分配', 4),
(84, 59, 21, 1, 1, 1474344230, 1474344230, 1, '询盘分配', 5),
(85, 60, 21, 1, 1, 1474346795, 1474346795, 1, '询盘分配', 4),
(86, 60, 21, 1, 1, 1474346795, 1474346795, 1, '询盘分配', 5),
(87, 61, 17, 1, 1, 1474346960, 1474346960, 1, '询盘分配', 4),
(88, 61, 17, 1, 1, 1474346960, 1474346960, 1, '询盘分配', 5),
(89, 62, 21, 1, 1, 1474347224, 1474347224, 1, '询盘分配', 4),
(90, 62, 21, 1, 1, 1474347224, 1474347224, 1, '询盘分配', 5),
(91, 63, 21, 1, 1, 1474348224, 1474348224, 1, '询盘分配', 4),
(92, 63, 21, 1, 1, 1474348224, 1474348224, 1, '询盘分配', 5),
(93, 64, 21, 1, 1, 1474348426, 1474348426, 1, '询盘分配', 4),
(94, 64, 21, 1, 1, 1474348426, 1474348426, 1, '询盘分配', 5),
(95, 65, 21, 1, 1, 1474348516, 1474348516, 1, '询盘分配', 5),
(96, 66, 17, 1, 1, 1474348516, 1474348516, 1, '询盘分配', 5),
(97, 67, 17, 1, 1, 1474348763, 1474348763, 1, '询盘分配', 5),
(98, 68, 21, 1, 1, 1474348899, 1474348899, 1, '询盘分配', 5),
(99, 69, 17, 1, 1, 1474348964, 1474348964, 1, '询盘分配', 5),
(100, 70, 17, 1, 1, 1474349103, 1474349103, 1, '询盘分配', 5),
(101, 2, 1, 1, 0, 1474622433, 0, 0, NULL, 9),
(102, 5, 1, 1, 1, 1474681003, 1474681036, 1, '可以', 6),
(103, 5, 1, 1, 1, 1474681081, 1474681094, 1, '看', 7),
(104, 52, 17, 1, 1, 1474684952, 1474684952, 1, '分配客户给业务员', 5),
(105, 55, 17, 1, 1, 1474684964, 1474684964, 1, '分配客户给业务员', 5),
(106, 20, 1, 1, 1, 1476496576, 1476496594, 1, '很好', 6),
(109, 13, 17, 1, 1, 1476862145, 1476862198, 19, '通过', 8),
(110, 24, 17, 1, 1, 1476863082, 1476864506, 19, '批准订单完成', 9),
(111, 52, 17, 1, 1, 1476865349, 1476865361, 19, '可以', 7),
(112, 52, 17, 1, 1, 1476865568, 1476865584, 19, '提示回款吧', 8),
(113, 52, 17, 1, 1, 1476865684, 1476865698, 19, '批准订单完成', 9),
(114, 13, 17, 1, 1, 1476927745, 1476927754, 19, '', 7),
(115, 13, 17, 1, 1, 1476928029, 1476928040, 19, '', 8),
(116, 20, 17, 1, 1, 1476932278, 1476932287, 19, '', 7),
(117, 24, 17, 1, 1, 1477104772, 1477106990, 19, '批准订单完成', 9),
(118, 1, 19, 1, 1, 1477276388, 1477276388, 19, '从公海抓取客户', 5),
(122, 4, 17, 1, 1, 1477277859, 1477277859, 17, '从公海抓取客户', 5),
(121, 4, 0, 1, 1, 1477277764, 1477277764, 19, '重新回到公海', 4),
(124, 4, 17, 1, 1, 1477289157, 1477289170, 19, '可以', 7),
(125, 4, 17, 1, 1, 1477289833, 1477289847, 19, 'arr', 8),
(126, 71, 21, 1, 1, 1477357354, 1477357354, 1, '询盘分配', 4),
(127, 71, 21, 1, 1, 1477357354, 1477357354, 1, '询盘分配', 5),
(128, 72, 0, 1, 1, 1477357486, 1477357486, 1, '询盘分配', 4),
(129, 73, 0, 1, 1, 1477358040, 1477358040, 1, '询盘分配', 4),
(130, 74, 17, 1, 1, 1478577620, 1478577620, 17, '批量添加客户', 5);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_client_type`
--

CREATE TABLE IF NOT EXISTS `cmf_client_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名字',
  `desc` varchar(100) NOT NULL COMMENT '描述',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='客户级别表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `cmf_client_type`
--

INSERT INTO `cmf_client_type` (`id`, `name`, `desc`, `addtime`, `sort`) VALUES
(2, '大卖场', '<p>类型1</p>', 1468912045, 0),
(3, '综合进口商', '<p>类型2</p>', 1468912062, 0),
(4, '专业进口商', '<p>类型3</p>', 1468912074, 0),
(5, '中小进口商', '<p>类型4</p>', 1468912085, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_comments`
--

CREATE TABLE IF NOT EXISTS `cmf_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_common_action_log`
--

CREATE TABLE IF NOT EXISTS `cmf_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `cmf_common_action_log`
--

INSERT INTO `cmf_common_action_log` (`id`, `user`, `object`, `action`, `count`, `last_time`, `ip`) VALUES
(1, 10, 'posts1', 'Portal-Article-do_like', 1, 1463738383, '0.0.0.0');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_contact`
--

CREATE TABLE IF NOT EXISTS `cmf_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contant_name` varchar(255) NOT NULL COMMENT '联系方式',
  `contant_value` varchar(255) NOT NULL COMMENT '联系方式值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `alt_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contant_name` (`contant_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `cmf_contact`
--

INSERT INTO `cmf_contact` (`id`, `contant_name`, `contant_value`, `create_time`, `alt_time`) VALUES
(10, 'Tel.', '+86 317 7807 633', '2016-09-28 01:54:44', '0000-00-00 00:00:00'),
(11, 'E-mail', 'hbxyhy@163.com', '2016-09-28 02:05:27', '0000-00-00 00:00:00'),
(12, 'Add.', 'No. 38 Jianshe Road, Dongguang County,     Hebei Province, China.', '2016-09-28 01:56:03', '0000-00-00 00:00:00'),
(13, 'Fax', '+86 317 7722 909', '2016-09-28 01:55:22', '0000-00-00 00:00:00'),
(14, '联系人', '岳云鹏', '2016-07-28 01:03:06', '0000-00-00 00:00:00'),
(17, '电话1', '15100108598', '2016-07-28 05:50:56', '0000-00-00 00:00:00'),
(19, '电话"', '15100108598''', '2016-07-28 07:50:24', '0000-00-00 00:00:00'),
(20, 'phone', '+86 15100108598', '2016-08-03 08:15:45', '0000-00-00 00:00:00'),
(21, 'Skype', 'hbxyhy', '2016-09-28 02:05:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_contact_require`
--

CREATE TABLE IF NOT EXISTS `cmf_contact_require` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '业务员UID',
  `con_user` int(11) DEFAULT '0' COMMENT '审批人UID',
  `cid` int(11) NOT NULL COMMENT '客户ID',
  `reqtime` int(11) NOT NULL COMMENT '申请时间',
  `contactid` int(11) NOT NULL COMMENT '沟通记录ID',
  `content` text NOT NULL COMMENT '经理回复',
  `replytime` int(11) NOT NULL COMMENT '回复时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-没有回复， 1-已经回复',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='沟通记录申请关注表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `cmf_contact_require`
--

INSERT INTO `cmf_contact_require` (`id`, `uid`, `con_user`, `cid`, `reqtime`, `contactid`, `content`, `replytime`, `status`) VALUES
(1, 17, 19, 20, 1476436609, 21, '我来回复一下', 1476496178, 1),
(8, 17, 19, 24, 1476847972, 28, '阿斯顿发斯蒂芬', 1476848322, 1),
(7, 17, 0, 24, 1476847970, 29, '', 0, 0),
(9, 17, 0, 24, 1476848460, 30, '', 0, 0),
(10, 17, 0, 13, 1476927621, 25, '', 0, 0),
(11, 17, 19, 4, 1477289048, 32, '好好跟进', 1477289070, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_crm_log`
--

CREATE TABLE IF NOT EXISTS `cmf_crm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '操作人UID',
  `cid` int(11) NOT NULL COMMENT '公司UID',
  `content` text NOT NULL COMMENT '操作说明',
  `type` tinyint(1) NOT NULL COMMENT '1-抓取 2-飞出 3-分配 4-删除客户 5-修改 6-扔入公海 7-恢复 8-永久删除 9-下订单',
  `addtime` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='crm操作log' AUTO_INCREMENT=124 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_crm_monthdata`
--

CREATE TABLE IF NOT EXISTS `cmf_crm_monthdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '部门经理UID',
  `month_1` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '1月',
  `month_2` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '2月',
  `month_3` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '3月',
  `month_4` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '4月',
  `month_5` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '5月',
  `month_6` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '6月',
  `month_7` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '7月',
  `month_8` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '8月',
  `month_9` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '9月',
  `month_10` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '10月',
  `month_11` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '11月',
  `month_12` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '12月',
  `year` int(11) NOT NULL DEFAULT '0' COMMENT '第几年的数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='经理指定目标数据表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `cmf_crm_monthdata`
--

INSERT INTO `cmf_crm_monthdata` (`id`, `uid`, `month_1`, `month_2`, `month_3`, `month_4`, `month_5`, `month_6`, `month_7`, `month_8`, `month_9`, `month_10`, `month_11`, `month_12`, `year`) VALUES
(2, 19, 1.10, 2.10, 3.10, 4.10, 5.10, 6.10, 7.10, 8.10, 9.10, 10.10, 11.10, 12.10, 2016),
(4, 15, 1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00, 9.00, 10.00, 11.00, 12.00, 2016),
(5, 23, 11.00, 22.00, 33.00, 44.00, 55.00, 66.00, 77.00, 88.00, 99.00, 10.00, 110.00, 120.00, 2016);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_crm_option`
--

CREATE TABLE IF NOT EXISTS `cmf_crm_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_num` int(11) NOT NULL COMMENT ' 业务员可占有用户数 999-不限',
  `manager_num` int(11) NOT NULL COMMENT '业务经理可占有客户数 999-不限',
  `fly_day` int(11) NOT NULL COMMENT '未联系飞入公海天数  999-不限',
  `back_day` int(11) NOT NULL COMMENT '飞入公海再次占有间隔，0-可马上抓取 999-不能抓取',
  `begin_day` int(3) DEFAULT '0' COMMENT '有沟通飞出时间间隔， 999-不限',
  `remind_day` int(11) NOT NULL DEFAULT '0' COMMENT '飞入公海开始提醒提前天数',
  `shipping_day` int(11) NOT NULL COMMENT '出运订单提醒',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='crm常规设置' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `cmf_crm_option`
--

INSERT INTO `cmf_crm_option` (`id`, `sale_num`, `manager_num`, `fly_day`, `back_day`, `begin_day`, `remind_day`, `shipping_day`) VALUES
(1, 999, 200, 7, 20, 30, 4, 30);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_crm_user`
--

CREATE TABLE IF NOT EXISTS `cmf_crm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '业务员UID',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '业务经理UID',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='业务员与业务经理UID对应表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `cmf_crm_user`
--

INSERT INTO `cmf_crm_user` (`id`, `uid`, `mid`, `addtime`) VALUES
(8, 17, 19, 1469582720),
(5, 19, 19, 1469410764),
(9, 20, 15, 1472777914),
(10, 21, 15, 1473299186),
(11, 22, 19, 1476927667);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_demotem`
--

CREATE TABLE IF NOT EXISTS `cmf_demotem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` int(2) NOT NULL COMMENT '颜色',
  `type` int(2) NOT NULL COMMENT '模板类型',
  `ifcost` tinyint(1) DEFAULT '1' COMMENT '1-免费 2-商业',
  `url` varchar(100) DEFAULT NULL COMMENT '模板保存地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模板保存表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_demotem`
--

INSERT INTO `cmf_demotem` (`id`, `color`, `type`, `ifcost`, `url`) VALUES
(1, 22, 1, 1, 'http://192.168.0.209/demo/demotemp/');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_download`
--

CREATE TABLE IF NOT EXISTS `cmf_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `url` char(100) NOT NULL DEFAULT '',
  `moveurl` char(100) NOT NULL COMMENT '动态url地址',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `istop` tinyint(2) NOT NULL COMMENT '置顶 0否，1是',
  `recommend` tinyint(2) NOT NULL COMMENT '推荐 0否1是',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  `prefix` varchar(255) NOT NULL DEFAULT '',
  `seotitle` mediumtext,
  `seokeywords` mediumtext,
  `seodescription` mediumtext,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `cmf_download`
--

INSERT INTO `cmf_download` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `prefix`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay`, `is_del`) VALUES
(5, 99, 0, 'factory tour1', '', 'data/upload/20160926/57e888aed269d.jpg', '', '', 'Hebei XINYU Welding Co., Ltd Welcome you to our factory any time.', 'http://localhost/xinxiangmu/factory-tour/5-5.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_down&catid=99&id=5', 0, 99, 1, 0, 1, 0, 'admin', 1474857144, 1474857144, 0, 0, 0, 0, 0, 0, '', 'factory tour1 Supplier', 'factory tour1  Manufacturer', NULL, '5', 0, 0),
(6, 99, 0, 'factory tour2', '', 'data/upload/20160926/57e888aed269d.jpg', '', '', 'Hebei XINYU Welding Co., Ltd Welcome you to our factory any time.', 'http://localhost/xinxiangmu/factory-tour/6-6.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_down&catid=99&id=6', 0, 99, 1, 0, 1, 0, 'admin', 1474858172, 1474858172, 0, 0, 0, 0, 0, 0, '', 'factory tour1 Supplier', 'factory tour1  Manufacturer', NULL, '6', 0, 0),
(7, 99, 0, 'factory tour3', '', 'data/upload/20160926/57e888aed269d.jpg', '', '', 'Hebei XINYU Welding Co., Ltd Welcome you to our factory any time.', 'http://localhost/xinxiangmu/factory-tour/7-7.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_down&catid=99&id=7', 0, 99, 1, 0, 1, 0, 'admin', 1474858172, 1474858172, 0, 0, 0, 0, 0, 0, '', 'factory tour1 Supplier', 'factory tour1  Manufacturer', NULL, '7', 0, 0),
(8, 99, 0, 'factory tour4', '', 'data/upload/20160926/57e888aed269d.jpg', '', '', 'Hebei XINYU Welding Co., Ltd Welcome you to our factory any time.', 'http://localhost/xinxiangmu/factory-tour/8-8.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_down&catid=99&id=8', 0, 99, 1, 0, 1, 0, 'admin', 1474858172, 1474858172, 0, 0, 0, 0, 0, 0, '', 'factory tour1 Supplier', 'factory tour1  Manufacturer', NULL, '8', 0, 0),
(9, 99, 0, 'factory tour5', '', 'data/upload/20160926/57e888aed269d.jpg', '', '', 'Hebei XINYU Welding Co., Ltd Welcome you to our factory any time.', 'http://localhost/xinxiangmu/factory-tour/9-9.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_down&catid=99&id=9', 0, 99, 1, 0, 1, 0, 'admin', 1474858172, 1474858172, 0, 0, 0, 0, 0, 0, '', 'factory tour1 Supplier', 'factory tour1  Manufacturer', NULL, '9', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_download_data`
--

CREATE TABLE IF NOT EXISTS `cmf_download_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `download` text,
  `full_content` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_download_data`
--

INSERT INTO `cmf_download_data` (`id`, `template`, `paytype`, `allow_comment`, `relation`, `download`, `full_content`) VALUES
(4, '', 0, 1, '', '[{"fileurl":"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d4d062bef6.zip","filename":"reanod"}]', NULL),
(5, '', 0, 1, '', '[]', '<p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p><br/></p>'),
(6, '', 0, 1, '', '[]', '<p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p><br/></p>'),
(7, '', 0, 1, '', '[]', '<p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p><br/></p>'),
(8, '', 0, 1, '', '[]', '<p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p><br/></p>'),
(9, '', 0, 1, '', '[]', '<p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p>Hebei XINYU Welding Co., Ltd, which mainly produces high strength steel welding wire, Non-copper-coated solid wire, submerged arc &amp; stainless steel welding wire . Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</p><p>All our products have passed ISO 9001-2008 quality system certification and CE certification because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.</p><p><br/></p>');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_email`
--

CREATE TABLE IF NOT EXISTS `cmf_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  `del_time` int(10) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `del_time` (`del_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_email`
--

INSERT INTO `cmf_email` (`id`, `email`, `status`, `del_time`) VALUES
(1, '123@qq.com', 1, 0),
(2, '12342@qq.com', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_faq`
--

CREATE TABLE IF NOT EXISTS `cmf_faq` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(24) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `url` varchar(255) NOT NULL DEFAULT '',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `istop` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  `seotitle` varchar(110) NOT NULL DEFAULT '',
  `seokeywords` varchar(200) NOT NULL DEFAULT '',
  `seodescription` mediumtext,
  `moveurl` varchar(255) NOT NULL DEFAULT '' COMMENT '动态url地址',
  `seourl` varchar(255) NOT NULL DEFAULT '',
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否在回收',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_faq`
--

INSERT INTO `cmf_faq` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `description`, `url`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `seotitle`, `seokeywords`, `seodescription`, `moveurl`, `seourl`, `isdelay`, `is_del`) VALUES
(1, 95, 0, 'Where is Hebei XINYU Welding', '', '', '', 'http://localhost/xinxiangmu/faq/1.html', 0, 99, 0, 0, 1, 0, 'admin', 1474852441, 1474852441, 0, 0, 0, 0, 0, 0, 'Where is Hebei XINYU Welding Manufacturer China', 'Where is Hebei XINYU Welding China', '', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_faq&catid=95&id=1', '', 0, 0),
(2, 95, 0, 'Where is Hebei XINYU Welding2', '', '', '', 'http://localhost/xinxiangmu/faq/2.html', 0, 99, 0, 0, 1, 0, 'admin', 1474852494, 1474852494, 0, 0, 0, 0, 0, 0, 'Where is Hebei XINYU Welding2 Wholesale', 'Where is Hebei XINYU Welding2 Supplier', '', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_faq&catid=95&id=2', '', 0, 0),
(3, 95, 0, 'xiaopingguo', '', '', '', 'http://localhost/xinxiangmu/faq/3-3.html', 0, 99, 0, 0, 1, 0, 'admin', 1475022391, 1475022391, 0, 0, 0, 0, 0, 0, 'Where is Hebei XINYU Welding2 Wholesale', 'Where is Hebei XINYU Welding2 Supplier', '', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_faq&catid=95&id=3', '3', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_faq_data`
--

CREATE TABLE IF NOT EXISTS `cmf_faq_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_faq_data`
--

INSERT INTO `cmf_faq_data` (`id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`) VALUES
(1, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span></p>', 0, 0, '', 0, 1, ''),
(2, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span></p>', 0, 0, '', 0, 1, ''),
(3, '<p><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span><span style="color: rgb(34, 34, 34); font-family: Consolas, &#39;Lucida Console&#39;, monospace; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">Shielded metal arc welding, submerged arc welding and gas shielded welding and other welding methods, can be used...</span></p>', 0, 0, '', 0, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_follow_us`
--

CREATE TABLE IF NOT EXISTS `cmf_follow_us` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `socially_id` varchar(36) NOT NULL,
  `socially_name` varchar(255) NOT NULL COMMENT '社交平台名称',
  `logo_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
  `socially_url` varchar(200) NOT NULL DEFAULT '' COMMENT '社交地址',
  `content` text COMMENT '描述',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `cmf_follow_us`
--

INSERT INTO `cmf_follow_us` (`id`, `socially_id`, `socially_name`, `logo_url`, `socially_url`, `content`, `username`, `password`) VALUES
(29, 'QeFDjoYRbRW0uVqcCzgRdzGTsXPifpbNeLVB', 'linkedin', '/thinkcmf/data/upload/20160811/57abe5f647639.png', 'https://www.linkedin.com/', 'linkedin', NULL, NULL),
(30, 'CViKHlDPIYovdYvIzkLNjFeCSmRxNMDJMfNR', 'facebook', '/thinkcmf/data/upload/20160811/57ac4dfe16f30.jpg', 'https://www.linkedin.com/', 'facebook', 'admin', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_follow_us_rela`
--

CREATE TABLE IF NOT EXISTS `cmf_follow_us_rela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` varchar(36) NOT NULL COMMENT '分类id',
  `is_show` int(11) NOT NULL COMMENT '0-显示 1-不显示',
  `socially_id` varchar(36) NOT NULL COMMENT '社交平台ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `cmf_follow_us_rela`
--

INSERT INTO `cmf_follow_us_rela` (`id`, `type_id`, `is_show`, `socially_id`) VALUES
(23, 'FI0lVtdteMUxrFmHaxOHzwcgSIXeqpmWHcul', 0, 'CViKHlDPIYovdYvIzkLNjFeCSmRxNMDJMfNR'),
(22, 'FI0lVtdteMUxrFmHaxOHzwcgSIXeqpmWHcul', 0, 'QeFDjoYRbRW0uVqcCzgRdzGTsXPifpbNeLVB');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_follow_us_type`
--

CREATE TABLE IF NOT EXISTS `cmf_follow_us_type` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `typeid` varchar(36) NOT NULL COMMENT '类别ID',
  `typename` varchar(25) NOT NULL COMMENT '类别名称',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `typename` (`typename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `cmf_follow_us_type`
--

INSERT INTO `cmf_follow_us_type` (`id`, `typeid`, `typename`, `createtime`) VALUES
(1, 'FI0lVtdteMUxrFmHaxOHzwcgSIXeqpmWHcul', '底部显示', '2016-08-11 02:46:26');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_google_api`
--

CREATE TABLE IF NOT EXISTS `cmf_google_api` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `cx` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_google_api`
--

INSERT INTO `cmf_google_api` (`id`, `key`, `cx`) VALUES
(1, 'AIzaSyCmsDqmScSy2TNVbRRxDxll2RWTt3TxyzQ', '014669375805372418625:hpevqrxmf-0'),
(2, 'AIzaSyDE3iv2Oi7dvJFgB14oyb6-6QeD-7YNNIY', '007596137184564669798:vieduydhj9w');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_guestbook`
--

CREATE TABLE IF NOT EXISTS `cmf_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT '' COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `company_name` varchar(200) NOT NULL DEFAULT '' COMMENT '公司名称',
  `tel` varchar(20) NOT NULL DEFAULT '' COMMENT '电话',
  `fax` varchar(20) NOT NULL DEFAULT '' COMMENT '传真',
  `address` varchar(200) NOT NULL DEFAULT '' COMMENT '地址',
  `pid` text NOT NULL COMMENT '产品',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `salesman` char(20) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员备注',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  `del_time` int(10) NOT NULL COMMENT '删除时间',
  `from_country` varchar(255) NOT NULL DEFAULT '' COMMENT '询盘客户来自哪个国家',
  `from_country_ip` varchar(100) NOT NULL DEFAULT '中国' COMMENT '客户IP',
  `type` tinyint(1) NOT NULL COMMENT '0:联系我们,1:底部,2:详情,3:侧栏',
  `file` varchar(255) DEFAULT NULL COMMENT '附件URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `cmf_guestbook`
--

INSERT INTO `cmf_guestbook` (`id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `del_time`, `from_country`, `from_country_ip`, `type`, `file`) VALUES
(12, 'wangwu', 'wangwu@qq.com', '', 'hahahahaha', 'reanod', '15511111111', '15511111111', 'sjz', '\n    &lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2&quot; title=&quot;dachuizi1222&quot;&gt;dachuizi1222&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=5&quot; title=&quot;futou&quot;&gt;futou&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=8&quot; title=&quot;小钳子&quot;&gt;小钳子&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=30&quot; title=&quot;修理工具&quot;&gt;修理工具&lt;/a&gt;    ', '2016-06-13 16:41:50', '20', '', 1, 1473399635, 'china', '中国', 0, NULL),
(36, 'chenxiao', '445712421@qq.com', '', 'lasdirjir', '', '', '', '', '\r\n                                                ', '2016-10-25 15:46:03', '', '', 1, 0, '', '', 0, ''),
(33, 'aaaaaaa', 'aaaaa@qq.com', '', 'ddddddddddddddddddd', 'bad', '', '', '', '\r\n                                                ', '2016-10-14 10:22:53', '15', '给经理', 1, 0, 'china', '', 2, ''),
(34, 'xinjia1', '1111@qq.com', '', 'ceshiyong', '', '', '', '', '\r\n                                                ', '2016-10-25 11:40:47', '', '', 1, 0, '', '', 0, ''),
(35, 'xinfa2', '3233816752@qq.com', '', 'ceshiyong', 'asjlkdf', '', '', '', '\r\n                                                ', '2016-10-25 11:41:18', '', '', 1, 0, 'China', '', 0, ''),
(30, 'hello11', '78910@qq.com', '', 'very good', 'china', '15712345678', '', '', '', '2016-09-27 17:57:04', '', '', 1, 0, '', '', 0, ''),
(31, '测试haaaa', 'djfh@ww.com', '', '发财了', 'reanod', '15712345678', '', '', '&lt;a href=&quot;http://localhost/xinxiangmu/morenshengchengjingtai/98.html&quot; title=&quot;product 1&quot;&gt;product 1&lt;/a&gt;&lt;a href=&quot;http://localhost/xinxiangmu/morenshengchengjingtai/productrr-99.html&quot; title=&quot;product2&quot;&gt;product2&lt;/a&gt;', '2016-09-28 09:37:44', '', '', 1, 0, 'china', '', 0, ''),
(32, 'chenxiao', '3434343@qq.com', '', 'my inquery', 'xiaoren', '17678388', '', '', '\r\n                        &lt;a href=&quot;http://localhost/xinxiangmu/index.php?g=Content&amp;m=Pagedis&amp;a=shows_pro&amp;catid=73&amp;id=83&quot; title=&quot;钻石&quot; target=&quot;_blank&quot;&gt;钻石&lt;/a&gt;&lt;br /&gt;&lt;a href=&quot;http://localhost/xinxiangmu/index.php?g=Content&amp;m=Pagedis&amp;a=shows_pro&amp;catid=81&amp;id=98&quot; title=&quot;product 1&quot; target=&quot;_blank&quot;&gt;product 1&lt;/a&gt;&lt;br /&gt;&lt;a href=&quot;http://localhost/xinxiangmu/index.php?g=Content&amp;m=Pagedis&amp;a=shows_pro&amp;catid=81&amp;id=99&quot; title=&quot;product2&quot; target=&quot;_blank&quot;&gt;product2&lt;/a&gt;&lt;br /&gt;                        ', '2016-09-29 15:24:51', '17', '给了chenxiao业务', 1, 0, 'china', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_guestbook_data`
--

CREATE TABLE IF NOT EXISTS `cmf_guestbook_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestbook_group_id` int(11) NOT NULL COMMENT 'guestbook_group ID',
  `fieldid` int(11) NOT NULL COMMENT 'guestbook_field ID 选择了哪个字段',
  `if_show` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1-显示 2-不显示',
  `if_require` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否必须  1-必须 2-否',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='询盘所需字段表' AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `cmf_guestbook_data`
--

INSERT INTO `cmf_guestbook_data` (`id`, `guestbook_group_id`, `fieldid`, `if_show`, `if_require`, `addtime`) VALUES
(1, 1, 1, 2, 2, 1468830651),
(2, 1, 2, 1, 1, 1468830651),
(3, 1, 3, 2, 2, 1468830651),
(4, 1, 4, 2, 2, 1468830651),
(5, 1, 5, 2, 2, 1468830651),
(6, 1, 6, 2, 2, 1468830651),
(7, 1, 7, 2, 2, 1468830651),
(8, 1, 8, 2, 2, 1468830651),
(9, 1, 9, 2, 2, 1468830651),
(20, 1, 11, 2, 2, 1468830651),
(19, 1, 10, 2, 2, 1468830651),
(21, 2, 1, 1, 1, 1468830651),
(22, 2, 2, 2, 2, 1468830651),
(23, 2, 3, 1, 2, 1468830651),
(24, 2, 4, 2, 2, 1468830651),
(25, 2, 5, 1, 1, 1468830651),
(26, 2, 6, 2, 2, 1468830651),
(27, 2, 7, 1, 1, 1468830651),
(28, 2, 8, 2, 2, 1468830651),
(29, 2, 9, 1, 1, 1468830651),
(30, 2, 10, 2, 2, 1468830651),
(31, 2, 11, 1, 1, 1468830651);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_guestbook_field`
--

CREATE TABLE IF NOT EXISTS `cmf_guestbook_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '字段名',
  `desc` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL COMMENT '验证码地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='询盘显示字段管理表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `cmf_guestbook_field`
--

INSERT INTO `cmf_guestbook_field` (`id`, `name`, `desc`, `url`) VALUES
(1, 'full_name', '询盘人姓名', NULL),
(2, 'email', '询盘人邮箱', NULL),
(3, 'title', '标题', NULL),
(4, 'msg', '内容', NULL),
(5, 'company_name', '公司名称', NULL),
(6, 'tel', '电话', NULL),
(7, 'fax', '传真', NULL),
(8, 'address', '地址', NULL),
(9, 'from_country', '国家', NULL),
(10, 'verify', '验证码', NULL),
(11, 'file', '附件', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_guestbook_group`
--

CREATE TABLE IF NOT EXISTS `cmf_guestbook_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '询盘类型 ：footer , 其他',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='询盘类别表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_guestbook_group`
--

INSERT INTO `cmf_guestbook_group` (`id`, `name`, `addtime`) VALUES
(1, 'footer询盘', 1468830651),
(2, '边栏询盘', 1468889825);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_guestbook_set`
--

CREATE TABLE IF NOT EXISTS `cmf_guestbook_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zkey` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `zvalue` longtext COMMENT '值',
  PRIMARY KEY (`id`),
  KEY `zkey` (`zkey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_guestbook_set`
--

INSERT INTO `cmf_guestbook_set` (`id`, `zkey`, `zvalue`) VALUES
(1, 'fenpei', '2'),
(2, 'yangshi', '2');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_langset`
--

CREATE TABLE IF NOT EXISTS `cmf_langset` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lsign` char(100) NOT NULL DEFAULT '' COMMENT '语种标识',
  `lname` char(100) NOT NULL DEFAULT '' COMMENT '语种描述',
  `def` tinyint(4) NOT NULL DEFAULT '0' COMMENT '默认语言',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:1：以启用，0：未启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lsign` (`lsign`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_langset`
--

INSERT INTO `cmf_langset` (`id`, `lsign`, `lname`, `def`, `status`) VALUES
(1, 'zh-cn', '中文', 0, 1),
(2, 'en-us', '英文', 1, 1),
(3, 'fg-fh', '法文', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_links`
--

CREATE TABLE IF NOT EXISTS `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_time` datetime DEFAULT NULL COMMENT '友情链接添加时间',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `cmf_links`
--

INSERT INTO `cmf_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_time`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(14, 'www.reanod.com', 'Reanod', 'data/upload/20161025/580eb23fbc07d.png', '_blank', '瑞诺国际', '2016-10-25 09:16:16', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_locking`
--

CREATE TABLE IF NOT EXISTS `cmf_locking` (
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `locktime` int(10) NOT NULL DEFAULT '0' COMMENT '锁定时间',
  KEY `userid` (`userid`),
  KEY `onlinetime` (`locktime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_locking`
--

INSERT INTO `cmf_locking` (`userid`, `username`, `catid`, `id`, `locktime`) VALUES
(1, 'admin', 81, 103, 1478757347),
(1, 'admin', 99, 9, 1478757354),
(1, 'admin', 96, 41, 1478757373),
(1, 'admin', 94, 8, 1478757377);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_menu`
--

CREATE TABLE IF NOT EXISTS `cmf_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=371 ;

--
-- 转存表中的数据 `cmf_menu`
--

INSERT INTO `cmf_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 0, '内容管理', 'th', '', 30),
(2, 339, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '询盘管理', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 333, 'Content', 'Category', 'index', '', 0, 1, '导航栏目管理', '', '', 1),
(19, 18, 'Content', 'Category', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Content', 'Category', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Content', 'Category', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Content', 'Category', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Content', 'Category', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Content', 'Category', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 0, 'Admin', 'Recycle', 'default', '', 1, 0, '回收站', '', '', 10),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 0, '扩展工具', 'cloud', '', 40),
(40, 0, 'Admin', 'Backup', 'default', '', 1, 0, '备份恢复', '', '', 9),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 1, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 185, 'Admin', 'Link', 'index', '', 0, 1, '友情链接管理', '', '', 1),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 0, '设置', 'cogs', '', 7),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 334, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱设置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(292, 163, 'Content', 'Createhtml', 'update_all', '', 1, 1, '一键更新', '', '', 0),
(131, 163, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 0, '用户管理', 'group', '', 8),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 0, '用户管理', '', '', 10),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(286, 126, 'Admin', 'Mailer', 'active', '', 1, 0, '邮件模板', '', '', 0),
(287, 286, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 0, '管理员管理', '', '', 10),
(140, 132, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 0, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 132, 'Admin', 'User', 'index', '', 1, 1, '管理员管理', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 39, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(162, 109, 'Content', 'Models', 'index', '', 1, 1, '模型管理', '', '', 2),
(163, 333, 'Content', 'Createhtml', 'default', '', 1, 1, '网站更新', '', '', 3),
(164, 163, 'Content', 'Createhtml', 'index', '', 1, 1, '生成首页', '', '', 0),
(165, 163, 'Content', 'Createhtml', 'category', '', 1, 1, '批量生成栏目页', '', '', 0),
(166, 163, 'Content', 'Createhtml', 'update_urls', '', 1, 1, '批量更新URL', '', '', 0),
(167, 163, 'Content', 'Createhtml', 'update_show', '', 1, 1, '批量更新内容页', '', '', 0),
(168, 0, 'Socialplatform', 'Indexadmin', 'Index', '', 1, 0, '其它', 'bell-o', '', 50),
(169, 338, 'Socialplatform', 'Indexadmin', 'show', '', 1, 0, '社交', '', '', 0),
(170, 109, 'Socialplatform', 'Indexadmin', 'technical', '', 1, 1, '技术顾问', 'asterisk', '', 6),
(171, 333, 'Content', 'Contents', 'index', '', 1, 1, '栏目内容管理', '', '', 2),
(172, 0, 'Statistics', 'Report', 'main', '', 0, 1, '统计分析', 'line-chart', '', 2),
(173, 172, 'Statistics', 'ArticleStatistics', 'statisticsArticle', '', 1, 1, '文章统计', '', '', 0),
(174, 18, 'Content', 'Category', 'singlepage', '', 1, 0, '添加单页', '', '', 0),
(175, 18, 'Content', 'Category', 'wadd', '', 1, 0, '添加外部链接', '', '', 0),
(176, 18, 'Content', 'Category', 'categoryshux', '', 1, 0, '终极属性转换', '', '', 0),
(177, 18, 'Content', 'Category', 'public_cache', '', 1, 0, '分类更新缓存', '', '', 0),
(178, 1, 'Content', 'Urlrule', 'index', '', 1, 1, 'URL规则管理', '', '', 0),
(179, 178, 'Content', 'Urlrule', 'add', '', 1, 0, 'URL规则添加', '', '', 0),
(180, 179, 'Content', 'Urlrule', 'add_post', '', 1, 0, 'URL规则添加提交', '', '', 0),
(181, 178, 'Content', 'Urlrule', 'edit', '', 1, 0, 'URL规则编辑', '', '', 0),
(182, 181, 'Content', 'Urlrule', 'edit_post', '', 1, 0, 'Url规则编辑提交', '', '', 0),
(183, 178, 'Content', 'Urlrule', 'delete', '', 1, 0, 'URL规则删除', '', '', 0),
(184, 172, 'Statistics', 'ProductsStatistics', 'statisticsProducts', '', 1, 1, '产品统计', '', '', 1),
(185, 0, 'Release', 'Release', 'default', '', 1, 1, '营销管理', 'globe', '', 1),
(186, 185, 'Release', 'Release', 'mydefault', '', 1, 1, '平台管理', '', '', 0),
(187, 186, 'Release', 'Release', 'add', '', 1, 1, '添加B2B平台', '', '', 0),
(188, 172, 'Statistics', 'inquiryStatistics', 'statisticsInquiry', '', 1, 0, '询盘统计', '', '', 11),
(189, 187, 'Release', 'Release', 'add_post', '', 1, 0, 'B2B平台添加提交', '', '', 0),
(190, 109, 'Admin', 'Setting', 'logo', '', 1, 1, 'logo管理', 'wheelchair', '', 10),
(191, 186, 'Release', 'Release', 'edit', '', 1, 0, '修改信息', '', '', 0),
(192, 191, 'Release', 'Release', 'edit_post', '', 1, 0, '修改信息提交', '', '', 0),
(193, 186, 'Release', 'Release', 'delete', '', 1, 0, '营销平台删除', '', '', 0),
(194, 186, 'Release', 'Release', 'product', '', 1, 0, '选择产品', '', '', 0),
(195, 194, 'Release', 'Release', 'post_product', '', 1, 0, '发布产品到营销平台', '', '', 0),
(198, 172, 'Statistics', 'Report', 'index', '', 1, 1, '生成统计报告', '', '', 6),
(199, 172, 'Statistics', 'Foreignvis', 'index', '', 1, 1, '外商浏览量统计', '', '', 2),
(200, 132, 'User', 'Indexadmin', 'salesman', '', 1, 0, '业务员', '', '', 10),
(201, 172, 'Statistics', 'Keywordsrank', 'index', '', 1, 1, '关键词排名查询', '', '', 3),
(202, 185, 'Content', 'Category', 'mydefault', '', 1, 1, '关键词管理', '', '', 2),
(203, 202, 'Content', 'Tkslibrary', 'index', '', 1, 1, '关键词库', '', '', 1),
(204, 198, 'Statistics', 'Report', 'creport', '', 1, 0, '生成报告预览', '', '', 0),
(205, 204, 'Statistics', 'Report', 'zcpppdf', '', 1, 0, '生成报告', '', '', 0),
(206, 198, 'Statistics', 'Report', 'commentList', '', 1, 0, '报告评论列表', '', '', 0),
(207, 206, 'Statistics', 'Report', 'editComment', '', 1, 0, '修改评论', '', '', 0),
(208, 206, 'Statistics', 'Report', 'edit_post', '', 1, 0, '修改评论提交', '', '', 0),
(209, 206, 'Statistics', 'Report', 'delete', '', 1, 0, '删除评论', '', '', 0),
(210, 198, 'Statistics', 'Report', 'addComment', '', 1, 0, '新增评论', '', '', 0),
(211, 210, 'Statistics', 'Report', 'add_post', '', 1, 0, '新增评论提交', '', '', 0),
(212, 334, 'Search', 'Search', 'index', '', 1, 1, '搜索设置', '', '', 0),
(213, 109, 'Socialplatform', 'Indexadmin', 'reminder', '', 1, 1, '域名和服务器到期提醒', '', '', 5),
(214, 172, 'Statistics', 'GoogleApi', 'index', '', 1, 1, '谷歌API', '', '', 5),
(236, 333, 'Contact', 'Contacttype', 'index', '', 1, 1, '联系方式管理', '', '', 4),
(216, 172, 'Statistics', 'Links', 'index', '', 1, 1, '发布链接统计', '', '', 4),
(224, 223, 'Crm', 'Cmanage', 'default', '', 1, 1, 'CRM系统设置', '', '', 90),
(217, 32, 'Api', 'Guestbookdel', 'index', '', 1, 1, '询盘回收', '', '', 0),
(218, 339, 'api', 'Guestbookadmin', 'guestBookGroup', '', 1, 1, '询盘显示管理', '', '', 0),
(219, 218, 'Api', 'Guestbookadmin', 'addGroup', '', 1, 0, '询盘类型添加', '', '', 0),
(220, 219, 'Api', 'Guestbookadmin', 'add_post', '', 1, 0, '询盘类型添加提交', '', '', 0),
(221, 218, 'Api', 'Guestbookadmin', 'editGroup', '', 1, 0, '询盘类型修改', '', '', 0),
(222, 221, 'Api', 'Guestbookadmin', 'edit_post', '', 1, 0, '询盘类型修改提交', '', '', 0),
(223, 0, 'Crm', 'Cindex', 'default', '', 1, 1, 'CRM系统', 'pie-chart', '', 4),
(225, 223, 'Crm', 'Cindex', 'client', '', 1, 1, '归属客户', '', '', 10),
(226, 223, 'Crm', 'Cindex', 'totalClient', '', 1, 1, '公海客户', '', '', 20),
(227, 225, 'Crm', 'Cindex', 'ownClient', '', 1, 1, '未成交客户', '', '', 1),
(270, 227, 'Crm', 'Cindex', 'exportMyClient', '', 1, 0, '导出客户列表', '', '', 0),
(229, 354, 'Crm', 'Cindex', 'addOne', '', 1, 1, '单个添加', '', '', 1),
(230, 354, 'Crm', 'Cindex', 'addList', '', 1, 1, '批量导入', '', '', 1),
(233, 224, 'Crm', 'Cmanage', 'Clevel', '', 1, 1, '客户阶段管理', '', '', 0),
(333, 0, 'website', 'management', 'set', '', 1, 1, '网站管理', 'sitemap', '', 0),
(234, 224, 'Crm', 'Cmanage', 'Ctype', '', 1, 1, '客户类型管理', '', '', 0),
(235, 224, 'Crm', 'Cmanage', 'Coption', '', 1, 1, 'CRM常规设置', '', '', 0),
(328, 304, 'Crm', 'Cdata', 'addPost', '', 1, 0, '增加目标提交', '', '', 0),
(254, 226, 'Crm', 'Cindex', 'allotPost', '', 1, 0, '分配客户提交', '', '', 0),
(240, 233, 'Crm', 'Cmanage', 'editLevel', '', 1, 0, '修改级别', '', '', 0),
(241, 234, 'Crm', 'Cmanage', 'typeAdd', '', 1, 0, '添加类型提交', '', '', 0),
(327, 304, 'Crm', 'Cdata', 'addMonthData', '', 1, 0, '新增目标', '', '', 0),
(243, 234, 'Crm', 'Cmanage', 'addType', '', 1, 0, '添加类型', '', '', 0),
(244, 233, 'Crm', 'Cmanage', 'levelEdit', '', 1, 0, '修改级别提交', '', '', 0),
(245, 234, 'Crm', 'Cmanage', 'editType', '', 1, 0, '修改类型', '', '', 0),
(246, 234, 'Crm', 'Cmanage', 'typeEdit', '', 1, 0, '修改类型提交', '', '', 0),
(318, 339, 'Api', 'Guestbookadmin', 'setting', '', 1, 1, '询盘设置', '', '', 1),
(247, 234, 'Crm', 'Cmanage', 'typeDelete', '', 1, 0, '删除类型', '', '', 0),
(248, 235, 'Crm', 'Cmanage', 'editOption', '', 1, 0, 'CRM常规设置提交', '', '', 0),
(249, 226, 'Crm', 'Cindex', 'getClient', '', 1, 0, '抓取客户', '', '', 0),
(250, 226, 'Crm', 'Cindex', 'allotClient', '', 1, 0, '分配客户', '', '', 0),
(251, 226, 'Crm', 'Cindex', 'deleteClient', '', 1, 0, '删除客户', '', '', 0),
(252, 229, 'Crm', 'Cindex', 'oneAdd', '', 1, 0, '单个添加提交', '', '', 0),
(253, 230, 'Crm', 'Cindex', 'listAdd', '', 1, 0, '批量导入提交', '', '', 0),
(255, 229, 'Crm', 'Cindex', 'getSale', '', 1, 0, '获得下级业务员', '', '', 0),
(256, 226, 'Crm', 'Cindex', 'editClient', '', 1, 0, '编辑客户资料', '', '', 0),
(257, 226, 'Crm', 'Cindex', 'editPost', '', 1, 0, '编辑客户资料提交', '', '', 0),
(259, 227, 'Crm', 'Cindex', 'editMyLevel', '', 1, 0, '修改客户级别', '', '', 0),
(260, 227, 'Crm', 'Cindex', 'editLevelPost', '', 1, 0, '修改客户级别提交', '', '', 0),
(261, 227, 'Crm', 'Cindex', 'editMyType', '', 1, 0, '修改客户类别', '', '', 0),
(262, 227, 'Crm', 'Cindex', 'addContact', '', 1, 0, '添加沟通记录', '', '', 0),
(263, 227, 'Crm', 'Cindex', 'contactAdd', '', 1, 0, '添加沟通记录提交', '', '', 0),
(264, 227, 'Crm', 'Cindex', 'addMoreUser', '', 1, 0, '添加第二联系人', '', '', 0),
(265, 227, 'Crm', 'Cindex', 'addMore', '', 1, 0, '添加第二联系人提交', '', '', 0),
(266, 227, 'Crm', 'Cindex', 'editSecondUser', '', 1, 0, '修改第二联系人', '', '', 0),
(267, 227, 'Crm', 'Cindex', 'editSecondPost', '', 1, 0, '修改第二联系人提交', '', '', 0),
(268, 227, 'Crm', 'Cindex', 'deleteSecondUser', '', 1, 0, '删除第二联系人', '', '', 0),
(269, 223, 'Crm', 'Cmanage', 'main', '', 1, 0, '总览', '', '', 0),
(271, 225, 'Crm', 'Cmanage', 'flyClient', '', 1, 1, '飞出客户', '', '', 10),
(272, 223, 'Crm', 'Cindex', 'restore', '', 1, 1, '客户回收站', '', '', 100),
(273, 227, 'Crm', 'Cindex', 'goGh', '', 1, 0, '扔入公海', '', '', 0),
(274, 272, 'Crm', 'Cindex', 'restoreClient', '', 1, 0, '客户恢复', '', '', 0),
(275, 272, 'Crm', 'Cindex', 'pDeleteClient', '', 1, 0, '永久删除客户', '', '', 0),
(276, 227, 'Crm', 'Cindex', 'editTypePost', '', 1, 0, '修改客户类别提交', '', '', 0),
(277, 338, 'Content', 'Socially', 'index', '', 1, 1, '关注我们', '', '', 4),
(278, 18, 'Content', 'Category', 'changeismenu', '', 1, 0, '是否首页显示', '', '', 0),
(279, 109, 'Admin', 'Setting', 'languages', '', 1, 1, '多语言设置', '', '', 1),
(280, 163, 'Socialplatform', 'Indexadmin', 'site', '', 1, 1, '生成sitemap', '', '', 0),
(281, 109, 'Admin', 'DemoTem', 'index', '', 1, 1, '模板管理', '', '', 3),
(282, 109, 'Admin', 'Main', 'getVersion', '', 0, 0, '检查更新', '', '', 0),
(283, 32, 'Content', 'Contentshow', 'recycle', '', 1, 1, '内容回收', '', '', 0),
(289, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(290, 289, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(293, 0, 'Gadgets', 'Currency', 'default', '', 1, 1, '工作助手', 'steam-square', '', 6),
(294, 293, 'Gadgets', 'Currency', 'index', '', 1, 1, '货币汇率', '', '', 0),
(295, 293, 'Gadgets', 'Exchagerate', 'index', '', 1, 1, '汇率查询', '', '', 3),
(296, 293, 'Gadgets', 'Customs', 'index', '', 1, 1, '海关', '', '', 2),
(297, 293, 'Gadgets', 'Translate', 'index', '', 1, 1, '翻译', '', '', 4),
(298, 293, 'Gadgets', 'Worldtime', 'index', '', 1, 1, '世界时间', '', '', 1),
(299, 333, 'Admin', 'Partner', 'index', '', 0, 1, '合作伙伴', '', '', 5),
(300, 0, 'Release', 'Release', 'abc', '', 1, 1, '培训提高', 'mortar-board', '', 5),
(301, 186, 'Release', 'Release', 'yellowPage', '', 1, 1, '目录列表', '', '', 3),
(302, 186, 'Release', 'Release', 'addYellow', '', 1, 1, '添加目录平台', '', '', 2),
(303, 223, 'Crm', 'Cdata', 'index', '', 1, 1, '数据看板', '', '', 1),
(304, 223, 'Crm', 'Cdata', 'monthData', '', 1, 1, '年度目标金额设置', '', '', 80),
(305, 223, 'Crm', 'Cindex', 'manageClientStatus', '', 1, 1, '申请阶段审批', '', '', 70),
(306, 227, 'Crm', 'Cindex', 'reqClientStatus', '', 1, 0, '阶段申请', '', '', 0),
(307, 227, 'Crm', 'Cindex', 'reqClientPost', '', 0, 0, '归属客户提交', '', '', 0),
(308, 305, 'Crm', 'Cindex', 'approveStatus', '', 1, 0, '审批阶段', '', '', 0),
(309, 305, 'Crm', 'Cindex', 'approvePost', '', 1, 0, '审批提交', '', '', 0),
(310, 227, 'Crm', 'Cindex', 'addOrder', '', 1, 0, '下订单', '', '', 0),
(311, 227, 'Crm', 'Cindex', 'orderPost', '', 1, 0, '提交新订单', '', '', 0),
(312, 223, 'Crm', 'Corder', 'orderList', '', 1, 1, '订单管理', '', '', 40),
(357, 312, 'Crm', 'Corder', 'cancelOrder', '', 1, 0, '删除订单', '', '', 7),
(314, 312, 'Crm', 'Corder', 'editOrder', '', 1, 0, '修改订单信息', '', '', 1),
(315, 312, 'Crm', 'Corder', 'editPost', '', 1, 0, '修改订单提交', '', '', 2),
(316, 312, 'Crm', 'Corder', 'addRefund', '', 1, 0, '添加回款记录', '', '', 3),
(317, 312, 'Crm', 'Corder', 'refundPost', '', 1, 0, '回款记录提交', '', '', 4),
(319, 224, 'Crm', 'Cmanage', 'branchCompany', '', 1, 1, '分公司设置', '', '', 0),
(320, 312, 'Crm', 'Corder', 'confirmRefund', '', 1, 0, '确认回款信息', '', '', 5),
(321, 312, 'Crm', 'Corder', 'delRefund', '', 1, 0, '删除回款信息', '', '', 6),
(322, 303, 'Crm', 'Cdata', 'saleProcess', '', 1, 0, '销售流程分析', '', '', 0),
(323, 303, 'Crm', 'Cdata', 'behaviour', '', 1, 0, '行为分析', '', '', 0),
(324, 323, 'Crm', 'Cdata', 'behav_step', '', 1, 0, '客户拜访情况', '', '', 0),
(325, 223, 'Crm', 'Cdata', 'report', '', 1, 0, '智能简报', '', '', 2),
(326, 323, 'Crm', 'Cdata', 'behav_step2', '', 1, 0, '客户沟通情况', '', '', 0),
(329, 304, 'Crm', 'Cdata', 'editMonthData', '', 1, 0, '编辑目标金额', '', '', 0),
(330, 304, 'Crm', 'Cdata', 'editPost', '', 1, 0, '编辑目标金额提交', '', '', 0),
(331, 304, 'Crm', 'Cdata', 'deleteMonthData', '', 1, 0, '删除目标设置', '', '', 0),
(334, 333, 'website', 'management', 'configure', '', 1, 1, '网站配置', '', '', 0),
(336, 186, 'Release', 'Release', 'index', '', 1, 1, 'B2B平台管理', '', '', 1),
(337, 202, 'Content', 'Category', 'listtdk', '', 1, 1, '关键词设置', '', '', 0),
(338, 185, 'Socialplatform', 'Indexadmin', 'mydefault', '', 1, 1, '社交平台', '', '', 3),
(339, 0, 'Api', 'Guestbookadmin', 'mydefault', '', 1, 1, '询盘管理', 'envelope-o', '', 3),
(341, 171, 'Content', 'Contents', 'testsd', 'modelid=30', 1, 1, '测试', '', '', 50),
(342, 171, 'Content', 'Contents', 'article', 'modelid=1', 1, 1, '文章模型', '', '', 0),
(343, 171, 'Content', 'Contents', 'download', 'modelid=2', 1, 1, 'factory tour', '', '', 0),
(344, 171, 'Content', 'Contents', 'photo', 'modelid=3', 1, 1, '证书模型', '', '', 0),
(345, 171, 'Content', 'Contents', 'product', 'modelid=5', 1, 1, '产品', '', '', 0),
(346, 171, 'Content', 'Contents', 'cxtest', 'modelid=26', 1, 1, '陈枭测试', '', '', 0),
(347, 171, 'Content', 'Contents', 'singlepage', 'modelid=0', 1, 1, '单页管理', '', '', 0),
(348, 171, 'Content', 'Contents', 'faq', 'modelid=31', 1, 1, 'FAQ2', '', '', 0),
(349, 339, 'Api', 'Guestbookadmin', 'email', '', 1, 1, '邮箱管理', '', '', 0),
(350, 293, 'Gadgets', 'Ip', 'index', '', 1, 1, 'IP地址查询', '', '', 0),
(351, 227, 'Crm', 'Cindex', 'requirehelp', '', 1, 0, '申请经理关注', '', '', 0),
(352, 227, 'Crm', 'Cindex', 'reqoffer', '', 1, 0, '申请报价审批', '', '', 0),
(353, 225, 'Crm', 'Cindex', 'hasOrder', '', 1, 1, '成交客户', '', '', 3),
(354, 223, 'Crm', 'Cindex', 'addCustomer', '', 1, 1, '添加客户', '', '', 30),
(355, 223, 'Crm', 'Cindex', 'offerClient', '', 1, 1, '申请报价审批', '', '', 60),
(356, 223, 'Crm', 'Cindex', 'helpList', '', 1, 1, '沟通关注审批', '', '', 50),
(358, 312, 'Crm', 'Corder', 'confirmOrder', '', 1, 0, '确认订单完成', '', '', 8),
(359, 356, 'Crm', 'Cindex', 'replyHelp', '', 1, 0, '经理审批提交', '', '', 0),
(360, 355, 'Crm', 'Cindex', 'confirmOffer', '', 1, 0, '经理审批报价提交', '', '', 0),
(361, 303, 'Crm', 'Cdata', 'singleSale', '', 0, 0, '业务经理查看单个人业绩', '', '', 0),
(362, 303, 'Crm', 'Cdata', 'department', '', 1, 0, '跳转分公司', '', '', 0),
(363, 303, 'Crm', 'Cdata', 'singleManager', '', 1, 0, '查看某个业务经理', '', '', 0),
(364, 303, 'Crm', 'Cdata', 'saleman', '', 1, 0, '查看个人', '', '', 0),
(365, 0, 'Admin', 'User', 'helpcenter', '', 1, 0, '帮助中心', '', '', 60),
(366, 223, 'Crm', 'Cdata', 'contactRemind', '', 0, 0, '今日沟通提醒', '', '', 0),
(367, 312, 'Crm', 'Corder', 'orderShip', '', 1, 0, '出运时间提醒列表', '', '', 0),
(368, 312, 'Crm', 'Cindex', 'outputOrder', '', 1, 0, '查看订单合同', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_model`
--

CREATE TABLE IF NOT EXISTS `cmf_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `menuid` int(200) NOT NULL COMMENT '菜单id',
  `description` char(100) NOT NULL DEFAULT '' COMMENT '描述',
  `tablename` char(20) NOT NULL DEFAULT '' COMMENT '表名',
  `setting` text COMMENT '配置信息',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '信息数',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启全站搜索',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否禁用 1禁用',
  `default_style` char(30) NOT NULL DEFAULT '' COMMENT '风格',
  `category_template` char(30) NOT NULL DEFAULT '' COMMENT '栏目模板',
  `list_template` char(30) NOT NULL DEFAULT '' COMMENT '列表模板',
  `show_template` char(30) NOT NULL DEFAULT '' COMMENT '内容模板',
  `js_template` varchar(30) NOT NULL DEFAULT '' COMMENT 'JS模板',
  `sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模块标识',
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `cmf_model`
--

INSERT INTO `cmf_model` (`modelid`, `name`, `menuid`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type`) VALUES
(1, '文章模型', 342, '文章模型', 'article', '', 1403150253, 0, 1, 0, '', '', '', '', '', 0, 0),
(2, 'factory tour', 343, 'factory tour', 'download', '', 1403153866, 0, 1, 0, '', '', '', '', '', 0, 0),
(3, '证书模型', 344, '图片模型', 'photo', '', 1403153881, 0, 1, 0, '', '', '', '', '', 0, 0),
(5, '产品', 345, '产品模型', 'product', '', 1463623520, 0, 0, 0, '', '', '', '', '', 0, 0),
(31, 'FAQ2', 348, 'faq2', 'faq', '', 1474624158, 0, 0, 0, '', '', '', '', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_model_field`
--

CREATE TABLE IF NOT EXISTS `cmf_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `field` varchar(20) NOT NULL DEFAULT '' COMMENT '字段名',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '别名',
  `tips` text COMMENT '字段提示',
  `css` varchar(30) NOT NULL DEFAULT '' COMMENT '表单样式',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最小值',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大值',
  `pattern` varchar(255) NOT NULL DEFAULT '' COMMENT '数据校验正则',
  `errortips` varchar(255) NOT NULL DEFAULT '' COMMENT '数据校验未通过的提示信息',
  `formtype` varchar(20) NOT NULL DEFAULT '' COMMENT '字段类型',
  `setting` mediumtext,
  `formattribute` varchar(255) NOT NULL DEFAULT '',
  `unsetgroupids` varchar(255) NOT NULL DEFAULT '',
  `unsetroleids` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否内部字段 1是',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否系统字段 1 是',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '值唯一',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为基本信息',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为搜索条件',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '在前台投稿中显示',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '作为全站搜索信息',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否入库到推荐位',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 禁用 0启用',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=737 ;

--
-- 转存表中的数据 `cmf_model_field`
--

INSERT INTO `cmf_model_field` (`fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES
(1, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', 'a:8:{s:7:"options";s:0:"";s:9:"fieldtype";s:7:"varchar";s:5:"width";s:0:"";s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:10:"outputtype";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(2, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', 'a:5:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(3, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', 'a:3:{s:4:"size";s:0:"";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 17, 0, 0),
(4, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0),
(5, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'a:10:{s:7:"options";s:32:"允许评论|1\n不允许评论|0";s:7:"boxtype";s:5:"radio";s:9:"fieldtype";s:7:"tinyint";s:9:"minnumber";s:1:"1";s:5:"width";s:2:"88";s:4:"size";s:0:"";s:12:"defaultvalue";s:1:"1";s:10:"outputtype";s:1:"1";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0),
(7, 1, 'inputtime', '真实发布时间', '', '', 0, 0, '', '', 'datetime', 'a:5:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 0, 0, 0, 0, 1, 11, 0, 0),
(140, 4, 'istop', '置顶', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(141, 4, 'recommend', '推荐', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(9, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', 'a:5:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 12, 0, 0),
(10, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', 'a:7:{s:9:"minnumber";s:0:"";s:9:"maxnumber";s:0:"";s:13:"decimaldigits";s:1:"0";s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(11, 1, 'relation', '相关文章', '', '', 0, 255, '', '', 'omnipotent', 'a:4:{s:8:"formtext";s:464:"<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" >\n<ul class="list-dot" id="relation_text">\n</ul>\n<input type="button" value="添加相关" onClick="omnipotent(''selectid'',GV.DIMAUB+''index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}'',''添加相关文章'',1)" class="btn">\n<span class="edit_content">\n  <input type="button" value="显示已有" onClick="show_relation({MODELID},{ID})" class="btn">\n</span>";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 8, 0, 0),
(12, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'a:10:{s:5:"width";s:0:"";s:12:"defaultvalue";s:0:"";s:9:"show_type";s:1:"1";s:15:"upload_allowext";s:20:"jpg|jpeg|gif|png|bmp";s:9:"watermark";s:1:"0";s:13:"isselectimage";s:1:"1";s:12:"images_width";s:0:"";s:13:"images_height";s:0:"";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 7, 0, 0),
(13, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(15, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(17, 1, 'tags', 'TAGS', '多关之间用空格或者“,”隔开', '', 0, 0, '', '', 'tags', 'a:4:{s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 4, 1, 0),
(18, 1, 'description', '摘要', '', '', 0, 350, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"99";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(19, 1, 'updatetime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'a:5:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 23, 0, 0),
(20, 1, 'content', '内容', '', '', 1, 999999, '', '内容不能为空', 'editor', 'a:7:{s:7:"toolbar";s:4:"full";s:12:"defaultvalue";s:0:"";s:15:"enablesaveimage";s:1:"1";s:6:"height";s:0:"";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 6, 0, 0),
(21, 1, 'copyfrom', '来源', '', '', 0, 0, '', '', 'copyfrom', 'a:4:{s:12:"defaultvalue";s:0:"";s:5:"width";s:0:"";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 5, 0, 0),
(26, 2, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(27, 2, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 17, 0, 0),
(28, 2, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'a:2:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0),
(29, 2, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'a:9:{s:7:"options";s:33:"允许评论|1\n不允许评论|0";s:7:"boxtype";s:5:"radio";s:9:"fieldtype";s:7:"tinyint";s:9:"minnumber";s:1:"1";s:5:"width";s:2:"88";s:4:"size";s:0:"";s:12:"defaultvalue";s:1:"1";s:10:"outputtype";s:1:"1";s:10:"filtertype";s:1:"0";}', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0),
(24, 1, 'prefix', '自定义文件名', '', '', 0, 255, '', '', 'text', 'a:5:{s:4:"size";s:3:"180";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 17, 0, 0),
(66, 3, 'prefix', '自定义文件名', '', '', 0, 0, '', '', 'text', 'a:7:{s:4:"size";s:2:"50";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 0),
(25, 2, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(65, 2, 'prefix', '自定义文件名', '', '', 0, 0, '', '', 'text', 'a:7:{s:4:"size";s:3:"180";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 17, 0, 0),
(31, 2, 'inputtime', '真实发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 1, 1, 0, 0, 0, 0, 0, 1, 11, 0, 0),
(137, 2, 'recommend', '推荐', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(138, 3, 'istop', '置顶', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(139, 3, 'recommend', '推荐', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(33, 2, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 12, 0, 0),
(34, 2, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(35, 2, 'relation', '相关下载', '', '', 0, 255, '', '', 'omnipotent', 'a:4:{s:8:"formtext";s:464:"<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" >\n<ul class="list-dot" id="relation_text">\n</ul>\n<input type="button" value="添加相关" onClick="omnipotent(''selectid'',GV.DIMAUB+''index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}'',''添加相关信息'',1)" class="btn">\n<span class="edit_content">\n  <input type="button" value="显示已有" onClick="show_relation({MODELID},{ID})" class="btn">\n</span>";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 8, 0, 0),
(36, 2, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'a:9:{s:4:"size";s:2:"50";s:12:"defaultvalue";s:0:"";s:9:"show_type";s:1:"1";s:14:"upload_maxsize";s:4:"1024";s:15:"upload_allowext";s:20:"jpg|jpeg|gif|png|bmp";s:9:"watermark";s:1:"0";s:13:"isselectimage";s:1:"1";s:12:"images_width";s:0:"";s:13:"images_height";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 7, 0, 0),
(37, 2, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'a:1:{s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(38, 2, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'a:2:{s:9:"minnumber";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '', '', 1, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(39, 2, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(41, 2, 'tags', 'TAGS', '多关之间用空格或者“,”隔开', '', 0, 0, '', '', 'tags', 'a:4:{s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 4, 1, 0),
(42, 2, 'description', '摘要', '', '', 0, 350, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(43, 2, 'updatetime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 23, 0, 0),
(45, 3, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(46, 3, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(47, 3, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 17, 0, 0),
(48, 3, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'a:2:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0),
(49, 3, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'a:9:{s:7:"options";s:33:"允许评论|1\n不允许评论|0";s:7:"boxtype";s:5:"radio";s:9:"fieldtype";s:7:"tinyint";s:9:"minnumber";s:1:"1";s:5:"width";s:2:"88";s:4:"size";s:0:"";s:12:"defaultvalue";s:1:"1";s:10:"outputtype";s:1:"1";s:10:"filtertype";s:1:"0";}', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0),
(67, 2, 'download', '文件下载', '', '', 0, 0, '', '', 'downfiles', 'a:9:{s:15:"upload_allowext";s:20:"gif|jpg|jpeg|png|bmp";s:13:"isselectimage";s:1:"0";s:13:"upload_number";s:2:"10";s:10:"statistics";s:0:"";s:12:"downloadlink";s:1:"1";s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 4, 0, 0),
(51, 3, 'inputtime', '真实发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 1, 1, 0, 0, 0, 0, 0, 1, 11, 0, 0),
(136, 2, 'istop', '置顶', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(53, 3, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 12, 0, 0),
(54, 3, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(55, 3, 'relation', '相关图片', '', '', 0, 255, '', '', 'omnipotent', 'a:4:{s:8:"formtext";s:464:"<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" >\n<ul class="list-dot" id="relation_text">\n</ul>\n<input type="button" value="添加相关" onClick="omnipotent(''selectid'',GV.DIMAUB+''index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}'',''添加相关信息'',1)" class="btn">\n<span class="edit_content">\n  <input type="button" value="显示已有" onClick="show_relation({MODELID},{ID})" class="btn">\n</span>";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 8, 0, 0),
(56, 3, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'a:9:{s:4:"size";s:2:"50";s:12:"defaultvalue";s:0:"";s:9:"show_type";s:1:"1";s:14:"upload_maxsize";s:4:"1024";s:15:"upload_allowext";s:20:"jpg|jpeg|gif|png|bmp";s:9:"watermark";s:1:"0";s:13:"isselectimage";s:1:"1";s:12:"images_width";s:0:"";s:13:"images_height";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 7, 0, 0),
(57, 3, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'a:1:{s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(59, 3, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(382, 1, 'seourl', 'seourl', '', 'inputtitle', 1, 80, '', '', 'seourl', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(383, 2, 'seourl', 'seourl', '', 'inputtitle', 1, 80, '', '', 'seourl', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(61, 3, 'tags', 'TAGS', '多关之间用空格或者“,”隔开', '', 0, 0, '', '', 'tags', 'a:4:{s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 4, 1, 0),
(62, 3, 'description', '摘要', '', '', 0, 350, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(63, 3, 'updatetime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 23, 0, 0),
(68, 3, 'imgs', '图片列表', '', '', 0, 0, '', '', 'images', 'a:8:{s:15:"upload_allowext";s:20:"gif|jpg|jpeg|png|bmp";s:13:"isselectimage";s:1:"0";s:13:"upload_number";s:2:"10";s:9:"watermark";s:1:"0";s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0),
(69, 4, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(70, 4, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(71, 4, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 17, 0, 0),
(72, 4, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'a:2:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0),
(73, 4, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'a:9:{s:7:"options";s:33:"允许评论|1\n不允许评论|0";s:7:"boxtype";s:5:"radio";s:9:"fieldtype";s:7:"tinyint";s:9:"minnumber";s:1:"1";s:5:"width";s:2:"88";s:4:"size";s:0:"";s:12:"defaultvalue";s:1:"1";s:10:"outputtype";s:1:"1";s:10:"filtertype";s:1:"0";}', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0),
(75, 4, 'inputtime', '真实发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 1, 1, 0, 0, 0, 0, 0, 1, 11, 0, 0),
(77, 4, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 12, 0, 0),
(78, 4, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(79, 4, 'relation', '相关文章', '', '', 0, 255, '', '', 'omnipotent', 'a:4:{s:8:"formtext";s:464:"<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" >\n<ul class="list-dot" id="relation_text">\n</ul>\n<input type="button" value="添加相关" onClick="omnipotent(''selectid'',GV.DIMAUB+''index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}'',''添加相关文章'',1)" class="btn">\n<span class="edit_content">\n  <input type="button" value="显示已有" onClick="show_relation({MODELID},{ID})" class="btn">\n</span>";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 8, 0, 0),
(80, 4, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'a:9:{s:4:"size";s:2:"50";s:12:"defaultvalue";s:0:"";s:9:"show_type";s:1:"1";s:14:"upload_maxsize";s:4:"1024";s:15:"upload_allowext";s:20:"jpg|jpeg|gif|png|bmp";s:9:"watermark";s:1:"0";s:13:"isselectimage";s:1:"1";s:12:"images_width";s:0:"";s:13:"images_height";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 7, 0, 0),
(81, 4, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'a:1:{s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(82, 4, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'a:2:{s:9:"minnumber";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '', '', 1, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(83, 4, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(384, 3, 'seourl', 'seourl', '', 'inputtitle', 1, 80, '', '', 'seourl', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(85, 4, 'tags', 'TAGS', '多关之间用空格或者“,”隔开', '', 0, 0, '', '', 'tags', 'a:4:{s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 4, 0, 0),
(86, 4, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'a:4:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(87, 4, 'updatetime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 10, 0, 0),
(88, 4, 'content', '内容', '', '', 1, 999999, '', '内容不能为空', 'editor', 'a:6:{s:7:"toolbar";s:4:"full";s:12:"defaultvalue";s:0:"";s:13:"enablekeylink";s:1:"1";s:10:"replacenum";s:1:"2";s:9:"link_mode";s:1:"0";s:15:"enablesaveimage";s:1:"1";}', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 6, 0, 0),
(89, 5, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(90, 5, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 21, 0, 0),
(91, 5, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 22, 0, 0),
(92, 5, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'a:2:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0),
(93, 5, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'a:9:{s:7:"options";s:33:"允许评论|1\n不允许评论|0";s:7:"boxtype";s:5:"radio";s:9:"fieldtype";s:7:"tinyint";s:9:"minnumber";s:1:"1";s:5:"width";s:2:"88";s:4:"size";s:0:"";s:12:"defaultvalue";s:1:"1";s:10:"outputtype";s:1:"1";s:10:"filtertype";s:1:"0";}', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 17, 0, 0),
(95, 5, 'inputtime', '真实发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 1, 1, 0, 0, 0, 0, 0, 1, 14, 0, 0),
(135, 1, 'recommend', '推荐', '', '', 0, 2, '', '', 'box', 'a:8:{s:7:"options";s:0:"";s:9:"fieldtype";s:7:"varchar";s:5:"width";s:0:"";s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:10:"outputtype";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(97, 5, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 15, 0, 0),
(98, 5, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 23, 0, 0),
(99, 5, 'relation', '相关产品', '', '', 0, 255, '', '', 'omnipotent', 'a:4:{s:8:"formtext";s:470:"<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" >\n<ul class="list-dot" id="relation_text">\n</ul>\n<input type="button" value="添加相关" onClick="omnipotent(''selectid'',GV.DIMAUB+''index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}'',''添加相关文章'',1)" class="btn">\n<span class="edit_content">\n  <input type="button" value="显示已有" onClick="show_relation({MODELID},{ID})" class="btn">\n</span>";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 12, 0, 0),
(100, 5, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'a:9:{s:4:"size";s:2:"50";s:12:"defaultvalue";s:0:"";s:9:"show_type";s:1:"1";s:14:"upload_maxsize";s:4:"1024";s:15:"upload_allowext";s:20:"jpg|jpeg|gif|png|bmp";s:9:"watermark";s:1:"0";s:13:"isselectimage";s:1:"1";s:12:"images_width";s:0:"";s:13:"images_height";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 11, 0, 0),
(101, 5, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'a:1:{s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0),
(102, 5, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'a:2:{s:9:"minnumber";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '', '', 1, 1, 0, 1, 1, 1, 0, 0, 3, 0, 0),
(103, 5, 'title', '产品名称', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0),
(105, 5, 'tags', 'TAGS', '多关之间用空格或者“,”隔开', '', 0, 0, '', '', 'tags', 'a:4:{s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0),
(106, 5, 'description', '摘要', '', '', 0, 350, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 7, 0, 0),
(107, 5, 'updatetime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 24, 0, 0),
(108, 5, 'content', '产品描述', '', '', 1, 999999, '', '内容不能为空', 'editor', 'a:7:{s:7:"toolbar";s:4:"full";s:12:"defaultvalue";s:0:"";s:15:"enablesaveimage";s:1:"1";s:6:"height";s:0:"";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 10, 0, 0),
(110, 5, 'size', '产品型号', '', '', 1, 50, '/^[0-9.-]+$/', '型号输入不对啊', 'text', 'a:7:{s:4:"size";s:2:"30";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 0, 6, 0, 0),
(109, 5, 'price', '价格', '', '', 0, 7, '/^[0-9.-]+$/', '请填写价格！', 'text', 'a:7:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:10:"ispassword";s:1:"0";s:12:"backstagefun";s:0:"";s:17:"backstagefun_type";s:1:"1";s:8:"frontfun";s:0:"";s:13:"frontfun_type";s:1:"1";}', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 6, 0, 0),
(134, 1, 'istop', '置顶', '', '', 0, 2, '', '', 'box', 'a:8:{s:7:"options";s:0:"";s:9:"fieldtype";s:7:"varchar";s:5:"width";s:0:"";s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";s:10:"outputtype";s:1:"0";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(142, 5, 'istop', '置顶', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 19, 0, 0),
(143, 5, 'recommend', '推荐', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 20, 0, 0),
(197, 1, 'seotitle', 'SEO标题', '', 'inputtitle', 0, 110, '', '请输入标题', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(198, 2, 'seotitle', 'SEO标题', '', 'inputtitle', 0, 110, '', '请输入标题', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(199, 3, 'seotitle', 'SEO标题', '', 'inputtitle', 0, 60, '', '请输入标题', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(200, 5, 'seotitle', 'SEO标题', '', 'inputtitle', 0, 110, '', '请输入标题', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 8, 0, 0),
(201, 1, 'seokeywords', 'SEO关键字', '', '', 0, 200, '', '', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(202, 2, 'seokeywords', 'SEO关键字', '', '', 0, 200, '', '', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(203, 3, 'seokeywords', 'SEO关键字', '', '', 0, 100, '', '', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(204, 5, 'seokeywords', 'SEO关键字', '', '', 0, 200, '', '', 'textarea', 'a:7:{s:5:"width";s:3:"100";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 8, 0, 0),
(205, 1, 'seodescription', 'SEO描述', '', '', 0, 300, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(206, 2, 'seodescription', 'SEO描述', '', '', 0, 300, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(207, 3, 'seodescription', 'SEO描述', '', '', 0, 200, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(208, 5, 'seodescription', 'SEO描述', '', '', 0, 300, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 9, 0, 0),
(209, 5, 'mopic', '轮播图', '', '', 0, 0, '', '', 'images', 'a:5:{s:15:"upload_allowext";s:20:"gif|jpg|jpeg|png|bmp";s:13:"isselectimage";s:1:"0";s:13:"upload_number";s:1:"5";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 7, 0, 0),
(381, 5, 'seourl', 'seourl', '', 'inputtitle', 1, 80, '', '', 'seourl', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 5, 0, 0),
(689, 2, 'full_content', '内容', '', '', 0, 0, '', '', 'editor', 'a:8:{s:7:"toolbar";s:5:"basic";s:9:"mbtoolbar";s:5:"basic";s:12:"defaultvalue";s:0:"";s:15:"enablesaveimage";s:1:"0";s:6:"height";s:3:"200";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0),
(690, 5, 'spec_description', '产品属性', '', '', 0, 0, '', '', 'editor', 'a:8:{s:7:"toolbar";s:4:"full";s:9:"mbtoolbar";s:4:"full";s:12:"defaultvalue";s:0:"";s:15:"enablesaveimage";s:1:"0";s:6:"height";s:3:"200";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0),
(687, 31, 'isdelay', '是否推迟', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(686, 31, 'seourl', 'seourl', '', 'inputtitle', 1, 80, '', '', 'seourl', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(685, 31, 'seodescription', 'SEO描述', '', '', 0, 300, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(684, 31, 'seokeywords', 'SEO关键字', '', '', 0, 200, '', '', 'keyword', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 4, 0, 0),
(683, 31, 'seotitle', 'SEO标题', '', 'inputtitle', 1, 110, '', '请输入标题', 'title', 'a:2:{s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(682, 31, 'content', '内容', '', '', 1, 999999, '', '内容不能为空', 'editor', 'a:6:{s:7:"toolbar";s:4:"full";s:12:"defaultvalue";s:0:"";s:13:"enablekeylink";s:1:"1";s:10:"replacenum";s:1:"2";s:9:"link_mode";s:1:"0";s:15:"enablesaveimage";s:1:"1";}', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 6, 0, 0),
(681, 31, 'updatetime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d";s:11:"defaulttype";s:1:"0";}', '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 10, 0, 0),
(679, 31, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 3, 0, 0),
(680, 31, 'description', '摘要', '', '', 0, 350, '', '', 'textarea', 'a:7:{s:5:"width";s:2:"98";s:6:"height";s:2:"46";s:12:"defaultvalue";s:0:"";s:10:"enablehtml";s:1:"0";s:9:"fieldtype";s:10:"mediumtext";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 5, 0, 0),
(677, 31, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'a:1:{s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(678, 31, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'a:2:{s:9:"minnumber";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '', '', 1, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(676, 31, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'a:9:{s:4:"size";s:2:"50";s:12:"defaultvalue";s:0:"";s:9:"show_type";s:1:"1";s:14:"upload_maxsize";s:4:"1024";s:15:"upload_allowext";s:20:"jpg|jpeg|gif|png|bmp";s:9:"watermark";s:1:"0";s:13:"isselectimage";s:1:"1";s:12:"images_width";s:0:"";s:13:"images_height";s:0:"";}', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 7, 0, 0),
(675, 31, 'relation', '相关文章', '', '', 0, 255, '', '', 'omnipotent', 'a:4:{s:8:"formtext";s:464:"<input type="hidden" name="info[relation]" id="relation" value="{FIELD_VALUE}" style="50" >\n<ul class="list-dot" id="relation_text">\n</ul>\n<input type="button" value="添加相关" onClick="omnipotent(''selectid'',''{RUL}index.php?g=Content&m=Contentshow&a=public_relationlist&modelid={MODELID}'',''添加相关文章'',1)" class="btn">\n<span class="edit_content">\n  <input type="button" value="显示已有" onClick="show_relation({MODELID},{ID})" class="btn">\n</span>";s:9:"fieldtype";s:7:"varchar";s:12:"backstagefun";s:0:"";s:8:"frontfun";s:0:"";}', '', '', '', 0, 0, 0, 0, 0, 0, 1, 0, 8, 0, 0),
(673, 31, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 1, 12, 0, 0),
(674, 31, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(672, 31, 'inputtime', '真实发布时间', '', '', 0, 0, '', '', 'datetime', 'a:3:{s:9:"fieldtype";s:3:"int";s:6:"format";s:11:"Y-m-d H:i:s";s:11:"defaulttype";s:1:"0";}', '', '', '', 1, 1, 0, 0, 0, 0, 0, 1, 11, 0, 0),
(671, 31, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'a:9:{s:7:"options";s:33:"允许评论|1\r\n不允许评论|0";s:7:"boxtype";s:5:"radio";s:9:"fieldtype";s:7:"tinyint";s:9:"minnumber";s:1:"1";s:5:"width";s:2:"88";s:4:"size";s:0:"";s:12:"defaultvalue";s:1:"1";s:10:"outputtype";s:1:"1";s:10:"filtertype";s:1:"0";}', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0),
(670, 31, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'a:2:{s:4:"size";s:0:"";s:12:"defaultvalue";s:0:"";}', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0),
(667, 31, 'recommend', '推荐', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(668, 31, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(669, 31, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 17, 0, 0),
(666, 31, 'istop', '置顶', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0),
(665, 31, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 15, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_module`
--

CREATE TABLE IF NOT EXISTS `cmf_module` (
  `module` varchar(15) NOT NULL COMMENT '模块',
  `modulename` varchar(20) NOT NULL DEFAULT '' COMMENT '模块名称',
  `sign` varchar(255) NOT NULL DEFAULT '' COMMENT '签名',
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '内置模块',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '版本',
  `setting` mediumtext COMMENT '设置信息',
  `installtime` int(10) NOT NULL DEFAULT '0' COMMENT '安装时间',
  `updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`module`),
  KEY `sign` (`sign`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_module`
--

INSERT INTO `cmf_module` (`module`, `modulename`, `sign`, `iscore`, `disabled`, `version`, `setting`, `installtime`, `updatetime`, `listorder`) VALUES
('Search', '搜索', '2e01dfe1d6be7e454aea66c442639b7e', 0, 1, '1.0.2', 'a:6:{s:7:"modelid";a:5:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"5";i:4;s:2:"31";}s:13:"relationenble";s:1:"1";s:7:"segment";s:1:"0";s:9:"dzsegment";s:1:"0";s:8:"pagesize";s:0:"";s:9:"cachetime";s:0:"";}', 1466567829, 1466567829, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_module_blocks`
--

CREATE TABLE IF NOT EXISTS `cmf_module_blocks` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `show_title` enum('0','1') NOT NULL DEFAULT '1',
  `rsign` varchar(50) NOT NULL,
  `content` longtext,
  `hash` char(40) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `published` enum('0','1') NOT NULL DEFAULT '1',
  `roles` varchar(50) NOT NULL DEFAULT '{guest}',
  `token` varchar(40) NOT NULL DEFAULT '',
  `perpage_show` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_2` (`alias`),
  KEY `rsign` (`rsign`),
  KEY `hash` (`hash`),
  KEY `listorder` (`listorder`),
  KEY `published` (`published`),
  KEY `roles` (`roles`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- 转存表中的数据 `cmf_module_blocks`
--

INSERT INTO `cmf_module_blocks` (`id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show`) VALUES
(1, 'Zckop', 'nav', 'zc_nav', '主菜单', '0', 'nav', '', '_ALL', 2, '1', '{member}{admin}{guest}', '', ''),
(89, 'Zckop', 'certificates_list', 'zc_certificateslist', '证书列表', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=classlist","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"limit":4}}}}', 'd99cdb00bb5af27fcf4feac1c472293c', 8, '1', '{member}{admin}{guest}', '', ''),
(71, 'Zckop', 'article_new-2', 'zc_57e4c3604802e', '文章和faq', '0', 'center', '{"zcmsg":{"edit":{"url":"\\/xinxiangmu\\/index.php?g=Content&m=Contentshow&a=classlist&catid=96","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"argu":{"catid":"96","limit":15,"title_link":"","modelid":"1"},"title":"\\u5c5e\\u6027"}}}', 'ea0da8814469b7335b1519cae99d9e9d', 8, '1', '{guest}', '', ''),
(3, 'Zckop', 'product_category', 'zc_productcategory', '产品分类', '1', 'kopproduct', '{"zcmsg":{"edit":{"url":"\\/thinkcmf\\/index.php?g=Portal&m=AdminTerm&a=index","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":""}}}}', '', 2, '1', '{guest}', '', ''),
(4, 'Zckop', 'show_image', 'zc_showimage', NULL, '0', 'nav', '{"zcmsg":{"edit":{"url":"index.php?g=Admin&m=Setting&a=logo","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"alt":"122345"}}},"width":"100","height":"120","logourl":"data\\/upload\\/20160920\\/57e0a7b8ca3f6.png"}', '_ALL', 1, '1', '{member}{admin}{guest}', '', ''),
(5, 'Zckop', 'custom_html', 'zc_customhtml', '', '0', 'footer', '', '_ALL', 0, '1', '{member}{admin}{guest}', '', ''),
(6, 'Zckop', 'article_list', 'zc_articlelist', '文章列表', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=classlist","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"limit":4}}}}', '4f43378539283a9f6a8157d80dec274c', 2, '1', '{member}{admin}{guest}', '', ''),
(7, 'Zckop', 'product_list', 'zc_productlist', '产品列表', '0', 'right', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=classlist","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"limit":12}}}}', 'a70a161a0b6aa57be31a72003084a481', 1, '1', '{member}{admin}{guest}', '', ''),
(8, 'Zckop', 'download_list', 'zc_downloadlist', '下载列表', '1', 'kopdownload', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=classlist","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"limit":8}}}}', 'ce0ce1d4be005f7b9acb1db81286508a', 1, '1', '{member}{admin}{guest}', '', ''),
(9, 'Zckop', 'show_pro', 'zc_showpro', '产品详情', '0', 'right', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=edit","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}}}', 'f4a3e3ec5fed9262777469de94052015', 0, '1', '{member}{admin}{guest}', '', ''),
(10, 'Zckop', 'show_art', 'zc_showart', '文章详情', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=edit","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}}}', 'f0c22401dbdd8e301f9201228c7bea6d', 0, '1', '{member}{admin}{guest}', '', ''),
(11, 'Zckop', 'show_down', 'zc_showdown', '下载详情', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=edit","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}}}', '46eec81e290ed81b4aca87e6f635c65d', 0, '1', '{member}{admin}{guest}', '', ''),
(12, 'Zckop', 'show_pic', 'zc_showpic', '图片详情', '0', 'left', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=edit","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}}}', '522c5508cdc8080699c95d3bafac4a51', 0, '1', '{member}{admin}{guest}', '', ''),
(13, 'Zckop', 'inquiry', 'zc_inquiry', '询盘列表', '1', 'left', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=classlist","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"limit":2}}}}', '658c7e0b74b870c0d0594ccd1d960a92', 0, '1', '{member}{admin}{guest}', '', ''),
(51, 'Zckop', 'navs', 'zc_navs', '主菜单', '0', 'navs', '', '_ALL', 2, '1', '{member}{admin}{guest}', '', ''),
(15, 'Zckop', 'follow_us', 'zc_followus', '关注我们（社交平台）', '0', 'footer', NULL, '', 0, '1', '{guest}', '', ''),
(16, 'Zckop', 'lunbo', 'zc_lunbo', '轮播图', '0', 'nav', '{"zcmsg":{"edit":{"url":"index.php?g=Admin&m=Setting&a=lunbo&cmbid=16","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}},"image":[{"url":"data\\/upload\\/20160923\\/57e49234d6926.jpg","alt":"banner","tar":"","seq":"0"},{"url":"data\\/upload\\/20160923\\/57e4923f918b0.jpg","alt":"banner","tar":"","seq":"0"},{"url":"data\\/upload\\/20160923\\/57e492465c4d2.jpg","alt":"banner","tar":"","seq":"0"},{"url":"data\\/upload\\/20160923\\/57e4924b8aeac.jpg","alt":"banner","tar":"","seq":"0"}],"yangshi":"2"}', '_ALL', 3, '1', '{member}{admin}{guest}', '', ''),
(17, 'Zckop', 'article_category', 'zc_articlecategory', '文章分类', '1', 'koparticle', '{"zcmsg":{"edit":{"url":"\\/thinkcmf\\/index.php?g=Portal&m=AdminTerm&a=index&modelid=5","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"url":"index.php?g=Portal&m=Zckop&a=aboutus","title":"\\u5c5e\\u6027","argu":{"title_link":"12322","catid":""}}}}', '', 2, '1', '{guest}', '', ''),
(92, 'Zckop', 'product_category-2', 'zc_searchprolistinfo', '搜索页产品分类', '0', 'left', '{"zcmsg":{"edit":{"url":"\\/thinkcmf\\/index.php?g=Portal&m=AdminTerm&a=index","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":""}}}}', 'e53a7b69acfe706da847b99acea9c8e0', 1, '1', '{guest}', '', ''),
(75, 'Zckop', 'shows', 'zc_aboutus', '关于我们', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=pagedit&catid=21","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}}}', '5a6d30de67df52b27ee1a75de80d81c5', 0, '1', '{member}{admin}{guest}', '', ''),
(91, 'Zckop', 'faq_list', 'zc_faqlist', '文章列表', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=classlist","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"limit":4}}}}', '60454915697ad44030c85864432b27ee', 8, '1', '{member}{admin}{guest}', '', ''),
(20, 'Zckop', 'contact_information', 'zc_contactinformation', '联系方式', '1', 'kopqt', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"lianxifangshi2"}}},"strnum":null}', 'ea0da8814469b7335b1519cae99d9e9d', 2, '1', '{guest}', '', ''),
(21, 'Zckop', 'friendly_links', 'zc_friendlylinks', '友情连接', '1', 'kopqt', '{"zcmsg":{"edit":{"url":"\\/index.php?g=Admin&m=Link&a=index","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":null}}}}', 'ea0da8814469b7335b1519cae99d9e9d', 3, '1', '{guest}', '', ''),
(26, 'Zckop', 'show_image', 'zc_showimage2', NULL, '0', 'logo', '{"zcmsg":{"edit":{"url":"index.php?g=Admin&m=Setting&a=logo","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"alt":"122345"}}},"logo":{"big":{"width":"11","height":"11","logourl":"data\\/upload\\/20161027\\/581175d3eef34.jpg"},"small":{"width":"22","height":"22","logourl":"data\\/upload\\/20161027\\/58117500073b2.png"}}}', '_ALL', 3, '1', '{member}{admin}{guest}', '', ''),
(72, 'Zckop', 'lunbo-3', 'zc_indexlunbo3', '轮播图', '0', 'center', '{"zcmsg":{"edit":{"url":"index.php?g=Admin&m=Setting&a=lunbo&cmbid=72","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700}},"image":[{"url":"data\\/upload\\/20160923\\/57e4d53d067cf.jpg","alt":"customer-pic6","tar":null,"seq":"0"},{"url":"data\\/upload\\/20160923\\/57e4bb0b588e5.jpg","alt":"factory-pic2","tar":"","seq":"Hebei XINYU Welding Co., Ltd Welcome you to our factory any time."},{"url":"data\\/upload\\/20160923\\/57e4bb32f0950.jpg","alt":"factory-pic1","tar":"","seq":"Hebei XINYU Welding Co., Ltd Welcome you to our factory any time."},{"url":"data\\/upload\\/20160923\\/57e4bb3c34584.jpg","alt":"factory-pic4","tar":"","seq":"Hebei XINYU Welding Co., Ltd Welcome you to our factory any time."},{"url":"data\\/upload\\/20160923\\/57e4bb441fb08.jpg","alt":"factory-pic3","tar":"","seq":"Hebei XINYU Welding Co., Ltd Welcome you to our factory any time."},{"url":"data\\/upload\\/20160923\\/57e4bb8d13516.jpg","alt":"factory-pic5","tar":"","seq":"Hebei XINYU Welding Co., Ltd Welcome you to our factory any time."}],"yangshi":"2"}', 'ea0da8814469b7335b1519cae99d9e9d', 9, '1', '{member}{admin}{guest}', '', ''),
(90, 'Zckop', 'contactus', 'zc_contactus', '公司介绍', '0', 'center', '', 'ed51394cd37cb03fd5543996054bdb14', 2, '1', '{member}{admin}{guest}', '', ''),
(66, 'Zckop', 'article_hot-2', 'zc_57e4953e0f399', '4热门文章', '0', 'center', '{"zcmsg":{"edit":{"url":"\\/xinxiangmu\\/index.php?g=Content&m=Contentshow&a=classlist&catid=96","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"argu":{"catid":"96","limit":4,"title_link":"","modelid":"1"},"title":"\\u5c5e\\u6027"}}}', 'ea0da8814469b7335b1519cae99d9e9d', 5, '1', '{guest}', '', ''),
(52, 'Zckop', 'show_images', 'zc_showimages', '顶部', '0', 'navs', '{"zcmsg":{"edit":{"url":"index.php?g=Admin&m=Setting&a=logo","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"alt":"122345"}}},"width":"100","height":"120","logourl":"data\\/upload\\/20160920\\/57e0a7b8ca3f6.png"}', '_ALL', 1, '1', '{member}{admin}{guest}', '', ''),
(57, 'Zckop', 'product_category-2', 'zc_prolistinfo', '产品分类', '0', 'left', '{"zcmsg":{"edit":{"url":"\\/thinkcmf\\/index.php?g=Portal&m=AdminTerm&a=index","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":""}}}}', 'a70a161a0b6aa57be31a72003084a481', 1, '1', '{guest}', '', ''),
(61, 'Zckop', 'html', 'zc_57e38522b0678', 'contact us', '0', 'left', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":"            &lt;div class=&quot;left_lx&quot;&gt;\\r\\n                &lt;div class=&quot;left_title&quot;&gt;\\r\\n                    &lt;a href=&quot;http:\\/\\/localhost\\/xinxiangmu\\/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=101&quot; title=&quot;contact us&quot;&gt;&lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/left-title2.jpg&quot; alt=&quot;contact us&quot; title=&quot;contact us&quot; \\/&gt;&lt;\\/a&gt;\\r\\n                &lt;\\/div&gt;\\r\\n                &lt;div class=&quot;left_lx_nr&quot;&gt;\\r\\n                    &lt;ul&gt;\\r\\n                        &lt;li class=&quot;left_bg1&quot;&gt;&lt;a href=&quot;mailto:hbxyhy@163.com&quot; title=&quot;&quot;&gt;hbxyhy@163.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg2&quot;&gt;&lt;a href=&quot;skype:hbxyhy?call&quot; title=&quot;&quot;&gt;hbxyhy&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg3&quot;&gt;+86 317 7807 633&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg4&quot;&gt;+86 317 7722 909&lt;\\/li&gt;\\r\\n                    &lt;\\/ul&gt;\\r\\n                    &lt;div class=&quot;left_an&quot;&gt;\\r\\n                        &lt;a href=&quot;http:\\/\\/localhost\\/xinxiangmu\\/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=101&quot; title=&quot;Online Message&quot;&gt;Online Message&lt;\\/a&gt;\\r\\n                    &lt;\\/div&gt;\\r\\n                &lt;\\/div&gt;\\r\\n            &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        "}}}}', 'a70a161a0b6aa57be31a72003084a481', 2, '1', '{guest}', '', ''),
(59, 'Zckop', 'product_hot', 'zc_57e3551366255', '', '1', 'center', '{"zcmsg":{"edit":{"url":"\\/xinxiangmu\\/index.php?g=Content&m=Contentshow&a=classlist&catid=81%2C91%2C78%2C73%2C77","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"argu":{"catid":"81,91,78,73,77","limit":6,"title_link":"","modelid":"5"},"title":"\\u5c5e\\u6027"}}}', 'ea0da8814469b7335b1519cae99d9e9d', 3, '1', '{guest}', '', ''),
(60, 'Zckop', 'product_category-3', 'zc_prolistcontact', '联系方式', '1', 'left', '{"zcmsg":{"edit":{"url":"\\/thinkcmf\\/index.php?g=Portal&m=AdminTerm&a=index","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":""}}}}', '', 2, '1', '{guest}', '', ''),
(65, 'Zckop', 'html', 'zc_57e488443c878', '', '0', 'center', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":"&lt;div class=&quot;ipart2&quot;&gt;\\r\\n\\t&lt;div class=&quot;zong&quot;&gt;\\r\\n        &lt;div class=&quot;ipart2_left&quot;&gt;\\r\\n        \\t&lt;div class=&quot;ipart2_title&quot;&gt;\\r\\n            \\t&lt;a href=&quot;http:\\/\\/localhost\\/xinxiangmu\\/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=101&quot; title=&quot;Contact Us Now&quot;&gt;&lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/ipart2-title.jpg&quot; alt=&quot;Contact Us Now&quot; title=&quot;Contact Us Now&quot; \\/&gt;&lt;\\/a&gt;\\r\\n            &lt;\\/div&gt;\\r\\n            &lt;div class=&quot;ipart2_hx&quot;&gt;&lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;        \\r\\n        &lt;div class=&quot;ipart2_right&quot;&gt;\\r\\n        \\t&lt;a href=&quot;http:\\/\\/localhost\\/xinxiangmu\\/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=101&quot; title=&quot;Contact Us Now&quot;&gt;Contact Us Now&lt;\\/a&gt;\\r\\n        &lt;\\/div&gt;\\r\\n    \\t&lt;div class=&quot;clear&quot;&gt;&lt;\\/div&gt;\\r\\n    &lt;\\/div&gt;\\r\\n&lt;\\/div&gt;"}}}}', 'ea0da8814469b7335b1519cae99d9e9d', 4, '1', '{guest}', '', ''),
(88, 'Zckop', 'download_new', 'zc_57e8898c0d3a2', '', '1', 'center', '{"zcmsg":{"edit":{"url":"\\/xinxiangmu\\/index.php?g=Content&m=Contentshow&a=classlist&catid=99","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"argu":{"catid":"99","limit":5,"title_link":"","modelid":"2"},"title":"\\u5c5e\\u6027"}}}', 'ea0da8814469b7335b1519cae99d9e9d', 7, '1', '{guest}', '', ''),
(87, 'Zckop', 'photo_new', 'zc_57e8792e4f1ed', '', '0', 'center', '{"zcmsg":{"edit":{"url":"\\/xinxiangmu\\/index.php?g=Content&m=Contentshow&a=classlist&catid=94","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"argu":{"catid":"94","limit":5,"title_link":"","modelid":"3"},"title":"\\u5c5e\\u6027"}}}', 'ea0da8814469b7335b1519cae99d9e9d', 6, '1', '{guest}', '', ''),
(93, 'Zckop', 'html', 'zc_searchcontactus', 'contact us', '0', 'left', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":"          &lt;div class=&quot;left_lx&quot;&gt;\\r\\n                &lt;div class=&quot;left_title&quot;&gt;\\r\\n                    &lt;a href=&quot;http:\\/\\/localhost\\/xinxiangmu\\/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=101&quot; title=&quot;contact us&quot;&gt;&lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/left-title2.jpg&quot; alt=&quot;contact us&quot; title=&quot;contact us&quot; \\/&gt;&lt;\\/a&gt;\\r\\n                &lt;\\/div&gt;\\r\\n                &lt;div class=&quot;left_lx_nr&quot;&gt;\\r\\n                    &lt;ul&gt;\\r\\n                        &lt;li class=&quot;left_bg1&quot;&gt;&lt;a href=&quot;mailto:hbxyhy@163.com&quot; title=&quot;&quot;&gt;hbxyhy@163.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg2&quot;&gt;&lt;a href=&quot;skype:hbxyhy?call&quot; title=&quot;&quot;&gt;hbxyhy&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg3&quot;&gt;+86 317 7807 633&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg4&quot;&gt;+86 317 7722 909&lt;\\/li&gt;\\r\\n                    &lt;\\/ul&gt;\\r\\n                    &lt;div class=&quot;left_an&quot;&gt;\\r\\n                        &lt;a href=&quot;http:\\/\\/localhost\\/xinxiangmu\\/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=101&quot; title=&quot;Online Message&quot;&gt;Online Message&lt;\\/a&gt;\\r\\n                    &lt;\\/div&gt;\\r\\n                &lt;\\/div&gt;\\r\\n            &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n\\r\\n        "}}}}', 'e53a7b69acfe706da847b99acea9c8e0', 3, '1', '{guest}', '', ''),
(94, 'Zckop', 'searchresult', 'zc_searchresult', '搜索结果', '0', 'right', '{"zcmsg":{"edit":{"url":"index.php?g=Content&m=Contentshow&a=pagedit&catid=100","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"url":"index.php?g=Portal&m=Zckop&a=aboutus","title":"\\u5c5e\\u6027","argu":{"catid":"1,2","limit":10,"title_link":"http:\\/\\/www.reanod.com\\/123"}}},"strnum":10}', 'e53a7b69acfe706da847b99acea9c8e0', 1, '1', '{member}{admin}{guest}', '', ''),
(95, 'Zckop', 'product_category-2', 'zc_productcategory4', '产品分类', '0', 'left', '{"zcmsg":{"edit":{"url":"\\/thinkcmf\\/index.php?g=Portal&m=AdminTerm&a=index","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":1000,"height":700},"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":""}}}}', 'f4a3e3ec5fed9262777469de94052015', 1, '1', '{guest}', '', ''),
(96, 'Zckop', 'html', 'zc_57e9cc67bb748', '产品详情页联系我们', '0', 'left', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":"            &lt;div class=&quot;left_lx&quot;&gt;\\r\\n                &lt;div class=&quot;left_title&quot;&gt;\\r\\n                    &lt;a href=&quot;&quot; title=&quot;&quot;&gt;&lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/left-title2.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;&lt;\\/a&gt;\\r\\n                &lt;\\/div&gt;\\r\\n                &lt;div class=&quot;left_lx_nr&quot;&gt;\\r\\n                    &lt;ul&gt;\\r\\n                        &lt;li class=&quot;left_bg1&quot;&gt;&lt;a href=&quot;mailto:hbxyhy@163.com&quot; title=&quot;&quot;&gt;hbxyhy@163.com&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg2&quot;&gt;&lt;a href=&quot;skype:hbxyhy?call&quot; title=&quot;&quot;&gt;hbxyhy&lt;\\/a&gt;&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg3&quot;&gt;+86 317 7807 633&lt;\\/li&gt;\\r\\n                        &lt;li class=&quot;left_bg4&quot;&gt;+86 317 7722 909&lt;\\/li&gt;\\r\\n                    &lt;\\/ul&gt;\\r\\n                    &lt;div class=&quot;left_an&quot;&gt;\\r\\n                        &lt;a href=&quot;&quot; title=&quot;&quot;&gt;Online Message&lt;\\/a&gt;\\r\\n                    &lt;\\/div&gt;\\r\\n                &lt;\\/div&gt;\\r\\n            &lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;"}}}}', 'f4a3e3ec5fed9262777469de94052015', 2, '1', '{guest}', '', ''),
(104, 'Zckop', 'html', 'zc_57eb8c467bfe4', 'customers266', '0', 'center', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":"&lt;div class=&quot;bg&quot;&gt;\\r\\n\\r\\n&lt;div class=&quot;body cus&quot;&gt;\\r\\n    &lt;div class=&quot;cus_pic&quot;&gt;\\r\\n        &lt;div class=&quot;zong&quot;&gt;\\r\\n        \\t&lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic1.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic2.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic3.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic4.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic5.jpg&quot; alt=&quot;&quot; title=&quot;&quot;  class=&quot;cus_piclast&quot; \\/&gt;\\r\\n            \\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic6.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic7.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic8.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic9.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic10.jpg&quot; alt=&quot;&quot; title=&quot;&quot;  class=&quot;cus_piclast&quot; \\/&gt;\\r\\n            \\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic11.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic12.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic13.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic14.jpg&quot; alt=&quot;&quot; title=&quot;&quot; \\/&gt;\\r\\n            &lt;img src=&quot;\\/xinxiangmu\\/themes\\/simplebootx\\/xinyu\\/images\\/customer-pic15.jpg&quot; alt=&quot;&quot; title=&quot;&quot;  class=&quot;cus_piclast&quot; \\/&gt;\\r\\n            \\r\\n        \\t&lt;div class=&quot;clear&quot;&gt;&lt;\\/div&gt;\\r\\n        &lt;\\/div&gt;\\r\\n    &lt;\\/div&gt;\\r\\n    \\r\\n    \\r\\n&lt;\\/div&gt;\\r\\n\\r\\n&lt;\\/div&gt;"}}}}', '0f489cb9d9f320b6ee2b55439145a674', 2, '1', '{guest}', '', ''),
(102, 'Zckop', 'article_new-3', 'zc_57eb88da2aaa0', 'customer_artnew', '0', 'center', '{"zcmsg":{"edit":{"url":"\\/xinxiangmu\\/index.php?g=Content&m=Contentshow&a=classlist&","title":"\\u5185\\u5bb9\\u7f16\\u8f91","width":900,"height":700},"attr":{"argu":{"catid":null,"limit":2,"title_link":"","modelid":"1"},"title":"\\u5c5e\\u6027"}}}', '0f489cb9d9f320b6ee2b55439145a674', 4, '1', '{guest}', '', ''),
(103, 'Zckop', 'html', 'zc_57eb8a9e32edf', 'html_customer_pic', '0', 'center', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":""}}}}', '0f489cb9d9f320b6ee2b55439145a674', 1, '1', '{guest}', '', ''),
(106, 'Zckop', 'html', 'zc_57f8b84648ded', '', '0', 'center', '{"zcmsg":{"attr":{"title":"\\u5c5e\\u6027","argu":{"title_link":"","zchtml":""}}}}', 'ea0da8814469b7335b1519cae99d9e9d', 1, '1', '{guest}', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav`
--

CREATE TABLE IF NOT EXISTS `cmf_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_nav`
--

INSERT INTO `cmf_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', 'home', '', 1, 0, '0-1'),
(2, 1, 0, '列表演示', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 0, '0-2'),
(3, 1, 0, '瀑布流', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 1, 0, '0-3');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_nav_cat`
--

CREATE TABLE IF NOT EXISTS `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `cmf_nav_cat`
--

INSERT INTO `cmf_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_oauth_user`
--

CREATE TABLE IF NOT EXISTS `cmf_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_options`
--

CREATE TABLE IF NOT EXISTS `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_order_refund`
--

CREATE TABLE IF NOT EXISTS `cmf_order_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL COMMENT '订单号',
  `bank` varchar(100) NOT NULL COMMENT '回款银行',
  `refund_time` int(11) NOT NULL COMMENT '回款时间',
  `refund_money` float(10,2) NOT NULL COMMENT '回款金额',
  `cid` int(11) NOT NULL COMMENT '客户ID',
  `addtime` int(11) NOT NULL COMMENT '添加记录时间',
  `remark` text COMMENT '备注',
  `uid` int(11) NOT NULL COMMENT '添加此记录的用户',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-已确认  0-未确认',
  `con_uid` int(11) NOT NULL DEFAULT '0' COMMENT '确认人UID',
  `con_time` int(11) NOT NULL COMMENT '确认时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='回款记录表' AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `cmf_order_refund`
--

INSERT INTO `cmf_order_refund` (`id`, `order_sn`, `bank`, `refund_time`, `refund_money`, `cid`, `addtime`, `remark`, `uid`, `status`, `con_uid`, `con_time`) VALUES
(1, '20160905152138', '中国银行', 1473004800, 100000.00, 24, 1473069743, '第一次回款', 17, 1, 1, 1473132056),
(3, '20160905152138', '农业银行', 1473091200, 3000.00, 24, 1473125396, '第三次回款', 17, 0, 0, 0),
(4, '20160905152138', '人民银行', 1473091200, 5000.00, 24, 1473133426, '最后一次回款', 1, 0, 0, 0),
(6, '20160908094829', '中国银行', 1473264000, 20000.00, 2, 1473299342, '', 21, 1, 15, 1473299744),
(7, '20160908094829', '20', 1473436800, 20.00, 2, 1473469623, '', 1, 0, 0, 0),
(9, '20160905152138', '邯郸银行', 1476720000, 5000.00, 24, 1476773385, '你知道吗', 17, 0, 0, 0),
(10, '20161019114801', '人民银行', 1476806400, 1000.00, 24, 1476849177, '挺快的', 17, 1, 19, 1476849236),
(11, '20161019114801', '工商银行', 1476806400, 5000.00, 24, 1476849278, '第三笔还清', 17, 1, 19, 1476849287),
(12, '20161019114801', '按收入', 1476806400, 100.00, 24, 1476849568, '阿斯蒂芬', 17, 1, 19, 1476849575),
(13, '20161019114801', '农业银行', 1476806400, 400000.00, 24, 1476855021, '余额', 17, 1, 19, 1476855055),
(14, '20160905152138', '大观', 1476806400, 1000.00, 24, 1476863082, '导入', 17, 0, 0, 0),
(15, '20161019162251', '中国', 1476806400, 1000.00, 52, 1476865606, '第一次回款', 17, 1, 19, 1476865661),
(16, '20161019162251', '中国', 1476806400, 1000.00, 52, 1476865606, '第一次回款', 17, 1, 19, 1476865659),
(17, '20161019162251', '外国银行', 1476806400, 3000.00, 52, 1476865684, '打算', 17, 0, 0, 0),
(18, '20161020094434', '人民银行', 1476892800, 300.00, 13, 1476928062, '第一次回款', 17, 0, 0, 0),
(19, '20161018163212', '人民银行', 1477065600, 1000.00, 24, 1477104772, '爱上的人', 17, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_page`
--

CREATE TABLE IF NOT EXISTS `cmf_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '标题',
  `style` varchar(24) NOT NULL DEFAULT '' COMMENT '样式',
  `intro` varchar(40) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text COMMENT '内容',
  `languages` char(20) NOT NULL DEFAULT 'en-us' COMMENT '语言',
  `template` varchar(30) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `thumb` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL COMMENT '相册',
  `seotitle` varchar(200) NOT NULL,
  `seokeywords` varchar(200) NOT NULL,
  `seodescription` varchar(200) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_page`
--

INSERT INTO `cmf_page` (`catid`, `title`, `style`, `intro`, `content`, `languages`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription`) VALUES
(30, '下雨啦33333333', '', '哈啊啊', '<p>下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333</p>', 'en-us', '', 1464059369, '', '', '', '', ''),
(31, 'hello', '', 'well', '<p>哈哈大数据飞洒尽快发辣死了<br/></p>', 'en-us', '', 1464603003, '', '', '', '', ''),
(23, '公司证书', '', 'welll haihaia', '<p><img src="http://localhost/thinkcmf/data/upload/ueditor/20160531/574cf20bf127e.jpg" title="download(1).jpg" alt="download(1).jpg" style="width: 500px;" height="border=&quot;0&quot;" vspace="0" width="500"/>我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书</p>', 'en-us', '', 1464665422, '', '[{"url":"20160531\\/574cec18944e4.jpg","alt":"11"},{"url":"20160531\\/574cec1e1ae5a.png","alt":"22"}]', 'hello Factory', 'hello Factory', '{"des1":"Pin","desc_mo":"Manufacturer China in many factory","des2":"solid","des3":"ying","des4":""}'),
(22, '公司介绍', '', '公司介绍', '<p>这是我们公司最全面的介绍，是最好的了<br/></p>', 'zh-cn', '', 1473733180, '', 'null', '', '', '{"des1":"","desc_mo":"","des2":"","des3":"","des4":""}'),
(25, '联系我们', '', '', '<p>欢迎给我留言。<br/></p>', 'en-us', '', 1464663727, '', '', '', '', ''),
(21, '简介', '', '关于我们', '\r\n\r\n<div class="bg">\r\n<div class="body a">\r\n  <div class="zong">\r\n      \r\n        <div class="a_top">\r\n          <div class="a_nr1">\r\n              <div class="a_tleft">\r\n                  <img src="http://localhost/xinxiangmu/themes/simplebootx/xinyu/images/about-date1.png" alt="" title="">\r\n                </div>\r\n                <div class="a_tright">\r\n                  <div class="a_tnr1">\r\n                        <span class="a_twz1">Dongguang No. 2 Machinery Factory </span>( state owned)\r\n                    </div>\r\n                </div>\r\n                <div class="clear"></div>\r\n            </div>\r\n            <div class="a_nr2">\r\n              <div class="a_tleft">\r\n                  <img src="http://localhost/xinxiangmu/themes/simplebootx/xinyu/images/about-date2.png" alt="" title="">\r\n                </div>\r\n                <div class="a_tright">\r\n                  <div class="a_tnr2">\r\n                        <span class="a_twz1">DONGGANG Welding Materials Co.,Ltd, </span>\r\n                        which was founded by Hebei University of Technology and Hongkong Community Service Center,mainly produces High antirust CO2 gas-shield welding wire, Submerged arc welding wire, Stainless steel welding wire &amp; Flux-cored welding wire.\r\n                    </div>\r\n                </div>\r\n                <div class="clear"></div>\r\n            </div>\r\n            <div class="a_nr3">\r\n              <div class="a_tleft">\r\n                  <img src="http://localhost/xinxiangmu/themes/simplebootx/xinyu/images/about-date3.png" alt="" title="">\r\n                </div>\r\n                <div class="a_tright">\r\n                  <div class="a_tnr3">\r\n                        <span class="a_twz1">Hebei XINYU Welding Co., Ltd, </span>\r\n                        which mainly produces \r\n                        <span>high strength steel welding wire,  Non-copper-coated solid wire,  submerged arc &amp; stainless steel welding wire . </span>\r\n                        Our products are widely applied to the welding of low-alloy high tensile large &amp; key steel structures in coal machinery, construction machinery, petrochemical machinery, pressure vessels or tanks, oil &amp; gas pipelines, military industry, shipbuilding, bridge and high-rise buildings etc.\r\n                        <span>At the same time,we are the only interprise in the domestic which produces welding wire as well as welding wire equipment.</span>\r\n                    </div>\r\n                </div>\r\n                <div class="clear"></div>\r\n            </div>\r\n\r\n            <div class="clear"></div>\r\n        </div>\r\n        <div class="a_center">\r\n          <div class="bottom30">\r\n             All our products have passed <span>ISO 9001-2008 quality system certification and CE certification </span>because of our advanced production lines, top professional testing equipment, intelligent R&amp;D team and scientific management system. Meanwhile, we get 7 invention patents including a national one. We are a member of China Mechanical Engineering Association and China Welding Association. Other honors are “ Consumer Trusting Products in Hebei province” “ Famous Brand products in Hebei province” “ Good Credit Enterprise in Hebei Province” and “China Key &amp;Leading Enterprise in high tensile steel welding wire”.\r\n            </div>\r\n            <div class="bottom30">Our <span> Welding wires and welding wire equipment </span>are exported to USA, Italy, Brazil, Russia and India etc.</div>\r\n            <div>Welcome you to our factory any time.</div>\r\n        </div>\r\n        \r\n        <div class="a_pic">\r\n          <img src="http://localhost/xinxiangmu/themes/simplebootx/xinyu/images/about-pic1.jpg" alt="" title="">\r\n        </div>\r\n    \r\n    </div>\r\n</div>\r\n</div>\r\n', 'en-us', '', 1474619924, '', 'null', 'hello Factory', 'hello Factory', '{"des1":"Pin","desc_mo":"","des2":"solid","des3":"","des4":""}'),
(102, 'hello', '', 'welll haihaia', '<p>ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddhaaaaaaaaaaaaaaaaaaaafgfgf222<br/></p>', 'en-us', '', 1475054364, '', 'null', 'Export hello', 'hello Price', '{"des1":"","desc_mo":"","des2":"","des3":"","des4":""}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_partner`
--

CREATE TABLE IF NOT EXISTS `cmf_partner` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `partner_url` varchar(255) NOT NULL COMMENT '合作伙伴链接',
  `languages` char(20) NOT NULL DEFAULT 'en-us' COMMENT '语言',
  `partner_name` varchar(255) NOT NULL COMMENT '合作伙伴名称',
  `partner_image` varchar(255) DEFAULT NULL COMMENT '合作伙伴图标',
  `partner_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '合作伙伴打开方式',
  `partner_description` text NOT NULL COMMENT '合作伙伴描述',
  `partner_time` datetime DEFAULT NULL COMMENT '合作伙伴添加时间',
  `partner_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `partner_rating` int(11) NOT NULL DEFAULT '0' COMMENT '合作伙伴评级',
  `partner_rel` varchar(255) DEFAULT NULL COMMENT '合作伙伴与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `partner_visible` (`partner_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `cmf_partner`
--

INSERT INTO `cmf_partner` (`id`, `partner_url`, `languages`, `partner_name`, `partner_image`, `partner_target`, `partner_description`, `partner_time`, `partner_status`, `partner_rating`, `partner_rel`, `listorder`) VALUES
(3, 'http://www.oschina.net/', 'en-us', '开源中国', 'http://static.oschina.net/uploads/space/2013/0304/160442_8Fw6_179699.png', '_blank', '', '2016-08-22 17:53:48', 1, 0, NULL, 1),
(4, 'http://36kr.com/', 'en-us', '36Kr', 'http://sta.36krcnd.com/36krhome-dev/images/qr.png', '_blank', '这是一个测试', '2016-08-22 17:56:16', 1, 0, NULL, 2);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_photo`
--

CREATE TABLE IF NOT EXISTS `cmf_photo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `url` char(100) NOT NULL DEFAULT '',
  `moveurl` char(100) NOT NULL COMMENT '动态url地址',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `istop` tinyint(2) NOT NULL COMMENT '置顶 0否1是',
  `recommend` tinyint(2) NOT NULL COMMENT '推荐 0否1是',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  `prefix` varchar(255) NOT NULL DEFAULT '',
  `seotitle` mediumtext,
  `seokeywords` mediumtext,
  `seodescription` mediumtext,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `cmf_photo`
--

INSERT INTO `cmf_photo` (`id`, `catid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `prefix`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay`, `is_del`) VALUES
(4, 94, 'certificate5', '', 'data/upload/20160923/57e4f1934b662.jpg', '', '', '', 'http://localhost/xinxiangmu/certificates/4-4.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pic&catid=94&id=4', 0, 99, 1, 0, 1, 0, 'admin', 1474616577, 1474616577, 0, 0, 0, 0, 0, 0, '', 'China certificate', 'certificate  Manufacturer', NULL, '4', 0, 0),
(5, 94, 'certificate4', '', 'data/upload/20160923/57e4f1b3d6c51.jpg', '', '', '', 'http://localhost/xinxiangmu/certificates/5-5.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pic&catid=94&id=5', 0, 99, 0, 0, 1, 0, 'admin', 1474621880, 1474621880, 0, 0, 0, 0, 0, 0, '', 'China certificate4', 'certificate4 Wholesaler', NULL, '5', 0, 0),
(6, 94, 'certificate3', '', 'data/upload/20160923/57e4f1c63e31c.jpg', '', '', '', 'http://localhost/xinxiangmu/certificates/6-6.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pic&catid=94&id=6', 0, 99, 1, 0, 1, 0, 'admin', 1474621896, 1474621896, 0, 0, 0, 0, 0, 0, '', 'certificate3 Supplier China', 'certificate3 Supplier China', NULL, '6', 0, 0),
(7, 94, 'certificate2', '', 'data/upload/20160923/57e4f1d569600.jpg', '', '', '', 'http://localhost/xinxiangmu/certificates/7-7.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pic&catid=94&id=7', 0, 99, 1, 0, 1, 0, 'admin', 1474621911, 1474621911, 0, 0, 0, 0, 0, 0, '', 'Custom certificate2', 'ODM certificate2', NULL, '7', 0, 0),
(8, 94, 'certificate1', '', 'data/upload/20160923/57e4f1e34d7e2.jpg', '', '', '', 'http://localhost/xinxiangmu/certificates/8-8.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pic&catid=94&id=8', 0, 99, 1, 0, 1, 0, 'admin', 1474621926, 1474621926, 0, 0, 0, 0, 0, 0, '', 'certificate1 Price', 'Sale certificate1', NULL, '8', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_photo_data`
--

CREATE TABLE IF NOT EXISTS `cmf_photo_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `imgs` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_photo_data`
--

INSERT INTO `cmf_photo_data` (`id`, `template`, `paytype`, `allow_comment`, `relation`, `imgs`) VALUES
(1, '', 0, 1, '', '1'),
(2, '', 0, 1, '', '[]'),
(3, '', 0, 1, '', '[{"url":"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d4bd3c8ef7.jpg","alt":"11"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d4bd950a6a.png","alt":"22"}]'),
(4, '', 0, 1, '', '[]'),
(5, '', 0, 1, '', '[]'),
(6, '', 0, 1, '', '[]'),
(7, '', 0, 1, '', '[]'),
(8, '', 0, 1, '', '[]');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_platform`
--

CREATE TABLE IF NOT EXISTS `cmf_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '平台名称',
  `platform_url` varchar(255) DEFAULT NULL COMMENT '平台网址',
  `register_url` varchar(255) DEFAULT NULL COMMENT '注册网址',
  `login_url` varchar(255) DEFAULT NULL COMMENT '登录网址',
  `post_url` varchar(255) DEFAULT NULL COMMENT '产品添加网址',
  `usable` varchar(255) DEFAULT NULL COMMENT '是否停用：1：正常；0：停用。',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID` (`id`) COMMENT 'ID索引'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_plugins`
--

CREATE TABLE IF NOT EXISTS `cmf_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_position`
--

CREATE TABLE IF NOT EXISTS `cmf_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `modelid` char(30) NOT NULL DEFAULT '' COMMENT '模型id',
  `catid` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '推荐位名称',
  `maxnum` smallint(5) NOT NULL DEFAULT '20' COMMENT '最大存储数据量',
  `extention` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_position`
--

INSERT INTO `cmf_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder`) VALUES
(1, '0', '0', '首页幻灯片', 10, '', 0),
(2, '0', '0', '首页文字头条', 10, '', 0),
(3, '0', '0', '首页站长推荐', 10, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_posts`
--

CREATE TABLE IF NOT EXISTS `cmf_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_posts`
--

INSERT INTO `cmf_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(1, 1, '', '', '2016-05-13 16:15:31', '<p>我是全部<strong>内容</strong></p>', '我是新加的2', '我是摘要', 1, 1, '2016-05-13 16:15:03', '', 0, 0, '', 0, '{"thumb":"","photo":[{"url":"20160531\\/574cf2c100801.jpg","alt":"11"},{"url":"20160531\\/574cf2c67d743.png","alt":"22"}]}', 6, 1, 0, 0),
(2, 1, 'about us', '', '2016-05-23 15:05:41', '<p>about usabout usabout usabout usabout us</p>', 'about us', 'about us', 1, 1, '2016-05-23 15:05:08', '', 0, 2, '', 0, '{"template":"page","thumb":""}', 0, 0, 0, 0),
(3, 1, 'China Grinding Balls, Grinding Steel Balls Manufacturer', '', '2016-08-08 17:01:32', '<p>Other factors effect&nbsp;grinding balls&nbsp;are as followings:</p><p>Molybdenum (Mo):&nbsp;Molybdenum’s role is matrix refinement. It can refine carbide, improve the electrode potential of matrix and balls corrosion resistance. In the metal casting conditions, adding a small amount can take effect, it mainly used for special grinding ball.</p><p>Sulfur (S):&nbsp;Due to the high content of manganese in steel, large amount of MnS generated and discharged from the slag. But because it is melted in basic slag, the sulfur can be successfully reduced to 0.03%. Such a low sulfur content will not significantly affected the steel strength, toughness and wear resistance.</p><p>Phosphorus (P):&nbsp;Phosphorus rarely dissolved in the steel separately, it often reduces the steel strength, toughness and wear resistance as Fe2p, Fe3P form on grain boundaries. High content carbon increase phosphorus precipitation in form of eutectic crystal. In order to guarantee grinding media balls performance, it should follow the below relationship: C% = 11.27-2.761 × P%. Make sure the phosphorus content ≤0.08% in production, and important, complex and thick pieces≤0.07%.</p><p>Silicon(SI):&nbsp;Silicon is an important element for grinding ball, it is not only effectively reduce the chilling tendency and increase the amount of ferrite, but also refine eutectic and enhance ball roundness. However, silicon also improve brittle transition temperature of cast iron, thus reduce the impact toughness. Therefore, the silicon content should not be too high, especially for situation that the cast iron manganese and phosphorus content is higher.</p><p><br/></p>', 'Which factors effect grinding ball?', 'Other factors effect grinding balls are as followings', 1, 1, '2016-08-08 16:58:44', NULL, 0, NULL, '', 0, '{"thumb":"http:\\/\\/www.huaminsteelball.com\\/fckeditor\\/php\\/upload\\/42761470368925.jpg","photo":[{"url":"http:\\/\\/www.huaminsteelball.com\\/fckeditor\\/php\\/upload\\/42761470368925.jpg","alt":""}]}', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_product`
--

CREATE TABLE IF NOT EXISTS `cmf_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(24) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `url` varchar(255) NOT NULL DEFAULT '',
  `moveurl` varchar(255) NOT NULL COMMENT '动态url地址',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `istop` tinyint(2) NOT NULL COMMENT '置顶 0否1是',
  `recommend` tinyint(2) NOT NULL COMMENT '推荐 0否1是',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL DEFAULT '',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击总数',
  `yesterdayviews` int(11) NOT NULL DEFAULT '0' COMMENT '最日',
  `dayviews` int(10) NOT NULL DEFAULT '0' COMMENT '今日点击数',
  `weekviews` int(10) NOT NULL DEFAULT '0' COMMENT '本周访问数',
  `monthviews` int(10) NOT NULL DEFAULT '0' COMMENT '本月访问',
  `viewsupdatetime` int(10) NOT NULL DEFAULT '0' COMMENT '点击数更新时间',
  `price` varchar(7) NOT NULL DEFAULT '',
  `size` varchar(50) NOT NULL DEFAULT '',
  `seotitle` mediumtext,
  `seokeywords` mediumtext,
  `seodescription` mediumtext,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟 0-不推迟 1-推迟',
  `is_del` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- 转存表中的数据 `cmf_product`
--

INSERT INTO `cmf_product` (`id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay`, `is_del`) VALUES
(72, 54, 0, 'asfcs"asfbs', '', '/thinkcmf/data/upload/20160816/57b2b928b6e87.jpg', '', '', 'asfda', 'http://local.thinkcmf.cn/index.php?g=Content&m=Pagedis&a=show_pro&catid=54&id=72', 'http://local.thinkcmf.cn/index.php?g=Content&m=Pagedis&a=show_pro&catid=54&id=72', 0, 99, 1, 1, 1, 0, 'admin', 1471330644, 1472227200, 0, 0, 0, 0, 0, 0, '25', 'asd', 'asfcdsdcf', 'asfcs&quot;asfbs Company', '', 'asefca', 0, 0),
(74, 73, 0, 'seourl', '', '', '', '', '', 'http://localhost/xinxiangmu/zwcpe/seourl-74.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=74', 0, 99, 0, 0, 1, 0, 'admin', 1471416869, 1471416869, 0, 0, 0, 0, 0, 0, '144', '', 'seourl Company', 'ODM seourl', '', 'seourl', 0, 1),
(75, 73, 0, 'titltr', '', '', '', '', '', 'http://localhost/xinxiangmu/zwcpe/seourlll-75.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=75', 0, 99, 0, 0, 1, 0, 'admin', 1471418393, 1471418393, 0, 0, 0, 0, 0, 0, '222', '', 'titltr  Manufacturer', 'titltr  Manufacturer', '', 'seourlll', 0, 1),
(76, 73, 0, 'ceshiseourl', '', 'http://local.thinkcmf.cn/data/upload/ueditor/20160818/57b571c18da67.png', '', '', '', 'http://localhost/xinxiangmu/zwcpe/soso91199-76.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=76', 0, 99, 0, 0, 1, 0, 'admin', 1471418655, 1471418655, 0, 0, 0, 0, 0, 0, '12', '11', 'ceshiseourl Supplier', 'rebar coupler', '', 'soso91199', 0, 1),
(77, 73, 0, '美美哒', '', '', '', '', '', 'http://localhost/xinxiangmu/zwcpe/77-77.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=77', 0, 99, 0, 0, 1, 0, 'admin', 1471499383, 1471499383, 0, 0, 0, 0, 0, 0, '', '', 'rebar coupler', ' Price', NULL, '77', 0, 0),
(78, 73, 0, '美美哒', '', '', '', '', '', 'http://localhost/xinxiangmu/zwcpe/78-78.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=78', 0, 99, 0, 0, 1, 0, 'admin', 1471499433, 1471499433, 0, 0, 0, 0, 0, 0, '', '', '美美哒 Wholesaler', '美美哒 for Sale', NULL, '78', 0, 1),
(79, 73, 0, '就一个', '', '', '', '', '', 'http://localhost/xinxiangmu/zwcpe/79-79.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=79', 0, 99, 0, 0, 1, 0, 'admin', 1471500631, 1471500631, 0, 0, 0, 0, 0, 0, '', '', '', '', NULL, '79', 0, 1),
(80, 73, 0, 'trety', '', '', '', '', '', 'http://localhost/xinxiangmu/zwcpe/erter-80.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=80', 0, 99, 0, 0, 1, 0, 'admin', 1471500767, 1471500767, 0, 0, 0, 0, 0, 0, 'xb', '', 'trety Wholesale', 'ODM trety', NULL, 'erter', 0, 0),
(81, 78, 0, 'one one oen', '', '', '', '', '', 'http://localhost/xinxiangmu/sold/one-81.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=81', 0, 99, 0, 0, 1, 0, 'admin', 1471567819, 1471567819, 0, 0, 0, 0, 0, 0, '', '', 'one one oen Factory', 'one one oen Wholesale', NULL, 'one', 0, 0),
(82, 73, 0, '小碗儿', '', '', '', '', '小碗儿', 'http://localhost/xinxiangmu/zwcpe/xiao-82.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=82', 0, 99, 0, 0, 1, 0, 'admin', 1471568645, 1471568645, 0, 0, 0, 0, 0, 0, '10', '1', 'rebar coupler', '小碗儿 Supplier', NULL, 'xiao', 0, 0),
(83, 73, 0, '钻石', '', '', '', '', '钻石', 'http://localhost/xinxiangmu/zwcpe/zuanshi-83.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=83', 0, 99, 0, 0, 1, 0, 'admin', 1471573159, 1471573159, 0, 0, 0, 0, 0, 0, '60', '1', '钻石 Factory', '钻石 Manufacturer China', NULL, 'zuanshi', 0, 0),
(84, 73, 0, '水杯', '', '', '', '', '水杯', 'http://localhost/xinxiangmu/zwcpe/shuibei-84.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=84', 0, 99, 0, 0, 1, 0, 'admin', 1471573714, 1471573714, 0, 0, 0, 0, 0, 0, '15', '', 'Manufacture 水杯', '水杯', NULL, 'shuibei', 0, 0),
(87, 73, 0, '烟酒', '', '', '', '', '烟酒', 'http://localhost/xinxiangmu/zwcpe/yanjiu-87.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=87', 0, 99, 1, 0, 1, 0, 'admin', 1471581865, 1471581865, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, 'yanjiu', 0, 0),
(88, 78, 0, '烟酒copy', '', '', '', '', '烟酒', 'http://localhost/xinxiangmu/sold/88-88.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=88', 0, 99, 1, 0, 1, 0, 'admin', 1471589352, 1471589352, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, '88', 0, 0),
(90, 73, 0, '1223coo', '', '', '', '', '烟酒', 'http://localhost/xinxiangmu/zwcpe/90-90.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=73&id=90', 0, 99, 1, 0, 1, 0, 'admin', 1472179337, 1472179337, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, '90', 0, 0),
(91, 78, 0, '烟酒 intro', '', '', '', '', '烟酒', 'http://localhost/xinxiangmu/sold/91-91.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=91', 0, 99, 0, 0, 1, 0, 'admin', 1472179531, 1472179531, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, '91', 0, 0),
(92, 78, 0, 'asdf', '', '', '', '', '烟酒', 'http://localhost/xinxiangmu/sold/asdf-92.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=92', 0, 99, 1, 0, 1, 0, 'admin', 1472179723, 1472179723, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, 'asdf', 0, 0),
(93, 78, 0, '烟酒coo11', '', '', '', '', '烟酒', 'http://localhost/xinxiangmu/sold/93-93.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=93', 0, 99, 1, 0, 1, 0, 'admin', 1472180347, 1472180347, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, '93', 0, 0),
(94, 78, 0, '烟酒coo22', '', 'data/upload/20160930/57edb99c41f9c.jpg', '', '', '烟酒', 'http://localhost/xinxiangmu/sold/94-94.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=94', 0, 99, 0, 1, 1, 0, 'admin', 1472180347, 1472180347, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, '94', 0, 0),
(95, 78, 0, '烟酒coo55', '', 'data/upload/20161010/57fb5b55d135e.jpg', '', '', '烟酒', 'http://localhost/xinxiangmu/sold/11-95.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=78&id=95', 0, 99, 0, 1, 1, 0, 'admin', 1472180533, 1472180533, 0, 0, 0, 0, 0, 0, '11', '1', '烟酒 Supplier China', '烟酒 Manufacturer China', NULL, '11', 0, 0),
(98, 81, 0, 'product 1', '', 'data/upload/20160922/57e36c582973d.jpg', '', '', 'new product 1', 'http://localhost/xinxiangmu/morenshengchengjingtai/98.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=81&id=98', 0, 99, 1, 1, 1, 0, 'admin', 1474522205, 1474522205, 0, 0, 0, 0, 0, 0, '100', '1', 'rebar coupler', 'product 1 Exporter China', NULL, '', 0, 0),
(99, 81, 0, 'product2', '', 'data/upload/20160924/57e5cee769cd6.jpg', '', '', 'new product 2', 'http://localhost/xinxiangmu/morenshengchengjingtai/productrr-99.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=81&id=99', 0, 99, 1, 1, 1, 0, 'admin', 1474522761, 1474522761, 0, 0, 0, 0, 0, 0, '101', '2', 'Manufacture product2', 'China product2', NULL, 'productrr', 0, 0),
(100, 77, 0, 'Co2 wire product', '', 'data/upload/20160922/57e36f2d99d8f.jpg', '', '', 'Co2 wire product', 'http://localhost/xinxiangmu/world/100-100.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=77&id=100', 0, 99, 1, 1, 1, 0, 'admin', 1474522928, 1474522928, 0, 0, 0, 0, 0, 0, '103', '1', '', 'Co2 wire product Supplier', NULL, '100', 0, 0),
(101, 77, 0, 'Co2 wire product 2', '', 'data/upload/20160922/57e37d45ec7c1.jpg', '', '', '', 'http://localhost/xinxiangmu/world/101-101.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=77&id=101', 0, 99, 1, 1, 1, 0, 'admin', 1474526538, 1474526538, 0, 0, 0, 0, 0, 0, '103', '1', 'Co2 wire product 2 Exporter China', 'High Quality Co2 wire product 2', NULL, '101', 0, 0),
(102, 97, 0, '测试展开', '', 'data/upload/20160928/57eb2c8f6bd22.png', '', '', '', 'http://localhost/xinxiangmu/child1/102-102.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=97&id=102', 0, 99, 0, 1, 1, 0, 'admin', 1475030166, 1475030166, 0, 0, 0, 0, 0, 0, '200', '2', 'High Quality 测试展开', '测试展开 Factory China', NULL, '102', 0, 0),
(103, 81, 0, 'aaa', '', 'data/upload/20160924/57e5cee769cd6.jpg', '', '', 'new product 2', 'http://localhost/xinxiangmu/morenshengchengjingtai/aaa-103.html', 'http://localhost/xinxiangmu/index.php?g=Content&m=Pagedis&a=shows_pro&catid=81&id=103', 0, 99, 1, 1, 1, 0, 'admin', 1477376458, 1477376458, 0, 0, 0, 0, 0, 0, '101', '2', 'Manufacture product2', 'China product2', NULL, 'aaa', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_product_data`
--

CREATE TABLE IF NOT EXISTS `cmf_product_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `mopic` text,
  `spec_description` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_product_data`
--

INSERT INTO `cmf_product_data` (`id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic`, `spec_description`) VALUES
(72, '<p>asgvsgvrwehyofgv</p>', 0, 0, '', 0, 1, '|5,70|5,70|5,70|5,70|5,70', '[{"url":"\\/thinkcmf\\/data\\/upload\\/20160816\\/57b2b8ca819d4.jpg","alt":"banner2_1"}]', NULL),
(73, '<p>asfc<img src="http://192.168.0.68/thinkcmf/data/upload/ueditor/20160816/57b2ba6fba055.jpg" title="aad&quot;asdfwae" alt="aad&quot;asdfwae" width="1680" height="450" border="0" vspace="0" style="width: 1680px; height: 450px;"/></p>', 0, 0, '', 0, 1, '', '[{"url":"data\\/upload\\/20160825\\/57bea4f0ef4eb.jpg","alt":"\\u6700\\u65b0\\u52a0\\u7684","seq":"0"}]', NULL),
(2, '<p>大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子</p>', 0, 0, '', 0, 1, '|5,45|5,44|5,46|5,45|5,44', '[]', NULL),
(3, '<p>小扳手小扳手小扳手小扳手小扳手小扳手小扳手小扳手小扳手</p>', 0, 0, '', 0, 1, '8|5,7|5,6', '[]', NULL),
(4, '<p>高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发111</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(5, '<p>made inChinamade inChinamade inChinamade inChinamade inChinamade inChinamade inChina<img alt="201103054683425.jpg" src="http://localhost/thinkcmf/data/upload/ueditor/20160606/57550e22e99d6.jpg" title="201103054683425.jpg"/></p>', 0, 0, '', 0, 1, '5|5,4|5,2', '[{"url":"\\/thinkcmf\\/data\\/upload\\/20160530\\/574bf2d1db8b0.jpg","alt":"11"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160530\\/574bf2d86bd16.png","alt":"22"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160602\\/574f8ce15c39d.png","alt":"cli_1000px"}]', NULL),
(8, '<p>We can supply all kinds of pliers, you can order as you want. Welcome to our company.We can supply all kinds of pliers, you can order as you want. Welcome to our company.</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160825\\/thumb_105_64_57be86e21cdc9.jpg","alt":"inews-pic1","seq":"0"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160825\\/57be86e21cdc9.jpg","alt":"news-pic1","seq":"0"}]', NULL),
(30, '<p>这是测试这是测试</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(49, '', 0, 0, '', 0, 1, '', '[]', NULL),
(45, '', 0, 0, '', 0, 1, '', '[]', NULL),
(46, '', 0, 0, '', 0, 1, '', '[]', NULL),
(66, '<p>这是产品描述</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(51, '<p>23123123123</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(52, '<p><a href="http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=8" target="_blank">小钳子</a></p>', 0, 0, '', 0, 1, '', '[{"url":"\\/thinkcmf\\/data\\/upload\\/20160615\\/57611fee0f3f0.jpg","alt":"20160422103406754"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160615\\/57611fee4ffe0.jpg","alt":"20160422103445553"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160615\\/57611fee7db21.jpg","alt":"20160422103455720"}]', NULL),
(57, '<p>产品描述</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(74, '<p>sdfsdr</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(75, '<p>asdf<br/></p>', 0, 0, '', 0, 1, '', '[]', NULL),
(76, '<p><img src="http://local.thinkcmf.cn/data/upload/ueditor/20160819/57b6604e2e062.png" style="" title="ceshiseourl_1471569998.png"/></p><p><img src="http://local.thinkcmf.cn/data/upload/ueditor/20160819/57b6604e378bc.png" style="" title="ceshiseourl_1471569998.png"/></p><p><br/></p>', 0, 0, '', 0, 1, '', '[{"url":"\\/thinkcmf\\/data\\/upload\\/20160825\\/57be69f488423.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":null},{"url":"\\/thinkcmf\\/data\\/upload\\/20160824\\/57bcf10fac4c7.png","alt":"\\u8fd9\\u662f\\u554a\\u554a","seq":"0"}]', NULL),
(0, '<p>烟酒</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160819\\/thumb_448_303_57b68ea38e23b.jpg","alt":"0","seq":"2"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b68ea3a2673.jpg","alt":"1","seq":"7"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b68ea3b245b.jpg","alt":"2","seq":"1"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b68ea3c168b.jpg","alt":"3","seq":"4"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b68ea3d1473.jpg","alt":"4","seq":"5"}]', NULL),
(77, NULL, 0, 0, '', 0, 1, '', '[]', NULL),
(78, NULL, 0, 0, '', 0, 1, '', '[]', NULL),
(79, NULL, 0, 0, '', 0, 1, '', '[]', NULL),
(80, NULL, 0, 0, '', 0, 1, '', '[]', NULL),
(81, NULL, 0, 0, '', 0, 1, '', '[]', NULL),
(82, '<p>小碗儿</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160819\\/thumb_369_369_57b659ce05aa3.png","alt":"\\u652f\\u6301\\u5fae\\u4fe1\\u626b\\u4e00\\u626b"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b65b3f0f6e3.png","alt":"\\u652f\\u6301\\u5fae\\u4fe1\\u626b\\u4e00\\u626b"}]', NULL),
(83, '<p>钻石</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160823\\/thumb_280_280_57b66b2da2e43.png","alt":"\\u652f\\u6301\\u5fae\\u4fe1\\u626b\\u4e00\\u626b","seq":"2"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b66b36eae9b.png","alt":"\\u652f\\u6301\\u5fae\\u4fe1\\u626b\\u4e00\\u626b","seq":"4"}]', NULL),
(84, '<p>水杯</p>', 0, 0, '', 0, 1, '', '[{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b66ec1d9943.jpg","alt":"chanpin","seq":"1"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b66ec20200b.jpg","alt":"chanpin2","seq":"3"},{"url":"\\/thinkcmf\\/data\\/upload\\/20160819\\/57b66ec20b863.jpg","alt":"chanpin3","seq":"5"}]', NULL),
(87, '<p>烟酒aaaaasdfgasdf</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160826\\/thumb_312_196_57bfa6573cfc8.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160826\\/thumb_316_179_57bfa683d6ee1.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160825\\/thumb_489_356_57b6b0b55485b.jpg","alt":"iabout-pic","seq":"1"}]', NULL),
(90, '<p>烟酒aaaaasdfgasdf</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160826\\/thumb_312_196_57bfa6573cfc8.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160826\\/thumb_316_179_57bfa683d6ee1.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160825\\/thumb_489_356_57b6b0b55485b.jpg","alt":"iabout-pic","seq":"1"}]', NULL),
(92, '<p>烟酒aaaaasdfgasdf</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160826\\/thumb_312_196_57bfa6573cfc8.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160826\\/thumb_316_179_57bfa683d6ee1.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160825\\/thumb_489_356_57b6b0b55485b.jpg","alt":"iabout-pic","seq":"1"}]', NULL),
(93, '<p>烟酒aaaaasdfgasdf</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160826\\/thumb_312_196_57bfa6573cfc8.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160826\\/thumb_316_179_57bfa683d6ee1.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160825\\/thumb_489_356_57b6b0b55485b.jpg","alt":"iabout-pic","seq":"1"}]', NULL),
(94, '<p>烟酒aaaaasdfgasdf</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160826\\/thumb_312_196_57bfa6573cfc8.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160826\\/thumb_316_179_57bfa683d6ee1.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160825\\/thumb_489_356_57b6b0b55485b.jpg","alt":"iabout-pic","seq":"1"}]', NULL),
(95, '<p>烟酒aaaaasdfgasdf</p>', 0, 0, '', 0, 1, '', '[{"url":".\\/data\\/upload\\/20160826\\/thumb_312_196_57bfa6573cfc8.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160826\\/thumb_316_179_57bfa683d6ee1.jpg","alt":"\\u8ba2\\u9605\\u53f7","seq":"0"},{"url":".\\/data\\/upload\\/20160825\\/thumb_489_356_57b6b0b55485b.jpg","alt":"iabout-pic","seq":"1"}]', NULL),
(98, '<p>this is a new product<br/></p>', 0, 0, '', 0, 1, '', '[]', NULL),
(99, '<p><span style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 30px;">This product is the general MAG / CO2 welding wire and suitable for all-position welding</span></p>', 0, 0, '', 0, 1, '', '[{"url":"data\\/upload\\/20160927\\/57e9e1e86dbdc.jpg","alt":"ipart3-04","seq":"0"},{"url":"data\\/upload\\/20160927\\/57e9d0cfbfe81.jpg","alt":"factory-pic1","seq":"1"},{"url":"data\\/upload\\/20160927\\/57e9d0cfea958.jpg","alt":"ipart3-pic1","seq":"2"},{"url":"data\\/upload\\/20160927\\/57e9d0d010916.jpg","alt":"ipart3-pic2","seq":"3"}]', '<table class="p2_table" cellspacing="0"><tbody><tr class="p2_kuan1"><td class="p2_kuan1">Specification:</td><td class="p2_kuan2">ISO</td><td class="p2_kuan3">G42 4 M21 3Si1</td></tr><tr class="p2_kuan1"><td class="p2_kuan1"><br/></td><td class="p2_kuan2">AWS</td><td class="p2_kuan3">ER70S-6</td></tr><tr class="p2_kuan1"><td class="p2_kuan1"><br/></td><td class="p2_kuan2">GB</td><td class="p2_kuan3">ER50-6</td></tr><tr class="p2_kuan1"><td class="p2_kuan1">Shieding Gas:</td><td colspan="2">C02</td></tr></tbody></table>'),
(100, '<p>this is Co2 wire product</p>', 0, 0, '', 0, 1, '', '[]', NULL),
(101, '<p>看看是否有</p>', 0, 0, '', 0, 1, '', '[{"url":"data\\/upload\\/20161008\\/57f8b1a5c5826.jpg","alt":"ipart3-01","seq":"0"},{"url":"data\\/upload\\/20161008\\/57f8b1a5f1b38.jpg","alt":"ipart3-02","seq":"1"},{"url":"data\\/upload\\/20161008\\/57f8b1a618a97.jpg","alt":"ipart3-03","seq":"2"},{"url":"data\\/upload\\/20161008\\/57f8b1a62abab.jpg","alt":"ipart3-04","seq":"3"}]', NULL),
(102, NULL, 0, 0, '', 0, 1, '', '[]', '<p>测试二级菜单下左侧是否可展开</p>'),
(103, '<p><span style="color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 12px; line-height: 30px;">This product is the general MAG / CO2 welding wire and suitable for all-position welding</span></p>', 0, 0, '', 0, 1, '102|5,101|5,100', '[{"url":"data\\/upload\\/20160927\\/57e9e1e86dbdc.jpg","alt":"ipart3-04","seq":"0"},{"url":"data\\/upload\\/20160927\\/57e9d0cfbfe81.jpg","alt":"factory-pic1","seq":"1"},{"url":"data\\/upload\\/20160927\\/57e9d0cfea958.jpg","alt":"ipart3-pic1","seq":"2"},{"url":"data\\/upload\\/20160927\\/57e9d0d010916.jpg","alt":"ipart3-pic2","seq":"3"}]', '<table class="p2_table" cellspacing="0"><tbody><tr class="p2_kuan1"><td class="p2_kuan1">Specification:</td><td class="p2_kuan2">ISO</td><td class="p2_kuan3">G42 4 M21 3Si1</td></tr><tr class="p2_kuan1"><td class="p2_kuan1"><br/></td><td class="p2_kuan2">AWS</td><td class="p2_kuan3">ER70S-6</td></tr><tr class="p2_kuan1"><td class="p2_kuan1"><br/></td><td class="p2_kuan2">GB</td><td class="p2_kuan3">ER50-6</td></tr><tr class="p2_kuan1"><td class="p2_kuan1">Shieding Gas:</td><td colspan="2">C02</td></tr></tbody></table>');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_release`
--

CREATE TABLE IF NOT EXISTS `cmf_release` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b2bname` varchar(255) NOT NULL COMMENT 'b2b平台名称',
  `b2burl` varchar(255) NOT NULL COMMENT 'b2b平台网址',
  `reginfo` text NOT NULL COMMENT '注册所需信息',
  `logininfo` text NOT NULL COMMENT '登录字段',
  `postinfo` text NOT NULL COMMENT '发布产品所需信息',
  `username` varchar(100) NOT NULL COMMENT '注册用户名',
  `password` varchar(100) NOT NULL COMMENT '注册密码',
  `ifreg` tinyint(1) DEFAULT '0' COMMENT '是否注册',
  `regsuccess` varchar(255) NOT NULL COMMENT '注册成功信息',
  `loginsuccess` varchar(255) NOT NULL COMMENT '登录成功信息',
  `postsuccess` varchar(255) DEFAULT NULL COMMENT '发布成功信息',
  `regurl` varchar(255) NOT NULL COMMENT '注册地址',
  `loginurl` varchar(255) NOT NULL COMMENT '登录地址',
  `posturl` varchar(255) NOT NULL COMMENT '发布地址',
  `preposturl` varchar(255) DEFAULT NULL COMMENT '发布页面，有隐藏字段时需要填写',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可编辑 1-可 0-不可',
  `ifhide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有隐藏字段 1-有 0-没有',
  `is_auto_enrollment` tinyint(1) DEFAULT '0' COMMENT '是否自动注册（0：是，1：不是）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `cmf_release`
--

INSERT INTO `cmf_release` (`id`, `b2bname`, `b2burl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `postsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide`, `is_auto_enrollment`) VALUES
(6, 'moradabadyellowpages(可发成功)', 'http://www.moradabadyellowpages.com', 'a:15:{s:11:"NewUsername";s:12:"xingtengkeji";s:2:"p1";s:8:"20160601";s:2:"p2";s:8:"20160601";s:9:"FirstName";s:4:"jian";s:8:"LastName";s:2:"xu";s:7:"address";s:15:"china.hebei.sjz";s:5:"phone";s:13:"0311-87777777";s:8:"cellular";s:11:"15100108598";s:5:"email";s:17:"1276595846@qq.com";s:5:"agree";s:2:"on";s:7:"country";s:0:"";s:5:"state";s:13:"uttar pradesh";s:4:"city";s:9:"Moradabad";s:3:"zip";s:6:"244001";s:2:"s1";s:12:"Register Now";}', 'a:3:{s:2:"us";s:12:"xingtengkeji";s:2:"ps";s:8:"20160601";s:2:"s1";s:5:"Login";}', 'a:9:{s:11:"CompanyName";a:3:{i:0;s:12:"xingtengkeji";i:1;s:3:"103";i:2;N;}s:10:"CategoryID";a:3:{i:0;s:1:"6";i:1;s:1:"0";i:2;N;}s:13:"SubCategoryID";a:3:{i:0;s:2:"36";i:1;s:1:"0";i:2;N;}s:4:"logo";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:6:"resume";a:3:{i:0;s:730:"Place of Origin: Shandong, China (Mainland) 					 Brand Name:GLORY Model Number:	GF-CB2015029 					 Gender:	Boys Upper Material:Canvas 					 Lining Material:Cotton Fabric 					 Insole Material:EVA 					 Outsole Material:Rubber 					 Style:Slip-On 					 Season:	Autumn, Spring, Summer 					 Upper:canvas / pu /other textile 					 Lining:	cotton / textile, per your request 					 Insole:	EVA+ Cotton 					 Outsole:Rubber 					 Color:	red, yellow,navy,black,any color can do,per your request 					 Feature:Fashion,Casual,Comfortable 					 Origin:	Qingdao, China 					 Port:Qingdao 					 MOQ:1000 pairs per style per color per gender 					 Size:children: EUR:28--35#/women:EUR:36-41#/men:EUR:39-45 					 http://www.gloryfootwearco.com";i:1;s:3:"108";i:2;N;}s:4:"tags";a:3:{i:0;s:11:"Boys shoots";i:1;s:3:"103";i:2;N;}s:8:"address1";a:3:{i:0;s:15:"china.hebei.sjz";i:1;s:1:"0";i:2;N;}s:6:"phone3";a:3:{i:0;s:13:"0311-88888888";i:1;s:1:"0";i:2;N;}s:2:"s1";a:3:{i:0;s:11:"Add Listing";i:1;s:1:"0";i:2;N;}}', 'us|xingtengkeji1', 'ps|20160601', 1, 'Congratulations Your Registration Completed Successfully!!', 'Welcome', '', 'http://www.moradabadyellowpages.com/register.php', 'http://www.moradabadyellowpages.com/login.php', 'http://www.moradabadyellowpages.com/addlisting.php', '', 1, 0, 0),
(15, 'bikudo', 'http://www.bikudo.com', 'a:16:{s:2:"ad";s:8:"xiaoxiao";s:5:"adres";s:10:"zhengyijie";s:5:"bolge";s:5:"henan";s:6:"eposta";s:15:"34445234@qq.com";s:13:"hesap_olustur";s:17:"Create My Account";s:2:"il";s:7:"zhezhou";s:5:"konum";s:2:"44";s:2:"pk";s:7:"0200101";s:5:"sifre";s:7:"m123456";s:13:"sifre_denetim";s:7:"m123456";s:6:"sirket";s:24:"zhengzhoushangwuzhongxin";s:5:"soyad";s:4:"chen";s:12:"tel_kod_alan";s:4:"0311";s:12:"tel_kod_ulke";s:2:"86";s:6:"tel_nu";s:7:"8888888";s:7:"btnSave";s:19:"Creating My Account";}', 'a:7:{s:2:"id";s:1:"0";s:3:"pwd";s:7:"m123456";s:13:"remember_user";s:1:"1";s:11:"return_path";s:0:"";s:7:"sb_type";s:1:"0";s:6:"submit";s:7:"Sign In";s:8:"username";s:15:"34445234@qq.com";}', 'a:23:{s:8:"category";a:3:{i:0;s:73:"Apparel, Textile & Leather>Athletic Wear;Gifts & Crafts>Artificial Crafts";i:1;s:1:"0";i:2;N;}s:3:"cid";a:3:{i:0;s:7:"141;857";i:1;s:1:"0";i:2;N;}s:7:"remLen2";a:3:{i:0;s:3:"730";i:1;s:1:"0";i:2;N;}s:7:"sb_bank";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:7:"sb_cash";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:9:"sb_cheque";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:9:"sb_credit";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:16:"sb_delivery_time";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:14:"sb_description";a:3:{i:0;s:730:"Place of Origin: Shandong, China (Mainland) 					 Brand Name:GLORY Model Number:	GF-CB2015029 					 Gender:	Boys Upper Material:Canvas 					 Lining Material:Cotton Fabric 					 Insole Material:EVA 					 Outsole Material:Rubber 					 Style:Slip-On 					 Season:	Autumn, Spring, Summer 					 Upper:canvas / pu /other textile 					 Lining:	cotton / textile, per your request 					 Insole:	EVA+ Cotton 					 Outsole:Rubber 					 Color:	red, yellow,navy,black,any color can do,per your request 					 Feature:Fashion,Casual,Comfortable 					 Origin:	Qingdao, China 					 Port:Qingdao 					 MOQ:1000 pairs per style per color per gender 					 Size:children: EUR:28--35#/women:EUR:36-41#/men:EUR:39-45 					 http://www.gloryfootwearco.com";i:1;s:1:"0";i:2;N;}s:9:"sb_escrow";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:11:"sb_keywords";a:3:{i:0;s:3:"tes";i:1;s:1:"0";i:2;N;}s:6:"sb_loc";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:11:"sb_location";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:12:"sb_min_order";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:13:"sb_other_mode";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:8:"sb_price";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:15:"sb_price_cur_id";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:17:"sb_product_status";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:11:"sb_quantity";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:20:"sb_samples_available";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:16:"sb_shipping_cost";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:8:"sb_title";a:3:{i:0;s:10:"bighon tea";i:1;s:3:"103";i:2;N;}s:6:"submit";a:3:{i:0;s:6:"Submit";i:1;s:1:"0";i:2;N;}}', 'username|34445234@qq.com', 'pwd|m123456', 1, 'Sign In', 'You have successfully logged-in', '', 'http://www.bikudo.com/register', 'http://www.bikudo.com/login.do', 'http://www.bikudo.com/post_selling_leads.do', '', 1, 0, 0),
(10, 'kitairu', 'http://kitairu.net', 'a:7:{s:12:"contact_name";s:7:"xujian1";s:4:"mail";s:16:"343478901@qq.com";s:2:"op";s:6:"注册";s:4:"pass";s:7:"1234567";s:6:"pass_2";s:7:"1234567";s:7:"previus";s:0:"";s:4:"role";s:1:"1";}', 'a:4:{s:4:"mail";s:16:"343478901@qq.com";s:4:"pass";s:7:"1234567";s:2:"op";s:6:"Log in";s:7:"previus";s:0:"";}', 'a:9:{s:8:"owner_id";a:3:{i:0;s:4:"2696";i:1;s:1:"0";i:2;s:1:"0";}s:7:"text_cn";a:3:{i:0;s:48:"我公司生产绿色无添加剂安全的绿茶";i:1;s:1:"0";i:2;s:1:"0";}s:7:"text_en";a:3:{i:0;s:53:"Our company produces green tea without additives safe";i:1;s:1:"0";i:2;s:1:"0";}s:7:"text_ru";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"title_cn";a:3:{i:0;s:9:"green tea";i:1;s:1:"0";i:2;s:1:"0";}s:8:"title_en";a:3:{i:0;s:9:"green tea";i:1;s:1:"0";i:2;s:1:"0";}s:8:"title_ru";a:3:{i:0;s:9:"green tea";i:1;s:1:"0";i:2;s:1:"0";}s:4:"type";a:3:{i:0;s:8:"products";i:1;s:1:"0";i:2;s:1:"0";}s:3:"uid";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"1";}}', 'mail|343478901@qq.com', 'pass|1234567', 1, '', 'You sign as', '', 'http://kitairu.net/cn/user/register.html', 'http://kitairu.net/user/', 'http://kitairu.net/user/save.html', 'http://kitairu.net/user/add.html', 1, 1, 1),
(13, 'trade2bharat', 'http://www.trade2bharat.com', 'a:20:{s:4:"city";s:12:"shijiazhuang";s:7:"country";s:2:"38";s:5:"email";s:15:"4439585@163.com";s:3:"fax";s:2:"86";s:4:"fax1";s:4:"0311";s:4:"fax2";s:8:"88888883";s:9:"firstname";s:4:"xiao";s:8:"lastname";s:5:"liang";s:6:"mobile";s:11:"15100108575";s:11:"other_state";s:5:"china";s:8:"password";s:9:"re1234567";s:5:"phone";s:2:"86";s:6:"phone1";s:4:"0311";s:6:"phone2";s:8:"88888888";s:4:"pwd2";s:9:"re1234567";s:5:"state";s:8:"Arkansas";s:6:"street";s:0:"";s:6:"submit";s:6:"Signup";s:8:"username";s:10:"rerr445438";s:8:"zip_code";s:6:"050000";}', 'a:6:{s:7:"es_type";s:1:"0";s:2:"id";s:1:"0";s:11:"return_path";s:0:"";s:8:"username";s:10:"rerr445438";s:3:"pwd";s:9:"re1234567";s:6:"Submit";s:7:"Sign In";}', 'a:18:{s:8:"category";a:3:{i:0;s:18:"Agriculture>Others";i:1;s:1:"0";i:2;s:1:"0";}s:4:"cats";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:3:"cid";a:3:{i:0;s:2:"90";i:1;s:1:"0";i:2;s:1:"0";}s:7:"es_cash";a:3:{i:0;s:3:"yes";i:1;s:1:"0";i:2;s:1:"0";}s:16:"es_delivery_time";a:3:{i:0;s:2:"30";i:1;s:1:"0";i:2;s:1:"0";}s:14:"es_description";a:3:{i:0;s:730:"Place of Origin: Shandong, China (Mainland) 					 Brand Name:GLORY Model Number:	GF-CB2015029 					 Gender:	Boys Upper Material:Canvas 					 Lining Material:Cotton Fabric 					 Insole Material:EVA 					 Outsole Material:Rubber 					 Style:Slip-On 					 Season:	Autumn, Spring, Summer 					 Upper:canvas / pu /other textile 					 Lining:	cotton / textile, per your request 					 Insole:	EVA+ Cotton 					 Outsole:Rubber 					 Color:	red, yellow,navy,black,any color can do,per your request 					 Feature:Fashion,Casual,Comfortable 					 Origin:	Qingdao, China 					 Port:Qingdao 					 MOQ:1000 pairs per style per color per gender 					 Size:children: EUR:28--35#/women:EUR:36-41#/men:EUR:39-45 					 http://www.gloryfootwearco.com";i:1;s:1:"0";i:2;s:1:"0";}s:11:"es_keywords";a:3:{i:0;s:9:"red   tea";i:1;s:1:"0";i:2;s:1:"0";}s:11:"es_location";a:3:{i:0;s:5:"china";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_min_order";a:3:{i:0;s:2:"10";i:1;s:1:"0";i:2;s:1:"0";}s:13:"es_other_mode";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"es_price";a:3:{i:0;s:2:"10";i:1;s:1:"0";i:2;s:1:"0";}s:15:"es_price_cur_id";a:3:{i:0;s:1:"7";i:1;s:1:"0";i:2;s:1:"0";}s:17:"es_product_status";a:3:{i:0;s:3:"New";i:1;s:1:"0";i:2;s:1:"0";}s:11:"es_quantity";a:3:{i:0;s:3:"100";i:1;s:1:"0";i:2;s:1:"0";}s:20:"es_samples_available";a:3:{i:0;s:2:"no";i:1;s:1:"0";i:2;s:1:"0";}s:16:"es_shipping_cost";a:3:{i:0;s:2:"10";i:1;s:1:"0";i:2;s:1:"0";}s:8:"es_title";a:3:{i:0;s:7:"red tea";i:1;s:1:"0";i:2;s:1:"0";}s:6:"submit";a:3:{i:0;s:8:"Post Now";i:1;s:1:"0";i:2;s:1:"0";}}', 'username|rerr445438', 'pwd|re1234567', 0, 'success', 'you have successfully logged-in', '', 'http://www.trade2bharat.com/addmember.php', 'http://www.trade2bharat.com/login.php', 'http://www.trade2bharat.com/post_product.php', '', 1, 0, 1),
(19, 'http://www.ec51.com/', 'http://www.ec51.com/join.html', 'a:7:{s:4:"code";s:30:"http://www.ec51.com/vcode.html";s:5:"uname";s:7:"3r33rre";s:5:"email";s:15:"32338546@qq.com";s:6:"remail";s:15:"32338546@qq.com";s:6:"passwd";s:7:"m123456";s:8:"repasswd";s:7:"m123456";s:7:"codeval";s:7:"imgcode";}', 'a:5:{s:5:"uname";s:6:"rlit45";s:6:"passwd";s:7:"m123456";s:4:"code";s:30:"http://www.ec51.com/vcode.html";s:7:"codeval";s:7:"imgcode";s:8:"remember";s:1:"Y";}', 'a:0:{}', 'uname|rlit45', 'passwd|m123456', 1, '{&quot;code&quot;:1,&quot;message&quot;:&quot;Thank you for registering as a site member, the system will guide you to to perfect your data.&quot;,&quot;jump&quot;:&quot;\\/ucp\\/account.html&quot;}', 'woshiceshi', '', 'http://www.ec51.com/join.html', 'http://www.ec51.com/login.html', 'woshiceshi', '', 1, 0, 1),
(21, '中国供应商', 'http://en.china.cn/', 'a:18:{s:15:"registerCountry";s:16:"China (Mainland)";s:11:"regCorpType";s:1:"1";s:9:"firstName";s:4:"xiao";s:8:"lastName";s:3:"han";s:8:"corpname";s:18:"hangzhoudalichukou";s:11:"t_subdomain";s:0:"";s:11:"countryCode";s:2:"86";s:8:"earaCode";s:3:"010";s:5:"phone";s:8:"87463212";s:5:"email";s:17:"han4234534@qq.com";s:8:"username";s:16:"shijiazhuangre15";s:8:"password";s:9:"woshimima";s:13:"passwordcheck";s:9:"woshimima";s:10:"websiteurl";s:0:"";s:17:"registeredCountry";s:16:"China (Mainland)";s:12:"registerType";s:1:"1";s:7:"codeval";s:9:"verifystr";s:4:"code";s:43:"http://my.en.china.cn/captcha.php?seed=9854";}', 'a:5:{s:2:"op";s:8:"B2BLogin";s:8:"userName";s:16:"shijiazhuangre15";s:12:"userPassword";s:9:"woshimima";s:8:"username";s:16:"shijiazhuangre15";s:8:"password";s:9:"woshimima";}', 'a:30:{s:13:"tradeLeadType";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:8:"quantity";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:11:"offerDetail";a:3:{i:0;s:0:"";i:1;s:3:"108";i:2;s:1:"0";}s:12:"offerSubject";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:7:"modelNO";a:3:{i:0;s:0:"";i:1;s:3:"110";i:2;s:1:"0";}s:8:"keyword1";a:3:{i:0;s:0:"";i:1;s:3:"204";i:2;s:1:"0";}s:12:"productPrice";a:3:{i:0;s:0:"";i:1;s:3:"109";i:2;s:1:"0";}s:9:"priceUnit";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"minAmount";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"totalAmount";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"port";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"quality";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"brandName";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"currency";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"priceTerms";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:15:"otherPriceTerms";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"paymentTerms";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:13:"paymentRemark";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"deliverDate";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:15:"totalAmountUnit";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"packaging";a:3:{i:0;s:14:"woshibaozhuang";i:1;s:1:"0";i:2;s:1:"0";}s:10:"needExProp";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:12:"categoryType";a:3:{i:0;s:4:"SELL";i:1;s:1:"0";i:2;s:1:"0";}s:6:"select";a:3:{i:0;s:3:"302";i:1;s:1:"0";i:2;s:1:"0";}s:10:"categoryId";a:3:{i:0;s:3:"302";i:1;s:1:"0";i:2;s:1:"0";}s:13:"placeOfOrigin";a:3:{i:0;s:11:"shijazhuang";i:1;s:1:"0";i:2;s:1:"0";}s:11:"watermarker";a:3:{i:0;s:2:"on";i:1;s:1:"0";i:2;s:1:"0";}s:8:"picIndex";a:3:{i:0;s:1:"2";i:1;s:1:"0";i:2;s:1:"0";}s:11:"offerExpire";a:3:{i:0;s:2:"90";i:1;s:1:"0";i:2;s:1:"0";}s:7:"retread";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}}', 'username|shijiazhuangre15', 'password|woshimima', 1, 'Welcome to CHINA.CN', 'Welcome to CHINA.CN', '', 'http://my.en.china.cn/admin.php?op=B2BRegister', 'http://my.en.china.cn/admin.php', 'http://my.en.china.cn/admin.php?op=SellInfoPublish&amp;auth=3822bdc1161e083ebec643567ec0e338', '', 1, 0, 0),
(61, 'businessnetwork.co.uk(需自行注册,只能发一个产品)', 'http://businessnetwork.co.uk/', 'a:0:{}', 'a:2:{s:5:"login";s:17:"3406366416@qq.com";s:8:"password";s:9:"han123456";}', 'a:20:{s:7:"Company";a:3:{i:0;s:18:"hangzhoudalichukou";i:1;s:1:"0";i:2;s:1:"0";}s:8:"Industry";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"Add1";a:3:{i:0;s:8:"renminlu";i:1;s:1:"0";i:2;s:1:"0";}s:4:"Add2";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"Add3";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"Town";a:3:{i:0;s:9:"hangzhou1";i:1;s:1:"0";i:2;s:1:"0";}s:6:"County";a:3:{i:0;s:7:"jiangsu";i:1;s:1:"0";i:2;s:1:"0";}s:8:"Postcode";a:3:{i:0;s:6:"310000";i:1;s:1:"0";i:2;s:1:"0";}s:4:"logo";a:3:{i:0;s:38:"{ECB258AC-EA39-F6B1-629F-33908EB01499}";i:1;s:1:"0";i:2;s:1:"0";}s:2:"id";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"1";}s:7:"user_id";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"1";}s:7:"Website";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"Email";a:3:{i:0;s:17:"han4234534@qq.com";i:1;s:1:"0";i:2;s:1:"0";}s:9:"Telephone";a:3:{i:0;s:11:"18654536747";i:1;s:1:"0";i:2;s:1:"0";}s:3:"Fax";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"Twitter";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:17:"Description_short";a:3:{i:0;s:10:"testt test";i:1;s:1:"0";i:2;s:1:"0";}s:11:"Description";a:3:{i:0;s:16:"food product1111";i:1;s:1:"0";i:2;s:1:"0";}s:4:"tags";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"hidden-tags";a:3:{i:0;s:8:"food,tea";i:1;s:1:"0";i:2;s:1:"0";}}', 'login|3406366416@qq.com', 'password|han123456', 1, '1', 'You''ve successfully activated your account', '', '1', 'http://businessnetwork.co.uk/auth/login', 'http://businessnetwork.co.uk/dashboard/updatebusiness/', 'http://businessnetwork.co.uk/dashboard/editbusiness/48060', 1, 1, 1),
(23, 'woodworkingb2b.com', 'http://www.woodworkingb2b.com/', 'a:16:{s:8:"UserName";s:9:"reaxiao23";s:3:"PWD";s:7:"m123456";s:10:"PWDConfirm";s:7:"m123456";s:14:"SecretQuestion";s:6:"123456";s:12:"SecretAnswer";s:6:"123456";s:5:"Email";s:17:"reaxiao23f@qq.com";s:6:"NameEn";s:6:"123222";s:11:"Area.AreaID";s:3:"212";s:7:"Linkman";s:6:"123123";s:10:"LinkmanSex";s:1:"1";s:3:"Tel";s:15:"86-571-85677414";s:16:"EnterpriseNature";s:1:"0";s:15:"BusinessModel[]";s:13:"Manufacturing";s:12:"CoreBusiness";s:11:"asdfasdfasf";s:7:"btnSave";s:19:"Creating My Account";s:13:"BusinessModel";s:14:"Manufacturing,";}', 'a:3:{s:8:"UserName";s:9:"reaxiao23";s:8:"Password";s:7:"m123456";s:11:"loginSubmit";s:8:"Sign In ";}', 'a:15:{s:33:"ProductCategory.ProductCategoryID";a:3:{i:0;s:3:"626";i:1;s:1:"0";i:2;s:1:"0";}s:5:"Title";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:5:"Model";a:3:{i:0;s:0:"";i:1;s:3:"110";i:2;s:1:"0";}s:5:"Price";a:3:{i:0;s:0:"";i:1;s:3:"110";i:2;s:1:"0";}s:11:"Area.AreaID";a:3:{i:0;s:3:"211";i:1;s:1:"0";i:2;s:1:"0";}s:8:"MinOrder";a:3:{i:0;s:2:"10";i:1;s:1:"0";i:2;s:1:"0";}s:8:"MaxOrder";a:3:{i:0;s:2:"30";i:1;s:1:"0";i:2;s:1:"0";}s:4:"unit";a:3:{i:0;s:3:"123";i:1;s:1:"0";i:2;s:1:"0";}s:12:"DeliveryDays";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:9:"ValidDate";a:3:{i:0;s:10:"2018-07-14";i:1;s:1:"0";i:2;s:1:"0";}s:9:"Parameter";a:3:{i:0;s:0:"";i:1;s:3:"108";i:2;s:1:"0";}s:18:"ProductImages.Path";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"Video";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"Content";a:3:{i:0;s:0:"";i:1;s:3:"108";i:2;s:1:"0";}s:7:"Indexer";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}}', 'UserName|reaxiao23', 'Password|m123456', 1, 'Wood processing machinery and equipment', 'You are now a Free Member on Woodworkingb2b', '', 'http://www.woodworkingb2b.com/Account/Reg.htm', 'http://www.woodworkingb2b.com/Account/MemberLogin.htm', 'http://www.woodworkingb2b.com/Member/Product/Add.htm', '', 1, 0, 1),
(28, '中国（综合 生意宝）', 'http://www.toocle.com/', 'a:15:{s:2:"_a";s:4:"main";s:2:"_d";s:5:"en/my";s:5:"agree";s:1:"1";s:7:"company";s:12:"henanshangwu";s:5:"email";s:16:"99934556@126.com";s:1:"f";s:7:"join_in";s:3:"gid";s:2:"17";s:5:"login";s:9:"reaxiao56";s:5:"pass2";s:6:"123456";s:6:"passwd";s:6:"123456";s:5:"reurl";s:0:"";s:8:"submit.x";s:2:"84";s:8:"submit.y";s:1:"6";s:7:"codeval";s:8:"v_secret";s:4:"code";s:84:"http://www.toocle.com/English/img/genmatchpic.php?t=intl_en_join&w=70&h=22&ox=3&oy=3";}', 'a:8:{s:2:"_a";s:5:"login";s:2:"_d";s:9:"member-en";s:1:"f";s:11:"check_login";s:5:"login";s:9:"reaxiao56";s:6:"passwd";s:6:"123456";s:5:"reurl";s:14:"?_a=company_en";s:1:"x";s:2:"50";s:1:"y";s:2:"18";}', 'a:37:{s:6:"HSCode";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"MainMarkets";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:2:"_a";a:3:{i:0;s:10:"product_en";i:1;s:1:"0";i:2;s:1:"0";}s:2:"_d";a:3:{i:0;s:9:"member-en";i:1;s:1:"0";i:2;s:1:"0";}s:5:"brief";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:2:"c1";a:3:{i:0;s:2:"59";i:1;s:1:"0";i:2;s:1:"0";}s:2:"c2";a:3:{i:0;s:4:"5911";i:1;s:1:"0";i:2;s:1:"0";}s:2:"c3";a:3:{i:0;s:6:"591112";i:1;s:1:"0";i:2;s:1:"0";}s:7:"cap_per";a:3:{i:0;s:4:"Time";i:1;s:1:"0";i:2;s:1:"0";}s:8:"capacity";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"cate2";a:3:{i:0;s:3:"USD";i:1;s:1:"0";i:2;s:1:"0";}s:8:"category";a:3:{i:0;s:6:"591112";i:1;s:1:"0";i:2;s:1:"0";}s:8:"delivery";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:1:"f";a:3:{i:0;s:6:"change";i:1;s:1:"0";i:2;s:1:"0";}s:2:"id";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"intro";a:3:{i:0;s:0:"";i:1;s:3:"106";i:2;s:1:"0";}s:9:"miniOrder";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"packing";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"payment";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:17:"pbase_custom_attr";a:3:{i:0;s:9:"attr name";i:1;s:1:"0";i:2;s:1:"0";}s:16:"pbase_custom_val";a:3:{i:0;s:10:"attr value";i:1;s:1:"0";i:2;s:1:"0";}s:6:"pgroup";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"pmax";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"pmin";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"port";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"product";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:14:"searchKeywords";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:15:"searchKeywords1";a:3:{i:0;s:0:"";i:1;s:3:"204";i:2;s:1:"0";}s:9:"show_rank";a:3:{i:0;s:5:"25000";i:1;s:1:"0";i:2;s:1:"0";}s:4:"spec";a:3:{i:0;s:0:"";i:1;s:3:"105";i:2;s:1:"0";}s:6:"uniqid";a:3:{i:0;s:13:"577b4a207da12";i:1;s:1:"0";i:2;s:1:"0";}s:5:"unit1";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:5:"unit2";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:5:"unit3";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:4:"uses";a:3:{i:0;s:0:"";i:1;s:2:"89";i:2;s:1:"0";}s:1:"x";a:3:{i:0;s:2:"54";i:1;s:1:"0";i:2;s:1:"0";}s:1:"y";a:3:{i:0;s:2:"14";i:1;s:1:"0";i:2;s:1:"0";}}', 'login|reaxiao56', 'passwd|123456', 0, 'Successful registration', 'My Profile', 'Your infomation has been added successfully! ', 'http://www.toocle.com/English/my/', 'http://www.toocle.com/English/member/?reurl=%2FEnglish%2Fmember%2F&amp;exp=not_login&amp;_d=member-en&amp;_a=login', 'http://www.toocle.com/English/member/index.php?_a=product_en&amp;f=detail', '', 1, 0, 1),
(63, 'bizgoco(自行注册）', 'https://www.bizgoco.com/', 'a:0:{}', 'a:2:{s:5:"uname";s:9:"995251229";s:3:"pwd";s:6:"123456";}', 'a:22:{s:6:"itemid";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:5:"title";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;N;}s:5:"catid";a:3:{i:0;s:0:"";i:1;s:3:"101";i:2;N;}s:9:"oneSelect";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}s:9:"twoSelect";a:3:{i:0;s:3:"292";i:1;s:1:"0";i:2;N;}s:7:"content";a:3:{i:0;s:0:"";i:1;s:3:"108";i:2;N;}s:4:"path";a:3:{i:0;s:0:"";i:1;s:3:"100";i:2;N;}s:6:"path_1";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:6:"path_2";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3606]";a:3:{i:0;s:1:"5";i:1;s:1:"0";i:2;N;}s:12:"option[3607]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3608]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3609]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3610]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3611]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3653]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:12:"option[3654]";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;N;}s:9:"minamount";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}s:4:"unit";a:3:{i:0;s:3:"Box";i:1;s:1:"0";i:2;N;}s:8:"minprice";a:3:{i:0;s:0:"";i:1;s:3:"109";i:2;N;}s:8:"currency";a:3:{i:0;s:3:"RMB";i:1;s:1:"0";i:2;N;}s:7:"mycatid";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}}', 'uname|995251229', 'pwd|123456', 1, 'well', 'window.location', '', 'https://www.bizgoco.com/', 'https://www.bizgoco.com/login.html', 'https://www.bizgoco.com/user/sell/save_sell.html', '', 1, 0, 1),
(41, 'suppliers', 'http://www.supplierss.com', 'a:6:{s:5:"email";s:18:"han3434434@163.com";s:8:"password";s:9:"han123456";s:12:"confirmation";s:9:"han123456";s:6:"button";s:8:"join Now";s:7:"codeval";s:7:"captcha";s:4:"code";s:37:"http://www.supplierss.com/captcha.php";}', 'a:6:{s:5:"email";s:18:"han3434434@163.com";s:8:"password";s:9:"han123456";s:6:"button";s:7:"Sign In";s:7:"codeval";s:7:"captcha";s:4:"code";s:37:"http://www.supplierss.com/captcha.php";s:8:"username";s:18:"han3434434@163.com";}', 'a:22:{s:5:"title";a:3:{i:0;s:7:"service";i:1;s:3:"103";i:2;s:1:"0";}s:4:"type";a:3:{i:0;s:4:"Sale";i:1;s:1:"0";i:2;s:1:"0";}s:7:"country";a:3:{i:0;s:5:"10560";i:1;s:1:"0";i:2;s:1:"0";}s:8:"province";a:3:{i:0;s:5:"42838";i:1;s:1:"0";i:2;s:1:"0";}s:4:"city";a:3:{i:0;s:8:"hangzhou";i:1;s:1:"0";i:2;s:1:"0";}s:2:"c1";a:3:{i:0;s:4:"3315";i:1;s:1:"0";i:2;s:1:"0";}s:2:"c2";a:3:{i:0;s:4:"3477";i:1;s:1:"0";i:2;s:1:"0";}s:7:"keyword";a:3:{i:0;s:7:"service";i:1;s:1:"0";i:2;s:1:"0";}s:11:"expiredtime";a:3:{i:0;s:4:"3650";i:1;s:1:"0";i:2;s:1:"0";}s:7:"details";a:3:{i:0;s:9:"it''s good";i:1;s:1:"0";i:2;s:1:"0";}s:13:"specification";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"quantity";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"price";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"person";a:3:{i:0;s:8:"han xiao";i:1;s:1:"0";i:2;s:1:"0";}s:11:"persontitle";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:3:"tel";a:3:{i:0;s:11:"18530125478";i:1;s:1:"0";i:2;s:1:"0";}s:6:"mobile";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:3:"fax";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:3:"www";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"email";a:3:{i:0;s:16:"han44578@163.com";i:1;s:1:"0";i:2;s:1:"0";}s:3:"psn";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"button";a:3:{i:0;s:4:"Save";i:1;s:1:"0";i:2;s:1:"0";}}', 'username|han3434434@163.com', 'password|han123456', 1, 'Successful', 'company', '', 'http://www.supplierss.com/mem/signup.php?do=signup', 'http://www.supplierss.com/mem/signin.php?do=signin', 'http://www.supplierss.com/mem/offers.php?do=insert', '', 1, 0, 1),
(45, 'mfrbee', 'http://www.mfrbee.com', 'a:14:{s:7:"country";s:2:"CN";s:5:"utype";s:1:"1";s:5:"fname";s:4:"jian";s:5:"lname";s:2:"xu";s:7:"company";s:15:"shijiazxinhao12";s:5:"tel_a";s:2:"86";s:5:"tel_b";s:3:"311";s:5:"tel_c";s:8:"12345678";s:5:"email";s:15:"4435555@126.com";s:8:"password";s:6:"123456";s:10:"passwordag";s:6:"123456";s:6:"Submit";s:18:" Create My Account";s:7:"codeval";s:5:"mcode";s:4:"code";s:48:"https://www.mfrbee.com/msimg/securimage_show.php";}', 'a:6:{s:5:"email";s:15:"4435555@126.com";s:7:"backurl";s:0:"";s:8:"password";s:6:"123456";s:11:"remember_me";s:1:"1";s:5:"login";s:0:"";s:6:"action";s:5:"login";}', 'a:20:{s:5:"pname";a:3:{i:0;s:11:" boardlsrar";i:1;s:1:"0";i:2;s:1:"0";}s:13:"user_keywords";a:3:{i:0;s:12:" boarddsrser";i:1;s:1:"0";i:2;s:1:"0";}s:9:"cat_cname";a:3:{i:0;s:7:"Apparel";i:1;s:1:"0";i:2;s:1:"0";}s:11:"cat_subname";a:3:{i:0;s:14:"Anime Costumes";i:1;s:1:"0";i:2;s:1:"0";}s:18:"cat_subname_hidden";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:17:"cat_cname_hidden	";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:5:"qdn_1";a:3:{i:0;s:5:"Price";i:1;s:1:"0";i:2;s:1:"0";}s:5:"qdv_1";a:3:{i:0;s:3:"100";i:1;s:1:"0";i:2;s:1:"0";}s:5:"qdn_2";a:3:{i:0;s:14:" Minimum order";i:1;s:1:"0";i:2;s:1:"0";}s:5:"qdv_2";a:3:{i:0;s:3:"100";i:1;s:1:"0";i:2;s:1:"0";}s:5:"qdv_3";a:3:{i:0;s:18:" China (Mainland) ";i:1;s:1:"0";i:2;s:1:"0";}s:3:"pkg";a:3:{i:0;s:18:"12pcs each PVC box";i:1;s:1:"0";i:2;s:1:"0";}s:8:"delivery";a:3:{i:0;s:7:"15 Days";i:1;s:1:"0";i:2;s:1:"0";}s:14:"specifications";a:3:{i:0;s:419:"good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good good good it\\''s good your product is good";i:1;s:1:"0";i:2;s:1:"0";}s:9:"view_mode";a:3:{i:0;s:2:"on";i:1;s:1:"0";i:2;s:1:"0";}s:14:"uploader_count";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:9:"microtime";a:3:{i:0;s:15:"1467772831.5603";i:1;s:1:"0";i:2;s:1:"1";}s:4:"hash";a:3:{i:0;s:19:"7825261887332420000";i:1;s:1:"0";i:2;s:1:"0";}s:8:"orgi_pid";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:5:"qdn_3";a:3:{i:0;s:15:"Place of Origin";i:1;s:1:"0";i:2;s:1:"0";}}', 'email|4435555@126.com', 'password|123456', 1, 'Hi Supplier', 'Processing login in', 'Product Quick Detail', 'http://www.mfrbee.com/reg.php', 'http://www.mfrbee.com/login.php', 'http://www.mfrbee.com/my_publish_product.php', 'http://www.mfrbee.com/my_publish_product.php', 1, 1, 1),
(47, 'vvchem', 'http://www.vvchem.com/', 'a:15:{s:7:"country";s:5:"China";s:12:"businessType";s:4:"song";s:8:"lastName";s:4:"song";s:3:"sex";s:1:"0";s:11:"companyName";s:20:"Shijiazhuang Sonsong";s:2:"p1";s:2:"86";s:2:"p2";s:0:"";s:2:"p3";s:11:"15732191234";s:5:"email";s:13:"niuniu@qq.com";s:8:"password";s:6:"123456";s:10:"rePassword";s:6:"123456";s:1:"x";s:0:"";s:1:"y";s:0:"";s:7:"regType";s:0:"";s:3:"key";s:0:"";}', 'a:5:{s:5:"email";s:13:"niuniu@qq.com";s:8:"password";s:6:"123456";s:6:"rember";s:4:"true";s:1:"x";s:0:"";s:1:"y";s:0:"";}', 'a:16:{s:3:"cas";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"productName";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:6:"purity";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"quantity";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"priceUnit";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"minPrice";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"maxPrice";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"expiryDate";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:8:"detailed";a:3:{i:0;s:0:"";i:1;s:3:"108";i:2;s:1:"0";}s:6:"weight";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"formula";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"smiles";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:3:"mol";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:3:"url";a:3:{i:0;s:38:"/user/buyinfo/postBuyInfo.jsp?sucess=1";i:1;s:1:"0";i:2;s:1:"0";}s:4:"e_id";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:8:"btSubmit";a:3:{i:0;s:6:"Submit";i:1;s:1:"0";i:2;s:1:"0";}}', 'email|niuniu@qq.com', 'password|123456', 1, 'Thank you for submitting your Company Information to vvchem.com', 'Welcome', '', 'http://www.vvchem.com/user.do?action=reg', 'http://www.vvchem.com/user.do?action=login', 'http://www.vvchem.com/buyInfo.do?action=postBuyInfo', '', 1, 0, 1),
(36, 'eb80', 'http://www.eb80.com/', 'a:24:{s:11:"__VIEWSTATE";s:68:"/wEPDwULLTE0NzUwODA0MjFkZMGsYGAZUHsBAsRQteG4/P4mZLc4Bi6xASACqhrtFclf";s:20:"__VIEWSTATEGENERATOR";s:8:"917AECA7";s:17:"__EVENTVALIDATION";s:1504:"/wEWtwECoZ+FfwLJ4fq4BwLE2/a/AgL90KKTCAK99b3RAgK89b3RAgK/9b3RAgK+9b3RAgK59b3RAgK49b3RAgK79b3RAgKq9b3RAgKl9b3RAgK99f3SAgK99fHSAgK99fXSAgK99cnSAgK99c3SAgK99cHSAgK99cXSAgK99dnSAgK99Z3RAgK99ZHRAgK89f3SAgK89fHSAgK89fXSAgK89cnSAgK89c3SAgK89cHSAgK89cXSAgK89dnSAgK89Z3RAgK89ZHRAgK/9f3SAgK/9fHSAgK/9fXSAgK/9cnSAgK/9c3SAgK/9cHSAgK/9cXSAgK/9dnSAgK/9Z3RAgK/9ZHRAgK+9f3SAgK+9fHSAgK+9fXSAgK+9cnSAgK+9c3SAgK+9cHSAgK+9cXSAgK+9dnSAgK+9Z3RAgK+9ZHRAgK59f3SAgK59fHSAgK59fXSAgK59cnSAgK59c3SAgK59cHSAgK59cXSAgK59dnSAgK59Z3RAgK59ZHRAgK49f3SAgK49fHSAgK49fXSAgK49cnSAgK49c3SAgK49cHSAgK49cXSAgK49dnSAgK49Z3RAgK49ZHRAgK79f3SAgK79fHSAgK79fXSAgK79cnSAgK79c3SAgK79cHSAgK79cXSAgK79dnSAgK79Z3RAgK79ZHRAgKq9f3SAgKq9fHSAgKq9fXSAgKq9cnSAgKq9c3SAgKq9cHSAgKq9cXSAgKq9dnSAgKq9Z3RAgKq9ZHRAgKl9f3SAgKl9fHSAgKl9fXSAgKl9cnSAgKl9c3SAgKl9cHSAgKl9cXSAgKl9dnSAgKl9Z3RAgKl9ZHRAgKbtJqFBQL2jbzwCwLtmt7bAQLI8/HGBwKnyZOwCgKCprUbAvm/14YGAtSUyfEMAuP+ia8EAt7Xq5oKApu0noUFAvaNsPALAu2a0tsBAsjz9cYHAqfJl7AKAoKmiRsC+b+rhgYC1JTN8QwC4/6NrwQC3tevmgoCm7SShQUC9o208AsC7ZrW2wECyPPJxgcCp8nrsQoCgqaNGwL5v6+GBgLUlMHxDALj/oGvBALe16OaCgKbtJaFBQL2jYjwCwLtmqrbAQLI883GBwKnye+xCgKCpoEbAvm/o4YGAtSUxfEMAuP+ha8EAt7Xp5oKApu06oYFAvaNjPALAu2artsBAsjzwcYHAqfJ47EKAoKmhRsC+b+nhgYC1JTZ8QwC4/6ZrwQC3te7mgoCm7TuhgUC9o2A8AsC7Zqi2wECyPPFxgcCp8nnsQoCgqaZGwL5v7uGBgLUlN3xDALj/p2vBALe17+aCgKbtOKGBQL2jYTwCwLtmqbbAQLxhcC/CwLhwKaQAQLhwLKQAQKLzOnBAwKEtJirCQLozcS4CQL386e9BAL386O9BAKAnIXYDQL7h5fgCAKXm4jxCwLC5e6SAQLJnZKpCQLUnp3xAQL4j5HMDwLLo/CXDAL40JWiCpp8rfP6RRic/ssWhGoBvst4O0Spa2vcTlFr/Iw7001t";s:37:"ctl00$ContentPlaceHolder1$txtUserName";s:7:"han3514";s:32:"ctl00$ContentPlaceHolder1$txtPwd";s:9:"han123456";s:37:"ctl00$ContentPlaceHolder1$txtPassword";s:9:"han123456";s:36:"ctl00$ContentPlaceHolder1$ddlCountry";s:2:"31";s:36:"ctl00$ContentPlaceHolder1$txtCompany";s:11:"hangzhoud34";s:11:"ddlCategory";s:3:"251";s:38:"ctl00$ContentPlaceHolder1$HiddenField1";s:15:"Food & Beverage";s:16:"ddlCategorySmall";s:3:"266";s:38:"ctl00$ContentPlaceHolder1$HiddenField2";s:11:"Food Stocks";s:40:"ctl00$ContentPlaceHolder1$txtMainProduct";s:21:"green tea and red tea";s:37:"ctl00$ContentPlaceHolder1$txtLastName";s:3:"han";s:38:"ctl00$ContentPlaceHolder1$txtFirstName";s:4:"xiao";s:29:"ctl00$ContentPlaceHolder1$Sex";s:3:"Mr.";s:36:"ctl00$ContentPlaceHolder1$txtCountry";s:2:"86";s:33:"ctl00$ContentPlaceHolder1$txtArea";s:3:"010";s:40:"ctl00$ContentPlaceHolder1$txtPhoneNumber";s:8:"86574376";s:36:"ctl00$ContentPlaceHolder1$txtAddress";s:16:"hangzhourenminlu";s:34:"ctl00$ContentPlaceHolder1$txtEmail";s:16:"han44578@163.com";s:32:"ctl00$ContentPlaceHolder1$txtMSN";s:16:"han44578@163.com";s:41:"ctl00$ContentPlaceHolder1$txtIntroduction";s:50:"located in hangzhourenmin road, we have 300 people";s:35:"ctl00$ContentPlaceHolder1$btnSubmit";s:17:"Create My Account";}', 'a:8:{s:11:"__VIEWSTATE";s:68:"/wEPDwUKMTY3OTExMTY3MWRk2Hzdl/xeNWhDw4Fv9Ww88oAaypJhU06xbISLPkk9Toc=";s:20:"__VIEWSTATEGENERATOR";s:8:"1806D926";s:17:"__EVENTVALIDATION";s:80:"/wEWBAL2xuP2CALJ4fq4BwLE2/a/AgLz1qCIDGCufAh/Ce3QxSXmyGXqQjfoxnOJkZNM5MplaRqc9q5l";s:37:"ctl00$ContentPlaceHolder1$txtUserName";s:7:"han3514";s:32:"ctl00$ContentPlaceHolder1$txtPwd";s:9:"han123456";s:32:"ctl00$ContentPlaceHolder1$submit";s:7:"Sign In";s:8:"username";s:7:"han3514";s:8:"password";s:9:"han123456";}', 'a:27:{s:11:"__VIEWSTATE";a:3:{i:0;s:124:"/wEPDwULLTE1MDg3Mjk3NDdkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYBBQRjYlJlMJOZ+6AxMXqopuUQZ49PfcZ0oCpm7hFgFkZkyL5251Y=";i:1;s:1:"0";i:2;s:1:"0";}s:20:"__VIEWSTATEGENERATOR";a:3:{i:0;s:8:"F962B9DE";i:1;s:1:"0";i:2;s:1:"0";}s:17:"__EVENTVALIDATION";a:3:{i:0;s:304:"/wEWIALZkPmWCQL4zZT6AgLihLTFCQKb/IrEBgK1+oCGAwKQo8KrDQKQo/68BwKb8ryDAQKevJeUBgK7lazgAQK9ldzjAQK8leDjAQKy+oaODQK/lezjAQK4lezjAQKllezjAQKb1IO0BgKb1P+3BgKb1Ku0BgKy+oaODQKcxoyqAwLtyMj2BwKM4IaiCgKG+MjKDwLekumwAQKN16vxCQL/+s78DAK+nvT2DAK70Yy0BQLC99T0DQLtjO6MCwLCi9reAxQhsylhC/UbJ8eUyGo0Vq/dUH67IWAjBfh1a2tLHYYR";i:1;s:1:"0";i:2;s:1:"0";}s:10:"txtSubject";a:3:{i:0;s:9:"Green tea";i:1;s:3:"103";i:2;s:1:"0";}s:7:"txtKOne";a:3:{i:0;s:3:"tea";i:1;s:3:"200";i:2;s:1:"0";}s:7:"txtKTwo";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"txtKThree";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"ddlCategory";a:3:{i:0;s:3:"251";i:1;s:1:"0";i:2;s:1:"0";}s:12:"HiddenField1";a:3:{i:0;s:15:"Food & Beverage";i:1;s:1:"0";i:2;s:1:"0";}s:16:"ddlCategorySmall";a:3:{i:0;s:3:"255";i:1;s:3:"200";i:2;s:1:"0";}s:12:"HiddenField2";a:3:{i:0;s:29:"Beverage Processing Machinery";i:1;s:1:"0";i:2;s:1:"0";}s:11:"ddlProGroup";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:10:"txtDetails";a:3:{i:0;s:60:"it''s goods asldfsakdrnnffsdr adsr sadfsdfsdfsadrrrrr11111111";i:1;s:1:"0";i:2;s:1:"0";}s:10:"ddlEndTime";a:3:{i:0;s:2:"30";i:1;s:1:"0";i:2;s:1:"0";}s:9:"txtOrigin";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"txtPayment";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"txtAbility";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"txtBrand";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"txtPrice";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"txtMin";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"mypicone";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"hidimgone";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"mypictwo";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"hidimgtwo";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"mypicthree";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"hidimgthree";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"btnSubmit";a:3:{i:0;s:11:"Post it Now";i:1;s:1:"0";i:2;s:1:"0";}}', 'username|han3514', 'password|han123456', 1, '', 'Member Information', '', 'http://www.eb80.com/login/region.aspx', 'http://www.eb80.com/login/login.aspx', 'http://www.eb80.com/Member/SellOffer.aspx', '', 1, 0, 1),
(56, 'medincn', 'http://www.medincn.com/', 'a:14:{s:7:"country";s:2:"cn";s:7:"regtype";s:8:"supplier";s:8:"username";s:9:"han454344";s:9:"firstname";s:4:"xiao";s:8:"lastname";s:3:"han";s:11:"companyname";s:18:"hangzhoudalichukou";s:12:"phonecountry";s:2:"86";s:9:"phonearea";s:3:"010";s:11:"phonenumber";s:8:"87675434";s:5:"email";s:17:"han4523845@qq.com";s:8:"password";s:9:"han123456";s:15:"passwordconfirm";s:9:"han123456";s:7:"codeval";s:7:"authnum";s:4:"code";s:34:"http://www.medincn.com/authnum.php";}', 'a:5:{s:9:"refer_url";s:0:"";s:14:"xloginPassport";s:9:"han454344";s:14:"xloginPassword";s:9:"han123456";s:7:"codeval";s:16:"xloginVerifyWord";s:4:"code";s:34:"http://www.medincn.com/authnum.php";}', 'a:24:{s:8:"es_title";a:3:{i:0;s:9:"green tea";i:1;s:3:"103";i:2;s:1:"0";}s:6:"origin";a:3:{i:0;s:5:"China";i:1;s:1:"0";i:2;s:1:"0";}s:13:"es_brand_name";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:15:"es_model_number";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"photo123";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"photo_id";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:14:"es_description";a:3:{i:0;s:130:"We provide business services, our company well in Beijing have a lot of customers, we offer many business services. This is a test";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_keyword_1";a:3:{i:0;s:5:"green";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_keyword_2";a:3:{i:0;s:3:"tea";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_keyword_3";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_keyword_4";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_keyword_5";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_keyword_6";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"es_min_order";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:7:"es_unit";a:3:{i:0;s:2:"61";i:1;s:1:"0";i:2;s:1:"0";}s:15:"es_price_cur_id";a:3:{i:0;s:1:"4";i:1;s:1:"0";i:2;s:1:"0";}s:8:"es_price";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:13:"es_price_unit";a:3:{i:0;s:2:"61";i:1;s:1:"0";i:2;s:1:"0";}s:7:"es_port";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:16:"es_delivery_time";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:17:"es_supply_ability";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:26:"es_med_supply_ability_unit";a:3:{i:0;s:2:"61";i:1;s:1:"0";i:2;s:1:"0";}s:26:"es_med_supply_ability_time";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:9:"packaging";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}}', 'xloginPassport|han454344', 'xloginPassword|han123456', 1, '贵公司域名', '网站信息完整度', '', 'http://www.medincn.com/signup.html', 'http://www.medincn.com/signin.html', 'http://www.medincn.com/sell_offers_post_cn.html', '', 1, 0, 1),
(59, 'traderextra', 'http://traderextra.com/', 'a:16:{s:16:"customer_country";s:2:"CN";s:24:"_fmu_uni-register-m__0_m";s:8:"supplier";s:13:"customer_type";s:1:"1";s:5:"title";s:2:"Mr";s:19:"customer_first_name";s:4:"xiao";s:18:"customer_last_name";s:3:"han";s:21:"customer_company_name";s:18:"hangzhoudalichukou";s:21:"customer_country_code";s:2:"86";s:18:"customer_area_code";s:3:"010";s:12:"customer_tel";s:8:"85463723";s:14:"customer_email";s:17:"3406366416@qq.com";s:8:"password";s:9:"han123456";s:4:"cpwd";s:9:"han123456";s:6:"Submit";s:17:"Create My Account";s:7:"codeval";s:5:"_code";s:4:"code";s:40:"http://traderextra.com/captcha_image.php";}', 'a:2:{s:14:"customer_email";s:17:"3406366416@qq.com";s:9:"lpassword";s:9:"han123456";}', 'a:29:{s:11:"productName";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:14:"productKeyword";a:3:{i:0;s:0:"";i:1;s:3:"204";i:2;s:1:"0";}s:5:"brand";a:3:{i:0;s:6:"reanod";i:1;s:1:"0";i:2;s:1:"0";}s:5:"model";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"type";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:13:"countryOrigin";a:3:{i:0;s:2:"CN";i:1;s:1:"0";i:2;s:1:"0";}s:11:"placeOrigin";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"prdt_desc";a:3:{i:0;s:130:"We provide business services, our company well in Beijing have a lot of customers, we offer many business services. This is a test";i:1;s:3:"108";i:2;s:1:"0";}s:10:"mattribute";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"mvalue";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"imid";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:4:"nums";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:8:"logoPath";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"minOrderQty";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"sp_unittype";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"fobCurrency";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"minFobPrice";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"maxFobPrice";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"fobUniType";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"shippingPort";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:18:"productionCapacity";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"sa_unittype";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"timePeriod";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:15:"delivaryDetails";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:16:"packagingDetails";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:12:"productGroup";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:15:"productGroupTxt";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:13:"submitProduct";a:3:{i:0;s:6:"SUBMIT";i:1;s:1:"0";i:2;s:1:"0";}s:17:"categoryHierarchy";a:3:{i:0;s:14:"1316,1377,2230";i:1;s:1:"0";i:2;s:1:"0";}}', 'customer_email|3406366416@qq.com', 'lpassword|han123456', 1, 'Congratulations', 'Product Status', '', 'http://traderextra.com/register.php', 'http://traderextra.com/login.php', 'http://traderextra.com/add-new-selling-product-details.php', '', 1, 0, 1),
(52, 'ustradeleads(注册要激活)', 'http://www.ustradeleads.com/', 'a:0:{}', 'a:6:{s:7:"sb_type";s:1:"0";s:2:"id";s:1:"0";s:11:"return_path";s:0:"";s:8:"username";s:9:"han454344";s:3:"pwd";s:9:"han123456";s:6:"submit";s:7:"Sign In";}', 'a:22:{s:8:"category";a:3:{i:0;s:15:"Food & Beverage";i:1;s:1:"0";i:2;s:1:"0";}s:4:"cats";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:8:"cid_list";a:3:{i:0;s:2:"15";i:1;s:1:"0";i:2;s:1:"0";}s:8:"sb_title";a:3:{i:0;s:10:"red closes";i:1;s:1:"0";i:2;s:1:"0";}s:14:"sb_description";a:3:{i:0;s:9:"it''s good";i:1;s:1:"0";i:2;s:1:"0";}s:11:"sb_quantity";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:11:"sb_keywords";a:3:{i:0;s:3:"red";i:1;s:1:"0";i:2;s:1:"0";}s:11:"sb_location";a:3:{i:0;s:16:"hangzhourenminlu";i:1;s:1:"0";i:2;s:1:"0";}s:12:"sb_min_order";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:15:"sb_price_cur_id";a:3:{i:0;s:1:"4";i:1;s:1:"0";i:2;s:1:"0";}s:8:"sb_price";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:20:"sb_samples_available";a:3:{i:0;s:2:"no";i:1;s:1:"0";i:2;s:1:"0";}s:17:"sb_product_status";a:3:{i:0;s:3:"New";i:1;s:1:"0";i:2;s:1:"0";}s:16:"sb_delivery_time";a:3:{i:0;s:2:"30";i:1;s:1:"0";i:2;s:1:"0";}s:9:"sb_credit";a:3:{i:0;s:3:"yes";i:1;s:1:"0";i:2;s:1:"0";}s:13:"sb_other_mode";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:16:"sb_shipping_cost";a:3:{i:0;s:3:"0.5";i:1;s:1:"0";i:2;s:1:"0";}s:7:"seo_url";a:3:{i:0;s:8:"hangzhou";i:1;s:1:"0";i:2;s:1:"0";}s:9:"seo_title";a:3:{i:0;s:6:"daxing";i:1;s:1:"0";i:2;s:1:"0";}s:11:"seo_keyword";a:3:{i:0;s:3:"red";i:1;s:1:"0";i:2;s:1:"0";}s:8:"seo_desc";a:3:{i:0;s:3:"red";i:1;s:1:"0";i:2;s:1:"0";}s:6:"submit";a:3:{i:0;s:8:"Post Now";i:1;s:1:"0";i:2;s:1:"0";}}', 'username|han454344', 'pwd|han123456', 1, 'success', 'you have successfully logged-in', 'Product Posted Successfully', ' http://www.ustradeleads.com/addmember.php', 'http://www.ustradeleads.com/login.php', 'http://www.ustradeleads.com/post_offer.php', NULL, 1, 0, 1),
(53, 'apparelkind', 'http://www.apparelkind.com/', 'a:31:{s:6:"method";s:8:"register";s:8:"language";s:2:"EN";s:10:"loginemail";s:18:"han34585392@qq.com";s:8:"password";s:9:"han123456";s:15:"confirmpassword";s:9:"han123456";s:8:"counCode";s:1:"1";s:8:"provname";s:7:"jiangsu";s:8:"cityname";s:8:"hangzhou";s:6:"dpCode";s:1:"1";s:8:"compname";s:18:"hangzhoudalichukou";s:12:"introduction";s:28:"hangzhouahangzhouadalichukou";s:7:"website";s:0:"";s:6:"mmCode";s:1:"3";s:6:"ceCode";s:1:"7";s:13:"existencetime";s:0:"";s:8:"products";s:12:"food product";s:7:"cpsCode";s:1:"M";s:13:"contactperson";s:6:"hanhan";s:18:"contactpersontitle";s:0:"";s:8:"postcode";s:6:"310000";s:13:"contactphone1";s:2:"86";s:13:"contactphone2";s:3:"010";s:13:"contactphone3";s:8:"87646324";s:11:"contactfax1";s:2:"86";s:14:"contactmobile1";s:2:"86";s:14:"contactmobile2";s:11:"13488888888";s:9:"workplace";s:16:"hangzhourenminlu";s:7:"codeval";s:12:"validatecode";s:4:"code";s:45:"http://www.apparelkind.com/validateImage.html";s:11:"contactfax2";s:3:"010";s:11:"contactfax3";s:8:"87646324";}', 'a:6:{s:7:"referer";s:0:"";s:6:"method";s:6:"signin";s:10:"loginemail";s:18:"han34585392@qq.com";s:8:"password";s:9:"han123456";s:7:"codeval";s:12:"validatecode";s:4:"code";s:45:"http://www.apparelkind.com/validateImage.html";}', 'a:9:{s:11:"productCode";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"method";a:3:{i:0;s:7:"selladd";i:1;s:1:"0";i:2;s:1:"0";}s:4:"name";a:3:{i:0;s:9:"Green tea";i:1;s:1:"0";i:2;s:1:"0";}s:9:"miniorder";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:9:"brandname";a:3:{i:0;s:4:"food";i:1;s:1:"0";i:2;s:1:"0";}s:11:"placeorigin";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:11:"modelnumber";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:11:"description";a:3:{i:0;s:19:"it''s a good product";i:1;s:1:"0";i:2;s:1:"0";}s:4:"path";a:3:{i:0;s:39:"useruploadimages/temp/1467921664296.jpg";i:1;s:1:"0";i:2;s:1:"0";}}', 'loginemail|han34585392@qq.com', 'password|han123456', 1, 'Register ok', 'front.html?method=home', 'Post selling lead successful', 'http://www.apparelkind.com/front.html', 'http://www.apparelkind.com/front.html', 'http://www.apparelkind.com/mproduct.html', '', 1, 0, 1),
(54, '中国（综合 跨国采购网）', 'http://en.globalimporter.net/', 'a:0:{}', 'a:4:{s:8:"username";s:8:"reanod01";s:8:"password";s:6:"123456";s:1:"x";s:2:"48";s:1:"y";s:2:"15";}', 'a:16:{s:7:"product";a:3:{i:0;s:0:"";i:1;s:3:"103";i:2;s:1:"0";}s:4:"tag1";a:3:{i:0;s:3:"tea";i:1;s:1:"0";i:2;s:1:"0";}s:4:"tag2";a:3:{i:0;s:0:"";i:1;s:3:"204";i:2;s:1:"0";}s:4:"tag3";a:3:{i:0;s:0:"";i:1;s:3:"208";i:2;s:1:"0";}s:5:"catid";a:3:{i:0;s:3:"537";i:1;s:1:"0";i:2;s:1:"0";}s:8:"category";a:3:{i:0;s:5:"Alkyl";i:1;s:1:"0";i:2;s:1:"0";}s:10:"PrivateCat";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:8:"Quantity";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:13:"specification";a:3:{i:0;s:17:"dramatic makeover";i:1;s:3:"110";i:2;s:1:"0";}s:6:"detail";a:3:{i:0;s:0:"";i:1;s:3:"108";i:2;s:1:"0";}s:7:"Payment";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"Port";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"PriceTerm";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:9:"MiniOrder";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:3:"pic";a:3:{i:0;s:44:"/upload10/2016-07-08/1188235105041588543.png";i:1;s:1:"0";i:2;s:1:"0";}s:6:"Submit";a:3:{i:0;s:12:"Post Product";i:1;s:1:"0";i:2;s:1:"0";}}', 'username|reanod01', 'password|123456', 1, 'success', 'Welcome reanod01', 'Product Posted Successfully', 'http://en.globalimporter.net/login.asp?cmd=login', 'http://en.globalimporter.net/login.asp?cmd=login', 'http://en.globalimporter.net/member_post2.asp', '', 1, 0, 1),
(55, 'tisunion', 'http://www.tisunion.com/', 'a:17:{s:8:"userName";s:9:"hanrilsdg";s:8:"password";s:9:"han123456";s:9:"qpassword";s:9:"han123456";s:8:"select_2";s:4:"3303";s:5:"email";s:17:"han4935345@qq.com";s:6:"seller";s:1:"1";s:15:"companyUserName";s:25:"beijingxintaishipinchukou";s:11:"companyName";s:24:"北京鑫泰食品出口";s:5:"hobby";s:12:"009005006004";s:4:"name";s:4:"xiao";s:5:"name2";s:2:"li";s:16:"phoneCountryCode";s:2:"86";s:13:"phoneAreaCode";s:3:"010";s:5:"phone";s:7:"8764632";s:3:"sex";s:1:"1";s:7:"codeval";s:12:"validateCode";s:4:"code";s:43:"http://www.tisunion.com/random/register.jpg";}', 'a:3:{s:1:"r";s:0:"";s:8:"userName";s:9:"hanrilsdg";s:6:"passwd";s:9:"han123456";}', 'a:16:{s:6:"custId";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"unitType_1";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"unitType_2";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"unitType_3";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:4:"name";a:3:{i:0;s:18:"Bussiness Services";i:1;s:3:"103";i:2;s:1:"0";}s:9:"education";a:3:{i:0;s:8:"business";i:1;s:3:"200";i:2;s:1:"0";}s:10:"occupation";a:3:{i:0;s:7:"service";i:1;s:3:"204";i:2;s:1:"0";}s:4:"unit";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:6:"street";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:21:"sysConstants_minGrade";a:3:{i:0;s:1:"3";i:1;s:1:"0";i:2;s:1:"0";}s:21:"sysConstants_maxGrade";a:3:{i:0;s:1:"4";i:1;s:1:"0";i:2;s:1:"0";}s:20:"sysConstants_visible";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;s:1:"0";}s:19:"sysConstants_status";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;s:1:"0";}s:21:"sysConstants_select_3";a:3:{i:0;s:12:"009007001007";i:1;s:1:"0";i:2;s:1:"0";}s:21:"sysConstants_select_4";a:3:{i:0;s:15:"009007001007001";i:1;s:1:"0";i:2;s:1:"0";}s:11:"description";a:3:{i:0;s:158:"We offer business services .We provide business services, our company well in Beijing have a lot of customers, we offer many business services. This is a test";i:1;s:3:"108";i:2;s:1:"0";}}', 'userName|hanrilsdg', 'passwd|han123456', 1, 'ok', 'Welcome', 'ok', 'http://www.tisunion.com/www/register.dhtml', 'http://www.tisunion.com/authenticate.dhtml', 'http://www.tisunion.com/member/save_supply.dhtml', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_release_yellow`
--

CREATE TABLE IF NOT EXISTS `cmf_release_yellow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `b2bname` varchar(255) NOT NULL COMMENT 'b2b平台名称',
  `b2burl` varchar(255) NOT NULL COMMENT 'b2b平台网址',
  `zzxzfl` char(200) NOT NULL DEFAULT '' COMMENT '选择的分类',
  `fbfl` text NOT NULL COMMENT '分类代码',
  `reginfo` text NOT NULL COMMENT '注册所需信息',
  `logininfo` text NOT NULL COMMENT '登录字段',
  `postinfo` text NOT NULL COMMENT '发布产品所需信息',
  `username` varchar(100) NOT NULL COMMENT '注册用户名',
  `password` varchar(100) NOT NULL COMMENT '注册密码',
  `ifreg` tinyint(1) DEFAULT '0' COMMENT '是否注册',
  `regsuccess` varchar(255) NOT NULL COMMENT '注册成功信息',
  `loginsuccess` varchar(255) NOT NULL COMMENT '登录成功信息',
  `postsuccess` varchar(255) DEFAULT NULL COMMENT '发布成功信息',
  `regurl` varchar(255) NOT NULL COMMENT '注册地址',
  `loginurl` varchar(255) NOT NULL COMMENT '登录地址',
  `posturl` varchar(255) NOT NULL COMMENT '发布地址',
  `preposturl` varchar(255) DEFAULT NULL COMMENT '发布页面，有隐藏字段时需要填写',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可编辑 1-可 0-不可',
  `ifhide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有隐藏字段 1-有 0-没有',
  `is_auto_enrollment` tinyint(1) DEFAULT '0' COMMENT '是否自动注册（0：是，1：不是）',
  `regorpost` tinyint(1) DEFAULT '0' COMMENT '是否用注册 1-用 2-不用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `cmf_release_yellow`
--

INSERT INTO `cmf_release_yellow` (`id`, `b2bname`, `b2burl`, `zzxzfl`, `fbfl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `postsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide`, `is_auto_enrollment`, `regorpost`) VALUES
(1, '1websdirectory', 'http://www.1websdirectory.com', '', '', 'a:0:{}', 'a:0:{}', 'a:8:{s:10:"categ_name";a:3:{i:0;s:22:"Home >> Arts >> Crafts";i:1;s:1:"0";i:2;N;}s:9:"link_name";a:3:{i:0;s:10:"crafts.htm";i:1;s:1:"0";i:2;N;}s:8:"categ_cd";a:3:{i:0;s:3:"106";i:1;s:1:"0";i:2;N;}s:10:"site_title";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:8:"site_url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:9:"email_add";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:9:"site_desc";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:4:"paid";a:3:{i:0;s:1:"N";i:1;s:1:"0";i:2;N;}}', '|', '|', 1, '', '', '', '', '', 'http://www.1websdirectory.com/add_data.aspx', '', 1, 0, 0, 2);
INSERT INTO `cmf_release_yellow` (`id`, `b2bname`, `b2burl`, `zzxzfl`, `fbfl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `postsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide`, `is_auto_enrollment`, `regorpost`) VALUES
(2, 'www.4169.info', 'http://www.4169.info/', '430', '&lt;option label=&quot;[Top]&quot; value=&quot;0&quot; selected=&quot;selected&quot;&gt;[Top]&lt;/option&gt;\r\n&lt;option label=&quot;|___Arts &amp;amp; Humanities&quot; value=&quot;1&quot;&gt;|___Arts &amp;amp; Humanities&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Art History&quot; value=&quot;2&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Art History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Art Weblogs&quot; value=&quot;3&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Art Weblogs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Artists&quot; value=&quot;4&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Artists&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Awards&quot; value=&quot;5&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Awards&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Booksellers&quot; value=&quot;6&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Booksellers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Censorship&quot; value=&quot;7&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Censorship&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chats and Forums&quot; value=&quot;8&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chats and Forums&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Crafts&quot; value=&quot;9&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Crafts&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Criticism and Theory&quot; value=&quot;10&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Criticism and Theory&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cultural Policy&quot; value=&quot;11&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cultural Policy&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cultures and Groups&quot; value=&quot;12&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cultures and Groups&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design Arts&quot; value=&quot;13&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design Arts&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Education&quot; value=&quot;14&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Education&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Events&quot; value=&quot;15&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Events&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Humanities&quot; value=&quot;16&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Humanities&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Institutes&quot; value=&quot;17&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Institutes&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Job and Employment Resources&quot; value=&quot;18&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Job and Employment Resources&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Local History&quot; value=&quot;26&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Local History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Museums, Galleries, and Centers&quot; value=&quot;19&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Museums, Galleries, and Centers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News and Media&quot; value=&quot;20&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News and Media&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&quot; value=&quot;21&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Performing Arts&quot; value=&quot;22&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Performing Arts&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Photography&quot; value=&quot;641&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Photography&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Reference&quot; value=&quot;23&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Reference&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shopping and Services&quot; value=&quot;24&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shopping and Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Visual Arts&quot; value=&quot;25&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Visual Arts&lt;/option&gt;\r\n&lt;option label=&quot;|___Blogs&quot; value=&quot;419&quot;&gt;|___Blogs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Blog Hosting&quot; value=&quot;550&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Blog Hosting&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&quot; value=&quot;420&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computer&quot; value=&quot;429&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computer&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Eclectic&quot; value=&quot;425&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Eclectic&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Education&quot; value=&quot;421&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Education&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Home and Garden&quot; value=&quot;692&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Home and Garden&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet&quot; value=&quot;430&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Law&quot; value=&quot;426&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Law&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Library&quot; value=&quot;422&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Library&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Making Money&quot; value=&quot;691&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Making Money&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Money&quot; value=&quot;466&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Money&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Music&quot; value=&quot;664&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Music&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News&quot; value=&quot;431&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Personal&quot; value=&quot;427&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Personal&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Politics&quot; value=&quot;423&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Politics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Science&quot; value=&quot;424&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Science&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Technology&quot; value=&quot;428&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Technology&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster&quot; value=&quot;467&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster&lt;/option&gt;\r\n&lt;option label=&quot;|___Business &amp;amp; Economy&quot; value=&quot;27&quot;&gt;|___Business &amp;amp; Economy&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Affiliate Schemes&quot; value=&quot;518&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Affiliate Schemes&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Buildings and Factories&quot; value=&quot;519&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Buildings and Factories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Libraries&quot; value=&quot;29&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Libraries&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Resources&quot; value=&quot;28&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Resources&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Schools&quot; value=&quot;30&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Schools&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Training&quot; value=&quot;36&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Training&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Charity&quot; value=&quot;665&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Charity&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chats and Forums&quot; value=&quot;31&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chats and Forums&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chemical Services and Supplies&quot; value=&quot;590&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chemical Services and Supplies&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Classifieds&quot; value=&quot;32&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Classifieds&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Consultancy&quot; value=&quot;463&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Consultancy&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cooperatives&quot; value=&quot;33&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cooperatives&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directories of Services&quot; value=&quot;34&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directories of Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Economics&quot; value=&quot;35&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Economics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Employment and Work&quot; value=&quot;37&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Employment and Work&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Agencies&quot; value=&quot;688&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Agencies&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Ethics and Responsibility&quot; value=&quot;38&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Ethics and Responsibility&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance and Investment&quot; value=&quot;39&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance and Investment&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Debt Advice&quot; value=&quot;517&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Debt Advice&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Insurance&quot; value=&quot;514&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Insurance&quot; value=&quot;671&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Car and Motorcycle Insurance&quot; value=&quot;669&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Car and Motorcycle Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Home Insurance&quot; value=&quot;670&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Home Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Insurance Brokers&quot; value=&quot;652&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Insurance Brokers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Life Insurance&quot; value=&quot;673&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Life Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Other Insurance&quot; value=&quot;672&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Other Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Loans&quot; value=&quot;516&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Loans&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mortgages&quot; value=&quot;515&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mortgages&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Payment Systems&quot; value=&quot;645&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Payment Systems&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Stocks and Shares&quot; value=&quot;686&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Stocks and Shares&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Global Economy&quot; value=&quot;40&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Global Economy&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&quot; value=&quot;41&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___ID cards&quot; value=&quot;522&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___ID cards&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Industrial Equipment&quot; value=&quot;589&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Industrial Equipment&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Intellectual Property&quot; value=&quot;42&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Intellectual Property&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Labor&quot; value=&quot;43&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Labor&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Law&quot; value=&quot;44&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Law&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Marketing and Advertising&quot; value=&quot;45&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Marketing and Advertising&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News and Media&quot; value=&quot;46&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News and Media&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Opportunities&quot; value=&quot;462&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Opportunities&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&quot; value=&quot;47&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Publishing Industries&quot; value=&quot;418&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Publishing Industries&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Books&quot; value=&quot;628&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Books&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Cards&quot; value=&quot;630&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business Cards&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Flyers&quot; value=&quot;631&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Flyers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Merchandise&quot; value=&quot;629&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Merchandise&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Real Estate &amp;amp; Property&quot; value=&quot;456&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Real Estate &amp;amp; Property&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___For Sale&quot; value=&quot;540&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___For Sale&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Removal Services&quot; value=&quot;650&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Removal Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Rental Properties&quot; value=&quot;539&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Rental Properties&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Retail Equipment&quot; value=&quot;524&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Retail Equipment&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security&quot; value=&quot;464&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___CCTV&quot; value=&quot;569&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___CCTV&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Private Investigation&quot; value=&quot;570&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Private Investigation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Surveillance&quot; value=&quot;571&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Surveillance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Services&quot; value=&quot;503&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Building and Construction&quot; value=&quot;505&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Building and Construction&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Catering and Food&quot; value=&quot;690&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Catering and Food&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cleaning&quot; value=&quot;504&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cleaning&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Financial&quot; value=&quot;675&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Financial&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Outsourcing&quot; value=&quot;676&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Outsourcing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Translation&quot; value=&quot;582&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Translation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video Editing&quot; value=&quot;656&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video Editing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Storage&quot; value=&quot;520&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Storage&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Taxes&quot; value=&quot;48&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Taxes&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Trade&quot; value=&quot;49&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Trade&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Trade Shows&quot; value=&quot;619&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Trade Shows&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Transportation&quot; value=&quot;50&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Transportation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Uniforms and Clothing&quot; value=&quot;523&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Uniforms and Clothing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Work At Home&quot; value=&quot;461&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Work At Home&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Surveys&quot; value=&quot;575&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Surveys&lt;/option&gt;\r\n&lt;option label=&quot;|___Computers &amp;amp; Internet&quot; value=&quot;51&quot;&gt;|___Computers &amp;amp; Internet&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Anti-Spyware&quot; value=&quot;542&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Anti-Spyware&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Anti-Virus&quot; value=&quot;541&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Anti-Virus&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Article Directories&quot; value=&quot;498&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Article Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&quot; value=&quot;534&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance&quot; value=&quot;500&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___General&quot; value=&quot;499&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___General&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Health&quot; value=&quot;501&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Health&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Property&quot; value=&quot;535&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Property&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sport&quot; value=&quot;612&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sport&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Submission Services&quot; value=&quot;586&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Submission Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Technology&quot; value=&quot;533&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Technology&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmastering&quot; value=&quot;502&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmastering&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Communications and Networking&quot; value=&quot;52&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Communications and Networking&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computer Generated Music&quot; value=&quot;53&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computer Generated Music&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computer Science&quot; value=&quot;54&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computer Science&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computers and Technology Weblogs&quot; value=&quot;55&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computers and Technology Weblogs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Contests&quot; value=&quot;56&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Contests&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Conventions and Trade Shows&quot; value=&quot;57&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Conventions and Trade Shows&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Countries, Cultures, and Groups&quot; value=&quot;58&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Countries, Cultures, and Groups&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cyberculture&quot; value=&quot;59&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cyberculture&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Data Backup&quot; value=&quot;595&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Data Backup&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Data Formats&quot; value=&quot;60&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Data Formats&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design and Development&quot; value=&quot;411&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design and Development&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design Services&quot; value=&quot;532&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Desktop Customization&quot; value=&quot;61&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Desktop Customization&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Desktop Publishing&quot; value=&quot;62&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Desktop Publishing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Dictionaries&quot; value=&quot;63&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Dictionaries&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Discussion Forums&quot; value=&quot;555&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Discussion Forums&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Art&quot; value=&quot;695&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Art&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Automotive&quot; value=&quot;576&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Automotive&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Beauty&quot; value=&quot;561&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Beauty&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computers&quot; value=&quot;565&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Computers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design&quot; value=&quot;560&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Electronics&quot; value=&quot;566&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Electronics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance&quot; value=&quot;558&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gambling&quot; value=&quot;633&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gambling&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gaming&quot; value=&quot;632&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gaming&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&quot; value=&quot;694&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Home &amp;amp; Garden&quot; value=&quot;562&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Home &amp;amp; Garden&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mobile Phones&quot; value=&quot;564&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mobile Phones&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Movies&quot; value=&quot;559&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Movies&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Music&quot; value=&quot;625&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Music&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shopping&quot; value=&quot;563&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shopping&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sport&quot; value=&quot;618&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sport&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Teens and Young Adults&quot; value=&quot;693&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Teens and Young Adults&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___TV&quot; value=&quot;666&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___TV&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster&quot; value=&quot;557&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Domain Names&quot; value=&quot;412&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Domain Names&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Ebooks and Tutorials&quot; value=&quot;376&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Ebooks and Tutorials&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Employment&quot; value=&quot;64&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Employment&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Ethics&quot; value=&quot;65&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Ethics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___File Hosting&quot; value=&quot;492&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___File Hosting&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Forensics&quot; value=&quot;66&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Forensics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Games&quot; value=&quot;67&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Games&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Graphics&quot; value=&quot;68&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Graphics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Hardware&quot; value=&quot;69&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Hardware&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&quot; value=&quot;70&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Humor&quot; value=&quot;71&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Humor&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Image Hosting&quot; value=&quot;491&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Image Hosting&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Industry Information&quot; value=&quot;72&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Industry Information&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Information Technology&quot; value=&quot;73&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Information Technology&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet&quot; value=&quot;74&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Issues&quot; value=&quot;75&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Issues&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Macintosh&quot; value=&quot;76&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Macintosh&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Magazines&quot; value=&quot;77&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Magazines&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mobile Computing&quot; value=&quot;78&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mobile Computing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Multimedia&quot; value=&quot;79&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Multimedia&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News and Media&quot; value=&quot;80&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News and Media&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Operating Systems&quot; value=&quot;81&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Operating Systems&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&quot; value=&quot;82&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___People&quot; value=&quot;83&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___People&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Personal Digital Assistants (PDAs)&quot; value=&quot;85&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Personal Digital Assistants (PDAs)&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Podcasts&quot; value=&quot;687&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Podcasts&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Printers&quot; value=&quot;643&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Printers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Product Information and Reviews&quot; value=&quot;84&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Product Information and Reviews&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Programming and Development&quot; value=&quot;86&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Programming and Development&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Script Services&quot; value=&quot;536&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Script Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Search Engine Optimization&quot; value=&quot;414&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Search Engine Optimization&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security and Encryption&quot; value=&quot;87&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security and Encryption&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Service Providers (ISP)&quot; value=&quot;415&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Service Providers (ISP)&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software&quot; value=&quot;88&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Adware&quot; value=&quot;640&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Adware&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Audio&quot; value=&quot;600&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Audio&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&quot; value=&quot;605&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Calendar&quot; value=&quot;606&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Calendar&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Collaboration&quot; value=&quot;662&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Collaboration&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Databases&quot; value=&quot;602&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Databases&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design&quot; value=&quot;598&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Design&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___eCommerce&quot; value=&quot;597&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___eCommerce&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Email&quot; value=&quot;607&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Email&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance&quot; value=&quot;615&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Finance&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Music&quot; value=&quot;601&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Music&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Networking&quot; value=&quot;621&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Networking&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Privacy&quot; value=&quot;614&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Privacy&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security&quot; value=&quot;596&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software Testing&quot; value=&quot;556&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software Testing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Tools&quot; value=&quot;620&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Tools&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video&quot; value=&quot;599&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Browsers&quot; value=&quot;608&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Browsers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Standards&quot; value=&quot;89&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Standards&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Supercomputing and Parallel Computing&quot; value=&quot;90&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Supercomputing and Parallel Computing&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Technical Guides and Support&quot; value=&quot;91&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Technical Guides and Support&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Telecommunications&quot; value=&quot;92&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Telecommunications&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Templates&quot; value=&quot;475&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Templates&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Tools &amp;amp; Resources&quot; value=&quot;416&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Tools &amp;amp; Resources&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Training&quot; value=&quot;93&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Training&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Certification Preparation&quot; value=&quot;94&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Certification Preparation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Communications and Networking&quot; value=&quot;95&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Communications and Networking&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Databases&quot; value=&quot;96&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Databases&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Electronics&quot; value=&quot;97&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Electronics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet and Web Skills&quot; value=&quot;98&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet and Web Skills&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Multimedia&quot; value=&quot;99&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Multimedia&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sales Force Automation&quot; value=&quot;100&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sales Force Automation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___URL Services&quot; value=&quot;624&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___URL Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___User Groups&quot; value=&quot;102&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___User Groups&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video Hosting&quot; value=&quot;584&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video Hosting&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Virtual Reality&quot; value=&quot;103&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Virtual Reality&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Directories&quot; value=&quot;101&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directories of Directories&quot; value=&quot;460&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directories of Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directory Blogs&quot; value=&quot;587&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directory Blogs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directory Templates&quot; value=&quot;651&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Directory Templates&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Free and Paid Directories&quot; value=&quot;703&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Free and Paid Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Free Directories&quot; value=&quot;459&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Free Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Niche Directories&quot; value=&quot;457&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Niche Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Animals&quot; value=&quot;573&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Animals&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&quot; value=&quot;468&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Dating&quot; value=&quot;613&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Dating&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gifts&quot; value=&quot;610&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gifts&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Health&quot; value=&quot;538&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Health&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet&quot; value=&quot;611&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Internet&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mobile Phones&quot; value=&quot;490&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mobile Phones&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News&quot; value=&quot;574&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___News&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Property&quot; value=&quot;531&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Property&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Regional&quot; value=&quot;635&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Regional&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security&quot; value=&quot;471&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Services&quot; value=&quot;489&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shopping&quot; value=&quot;469&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shopping&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software&quot; value=&quot;537&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sport&quot; value=&quot;604&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Sport&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Templates&quot; value=&quot;474&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Templates&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Travel&quot; value=&quot;470&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Travel&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster&quot; value=&quot;473&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Paid Directories&quot; value=&quot;458&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Paid Directories&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Submission Services&quot; value=&quot;588&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Submission Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Hosting&quot; value=&quot;417&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Hosting&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster Resources&quot; value=&quot;410&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Webmaster Resources&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Forum Posting Services&quot; value=&quot;634&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Forum Posting Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Guides&quot; value=&quot;413&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Guides&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Link Building&quot; value=&quot;622&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Link Building&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Traffic Exchange&quot; value=&quot;623&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Traffic Exchange&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___World Wide Web&quot; value=&quot;104&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___World Wide Web&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___ActiveX&quot; value=&quot;105&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___ActiveX&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Beginner''s Guides&quot; value=&quot;106&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Beginner''s Guides&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Books&quot; value=&quot;107&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Books&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Browsers&quot; value=&quot;108&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Browsers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Caching&quot; value=&quot;109&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Caching&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chat&quot; value=&quot;110&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chat&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Conferences and Events&quot; value=&quot;111&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Conferences and Events&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cookies&quot; value=&quot;112&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Cookies&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Databases and Searching&quot; value=&quot;113&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Databases and Searching&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Deep Web&quot; value=&quot;114&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Deep Web&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Domain Name Registration&quot; value=&quot;115&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Domain Name Registration&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Evaluation&quot; value=&quot;116&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Evaluation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___FAQs&quot; value=&quot;117&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___FAQs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Forums&quot; value=&quot;118&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Forums&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gateways&quot; value=&quot;119&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gateways&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&quot; value=&quot;120&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___HTML&quot; value=&quot;121&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___HTML&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___HTTP&quot; value=&quot;122&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___HTTP&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Imagemaps&quot; value=&quot;123&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Imagemaps&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___JavaScript&quot; value=&quot;124&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___JavaScript&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Magazines&quot; value=&quot;125&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Magazines&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&quot; value=&quot;126&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizations&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Portals&quot; value=&quot;127&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Portals&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Programming&quot; value=&quot;128&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Programming&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Proxy&quot; value=&quot;705&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Proxy&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Searching the Web&quot; value=&quot;129&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Searching the Web&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security and Encryption&quot; value=&quot;130&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Security and Encryption&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Semantic Web&quot; value=&quot;131&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Semantic Web&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Servers&quot; value=&quot;132&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Servers&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Site Announcement and Promotion&quot; value=&quot;133&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Site Announcement and Promotion&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Site Development&quot; value=&quot;134&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Site Development&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software&quot; value=&quot;135&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Software&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Statistics and Demographics&quot; value=&quot;136&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Statistics and Demographics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___URLs - Uniform Resource Locators&quot; value=&quot;137&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___URLs - Uniform Resource Locators&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Usenet&quot; value=&quot;138&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Usenet&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Services&quot; value=&quot;139&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Web Services&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Weblogs&quot; value=&quot;140&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Weblogs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___XML&quot; value=&quot;141&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___XML&lt;/option&gt;\r\n&lt;option label=&quot;|___Education&quot; value=&quot;142&quot;&gt;|___Education&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Academic Competitions&quot; value=&quot;143&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Academic Competitions&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Bibliographies&quot; value=&quot;144&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Bibliographies&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business to Business&quot; value=&quot;146&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Business to Business&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Career and Vocational&quot; value=&quot;147&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Career and Vocational&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chats and Forums&quot; value=&quot;148&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Chats and Forums&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Conferences&quot; value=&quot;149&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Conferences&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Correctional&quot; value=&quot;150&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Correctional&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Disabilities&quot; value=&quot;151&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Disabilities&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Driving Schools&quot; value=&quot;661&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Driving Schools&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Early Childhood Education&quot; value=&quot;152&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Early Childhood Education&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Education Weblogs&quot; value=&quot;153&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Education Weblogs&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Equity&quot; value=&quot;154&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Equity&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Financial Aid&quot; value=&quot;155&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Financial Aid&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Government Agencies&quot; value=&quot;156&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Government Agencies&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Graduation&quot; value=&quot;157&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Graduation&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&quot; value=&quot;158&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___History&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Instructional Technology&quot; value=&quot;159&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Instructional Technology&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Job and Employment Resources&quot; value=&quot;160&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Job and Employment Resources&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp', 'a:0:{}', 'a:0:{}', 'a:10:{s:9:"LINK_TYPE";a:3:{i:0;s:6:"normal";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:10:"OWNER_NAME";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:11:"OWNER_EMAIL";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:6:"zccate";i:1;s:1:"0";i:2;N;}s:6:"submit";a:3:{i:0;s:8:"Continue";i:1;s:1:"0";i:2;N;}s:9:"RECPR_URL";a:3:{i:0;s:0:"";i:1;s:1:"0";i:2;s:1:"0";}s:10:"RECPR_TEXT";a:3:{i:0;s:8:"<a href=";i:1;s:1:"0";i:2;s:1:"0";}}', '|', '|', 0, '', '', '', '', '', 'http://www.4169.info/submit.php', '', 1, 0, 0, 2);
INSERT INTO `cmf_release_yellow` (`id`, `b2bname`, `b2burl`, `zzxzfl`, `fbfl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `postsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide`, `is_auto_enrollment`, `regorpost`) VALUES
(3, 'www.aaf14.org', 'http://www.aaf14.org', '19', '&lt;option label=&quot;|___Arts&quot; value=&quot;11&quot;&gt;|___Arts&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Magazines&quot; value=&quot;21&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Magazines&lt;/option&gt;\r\n&lt;option label=&quot;|___Automotive&quot; value=&quot;5&quot;&gt;|___Automotive&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Insurance&quot; value=&quot;16&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Insurance&lt;/option&gt;\r\n&lt;option label=&quot;|___Computer&quot; value=&quot;9&quot;&gt;|___Computer&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___SEO&quot; value=&quot;19&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___SEO&lt;/option&gt;\r\n&lt;option label=&quot;|___Economics&quot; value=&quot;10&quot;&gt;|___Economics&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mortgages&quot; value=&quot;26&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Mortgages&lt;/option&gt;\r\n&lt;option label=&quot;|___Education&quot; value=&quot;2&quot;&gt;|___Education&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Resources&quot; value=&quot;25&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Resources&lt;/option&gt;\r\n&lt;option label=&quot;|___Entertainment&quot; value=&quot;4&quot;&gt;|___Entertainment&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Television&quot; value=&quot;20&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Television&lt;/option&gt;\r\n&lt;option label=&quot;|___Games&quot; value=&quot;13&quot;&gt;|___Games&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Arcade&quot; value=&quot;31&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Arcade&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video&quot; value=&quot;22&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Video&lt;/option&gt;\r\n&lt;option label=&quot;|___Health&quot; value=&quot;3&quot;&gt;|___Health&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Medicine&quot; value=&quot;27&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Medicine&lt;/option&gt;\r\n&lt;option label=&quot;|___Home &amp;amp; Garden&quot; value=&quot;14&quot;&gt;|___Home &amp;amp; Garden&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Decorating&quot; value=&quot;36&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Decorating&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gardening&quot; value=&quot;28&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Gardening&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Moving&quot; value=&quot;35&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Moving&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizing&quot; value=&quot;34&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Organizing&lt;/option&gt;\r\n&lt;option label=&quot;|___News&quot; value=&quot;12&quot;&gt;|___News&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Weather&quot; value=&quot;29&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Weather&lt;/option&gt;\r\n&lt;option label=&quot;|___People&quot; value=&quot;7&quot;&gt;|___People&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Help &amp;amp; Advice&quot; value=&quot;32&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Help &amp;amp; Advice&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Marriage&quot; value=&quot;18&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Marriage&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Singles&quot; value=&quot;17&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Singles&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Weddings&quot; value=&quot;33&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Weddings&lt;/option&gt;\r\n&lt;option label=&quot;|___Shopping&quot; value=&quot;8&quot;&gt;|___Shopping&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Jewelry&quot; value=&quot;23&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Jewelry&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shoes&quot; value=&quot;24&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Shoes&lt;/option&gt;\r\n&lt;option label=&quot;|___Sports&quot; value=&quot;1&quot;&gt;|___Sports&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Basketball&quot; value=&quot;15&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Basketball&lt;/option&gt;\r\n&lt;option label=&quot;|___Travel&quot; value=&quot;6&quot;&gt;|___Travel&lt;/option&gt;\r\n&lt;option label=&quot;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Accomodations&quot; value=&quot;30&quot;&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;|___Accomodations&lt;/option&gt;', 'a:0:{}', 'a:0:{}', 'a:8:{s:9:"LINK_TYPE";a:3:{i:0;s:6:"normal";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:10:"OWNER_NAME";a:3:{i:0;s:4:"zctt";i:1;s:1:"0";i:2;N;}s:11:"OWNER_EMAIL";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:6:"zccate";i:1;s:1:"0";i:2;N;}s:6:"submit";a:3:{i:0;s:8:"Continue";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.aaf14.org/submit.php', '', 1, 0, 0, 2),
(4, 'www.activesearchresults.com', 'http://www.activesearchresults.com', '', '', 'a:0:{}', 'a:0:{}', 'a:3:{s:3:"url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:5:"email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:9:"submiturl";a:3:{i:0;s:6:"Submit";i:1;s:1:"0";i:2;s:1:"0";}}', '|', '|', 0, '', '', '', '', '', 'http://www.activesearchresults.com/addwebsite.php', '', 1, 0, 0, 2),
(5, 'boitho.com', 'http://boitho.com', '', '', 'a:0:{}', 'a:0:{}', 'a:2:{s:3:"url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:5:"email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://boitho.com/cgi-bin/add_url_html.cgi', '', 1, 0, 0, 2),
(6, 'www.amidalla.de', 'http://www.amidalla.de', '', '', 'a:0:{}', 'a:0:{}', 'a:1:{s:6:"addurl";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.amidalla.de/cgi-bin/amiadd.cgi?add', '', 1, 0, 0, 2),
(7, 'www.amidalla.de', 'http://www.amidalla.de/', '', '', 'a:0:{}', 'a:0:{}', 'a:4:{s:2:"wu";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:2:"wt";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:5:"ddc[]";a:3:{i:0;s:9:"Education";i:1;s:1:"0";i:2;N;}s:2:"wd";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.amidalla.de/directory/amidalla_directory.php?ac=new', '', 1, 0, 0, 2),
(8, 'www.axxasearch.com', 'http://www.axxasearch.com', '', '', 'a:0:{}', 'a:0:{}', 'a:2:{s:12:"required-www";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:14:"required-email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.axxasearch.com/add_url2.cgi', '', 1, 0, 0, 2),
(9, 'www.edom.co.uk', 'http://www.edom.co.uk', '', '', 'a:0:{}', 'a:0:{}', 'a:8:{s:9:"LINK_TYPE";a:3:{i:0;s:6:"normal";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:10:"OWNER_NAME";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:11:"OWNER_EMAIL";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:3:"146";i:1;s:1:"0";i:2;N;}s:6:"submit";a:3:{i:0;s:8:"Continue";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.edom.co.uk/directory/submit.php', '', 1, 0, 0, 2),
(11, 'www.idofind.com', 'http://www.idofind.com', '', '', 'a:0:{}', 'a:0:{}', 'a:2:{s:8:"yourlink";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:9:"youremail";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.idofind.com/addurl/add.php', '', 1, 0, 0, 2),
(12, 'www.informationcrawler.com', 'http://www.informationcrawler.com/', '', '', 'a:0:{}', 'a:0:{}', 'a:11:{s:9:"LINK_TYPE";a:3:{i:0;s:1:"2";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:2:"27";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:13:"META_KEYWORDS";a:3:{i:0;s:4:"zckw";i:1;s:1:"0";i:2;N;}s:16:"META_DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:22:"META_DESCRIPTION_limit";a:3:{i:0;s:3:"225";i:1;s:1:"0";i:2;N;}s:10:"AGREERULES";a:3:{i:0;s:2:"on";i:1;s:1:"0";i:2;N;}s:8:"continue";a:3:{i:0;s:11:"Please Wait";i:1;s:1:"0";i:2;N;}s:13:"formSubmitted";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.informationcrawler.com/submit.php?LINK_TYPE=2', '', 1, 0, 0, 2),
(13, 'www.infotiger.com', 'http://www.infotiger.com', '', '', 'a:0:{}', 'a:0:{}', 'a:3:{s:5:"optin";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}s:3:"url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:5:"email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.infotiger.com/addurl.html', '', 1, 0, 0, 2),
(14, 'www.intelseek.com', 'http://www.intelseek.com', '', '', 'a:0:{}', 'a:0:{}', 'a:5:{s:5:"email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:5:"title";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:8:"keywords";a:3:{i:0;s:4:"zckw";i:1;s:1:"0";i:2;N;}s:11:"description";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.intelseek.com/add_URL.asp', '', 1, 0, 0, 2),
(15, 'www.linkdir.info', 'http://www.linkdir.info', '', '', 'a:0:{}', 'a:0:{}', 'a:5:{s:3:"url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:5:"title";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:11:"description";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:8:"keywords";a:3:{i:0;s:4:"zckw";i:1;s:1:"0";i:2;N;}s:1:"c";a:3:{i:0;s:2:"18";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.linkdir.info/add_url.php', '', 1, 0, 0, 2),
(16, 'www.mygreencorner.com', 'http://www.mygreencorner.com', '', '', 'a:0:{}', 'a:0:{}', 'a:11:{s:9:"LINK_TYPE";a:3:{i:0;s:6:"normal";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:9:"thistitlf";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:24:"http://www.reanod123.com";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:8:"sdfsffff";i:1;s:1:"0";i:2;N;}s:13:"META_KEYWORDS";a:3:{i:0;s:5:"akibg";i:1;s:1:"0";i:2;N;}s:16:"META_DESCRIPTION";a:3:{i:0;s:9:"sdfsdfsdf";i:1;s:1:"0";i:2;N;}s:10:"OWNER_NAME";a:3:{i:0;s:9:"baiyakibg";i:1;s:1:"0";i:2;N;}s:11:"OWNER_EMAIL";a:3:{i:0;s:13:"1ddf3@126.com";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:1:"2";i:1;s:1:"0";i:2;N;}s:5:"agree";a:3:{i:0;s:1:"0";i:1;s:1:"0";i:2;N;}s:6:"submit";a:3:{i:0;s:8:"Continue";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.mygreencorner.com/submit.php', '', 1, 0, 0, 2),
(17, 'www.scrubtheweb.com', 'http://www.scrubtheweb.com', '', '', 'a:0:{}', 'a:0:{}', 'a:2:{s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:5:"Email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.scrubtheweb.com/cgi-bin/addurl.cgi', '', 1, 0, 0, 2),
(25, 'www.textlinkdirectory.com', 'http://www.textlinkdirectory.com/', '', '', 'a:0:{}', 'a:0:{}', 'a:6:{s:8:"linkType";a:3:{i:0;s:4:"free";i:1;s:1:"0";i:2;N;}s:5:"title";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"url";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"description";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:8:"keywords";a:3:{i:0;s:4:"zckw";i:1;s:1:"0";i:2;N;}s:5:"email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.textlinkdirectory.com/index.php?go=addpage&amp;catid=45', '', 1, 0, 0, 2),
(20, 'viesearch.com', 'http://viesearch.com', '', '', 'a:0:{}', 'a:0:{}', 'a:7:{s:10:"OWNER_NAME";a:3:{i:0;s:4:"zctt";i:1;s:1:"0";i:2;N;}s:11:"OWNER_EMAIL";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}s:9:"LINK_TYPE";a:3:{i:0;s:6:"normal";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://viesearch.com/submit', '', 1, 0, 0, 2),
(21, 'websquash.com', 'http://websquash.com', '', '', 'a:0:{}', 'a:0:{}', 'a:5:{s:4:"Mode";a:3:{i:0;s:7:"AnonAdd";i:1;s:1:"0";i:2;N;}s:8:"b_submit";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}s:5:"Realm";a:3:{i:0;s:8:"Internet";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:5:"EMAIL";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://websquash.com/cgi-bin/search/search.pl', '', 1, 0, 0, 2),
(22, 'zoohoo.sk', 'http://zoohoo.sk', '', '', 'a:0:{}', 'a:0:{}', 'a:1:{s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://zoohoo.sk/add_document.php', '', 1, 0, 0, 2),
(23, 'www.agrieducation.org', 'http://www.agrieducation.org', '', '', 'a:0:{}', 'a:0:{}', 'a:8:{s:9:"LINK_TYPE";a:3:{i:0;s:6:"normal";i:1;s:1:"0";i:2;N;}s:5:"TITLE";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:11:"DESCRIPTION";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:10:"OWNER_NAME";a:3:{i:0;s:4:"zctt";i:1;s:1:"0";i:2;N;}s:11:"OWNER_EMAIL";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:11:"CATEGORY_ID";a:3:{i:0;s:1:"1";i:1;s:1:"0";i:2;N;}s:6:"submit";a:3:{i:0;s:8:"Continue";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.agrieducation.org/submit.php', '', 1, 0, 0, 2),
(24, 'www.officialsearch.com', 'http://www.officialsearch.com', '', '', 'a:0:{}', 'a:0:{}', 'a:7:{s:3:"URL";a:3:{i:0;s:5:"zcurl";i:1;s:1:"0";i:2;N;}s:4:"desc";a:3:{i:0;s:6:"zcdesc";i:1;s:1:"0";i:2;N;}s:4:"keyw";a:3:{i:0;s:4:"zckw";i:1;s:1:"0";i:2;N;}s:5:"affil";a:3:{i:0;s:24:"I am a fan of this site.";i:1;s:1:"0";i:2;N;}s:4:"name";a:3:{i:0;s:7:"zctitle";i:1;s:1:"0";i:2;N;}s:5:"email";a:3:{i:0;s:7:"zcemail";i:1;s:1:"0";i:2;N;}s:7:"success";a:3:{i:0;s:37:"http://officialsearch.com/thank1.html";i:1;s:1:"0";i:2;N;}}', '|', '|', 0, '', '', '', '', '', 'http://www.officialsearch.com/cgi-bin/submit.cgi', '', 1, 0, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_reminder`
--

CREATE TABLE IF NOT EXISTS `cmf_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1-服务器  2-域名',
  `endtime` int(11) NOT NULL COMMENT '到期时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `btime` int(11) NOT NULL COMMENT '开始提醒时间',
  `content` text NOT NULL COMMENT '描述',
  `rday` int(11) NOT NULL COMMENT '提前提醒天数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未过期  1-已过期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `cmf_reminder`
--

INSERT INTO `cmf_reminder` (`id`, `type`, `endtime`, `addtime`, `btime`, `content`, `rday`, `status`) VALUES
(2, 1, 1467993600, 1466666170, 1466992433, '人人人人人人人', 4, 1),
(4, 2, 1479488461, 1466666241, 1470931200, '马上到期啦', 7, 0),
(5, 2, 1467993600, 1466666273, 1467388800, '到期了啊啊', 7, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_report_comment`
--

CREATE TABLE IF NOT EXISTS `cmf_report_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `title` varchar(255) NOT NULL COMMENT '评论标题',
  `text` text NOT NULL COMMENT '评论内容',
  `uid` int(11) NOT NULL COMMENT '添加用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_report_comment`
--

INSERT INTO `cmf_report_comment` (`id`, `addtime`, `title`, `text`, `uid`) VALUES
(1, 1466145742, '是订饭它它', '<p>对方的回复给回复个韩国进口款</p>', 1),
(2, 1466147421, '阿斯顿发斯蒂芬', '<p>阿萨德法师打发斯蒂芬</p>', 1),
(3, 1466147557, '阿斯顿发斯蒂芬', '<p>阿萨德法师打发斯蒂芬柔柔弱弱</p><p><br/></p><p>阿斯蒂芬</p><p><br/></p><p><strong>ffz</strong><br/></p>', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role`
--

CREATE TABLE IF NOT EXISTS `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  `admin_main_index` varchar(200) NOT NULL DEFAULT 'index' COMMENT '后台首页页面',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `cmf_role`
--

INSERT INTO `cmf_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`, `admin_main_index`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0, 'main_boss'),
(2, '编辑', 0, 1, '管理产品', 1463387819, 1477883486, 0, 'main_yxtj'),
(3, '文章管理', 0, 1, '文章管理', 1465713522, 0, 0, 'index'),
(4, '业务经理', NULL, 1, 'CRM业务经理', 1468916092, 1477300610, 0, 'main_manager'),
(5, '业务员', NULL, 1, 'CRM业务员', 1468916102, 1477298042, 0, 'main_salesman'),
(6, '老板', 0, 1, '老板', 1477892527, 1477892550, 0, 'main_boss'),
(7, '营销统计', 0, 1, '营销统计', 1477907029, 0, 0, 'main_yxtj');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_role_user`
--

CREATE TABLE IF NOT EXISTS `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_role_user`
--

INSERT INTO `cmf_role_user` (`role_id`, `user_id`) VALUES
(1, 12),
(3, 14),
(2, 14),
(1, 14),
(4, 15),
(4, 19),
(5, 17),
(5, 19),
(5, 21),
(1, 22),
(1, 23),
(6, 24),
(7, 25);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_route`
--

CREATE TABLE IF NOT EXISTS `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_salesman`
--

CREATE TABLE IF NOT EXISTS `cmf_salesman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` char(40) NOT NULL DEFAULT '0' COMMENT '用户名',
  `email` char(40) NOT NULL DEFAULT '0' COMMENT '邮箱',
  `content` text COMMENT '备注',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '0:关闭，1：启用',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_salesman`
--

INSERT INTO `cmf_salesman` (`id`, `uname`, `email`, `content`, `status`) VALUES
(1, '赵四', '514583562@qq.com', '最新添加', 1),
(2, '张三', '3233816752@qq.com', '测试用的', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_search`
--

CREATE TABLE IF NOT EXISTS `cmf_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '信息id',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `modelid` smallint(5) NOT NULL COMMENT '模型id',
  `adddate` int(10) unsigned NOT NULL COMMENT '添加时间',
  `data` text NOT NULL COMMENT '数据',
  PRIMARY KEY (`searchid`),
  KEY `id` (`id`,`catid`,`adddate`) USING BTREE,
  KEY `modelid` (`modelid`,`catid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `cmf_search`
--

INSERT INTO `cmf_search` (`searchid`, `id`, `catid`, `modelid`, `adddate`, `data`) VALUES
(1, 20, 61, 1, 1466760553, '61这是动静子栏目2内容lasldflasdfasdf这是动静子栏目2内容Supply'),
(2, 30, 96, 1, 1474597967, '96WEAREFACTORY30CustomWEAREFACTORY'),
(3, 31, 96, 1, 1474598033, '96HIGH-QUALITYPRODUCTS31ChinaHIGH-QUALITYPRODUCTS'),
(4, 32, 96, 1, 1474598101, '96PROFESSIONALEXPORTEXPERINCE32ODMPROFESSIONALEXPORTEXPERINCE'),
(5, 33, 96, 1, 1474598158, '96MUTALCOOPRATIONANDDEVELOPMENT33MUTALCOOPRATIONANDDEVELOPMENTWholesaler'),
(6, 38, 94, 1, 1474609198, '94certificate538certificate5Wholesaler'),
(7, 41, 96, 1, 1474612706, '96ProfessionalExportExperince41rebarcoupler'),
(8, 42, 96, 1, 1474612744, '96Howtocarryouttheweldingofsteel...42Howtocarryouttheweldingofsteel...Supplier'),
(9, 5, 99, 2, 1474857144, '990factorytour15factorytour1Supplier'),
(10, 6, 99, 2, 1474858172, '990factorytour26factorytour1Supplier'),
(11, 7, 99, 2, 1474858172, '990factorytour37factorytour1Supplier'),
(12, 8, 99, 2, 1474858172, '990factorytour48factorytour1Supplier'),
(13, 9, 99, 2, 1474858172, '990factorytour59factorytour1Supplier'),
(14, 4, 94, 3, 1474616577, '94certificate54Chinacertificate'),
(15, 5, 94, 3, 1474621880, '94certificate45Chinacertificate4'),
(16, 6, 94, 3, 1474621896, '94certificate36certificate3SupplierChina'),
(17, 7, 94, 3, 1474621911, '94certificate27Customcertificate2'),
(18, 8, 94, 3, 1474621926, '94certificate18certificate1Price'),
(19, 72, 54, 5, 1471330644, '540asfcs\\"asfbsasfdaasdasfcdsdcfasefca'),
(20, 77, 73, 5, 1471499383, '730美美哒rebarcoupler77'),
(21, 80, 73, 5, 1471500767, '730tretytretyWholesaleerter'),
(22, 81, 78, 5, 1471567819, '780oneoneoenoneoneoenFactoryone'),
(23, 82, 73, 5, 1471568645, '730小碗儿小碗儿1rebarcouplerxiao'),
(24, 83, 73, 5, 1471573159, '730钻石钻石1钻石Factoryzuanshi'),
(25, 84, 73, 5, 1471573714, '730水杯水杯Manufacture水杯shuibei'),
(26, 87, 73, 5, 1471581865, '730烟酒烟酒1烟酒SupplierChinayanjiu'),
(27, 88, 78, 5, 1471589352, '780烟酒copy烟酒1烟酒SupplierChina88'),
(28, 90, 73, 5, 1472179337, '7301223coo烟酒1烟酒SupplierChina90'),
(29, 91, 78, 5, 1472179531, '780烟酒intro烟酒1烟酒SupplierChina91'),
(30, 92, 78, 5, 1472179723, '780asdf烟酒1烟酒SupplierChinaasdf'),
(31, 93, 78, 5, 1472180347, '780烟酒coo11烟酒1烟酒SupplierChina93'),
(32, 94, 78, 5, 1472180347, '780烟酒coo22烟酒1烟酒SupplierChina94'),
(33, 95, 78, 5, 1472180533, '780烟酒coo55烟酒1烟酒SupplierChina11'),
(34, 98, 81, 5, 1474522205, '810product1newproduct11rebarcoupler'),
(35, 99, 81, 5, 1474522761, '810product2newproduct22Manufactureproduct2productrr'),
(36, 100, 77, 5, 1474522928, '770Co2wireproductCo2wireproduct1100'),
(37, 101, 77, 5, 1474526538, '770Co2wireproduct21Co2wireproduct2ExporterChina101'),
(38, 102, 97, 5, 1475030166, '970测试展开2HighQuality测试展开102'),
(39, 1, 95, 31, 1474852441, 'WhereisHebeiXINYUWeldingChinaWhereisHebeiXINYUWeldingManufacturerChinaWhereisHebeiXINYUWelding950'),
(40, 2, 95, 31, 1474852494, 'WhereisHebeiXINYUWelding2SupplierWhereisHebeiXINYUWelding2WholesaleWhereisHebeiXINYUWelding2950'),
(41, 3, 95, 31, 1475022391, '3WhereisHebeiXINYUWelding2SupplierWhereisHebeiXINYUWelding2Wholesalexiaopingguo950');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_search_keyword`
--

CREATE TABLE IF NOT EXISTS `cmf_search_keyword` (
  `keyword` char(20) NOT NULL COMMENT '关键字',
  `pinyin` char(20) NOT NULL COMMENT '关键字拼音',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cmf_search_keyword`
--

INSERT INTO `cmf_search_keyword` (`keyword`, `pinyin`, `searchnums`, `data`) VALUES
('222', '222', 6, ''),
('22', '22', 2, ''),
('123', '123', 4, ''),
('子', 'zi', 1, ''),
('shoutao', 'shoutao', 1, ''),
('德国', 'deguo', 1, ''),
('ss', 'ss', 4, ''),
('天气', 'tianqi', 4, ''),
('dachuizi', 'dachuizi', 4, ''),
('中', 'zhong', 1, ''),
('union', 'union', 3, ''),
('asfbs', 'asfbs', 1, ''),
('79', '79', 1, ''),
('pliers', 'pliers', 6, ''),
('sadf', 'sadf', 1, ''),
('11', '11', 5, ''),
('factory', 'factory', 231, ''),
('tour', 'tour', 32, ''),
('asd', 'asd', 4, ''),
('sdf', 'sdf', 1, ''),
('product', 'product', 2, ''),
('certificate', 'certificate', 4, ''),
('cer', 'cer', 69, ''),
('asdf', 'asdf', 6, ''),
('aa', 'aa', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide`
--

CREATE TABLE IF NOT EXISTS `cmf_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_slide`
--

INSERT INTO `cmf_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, 'ABC', '\\thinkcmf//data/upload//20160518/573bd44c7f758.jpg', '', '', '阿萨德法师', 1, 0),
(2, 1, '22222222', '\\thinkcmf//data/upload//20160719/578d867a73299.png', '', '', '222222222222222', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_slide_cat`
--

CREATE TABLE IF NOT EXISTS `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_slide_cat`
--

INSERT INTO `cmf_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '首页轮播', 'bannerlun', '首页轮播图', 1),
(2, '分页轮播', 'fenlun', '分页轮播', 1),
(3, '中间轮播', 'zhonglun', '中间轮播', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_social_platform`
--

CREATE TABLE IF NOT EXISTS `cmf_social_platform` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `social_name` varchar(255) DEFAULT NULL COMMENT '社交平台名称',
  `imageurl` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
  `socurl` varchar(200) NOT NULL DEFAULT '' COMMENT '社交地址',
  `user` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `pwd` char(50) NOT NULL DEFAULT '' COMMENT '密码',
  `content` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `cmf_social_platform`
--

INSERT INTO `cmf_social_platform` (`id`, `social_name`, `imageurl`, `socurl`, `user`, `pwd`, `content`) VALUES
(2, 'linkedin', '{"thumb":"\\/thinkcmf\\/data\\/upload\\/20160518\\/573c00806e2dc.jpg"}', 'https://www.linkedin.com/?trk=baidubrand-mainlink', 'abcdefg123', 'hijklmn321', '&lt;p&gt;公司账号&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_tdks`
--

CREATE TABLE IF NOT EXISTS `cmf_tdks` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `catid` int(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `cmf_tdks`
--

INSERT INTO `cmf_tdks` (`id`, `catid`, `title`, `keywords`, `description`) VALUES
(1, 10, 's:29:"Manufacturer,Supplier,Factory";', 's:39:"Maker,Manufacturer China,Supplier China";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}'),
(2, 23, 's:38:"Manufacturer,Supplier,Factory,Exporter";', 's:44:"Manufacturer,Supplier,Factory,Exporter,Maker";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}'),
(3, 22, 's:38:"Manufacturer,Supplier,Factory,Exporter";', 's:44:"Manufacturer,Supplier,Factory,Exporter,Maker";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}'),
(4, 29, 's:32:"Landscape Grass, Landscape Grass";', 's:103:"Landscape Grass, Landscape Grass,Landscape xxxxxGrass, Landscape Grass,Landscape Grass, Landscape Grass";', 'a:2:{s:7:"iswrite";s:1:"1";s:13:"description_j";s:104:"ssssssLandscape Grass, Landscape Grass,Landscape Grass, Landscape Grass,Landscape Grass, Landscape Grass";}'),
(5, 30, 's:5:"News1";', 's:5:"News2";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:5:"News3";}'),
(6, 9, 's:53:"Manufacturer,Supplier,Factory,Exporter,China,for sale";', 's:39:"Maker,Manufacturer China,Supplier China";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}'),
(7, 1, 's:71:"china,Buy * in China,* Supplier China,* Maker Chinaq,* for sale,* China";', 's:97:"china,Buy * in China,Wholesale *,* Exporter China,* Factory China,* Manufacturer China,* for sale";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}'),
(8, 6, 's:34:"* China,* Factory China,* for sale";', 's:59:"* Manufacturer China,* Factory China,Buy * in China,* China";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}'),
(9, 67, 's:114:"* Supplier,*  Manufacturer,* Company,* China,Export *,* Supplier,* Wholesaler,* Manufacturer China,* Factory China";', 's:48:"* Supplier,* Factory,* China,Export *,* for Sale";', 'a:2:{s:7:"iswrite";s:1:"1";s:13:"description_j";s:0:"";}'),
(10, 72, 's:0:"";', 's:0:"";', 'a:2:{s:7:"iswrite";s:1:"1";s:13:"description_j";s:0:"";}'),
(11, 73, 's:0:"";', 's:0:"";', 'a:2:{s:7:"iswrite";s:1:"1";s:13:"description_j";s:0:"";}'),
(12, 96, 's:0:"";', 's:0:"";', 'a:2:{s:7:"iswrite";s:1:"0";s:13:"description_j";s:0:"";}');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_terms`
--

CREATE TABLE IF NOT EXISTS `cmf_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  `modelid` int(11) NOT NULL COMMENT '模型表modelid',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cmf_terms`
--

INSERT INTO `cmf_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `modelid`) VALUES
(1, '列表演示', '', 'article', '', 0, 0, '0-1', '', '', '', 'list', 'article', 0, 1, 0),
(2, '瀑布流', '', 'article', '', 0, 0, '0-2', '', '', '', 'list_masonry', 'article', 0, 1, 0),
(3, '分类1', '', 'article', '这是分类1', 1, 0, '0-1-3', '', '', '', 'list', 'article', 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_term_relationships`
--

CREATE TABLE IF NOT EXISTS `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cmf_term_relationships`
--

INSERT INTO `cmf_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 1, 1, 0, 1),
(2, 3, 3, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_tert_ss_data`
--

CREATE TABLE IF NOT EXISTS `cmf_tert_ss_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_tks_library`
--

CREATE TABLE IF NOT EXISTS `cmf_tks_library` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `c_num` int(200) NOT NULL COMMENT '使用次数',
  `is_use` int(10) NOT NULL COMMENT '是否使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `cmf_tks_library`
--

INSERT INTO `cmf_tks_library` (`id`, `keywords`, `c_num`, `is_use`) VALUES
(1, '* Supplier', 0, 0),
(2, '*  Manufacturer', 0, 0),
(3, '* Factory', 0, 0),
(4, '* Company', 0, 0),
(5, 'China *', 0, 0),
(6, '* China', 0, 0),
(7, '* Supply', 0, 0),
(8, 'Manufacture *', 0, 0),
(9, 'Export *', 0, 0),
(10, '* Wholesale', 0, 0),
(11, '* Supplier', 0, 0),
(12, '* for Sale', 0, 0),
(13, 'Sale *', 0, 0),
(14, '* Wholesaler', 0, 0),
(15, '* Manufacturer China', 0, 0),
(16, '* Exporter China', 0, 0),
(17, '* Factory China', 0, 0),
(18, '* Supplier China', 0, 0),
(19, '* Price', 0, 0),
(20, 'High Quality *', 0, 0),
(21, 'Custom *', 0, 0),
(22, 'ODM *', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cmf_urlrule`
--

CREATE TABLE IF NOT EXISTS `cmf_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `file` varchar(20) NOT NULL DEFAULT '' COMMENT '所属文件',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '生成静态规则 1 静态',
  `urlrule` varchar(255) NOT NULL DEFAULT '' COMMENT 'url规则',
  `example` varchar(255) NOT NULL DEFAULT '' COMMENT '示例',
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- 转存表中的数据 `cmf_urlrule`
--

INSERT INTO `cmf_urlrule` (`urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example`) VALUES
(1, 'content', 'category', 0, 'index.php?g=Content&m=Pagedis&a=lists&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists&catid={$catid}&p={page}', '动态：index.php?g=Content&m=Pagedis&a=lists&catid=1&page=1'),
(2, 'content', 'category', 1, 'html/{$categorydir}{$catdir}/index.html|html/{$categorydir}{$catdir}/index_{$page}.html', '静态：html/news/china/1000.html'),
(3, 'content', 'show', 1, 'html/{$year}/{$catdir}_{$month}/{$id}.html|html/{$year}/{$catdir}_{$month}/{$id}_{$page}.html', '静态：html/2010/catdir_07/1_2.html'),
(4, 'content', 'show', 0, 'index.php?g=Content&m=Pagedis&a=shows&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows&catid={$catid}&id={$id}&page={$page}', '动态：index.php?g=Content&m=Pagedis&a=shows&catid=1&id=1'),
(5, 'content', 'category', 1, 'news/{$catid}.html|news/{$catid}-{$page}.html', '静态：news/1.html'),
(6, 'content', 'category', 0, 'list-{$catid}.html|list-{$catid}-{$page}.html', '伪静态：list-1-1.html'),
(7, 'content', 'tags', 0, 'index.php?a=tags&amp;tagid={$tagid}|index.php?a=tags&amp;tagid={$tagid}&amp;page={$page}', '动态：index.php?a=tags&amp;tagid=1'),
(8, 'content', 'tags', 0, 'index.php?a=tags&amp;tag={$tag}|/index.php?a=tags&amp;tag={$tag}&amp;page={$page}', '动态：index.php?a=tags&amp;tag=标签'),
(9, 'content', 'tags', 0, 'tag-{$tag}.html|tag-{$tag}-{$page}.html', '伪静态：tag-标签.html'),
(10, 'content', 'tags', 0, 'tag-{$tagid}.html|tag-{$tagid}-{$page}.html', '伪静态：tag-1.html'),
(11, 'content', 'index', 1, 'index.html|index_{$page}.html', '静态：index_2.html'),
(12, 'content', 'index', 0, 'index.html|index_{$page}.html', '伪静态：index_2.html'),
(13, 'content', 'index', 0, 'index.php|index.php?page={$page}', '动态：index.php?page=2'),
(14, 'content', 'category', 1, 'download.html|download_{$page}.html', '静态：download.html'),
(15, 'content', 'show', 1, '{$categorydir}{$id}.html|{$categorydir}{$id}_{$page}.html', '静态：/父栏目/1.html'),
(16, 'content', 'show', 1, '{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html', '示例：/栏目/1.html'),
(17, 'content', 'category', 0, 'index.php?g=Content&m=Pagedis&a=lists_pic&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists_pic&catid={$catid}&p={page}', '动态图片：index.php?g=Content&m=Pagedis&a=lists_pic&catid=1&page=1'),
(18, 'content', 'category', 0, 'index.php?g=Content&m=Pagedis&a=lists_art&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists_art&catid={$catid}&p={page}', '动态文章：index.php?g=Content&m=Pagedis&a=lists_art&catid=1&page=1'),
(19, 'content', 'category', 0, 'index.php?g=Content&m=Pagedis&a=lists_pro&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists_pro&catid={$catid}&p={page}', '动态产品：index.php?g=Content&m=Pagedis&a=lists_pro&catid=1&page=1'),
(20, 'content', 'category', 0, 'index.php?g=Content&m=Pagedis&a=lists_down&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists_down&catid={$catid}&p={page}', '动态下载：index.php?g=Content&m=Pagedis&a=lists_down&catid=1&page=1'),
(21, 'content', 'show', 0, 'index.php?g=Content&m=Pagedis&a=shows_pic&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows_pic&catid={$catid}&id={$id}&page={$page}', '动态图片：index.php?g=Content&m=Pagedis&a=shows_pic&catid=1&id=1'),
(22, 'content', 'show', 0, 'index.php?g=Content&m=Pagedis&a=shows_art&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows_art&catid={$catid}&id={$id}&page={$page}', '动态文章：index.php?g=Content&m=Pagedis&a=shows_art&catid=1&id=1'),
(23, 'content', 'show', 0, 'index.php?g=Content&m=Pagedis&a=shows_pro&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows_pro&catid={$catid}&id={$id}&page={$page}', '动态产品：index.php?g=Content&m=Pagedis&a=shows_pro&catid=1&id=1'),
(24, 'content', 'show', 0, 'index.php?g=Content&m=Pagedis&a=shows_down&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows_down&catid={$catid}&id={$id}&page={$page}', '动态下载：index.php?g=Content&m=Pagedis&a=shows_down&catid=1&id=1'),
(25, 'content', 'category', 1, '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{$page}.html', '静态下载: html/download/reanod/1.html'),
(26, 'content', 'category', 1, '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index-{page}.html', '静态产品: html/product/reanod/1.html'),
(27, 'content', 'category', 1, '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{page}.html', '静态文章:  html/article/reanod/1.html'),
(28, 'content', 'category', 1, '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{$page}.html', '静态图片: html/picture/reanod/1.html'),
(29, 'content', 'show', 1, '{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html', '静态图片：/栏目/1.html'),
(30, 'content', 'show', 1, '{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html', '静态文章：/栏目/1.html'),
(31, 'content', 'show', 1, '{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html', '静态产品：/栏目/1.html'),
(32, 'content', 'show', 1, '{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html', '静态下载：/栏目/1.html'),
(33, 'content', 'category', 0, 'index.php?g=Content&m=Pagedis&a=lists_faq&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists_faq&catid={$catid}&p={page}', '动态faq：index.php?g=Content&m=Pagedis&a=lists_faq&catid=1&page=1'),
(34, 'content', 'show', 0, 'index.php?g=Content&m=Pagedis&a=shows_faq&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows_faq&catid={$catid}&id={$id}&page={$page}', '动态faq：index.php?g=Content&m=Pagedis&a=shows_faq&catid=1&id=1'),
(35, 'content', 'category', 1, '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/index_{page}.html', '静态faq:  html/faq/reanod/1.html'),
(36, 'content', 'show', 1, '{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html', '静态faq：/栏目/1.html');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_users`
--

CREATE TABLE IF NOT EXISTS `cmf_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证；3：删除',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- 转存表中的数据 `cmf_users`
--

INSERT INTO `cmf_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'admin', '###bce2875cf70ecebacf956ad76f71cd07', 'admin', '3233816752@qq.com', '', '', 0, '1988-11-16', '', '192.168.0.45', '2016-11-11 11:40:03', '2016-05-13 10:42:42', '', 1, 0, 1, 0, ''),
(2, 'test_163_com', '###21387a8b0c0db725a4ff99b5cc8654af', 'test_163_com', 'test@163.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 17:26:14', '2016-05-16 11:58:25', '', 1, 0, 2, 0, ''),
(4, '514583562_qq_com', '###21387a8b0c0db725a4ff99b5cc8654af', '514583562_qq_com', '514583562@qq.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 15:24:20', '2016-05-18 15:24:20', '', 1, 0, 2, 0, ''),
(5, 'test1_163_com', '###5ae89c64e3430540454a8556f272d829', 'test1_163_com', 'test1@163.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 15:49:13', '2016-05-18 15:49:13', '', 1, 0, 2, 0, ''),
(6, 'test2_163_com', '###5ae89c64e3430540454a8556f272d829', 'test2_163_com', 'test2@163.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 16:31:36', '2016-05-18 16:31:36', '', 1, 0, 2, 0, ''),
(7, 'test3_163_com', '###5ae89c64e3430540454a8556f272d829', 'test3_163_com', 'test3@163.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 16:33:42', '2016-05-18 16:33:42', '', 1, 0, 2, 0, ''),
(8, 'test4_163_com', '###5ae89c64e3430540454a8556f272d829', 'test4_163_com', 'test4@163.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 16:39:24', '2016-05-18 16:39:24', '', 1, 0, 2, 0, ''),
(9, 'test5_163_com', '###5ae89c64e3430540454a8556f272d829', 'test5_163_com', 'test5@163.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-18 16:41:52', '2016-05-18 16:41:52', '', 1, 0, 2, 0, ''),
(10, 'aaaaaa_qq_com', '###8b53dd029fa141dba89a46f8c90ee636', 'aaaaaa_qq_com', 'aaaaaa@qq.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-05-20 17:59:38', '2016-05-20 17:59:38', '', 1, 0, 2, 0, ''),
(13, 'Cj', '###d795518ac248d8c276735e0842fbf720', '', 'cj@reanod.com', '', '', 0, '0000-00-00', '', '192.168.0.7', '2016-06-12 14:45:44', '2016-06-12 14:19:08', '', 3, 0, 1, 0, ''),
(12, 'test1', '###4f29225a44241e339432e09d82eb2ac1', '', 'test1@qq.com', '', '', 0, '0000-00-00', '', '192.168.0.68', '2016-06-03 15:20:33', '2016-06-02 16:04:11', '', 1, 0, 1, 0, ''),
(14, 'td', '###5ae89c64e3430540454a8556f272d829', '', '123456@123.com', '', NULL, 0, NULL, NULL, '0.0.0.0', '2016-07-19 11:21:39', '2016-06-29 15:55:37', '', 1, 0, 1, 0, ''),
(15, 'ywjl', '###5ae89c64e3430540454a8556f272d829', '', '123@123.com', '', NULL, 0, NULL, NULL, '127.0.0.1', '2016-09-08 09:43:50', '2016-07-19 16:16:28', '', 1, 0, 1, 0, ''),
(17, 'chenxiao', '###5ae89c64e3430540454a8556f272d829', '', 'chenxiao@chenxiao.com', '', NULL, 0, NULL, NULL, '192.168.0.209', '2016-11-11 11:40:02', '2016-07-19 17:06:12', '', 1, 0, 1, 0, ''),
(19, 'cxtest', '###5ae89c64e3430540454a8556f272d829', '', 'chenxiao1@chenxiao.com', '', NULL, 0, NULL, NULL, '0.0.0.0', '2016-11-09 17:32:36', '2016-07-25 09:22:01', '', 1, 0, 1, 0, ''),
(20, 'demo2', '###5ae89c64e3430540454a8556f272d829', '', '123@qq.com', '', NULL, 0, NULL, NULL, NULL, '2000-01-01 00:00:00', '2016-09-02 08:58:34', '', 3, 0, 1, 0, ''),
(21, '张三', '###5ae89c64e3430540454a8556f272d829', '', 'zhangsan@qq.com', '', NULL, 0, NULL, NULL, '127.0.0.1', '2016-09-08 09:46:39', '2016-09-08 09:46:26', '', 1, 0, 1, 0, ''),
(22, 'sd', '###bce2875cf70ecebacf956ad76f71cd07', '', 'ad@qq.com', '', '', 0, '0000-00-00', '', '0.0.0.0', '2016-10-17 10:18:15', '2016-10-17 10:16:27', '', 1, 0, 1, 0, ''),
(23, 'boss', '###5ae89c64e3430540454a8556f272d829', '', 'boss@boss.com', '', '', 0, '0000-00-00', '', '192.168.0.45', '2016-11-09 16:35:38', '2016-10-31 13:43:14', '', 1, 0, 1, 0, ''),
(24, 'boss2', '###5ae89c64e3430540454a8556f272d829', '', 'boss2@qq.com', '', '', 0, '0000-00-00', '', '', '0000-00-00 00:00:00', '2016-10-31 16:55:34', '', 1, 0, 1, 0, ''),
(25, 'yxtj', '###5ae89c64e3430540454a8556f272d829', '', 'yxtj@163.com', '', '', 0, '0000-00-00', '', '192.168.0.45', '2016-11-09 10:10:29', '2016-10-31 17:44:12', '', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `cmf_user_favorites`
--

CREATE TABLE IF NOT EXISTS `cmf_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cmf_visits`
--

CREATE TABLE IF NOT EXISTS `cmf_visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL COMMENT '国家',
  `url` varchar(100) NOT NULL COMMENT '页面链接',
  `title` varchar(200) NOT NULL COMMENT '头部',
  `clicks` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '点击量',
  `time` int(10) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1792 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;