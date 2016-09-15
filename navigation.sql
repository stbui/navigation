/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : 114la_ky

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-09-14 20:03:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ylmf_admin
-- ----------------------------
DROP TABLE IF EXISTS `ylmf_admin`;
CREATE TABLE `ylmf_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(50) NOT NULL COMMENT '用户',
  `password` char(32) NOT NULL COMMENT '密码',
  `realname` varchar(100) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组',
  `last_login_ip` char(15) NOT NULL DEFAULT '127' COMMENT '最后登录ip',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '用户状态',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `login` (`username`,`password`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylmf_admin
-- ----------------------------
INSERT INTO `ylmf_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator', '1', '127.0.0.1', '1473767199', '1', 'Y', '0');

-- ----------------------------
-- Table structure for ylmf_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `ylmf_admin_group`;
CREATE TABLE `ylmf_admin_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL COMMENT '组名称',
  `acl` text NOT NULL COMMENT '权限',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylmf_admin_group
-- ----------------------------
INSERT INTO `ylmf_admin_group` VALUES ('1', '超级管理组', 'administrator', 'Y', '0');
INSERT INTO `ylmf_admin_group` VALUES ('2', '禁用', 'stop', 'Y', '0');
INSERT INTO `ylmf_admin_group` VALUES ('3', '普通管理组', '|config|links|union|html_create|html_createIndex|html_createInner|links_tball|config_info|config_theme|config_cache|catalog_index|catalog_create|catalog_update|catalog_delete|catalog_sort_order|catalog_unverify|catalog_verify|links_index|links_create|links_update|links_verify|links_commend|links_delete|links_createbatch|links_createimport|union_index|', 'Y', '1398862722');
INSERT INTO `ylmf_admin_group` VALUES ('4', '编辑组', '|links|union|catalog_index|catalog_create|catalog_update|catalog_delete|catalog_sort_order|catalog_unverify|catalog_verify|links_index|links_create|links_update|links_verify|links_commend|links_delete|links_createbatch|links_createimport|union_index|', 'Y', '1402477564');

-- ----------------------------
-- Table structure for ylmf_admin_logger
-- ----------------------------
DROP TABLE IF EXISTS `ylmf_admin_logger`;
CREATE TABLE `ylmf_admin_logger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `catalog` enum('login','create','update','delete','other','browse') NOT NULL DEFAULT 'other' COMMENT '类型',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `intro` text COMMENT '操作',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT '操作ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylmf_admin_logger
-- ----------------------------
INSERT INTO `ylmf_admin_logger` VALUES ('1', '0', 'login', '/admin/index.php?r=public/login', '用户登录成功:admin', '127.0.0.1', '1473767199');

