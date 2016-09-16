-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 09 月 17 日 00:46
-- 服务器版本: 5.5.47
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `navigation`
--

-- --------------------------------------------------------

--
-- 表的结构 `nav_admin`
--

CREATE TABLE IF NOT EXISTS `nav_admin` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `nav_admin`
--

INSERT INTO `nav_admin` (`id`, `username`, `password`, `realname`, `group_id`, `last_login_ip`, `last_login_time`, `login_count`, `status_is`, `create_time`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator', 1, '127.0.0.1', 1473767199, 1, 'Y', 0);

-- --------------------------------------------------------

--
-- 表的结构 `nav_admin_group`
--

CREATE TABLE IF NOT EXISTS `nav_admin_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL COMMENT '组名称',
  `acl` text NOT NULL COMMENT '权限',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `nav_admin_group`
--

INSERT INTO `nav_admin_group` (`id`, `group_name`, `acl`, `status_is`, `create_time`) VALUES
(1, '超级管理组', 'administrator', 'Y', 0),
(2, '禁用', 'stop', 'Y', 0),
(3, '普通管理组', '|config|links|union|html_create|html_createIndex|html_createInner|links_tball|config_info|config_theme|config_cache|catalog_index|catalog_create|catalog_update|catalog_delete|catalog_sort_order|catalog_unverify|catalog_verify|links_index|links_create|links_update|links_verify|links_commend|links_delete|links_createbatch|links_createimport|union_index|', 'Y', 1398862722),
(4, '编辑组', '|links|union|catalog_index|catalog_create|catalog_update|catalog_delete|catalog_sort_order|catalog_unverify|catalog_verify|links_index|links_create|links_update|links_verify|links_commend|links_delete|links_createbatch|links_createimport|union_index|', 'Y', 1402477564);

-- --------------------------------------------------------

--
-- 表的结构 `nav_admin_logger`
--

CREATE TABLE IF NOT EXISTS `nav_admin_logger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `catalog` enum('login','create','update','delete','other','browse') NOT NULL DEFAULT 'other' COMMENT '类型',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `intro` text COMMENT '操作',
  `ip` char(15) NOT NULL DEFAULT '127.0.0.1' COMMENT '操作ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `nav_admin_logger`
--

INSERT INTO `nav_admin_logger` (`id`, `user_id`, `catalog`, `url`, `intro`, `ip`, `create_time`) VALUES
(1, 0, 'login', '/admin/index.html?r=public/login', '用户登录成功:admin', '127.0.0.1', 1473767199);

-- --------------------------------------------------------

--
-- 表的结构 `nav_catalog`
--

CREATE TABLE IF NOT EXISTS `nav_catalog` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=618 ;

--
-- 转存表中的数据 `nav_catalog`
--

INSERT INTO `nav_catalog` (`id`, `parent_id`, `catalog_name`, `content`, `data_count`, `status_is`, `redirect_url`, `path`, `seo_t`, `seo_k`, `seo_d`, `image_link`, `tb_id`, `opt_1`, `opt_2`, `create_time`) VALUES
(1, 2, '开放平台', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(2, 0, '办公协作', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(3, 0, '开源建站', '', 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(4, 2, '找工作啦', '', 0, 'Y', '', '', '', '', '', '', 0, '', '', 1406797214),
(5, 2, '站长必备', '', 0, 'Y', '', '', '', '', '', '', 0, '', '', 1403678769),
(605, 0, '编辑工具', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(606, 0, '在线IDE', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(607, 0, '前端大牛', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(608, 0, 'JS框架', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(609, 0, 'UI框架', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(610, 0, 'CSS库', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(611, 0, '知名社区', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(612, 0, '推荐书籍', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(613, 0, '创业必备', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(614, 0, '广告联盟', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(615, 0, '构建工具', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(616, 0, 'HTML5游戏引擎', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0),
(617, 0, '在线学习平台', NULL, 0, 'Y', '', '', '', '', '', '', 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `nav_config`
--

CREATE TABLE IF NOT EXISTS `nav_config` (
  `variable` varchar(50) NOT NULL COMMENT '变量',
  `value` text COMMENT '值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `nav_config`
--

INSERT INTO `nav_config` (`variable`, `value`, `description`) VALUES
('site_name', '前端导航', ''),
('site_domain', 'http://www.stbui.com', ''),
('site_logo', 'default_logo.png', ''),
('site_icp', '粤ICP备05021225号', ''),
('site_closed_summary', '系统维护中，请稍候......', ''),
('site_stats', '', ''),
('seo_title', '前端导航', ''),
('seo_description', '前端导航', ''),
('seo_keywords', '前端导航', ''),
('site_icp_url', 'http://www.miibeian.gov.cn/', ''),
('site_copyright', '2016', ''),
('upload_allow_ext', 'jpg,gif,bmp,jpeg,png', ''),
('upload_max_size', '200', ''),
('theme', 'default', '外站主题'),
('site_connect', 'http://www.stbui.com', ''),
('admin_logger', '1', ''),
('path_inside_page', '/html', ''),
('page_charset', 'utf-8', ''),
('is_cron', '1', '');

-- --------------------------------------------------------

--
-- 表的结构 `nav_links`
--

CREATE TABLE IF NOT EXISTS `nav_links` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4357 ;

--
-- 转存表中的数据 `nav_links`
--

INSERT INTO `nav_links` (`id`, `catalog_id`, `title`, `title_color`, `link`, `image_link`, `opt_a`, `opt_b`, `opt_c`, `mix`, `sort_order`, `user_id`, `status_is`, `begin_time`, `end_time`, `create_time`) VALUES
(1, 5, 'WebStorm', NULL, 'http://www.jetbrains.com/webstorm/', NULL, NULL, NULL, NULL, NULL, 2, 1, 'Y', 0, 0, 1406880817),
(2, 2, 'thinkjs', '000000', 'https://thinkjs.org/', NULL, '', '', '', NULL, 0, 1, 'Y', 0, 0, 1406880840),
(3, 2, 'Semantic UI', NULL, 'http://blog.zhaojie.me/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', 0, 0, 1406880817),
(4356, 0, 'Pure', NULL, 'http://purecss.io/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4, 1, 'Foundation', NULL, 'http://foundation.zurb.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', 0, 0, 1406880817),
(5, 609, 'Bootstrap', NULL, 'http://getbootstrap.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', 0, 0, 1406880817),
(4345, 2, 'Ember', NULL, 'http://emberjs.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4347, 605, 'Sublime Text', NULL, 'http://www.sublimetext.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4348, 605, 'Aptana', NULL, 'http://www.aptana.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4349, 605, 'Notepad++', NULL, 'http://notepad-plus-plus.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4350, 605, 'Dreamweaver', NULL, 'https://creative.adobe.com/products/download/dreamweaver', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4351, 606, 'Jsfiddle', NULL, 'http://jsfiddle.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4352, 606, 'CodeMirror', NULL, 'http://codemirror.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4353, 608, 'AngularJS', NULL, 'https://www.angularjs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4354, 0, 'React', NULL, 'https://facebook.github.io/react/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4355, 0, 'Backbone', NULL, 'http://backbonejs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
