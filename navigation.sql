-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 09 月 17 日 22:45
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4463 ;

--
-- 转存表中的数据 `nav_links`
--

INSERT INTO `nav_links` (`id`, `catalog_id`, `title`, `title_color`, `link`, `image_link`, `opt_a`, `opt_b`, `opt_c`, `mix`, `sort_order`, `user_id`, `status_is`, `begin_time`, `end_time`, `create_time`) VALUES
(4357, 605, 'WebStorm', NULL, 'http://www.jetbrains.com/webstorm/', NULL, NULL, NULL, NULL, NULL, 1, 1, 'Y', NULL, NULL, 0),
(4358, 0, 'thinkjs', NULL, 'https://thinkjs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4359, 609, 'Semantic UI', NULL, 'http://blog.zhaojie.me/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4360, 609, 'Foundation', NULL, 'http://foundation.zurb.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4361, 609, 'Bootstrap', NULL, 'http://getbootstrap.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4362, 608, 'Ember', NULL, 'http://emberjs.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4363, 605, 'Sublime Text', NULL, 'http://www.sublimetext.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4364, 605, 'Aptana', NULL, 'http://www.aptana.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4365, 605, 'Notepad++', NULL, 'http://notepad-plus-plus.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4366, 605, 'Dreamweaver', NULL, 'https://creative.adobe.com/products/download/dreamweaver', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4367, 0, 'Jsfiddle', NULL, 'http://jsfiddle.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4368, 0, 'CodeMirror', NULL, 'http://codemirror.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4369, 608, 'AngularJS', NULL, 'https://www.angularjs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4370, 608, 'React', NULL, 'https://facebook.github.io/react/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4371, 0, 'Backbone', NULL, 'http://backbonejs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4372, 0, 'Pure', NULL, 'http://purecss.io/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4373, 611, '开源中国', NULL, 'http://www.oschina.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4374, 0, 'nodejs', NULL, 'https://nodejs.org/en/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4375, 0, 'bower', NULL, 'https://bower.io/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4376, 0, 'NPM', NULL, 'https://www.npmjs.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4377, 0, 'Yeoman', NULL, 'https://github.com/yeoman/yeoman', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4378, 0, 'Gulp', NULL, 'http://www.gulpjs.com.cn/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4379, 0, 'Duo', NULL, 'http://duojs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4380, 0, 'webpack', NULL, 'https://webpack.github.io/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4381, 0, 'RequireJS', NULL, 'http://requirejs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4382, 0, 'RequireJS', NULL, 'http://requirejs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4383, 0, 'SeaJS', NULL, 'http://seajs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4384, 0, 'Less', NULL, 'http://lesscss.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4385, 0, 'Sass', NULL, 'http://sass-lang.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4386, 0, 'Stylus', NULL, 'http://learnboost.github.io/stylus/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4387, 0, 'avalon', NULL, 'http://avalonjs.coding.me/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4388, 0, 'CreateJS', NULL, 'http://createjs.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4389, 0, 'PhaserJS', NULL, 'http://phaser.io/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4390, 0, 'ThreeJS', NULL, 'http://threejs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4391, 0, 'Cocos引擎', NULL, 'http://www.cocos.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4392, 0, 'PixiJS', NULL, 'https://github.com/pixijs/pixi.js', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4393, 0, 'fis3', NULL, 'http://fis.baidu.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4394, 0, 'Grunt', NULL, 'http://www.gruntjs.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4395, 0, 'animate.css', NULL, 'https://daneden.github.io/animate.css/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4396, 0, 'Normalize.css', NULL, 'http://necolas.github.io/normalize.css/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4397, 0, 'weui', NULL, 'https://github.com/weui/weui', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4398, 0, 'Amaze UI', NULL, 'http://amazeui.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4399, 0, 'topcoat', NULL, 'http://topcoat.io/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4400, 0, 'Material UI', NULL, 'http://www.material-ui.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4401, 0, 'Framework7', NULL, 'http://framework7.taobao.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4402, 0, 'mui', NULL, 'http://dcloudio.github.io/mui/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4403, 0, 'Fries', NULL, 'http://jaunesarmiento.github.io/fries/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4404, 0, 'Ionic', NULL, 'http://ionicframework.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4405, 0, 'Bootstrap Material Design', NULL, 'http://fezvrasta.github.io/bootstrap-material-design/bootstrap-elements.html', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4406, 0, 'Materialize', NULL, 'http://materializecss.com/dialogs.html', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4407, 0, 'Flat UI', NULL, 'http://designmodo.github.io/Flat-UI/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4408, 0, 'vuejs', NULL, 'http://cn.vuejs.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4409, 0, 'Knockout', NULL, 'http://knockoutjs.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4410, 0, 'W3C', NULL, 'http://www.w3.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4411, 0, 'Github', NULL, 'https://www.github.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4412, 0, 'Coding', NULL, 'https://coding.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4413, 0, 'segmentfault', NULL, 'https://segmentfault.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4414, 0, '知乎', NULL, 'http://www.zhihu.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4415, 0, 'csdn', NULL, 'http://www.csdn.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4416, 0, '博客园', NULL, 'http://www.cnblogs.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4417, 0, 'W3Ctech', NULL, 'http://www.w3ctech.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4418, 0, '物勒工名', NULL, 'http://feexp.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4419, 0, '前端圈', NULL, 'http://fequan.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4420, 0, 'HTML5梦工场', NULL, 'http://www.html5dw.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4421, 0, '极客标签', NULL, 'http://www.gbtags.com/gb/index.htm', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4422, 0, 'W3Cplus', NULL, 'http://www.w3cplus.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4423, 0, '前端观察', NULL, 'https://www.qianduan.net/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4424, 0, 'W3Cfuns', NULL, 'http://www.w3cfuns.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4425, 0, '前端乱炖', NULL, 'http://www.html-js.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4426, 0, 'HTML5中国', NULL, 'http://www.html5cn.org/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4427, 0, 'Mozilla 开发者网络', NULL, 'https://developer.mozilla.org/zh-CN/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4428, 0, '大前端', NULL, 'http://www.daqianduan.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4429, 0, 'MOOC 慕课网', NULL, 'http://www.imooc.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4430, 0, '极客学院', NULL, 'http://www.jikexueyuan.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4431, 0, '萌码', NULL, 'http://www.mengma.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4432, 0, '牛客网', NULL, 'http://www.nowcoder.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4433, 0, '极客标签-课程库', NULL, 'http://www.gbtags.com/gb/gblibrary.htm', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4434, 0, '优才学院', NULL, 'http://www.ucai.cn/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4435, 0, '我赢职场', NULL, 'http://www.wyzc.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4436, 0, '实验楼', NULL, 'https://www.shiyanlou.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4437, 0, '计蒜客', NULL, 'https://www.jisuanke.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4438, 0, '萝卜网', NULL, 'http://www.luobo360.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4439, 0, '小象学院', NULL, 'http://www.chinahadoop.cn/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4440, 0, '云路课堂', NULL, 'http://www.yun.lu/student/homepage', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4441, 0, '网易云课堂', NULL, 'http://study.163.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4442, 0, '百度传课', NULL, 'http://www.chuanke.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4443, 0, '腾讯课堂', NULL, 'https://ke.qq.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4444, 0, '腾讯 Tgideas', NULL, 'http://tgideas.qq.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4445, 0, '腾讯 ISUX', NULL, 'http://isux.tencent.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4446, 0, '腾讯 CDU', NULL, 'http://cdc.tencent.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4447, 0, 'Alloyteam', NULL, 'http://www.alloyteam.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4448, 0, '腾讯无线 MXD', NULL, 'http://mxd.tencent.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4449, 0, '财付通 TID', NULL, 'http://tid.tenpay.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4450, 0, '阿里 U一点', NULL, 'http://www.aliued.cn/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4451, 0, '阿里国际 UED', NULL, 'http://www.aliued.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4452, 0, '阿里妈妈 MUX', NULL, 'http://mux.alimama.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4453, 0, '百度 FEX', NULL, 'http://fex.baidu.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4454, 0, '百度 EFE', NULL, 'http://efe.baidu.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4455, 0, '百度 UED', NULL, 'http://ued.baidu.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4456, 0, 'Screensiz', NULL, 'http://screensiz.es/phone', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4457, 0, '熊猫PNG压缩', NULL, 'https://tinypng.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4458, 0, '智图压缩', NULL, 'http://zhitu.isux.us/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4459, 0, 'svg生成工具', NULL, 'http://editor.method.ac/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4460, 0, '编译工具Koala', NULL, 'http://koala-app.com/index-zh.html', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4461, 0, '作图工具ProcessOn', NULL, 'https://www.processon.com/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0),
(4462, 0, '看云', NULL, 'http://www.kancloud.cn/', NULL, NULL, NULL, NULL, NULL, 0, 1, 'Y', NULL, NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