-- ----------------------------
-- Table structure for ylmf_catalog
-- ----------------------------
DROP TABLE IF EXISTS `ylmf_catalog`;
CREATE TABLE `ylmf_catalog` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `catalog_name` varchar(100) NOT NULL COMMENT '名称',
  `content` text COMMENT '详细介绍',
  `data_count` int(10) unsigned DEFAULT '0' COMMENT '显示的数据量',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `redirect_url` varchar(255) DEFAULT '' COMMENT '跳转地址,更多链接',
  `path` varchar(255) NOT NULL,
  `seo_t` varchar(255) NOT NULL,
  `seo_k` varchar(255) NOT NULL,
  `seo_d` varchar(255) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `tb_id` smallint(4) NOT NULL DEFAULT '0',
  `opt_1` varchar(64) NOT NULL,
  `opt_2` varchar(64) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status_is` (`status_is`)
) ENGINE=MyISAM AUTO_INCREMENT=605 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylmf_catalog
-- ----------------------------
INSERT INTO `ylmf_catalog` VALUES ('1', '0', '首页', null, '0', 'Y', '', '', '', '', '', '', '0', '', '', '0');
INSERT INTO `ylmf_catalog` VALUES ('2', '0', '内页', null, '0', 'Y', '', '', '', '', '', '', '0', '', '', '0');
INSERT INTO `ylmf_catalog` VALUES ('3', '0', '广告', '', '0', 'Y', '', '', '', '', '', '', '0', '', '', '0');
INSERT INTO `ylmf_catalog` VALUES ('4', '2', '小说', '', '0', 'Y', '', 'xiaoshuo', '', '', '', '', '0', '', '', '1406797214');
INSERT INTO `ylmf_catalog` VALUES ('5', '2', '星座', '', '0', 'Y', '', 'xingxiang', '', '', '', 'http://www.114la.com/static/page/rebuild/images/logo_bbs.png', '0', '', '', '1403678769');

-- ----------------------------
-- Table structure for ylmf_config
-- ----------------------------
DROP TABLE IF EXISTS `ylmf_config`;
CREATE TABLE `ylmf_config` (
  `variable` varchar(50) NOT NULL COMMENT '变量',
  `value` text COMMENT '值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylmf_config
-- ----------------------------
INSERT INTO `ylmf_config` VALUES ('site_name', '114啦开源系统', '');
INSERT INTO `ylmf_config` VALUES ('site_domain', 'http://www.114la.com', '');
INSERT INTO `ylmf_config` VALUES ('site_logo', 'default_logo.png', '');
INSERT INTO `ylmf_config` VALUES ('site_icp', '粤ICP备05021225号', '');
INSERT INTO `ylmf_config` VALUES ('site_closed_summary', '系统维护中，请稍候......', '');
INSERT INTO `ylmf_config` VALUES ('site_stats', '', '');
INSERT INTO `ylmf_config` VALUES ('seo_title', '114啦网址导航[Www.114La.Com]_最实用的上网主页_上网就上114啦！', '');
INSERT INTO `ylmf_config` VALUES ('seo_description', '网站描述-seo_description2', '');
INSERT INTO `ylmf_config` VALUES ('seo_keywords', '网站关键字-seo_keywords1', '');
INSERT INTO `ylmf_config` VALUES ('site_icp_url', 'http://www.miibeian.gov.cn/', '');
INSERT INTO `ylmf_config` VALUES ('site_copyright', '2010-2014', '');
INSERT INTO `ylmf_config` VALUES ('upload_allow_ext', 'jpg,gif,bmp,jpeg,png', '');
INSERT INTO `ylmf_config` VALUES ('upload_max_size', '200', '');
INSERT INTO `ylmf_config` VALUES ('theme', 'default', '外站主题');
INSERT INTO `ylmf_config` VALUES ('site_connect', 'http://www.kyii.com', '');
INSERT INTO `ylmf_config` VALUES ('admin_logger', '1', '');
INSERT INTO `ylmf_config` VALUES ('path_inside_page', '/html', '');
INSERT INTO `ylmf_config` VALUES ('page_charset', 'utf-8', '');
INSERT INTO `ylmf_config` VALUES ('is_cron', '1', '');

-- ----------------------------
-- Table structure for ylmf_links
-- ----------------------------
DROP TABLE IF EXISTS `ylmf_links`;
CREATE TABLE `ylmf_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `title_color` varchar(32) DEFAULT NULL COMMENT '标题class',
  `link` text NOT NULL COMMENT '链接',
  `image_link` text COMMENT '图片链接',
  `opt_a` varchar(255) DEFAULT NULL COMMENT '附加参数1',
  `opt_b` varchar(255) DEFAULT NULL COMMENT '附加参数2',
  `opt_c` varchar(255) DEFAULT NULL COMMENT '附件参数3',
  `mix` text COMMENT '摘要',
  `sort_order` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `user_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '用户',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '可用状态',
  `begin_time` int(10) DEFAULT NULL COMMENT '最后更新时间',
  `end_time` int(10) DEFAULT NULL COMMENT '过期时刻',
  `create_time` int(10) NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4345 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ylmf_links
-- ----------------------------
INSERT INTO `ylmf_links` VALUES ('1', '1', '吉娃娃', null, 'http://www.hudong.com/wiki/%E5%90%89%E5%A8%83%E5%A8%83', null, null, null, null, null, '0', '1', 'Y', '0', '0', '1406880817');
INSERT INTO `ylmf_links` VALUES ('2', '2', '宠物大全', '000000', 'http://www.114la.com/chongwuhuaniao/index.htm', null, '', '', '', null, '0', '1', 'Y', '0', '0', '1406880840');
INSERT INTO `ylmf_links` VALUES ('3', '2', '阿拉斯加雪橇犬', null, 'http://www.hudong.com/wiki/%E9%98%BF%E6%8B%89%E6%96%AF%E5%8A%A0%E9%9B%AA%E6%A9%87%E7%8A%AC', null, null, null, null, null, '0', '1', 'Y', '0', '0', '1406880817');
INSERT INTO `ylmf_links` VALUES ('4', '1', '贵宾犬', null, 'http://www.hudong.com/wiki/%E8%B4%B5%E5%AE%BE%E7%8A%AC', null, null, null, null, null, '0', '1', 'Y', '0', '0', '1406880817');
INSERT INTO `ylmf_links` VALUES ('5', '3', '羊驼', null, 'http://www.hudong.com/wiki/%E7%BE%8A%E9%A9%BC', null, null, null, null, null, '0', '1', 'Y', '0', '0', '1406880817');
