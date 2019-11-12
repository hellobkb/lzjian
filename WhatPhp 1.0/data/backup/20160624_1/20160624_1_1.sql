-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2016-06-24 17:10:17
-- Vol : 1
DROP TABLE IF EXISTS `cmf_aaaaa`;
CREATE TABLE `cmf_aaaaa` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(24) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
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
  `seotitle` varchar(255) NOT NULL DEFAULT '',
  `seokeywords` varchar(255) NOT NULL DEFAULT '',
  `seodescription` varchar(255) NOT NULL DEFAULT '',
  `moveurl` varchar(255) NOT NULL DEFAULT '' COMMENT '动态url地址',
  `seourl` varchar(255) NOT NULL DEFAULT '',
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_aaaaa_data`;
CREATE TABLE `cmf_aaaaa_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_ad`;
CREATE TABLE `cmf_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_admin_log`;
CREATE TABLE `cmf_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ltime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `uid` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'uid',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
  PRIMARY KEY (`id`),
  KEY `ltime` (`ltime`),
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('1','1464938433','12','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('2','1465000034','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('3','1465000830','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('4','1465001922','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('5','1465002524','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('6','1465004461','1','修改后台菜单备份管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('7','1465004471','1','修改后台菜单插件管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('8','1465004483','1','修改后台菜单幻灯片','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('9','1465004501','1','修改后台菜单网站广告','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('10','1465004513','1','修改后台菜单第三方登陆','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('11','1465004525','1','修改后台菜单文件存储','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('12','1465004544','1','修改后台菜单页面管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('13','1465004585','1','修改后台菜单回收站','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('14','1465008215','1','修改futou','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('15','1465009105','1','修改产品三','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('16','1465009207','1','修改产品三','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('17','1465011379','1','添加简介','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('18','1465011957','1','排序','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('19','1465011965','1','排序','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('20','1465012812','1','启用禁用字段pages','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('21','1465012867','1','启用禁用字段pages','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('22','1465175711','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('23','1465176134','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('24','1465177684','1','登录','192.168.0.207');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('25','1465178195','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('26','1465179053','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('27','1465179288','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('28','1465180878','1','启用禁用字段tags','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('29','1465180893','1','启用禁用字段tags','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('30','1465180955','1','启用禁用字段tags','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('31','1465191413','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('32','1465191977','1','修改futou','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('33','1465192012','1','修改futou','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('34','1465192228','1','修改网站信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('35','1465192952','1','修改网站信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('36','1465194792','1','修改网站信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('37','1465195368','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('38','1465196328','1','添加栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('39','1465196653','1','修改栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('40','1465197615','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('41','1465199060','1','修改后台菜单文章管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('42','1465200426','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('43','1465200438','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('44','1465201438','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('45','1465201747','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('46','1465203100','1','添加小钳子','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('47','1465205192','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('48','1465205371','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('49','1465205434','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('50','1465206045','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('51','1465206386','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('52','1465207162','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('53','1465207280','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('54','1465207319','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('55','1465207967','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('56','1465259207','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('57','1465259227','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('58','1465259438','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('59','1465259744','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('60','1465259694','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('61','1465260091','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('62','1465260134','1','删除营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('63','1465260144','1','删除营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('64','1465260156','1','删除营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('65','1465260198','1','删除营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('66','1465260999','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('67','1465260821','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('68','1465261332','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('69','1465261364','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('70','1465261639','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('71','1465262255','1','删除管理员信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('72','1465262260','1','删除管理员信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('73','1465262093','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('74','1465262994','1','添加后台菜单关键词排名查询','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('75','1465264285','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('76','1465264519','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('77','1465264692','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('78','1465265254','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('79','1465265275','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('80','1465265874','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('81','1465266005','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('82','1465266857','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('83','1465267269','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('84','1465267346','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('85','1465267390','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('86','1465267400','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('87','1465268110','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('88','1465268196','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('89','1465268266','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('90','1465268613','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('91','1465268583','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('92','1465268596','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('93','1465268983','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('94','1465269372','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('95','1465269298','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('96','1465270187','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('97','1465270198','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('98','1465270215','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('99','1465270259','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('100','1465270401','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('101','1465270915','1','修改营销平台信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('102','1465270802','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('103','1465271048','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('104','1465271393','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('105','1465271511','1','修改营销平台信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('106','1465271536','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('107','1465272196','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('108','1465272253','1','修改营销平台信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('109','1465272268','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('110','1465272357','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('111','1465272377','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('112','1465272393','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('113','1465272411','1','修改营销平台信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('114','1465272421','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('115','1465272505','1','修改营销平台信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('116','1465272522','1','修改营销平台信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('117','1465272532','1','产品发布','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('118','1465278697','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('119','1465278747','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('120','1465278962','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('121','1465279078','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('122','1465279713','1','修改网站信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('123','1465279720','1','修改网站信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('124','1465279841','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('125','1465280846','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('126','1465280832','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('127','1465280877','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('128','1465280886','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('129','1465280921','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('130','1465281131','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('131','1465281141','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('132','1465281166','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('133','1465281168','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('134','1465281189','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('135','1465281393','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('136','1465281396','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('137','1465281356','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('138','1465281495','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('139','1465281551','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('140','1465281936','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('141','1465282379','1','修改小钳子2','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('142','1465282447','1','修改小钳子3','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('143','1465282460','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('144','1465282493','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('145','1465282511','1','排序','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('146','1465283348','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('147','1465285375','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('148','1465285519','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('149','1465285778','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('150','1465287035','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('151','1465289332','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('152','1465289376','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('153','1465289419','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('154','1465289662','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('155','1465289693','1','修改小扳手','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('156','1465289650','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('157','1465289664','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('158','1465293401','1','修改关于我们','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('159','1465293423','1','修改Products','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('160','1465345543','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('161','1465346045','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('162','1465346075','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('163','1465346194','1','修改Landscape Grass','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('164','1465346327','1','修改网站信息','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('165','1465346345','1','修改网站信息','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('166','1465346371','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('167','1465346387','1','修改Products','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('168','1465346546','1','删除Products','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('169','1465346569','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('170','1465346651','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('171','1465346677','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('172','1465346693','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('173','1465346790','1','修改Test1','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('174','1465346818','1','Test1转换终极属性','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('175','1465346908','1','添加Test','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('176','1465347206','1','修改Landscape Grass Landscape Grass','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('177','1465347213','1','修改Landscape Grass Landscape Grass','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('178','1465347386','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('179','1465347390','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('180','1465349925','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('181','1465349932','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('182','1465350278','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('183','1465351245','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('184','1465351607','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('185','1465351843','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('186','1465351889','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('187','1465351922','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('188','1465351933','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('189','1465351960','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('190','1465351962','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('191','1465351973','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('192','1465351981','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('193','1465351990','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('194','1465352214','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('195','1465352288','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('196','1465352815','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('197','1465353459','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('198','1465353989','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('199','1465354007','1','test2转换终极属性','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('200','1465354344','1','删除Test1','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('201','1465354364','1','删除Test1','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('202','1465354381','1','删除','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('203','1465354516','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('204','1465354540','1','修改Test1','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('205','1465354561','1','Test1转换终极属性','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('206','1465354554','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('207','1465354598','1','修改test2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('208','1465355574','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('209','1465355975','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('210','1465355986','1','Industry News转换终极属性','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('211','1465355929','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('212','1465356220','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('213','1465356242','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('214','1465356339','1','test3转换终极属性','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('215','1465356812','1','修改test2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('216','1465356837','1','test2转换终极属性','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('217','1465357496','1','修改新闻二','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('218','1465357756','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('219','1465357900','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('220','1465357918','1','修改test2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('221','1465357933','1','test2转换终极属性','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('222','1465358151','1','修改Test1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('223','1465364284','1','修改小扳手','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('224','1465364304','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('225','1465364770','1','修改dachuizi1222','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('226','1465364810','1','修改小扳手','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('227','1465364813','1','修改111111111111111','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('228','1465364849','1','修改小扳手','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('229','1465364707','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('230','1465364898','1','修改小扳手','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('231','1465364903','1','修改小扳手','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('232','1465364934','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('233','1465364942','1','修改dachuizi1222','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('234','1465364991','1','修改111111111111111','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('235','1465365151','1','修改小钳子','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('236','1465366212','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('237','1465368607','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('238','1465369839','1','修改小钳子','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('239','1465369988','1','修改网站信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('240','1465370119','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('241','1465375322','1','添加URL规则Category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('242','1465375344','1','修改URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('243','1465375509','1','添加URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('244','1465375577','1','添加URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('245','1465375630','1','添加URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('246','1465376159','1','修改test2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('247','1465692041','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('248','1465693290','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('249','1465694289','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('250','1465694318','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('251','1465694540','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('252','1465694575','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('253','1465695454','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('254','1465695644','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('255','1465696006','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('256','1465697027','1','修改URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('257','1465697050','1','修改URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('258','1465697072','1','修改URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('259','1465697091','1','修改URL规则category','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('260','1465697170','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('261','1465697323','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('262','1465697442','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('263','1465697465','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('264','1465697876','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('265','1465697894','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('266','1465697928','1','修改test3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('267','1465698960','1','批量审核','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('268','1465698970','1','批量置顶','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('269','1465698978','1','批量取消置顶','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('270','1465698982','1','批量推荐','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('271','1465698991','1','批量取消推荐','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('272','1465698996','1','批量推荐','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('273','1465699073','1','批量取消审核','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('274','1465699077','1','批量审核','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('275','1465699142','1','排序','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('276','1465699258','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('277','1465699444','1','修改网站信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('278','1465699470','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('279','1465700017','1','导出模型测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('280','1465701447','1','添加后台菜单关键词管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('281','1465701466','1','排序后台菜单','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('282','1465702167','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('283','1465703499','1','修改栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('284','1465703748','1','修改栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('285','1465703595','1','添加标题的标题','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('286','1465711150','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('287','1465712348','1','添加管理员信息','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('288','1465712898','1','分配询盘(最新的)','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('289','1465713522','1','添加角色','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('290','1465713567','1','授权','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('291','1465713582','1','修改管理员信息','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('292','1465713598','13','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('293','1465713620','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('294','1465713474','1','添加URL规则show','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('295','1465713562','1','添加URL规则show','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('296','1465713609','1','添加URL规则show','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('297','1465713797','1','授权','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('298','1465713682','1','添加URL规则show','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('299','1465713944','13','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('300','1465713922','1','修改URL规则show','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('301','1465714314','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('302','1465715370','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('303','1465715745','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('304','1465715961','1','更新首页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('305','1465716242','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('306','1465716254','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('307','1465716410','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('308','1465716414','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('309','1465716419','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('310','1465716412','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('311','1465716814','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('312','1465717142','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('313','1465717261','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('314','1465717320','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('315','1465717341','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('316','1465717382','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('317','1465718177','1','修改111111111111111','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('318','1465718192','1','修改111111111111111','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('319','1465718610','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('320','1465718788','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('321','1465719042','1','修改test11','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('322','1465719126','1','修改test11','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('323','1465719147','1','修改test11','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('324','1465719399','1','修改test11','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('325','1465720270','1','添加陈小测试1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('326','1465720566','1','添加栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('327','1465720484','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('328','1465720502','1','添加栏目关键词','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('329','1465720878','1','添加这是测试222','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('330','1465722932','1','添加天气情况','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('331','1465723162','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('332','1465723168','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('333','1465723980','1','批量取消推荐','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('334','1465724149','1','批量删除产品二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('335','1465724156','1','批量删除产品二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('336','1465724168','1','批量删除产品二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('337','1465724174','1','批量删除产品二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('338','1465724772','1','添加新的产品','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('339','1465724889','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('340','1465724894','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('341','1465724899','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('342','1465724955','1','添加新加一个吧','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('343','1465725100','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('344','1465725138','1','添加再来一个','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('345','1465725266','1','添加第三个了','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('346','1465725295','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('347','1465726161','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('348','1465777563','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('349','1465777809','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('350','1465778090','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('351','1465778199','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('352','1465778221','1','修改第三个了','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('353','1465779047','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('354','1465779083','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('355','1465779003','1','添加修理工具','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('356','1465779329','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('357','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('358','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('359','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('360','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('361','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('362','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('363','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('364','1465783430','1','备份后台菜单','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('365','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('366','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('367','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('368','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('369','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('370','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('371','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('372','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('373','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('374','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('375','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('376','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('377','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('378','1465783436','1','生成菜单多语言包','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('379','1465783808','1','修改新闻二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('380','1465783839','1','修改新闻二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('381','1465785261','1','添加产品11','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('382','1465785324','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('383','1465785330','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('384','1465785424','1','添加第四个测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('385','1465785579','1','修改第四个测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('386','1465785837','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('387','1465785842','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('388','1465785854','1','添加这又是测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('389','1465785945','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('390','1465786487','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('391','1465786492','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('392','1465786534','1','添加产品name','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('393','1465786738','1','修改产品name','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('394','1465786871','1','添加测试编辑','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('395','1465787227','1','添加这是','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('396','1465787244','1','修改测试编辑','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('397','1465787259','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('398','1465787264','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('399','1465787270','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('400','1465787280','1','修改测试编辑','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('401','1465788853','1','排序字段','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('402','1465789214','1','删除Products','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('403','1465789219','1','删除test11','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('404','1465789414','1','批量删除test11','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('405','1465789545','1','批量删除Landscape Grass','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('406','1465789626','1','修改Products','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('407','1465789848','1','排序字段','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('408','1465790198','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('409','1465790183','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('410','1465796405','1','添加字段one_pig','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('411','1465798319','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('412','1465798541','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('413','1465798488','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('414','1465798587','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('415','1465798632','1','添加测试分页1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('416','1465798683','1','添加测试分页2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('417','1465798710','1','添加分页3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('418','1465799488','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('419','1465804411','1','添加模型叶子','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('420','1465805588','1','添加模型一个二','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('421','1465806204','1','修改测试分页2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('422','1465806523','1','修改测试分页2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('423','1465806867','1','修改测试分页2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('424','1465810147','1','添加德国大夫','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('425','1465811120','1','更新首页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('426','1465811208','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('427','1465811414','1','修改网站信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('428','1465811452','1','修改网站信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('429','1465811500','1','修改火啊32','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('430','1465811678','1','修改分页1','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('431','1465811886','1','修改测试静态分页','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('432','1465811864','1','添加模型三个','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('433','1465864156','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('434','1465864913','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('435','1465865187','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('436','1465868163','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('437','1465872874','1','批量置顶','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('438','1465873074','1','批量置顶','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('439','1465873127','1','批量置顶','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('440','1465875659','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('441','1465876538','1','修改后台菜单文章管理','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('442','1465876750','1','修改Landscape Grass','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('443','1465882491','1','修改Sports Grass','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('444','1465882544','1','修改Football','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('445','1465882684','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('446','1465882698','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('447','1465882731','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('448','1465882943','1','Leisure Grass转换终极属性','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('449','1465889234','1','添加字段emai','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('450','1465890687','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('451','1465891581','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('452','1465892565','1','添加hello','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('453','1465892601','1','添加嗨嗨嗨','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('454','1465892622','1','批量删除Football','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('455','1465893392','1','添加dachuizi122','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('456','1465894767','1','添加模型四个试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('457','1465895537','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('458','1465896049','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('459','1465896069','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('460','1465897203','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('461','1465898020','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('462','1465950421','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('463','1465951393','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('464','1465951458','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('465','1465951574','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('466','1465951618','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('467','1465952350','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('468','1465952406','1','修改URL规则category','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('469','1465952422','1','修改URL规则category','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('470','1465952437','1','修改URL规则category','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('471','1465952450','1','修改URL规则category','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('472','1465953011','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('473','1465954492','1','修改dachuizi1222','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('474','1465954512','1','修改dachuizi1222','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('475','1465958080','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('476','1465959091','1','启用禁用模型四个试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('477','1465959133','1','启用禁用模型四个试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('478','1465960379','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('479','1465962474','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('480','1465962485','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('481','1465963100','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('482','1465969150','1','添加后台菜单关键词库','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('483','1465969178','1','排序后台菜单','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('484','1465969647','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('485','1465971655','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('486','1465972231','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('487','1465972441','1','添加','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('488','1465972487','1','添加asdf','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('489','1465972747','1','删除字段seourl','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('490','1465973069','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('491','1465973369','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('492','1465973549','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('493','1465973722','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('494','1465973851','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('495','1465974024','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('496','1465974184','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('497','1465974250','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('498','1465974488','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('499','1465974625','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('500','1465974676','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('501','1465974723','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('502','1465974798','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('503','1465975071','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('504','1465975122','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('505','1465975160','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('506','1465975169','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('507','1465975306','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('508','1465975391','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('509','1465975505','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('510','1465975611','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('511','1465976141','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('512','1465976239','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('513','1465976306','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('514','1465977027','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('515','1465977701','1','修改URL规则category','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('516','1465980527','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('517','1465980814','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('518','1465982651','1','Football xx转换终极属性','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('519','1465982812','1','添加123123','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('520','1465982824','1','添加wenzhnag ','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('521','1465982979','1','添加小钳子','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('522','1465983133','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('523','1465983151','1','批量删除新闻一','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('524','1465983162','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('525','1465983295','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('526','1465983306','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('527','1465983331','1','修改美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('528','1465983814','1','修改美美哒11','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('529','1465983857','1','修改美美哒1111','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('530','1465984154','1','修改美美哒11112','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('531','1465984562','1','修改美美哒111121','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('532','1465984641','1','修改美美哒1111211','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('533','1465984684','1','修改美美哒1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('534','1465984701','1','修改美美哒1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('535','1465984710','1','修改美美哒12','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('536','1465984778','1','修改美美哒121','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('537','1465985412','1','修改美美哒12133','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('538','1466037469','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('539','1466039761','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('540','1466040099','1','添加字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('541','1466040514','1','删除字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('542','1466040583','1','添加字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('543','1466040993','1','修改美美哒12133','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('544','1466041389','1','修改美美哒1213311','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('545','1466041461','1','修改美美哒1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('546','1466041556','1','修改美美哒1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('547','1466041602','1','批量删除新闻一','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('548','1466042101','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('549','1466043756','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('550','1466043847','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('551','1466043869','1','批量删除新闻一','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('552','1466044721','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('553','1466044948','1','添加hello','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('554','1466045014','1','添加hello2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('555','1466045036','1','修改hello24','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('556','1466045238','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('557','1466045485','1','添加hello','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('558','1466045517','1','添加hello3','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('559','1466046172','1','添加haiahia','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('560','1466046203','1','批量删除新闻一','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('561','1466046299','1','修改hellouu1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('562','1466046446','1','添加helloww','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('563','1466046558','1','批量删除新闻一','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('564','1466060689','1','修改栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('565','1466061654','1','修改栏目关键词','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('566','1466066907','1','登录','192.168.0.69');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('567','1466067796','1','排序后台菜单','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('568','1466123703','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('569','1466124175','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('570','1466124530','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('571','1466125382','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('572','1466125614','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('573','1466131704','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('574','1466132539','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('575','1466132864','1','排序字段','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('576','1466133539','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('577','1466133596','1','修改shoutao12332','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('578','1466135390','1','添加ll','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('579','1466135416','1','修改shoutao12332','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('580','1466135719','1','添加字段d_wenjian','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('581','1466136326','1','添加rrrrrr','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('582','1466141693','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('583','1466141704','1','批量删除Football','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('584','1466142775','1','添加hhh','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('585','1466142794','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('586','1466145742','1','添加生成报表评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('587','1466146191','1','添加tttttt','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('588','1466146238','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('589','1466146866','1','添加haaaa','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('590','1466146893','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('591','1466147421','1','添加生成报表评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('592','1466147631','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('593','1466147557','1','添加生成报表评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('594','1466147802','1','修改dachuizi1222','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('595','1466147823','1','修改dachuizi1222','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('596','1466147863','1','修改dachuizi1222','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('597','1466148953','1','添加生成报表评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('598','1466151950','1','添加后台菜单生成报告预览','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('599','1466151995','1','添加后台菜单生成报告','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('600','1466152051','1','添加后台菜单报告评论列表','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('601','1466152089','1','添加后台菜单修改评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('602','1466152142','1','添加后台菜单修改评论提交','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('603','1466152181','1','添加后台菜单删除评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('604','1466152224','1','添加后台菜单新增评论','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('605','1466152365','1','添加后台菜单新增评论提交','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('606','1466152918','1','修改简介','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('607','1466153084','1','添加','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('608','1466209966','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('609','1466210101','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('610','1466210214','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('611','1466210369','1','添加测试栏目分页','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('612','1466210405','1','添加测试栏目2','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('613','1466210437','1','添加测试分页3','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('614','1466210472','1','修改栏目二','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('615','1466210551','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('616','1466213234','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('617','1466213275','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('618','1466213381','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('619','1466215877','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('620','1466218800','1','修改后台菜单文章管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('621','1466218945','1','修改后台菜单文章管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('622','1466219260','1','修改后台菜单文章管理','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('623','1466221608','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('624','1466222236','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('625','1466222322','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('626','1466222372','1','批量删除Football','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('627','1466222490','1','添加美美哒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('628','1466222730','1','添加sdfsd','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('629','1466222746','1','批量删除Football','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('630','1466384278','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('631','1466385543','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('632','1466386421','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('633','1466391919','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('634','1466402454','1','添加营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('635','1466402863','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('636','1466402904','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('637','1466403481','1','修改营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('638','1466403495','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('639','1466403825','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('640','1466403992','1','产品发布','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('641','1466410952','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('642','1466410976','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('643','1466410982','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('644','1466411005','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('645','1466411010','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('646','1466414044','1','添加fdg','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('647','1466414061','1','删除','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('648','1466414470','1','批量删除测试静态分页','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('649','1466415293','1','添加模型试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('650','1466415709','1','添加模型ceshi','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('651','1466416119','1','添加模型测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('652','1466416545','1','添加模型shishi','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('653','1466416558','1','删除模型','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('654','1466416906','1','添加模型试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('655','1466469663','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('656','1466470062','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('657','1466470178','1','登录','192.168.0.61');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('658','1466470187','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('659','1466470374','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('660','1466470432','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('661','1466470642','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('662','1466470816','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('663','1466471053','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('664','1466471262','1','添加模型发测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('665','1466471595','1','删除模型发测试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('666','1466471670','1','添加模型试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('667','1466471811','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('668','1466471859','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('669','1466471885','1','登录','127.0.0.1');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('670','1466472195','1','登录','192.168.0.188');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('671','1466472299','1','删除字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('672','1466472359','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('673','1466472316','1','删除字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('674','1466472327','1','删除字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('675','1466472334','1','删除字段isdelay','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('676','1466472475','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('677','1466472646','1','导出模型试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('678','1466472653','1','删除模型试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('679','1466472671','1','添加模型试试','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('680','1466473368','1','修改陈测试试','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('681','1466473392','1','修改陈测试试','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('682','1466473904','1','登录','192.168.0.20');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('683','1466473910','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('684','1466474300','1','修改陈测试静动','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('685','1466474391','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('686','1466474591','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('687','1466474878','1','陈测试静静转换终极属性','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('688','1466475141','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('689','1466475250','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('690','1466475275','1','动静子栏目2转换终极属性','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('691','1466475935','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('692','1466476926','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('693','1466477165','1','修改News','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('694','1466477179','1','修改Industry News','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('695','1466476976','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('696','1466477209','1','修改Company News','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('697','1466477249','1','删除News','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('698','1466477331','1','修改About us','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('699','1466477369','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('700','1466477375','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('701','1466477461','1','修改Application','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('702','1466477561','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('703','1466477916','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('704','1466478116','1','修改Contact Us','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('705','1466478155','1','排序','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('706','1466479302','1','修改陈外部链接1','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('707','1466479098','1','修改陈外部链接1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('708','1466479125','1','修改陈外部链接1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('709','1466479209','1','修改陈外部链接1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('710','1466479388','1','修改陈外部链接1','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('711','1466479853','1','更新首页','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('712','1466480438','1','修改陈单页1','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('713','1466480474','1','添加','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('714','1466480541','1','添加陈测试静静','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('715','1466480712','1','修改分页1','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('716','1466480863','1','修改分页1','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('717','1466480964','1','修改分页1','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('718','1466481158','1','添加分页1产品','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('719','1466481178','1','修改陈测试试','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('720','1466481203','1','修改测试静态分页','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('721','1466481243','1','修改News','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('722','1466481265','1','修改Service','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('723','1466481485','1','修改下载','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('724','1466489148','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('725','1466489556','1','添加模型陈枭测试','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('726','1466489576','1','导出模型陈枭测试','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('727','1466489619','1','删除模型陈枭测试','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('728','1466489656','1','导入模型陈枭测试','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('729','1466493583','1','添加','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('730','1466494098','1','删除营销平台信息','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('731','1466497702','1','修改营销平台信息','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('732','1466497749','1','产品发布','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('733','1466555236','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('734','1466557552','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('735','1466558110','1','删除陈测试静静','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('736','1466558120','1','修改陈单页2','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('737','1466567051','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('738','1466576698','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('739','1466579985','1','登录','192.168.0.209');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('740','1466580229','1','修改后台菜单个人信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('741','1466580375','1','修改后台菜单个人信息','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('742','1466580440','1','添加后台菜单搜索设置','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('743','1466641625','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('744','1466652412','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('745','1466660144','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('746','1466661688','1','添加后台菜单服务器和域名提醒','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('747','1466668191','1','登录','192.168.0.244');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('748','1466671538','1','登录','192.168.0.244');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('749','1466676113','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('750','1466676218','1','登录','192.168.0.144');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('751','1466727915','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('752','1466727737','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('753','1466728059','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('754','1466728576','1','登录','192.168.0.7');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('755','1466728770','1','修改后台菜单统计分析','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('756','1466728771','1','修改后台菜单统计分析','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('757','1466728881','1','修改后台菜单统计分析','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('758','1466728957','1','修改后台菜单统计分析','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('759','1466730154','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('760','1466732095','1','登录','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('761','1466750042','1','修改后台菜单批量更新栏目','0.0.0.0');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('762','1466753743','1','登录','192.168.0.68');
INSERT INTO cmf_admin_log ( `id`, `ltime`, `uid`, `info`, `ip` ) VALUES  ('763','1466759349','1','登录','192.168.0.68');
DROP TABLE IF EXISTS `cmf_article`;
CREATE TABLE `cmf_article` (
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
  `seotitle` varchar(255) NOT NULL,
  `seokeywords` varchar(255) NOT NULL,
  `seodescription` varchar(255) NOT NULL,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_article ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `prefix`, `tags`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('1','6','新闻二','','/thinkcmf/data/upload/20160606/575540b6985ac.jpg','新闻一','我是新闻一','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=6&id=1','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=6&id=1','0','99','0','1','1','0','admin','1464573187','1464573187','','','0','0','0','0','0','0',' ',' ','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','啦啦啦','0');
INSERT INTO cmf_article ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `prefix`, `tags`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('2','30','Mid East Customer Visit Frengrass Factory','','','Mid East Customer Visit Frengrass Factor','Mid east customer visit Frengrass factory


Jan.18, mid east customer visit Frengrass factory, and check many landscaping grass samples, at last they decide to buy 4 color grass the first order.','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=shows&catid=30&id=2','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=shows&catid=30&id=2','0','99','0','0','1','0','admin','1464937074','1464937074','','Mid East Customer Visit Frengrass Factory','0','0','0','0','0','0','Mid East Customer Visit Frengrass Factory News1','Mid East Customer Visit Frengrass Factory News2','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:34:\"Manufacturer China in many factory\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_article ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `prefix`, `tags`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('3','7','天气情况','','','','要下雨','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=7&id=3','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=7&id=3','0','99','1','0','1','0','admin','1465722932','1465722932','','','0','0','0','0','0','0','','','','','0');
INSERT INTO cmf_article ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `prefix`, `tags`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('19','59','陈测试静静','','','','','http://192.168.0.68/thinkcmf/chenceshijingjing/adfasdfasdf-19.html','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_art&catid=59&id=19','0','99','0','0','1','0','admin','1466480541','1466480541','','','0','0','0','0','0','0','陈测试静静 Supplier','Custom 陈测试静静','','adfasdfasdf','0');
DROP TABLE IF EXISTS `cmf_article_data`;
CREATE TABLE `cmf_article_data` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_article_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `copyfrom` ) VALUES  ('1','<p><img src=\"http://localhost/thinkcmf/data/upload/ueditor/20160606/575540af25bf9.jpg\" title=\"download(1).jpg\" alt=\"download(1).jpg\"/>我是最新的新闻一</p>','0','0','','0','1','','');
INSERT INTO cmf_article_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `copyfrom` ) VALUES  ('2','<p style=\"white-space: normal;\">Mid east customer visit Frengrass factory</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">Jan.18,
 mid east customer visit Frengrass factory, and check many landscaping 
grass samples, at last they decide to buy 4 color grass the first order.</p><p><br/></p><p style=\"white-space: normal;\">Mid east customer visit Frengrass factory</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">Jan.18,
 mid east customer visit Frengrass factory, and check many landscaping 
grass samples, at last they decide to buy 4 color grass the first order.</p><p><br/></p>','0','0','','0','1','','');
INSERT INTO cmf_article_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `copyfrom` ) VALUES  ('3','<p>稀里哗啦的下雨啊<br/></p>','0','0','','0','1','','');
INSERT INTO cmf_article_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `copyfrom` ) VALUES  ('19','','0','0','','0','1','','');
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','content/contents/index','admin_url');
INSERT INTO cmf_auth_access ( `role_id`, `rule_name`, `type` ) VALUES  ('3','admin/content/default','admin_url');
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','邮件模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('156','Admin','admin_url','admin/storage/index','','文件存储','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('157','Admin','admin_url','admin/storage/setting_post','','文件存储设置提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('158','Admin','admin_url','admin/slide/ban','','禁用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('159','Admin','admin_url','admin/slide/cancelban','','启用幻灯片','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('160','Admin','admin_url','admin/user/ban','','禁用管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('161','Admin','admin_url','admin/user/cancelban','','启用管理员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('162','Content','admin_url','content/models/index','','模型管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('163','Content','admin_url','content/createhtml/default','','发布管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('164','Content','admin_url','content/createhtml/index','','生成首页','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('165','Content','admin_url','content/createhtml/category','','批量更新栏目','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('166','Content','admin_url','content/createhtml/update_urls','','批量更新URL','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('167','Content','admin_url','content/createhtml/update_show','','批量更新内容页','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('168','Socialplatform','admin_url','socialplatform/index/index','','社交平台','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('169','Socialplatform','admin_url','socialplatform/index/show','','社交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('170','Socialplatform','admin_url','socialplatform/indexadmin/index','','其它','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('171','Socialplatform','admin_url','socialplatform/indexadmin/show','','社交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('172','Socialplatform','admin_url','socialplatform/indexadmin/technical','','技术顾问','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('173','Content','admin_url','content/contents/index','','内容管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('174','Admin','admin_url','admin/statistical/default','','统计分析','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('175','Statistics','admin_url','statistics/articlestatistics/statisticsarticle','','文章统计','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('176','Portal','admin_url','portal/adminterm/singlepage','','添加单页','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('177','Portal','admin_url','portal/adminterm/wadd','','添加外部链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('178','Portal','admin_url','portal/adminterm/categoryshux','','终极属性转换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('179','Portal','admin_url','portal/adminterm/public_cache','','分类更新缓存','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('180','Content','admin_url','content/urlrule/index','','URL规则管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('181','Content','admin_url','content/urlrule/add','','URL规则添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('182','Content','admin_url','content/urlrule/add_post','','URL规则添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('183','Content','admin_url','content/urlrule/edit','','URL规则编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('184','Content','admin_url','content/urlrule/edit_post','','Url规则编辑提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('185','Content','admin_url','content/urlrule/delete','','URL规则删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('186','Content','admin_url','content/category/index','','分类管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('187','Content','admin_url','content/category/add','','添加分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('188','Content','admin_url','content/category/add_post','','提交添加','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('189','Content','admin_url','content/category/categoryshux','','终极属性转换','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('190','Content','admin_url','content/category/delete','','删除分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('191','Content','admin_url','content/category/edit','','编辑分类','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('192','Content','admin_url','content/category/edit_post','','提交编辑','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('193','Content','admin_url','content/category/listorders','','文章分类排序','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('194','Content','admin_url','content/category/public_cache','','分类更新缓存','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('195','Content','admin_url','content/category/singlepage','','添加单页','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('196','Content','admin_url','content/category/wadd','','添加外部链接','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('197','Statistics','admin_url','statistics/productsstatistics/statisticsproducts','','产品统计','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('198','Release','admin_url','release/release/default','','营销管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('199','Release','admin_url','release/release/index','','营销列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('200','Release','admin_url','release/release/add','','添加B2B平台','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('201','Statistics','admin_url','statistics/inquirystatistics/statisticsinauiry','','询盘统计','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('202','Statistics','admin_url','statistics/inquirystatistics/statisticsinquiry','','询盘统计','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('203','Release','admin_url','release/release/add_post','','B2B平台添加提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('204','Admin','admin_url','admin/setting/logo','','logo管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('205','Release','admin_url','release/release/edit','','修改信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('206','Release','admin_url','release/release/edit_post','','修改信息提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('207','Release','admin_url','release/release/delete','','营销平台删除','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('208','Release','admin_url','release/release/product','','选择产品','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('209','Release','admin_url','release/release/post_product','','发布产品到营销平台','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('210','Content','admin_url','content/report/default','','统计报告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('211','Content','admin_url','content/report/index','','统计列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('212','Statistics','admin_url','statistics/report/index','','生成统计报告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('213','Statistics','admin_url','statistics/foreignvis/index','','外商浏览量统计','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('214','User','admin_url','user/indexadmin/salesman','','业务员','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('215','Statistics','admin_url','statistics/keywordsrank/index','','关键词排名查询','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('216','Content','admin_url','content/category/listtdk','','关键词管理','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('217','Content','admin_url','content/tkslibrary/index','','关键词库','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('218','Statistics','admin_url','statistics/report/creport','','生成报告预览','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('219','Statistics','admin_url','statistics/report/zcpppdf','','生成报告','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('220','Statistics','admin_url','statistics/report/commentlist','','报告评论列表','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('221','Statistics','admin_url','statistics/report/editcomment','','修改评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('222','Statistics','admin_url','statistics/report/edit_post','','修改评论提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('223','Statistics','admin_url','statistics/report/delete','','删除评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('224','Statistics','admin_url','statistics/report/addcomment','','新增评论','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('225','Statistics','admin_url','statistics/report/add_post','','新增评论提交','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('226','Search','admin_url','search/search/index','','个人信息','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('227','Socialplatform','admin_url','socialplatform/indexadmin/reminder','','服务器和域名提醒','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('228','Statistics','admin_url','statistics/report/default','','统计分析','1','');
INSERT INTO cmf_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('229','Statistics','admin_url','statistics/report/main','','统计分析','1','');
DROP TABLE IF EXISTS `cmf_category`;
CREATE TABLE `cmf_category` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('1','content','0','1','','0','0','1','1,6,7','News','','','','news','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=1','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=1','0','a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:0:\"\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";N;}','3','1','0','news');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('2','content','0','5','','0','0','1','2,9,10,54,11,51,55','Products','','Products','','products','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=2','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=2','0','a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:0:\"\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";N;}','1','1','0','products');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('25','content','1','0','','0','0','0','25','Contact Us','','','','contact-us','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=25','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=25','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:14:\"page_lxwm.html\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}','5','1','0','contact us');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('18','content','0','3','','0','0','0','18','Application','','','','application','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pic&catid=18','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pic&catid=18','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:13:\"list_pic.html\";s:13:\"show_template\";s:13:\"show_pic.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"17\";s:11:\"show_ruleid\";s:2:\"21\";}','4','1','0','application');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('23','content','1','0','','21','0,21','0','23','公司证书','','','about-us/','certificate','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=23','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=23','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}','0','1','0','gongsizhengshu');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('6','content','0','1','','1','0,1','0','6','Industry News','','','news/','industry-news','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=6','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=6','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";s:2:\"22\";}','0','1','0','industry news');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('7','content','0','1','','1','0,1','0','7','Company News','','','news/','company-news','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=7','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=7','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";s:2:\"22\";}','0','1','0','company news');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('51','content','0','5','','2','0,2','0','51','Leisure Grass','','Leisure Grass','products/','leisure-grass','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=51','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=51','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:47:\"Leisure Grass manufacturer & supplier in china \";s:13:\"meta_keywords\";s:13:\"Leisure Grass\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}','0','1','0','leisure grass');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('40','content','0','1','','31','0,31','0','40','Industry News','','','service/','industry-news','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=40','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=40','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:47:\"Industry News manufacturer & supplier in china \";s:13:\"meta_keywords\";s:13:\"Industry News\";s:16:\"meta_description\";s:15:\"Industry News22\";s:17:\"category_template\";s:13:\"category.html\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}','0','1','0','industry news');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('9','content','0','5','','2','0,2','1','9,10,54','Landscape Grass','','','products/','landscape-grass','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=9','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=9','0','a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:0:\"\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";N;}','0','1','0','landscape grass');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('10','content','0','5','','9','0,2,9','0','10','Football','','','products/landscape-grass/','football','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=10','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=10','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:5:\"heloo\";s:13:\"meta_keywords\";s:5:\"happy\";s:16:\"meta_description\";s:8:\"I am new\";s:13:\"list_template\";s:13:\"list_pro.html\";s:13:\"show_template\";s:13:\"show_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";s:2:\"23\";}','0','1','0','football');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('11','content','0','5','','2','0,2','0','11','Sports Grass','','Sports Grass','products/','sports-grass','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=11','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=11','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:13:\"list_pro.html\";s:13:\"show_template\";s:13:\"show_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";s:2:\"23\";}','0','1','0','sports grass');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('21','content','1','0','','0','0','1','21,22,23','About us','','','','about-us','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=21','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=21','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:2:\"22\";s:13:\"meta_keywords\";s:2:\"23\";s:16:\"meta_description\";s:2:\"24\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}','2','1','0','about us');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('22','content','1','0','','21','0,21','0','22','公司介绍','','','about-us/','company','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=22','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=22','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}','0','1','0','gongsijieshao');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('17','content','0','2','','0','0','0','17','下载','','','','download','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_down&catid=17','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_down&catid=17','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:14:\"list_down.html\";s:13:\"show_template\";s:14:\"show_down.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"20\";s:11:\"show_ruleid\";s:2:\"24\";}','10','0','0','xiazai');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('30','content','0','1','','0','0','0','30','News','','<p>News</p>','','news','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=30','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=30','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:38:\"News manufacturer & supplier in china \";s:13:\"meta_keywords\";s:4:\"News\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:9:\"list.html\";s:13:\"show_template\";s:9:\"show.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";s:1:\"4\";}','0','0','0','news');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('31','content','1','0','','0','0','1','31,40','Service','','<p>Service</p>','','service','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=31','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=31','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}','0','0','0','service');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('49','content','0','5','','48','0,48','0','49','分页1','','','ppp/','page1','http://192.168.0.68/thinkcmf/html/ppp/page1/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=49','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:41:\"分页1 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:7:\"分页1\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:13:\"list_pro.html\";s:13:\"show_template\";s:13:\"show_pro.html\";s:6:\"ishtml\";s:1:\"1\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:2:\"26\";s:11:\"show_ruleid\";s:2:\"31\";}','0','1','1','fenye1');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('48','content','0','5','','0','0','1','48,49,53','测试静态分页','','','','ppp','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=48','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=48','0','a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:52:\"测试静态分页 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:18:\"测试静态分页\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";N;}','0','0','0','ceshijingtaifenye');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('55','content','0','5','','2','0,2','1','55','Leisure Grass','','<p>Leisure Grass</p>','products/','leisure-grass','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=55','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=55','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:47:\"Leisure Grass manufacturer & supplier in china \";s:13:\"meta_keywords\";s:13:\"Leisure Grass\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_pro.html\";s:13:\"list_template\";s:13:\"list_pro.html\";s:13:\"show_template\";s:13:\"show_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";s:2:\"23\";}','0','1','0','leisure grass');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('53','content','0','5','','48','0,48','0','53','栏目二','','','ppp/','lmer','http://192.168.0.68/thinkcmf/html/ppp/lmer/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=53','0','a:13:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:43:\"栏目二 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:9:\"栏目二\";s:16:\"meta_description\";s:0:\"\";s:13:\"list_template\";s:13:\"list_pro.html\";s:13:\"show_template\";s:13:\"show_pro.html\";s:6:\"ishtml\";s:1:\"1\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:2:\"26\";s:11:\"show_ruleid\";s:2:\"31\";}','0','1','1','lanmuer');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('56','content','0','1','','0','0','1','56,57,63,58,60,61,62,65,66,59','陈测试试','','<p>这是栏目简介啊</p>','','cxx','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=56','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=56','0','a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:43:\"陈测试 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:12:\"陈测试啊\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";N;}','0','0','0','chenceshishi');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('54','content','0','5','','9','0,2,9','0','54','Football xx','','<p>Football xx</p>','products/landscape-grass/','football-xx','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=54','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_pro&catid=54','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:45:\"Football xx manufacturer & supplier in china \";s:13:\"meta_keywords\";s:11:\"Football xx\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_pro.html\";s:13:\"list_template\";s:13:\"list_pro.html\";s:13:\"show_template\";s:13:\"show_pro.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"19\";s:11:\"show_ruleid\";s:2:\"23\";}','0','1','0','football xx');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('57','content','0','1','','56','0,56','1','57,63','陈测试静动','','','cxx/','chenceshidongjing','http://192.168.0.68/thinkcmf/html/cxx/chenceshidongjing/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=57','0','a:12:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:49:\"陈测试动静 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:15:\"陈测试动静\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:6:\"ishtml\";s:1:\"1\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"27\";s:11:\"show_ruleid\";N;}','0','1','1','chenceshijingdong');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('58','content','0','1','','56','0,56','1','58,60,61,62,65,66','陈测试动静','','','cxx/','chenceshidongjing','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=58','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=58','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:34:\" manufacturer & supplier in china \";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";s:2:\"30\";}','0','1','0','chenceshidongjing');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('59','content','0','1','','56','0,56','0','59','陈测试静静','','','cxx/','chenceshijingjing','http://192.168.0.68/thinkcmf/html/cxx/chenceshijingjing/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=59','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:49:\"陈测试静静 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:15:\"陈测试静静\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"1\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:2:\"27\";s:11:\"show_ruleid\";s:2:\"30\";}','0','1','1','chenceshijingjing');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('60','content','0','1','','58','0,56,58','0','60','动静子栏目1','','','cxx/chenceshidongjing/','dongjingzilanmu1','http://192.168.0.68/thinkcmf/html/cxx/chenceshidongjing/dongjingzilanmu1/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=60','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:50:\"动静子栏目1 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:16:\"动静子栏目1\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"1\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:2:\"27\";s:11:\"show_ruleid\";s:2:\"30\";}','0','1','1','dongjingzilanmu1');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('61','content','0','1','','58','0,56,58','0','61','动静子栏目2','','','cxx/chenceshidongjing/','dongjingzilanmu2','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=61','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=61','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:50:\"动静子栏目2 manufacturer & supplier in china \";s:13:\"meta_keywords\";s:16:\"动静子栏目2\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";s:2:\"22\";}','0','1','0','dongjingzilanmu2');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('62','content','1','0','','58','0,56,58','1','62,65','陈单页1','','','cxx/chenceshidongjing/','chendanye1','http://192.168.0.68/thinkcmf/html/cxx/chenceshidongjing/chendanye1/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=62','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:69:\"Manufacture , Factory China,Custom ,manufacturer & supplier in china \";s:13:\"meta_keywords\";s:30:\" Wholesale,Sale ,High Quality \";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:1:\"2\";s:11:\"show_ruleid\";N;}','0','1','1','chendanye1');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('63','content','1','0','','57','0,56,57','1','63','单页2','','<p>asdfasdfasdf<br/></p>','cxx/chenceshidongjing/','danye2','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=63','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=63','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:61:\" China,Manufacture ,Custom ,manufacturer & supplier in china \";s:13:\"meta_keywords\";s:24:\" China, for Sale,Custom \";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:1:\"1\";s:11:\"show_ruleid\";N;}','0','1','0','danye2');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('65','content','1','0','','62','0,56,58,62','0','65','陈单页2','','','cxx/chenceshidongjing/chendanye1/','chendanye2','http://192.168.0.68/thinkcmf/html/cxx/chenceshidongjing/chendanye1/chendanye2/','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=lists&catid=65','0','a:8:{s:6:\"seturl\";s:0:\"\";s:10:\"meta_title\";s:0:\"\";s:13:\"meta_keywords\";s:0:\"\";s:16:\"meta_description\";s:0:\"\";s:13:\"page_template\";s:9:\"page.html\";s:6:\"ishtml\";s:1:\"1\";s:15:\"category_ruleid\";s:1:\"2\";s:11:\"show_ruleid\";N;}','0','1','1','chendanye2');
INSERT INTO cmf_category ( `catid`, `module`, `type`, `modelid`, `domain`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `image`, `description`, `parentdir`, `catdir`, `url`, `moveurl`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter` ) VALUES  ('66','content','0','1','','58','0,56,58','1','66','陈枭啊啊啊','','','cxx/chenceshidongjing/','chenzuoaaa','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=66','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=list_art&catid=66','0','a:14:{s:6:\"seturl\";s:0:\"\";s:12:\"generatehtml\";s:1:\"1\";s:12:\"generatelish\";s:1:\"0\";s:10:\"meta_title\";s:60:\" Company,China , Wholesale,manufacturer & supplier in china \";s:13:\"meta_keywords\";s:34:\"Export , Manufacturer China, Price\";s:16:\"meta_description\";s:0:\"\";s:17:\"category_template\";s:17:\"category_new.html\";s:13:\"list_template\";s:13:\"list_new.html\";s:13:\"show_template\";s:13:\"show_new.html\";s:6:\"ishtml\";s:1:\"0\";s:9:\"repagenum\";s:0:\"\";s:14:\"content_ishtml\";s:1:\"0\";s:15:\"category_ruleid\";s:2:\"18\";s:11:\"show_ruleid\";s:2:\"22\";}','0','1','0','chenzuoaaa');
DROP TABLE IF EXISTS `cmf_category_field`;
CREATE TABLE `cmf_category_field` (
  `fid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `fieldname` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '类型,input',
  `setting` mediumtext COMMENT '其他',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`fid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_category_priv`;
CREATE TABLE `cmf_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '角色或者组ID',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为管理员 1、管理员',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '动作',
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('6','2','1','add');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('6','2','1','edit');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('11','2','1','delete');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('11','2','1','edit');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('11','2','1','listorder');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('11','2','1','push');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('11','2','1','remove');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('56','3','1','add');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('56','3','1','delete');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('56','3','1','edit');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('56','3','1','listorder');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('56','3','1','push');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('56','3','1','remove');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('57','3','1','add');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('57','3','1','delete');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('57','3','1','edit');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('57','3','1','listorder');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('57','3','1','push');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('57','3','1','remove');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('58','3','1','add');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('58','3','1','delete');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('58','3','1','edit');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('58','3','1','listorder');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('58','3','1','push');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('58','3','1','remove');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('59','3','1','add');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('59','3','1','delete');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('59','3','1','edit');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('59','3','1','listorder');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('59','3','1','push');
INSERT INTO cmf_category_priv ( `catid`, `roleid`, `is_admin`, `action` ) VALUES  ('59','3','1','remove');
DROP TABLE IF EXISTS `cmf_comments`;
CREATE TABLE `cmf_comments` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_common_action_log`;
CREATE TABLE `cmf_common_action_log` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('1','10','posts1','Portal-Article-do_like','1','1463738383','0.0.0.0');
DROP TABLE IF EXISTS `cmf_cxtest`;
CREATE TABLE `cmf_cxtest` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(24) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
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
  `seotitle` varchar(255) NOT NULL DEFAULT '',
  `seokeywords` varchar(255) NOT NULL DEFAULT '',
  `seodescription` varchar(255) NOT NULL DEFAULT '',
  `moveurl` varchar(255) NOT NULL DEFAULT '' COMMENT '动态url地址',
  `seourl` varchar(255) NOT NULL DEFAULT '',
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_cxtest_data`;
CREATE TABLE `cmf_cxtest_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_download`;
CREATE TABLE `cmf_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
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
  `seotitle` varchar(255) NOT NULL,
  `seokeywords` varchar(255) NOT NULL,
  `seodescription` varchar(255) NOT NULL,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_download ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `prefix`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('4','17','0','下载一','','','我是下载','','最新的下载','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_down&catid=17&id=4','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_down&catid=17&id=4','0','99','0','0','1','0','admin','1464574354','1464574354','0','0','0','0','0','0','',' ',' ','','','0');
DROP TABLE IF EXISTS `cmf_download_data`;
CREATE TABLE `cmf_download_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `download` text,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_download_data ( `id`, `template`, `paytype`, `allow_comment`, `relation`, `download` ) VALUES  ('4','','0','1','','[{\"fileurl\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d4d062bef6.zip\",\"filename\":\"reanod\"}]');
DROP TABLE IF EXISTS `cmf_guestbook`;
CREATE TABLE `cmf_guestbook` (
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
  `salesman` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员备注',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  `from_country` varchar(255) NOT NULL COMMENT '询盘客户来自哪个国家',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('1','大好人','123@qq.com','钳子多少钱？','希望尽快回复','','','','','','2016-05-19 03:18:03','0','','1','美国');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('2','小好人','456@qq.com','锤子多少钱','不用理我，只是测试','','','','','','2016-05-28 14:08:24','0','','1','日本');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('3','老好人','789@qq.com','扳子要不要钱？','不要，还给你钱','','','','','','2016-05-28 14:47:31','0','','1','阿拉伯');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('4','郝仁','369@qq.com','房子免费不要钱','不要，不要，真不要','','','','','','2016-05-31 17:33:08','0','','1','英国');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('5','真强','123@qq.com','','你买的东西太好了','','','','','','2016-05-28 11:00:37','0','','1','日本');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('6','帅气','sdu@qq.com','','这是太好了，你好的','','','','','','2016-06-02 11:13:05','1','6/3 17：:1','1','china');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('7','234','3233816752@qq.com','','34232342342','','','','','','2016-06-02 11:19:06','1','','1','2342');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('8','最新的','222@qq.com','','很喜欢你们的网站','','','','','','2016-06-02 11:24:02','13','速度','1','日本');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('9','123123','1111@qq.com','2222','11点39分','','','','','','2016-06-02 11:40:07','1','这个很有希望，赶紧联系','1','china');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('10','姓名','qq@qq.com','','内容','','','','','','2016-06-08 10:39:50','0','','1','中国');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('11','zhangsan','lisi@qq.com','','henhao','reanod','15511111111','15511111112','sjz','2','2016-06-12 17:11:52','0','','1','china');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('12','wangwu','wangwu@qq.com','','hahahahaha','reanod','15511111111','15511111111','sjz','
    &lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2&quot; title=&quot;dachuizi1222&quot;&gt;dachuizi1222&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=5&quot; title=&quot;futou&quot;&gt;futou&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=8&quot; title=&quot;小钳子&quot;&gt;小钳子&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=30&quot; title=&quot;修理工具&quot;&gt;修理工具&lt;/a&gt;    ','2016-06-13 16:41:50','0','','1','china');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('13','zuixin','haod@qq.com','','jaskldfjalksdfjklasjdfklasjfklsajdflkjasfkl','123123','15511111111','15511111111','sjz','
    &lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=1&quot; title=&quot;shoutao12332&quot;&gt;shoutao12332&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2&quot; title=&quot;dachuizi1222&quot;&gt;dachuizi1222&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=5&quot; title=&quot;futou&quot;&gt;futou&lt;/a&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=30&quot; title=&quot;修理工具&quot;&gt;修理工具&lt;/a&gt;    ','2016-06-13 16:57:16','0','','1','china');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('14','shuaxin','shuaxin@qq.com','','sajdflkasjeriojgkldmbl;kxc;lfhgikp[[dsfklv;jksdlfjkljaskldfajlk','shaxin','15511111111','15511111111','sjz','
    &lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=8&quot; title=&quot;小钳子&quot;&gt;小钳子&lt;/a&gt;&lt;br /&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=30&quot; title=&quot;修理工具&quot;&gt;修理工具&lt;/a&gt;&lt;br /&gt;    ','2016-06-13 16:58:30','0','','1','china');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('15','test','test@qq.com','','test','','tel','','','
    &lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2&quot; title=&quot;dachuizi1222&quot; target=&quot;_blank&quot;&gt;dachuizi1222&lt;/a&gt;&lt;br /&gt;&lt;a href=&quot;http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=5&quot; title=&quot;futou&quot; target=&quot;_blank&quot;&gt;futou&lt;/a&gt;&lt;br /&gt;    ','2016-06-14 16:06:09','0','','1','ete');
INSERT INTO cmf_guestbook ( `id`, `full_name`, `email`, `title`, `msg`, `company_name`, `tel`, `fax`, `address`, `pid`, `createtime`, `salesman`, `content`, `status`, `from_country` ) VALUES  ('16','123321','123321@qq.com','','123123123','','15511111111','','','
        ','2016-06-23 11:39:06','0','','1','');
DROP TABLE IF EXISTS `cmf_links`;
CREATE TABLE `cmf_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_time` int(11) DEFAULT NULL COMMENT '友情链接添加时间',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_links ( `link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_time`, `link_status`, `link_rating`, `link_rel`, `listorder` ) VALUES  ('1','http://www.thinkcmf.com','ThinkCMF2','','_blank','','','1','0','','0');
DROP TABLE IF EXISTS `cmf_locking`;
CREATE TABLE `cmf_locking` (
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `catid` smallint(5) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `id` mediumint(8) NOT NULL DEFAULT '0' COMMENT '信息ID',
  `locktime` int(10) NOT NULL DEFAULT '0' COMMENT '锁定时间',
  KEY `userid` (`userid`),
  KEY `onlinetime` (`locktime`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_locking ( `userid`, `username`, `catid`, `id`, `locktime` ) VALUES  ('1','admin','17','4','1466759195');
DROP TABLE IF EXISTS `cmf_menu`;
CREATE TABLE `cmf_menu` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Content','Category','index','','0','1','分类管理','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Content','Category','listorders','','1','0','文章分类排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Content','Category','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Content','Category','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Content','Category','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Content','Category','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Content','Category','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','5');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','1','插件管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','邮件模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','39','Admin','Storage','index','','1','1','文件存储','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','54','Admin','Slide','ban','','1','0','禁用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','54','Admin','Slide','cancelban','','1','0','启用幻灯片','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','149','Admin','User','ban','','1','0','禁用管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('161','149','Admin','User','cancelban','','1','0','启用管理员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('162','1','Content','Models','index','','1','1','模型管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('163','1','Content','Createhtml','default','','1','1','发布管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('164','163','Content','Createhtml','index','','1','1','生成首页','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('165','163','Content','Createhtml','category','','1','1','批量更新栏目','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('166','163','Content','Createhtml','update_urls','','1','1','批量更新URL','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('167','163','Content','Createhtml','update_show','','1','1','批量更新内容页','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('168','0','Socialplatform','Indexadmin','Index','','1','1','其它','bell-o','','50');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('169','168','Socialplatform','Indexadmin','show','','1','1','社交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('170','168','Socialplatform','Indexadmin','technical','','1','1','技术顾问','asterisk','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('171','1','Content','Contents','index','','1','1','内容管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('172','0','Statistics','Report','main','','0','1','统计分析','area-chart','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('173','172','Statistics','ArticleStatistics','statisticsArticle','','1','1','文章统计','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('174','18','Content','Category','singlepage','','1','0','添加单页','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('175','18','Content','Category','wadd','','1','0','添加外部链接','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('176','18','Content','Category','categoryshux','','1','0','终极属性转换','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('177','18','Content','Category','public_cache','','1','0','分类更新缓存','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('178','1','Content','Urlrule','index','','1','1','URL规则管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('179','178','Content','Urlrule','add','','1','0','URL规则添加','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('180','179','Content','Urlrule','add_post','','1','0','URL规则添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('181','178','Content','Urlrule','edit','','1','0','URL规则编辑','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('182','181','Content','Urlrule','edit_post','','1','0','Url规则编辑提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('183','178','Content','Urlrule','delete','','1','0','URL规则删除','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('184','172','Statistics','ProductsStatistics','statisticsProducts','','1','1','产品统计','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('185','0','Release','Release','default','','1','1','营销管理','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('186','185','Release','Release','index','','1','1','营销列表','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('187','185','Release','Release','add','','1','1','添加B2B平台','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('188','172','Statistics','inquiryStatistics','statisticsInquiry','','1','1','询盘统计','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('189','187','Release','Release','add_post','','1','0','B2B平台添加提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('190','109','Admin','Setting','logo','','1','1','logo管理','wheelchair','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('191','186','Release','Release','edit','','1','0','修改信息','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('192','191','Release','Release','edit_post','','1','0','修改信息提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('193','186','Release','Release','delete','','1','0','营销平台删除','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('194','186','Release','Release','product','','1','0','选择产品','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('195','194','Release','Release','post_product','','1','0','发布产品到营销平台','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('198','172','Statistics','Report','index','','1','1','生成统计报告','','','1');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('199','172','Statistics','Foreignvis','index','','1','1','外商浏览量统计','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('200','132','User','Indexadmin','salesman','','1','1','业务员','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('201','172','Statistics','Keywordsrank','index','','1','1','关键词排名查询','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('202','1','Content','Category','listtdk','','1','1','关键词管理','','','3');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('203','1','Content','Tkslibrary','index','','1','1','关键词库','','','4');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('204','198','Statistics','Report','creport','','1','0','生成报告预览','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('205','204','Statistics','Report','zcpppdf','','1','0','生成报告','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('206','198','Statistics','Report','commentList','','1','0','报告评论列表','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('207','206','Statistics','Report','editComment','','1','0','修改评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('208','206','Statistics','Report','edit_post','','1','0','修改评论提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('209','206','Statistics','Report','delete','','1','0','删除评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('210','198','Statistics','Report','addComment','','1','0','新增评论','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('211','210','Statistics','Report','add_post','','1','0','新增评论提交','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('212','109','Search','Search','index','','1','1','搜索设置','','','0');
INSERT INTO cmf_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('213','168','Socialplatform','Indexadmin','reminder','','1','1','服务器和域名提醒','','','0');
DROP TABLE IF EXISTS `cmf_model`;
CREATE TABLE `cmf_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_model ( `modelid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type` ) VALUES  ('1','文章模型','文章模型','article','','1403150253','0','1','0','','','','','','0','0');
INSERT INTO cmf_model ( `modelid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type` ) VALUES  ('2','下载模型','下载模型','download','','1403153866','0','1','0','','','','','','0','0');
INSERT INTO cmf_model ( `modelid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type` ) VALUES  ('3','图片模型','图片模型','photo','','1403153881','0','1','0','','','','','','0','0');
INSERT INTO cmf_model ( `modelid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type` ) VALUES  ('5','产品','产品模型','product','','1463623520','0','0','0','','','','','','0','0');
INSERT INTO cmf_model ( `modelid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type` ) VALUES  ('24','试试','一个测试表','aaaaa','','1466472670','0','0','0','','','','','','0','0');
INSERT INTO cmf_model ( `modelid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type` ) VALUES  ('26','陈枭测试','这是一个测试','cxtest','','1466489655','0','0','0','','','','','','0','0');
DROP TABLE IF EXISTS `cmf_model_field`;
CREATE TABLE `cmf_model_field` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('1','1','status','状态','','','0','2','','','box','a:8:{s:7:\"options\";s:0:\"\";s:9:\"fieldtype\";s:7:\"varchar\";s:5:\"width\";s:0:\"\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"outputtype\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('2','1','username','用户名','','','0','20','','','text','a:5:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','1','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('3','1','islink','转向链接','','','0','0','','','islink','a:3:{s:4:\"size\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','0','0','1','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('4','1','template','内容页模板','','','0','30','','','template','a:2:{s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('5','1','allow_comment','允许评论','','','0','0','','','box','a:10:{s:7:\"options\";s:32:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','0','0','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('7','1','inputtime','真实发布时间','','','0','0','','','datetime','a:5:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','0','0','0','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('140','4','istop','置顶','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('141','4','recommend','推荐','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('9','1','url','URL','','','0','100','','','text','a:5:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','1','0','0','0','1','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('10','1','listorder','排序','','','0','6','','','number','a:7:{s:9:\"minnumber\";s:0:\"\";s:9:\"maxnumber\";s:0:\"\";s:13:\"decimaldigits\";s:1:\"0\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('11','1','relation','相关文章','','','0','255','','','omnipotent','a:4:{s:8:\"formtext\";s:464:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >
<ul class=\"list-dot\" id=\"relation_text\">
</ul>
<input type=\"button\" value=\"添加相关\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加相关文章\',1)\" class=\"btn\">
<span class=\"edit_content\">
  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">
</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','1','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('12','1','thumb','缩略图','','','0','100','','','image','a:10:{s:5:\"width\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('13','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:2:{s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('15','1','title','标题','','inputtitle','1','80','','请输入标题','title','a:2:{s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('17','1','tags','TAGS','多关之间用空格或者“,”隔开','','0','0','','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','0','0','0','4','1','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('18','1','description','摘要','','','0','255','','','textarea','a:7:{s:5:\"width\";s:2:\"99\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('19','1','updatetime','发布时间','','','0','0','','','datetime','a:5:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','0','0','0','0','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('20','1','content','内容','<style type=\"text/css\">.content_attr{ border:1px solid #CCC; padding:5px 8px; background:#FFC; margin-top:6px}</style><div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要
<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片
</div>','','1','999999','','内容不能为空','editor','a:7:{s:7:\"toolbar\";s:4:\"full\";s:12:\"defaultvalue\";s:0:\"\";s:15:\"enablesaveimage\";s:1:\"1\";s:6:\"height\";s:0:\"\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','1','0','1','1','0','6','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('21','1','copyfrom','来源','','','0','0','','','copyfrom','a:4:{s:12:\"defaultvalue\";s:0:\"\";s:5:\"width\";s:0:\"\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','1','0','1','0','0','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('26','2','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('27','2','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('28','2','template','内容页模板','','','0','30','','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('29','2','allow_comment','允许评论','','','0','0','','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','','0','0','0','0','0','0','0','0','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('24','1','prefix','自定义文件名','','','0','255','','','text','a:5:{s:4:\"size\";s:3:\"180\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','0','0','0','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('66','3','prefix','自定义文件名','','','0','0','','','text','a:7:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','0','0','0','0','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('25','2','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('65','2','prefix','自定义文件名','','','0','0','','','text','a:7:{s:4:\"size\";s:3:\"180\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','0','0','0','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('31','2','inputtime','真实发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','1','1','0','0','0','0','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('137','2','recommend','推荐','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('138','3','istop','置顶','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('139','3','recommend','推荐','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('33','2','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','1','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('34','2','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('35','2','relation','相关下载','','','0','255','','','omnipotent','a:4:{s:8:\"formtext\";s:464:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >
<ul class=\"list-dot\" id=\"relation_text\">
</ul>
<input type=\"button\" value=\"添加相关\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加相关信息\',1)\" class=\"btn\">
<span class=\"edit_content\">
  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">
</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','1','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('36','2','thumb','缩略图','','','0','100','','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('37','2','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('38','2','typeid','类别','','','0','0','','','typeid','a:2:{s:9:\"minnumber\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','','','1','1','0','1','1','1','0','0','2','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('39','2','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('41','2','tags','TAGS','多关之间用空格或者“,”隔开','','0','0','','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','0','0','0','4','1','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('42','2','description','摘要','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('43','2','updatetime','发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','0','1','0','0','0','0','0','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('45','3','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('46','3','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('47','3','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('48','3','template','内容页模板','','','0','30','','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('49','3','allow_comment','允许评论','','','0','0','','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','','0','0','0','0','0','0','0','0','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('67','2','download','文件下载','','','0','0','','','downfiles','a:9:{s:15:\"upload_allowext\";s:20:\"gif|jpg|jpeg|png|bmp\";s:13:\"isselectimage\";s:1:\"0\";s:13:\"upload_number\";s:2:\"10\";s:10:\"statistics\";s:0:\"\";s:12:\"downloadlink\";s:1:\"1\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','0','0','1','0','1','0','0','4','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('51','3','inputtime','真实发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','1','1','0','0','0','0','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('136','2','istop','置顶','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('53','3','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','1','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('54','3','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('55','3','relation','相关图片','','','0','255','','','omnipotent','a:4:{s:8:\"formtext\";s:464:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >
<ul class=\"list-dot\" id=\"relation_text\">
</ul>
<input type=\"button\" value=\"添加相关\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加相关信息\',1)\" class=\"btn\">
<span class=\"edit_content\">
  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">
</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','1','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('56','3','thumb','缩略图','','','0','100','','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('57','3','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('59','3','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('382','1','seourl','seourl','','inputtitle','1','80','','','seourl','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('383','2','seourl','seourl','','inputtitle','1','80','','','seourl','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('61','3','tags','TAGS','多关之间用空格或者“,”隔开','','0','0','','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','0','0','0','4','1','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('62','3','description','摘要','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('63','3','updatetime','发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','0','1','0','0','0','0','0','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('68','3','imgs','图片列表','','','0','0','','','images','a:8:{s:15:\"upload_allowext\";s:20:\"gif|jpg|jpeg|png|bmp\";s:13:\"isselectimage\";s:1:\"0\";s:13:\"upload_number\";s:2:\"10\";s:9:\"watermark\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('69','4','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('70','4','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('71','4','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('72','4','template','内容页模板','','','0','30','','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('73','4','allow_comment','允许评论','','','0','0','','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','','0','0','0','0','0','0','0','0','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('75','4','inputtime','真实发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','1','1','0','0','0','0','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('77','4','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','1','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('78','4','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('79','4','relation','相关文章','','','0','255','','','omnipotent','a:4:{s:8:\"formtext\";s:464:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >
<ul class=\"list-dot\" id=\"relation_text\">
</ul>
<input type=\"button\" value=\"添加相关\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加相关文章\',1)\" class=\"btn\">
<span class=\"edit_content\">
  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">
</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','1','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('80','4','thumb','缩略图','','','0','100','','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('81','4','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('82','4','typeid','类别','','','0','0','','','typeid','a:2:{s:9:\"minnumber\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','','','1','1','0','1','1','1','0','0','2','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('83','4','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('384','3','seourl','seourl','','inputtitle','1','80','','','seourl','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('85','4','tags','TAGS','多关之间用空格或者“,”隔开','','0','0','','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','0','0','0','4','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('86','4','description','摘要','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('87','4','updatetime','发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','0','1','0','0','0','0','0','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('88','4','content','内容','<style type=\"text/css\">.content_attr{ border:1px solid #CCC; padding:5px 8px; background:#FFC; margin-top:6px}</style><div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要
<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片
</div>','','1','999999','','内容不能为空','editor','a:6:{s:7:\"toolbar\";s:4:\"full\";s:12:\"defaultvalue\";s:0:\"\";s:13:\"enablekeylink\";s:1:\"1\";s:10:\"replacenum\";s:1:\"2\";s:9:\"link_mode\";s:1:\"0\";s:15:\"enablesaveimage\";s:1:\"1\";}','','','','0','0','0','1','0','1','1','0','6','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('89','5','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('90','5','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','21','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('91','5','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','22','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('92','5','template','内容页模板','','','0','30','','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('93','5','allow_comment','允许评论','','','0','0','','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','','0','0','0','0','0','0','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('95','5','inputtime','真实发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','1','1','0','0','0','0','0','1','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('135','1','recommend','推荐','','','0','2','','','box','a:8:{s:7:\"options\";s:0:\"\";s:9:\"fieldtype\";s:7:\"varchar\";s:5:\"width\";s:0:\"\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"outputtype\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('97','5','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','1','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('98','5','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','23','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('99','5','relation','相关产品','','','0','255','','','omnipotent','a:4:{s:8:\"formtext\";s:470:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >
<ul class=\"list-dot\" id=\"relation_text\">
</ul>
<input type=\"button\" value=\"添加相关\" onClick=\"omnipotent(\'selectid\',GV.DIMAUB+\'index.php?a=public_relationlist&m=Content&g=Content&modelid={MODELID}\',\'添加相关文章\',1)\" class=\"btn\">
<span class=\"edit_content\">
  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">
</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','1','0','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('100','5','thumb','缩略图','','','0','100','','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('101','5','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','0','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('102','5','typeid','类别','','','0','0','','','typeid','a:2:{s:9:\"minnumber\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','','','1','1','0','1','1','1','0','0','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('103','5','title','产品名称','','inputtitle','1','80','','请输入标题','title','a:2:{s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','1','0','1','1','1','1','1','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('105','5','tags','TAGS','多关之间用空格或者“,”隔开','','0','0','','','tags','a:4:{s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','0','0','0','0','1','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('106','5','description','摘要','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('107','5','updatetime','发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','0','1','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('108','5','content','产品描述','','','1','999999','','内容不能为空','editor','a:7:{s:7:\"toolbar\";s:4:\"full\";s:12:\"defaultvalue\";s:89:\"<php> echo str_replace(array(\'\"\', \"\'\"), array(\'\"\', \'\'\'), $setting[\'defaultvalue\']);</php>\";s:15:\"enablesaveimage\";s:1:\"1\";s:6:\"height\";s:0:\"\";s:9:\"fieldtype\";s:10:\"mediumtext\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','1','0','1','1','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('110','5','size','产品型号','','','0','50','','','text','a:7:{s:4:\"size\";s:2:\"30\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','1','1','0','6','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('109','5','price','价格','','','1','7','/^[0-9.-]+$/','请填写价格！','text','a:7:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"ispassword\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:17:\"backstagefun_type\";s:1:\"1\";s:8:\"frontfun\";s:0:\"\";s:13:\"frontfun_type\";s:1:\"1\";}','','','','0','1','0','1','0','1','0','0','6','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('569','24','seourl','seourl','','inputtitle','1','80','','','seourl','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('570','24','isdelay','是否推迟','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('567','24','seokeywords','SEO关键字','多关键词之间用空格隔开','','0','40','','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','1','0','4','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('568','24','seodescription','SEO描述','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('566','24','seotitle','SEO标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('134','1','istop','置顶','','','0','2','','','box','a:8:{s:7:\"options\";s:0:\"\";s:9:\"fieldtype\";s:7:\"varchar\";s:5:\"width\";s:0:\"\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"outputtype\";s:1:\"0\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('563','24','description','摘要','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('564','24','updatetime','发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','0','1','0','0','0','0','0','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('565','24','content','内容','<style type=\"text/css\">.content_attr{ border:1px solid #CCC; padding:5px 8px; background:#FFC; margin-top:6px}</style><div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要
<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片
</div>','','1','999999','','内容不能为空','editor','a:6:{s:7:\"toolbar\";s:4:\"full\";s:12:\"defaultvalue\";s:0:\"\";s:13:\"enablekeylink\";s:1:\"1\";s:10:\"replacenum\";s:1:\"2\";s:9:\"link_mode\";s:1:\"0\";s:15:\"enablesaveimage\";s:1:\"1\";}','','','','0','0','0','1','0','1','1','0','6','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('561','24','typeid','类别','','','0','0','','','typeid','a:2:{s:9:\"minnumber\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','','','1','1','0','1','1','1','0','0','2','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('562','24','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('560','24','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('559','24','thumb','缩略图','','','0','100','','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('142','5','istop','置顶','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','19','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('143','5','recommend','推荐','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','20','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('558','24','relation','相关文章','','','0','255','','','omnipotent','a:4:{s:8:\"formtext\";s:464:\"<input type=\"hidden\" name=\"info[relation]\" id=\"relation\" value=\"{FIELD_VALUE}\" style=\"50\" >
<ul class=\"list-dot\" id=\"relation_text\">
</ul>
<input type=\"button\" value=\"添加相关\" onClick=\"omnipotent(\'selectid\',\'{RUL}index.php?g=Content&m=Contentshow&a=public_relationlist&modelid={MODELID}\',\'添加相关文章\',1)\" class=\"btn\">
<span class=\"edit_content\">
  <input type=\"button\" value=\"显示已有\" onClick=\"show_relation({MODELID},{ID})\" class=\"btn\">
</span>\";s:9:\"fieldtype\";s:7:\"varchar\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','0','0','0','1','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('197','1','seotitle','SEO标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('198','2','seotitle','SEO标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('556','24','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','1','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('557','24','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('199','3','seotitle','SEO标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('200','5','seotitle','SEO标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('201','1','seokeywords','SEO关键字','','','0','255','','','keyword','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('202','2','seokeywords','SEO关键字','','','0','255','','','keyword','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('203','3','seokeywords','SEO关键字','','','0','255','','','keyword','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('204','5','seokeywords','SEO关键字','','','0','255','','','keyword','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('205','1','seodescription','SEO描述','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('206','2','seodescription','SEO描述','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('207','3','seodescription','SEO描述','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('208','5','seodescription','SEO描述','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','9','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('209','5','mopic','轮播图','','','0','0','','','images','a:5:{s:15:\"upload_allowext\";s:20:\"gif|jpg|jpeg|png|bmp\";s:13:\"isselectimage\";s:1:\"0\";s:13:\"upload_number\";s:1:\"5\";s:12:\"backstagefun\";s:0:\"\";s:8:\"frontfun\";s:0:\"\";}','','','','0','0','0','1','0','1','0','0','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('553','24','template','内容页模板','','','0','30','','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('554','24','allow_comment','允许评论','','','0','0','','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','','0','0','0','0','0','0','0','0','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('555','24','inputtime','真实发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','1','1','0','0','0','0','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('552','24','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('551','24','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('548','24','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('549','24','istop','置顶','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('550','24','recommend','推荐','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('381','5','seourl','seourl','','inputtitle','1','80','','','seourl','','','','','0','1','0','1','1','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('609','26','description','摘要','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('610','26','updatetime','发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','0','1','0','0','0','0','0','0','10','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('611','26','content','内容','<style type=\"text/css\">.content_attr{ border:1px solid #CCC; padding:5px 8px; background:#FFC; margin-top:6px}</style><div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要
<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片
</div>','','1','999999','','内容不能为空','editor','a:6:{s:7:\"toolbar\";s:4:\"full\";s:12:\"defaultvalue\";s:0:\"\";s:13:\"enablekeylink\";s:1:\"1\";s:10:\"replacenum\";s:1:\"2\";s:9:\"link_mode\";s:1:\"0\";s:15:\"enablesaveimage\";s:1:\"1\";}','','','','0','0','0','1','0','1','1','0','6','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('612','26','seotitle','SEO标题','','inputtitle','1','80','','请输入标题','title','s:0:\"\";','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('613','26','seokeywords','SEO关键字','多关键词之间用空格隔开','','0','40','','','keyword','a:2:{s:4:\"size\";s:3:\"100\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','1','0','4','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('614','26','seodescription','SEO描述','','','0','255','','','textarea','a:4:{s:5:\"width\";s:2:\"98\";s:6:\"height\";s:2:\"46\";s:12:\"defaultvalue\";s:0:\"\";s:10:\"enablehtml\";s:1:\"0\";}','','','','0','1','0','1','0','1','1','1','5','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('615','26','seourl','seourl','','inputtitle','1','80','','','seourl','s:0:\"\";','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('616','26','isdelay','是否推迟','','','0','2','','','box','s:0:\"\";','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('607','26','typeid','类别','','','0','0','','','typeid','a:2:{s:9:\"minnumber\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','','','1','1','0','1','1','1','0','0','2','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('608','26','title','标题','','inputtitle','1','80','','请输入标题','title','s:0:\"\";','','','','0','1','0','1','1','1','1','1','3','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('605','26','thumb','缩略图','','','0','100','','','image','a:9:{s:4:\"size\";s:2:\"50\";s:12:\"defaultvalue\";s:0:\"\";s:9:\"show_type\";s:1:\"1\";s:14:\"upload_maxsize\";s:4:\"1024\";s:15:\"upload_allowext\";s:20:\"jpg|jpeg|gif|png|bmp\";s:9:\"watermark\";s:1:\"0\";s:13:\"isselectimage\";s:1:\"1\";s:12:\"images_width\";s:0:\"\";s:13:\"images_height\";s:0:\"\";}','','','','0','1','0','0','0','1','0','1','7','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('606','26','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','a:1:{s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('600','26','allow_comment','允许评论','','','0','0','','','box','a:9:{s:7:\"options\";s:33:\"允许评论|1
不允许评论|0\";s:7:\"boxtype\";s:5:\"radio\";s:9:\"fieldtype\";s:7:\"tinyint\";s:9:\"minnumber\";s:1:\"1\";s:5:\"width\";s:2:\"88\";s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:1:\"1\";s:10:\"outputtype\";s:1:\"1\";s:10:\"filtertype\";s:1:\"0\";}','','','','0','0','0','0','0','0','0','0','14','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('601','26','inputtime','真实发布时间','','','0','0','','','datetime','a:3:{s:9:\"fieldtype\";s:3:\"int\";s:6:\"format\";s:11:\"Y-m-d H:i:s\";s:11:\"defaulttype\";s:1:\"0\";}','','','','1','1','0','0','0','0','0','1','11','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('602','26','url','URL','','','0','100','','','text','s:0:\"\";','','','','1','1','0','1','0','0','0','1','12','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('603','26','listorder','排序','','','0','6','','','number','s:0:\"\";','','','','1','1','0','1','0','0','0','0','18','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('604','26','relation','相关文章','','','0','255','','','omnipotent','b:0;','','','','0','0','0','0','0','0','1','0','8','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('596','26','recommend','推荐','','','0','2','','','box','s:0:\"\";','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('597','26','username','用户名','','','0','20','','','text','s:0:\"\";','','','','1','1','0','1','0','0','0','0','16','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('598','26','islink','转向链接','','','0','0','','','islink','s:0:\"\";','','','','0','1','0','0','0','1','0','0','17','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('599','26','template','内容页模板','','','0','30','','','template','a:2:{s:4:\"size\";s:0:\"\";s:12:\"defaultvalue\";s:0:\"\";}','','-99','-99','0','0','0','0','0','0','0','0','13','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('594','26','status','状态','','','0','2','','','box','s:0:\"\";','','','','1','1','0','1','0','0','0','0','15','0','0');
INSERT INTO cmf_model_field ( `fieldid`, `modelid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent` ) VALUES  ('595','26','istop','置顶','','','0','2','','','box','s:0:\"\";','','','','1','1','0','1','0','0','0','0','15','0','0');
DROP TABLE IF EXISTS `cmf_module`;
CREATE TABLE `cmf_module` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_module ( `module`, `modulename`, `sign`, `iscore`, `disabled`, `version`, `setting`, `installtime`, `updatetime`, `listorder` ) VALUES  ('Search','搜索','2e01dfe1d6be7e454aea66c442639b7e','0','1','1.0.2','a:6:{s:7:\"modelid\";a:4:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"5\";}s:13:\"relationenble\";s:1:\"0\";s:7:\"segment\";s:1:\"0\";s:9:\"dzsegment\";s:1:\"0\";s:8:\"pagesize\";s:0:\"\";s:9:\"cachetime\";s:0:\"\";}','1466567829','1466567829','0');
DROP TABLE IF EXISTS `cmf_module_blocks`;
CREATE TABLE `cmf_module_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `show_title` enum('0','1') NOT NULL DEFAULT '1',
  `rsign` varchar(50) NOT NULL,
  `content` longtext,
  `languages` varchar(50) NOT NULL,
  `hash` char(40) NOT NULL,
  `listorder` int(11) NOT NULL DEFAULT '0',
  `published` enum('0','1') NOT NULL DEFAULT '1',
  `roles` varchar(50) NOT NULL DEFAULT '{guest}',
  `token` varchar(40) DEFAULT NULL,
  `perpage_show` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_2` (`alias`),
  KEY `rsign` (`rsign`),
  KEY `languages` (`languages`),
  KEY `hash` (`hash`),
  KEY `listorder` (`listorder`),
  KEY `published` (`published`),
  KEY `roles` (`roles`),
  KEY `alias` (`alias`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('1','Zckop','nav','zc_uNuOmW0y','主菜单','1','nav','a:1:{s:6:\"menuid\";s:1:\"1\";}','zh_CN','_ALL','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('2','Zckop','aboutus','zc_aboutus','公司介绍','1','right','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=pagedit&catid=22\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"url\":\"index.php?g=Portal&m=Zckop&a=aboutus\",\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"catid\":\"1,2\",\"limit\":10}}},\"strnum\":10}','zc_CN','ea0da8814469b7335b1519cae99d9e9d','1','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('3','Zckop','nbtproduct','zc_nbtproduct','推荐产品1','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist&catid=9,10,11\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"url\":\"index.php?g=Portal&m=Zckop&a=nbtproduct\",\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"catid\":\"9,10,11\",\"limit\":4}}},\"strnum\":100}','zh_CN','ea0da8814469b7335b1519cae99d9e9d','2','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('6','Zckop','show_image','zc_banner','','0','banner','a:2:{s:4:\"_all\";a:7:{s:7:\"flv_src\";s:25:\"upload/flash/Ve33KIVl.swf\";s:6:\"action\";s:10:\"show_flash\";s:8:\"img_desc\";s:0:\"\";s:9:\"img_width\";s:3:\"990\";s:9:\"flv_width\";s:3:\"990\";s:10:\"img_height\";s:3:\"300\";s:10:\"flv_height\";s:3:\"300\";}s:21:\"_m=frontpage&_a=index\";a:8:{s:8:\"img_desc\";s:0:\"\";s:9:\"img_width\";s:3:\"990\";s:9:\"flv_width\";s:3:\"990\";s:10:\"img_height\";s:3:\"300\";s:10:\"flv_height\";s:3:\"300\";s:7:\"flv_src\";s:25:\"upload/flash/Ve33KIVl.swf\";s:6:\"action\";s:10:\"show_flash\";s:6:\"islink\";s:2:\"no\";}}','zh_CN','_ALL','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('7','Zckop','articlecategory','zc_l2','文章分类','1','right','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Portal&m=AdminTerm&a=index&menuid=18&modelid=1\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":1000,\"height\":700}}}','zh_CN','_ALL','2','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('10','Zckop','productcategory','zc_r2','产品分类','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Portal&m=AdminTerm&a=index&menuid=18&modelid=5\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":1000,\"height\":700}}}','zh_CN','_ALL','1','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('11','Zckop','show_image','zc_logo','','0','logo','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Admin&m=Setting&a=logo\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700}},\"width\":\"659\",\"height\":\"63\",\"logourl\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574cdeafe360b.jpg\"}','zh_CN','_ALL','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('12','Zckop','right3','zc_r3','友情链接','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Admin&m=Link&a=index&menuid=75\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":1000,\"height\":700}}}','zh_CN','ea0da8814469b7335b1519cae99d9e9d','4','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('14','Zckop','marquee','zc_YQHp9Ixi','','0','zmd','a:7:{s:13:\"marquee_speed\";s:4:\"slow\";s:13:\"marquee_class\";s:3:\"pic\";s:12:\"mar_direc_id\";s:5:\"right\";s:13:\"marquee_data1\";s:1:\"1\";s:12:\"marquee_data\";s:0:\"\";s:10:\"mar_prd_id\";s:55:\"0,34,35,41,42,44,45,46,47,48,49,50,51,52,53,54,55,56,57\";s:14:\"mar_article_id\";s:9:\"0,7,11,12\";}','zh_CN','44f01ceb6551c666f3a79d8189dfad01ff566907','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('15','Zckop','nbtnew','zc_nbtnew','推荐文章2','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist&catid=1,6,7\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"url\":\"index.php?g=Portal&m=Zckop&a=nbtnew\",\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"catid\":\"1,6,7\",\"limit\":4}}}}','zh_CN','ea0da8814469b7335b1519cae99d9e9d','3','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('16','Zckop','custom_html','zc_foot','','1','footer','a:1:{s:4:\"html\";s:320:\"Power by <a href=\'http://www.sitestar.cn/\' target=\'_blank\' title=\'建站之星(sitestar)网站建设系统\' style=\'display:inline;\'>建站之星</a>|<a href=\'http://www.cndns.com/\' target=\'_blank\' title=\'域名注册|域名申请|域名尽在“美橙互联”\' style=\'display:inline;\'>美橙互联</a>&nbsp;版权所有\";}','zh_CN','_ALL','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('17','Zckop','articlelist','zc_articlelist','文章列表','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"limit\":2}}}}','zc_CN','8127a7badd8b104d2b1cc5e5420b5b3f','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('18','Zckop','protectlist','zc_protectlist','产品列表','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"limit\":8}}}}','zc_CN','4ace78db89c3372da77f88a25f06cd69','1','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('19','Zckop','downloadlist','zc_downloadlist','下载列表','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"limit\":8}}}}','zc_CN','ce0ce1d4be005f7b9acb1db81286508a','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('20','Zckop','piclist','zc_piclist','图片列表','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"limit\":8}}}}','zc_CN','57000305a09860af257bb2665dcf8138','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('21','Zckop','lists','zc_lists','通用单页','0','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=pagedit\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700}}}','zc_CN','b6e475c77fd9e79507f950509db229a2','1','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('22','Zckop','show_pro','zc_show_pro','产品详情','0','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=edit\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700}}}','zc_CN','e85f6477c7065c493ed642be41a289aa','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('23','Zckop','show_art','zc_show_art','文章详情','0','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=edit\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700}}}','zh_CN','8b1d8cc38a7bee5c0f2279842f95f974','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('24','Zckop','show_down','zc_show_down','下载详情','0','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=edit\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700}}}','zh_CN','46eec81e290ed81b4aca87e6f635c65d','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('25','Zckop','show_pic','zc_show_pic','图片详情','0','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=edit\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700}}}','zh_CN','522c5508cdc8080699c95d3bafac4a51','0','1','{member}{admin}{guest}','','');
INSERT INTO cmf_module_blocks ( `id`, `module`, `action`, `alias`, `title`, `show_title`, `rsign`, `content`, `languages`, `hash`, `listorder`, `published`, `roles`, `token`, `perpage_show` ) VALUES  ('26','Zckop','inquiry','zc_inquirylist','询盘列表','1','left','{\"zcmsg\":{\"edit\":{\"url\":\"index.php?g=Content&m=Contentshow&a=classlist\",\"title\":\"\\u5185\\u5bb9\\u7f16\\u8f91\",\"width\":900,\"height\":700},\"attr\":{\"title\":\"\\u5c5e\\u6027\",\"argu\":{\"limit\":2}}}}','zc_CN','658c7e0b74b870c0d0594ccd1d960a92','0','1','{member}{admin}{guest}','','');
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','首页','','home','','1','0','0-1');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('2','1','0','列表演示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','','1','0','0-2');
INSERT INTO cmf_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('3','1','0','瀑布流','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','','1','0','0-3');
DROP TABLE IF EXISTS `cmf_nav_cat`;
CREATE TABLE `cmf_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','主导航');
DROP TABLE IF EXISTS `cmf_oauth_user`;
CREATE TABLE `cmf_oauth_user` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_options`;
CREATE TABLE `cmf_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_host\":\"http:\\/\\/192.168.0.68\\/thinkcmf\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"flat\",\"site_icp\":\"\",\"site_admin_email\":\"3233816752@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"list_title_h\":\"manufacturer & supplier in china \",\"list_desc_z\":\"\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":60,\"ftppasv\":\"1\",\"site_water_qxd\":\"90\",\"site_water_weiz\":\"9\",\"smeta\":\"{\\\"thumb\\\":\\\"\\\\\\/thinkcmf\\\\\\/data\\\\\\/upload\\\\\\/20160606\\\\\\/57552ba482a96.png\\\"}\"}','1');
INSERT INTO cmf_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('3','cmf_settings','{\"banned_usernames\":\"\"}','1');
DROP TABLE IF EXISTS `cmf_page`;
CREATE TABLE `cmf_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(160) NOT NULL DEFAULT '' COMMENT '标题',
  `style` varchar(24) NOT NULL DEFAULT '' COMMENT '样式',
  `intro` varchar(40) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text COMMENT '内容',
  `template` varchar(30) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `thumb` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL COMMENT '相册',
  `seotitle` varchar(200) NOT NULL,
  `seokeywords` varchar(200) NOT NULL,
  `seodescription` varchar(200) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `catid` (`catid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_page ( `catid`, `title`, `style`, `intro`, `content`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription` ) VALUES  ('30','下雨啦33333333','','哈啊啊','<p>下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333下雨啦33333333</p>','','1464059369','','','','','');
INSERT INTO cmf_page ( `catid`, `title`, `style`, `intro`, `content`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription` ) VALUES  ('31','hello','','well','<p>哈哈大数据飞洒尽快发辣死了<br/></p>','','1464603003','','','','','');
INSERT INTO cmf_page ( `catid`, `title`, `style`, `intro`, `content`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription` ) VALUES  ('23','公司证书','','welll haihaia','<p><img src=\"http://localhost/thinkcmf/data/upload/ueditor/20160531/574cf20bf127e.jpg\" title=\"download(1).jpg\" alt=\"download(1).jpg\" style=\"width: 500px;\" height=\"border=&quot;0&quot;\" vspace=\"0\" width=\"500\"/>我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书我是公司证书</p>','','1464665422','','[{\"url\":\"20160531\\/574cec18944e4.jpg\",\"alt\":\"11\"},{\"url\":\"20160531\\/574cec1e1ae5a.png\",\"alt\":\"22\"}]','hello Factory','hello Factory','{\"des1\":\"Pin\",\"desc_mo\":\"Manufacturer China in many factory\",\"des2\":\"solid\",\"des3\":\"ying\",\"des4\":\"\"}');
INSERT INTO cmf_page ( `catid`, `title`, `style`, `intro`, `content`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription` ) VALUES  ('22','公司介绍','','','<p>这是我们公司最全面的介绍<br/></p>','','1464660964','','','','','');
INSERT INTO cmf_page ( `catid`, `title`, `style`, `intro`, `content`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription` ) VALUES  ('25','联系我们','','','<p>欢迎给我留言。<br/></p>','','1464663727','','','','','');
INSERT INTO cmf_page ( `catid`, `title`, `style`, `intro`, `content`, `template`, `updatetime`, `thumb`, `photo`, `seotitle`, `seokeywords`, `seodescription` ) VALUES  ('21','简介','','关于我们','<p>a best wishes to you<br/></p>','','1466152918','','null','hello Factory','hello Factory','{\"des1\":\"Pin\",\"desc_mo\":\"\",\"des2\":\"solid\",\"des3\":\"\",\"des4\":\"\"}');
DROP TABLE IF EXISTS `cmf_photo`;
CREATE TABLE `cmf_photo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
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
  `seotitle` varchar(255) NOT NULL,
  `seokeywords` varchar(255) NOT NULL,
  `seodescription` varchar(255) NOT NULL,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_photo ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `prefix`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('1','18','漂亮女模特高清图片素材','','http://www.shuipfcms.com/demo/file/2013/06/51c5336cb9587.jpg','图片素材','图片素材','漂亮女模特高清图片素材，图片尺寸：2000 * 3000 像素','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pic&catid=18&id=1','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pic&catid=18&id=1','0','99','0','0','1','0','admin','1403154794','1403154794','0','0','0','0','0','0','','','','','','0');
INSERT INTO cmf_photo ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `prefix`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('2','18','卷发靓丽美女高清图片素材','','http://www.shuipfcms.com/demo/file/2013/06/51c5333bbe0f9.jpg','高清图片','高清图片','卷发靓丽美女高清图片素材，图片尺寸：4288*2848像素。','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pic&catid=18&id=2','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pic&catid=18&id=2','0','99','0','0','1','0','admin','1403154863','1403154863','2','0','2','2','2','1403155560','','','','','','0');
INSERT INTO cmf_photo ( `id`, `catid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `prefix`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('3','18','鲁豫微笑站立高清图片素材','','http://www.shuipfcms.com/demo/file/2013/06/51c5321db3618.jpg','高清图片','高清图片','鲁豫微笑站立高清图片素材，图片尺寸：3944 * 4894像素！','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pic&catid=18&id=3','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pic&catid=18&id=3','0','99','0','0','1','0','admin','1403154895','1403154895','2','0','2','2','2','1403156322','','大斧子 Manufacturer','','','','0');
DROP TABLE IF EXISTS `cmf_photo_data`;
CREATE TABLE `cmf_photo_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `imgs` text,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_photo_data ( `id`, `template`, `paytype`, `allow_comment`, `relation`, `imgs` ) VALUES  ('1','','0','1','','1');
INSERT INTO cmf_photo_data ( `id`, `template`, `paytype`, `allow_comment`, `relation`, `imgs` ) VALUES  ('2','','0','1','','[]');
INSERT INTO cmf_photo_data ( `id`, `template`, `paytype`, `allow_comment`, `relation`, `imgs` ) VALUES  ('3','','0','1','','[{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d4bd3c8ef7.jpg\",\"alt\":\"11\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d4bd950a6a.png\",\"alt\":\"22\"}]');
DROP TABLE IF EXISTS `cmf_platform`;
CREATE TABLE `cmf_platform` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_plugins`;
CREATE TABLE `cmf_plugins` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_position`;
CREATE TABLE `cmf_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `modelid` char(30) NOT NULL DEFAULT '' COMMENT '模型id',
  `catid` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '推荐位名称',
  `maxnum` smallint(5) NOT NULL DEFAULT '20' COMMENT '最大存储数据量',
  `extention` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`posid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_position ( `posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder` ) VALUES  ('1','0','0','首页幻灯片','10','','0');
INSERT INTO cmf_position ( `posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder` ) VALUES  ('2','0','0','首页文字头条','10','','0');
INSERT INTO cmf_position ( `posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder` ) VALUES  ('3','0','0','首页站长推荐','10','','0');
DROP TABLE IF EXISTS `cmf_posts`;
CREATE TABLE `cmf_posts` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('1','1','','','2016-05-13 16:15:31','<p>我是全部<strong>内容</strong></p>','我是新加的2','我是摘要','1','1','2016-05-13 16:15:03','','0','','','0','{\"thumb\":\"\",\"photo\":[{\"url\":\"20160531\\/574cf2c100801.jpg\",\"alt\":\"11\"},{\"url\":\"20160531\\/574cf2c67d743.png\",\"alt\":\"22\"}]}','3','1','0','0');
INSERT INTO cmf_posts ( `id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('2','1','about us','','2016-05-23 15:05:41','<p>about usabout usabout usabout usabout us</p>','about us','about us','1','1','2016-05-23 15:05:08','','0','2','','0','{\"template\":\"page\",\"thumb\":\"\"}','0','0','0','0');
DROP TABLE IF EXISTS `cmf_product`;
CREATE TABLE `cmf_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `style` varchar(24) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `tags` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
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
  `seotitle` varchar(255) NOT NULL,
  `seokeywords` varchar(255) NOT NULL,
  `seodescription` varchar(255) NOT NULL,
  `seourl` varchar(255) DEFAULT NULL,
  `isdelay` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推迟',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`weekviews`,`views`,`dayviews`,`monthviews`,`status`,`id`),
  KEY `thumb` (`thumb`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('1','10','0','shoutao12332','','/thinkcmf/data/upload/20160606/575540f9ad111.jpg','钳子','','很好用的哒钳子','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=1','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=1','0','99','0','0','1','0','admin','1464397772','1464397772','0','0','0','0','26','0','100','l','','','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('2','10','0','dachuizi1222','','','大锤子','','大锤子大锤子','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=2','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=2','4','99','0','0','1','0','admin1','1464397994','1464397994','0','0','0','0','105','0','100','ll','','','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','dachuizi1222-tttt','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('3','11','0','小扳手','','/thinkcmf/data/upload/20160530/574be2f562f10.jpg','小扳手，小扳手','','小扳手小扳手小扳手小扳手','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=11&id=3','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=11&id=3','0','99','0','0','1','0','admin1','1451581261','1464399981','0','0','0','0','12','0','200','ll','','','','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('4','11','0','沙发a','','','真皮','','高品质沙发','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=11&id=4','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=11&id=4','0','99','0','0','1','0','admin2','1456945383','1464400049','0','0','0','0','56','0','500','真皮','','','','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('5','10','0','futou','','http://localhost/thinkcmf/data/upload/ueditor/20160606/57550e22e99d6.jpg','斧头','','','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=5','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=5','1','99','0','0','1','0','admin','1464579083','1464579083','0','0','0','0','0','0','0','','斧头 Factory','斧头 Maker','a:5:{s:4:\"des1\";s:3:\"pin\";s:7:\"desc_mo\";s:34:\"Manufacturer China in many factory\";s:4:\"des2\";s:5:\"solid\";s:4:\"des3\";s:4:\"ying\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('8','10','0','小钳子','','','','','','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=8','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=8','0','99','0','0','1','0','admin','1465203099','1465203099','0','0','0','0','0','0','100','铁','小钳子 Supplier','小钳子 Maker','a:5:{s:4:\"des1\";s:3:\"Pin\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:5:\"solid\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('45','10','0','德国大夫','','','','','','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=45','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=45','0','99','1','0','1','0','admin','1465810147','1465810147','0','0','0','0','0','0','0','',' Factory',' Maker','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('30','10','0','修理工具','','','','','测试添加内容','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=30','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=30','0','99','1','0','1','0','admin','1465779003','1465779003','0','0','0','0','0','0','100','6','修理工具 Factory','修理工具 Manufacturer China','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('44','49','0','分页3','','','','','摘要3','http://192.168.0.68/thinkcmf/page1/page3-44.html','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=49&id=44','0','99','0','0','1','0','admin','1465798710','1465798710','0','0','0','0','0','0','300','3','seotitle','','','page3','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('49','10','0','dachuizi122','','','','','','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=49','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=49','0','99','0','0','1','0','admin','1465893392','1465893392','0','0','0','0','0','0','444','33','dachuizi122 Manufacturer','dachuizi122 Supplier China','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('46','10','0','火啊32','','','','','','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=46','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=46','0','99','1','0','1','0','admin','1465811208','1465811208','0','0','0','0','0','0','0','',' Factory',' Maker','a:5:{s:4:\"des1\";s:0:\"\";s:7:\"desc_mo\";s:0:\"\";s:4:\"des2\";s:0:\"\";s:4:\"des3\";s:0:\"\";s:4:\"des4\";s:0:\"\";}','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('51','53','0','123123','','','','','1231231231','http://192.168.0.68/thinkcmf/lmer/hhhkjl-51.html','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=53&id=51','0','99','0','0','1','0','admin','1465982812','1465982812','0','0','0','0','0','0','100','45','12312312312','','','hhhkjl','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('52','54','0','小钳子','','','','','小钳子','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=54&id=52','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=54&id=52','0','99','0','0','1','0','admin','1465982979','1465982979','0','0','0','0','0','0','0','','小钳子','小钳子','','','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('57','53','0','测试栏目分页','','','','','','http://192.168.0.68/thinkcmf/lmer/asdf-57.html','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=53&id=57','0','99','0','0','1','0','admin','1466210369','1466213860','0','0','0','0','0','0','100','d','测试栏目分页 Factory','Sale 测试栏目分页','','asdf','0');
INSERT INTO cmf_product ( `id`, `catid`, `typeid`, `title`, `style`, `thumb`, `keywords`, `tags`, `description`, `url`, `moveurl`, `listorder`, `status`, `istop`, `recommend`, `sysadd`, `islink`, `username`, `inputtime`, `updatetime`, `views`, `yesterdayviews`, `dayviews`, `weekviews`, `monthviews`, `viewsupdatetime`, `price`, `size`, `seotitle`, `seokeywords`, `seodescription`, `seourl`, `isdelay` ) VALUES  ('66','49','0','分页1产品','','','','','这是摘要','http://192.168.0.68/thinkcmf/page1/rrrrrr-66.html','http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=49&id=66','0','99','0','0','1','0','admin','1466481157','1466481157','0','0','0','0','0','0','300','1','分页1产品 Exporter China','分页1产品 Factory','','rrrrrr','0');
DROP TABLE IF EXISTS `cmf_product_data`;
CREATE TABLE `cmf_product_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `mopic` text,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('1','<p>很好用的哒钳子很好用的哒钳子很好用的哒钳子很好用的哒钳子很好用的哒钳子很好用的哒钳子很好用的哒钳子<img src=\"http://localhost/thinkcmf/data/upload/ueditor/20160606/575540f15d1dd.jpg\" title=\"download(1).jpg\" alt=\"download(1).jpg\"/></p>','0','0','','0','1','|5,3|5,4|5,4|5,2|5,1|5,1|5,1|5,5|5,4|5,3|5,3|5,3|5,1|5,2','[{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d262dac4ae.png\",\"alt\":\"Black\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d26338f14f.png\",\"alt\":\"blue\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160531\\/574d26388eb8e.png\",\"alt\":\"green\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160606\\/5755411cba7ee.jpg\",\"alt\":\"download(1)\"}]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('2','<p>大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子大锤子</p>','0','0','','0','1','|5,45|5,44|5,46|5,45|5,44','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('3','<p>小扳手小扳手小扳手小扳手小扳手小扳手小扳手小扳手小扳手</p>','0','0','','0','1','8|5,7|5,6','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('4','<p>高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发高品质沙发111</p>','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('5','<p>made inChinamade inChinamade inChinamade inChinamade inChinamade inChinamade inChina<img alt=\"201103054683425.jpg\" src=\"http://localhost/thinkcmf/data/upload/ueditor/20160606/57550e22e99d6.jpg\" title=\"201103054683425.jpg\"/></p>','0','0','','0','1','5|5,4|5,2','[{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160530\\/574bf2d1db8b0.jpg\",\"alt\":\"11\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160530\\/574bf2d86bd16.png\",\"alt\":\"22\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160602\\/574f8ce15c39d.png\",\"alt\":\"cli_1000px\"}]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('8','<p>&nbsp;&nbsp;&nbsp;&nbsp;小钳子小钳子小钳子小钳子小钳子小钳子小钳子小钳子小钳子小钳子小钳子小钳子<br/></p>','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('30','<p>这是测试这是测试</p>','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('49','','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('44','<p>产品描述3</p>','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('45','','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('46','','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('66','<p>这是产品描述</p>','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('51','<p>23123123123</p>','0','0','','0','1','','[]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('52','<p><a href=\"http://192.168.0.68/thinkcmf/index.php?g=Content&m=Pagedis&a=show_pro&catid=10&id=8\" target=\"_blank\">小钳子</a></p>','0','0','','0','1','','[{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160615\\/57611fee0f3f0.jpg\",\"alt\":\"20160422103406754\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160615\\/57611fee4ffe0.jpg\",\"alt\":\"20160422103445553\"},{\"url\":\"\\/thinkcmf\\/data\\/upload\\/20160615\\/57611fee7db21.jpg\",\"alt\":\"20160422103455720\"}]');
INSERT INTO cmf_product_data ( `id`, `content`, `paginationtype`, `maxcharperpage`, `template`, `paytype`, `allow_comment`, `relation`, `mopic` ) VALUES  ('57','<p>产品描述</p>','0','0','','0','1','','[]');
DROP TABLE IF EXISTS `cmf_release`;
CREATE TABLE `cmf_release` (
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
  `regurl` varchar(255) NOT NULL COMMENT '注册地址',
  `loginurl` varchar(255) NOT NULL COMMENT '登录地址',
  `posturl` varchar(255) NOT NULL COMMENT '发布地址',
  `preposturl` varchar(255) DEFAULT NULL COMMENT '发布页面，有隐藏字段时需要填写',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可编辑 1-可 0-不可',
  `ifhide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有隐藏字段 1-有 0-没有',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_release ( `id`, `b2bname`, `b2burl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide` ) VALUES  ('6','moradabadyellowpages','http://www.moradabadyellowpages.com','a:15:{s:11:\"NewUsername\";s:12:\"xingtengkeji\";s:2:\"p1\";s:8:\"20160601\";s:2:\"p2\";s:8:\"20160601\";s:9:\"FirstName\";s:4:\"jian\";s:8:\"LastName\";s:2:\"xu\";s:7:\"address\";s:15:\"china.hebei.sjz\";s:5:\"phone\";s:13:\"0311-87777777\";s:8:\"cellular\";s:11:\"15100108598\";s:5:\"email\";s:17:\"1276595846@qq.com\";s:5:\"agree\";s:2:\"on\";s:7:\"country\";s:0:\"\";s:5:\"state\";s:13:\"uttar pradesh\";s:4:\"city\";s:9:\"Moradabad\";s:3:\"zip\";s:6:\"244001\";s:2:\"s1\";s:12:\"Register Now\";}','a:3:{s:2:\"us\";s:12:\"xingtengkeji\";s:2:\"ps\";s:8:\"20160601\";s:2:\"s1\";s:5:\"Login\";}','a:9:{s:11:\"CompanyName\";a:3:{i:0;s:12:\"xingtengkeji\";i:1;s:3:\"103\";i:2;N;}s:10:\"CategoryID\";a:3:{i:0;s:1:\"6\";i:1;s:1:\"0\";i:2;N;}s:13:\"SubCategoryID\";a:3:{i:0;s:2:\"36\";i:1;s:1:\"0\";i:2;N;}s:4:\"logo\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:6:\"resume\";a:3:{i:0;s:730:\"Place of Origin: Shandong, China (Mainland) 					 Brand Name:GLORY Model Number:	GF-CB2015029 					 Gender:	Boys Upper Material:Canvas 					 Lining Material:Cotton Fabric 					 Insole Material:EVA 					 Outsole Material:Rubber 					 Style:Slip-On 					 Season:	Autumn, Spring, Summer 					 Upper:canvas / pu /other textile 					 Lining:	cotton / textile, per your request 					 Insole:	EVA+ Cotton 					 Outsole:Rubber 					 Color:	red, yellow,navy,black,any color can do,per your request 					 Feature:Fashion,Casual,Comfortable 					 Origin:	Qingdao, China 					 Port:Qingdao 					 MOQ:1000 pairs per style per color per gender 					 Size:children: EUR:28--35#/women:EUR:36-41#/men:EUR:39-45 					 http://www.gloryfootwearco.com\";i:1;s:3:\"108\";i:2;N;}s:4:\"tags\";a:3:{i:0;s:11:\"Boys shoots\";i:1;s:3:\"103\";i:2;N;}s:8:\"address1\";a:3:{i:0;s:15:\"china.hebei.sjz\";i:1;s:1:\"0\";i:2;N;}s:6:\"phone3\";a:3:{i:0;s:13:\"0311-88888888\";i:1;s:1:\"0\";i:2;N;}s:2:\"s1\";a:3:{i:0;s:11:\"Add Listing\";i:1;s:1:\"0\";i:2;N;}}','us|xingtengkeji','ps|20160601','1','Congratulations Your Registration Completed Successfully!!','Welcome','http://www.moradabadyellowpages.com/register.php','http://www.moradabadyellowpages.com/login.php','http://www.moradabadyellowpages.com/addlisting.php','','1','0');
INSERT INTO cmf_release ( `id`, `b2bname`, `b2burl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide` ) VALUES  ('15','bikudo','http://www.bikudo.com','a:16:{s:2:\"ad\";s:8:\"xiaoxiao\";s:5:\"adres\";s:10:\"zhengyijie\";s:5:\"bolge\";s:5:\"henan\";s:6:\"eposta\";s:17:\"3406366416@qq.com\";s:13:\"hesap_olustur\";s:17:\"Create My Account\";s:2:\"il\";s:7:\"zhezhou\";s:5:\"konum\";s:2:\"44\";s:2:\"pk\";s:7:\"0200101\";s:5:\"sifre\";s:7:\"m123456\";s:13:\"sifre_denetim\";s:7:\"m123456\";s:6:\"sirket\";s:24:\"zhengzhoushangwuzhongxin\";s:5:\"soyad\";s:4:\"chen\";s:12:\"tel_kod_alan\";s:4:\"0311\";s:12:\"tel_kod_ulke\";s:2:\"86\";s:6:\"tel_nu\";s:7:\"8888888\";s:7:\"btnSave\";s:19:\"Creating My Account\";}','a:7:{s:2:\"id\";s:1:\"0\";s:3:\"pwd\";s:7:\"m123456\";s:13:\"remember_user\";s:1:\"1\";s:11:\"return_path\";s:0:\"\";s:7:\"sb_type\";s:1:\"0\";s:6:\"submit\";s:7:\"Sign In\";s:8:\"username\";s:17:\"3406366416@qq.com\";}','a:23:{s:8:\"category\";a:3:{i:0;s:73:\"Apparel, Textile & Leather>Athletic Wear;Gifts & Crafts>Artificial Crafts\";i:1;s:1:\"0\";i:2;N;}s:3:\"cid\";a:3:{i:0;s:7:\"141;857\";i:1;s:1:\"0\";i:2;N;}s:7:\"remLen2\";a:3:{i:0;s:3:\"730\";i:1;s:1:\"0\";i:2;N;}s:7:\"sb_bank\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:7:\"sb_cash\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:9:\"sb_cheque\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:9:\"sb_credit\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:16:\"sb_delivery_time\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:14:\"sb_description\";a:3:{i:0;s:730:\"Place of Origin: Shandong, China (Mainland) 					 Brand Name:GLORY Model Number:	GF-CB2015029 					 Gender:	Boys Upper Material:Canvas 					 Lining Material:Cotton Fabric 					 Insole Material:EVA 					 Outsole Material:Rubber 					 Style:Slip-On 					 Season:	Autumn, Spring, Summer 					 Upper:canvas / pu /other textile 					 Lining:	cotton / textile, per your request 					 Insole:	EVA+ Cotton 					 Outsole:Rubber 					 Color:	red, yellow,navy,black,any color can do,per your request 					 Feature:Fashion,Casual,Comfortable 					 Origin:	Qingdao, China 					 Port:Qingdao 					 MOQ:1000 pairs per style per color per gender 					 Size:children: EUR:28--35#/women:EUR:36-41#/men:EUR:39-45 					 http://www.gloryfootwearco.com\";i:1;s:1:\"0\";i:2;N;}s:9:\"sb_escrow\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:11:\"sb_keywords\";a:3:{i:0;s:3:\"tes\";i:1;s:1:\"0\";i:2;N;}s:6:\"sb_loc\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;N;}s:11:\"sb_location\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:12:\"sb_min_order\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:13:\"sb_other_mode\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:8:\"sb_price\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:15:\"sb_price_cur_id\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:17:\"sb_product_status\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:11:\"sb_quantity\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:20:\"sb_samples_available\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:16:\"sb_shipping_cost\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;N;}s:8:\"sb_title\";a:3:{i:0;s:14:\"bighongpao tea\";i:1;s:1:\"0\";i:2;N;}s:6:\"submit\";a:3:{i:0;s:6:\"Submit\";i:1;s:1:\"0\";i:2;N;}}','username|3406366416@qq.com','pwd|m123456','1','Sign In','You have successfully logged-in','http://www.bikudo.com/register','http://www.bikudo.com/login.do','http://www.bikudo.com/post_selling_leads.do','','1','0');
INSERT INTO cmf_release ( `id`, `b2bname`, `b2burl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide` ) VALUES  ('10','kitairu','http://kitairu.net','a:7:{s:12:\"contact_name\";s:7:\"xujian1\";s:4:\"mail\";s:16:\"334612421@qq.com\";s:2:\"op\";s:6:\"注册\";s:4:\"pass\";s:8:\"yp123456\";s:6:\"pass_2\";s:8:\"yp123456\";s:7:\"previus\";s:0:\"\";s:4:\"role\";s:1:\"1\";}','a:4:{s:4:\"mail\";s:16:\"334612421@qq.com\";s:4:\"pass\";s:8:\"yp123456\";s:2:\"op\";s:6:\"Log in\";s:7:\"previus\";s:0:\"\";}','a:9:{s:8:\"owner_id\";a:3:{i:0;s:4:\"2696\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:7:\"text_cn\";a:3:{i:0;s:48:\"我公司生产绿色无添加剂安全的绿茶\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:7:\"text_en\";a:3:{i:0;s:53:\"Our company produces green tea without additives safe\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:7:\"text_ru\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"title_cn\";a:3:{i:0;s:9:\"green tea\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"title_en\";a:3:{i:0;s:9:\"green tea\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"title_ru\";a:3:{i:0;s:9:\"green tea\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:4:\"type\";a:3:{i:0;s:8:\"products\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:3:\"uid\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;s:1:\"1\";}}','mail|334612421@qq.com','pass|yp123456','1','','You sign as','http://kitairu.net/cn/user/register.html','http://kitairu.net/user/','http://kitairu.net/user/save.html','http://kitairu.net/user/add.html','1','1');
INSERT INTO cmf_release ( `id`, `b2bname`, `b2burl`, `reginfo`, `logininfo`, `postinfo`, `username`, `password`, `ifreg`, `regsuccess`, `loginsuccess`, `regurl`, `loginurl`, `posturl`, `preposturl`, `status`, `ifhide` ) VALUES  ('13','trade2bharat','http://www.trade2bharat.com','a:20:{s:4:\"city\";s:12:\"shijiazhuang\";s:7:\"country\";s:2:\"38\";s:5:\"email\";s:16:\"835958614@qq.com\";s:3:\"fax\";s:2:\"86\";s:4:\"fax1\";s:4:\"0311\";s:4:\"fax2\";s:8:\"88888888\";s:9:\"firstname\";s:4:\"jian\";s:8:\"lastname\";s:2:\"xu\";s:6:\"mobile\";s:11:\"15100108598\";s:11:\"other_state\";s:5:\"china\";s:8:\"password\";s:8:\"reanod18\";s:5:\"phone\";s:2:\"86\";s:6:\"phone1\";s:4:\"0311\";s:6:\"phone2\";s:8:\"88888888\";s:4:\"pwd2\";s:8:\"reanod18\";s:5:\"state\";s:0:\"\";s:6:\"street\";s:22:\"xinhuaquxisanzhuangjie\";s:6:\"submit\";s:6:\"注册\";s:8:\"username\";s:8:\"reanod18\";s:8:\"zip_code\";s:6:\"050000\";}','a:6:{s:7:\"es_type\";s:1:\"0\";s:2:\"id\";s:1:\"0\";s:11:\"return_path\";s:0:\"\";s:8:\"username\";s:8:\"reanod18\";s:3:\"pwd\";s:8:\"reanod18\";s:6:\"Submit\";s:7:\"Sign In\";}','a:18:{s:8:\"category\";a:3:{i:0;s:18:\"Agriculture>Others\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:4:\"cats\";a:3:{i:0;s:1:\"0\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:3:\"cid\";a:3:{i:0;s:2:\"90\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:7:\"es_cash\";a:3:{i:0;s:3:\"yes\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:16:\"es_delivery_time\";a:3:{i:0;s:2:\"30\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:14:\"es_description\";a:3:{i:0;s:730:\"Place of Origin: Shandong, China (Mainland) 					 Brand Name:GLORY Model Number:	GF-CB2015029 					 Gender:	Boys Upper Material:Canvas 					 Lining Material:Cotton Fabric 					 Insole Material:EVA 					 Outsole Material:Rubber 					 Style:Slip-On 					 Season:	Autumn, Spring, Summer 					 Upper:canvas / pu /other textile 					 Lining:	cotton / textile, per your request 					 Insole:	EVA+ Cotton 					 Outsole:Rubber 					 Color:	red, yellow,navy,black,any color can do,per your request 					 Feature:Fashion,Casual,Comfortable 					 Origin:	Qingdao, China 					 Port:Qingdao 					 MOQ:1000 pairs per style per color per gender 					 Size:children: EUR:28--35#/women:EUR:36-41#/men:EUR:39-45 					 http://www.gloryfootwearco.com\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:11:\"es_keywords\";a:3:{i:0;s:9:\"red   tea\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:11:\"es_location\";a:3:{i:0;s:5:\"china\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:12:\"es_min_order\";a:3:{i:0;s:2:\"10\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:13:\"es_other_mode\";a:3:{i:0;s:0:\"\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"es_price\";a:3:{i:0;s:2:\"10\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:15:\"es_price_cur_id\";a:3:{i:0;s:1:\"7\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:17:\"es_product_status\";a:3:{i:0;s:3:\"New\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:11:\"es_quantity\";a:3:{i:0;s:3:\"100\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:20:\"es_samples_available\";a:3:{i:0;s:2:\"no\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:16:\"es_shipping_cost\";a:3:{i:0;s:2:\"10\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:8:\"es_title\";a:3:{i:0;s:7:\"red tea\";i:1;s:1:\"0\";i:2;s:1:\"0\";}s:6:\"submit\";a:3:{i:0;s:8:\"Post Now\";i:1;s:1:\"0\";i:2;s:1:\"0\";}}','username|reanod18','pwd|reanod18','1','success','you have successfully logged-in','http://www.trade2bharat.com/addmember.php','http://www.trade2bharat.com/login.php','http://www.trade2bharat.com/post_product.php','','1','0');
DROP TABLE IF EXISTS `cmf_reminder`;
CREATE TABLE `cmf_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1-服务器  2-域名',
  `endtime` int(11) NOT NULL COMMENT '到期时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `btime` int(11) NOT NULL COMMENT '开始提醒时间',
  `content` text NOT NULL COMMENT '描述',
  `rday` int(11) NOT NULL COMMENT '提前提醒天数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-未过期  1-已过期',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_reminder ( `id`, `type`, `endtime`, `addtime`, `btime`, `content`, `rday`, `status` ) VALUES  ('2','1','1467993600','1466666170','1467648000','人人人人人人人','4','0');
INSERT INTO cmf_reminder ( `id`, `type`, `endtime`, `addtime`, `btime`, `content`, `rday`, `status` ) VALUES  ('4','2','1471536000','1466666241','1470931200','马上到期啦','7','0');
INSERT INTO cmf_reminder ( `id`, `type`, `endtime`, `addtime`, `btime`, `content`, `rday`, `status` ) VALUES  ('5','2','1467993600','1466666273','1467388800','到期了啊啊','7','1');
DROP TABLE IF EXISTS `cmf_report_comment`;
CREATE TABLE `cmf_report_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `title` varchar(255) NOT NULL COMMENT '评论标题',
  `text` text NOT NULL COMMENT '评论内容',
  `uid` int(11) NOT NULL COMMENT '添加用户',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_report_comment ( `id`, `addtime`, `title`, `text`, `uid` ) VALUES  ('1','1466145742','是订饭它它','<p>对方的回复给回复个韩国进口款</p>','1');
INSERT INTO cmf_report_comment ( `id`, `addtime`, `title`, `text`, `uid` ) VALUES  ('2','1466147421','阿斯顿发斯蒂芬','<p>阿萨德法师打发斯蒂芬</p>','1');
INSERT INTO cmf_report_comment ( `id`, `addtime`, `title`, `text`, `uid` ) VALUES  ('3','1466147557','阿斯顿发斯蒂芬','<p>阿萨德法师打发斯蒂芬柔柔弱弱</p><p><br/></p><p>阿斯蒂芬</p><p><br/></p><p><strong>ffz</strong><br/></p>','1');
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('2','编辑','','1','管理产品','1463387819','0','0');
INSERT INTO cmf_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('3','文章管理','','1','文章管理','1465713522','0','0');
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_role_user ( `role_id`, `user_id` ) VALUES  ('2','13');
INSERT INTO cmf_role_user ( `role_id`, `user_id` ) VALUES  ('3','13');
INSERT INTO cmf_role_user ( `role_id`, `user_id` ) VALUES  ('1','12');
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_salesman`;
CREATE TABLE `cmf_salesman` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` char(40) NOT NULL DEFAULT '0' COMMENT '用户名',
  `email` char(40) NOT NULL DEFAULT '0' COMMENT '邮箱',
  `content` text COMMENT '备注',
  `status` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '0:关闭，1：启用',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_salesman ( `id`, `uname`, `email`, `content`, `status` ) VALUES  ('1','赵四','514583562@qq.com','最新添加','1');
INSERT INTO cmf_salesman ( `id`, `uname`, `email`, `content`, `status` ) VALUES  ('2','张三','3233816752@qq.com','测试用的','1');
DROP TABLE IF EXISTS `cmf_search`;
CREATE TABLE `cmf_search` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('1','1','6','1','1464573187','新闻二新闻一');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('2','2','30','1','1464937074','MidEastCustomerVisitFrengrassFactoryMidEastCustomerVisitFrengrassFactor');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('3','3','7','1','1465722932','天气情况');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('4','19','59','1','1466480541','陈测试静静');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('5','4','17','2','1464574354','下载一我是下载');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('6','1','18','3','1403154794','漂亮女模特高清图片素材图片素材');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('7','2','18','3','1403154863','卷发靓丽美女高清图片素材高清图片');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('8','3','18','3','1403154895','鲁豫微笑站立高清图片素材高清图片');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('9','1','10','5','1464397772','shoutao12332钳子');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('10','2','10','5','1464397994','dachuizi1222大锤子');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('11','3','11','5','1451581261','小扳手小扳手，小扳手');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('12','4','11','5','1456945383','沙发a真皮');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('13','5','10','5','1464579083','futou斧头');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('14','8','10','5','1465203099','小钳子');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('15','30','10','5','1465779003','修理工具');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('16','44','49','5','1465798710','分页3');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('17','45','10','5','1465810147','德国大夫');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('18','46','10','5','1465811208','火啊32');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('19','49','10','5','1465893392','dachuizi122');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('20','51','53','5','1465982812','123123');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('21','52','54','5','1465982979','小钳子');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('22','57','53','5','1466210369','测试栏目分页');
INSERT INTO cmf_search ( `searchid`, `id`, `catid`, `modelid`, `adddate`, `data` ) VALUES  ('23','66','49','5','1466481157','分页1产品');
DROP TABLE IF EXISTS `cmf_search_keyword`;
CREATE TABLE `cmf_search_keyword` (
  `keyword` char(20) NOT NULL COMMENT '关键字',
  `pinyin` char(20) NOT NULL COMMENT '关键字拼音',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('222','222','6','');
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('22','22','2','');
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('123','123','4','');
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('子','zi','1','');
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('shoutao','shoutao','1','');
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('德国','deguo','1','');
INSERT INTO cmf_search_keyword ( `keyword`, `pinyin`, `searchnums`, `data` ) VALUES  ('ss','ss','3','');
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_slide_cat`;
CREATE TABLE `cmf_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_social_platform`;
CREATE TABLE `cmf_social_platform` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(200) NOT NULL DEFAULT '' COMMENT '图片地址',
  `socurl` varchar(200) NOT NULL DEFAULT '' COMMENT '社交地址',
  `user` char(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `pwd` char(50) NOT NULL DEFAULT '' COMMENT '密码',
  `content` text COMMENT '描述',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_social_platform ( `id`, `imageurl`, `socurl`, `user`, `pwd`, `content` ) VALUES  ('2','{\"thumb\":\"\\/thinkcmf\\/data\\/upload\\/20160518\\/573c00806e2dc.jpg\"}','https://www.linkedin.com/?trk=baidubrand-mainlink','abcdefg123','hijklmn321','&lt;p&gt;公司账号&lt;/p&gt;');
DROP TABLE IF EXISTS `cmf_tdks`;
CREATE TABLE `cmf_tdks` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `catid` int(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('1','10','s:29:\"Manufacturer,Supplier,Factory\";','s:39:\"Maker,Manufacturer China,Supplier China\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:0:\"\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('2','23','s:38:\"Manufacturer,Supplier,Factory,Exporter\";','s:44:\"Manufacturer,Supplier,Factory,Exporter,Maker\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:0:\"\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('3','22','s:38:\"Manufacturer,Supplier,Factory,Exporter\";','s:44:\"Manufacturer,Supplier,Factory,Exporter,Maker\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:0:\"\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('4','29','s:32:\"Landscape Grass, Landscape Grass\";','s:103:\"Landscape Grass, Landscape Grass,Landscape xxxxxGrass, Landscape Grass,Landscape Grass, Landscape Grass\";','a:2:{s:7:\"iswrite\";s:1:\"1\";s:13:\"description_j\";s:104:\"ssssssLandscape Grass, Landscape Grass,Landscape Grass, Landscape Grass,Landscape Grass, Landscape Grass\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('5','30','s:5:\"News1\";','s:5:\"News2\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:5:\"News3\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('6','9','s:53:\"Manufacturer,Supplier,Factory,Exporter,China,for sale\";','s:39:\"Maker,Manufacturer China,Supplier China\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:0:\"\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('7','1','s:71:\"china,Buy * in China,* Supplier China,* Maker Chinaq,* for sale,* China\";','s:97:\"china,Buy * in China,Wholesale *,* Exporter China,* Factory China,* Manufacturer China,* for sale\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:0:\"\";}');
INSERT INTO cmf_tdks ( `id`, `catid`, `title`, `keywords`, `description` ) VALUES  ('8','6','s:34:\"* China,* Factory China,* for sale\";','s:59:\"* Manufacturer China,* Factory China,Buy * in China,* China\";','a:2:{s:7:\"iswrite\";s:1:\"0\";s:13:\"description_j\";s:0:\"\";}');
DROP TABLE IF EXISTS `cmf_term_relationships`;
CREATE TABLE `cmf_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('1','1','1','0','1');
DROP TABLE IF EXISTS `cmf_terms`;
CREATE TABLE `cmf_terms` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `modelid` ) VALUES  ('1','列表演示','','article','','0','0','0-1','','','','list','article','0','1','0');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `modelid` ) VALUES  ('2','瀑布流','','article','','0','0','0-2','','','','list_masonry','article','0','1','0');
INSERT INTO cmf_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`, `modelid` ) VALUES  ('3','分类1','','article','这是分类1','1','0','0-1-3','','','','list','article','0','1','0');
DROP TABLE IF EXISTS `cmf_tert_ss_data`;
CREATE TABLE `cmf_tert_ss_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text,
  `paginationtype` tinyint(1) NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) NOT NULL DEFAULT '0',
  `template` varchar(30) NOT NULL DEFAULT '',
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_tks_library`;
CREATE TABLE `cmf_tks_library` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `c_num` int(200) NOT NULL COMMENT '使用次数',
  `is_use` int(10) NOT NULL COMMENT '是否使用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('1','* Supplier','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('2','*  Manufacturer','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('3','* Factory','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('4','* Company','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('5','China *','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('6','* China','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('7','* Supply','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('8','Manufacture *','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('9','Export *','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('10','* Wholesale','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('11','* Supplier','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('12','* for Sale','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('13','Sale *','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('14','* Wholesaler','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('15','* Manufacturer China','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('16','* Exporter China','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('17','* Factory China','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('18','* Supplier China','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('19','* Price','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('20','High Quality *','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('21','Custom *','0','0');
INSERT INTO cmf_tks_library ( `id`, `keywords`, `c_num`, `is_use` ) VALUES  ('22','ODM *','0','0');
DROP TABLE IF EXISTS `cmf_urlrule`;
CREATE TABLE `cmf_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id',
  `module` varchar(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `file` varchar(20) NOT NULL DEFAULT '' COMMENT '所属文件',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '生成静态规则 1 静态',
  `urlrule` varchar(255) NOT NULL DEFAULT '' COMMENT 'url规则',
  `example` varchar(255) NOT NULL DEFAULT '' COMMENT '示例',
  PRIMARY KEY (`urlruleid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('1','content','category','0','index.php?g=Content&m=Pagedis&a=lists&catid={$catid}|index.php?g=Content&m=Pagedis&a=lists&catid={$catid}&p={page}','动态：index.php?g=Content&m=Pagedis&a=lists&catid=1&page=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('2','content','category','1','html/{$categorydir}{$catdir}/index.html|html/{$categorydir}{$catdir}/index_{$page}.html','静态：html/news/china/1000.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('3','content','show','1','html/{$year}/{$catdir}_{$month}/{$id}.html|html/{$year}/{$catdir}_{$month}/{$id}_{$page}.html','静态：html/2010/catdir_07/1_2.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('4','content','show','0','index.php?g=Content&m=Pagedis&a=shows&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=shows&catid={$catid}&id={$id}&page={$page}','动态：index.php?g=Content&m=Pagedis&a=shows&catid=1&id=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('5','content','category','1','news/{$catid}.html|news/{$catid}-{$page}.html','静态：news/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('6','content','category','0','list-{$catid}.html|list-{$catid}-{$page}.html','伪静态：list-1-1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('7','content','tags','0','index.php?a=tags&amp;tagid={$tagid}|index.php?a=tags&amp;tagid={$tagid}&amp;page={$page}','动态：index.php?a=tags&amp;tagid=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('8','content','tags','0','index.php?a=tags&amp;tag={$tag}|/index.php?a=tags&amp;tag={$tag}&amp;page={$page}','动态：index.php?a=tags&amp;tag=标签');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('9','content','tags','0','tag-{$tag}.html|tag-{$tag}-{$page}.html','伪静态：tag-标签.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('10','content','tags','0','tag-{$tagid}.html|tag-{$tagid}-{$page}.html','伪静态：tag-1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('11','content','index','1','index.html|index_{$page}.html','静态：index_2.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('12','content','index','0','index.html|index_{$page}.html','伪静态：index_2.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('13','content','index','0','index.php|index.php?page={$page}','动态：index.php?page=2');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('14','content','category','1','download.html|download_{$page}.html','静态：download.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('15','content','show','1','{$categorydir}{$id}.html|{$categorydir}{$id}_{$page}.html','静态：/父栏目/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('16','content','show','1','{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html','示例：/栏目/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('17','content','category','0','index.php?g=Content&m=Pagedis&a=list_pic&catid={$catid}|index.php?g=Content&m=Pagedis&a=list_pic&catid={$catid}&p={page}','动态图片：index.php?g=Content&m=Pagedis&a=list_pic&catid=1&page=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('18','content','category','0','index.php?g=Content&m=Pagedis&a=list_art&catid={$catid}|index.php?g=Content&m=Pagedis&a=list_art&catid={$catid}&p={page}','动态文章：index.php?g=Content&m=Pagedis&a=list_art&catid=1&page=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('19','content','category','0','index.php?g=Content&m=Pagedis&a=list_pro&catid={$catid}|index.php?g=Content&m=Pagedis&a=list_pro&catid={$catid}&p={page}','动态产品：index.php?g=Content&m=Pagedis&a=list_pro&catid=1&page=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('20','content','category','0','index.php?g=Content&m=Pagedis&a=list_down&catid={$catid}|index.php?g=Content&m=Pagedis&a=list_down&catid={$catid}&p={page}','动态下载：index.php?g=Content&m=Pagedis&a=list_down&catid=1&page=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('21','content','show','0','index.php?g=Content&m=Pagedis&a=show_pic&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=show_pic&catid={$catid}&id={$id}&page={$page}','动态图片：index.php?g=Content&m=Pagedis&a=show_pic&catid=1&id=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('22','content','show','0','index.php?g=Content&m=Pagedis&a=show_art&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=show_art&catid={$catid}&id={$id}&page={$page}','动态文章：index.php?g=Content&m=Pagedis&a=show_art&catid=1&id=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('23','content','show','0','index.php?g=Content&m=Pagedis&a=show_pro&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=show_pro&catid={$catid}&id={$id}&page={$page}','动态产品：index.php?g=Content&m=Pagedis&a=show_pro&catid=1&id=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('24','content','show','0','index.php?g=Content&m=Pagedis&a=show_down&catid={$catid}&id={$id}|index.php?g=Content&m=Pgedis&a=show_down&catid={$catid}&id={$id}&page={$page}','动态下载：index.php?g=Content&m=Pagedis&a=show_down&catid=1&id=1');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('25','content','category','1','html/{$categorydir}{$catdir}/index.html|html/{$categorydir}{$catdir}/index_{$page}.html','静态下载: html/download/reanod/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('26','content','category','1','html/{$categorydir}{$catdir}/index.html|html/{$categorydir}{$catdir}/index_{page}.html','静态产品: html/product/reanod/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('27','content','category','1','html/{$categorydir}{$catdir}/index.html|html/{$categorydir}{$catdir}/index_{$page}.html','静态文章:  html/article/reanod/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('28','content','category','1','html/{$categorydir}{$catdir}/index.html|html/{$categorydir}{$catdir}/index_{$page}.html','静态图片: html/picture/reanod/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('29','content','show','1','{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html','静态图片：/栏目/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('30','content','show','1','{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html','静态文章：/栏目/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('31','content','show','1','{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html','静态产品：/栏目/1.html');
INSERT INTO cmf_urlrule ( `urlruleid`, `module`, `file`, `ishtml`, `urlrule`, `example` ) VALUES  ('32','content','show','1','{$catdir}/{$id}.html|{$catdir}/{$id}_{$page}.html','静态下载：/栏目/1.html');
DROP TABLE IF EXISTS `cmf_user_favorites`;
CREATE TABLE `cmf_user_favorites` (
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
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `cmf_users`;
CREATE TABLE `cmf_users` (
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
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('1','admin','###bce2875cf70ecebacf956ad76f71cd07','admin','3233816752@qq.com','','','0','','','192.168.0.68','2016-06-24 17:09:09','2016-05-13 10:42:42','','1','0','1','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('2','test_163_com','###21387a8b0c0db725a4ff99b5cc8654af','test_163_com','test@163.com','','','0','','','0.0.0.0','2016-05-18 17:26:14','2016-05-16 11:58:25','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('4','514583562_qq_com','###21387a8b0c0db725a4ff99b5cc8654af','514583562_qq_com','514583562@qq.com','','','0','','','0.0.0.0','2016-05-18 15:24:20','2016-05-18 15:24:20','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('5','test1_163_com','###5ae89c64e3430540454a8556f272d829','test1_163_com','test1@163.com','','','0','','','0.0.0.0','2016-05-18 15:49:13','2016-05-18 15:49:13','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('6','test2_163_com','###5ae89c64e3430540454a8556f272d829','test2_163_com','test2@163.com','','','0','','','0.0.0.0','2016-05-18 16:31:36','2016-05-18 16:31:36','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('7','test3_163_com','###5ae89c64e3430540454a8556f272d829','test3_163_com','test3@163.com','','','0','','','0.0.0.0','2016-05-18 16:33:42','2016-05-18 16:33:42','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('8','test4_163_com','###5ae89c64e3430540454a8556f272d829','test4_163_com','test4@163.com','','','0','','','0.0.0.0','2016-05-18 16:39:24','2016-05-18 16:39:24','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('9','test5_163_com','###5ae89c64e3430540454a8556f272d829','test5_163_com','test5@163.com','','','0','','','0.0.0.0','2016-05-18 16:41:52','2016-05-18 16:41:52','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('10','aaaaaa_qq_com','###8b53dd029fa141dba89a46f8c90ee636','aaaaaa_qq_com','aaaaaa@qq.com','','','0','','','0.0.0.0','2016-05-20 17:59:38','2016-05-20 17:59:38','','1','0','2','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('13','Cj','###d795518ac248d8c276735e0842fbf720','','cj@reanod.com','','','0','','','192.168.0.7','2016-06-12 14:45:44','2016-06-12 14:19:08','','1','0','1','0','');
INSERT INTO cmf_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile` ) VALUES  ('12','test1','###4f29225a44241e339432e09d82eb2ac1','','test1@qq.com','','','0','','','192.168.0.68','2016-06-03 15:20:33','2016-06-02 16:04:11','','1','0','1','0','');
DROP TABLE IF EXISTS `cmf_visits`;
CREATE TABLE `cmf_visits` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL COMMENT '国家',
  `url` varchar(100) NOT NULL COMMENT '页面链接',
  `title` varchar(200) NOT NULL COMMENT '头部',
  `clicks` int(10) NOT NULL COMMENT '点击量',
  `time` int(10) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('1','119.248.52.136','中国','/thinkcmf/show/','内容页','7','1464796800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('2','119.248.52.136','中国','/thinkcmf/show/','内容页','5','1464710400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('3','119.248.52.136','中国','/thinkcmf/index/','首页','3','1464364800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('4','119.248.52.136','中国','/thinkcmf/index/','首页','6','1464105600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('5','12.6.232.33','美国','/thinkcmf/index/','首页','3','1464364800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('6','12.6.232.33','美国','/thinkcmf/index/','首页','3','1464710400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('7','12.6.232.33','美国','/thinkcmf/show/','内容页','3','1464710400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('13','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','3','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('12','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','1','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('11','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=9','Landscape Grass - ','16','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('14','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','1','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('15','192.168.0.7','','http://192.168.0.68/thinkcmf/','','1','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('16','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','1','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('17','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=Inquiry','','1','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('18','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=25','联系我们 - ','2','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('19','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','1','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('20','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=48','测试静态分页 manufacturer &amp; supplier in china  - ','2','1465833600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('21','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','3','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('22','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php','其它','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('23','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('24','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('25','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=1','shoutao12332 - heloo - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('26','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=1','shoutao12332 - heloo - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('27','192.168.0.68','','http://192.168.0.68/thinkcmf/lmer/as-50.html','asdf - 栏目二 manufacturer &amp; supplier in china  - ','3','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('28','192.168.0.68','','http://192.168.0.68/thinkcmf/html/ppp/lmer/','栏目二 manufacturer &amp; supplier in china  - ','12','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('29','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=Inquiry','其它','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('30','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('31','192.168.0.68','','http://192.168.0.68/thinkcmf/','其它','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('32','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=53&amp;id=50','asdf - 栏目二 manufacturer &amp; supplier in china  - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('33','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=53','栏目二 manufacturer &amp; supplier in china  - ','5','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('34','192.168.0.68','','http://192.168.0.68/thinkcmf/lmer/hhhkjl-51.html','123123 - 栏目二 manufacturer &amp; supplier in china  - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('35','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=7','新闻二 - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('36','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=1','新闻 - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('37','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=1&amp;p=2','新闻 - ','1','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('38','192.168.0.68','','http://192.168.0.68/thinkcmf/html/ppp/lmer/index_2.html','栏目二 manufacturer &amp; supplier in china  - ','4','1465920000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('39','192.168.0.68','','http://192.168.0.64/thinkcmf/','其它','1','1466006400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('40','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('41','192.168.0.68','','http://192.168.0.68/thinkcmf/','其它','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('42','192.168.0.61','','http://192.168.0.64/thinkcmf/','其它','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('43','192.168.0.7','','http://192.168.0.64/thinkcmf/','其它','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('44','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','2','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('45','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10&amp;p=2','heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('46','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10&amp;p=2','heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('47','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('48','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','2','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('49','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','2','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('50','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','3','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('51','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=51','Leisure Grass manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('52','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=9','Landscape Grass - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('53','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('54','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','5','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('55','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=49','dachuizi122 - heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('56','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=21','22 - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('57','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=21','22 - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('58','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=30','News manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('59','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=30','News manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('60','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=1','新闻 - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('61','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=1','新闻 - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('62','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=30','修理工具 - heloo - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('63','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=9','Landscape Grass - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('64','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=9&amp;p=2','Landscape Grass - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('65','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=53','栏目二 manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('66','192.168.0.68','','http://192.168.0.68/thinkcmf/html/ppp/lmer/index_2.html','栏目二 manufacturer &amp; supplier in china  - ','13','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('67','192.168.0.68','','http://192.168.0.68/thinkcmf/lmer/hhhkjl-51.html','123123 - 栏目二 manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('68','192.168.0.68','','http://192.168.0.68/thinkcmf/html/ppp/lmer/','栏目二 manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('69','192.168.0.68','','http://192.168.0.68/thinkcmf/html/ppp/lmer/index.html','栏目二 manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('70','192.168.0.209','','http://192.168.0.68/thinkcmf/html/ppp/lmer/index.html','栏目二 manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('71','192.168.0.209','','http://192.168.0.68/thinkcmf/html/ppp/lmer/index_2.html','栏目二 manufacturer &amp; supplier in china  - ','1','1466092800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('72','192.168.0.209','','http://192.168.0.68/thinkcmf/','其它','2','1466179200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('73','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','1','1466179200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('74','192.168.0.7','','http://192.168.0.64/thinkcmf/','其它','1','1466179200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('75','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=6','新闻一 - ','1','1466352000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('76','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','1','1466352000');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('77','192.168.0.209','','http://192.168.0.68/thinkcmf/','其它','3','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('78','192.168.0.209','','http://192.168.0.64/thinkcmf/','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('79','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('80','192.168.0.188','','http://192.168.0.64/thinkcmf/','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('81','192.168.0.68','','http://192.168.0.64/thinkcmf/','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('82','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=21','22 - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('83','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=6','新闻一 - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('84','192.168.0.68','','http://192.168.0.68/thinkcmf/','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('85','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_art&amp;catid=6','新闻一 - ','2','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('86','192.168.0.7','','http://192.168.0.64/thinkcmf/','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('87','192.168.0.7','','http://192.168.0.68/thinkcmf/','其它','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('88','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=25','联系我们 - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('89','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=25','联系我们 - ','8','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('90','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=53','栏目二 manufacturer &amp; supplier in china  - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('91','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=51','Leisure Grass manufacturer &amp; supplier in china  - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('92','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=11','Sports Grass - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('93','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=11&amp;p=2','Sports Grass - ','1','1466438400');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('94','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=9','Landscape Grass - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('95','192.168.0.68','','http://192.168.0.68/thinkcmf/','其它','4','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('96','192.168.0.209','','http://192.168.0.64/thinkcmf/','其它','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('97','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=54','Football xx manufacturer &amp; supplier in china  - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('98','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=54&amp;id=52','小钳子 - Football xx manufacturer &amp; supplier in china  - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('99','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;id=52&amp;catid=25&am','Contact Us - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('100','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','17','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('101','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','2','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('102','192.168.0.7','','http://192.168.0.64/thinkcmf/','其它','2','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('103','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('104','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2&amp;p=5','Products - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('105','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2&amp;p=4','Products - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('106','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2&amp;p=3','Products - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('107','192.168.0.209','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2&amp;p=2','Products - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('108','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','1','1466524800');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('109','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=54','Football xx manufacturer &amp; supplier in china  - ','1','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('110','192.168.0.68','','http://192.168.0.68/thinkcmf/','其它','3','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('111','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=25','Contact Us - ','5','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('112','192.168.0.7','','http://192.168.0.64/thinkcmf/','其它','1','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('113','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php','其它','1','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('114','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=9','Landscape Grass - ','2','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('115','192.168.0.144','','http://192.168.0.64/thinkcmf/','其它','1','1466611200');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('116','192.168.0.7','','http://192.168.0.64/thinkcmf/index.php','其它','3','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('117','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','3','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('118','192.168.0.68','','http://192.168.0.68/thinkcmf/','其它','7','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('119','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=51','Leisure Grass manufacturer &amp; supplier in china  - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('120','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('121','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Search&amp;m=Index&amp;a=index&amp;q=a','其它','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('122','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Search&amp;m=Index&amp;a=index&amp;q=aa','其它','2','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('123','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=shows&amp;catid=30&amp;id=2','Mid East Customer Visit Frengrass Factory - News manufacturer &amp; supplier in china  - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('124','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Search&amp;m=Index&amp;a=index&amp;q=ss','其它','2','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('125','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Search&amp;m=Index&amp;a=index&amp;q=ss&amp;modelid=5','其它','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('126','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Search&amp;m=Index&amp;a=index&amp;q=ss&amp;modelid=3','其它','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('127','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Search&amp;m=Index&amp;a=index&amp;q=ss&amp;modelid=2','其它','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('128','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=2','Products - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('129','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=Inquiry','其它','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('130','192.168.0.7','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=25','Contact Us - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('131','192.168.0.61','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10','heloo - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('132','192.168.0.61','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=show_pro&amp;catid=10&amp;id=2','dachuizi1222 - heloo - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('133','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=10&amp;p=6','heloo - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('134','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pic&amp;catid=18','Application - ','1','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('135','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=lists&amp;catid=25','Contact Us - ','3','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('136','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=Inquiry','其它','2','1466697600');
INSERT INTO cmf_visits ( `id`, `ip`, `country`, `url`, `title`, `clicks`, `time` ) VALUES  ('137','192.168.0.68','','http://192.168.0.68/thinkcmf/index.php?g=Content&amp;m=Pagedis&amp;a=list_pro&amp;catid=54','Football xx manufacturer &amp; supplier in china  - ','1','1466697600');
