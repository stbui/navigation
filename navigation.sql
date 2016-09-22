/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : navigation

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-09-22 18:45:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for nav_admin
-- ----------------------------
DROP TABLE IF EXISTS `nav_admin`;
CREATE TABLE `nav_admin` (
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
-- Records of nav_admin
-- ----------------------------
INSERT INTO `nav_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'administrator', '1', '127.0.0.1', '1473767199', '1', 'Y', '0');

-- ----------------------------
-- Table structure for nav_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `nav_admin_group`;
CREATE TABLE `nav_admin_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL COMMENT '组名称',
  `acl` text NOT NULL COMMENT '权限',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_admin_group
-- ----------------------------
INSERT INTO `nav_admin_group` VALUES ('1', '超级管理组', 'administrator', 'Y', '0');
INSERT INTO `nav_admin_group` VALUES ('2', '禁用', 'stop', 'Y', '0');
INSERT INTO `nav_admin_group` VALUES ('3', '普通管理组', '|config|links|union|html_create|html_createIndex|html_createInner|links_tball|config_info|config_theme|config_cache|catalog_index|catalog_create|catalog_update|catalog_delete|catalog_sort_order|catalog_unverify|catalog_verify|links_index|links_create|links_update|links_verify|links_commend|links_delete|links_createbatch|links_createimport|union_index|', 'Y', '1398862722');
INSERT INTO `nav_admin_group` VALUES ('4', '编辑组', '|links|union|catalog_index|catalog_create|catalog_update|catalog_delete|catalog_sort_order|catalog_unverify|catalog_verify|links_index|links_create|links_update|links_verify|links_commend|links_delete|links_createbatch|links_createimport|union_index|', 'Y', '1402477564');

-- ----------------------------
-- Table structure for nav_admin_logger
-- ----------------------------
DROP TABLE IF EXISTS `nav_admin_logger`;
CREATE TABLE `nav_admin_logger` (
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
-- Records of nav_admin_logger
-- ----------------------------
INSERT INTO `nav_admin_logger` VALUES ('1', '0', 'login', '/admin/index.html?r=public/login', '用户登录成功:admin', '127.0.0.1', '1473767199');

-- ----------------------------
-- Table structure for nav_catalog
-- ----------------------------
DROP TABLE IF EXISTS `nav_catalog`;
CREATE TABLE `nav_catalog` (
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
  `sort_order` int(10) DEFAULT '0' COMMENT '排序',
  `opt_1` varchar(64) NOT NULL,
  `opt_2` varchar(64) NOT NULL,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status_is` (`status_is`)
) ENGINE=MyISAM AUTO_INCREMENT=622 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_catalog
-- ----------------------------
INSERT INTO `nav_catalog` VALUES ('1', '2', '开放平台', null, '0', 'Y', '', '', '', '', '', '', '20', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('2', '0', '办公协作', null, '0', 'Y', '', '', '', '', '', '', '19', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('3', '0', '开源建站', '', '0', 'Y', '', '', '', '', '', '', '15', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('4', '2', '找工作啦', '', '0', 'Y', '', '', '', '', '', '', '3', '', '', '1406797214');
INSERT INTO `nav_catalog` VALUES ('5', '2', '站长必备', '', '0', 'Y', '', '', '', '', '', '', '14', '', '', '1403678769');
INSERT INTO `nav_catalog` VALUES ('605', '0', '编辑工具', null, '0', 'Y', '', '', '', '', '', '', '6', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('606', '0', '在线IDE', null, '0', 'Y', '', '', '', '', '', '', '7', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('607', '0', '前端大牛', null, '0', 'Y', '', '', '', '', '', '', '5', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('608', '0', 'JS库/框架', null, '0', 'Y', '', '', '', '', '', '', '8', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('609', '0', 'UI框架', null, '0', 'Y', '', '', '', '', '', '', '9', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('610', '0', 'CSS库', null, '0', 'Y', '', '', '', '', '', '', '10', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('611', '0', '开发社区', null, '0', 'Y', '', '', '', '', '', '', '1', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('612', '0', '推荐书籍', null, '0', 'Y', '', '', '', '', '', '', '12', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('613', '0', '创业必备', null, '0', 'Y', '', '', '', '', '', '', '16', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('614', '0', '广告联盟', null, '0', 'Y', '', '', '', '', '', '', '18', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('615', '0', '编译工具', null, '0', 'Y', '', '', '', '', '', '', '11', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('616', '0', 'HTML5游戏引擎', null, '0', 'Y', '', '', '', '', '', '', '13', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('617', '0', '在线学习平台', null, '0', 'Y', '', '', '', '', '', '', '4', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('618', '0', '前端面试', null, '0', 'Y', '', '', '', '', '', '', '17', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('619', '0', '前端团队', null, '0', 'Y', '', '', '', '', '', '', '2', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('620', '0', '开源项目', null, '0', 'Y', '', '', '', '', '', '', '0', '', '', '0');
INSERT INTO `nav_catalog` VALUES ('621', '0', '杂七杂八', null, '0', 'Y', '', '', '', '', '', '', '99', '', '', '0');

-- ----------------------------
-- Table structure for nav_config
-- ----------------------------
DROP TABLE IF EXISTS `nav_config`;
CREATE TABLE `nav_config` (
  `variable` varchar(50) NOT NULL COMMENT '变量',
  `value` text COMMENT '值',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_config
-- ----------------------------
INSERT INTO `nav_config` VALUES ('site_name', '前端导航', '');
INSERT INTO `nav_config` VALUES ('site_domain', 'http://www.stbui.com', '');
INSERT INTO `nav_config` VALUES ('site_logo', 'default_logo.png', '');
INSERT INTO `nav_config` VALUES ('site_icp', '粤ICP备05021225号', '');
INSERT INTO `nav_config` VALUES ('site_closed_summary', '系统维护中，请稍候......', '');
INSERT INTO `nav_config` VALUES ('site_stats', '', '');
INSERT INTO `nav_config` VALUES ('seo_title', '前端导航', '');
INSERT INTO `nav_config` VALUES ('seo_description', '前端导航', '');
INSERT INTO `nav_config` VALUES ('seo_keywords', '前端导航', '');
INSERT INTO `nav_config` VALUES ('site_icp_url', 'http://www.miibeian.gov.cn/', '');
INSERT INTO `nav_config` VALUES ('site_copyright', '2016', '');
INSERT INTO `nav_config` VALUES ('upload_allow_ext', 'jpg,gif,bmp,jpeg,png', '');
INSERT INTO `nav_config` VALUES ('upload_max_size', '200', '');
INSERT INTO `nav_config` VALUES ('theme', 'default', '外站主题');
INSERT INTO `nav_config` VALUES ('site_connect', 'http://www.stbui.com', '');
INSERT INTO `nav_config` VALUES ('admin_logger', '1', '');
INSERT INTO `nav_config` VALUES ('path_inside_page', '/html', '');
INSERT INTO `nav_config` VALUES ('page_charset', 'utf-8', '');
INSERT INTO `nav_config` VALUES ('is_cron', '1', '');

-- ----------------------------
-- Table structure for nav_links
-- ----------------------------
DROP TABLE IF EXISTS `nav_links`;
CREATE TABLE `nav_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` text NOT NULL COMMENT '链接',
  `description` varchar(255) DEFAULT NULL,
  `title_color` varchar(32) DEFAULT NULL COMMENT '标题class',
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
) ENGINE=MyISAM AUTO_INCREMENT=4704 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_links
-- ----------------------------
INSERT INTO `nav_links` VALUES ('4357', '605', 'WebStorm', 'http://www.jetbrains.com/webstorm/', 'jetbrains公司旗下一款JavaScript 开发工具。被广大中国JS开发者誉为“Web前端开发神器”、“最强大的HTML5编辑器”、“最智能的JavaScript IDE”等。', null, '', null, null, null, null, '1', '1', 'N', null, null, '0');
INSERT INTO `nav_links` VALUES ('4358', '0', 'thinkjs', 'https://thinkjs.org/', null, null, null, null, null, null, null, '0', '1', 'N', null, null, '0');
INSERT INTO `nav_links` VALUES ('4359', '609', 'UIKit', 'http://getuikit.com/', 'UIKit使用的变量基于LESS,具有体积小、模块化、可轻松地自定义主题及响应式界面。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4360', '609', 'Foundation', 'http://foundation.zurb.com/', '迄今为止最好的响应式前端框架，更快、更轻、更多功能、更灵活、更强大！', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4361', '609', 'Bootstrap', 'http://getbootstrap.com/', 'Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的,它简洁灵活,使得 Web 开发更加快捷。', null, 'http://wwwhere.io/img/thumbs/bootstrap.jpg', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4362', '608', 'Ember.js', 'http://emberjs.com/', '一个用于创建 web 应用的 JavaScript MVC 框架，采用基于字符串的Handlebars模板，支持双向绑定、观察者模式、计算属性（依赖其他属性动态变化）、自动更新模板、路由控制、状态机等。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4363', '605', 'Sublime Text', 'http://www.sublimetext.com/', '一个代码编辑器（Sublime Text 2和3是收费软件，但可以无限期试用），也是HTML和散文先进的文本编辑器。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4364', '605', 'Aptana', 'http://www.aptana.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4365', '605', 'Notepad++', 'http://notepad-plus-plus.org/', 'Windows操作系统下的一套文本编辑器(软件版权许可证: GPL)，有完整的中文化接口及支持多国语言编写的功能。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4366', '605', 'Dreamweaver', 'https://creative.adobe.com/products/download/dreamweaver', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4367', '0', 'Jsfiddle', 'http://jsfiddle.net/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4368', '0', 'CodeMirror', 'http://codemirror.net/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4369', '608', 'AngularJS', 'https://www.angularjs.org/', 'AngularJS 通过新的属性和表达式扩展了 HTML，可以构建一个单一页面应用程序。AngularJS有着诸多特性，最为核心的是：MVVM、模块化、自动化双向数据绑定、语义化标签、依赖注入等等。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4370', '608', 'React', 'https://facebook.github.io/react/', 'React 起源于 Facebook 的内部项目，React 的设计思想极其独特，属于革命性创新，性能出众，代码逻辑却非常简单。是现在非长热门的框架。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4371', '608', 'Backbone', 'http://backbonejs.org/', '', null, 'http://wwwhere.io/img/thumbs/backbone.jpg', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4372', '610', 'Pure', 'http://purecss.io/', '小巧的响应式 CSS 库，Yahoo!出品', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4373', '611', '开源中国', 'http://www.oschina.net/', '', null, null, null, null, null, null, '9', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4374', '0', 'nodejs', 'https://nodejs.org/en/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4375', '615', 'Bower', 'https://bower.io/', '是一个客户端技术的软件包管理器，它可用于搜索、安装和卸载如JavaScript、HTML、CSS之类的网络资源。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4376', '0', 'NPM', 'https://www.npmjs.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4377', '615', 'Yeoman', 'https://github.com/yeoman/yeoman', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4378', '615', 'Gulp', 'http://www.gulpjs.com.cn/', '基于 Node.js 构建的一个自动化构建工具,开发者可以使用它在项目开发过程中自动执行常见任务。', null, 'http://wwwhere.io/img/thumbs/gulp.jpg', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4379', '0', 'Duo', 'http://duojs.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4380', '615', 'webpack', 'https://webpack.github.io/', '一个前端资源加载/打包工具，只需要相对简单的配置就可以提供前端工程化需要的各种功能，并且如果有需要它还可以被整合到其他比如 Grunt / Gulp 的工作流。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4381', '608', 'RequireJS', 'http://requirejs.org/', '', null, '', null, null, null, null, '0', '1', 'N', null, null, '0');
INSERT INTO `nav_links` VALUES ('4382', '608', 'RequireJS', 'http://requirejs.org/', 'JS模块化是构建复杂项目的第一步 中文学习文档奉上', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4383', '608', 'SeaJS', 'http://seajs.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4384', '621', 'Less', 'http://lesscss.org/', '一种动态样式语言,属于CSS预处理语言的一种,它使用类似CSS的语法,为CSS的赋予了动态语言的特性,如变量、继承、运算、函数等,更方便CSS的编写和维护。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4385', '621', 'Sass', 'http://sass-lang.com/', '是一种CSS的开发工具，提供了许多便利的写法，大大节省了设计者的时间，使得CSS的开发，变得简单和可维护。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4386', '621', 'Stylus', 'http://stylus-lang.com/', '一个CSS的预处理框架，2010年产生，来自Node.js社区，主要用来给Node项目进行CSS预处理支持，所以Stylus 是一种新型语言，可以创建健壮的、动态的、富有表现力的CSS。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4387', '608', 'avalon', 'http://avalonjs.coding.me/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4388', '0', 'CreateJS', 'http://createjs.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4389', '0', 'PhaserJS', 'http://phaser.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4390', '608', 'ThreeJS', 'http://threejs.org/', 'JavaScript 3D 库。超多的 examples 等着你去发现，你只需要关注内存和风扇就行了', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4391', '0', 'Cocos引擎', 'http://www.cocos.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4392', '0', 'Pixi.js', 'https://github.com/pixijs/pixi.js', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4393', '615', 'FIS', 'http://fis.baidu.com/', ' 百度厂出品的前端构建工具 文档清晰，功能强大，推荐了解和使用', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4394', '615', 'Grunt', 'http://www.gruntjs.net/', '基于Node.js的项目构建工具。它可以自动运行你所设定的任务。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4395', '610', 'Animate.css', 'https://daneden.github.io/animate.css/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4396', '610', 'Normalize.css', 'http://necolas.github.io/normalize.css/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4397', '610', 'WeUI', 'https://github.com/weui/weui', '一套同微信原生视觉体验一致的基础样式库 为微信 Web 开发量身设计，令用户的使用感知更加统一', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4398', '609', 'Amaze UI', 'http://amazeui.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4399', '621', 'topcoat', 'http://topcoat.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4400', '609', 'Material UI', 'http://www.material-ui.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4401', '608', 'Framework7', 'http://framework7.taobao.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4402', '608', 'mui', 'http://dcloudio.github.io/mui/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4403', '608', 'Fries', 'http://jaunesarmiento.github.io/fries/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4404', '608', 'Ionic', 'http://ionicframework.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4405', '608', 'Bootstrap Material Design', 'http://fezvrasta.github.io/bootstrap-material-design/bootstrap-elements.html', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4406', '608', 'Materialize', 'http://materializecss.com/dialogs.html', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4407', '608', 'Flat UI', 'http://designmodo.github.io/Flat-UI/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4408', '608', 'Vue', 'http://cn.vuejs.org/', 'Vue.js 是用于构建交互式的 Web  界面的库。它提供了 MVVM 数据绑定和一个可组合的组件系统，具有简单、灵活的 API。从技术上讲， Vue.js 集中在 MVVM 模式上的视图模型层，并通过双向数据绑定连接视图和模型。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4409', '608', 'Knockout', 'http://knockoutjs.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4410', '621', 'W3C', 'http://www.w3.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4411', '621', 'Github', 'https://www.github.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4412', '621', 'Coding', 'https://coding.net/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4413', '611', 'segmentfault', 'https://segmentfault.com/', '是中国领先的开发者技术社区。 为编程爱好者提供一个纯粹、高质的技术交流的平台, 与开发者一起学习、交流与成长。', null, 'https://sf-static.b0.upaiyun.com/v-57e21b1f/global/img/logo-b.svg', null, null, null, null, '1', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4414', '611', '知乎', 'http://www.zhihu.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4415', '611', 'csdn', 'http://www.csdn.net/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4416', '611', '博客园', 'http://www.cnblogs.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4417', '611', 'W3Ctech', 'http://www.w3ctech.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4418', '621', '物勒工名', 'http://feexp.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4419', '611', '前端圈', 'http://fequan.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4420', '621', 'HTML5梦工场', 'http://www.html5dw.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4421', '617', '极客标签', 'http://www.gbtags.com/gb/index.htm', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4422', '611', 'W3Cplus', 'http://www.w3cplus.com/', '', null, 'http://cdn2.w3cplus.com/cdn/farfuture/RF1xpRJEoklyAb7wAfpNNpU93FkYVXyUYdKenU7JOEY/mtime:1414079823/sites/all/themes/w3cplusV2/images/logo.png', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4423', '611', '前端观察', 'https://www.qianduan.net/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4424', '621', 'W3Cfuns', 'http://www.w3cfuns.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4425', '611', '前端乱炖', 'http://www.html-js.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4426', '611', 'HTML5中国', 'http://www.html5cn.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4427', '621', 'Mozilla 开发者网络', 'https://developer.mozilla.org/zh-CN/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4428', '611', '大前端', 'http://www.daqianduan.com/', '', null, 'http://www.daqianduan.com/static/img/logo.png', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4429', '617', 'MOOC 慕课网', 'http://www.imooc.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4430', '617', '极客学院', 'http://www.jikexueyuan.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4431', '617', '萌码', 'http://www.mengma.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4432', '617', '牛客网', 'http://www.nowcoder.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4433', '617', '极客标签-课程库', 'http://www.gbtags.com/gb/gblibrary.htm', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4434', '617', '优才学院', 'http://www.ucai.cn/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4435', '617', '我赢职场', 'http://www.wyzc.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4436', '617', '实验楼', 'https://www.shiyanlou.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4437', '617', '计蒜客', 'https://www.jisuanke.com/', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4438', '617', '萝卜网', 'http://www.luobo360.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4439', '617', '小象学院', 'http://www.chinahadoop.cn/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4440', '617', '云路课堂', 'http://www.yun.lu/student/homepage', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4441', '617', '网易云课堂', 'http://study.163.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4442', '617', '百度传课', 'http://www.chuanke.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4443', '617', '腾讯课堂', 'https://ke.qq.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4444', '617', '腾讯 Tgideas', 'http://tgideas.qq.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4445', '619', '腾讯 ISUX', 'http://isux.tencent.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4446', '619', '腾讯 CDU', 'http://cdc.tencent.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4447', '619', 'AlloyTeam', 'http://www.alloyteam.com/', ' 腾讯 Web 前端团队', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4448', '619', '腾讯无线 MXD', 'http://mxd.tencent.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4449', '619', '财付通 TID', 'http://tid.tenpay.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4450', '619', '阿里 U一点', 'http://www.aliued.cn/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4451', '619', '阿里国际 UED', 'http://www.aliued.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4452', '619', '阿里妈妈 MUX', 'http://mux.alimama.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4453', '619', '百度 FEX', 'http://fex.baidu.com/', '代表作 FIS、UEditor、WebUploader、KityMinder', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4454', '619', '百度 EFE', 'http://efe.baidu.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4455', '619', '百度 UED', 'http://ued.baidu.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4456', '621', 'Screensiz', 'http://screensiz.es/phone', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4457', '621', '熊猫PNG压缩', 'https://tinypng.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4458', '621', '智图压缩', 'http://zhitu.isux.us/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4459', '621', 'svg生成工具', 'http://editor.method.ac/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4460', '621', '编译工具Koala', 'http://koala-app.com/index-zh.html', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4461', '606', 'ProcessOn', 'https://www.processon.com/', ' 和百度脑图的功能类似，脑图工具。但是还有社交、通讯的功能，提倡 协作绘图 的理念。感觉网页跳转的时候有点慢，模板样式比百度脑图好看(个人观点)，而且团队协作的功能真的相当好用。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4462', '621', '看云', 'http://www.kancloud.cn/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4463', '619', '淘宝前端', 'http://taobaofed.org/', '内容涵盖 Web 和 Node，要深度有深度，要广度有广度', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4464', '619', 'AMFE', 'https://github.com/amfe/article', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4465', '619', 'Alinode', 'http://alinode.aliyun.com/blog', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4466', '619', 'TmallFE', 'https://tmallfe.github.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4467', '619', 'THX', 'http://thx.github.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4468', '619', 'IMWeb', 'http://imweb.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4469', '619', '奇舞团', 'http://www.75team.com/', '坚持是最宝贵的，别人的奇舞周刊早已经过百期了', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4470', '619', '新浪 UED', 'http://ued.sina.com.cn/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4471', '619', '凹凸实验室', 'http://aotu.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4472', '619', '美团前端', 'http://fe.meituan.com/', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4473', '619', '去哪儿 UED', 'http://ued.qunar.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4474', '619', 'MFE', 'http://ued.qunar.com/mobile/blog/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4475', '619', '携程设计委员会', 'http://ued.ctrip.com/', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4476', '619', '大搜车前端', 'http://f2e.souche.com/blog/', '前端网红 小芋头君 所在的团队，文章质量高，尤其是 Node 方向的', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4477', '619', '豆瓣前端', 'https://github.com/douban-f2e', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4478', '611', '掘金', 'http://gold.xitu.io/', '掘金是中国质量最高的技术分享社区，邀请稀土用户作为Co-Editor 来分享优质的技术干货，从前端到后端开发，从设计到产品，让每一个掘金用户都能挖掘到有价值的干货。', null, 'http://gold.xitu.io/images/logo-header.svg', null, null, null, null, '4', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4479', '611', 'V2EX', 'http://v2ex.com/', '', null, null, null, null, null, null, '6', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4480', '611', '果壳问答', 'http://www.guokr.com/ask/pending/', '', null, 'http://static.guokr.com/apps/ask/images/eb5c6edd.5-logo.svg', null, null, null, null, '5', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4481', '611', 'DIV.IO', 'http://div.io/', '', null, null, null, null, null, null, '3', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4482', '612', 'Web标准设计', 'http://book.douban.com/subject/3327829/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4483', '612', '大巧不工 ', 'http://book.douban.com/subject/4914146/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4484', '612', '高性能网站建设指南', 'https://book.douban.com/subject/3132277/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4485', '612', '高性能网站建设进阶指南', 'https://book.douban.com/subject/4719162/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4486', '612', 'Web站点优化', 'https://book.douban.com/subject/4124141/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4487', '612', 'JavaScript高级程序设计（第3版）', 'https://book.douban.com/subject/10546125/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4488', '612', 'JavaScript权威指南(第6版)', 'https://book.douban.com/subject/10549733/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4489', '612', 'JavaScript语言精粹', 'http://book.douban.com/subject/3590768/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4490', '618', '关于前端面试', 'https://mdluo.github.io/blog/about-front-end-interview/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4491', '621', '极乐网', 'http://www.dreawer.com/home.html', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4492', '621', '一个前端菜鸟的博客', 'http://www.zxide.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4493', '621', '进步博客', 'http://www.topcss.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4494', '621', 'sheral', 'https://github.com/imweb/sheral', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4495', '621', 'HTML特殊字符编码对照表', 'http://www.jb51.net/onlineread/htmlchar.htm', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4496', '608', 'sui', 'http://m.sui.taobao.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4497', '621', 'CSS参考手册', 'http://css.doyoe.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4498', '621', 'koajs', 'http://koajs.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4499', '621', 'Node.js专业中文社区', 'https://cnodejs.org/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4500', '621', '了不起的Node.js', 'https://book.douban.com/subject/25767596/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4501', '621', '深入浅出Node.js', 'https://book.douban.com/subject/25768396/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4502', '621', 'Node.js入门经典', 'https://book.douban.com/subject/23780706/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4503', '621', 'Node.js开发指南', 'https://book.douban.com/subject/10789820/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4504', '621', '编码规范', 'http://zoomzhao.github.io/code-guide/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4505', '621', 'CSS 词汇表', 'http://yisibl.github.io/css-vocabulary/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4506', '611', 'Web前端开发大系概览', 'https://github.com/unruledboy/WebFrontEndStack', '', null, null, null, null, null, null, '1', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4507', '621', 'HTML5标签速查', 'http://www.inmotionhosting.com/img/infographics/html5_cheat_sheet_tags.png', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4508', '621', 'Css参考文档', 'http://tympanus.net/codrops/css_reference/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4509', '621', 'Ctrip webkitcss', 'http://ued.ctrip.com/webkitcss/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4510', '621', 'Css3动画手册', 'http://isux.tencent.com/css3/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4511', '621', 'caniuse', 'http://caniuse.com/', '前端必备；查看浏览器对各种新特性的兼容情况', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4512', '621', 'http://wwwhere.io/', 'http://wwwhere.io/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4513', '621', 'http://f2er.club/', 'http://f2er.club/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4514', '1', '新浪开发平台', 'http://open.weibo.com/connect', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4515', '621', '在线协作作图', 'https://www.processon.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4516', '621', 'F2E 前端导航', 'http://f2e.im/static/pages/nav/index.html#6755344-tsina-1-50251-72fb614e7130783e23f259bf5de6db3a', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4517', '619', '网易邮箱前端技术中心', 'http://ntesmailfetc.blog.163.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4518', '619', '网易用户体验中心', 'http://uedc.163.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4519', '621', 'SDC设计师网址导航', 'http://hao.uisdc.com/', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4520', '621', '魔法组件库 - 滴滴出行', 'http://mofang.xiaojukeji.com/', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4522', '611', 'Stack Overflow', 'http://stackoverflow.com/', '一个与程序相关的IT技术问答网站。用户可以在网站免费提交问题，浏览问题，索引相关内容，在创建主页的时候使用简单的HTML。', null, null, null, null, null, null, '2', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4523', '621', '浏览器市场份额', 'http://tongji.baidu.com/data/browser', '百度统计流量研究院', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4528', '0', 't', 't', '', null, null, null, null, null, null, '0', '1', 'N', null, null, '0');
INSERT INTO `nav_links` VALUES ('4525', '621', '码农周刊', ' http://weekly.manong.io/issues/', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4526', '621', '前端周刊', 'http://www.feweekly.com/issues', '', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4527', '621', 'colorzilla', 'http://www.colorzilla.com/gradient-editor/', 'CSS滤镜生成器', null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4529', '0', 'a', 'a', '', null, '1', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4530', '621', '奇舞周刊', 'http://old.75team.com/weekly/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4531', '621', 'WEB前端开发', 'http://www.css88.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4532', '621', '平安科技移动开发二队技术周报', 'https://github.com/PaicHyperionDev/MobileDevWeekly', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4533', '621', 'react.js 中文论坛', 'http://www.react-china.org', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4534', '621', '99移动端知识集合', 'https://github.com/jtyjty99999/mobileTech', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4535', '621', '移动端前端开发知识库', 'https://github.com/AlloyTeam/Mars', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4536', '621', 'gitbook', 'https://www.gitbook.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4537', '621', 'esma 兼容列表', 'http://kangax.github.io/compat-table/es6', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4538', '621', 'http://csscreator.com/properties', 'csscreator', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4539', '621', '在线测兼容-移动端', 'http://www.responsinator.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4540', '621', 'Semantic UI', 'http://semantic-ui.com', 'Semantic UI 是一款语义化设计的前端开源框架,其功能强大,使用简单,为设计师和开发师提供可复用的完美设计方案。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4541', '609', 'MetroUI', 'http://metroui.org.ua/', '好看好用，重点是样式特别、个性', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4542', '609', 'Buttons', 'http://alexwolfe.github.io/Buttons', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4543', '621', 'pintuer', 'http://www.pintuer.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4544', '621', 'amazeui', 'http://amazeui.org', '', null, '', null, null, null, null, '0', '1', 'N', null, null, '0');
INSERT INTO `nav_links` VALUES ('4545', '621', 'underscore 中文手册', 'http://www.css88.com/doc/underscore', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4546', '621', 'http://api.highcharts.com/highcharts', 'Highcharts 英文API', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4547', '608', 'echarts', 'http://echarts.baidu.com/', '好用，最关键的是支持的图表展示非常之多，强烈推荐', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4548', '621', '高德地图', 'http://lbs.amap.com/api', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4549', '621', '百度github', 'https://github.com/fex-team', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4550', '621', 'alloyteam-github', 'http://alloyteam.github.io', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4551', '621', '奇舞团开源项目', 'http://75team.github.io', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4552', '621', 'detector', 'http://75team.github.io/novaUI/tools/detector', '移动浏览器信息监测', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4553', '621', 'fastclick', 'https://github.com/ftlabs/fastclick', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4554', '621', 'KISSY', 'http://docs.kissyui.com', ' 阿里前端JavaScript库', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4555', '621', 'nej', 'http://nej.netease.com', '网易前端JavaScript库', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4556', '621', '百度分享', 'http://share.baidu.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4557', '621', 'JiaThis', 'http://jiathis.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4558', '621', '社会化分享组件', 'http://developer.baidu.com/soc/share', '', null, '移动端', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4559', '621', 'ShareSDK', 'http://www.mob.com/#/index', 'ShareSDK 轻松移动端实现社会化功能', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4560', '621', 'ueditor', 'http://ueditor.baidu.com/website', '百度', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4561', '621', 'ckeditor', 'http://ckeditor.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4562', '621', 'kindeditor', 'http://kindeditor.net', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4563', '607', '王员外', 'http://lab.yuanwai.wang', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4564', '621', '平凡', 'http://pingfan1990.sinaapp.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4565', '609', 'frozenui', 'http://frozenui.github.io/case.html', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4566', '621', '浏览器端调试安卓', 'https://openstf.github.io', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4567', '0', '移动端前端开发调试', 'http://yujiangshui.com/multidevice-frontend-debug', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4568', '0', '微信调试工具', 'http://blog.qqbrowser.cc', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4569', '0', '远程console', 'http://jsconsole.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4570', '612', '代码大全', 'https://www.amazon.cn/gp/product/B0061XKRXA/ref=as_li_ss_tl?ie=UTF8&camp=536&creative=3132&creativeASIN=B0061XKRXA&linkCode=as2&tag=justjavac-23', '公认的关于编程的最佳实践指南之一， 在过去的十多年间，本书一直在帮助开发人员编写更好的软件。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4571', '612', '程序员修炼之道', 'http://www.amazon.cn/gp/product/B004GV08CY/ref=as_li_ss_tl?ie=UTF8&camp=536&creative=3132&creativeASIN=B004GV08CY&linkCode=as2&tag=justjavac-23', '对于那些已经学习过编程机制的程序员来说，这是一本卓越的书。 或许他们还是在校生，但对要自己做什么，还感觉不是很安全。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4572', '612', '人月神话', 'http://www.amazon.cn/gp/product/B0011C2P7W/ref=as_li_ss_tl?ie=UTF8&camp=536&creative=3132&creativeASIN=B0011C2P7W&linkCode=as2&tag=justjavac-23', '在软件领域，很少能有像《人月神话》一样具有深远影响力并且畅销不衰的著作。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4573', '612', '编程书籍索引', 'https://github.com/vhf/free-programming-books/blob/master/free-programming-books-zh.md', 'github 上的一个流行的编程书籍索引', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4574', '621', 'Chrome扩展开发文档', 'Chrome扩展开发文档', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4575', '621', '效果网', 'http://www.jq22.com', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4576', '621', '花瓣网', 'http://huaban.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4577', '621', '优美图', 'http://www.topit.me/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4578', '621', 'codepen', 'http://codepen.io/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4579', '621', '摄图网', 'http://699pic.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4580', '607', '阮一峰', 'http://www.ruanyifeng.com/home.html', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4581', '621', '粉丝日志', 'http://blog.fens.me/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4582', '607', '张鑫旭', 'http://www.zhangxinxu.com/wordpress/', '成名多年的、高产的前端大湿，CSS猛人', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4583', '621', 'Hexo', 'https://hexo.io/zh-cn/', '快速、简洁且高效的博客框架，照着文档分分钟就可以在本地跑起来', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4584', '621', 'Jekyll', 'http://jekyll.bootcss.com/', '将纯文本转化为静态网站和博客。由于环境依赖的问题，所以安装起来可能稍费劲那么一点。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4585', '621', 'GithubPages', 'https://pages.github.com/', '免费的静态站点。配合着 Hexo 或 Jekyll 的模板，分分搭建出一套炫酷的个人博客', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4586', '621', 'Tumblr', 'https://www.tumblr.com/', '轻博客的祖师爷，各种各样的主题感觉不错', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4587', '621', 'Wordpress', 'https://zh-cn.wordpress.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4588', '621', 'HEAD', 'https://github.com/joshbuchea/HEAD', '最全的 <head> 列表，真心佩服这种偏执的整理能力', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4589', '621', 'blur-admin', 'https://github.com/akveo/blur-admin', '视觉冲击极强的管理后台，各种动画效果。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4590', '621', 'AdminLTE', 'https://github.com/almasaeed2010/AdminLTE', '很小清新的后台模板，每次看preview 页面都觉得很有视觉冲击', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4591', '621', 'gentelella', 'https://github.com/puikinsh/gentelella', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4592', '621', 'material-design-lite', 'https://github.com/google/material-design-lite', '包含了多套简洁的 templates，可以用于博客、后台或者企业首页。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4593', '621', 'Font Awesome', 'http://fontawesome.io/', '为您提供可缩放的矢量图标,您可以使用CSS所提供的所有特性对它们进行更改,包括:大小、颜色、阴影或者其它任何支持的效果。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4594', '621', 'LoadersCSS', 'https://connoratherton.com/loaders', '用 CSS 技术实现 loading 动画', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4595', '610', 'PostCSS', 'https://github.com/postcss/postcss', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4596', '610', 'CSSgram', 'https://github.com/una/CSSgram', '图片滤镜库，终于可以用 CSS 在 web 上实现滤镜的效果鸟 IE不支持，不过新的移动设备支持没问题', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4597', '610', 'HINT.css', 'https://github.com/chinchang/hint.css', ' 一款非常小巧的提示框效果', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4598', '610', 'Balloon.css', 'http://kazzkiq.github.io/balloon.css/', '一款非常小巧的提示框效果', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4599', '610', 'Hover.css', 'http://ianlunn.github.io/Hover/', '很多鼠标 Hover 态的效果，可以给产品学习一下:)', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4600', '0', 'Cursor', 'http://css-cursor.techstream.org/', '记录各浏览器对Cursor的支持情况', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4601', '0', 'csscss', 'https://github.com/zmoazeni/csscss', '用于检查 CSS 代码冗余', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4602', '610', 'hamburgers', 'https://jonsuh.com/hamburgers/', '简单的动画库，让 Click(or Tap) 变得美妙', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4603', '0', 'cssmatic', 'http://www.cssmatic.com/', '一个帮忙调试CSS效果的工具', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4604', '608', 'Swiper', 'http://www.swiper.com.cn/', '强大的 Slider 库 其实这类效果库非常多，但文档能那么专业的就很少鸟', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4605', '0', 'babel', 'https://babeljs.io/', 'ES6 用起来。这个插件可以让我们用新的 标准/提案 写 JavaScript 代码，然后再向下 转换编译，最终生成随处可用的 JavaScript 代码。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4606', '608', 'fullPage', 'http://alvarotrigo.com/fullPage/', '非常好用的全屏滑动库，看 Demo 就明白', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4607', '608', 'PhotoSwipe', 'http://photoswipe.com/', '偶常用的 js 库 官网上有这么一句很关键、重要\"no dependencies\"', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4608', '608', 'ScrollReveal', 'https://github.com/jlmakes/scrollreveal.js', ' star 10000+ 轻量级 JS 库。作用为当元素进入视窗的时候展示它们，README 中有示例，上手非常简单。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4609', '0', 'vue-admin', 'https://github.com/fundon/vue-admin', '基于 Vue.js 开发的后台', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4610', '608', 'mixitup', 'https://github.com/patrickkunka/mixitup', '一款基于 jQuery 的 排序/过滤 的JS库，最关键是有着美妙的动画效果', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4611', '608', 'favico.js', 'http://lab.ejci.net/favico.js/', ' 动态改变浏览器标签栏中的网站图标，非常好玩', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4612', '608', 'ant.design', 'http://ant.design/', '蚂蚁金服搞的良心项目，文档美好的令人发指 样式优雅，强烈推荐内部系统尝试此库', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4613', '608', 'highlightjs', 'https://highlightjs.org/', '代码高亮库，支持非常多的语言', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4614', '608', 'daterangepicker', 'http://www.daterangepicker.com/', ' 时间选择插件的不二选择，基于 Bootstrap 和 Moment.js', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4615', '608', 'nodePPT', 'https://github.com/ksky521/nodePPT', '前同事三水的大作，好用必须得支持:) 用 Markdown 写 PPT，还可以 HTML 混排，上手飞快', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4616', '608', 'excellentexport', 'https://github.com/jmaister/excellentexport', '纯前端的 Excel 导出，非常之方便', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4617', '608', 'Sortable', 'https://github.com/RubaXa/Sortable', '拖拽神器，用了就知道', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4618', '608', 'toastr', 'https://github.com/CodeSeven/toastr', '信息提示的库，推荐的原因是卖相好、功能强大 demo', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4619', '608', 'peity.js', 'http://benpickles.github.io/peity/', 'jQuery的图表插件，特别cute，感觉萌萌哒 将HTML转换成一个小的<svg>饼图、圆环图、折线图等等', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4620', '608', 'emojify.js', 'https://github.com/Ranks/emojify.js', ' 能够将emoji关键词转换为emoji图片的JS插件 可以快速的为你的网站提供emoji表情支持', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4621', '608', 'Push.js', 'https://github.com/Nickersoft/push.js', '基于 Notification API 实现的桌面效果的提示栏。浏览器支持情况不错，', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4622', '610', 'NProgress', 'https://github.com/rstacruz/nprogress/', '使页面加载时有更好的loading效果', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4623', '608', 'Noticejs', 'https://github.com/jaredreich/notie', '一个简单的通知库，木有依赖', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4624', '608', 'onepage-scroll', 'onepage-scroll', ' 依赖 jQuery 的单页滚动库，和 fullPage 类似', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4625', '608', 'videojs', 'http://videojs.com/', '当下视频需求都用上<video>鸟 样式和交互统一的问题交给 videojs 搞定:)', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4626', '608', 'clipboard', 'http://zenorocha.github.io/clipboard.js/', '仅 2KB 大小，搞定剪贴板功能，屌不屌~ 但是，Safari 不支持...', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4627', '608', 'impress.js', 'https://github.com/impress/impress.js', ' 用来写 PPT 不错', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4628', '608', 'Cropper', 'http://fengyuanchen.github.io/cropper/', '国人开发的图片裁剪库', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4629', '0', 'pm2', 'https://www.npmjs.com/package/pm2', ' 是一个带有负载均衡功能的 Node 应用的进程管理器； 是 Forever 的进阶库', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4630', '606', '百度脑图', 'http://naotu.baidu.com/', '非常方便的思维导图工具。功能强、样式佳、无广告，算百度出的良心产品之一。除了 Evernote，脑图是我非常依赖的记录工具', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4631', '0', 'overapi', 'http://overapi.com/', '最全的开发人员在线速查手册', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4632', '606', 'Slides', 'https://slides.com/', '一个所见即所得的 WebPPT 编辑器。虽然装X效果一般，但是比较推荐，因为无论懂不懂 UI，做出来的效果不会太难看', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4633', '0', 'faviconer.co', 'http://www.faviconer.co/', '一个所见即所得的icon生成器，很好用', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4634', '606', 'smallpdf', 'http://smallpdf.com/cn', '提供各种格式和 PDF 互相转换', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4635', '0', 'Postman', 'https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop', 'POST 接口调试终结者，异常强大的接口调试工具。稍稍有一点学习成本，推荐之', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4636', '0', 'Electron', 'http://electron.atom.io/', '如果你想利用 web 技术构建跨平台的桌面程序，那么赶紧来了解 Electron。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4637', '608', 'element', 'http://element.eleme.io/', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的组件库，提供了配套设计资源，帮助你的网站快速成型。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4638', '611', 'fami2u', 'http://forums.fami2u.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4661', '612', 'Eric Meyer 谈 CSS(卷2)', 'https://www.amazon.cn/Eric-Meyer-%E8%B0%88-CSS-%E8%BF%88%E8%80%B6/dp/B00170M84I/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4639', '621', 'Express', 'http://expressjs.com/', '基于 Node.js 平台的 web 应用开发框架 基于Node.js 平台,快速、开放、极简的 web 开发框架。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4640', '621', 'Meteor', 'https://www.meteor.com/', 'Meteor 是一个构建在 Node.js 之上的平台，用来开发实时网页程序。Meteor 位于程序数据库和用户界面之间，保持二者之间的数据同步更新。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4641', '605', 'Atom', 'https://atom.io/', '更为先进的文本代码编辑器 - 由 Github 打造的下一代编程开发利器在代码编辑器、文本编辑器领域,有着不少的「神器」级的产品。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4642', '605', 'Visual Studio Code', 'https://www.visualstudio.com/products/code-vs', '微软推出，一个运行于 Mac OS X、Windows和 Linux 之上的，针对于编写现代 Web 和云应用的跨平台源代码编辑器。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4643', '621', 'IconMonster', 'http://iconmonstr.com/', '免费，高质量, 庞大且资源不断增长的简洁的icon图标库。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4644', '621', 'IconFinder', 'https://www.iconfinder.com/', 'Iconfinder提供美丽的图标,服务数以百万计的设计师,开发商和其他有创意的专业人员。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4645', '621', 'Fontello', 'http://fontello.com/', '一个目测有200+个图标（数量还在增加）的 Web-font 图标市场，对于广大设计师、前端开发者来说是很棒的资源。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4646', '621', '阿里妈妈矢量图标库 ', 'http://iconfont.cn/', 'Iconfont.cn是由阿里巴巴UX部门推出的矢量图标管理网站，也是国内首家推广Webfont形式图标的平台。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4647', '611', '全栈社区', 'http://www.fullstackspace.com/', '中国最大的全栈开发者社区,致力于打造一个问题解答,技术文章分享,全栈人员创业的服务平台,让开发更容易,让创业更简单.', null, '', null, null, null, null, '0', '1', 'N', null, null, '0');
INSERT INTO `nav_links` VALUES ('4648', '611', '稀土区', 'https://xituqu.com/', '专注开发设计资源分享，UI模板资源，ICONS资源，HTML模板资源等等.......', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4649', '611', 'Front-end Front', 'https://frontendfront.com/', '在Front-end Front，前端开发者可以提出问题，分享有趣的链接，并展示他们的项目作品。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4650', '621', 'Hashnode', 'https://hashnode.com/', 'Hashnode是开发者讨论技术问题，分享解决方案，与世界各地的开发者共享资源的聚集地。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4651', '611', 'Refind', 'https://refind.com/', '有着开发者, 黑客, 设计师收集和分享最好的资源的社区。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4652', '611', '开发者头条', 'http://toutiao.io/', '一个以程序员为中心，基于学习和分享的开发者社区。你可以阅读头条新闻、分享技术文章、发布开源项目，订阅技术极客们创建的学习主题和关注编程牛人。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4653', '611', '推酷', 'http://www.tuicool.com/', '以技术为驱动，以聚合挖掘为核心，打造个性推荐和订阅，给你一站式的阅读。 更汇聚优质公开课和线下活动，让信息知识获取更便捷。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4654', '621', 'wdrl.info', 'https://wdrl.info/', '精心挑选的Web开发相关资源，每星期进行整合报道。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4655', '621', 'webopsweekly.com', 'http://webopsweekly.com/', '每周进行报道关于网络运营，应用部署，网站性能和工具分享类的文章。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4656', '621', 'web tools weekly', 'http://webtoolsweekly.com/', '专注于前端开发和网页设计工具分享。每一个问题都有一个简短的提示或教程，另外每周都会分享的各种应用程序、脚本、插件和其他有用的资源。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4657', '621', 'freshbrewed.co', 'https://freshbrewed.co/', '每周为前端开发者和设计师提供开发和设计类的阅读摘要。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4658', '621', 'smashingmagazine.com', 'https://www.smashingmagazine.com/', '一款专门为个人前端开发者和设计师提供的在线报纸，每周二都会定时的更新有用的资源。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4659', '621', 'front-end dev weekly', 'http://frontenddevweekly.com/', '每周为前端开发者提供新闻, 包含工具资源，还有灵感。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4660', '621', 'friday front-end', 'http://fridayfrontend.com/', '邮件订阅，每日为前端开发者发关于开发资源的邮件。', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4662', '612', 'CSS权威指南 （第3版）', 'http://book.douban.com/subject/2308234/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4663', '621', '精通CSS（第2版）', 'https://book.douban.com/subject/4736167/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4664', '612', 'HTML & CSS设计与构建网站', 'https://book.douban.com/subject/21338365/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4665', '612', 'JavaScript & jQuery交互式Web前端开发', 'https://book.douban.com/subject/26433805/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4666', '612', '锋利的jQuery', 'https://book.douban.com/subject/10792216/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4667', '612', '高性能JavaScript', 'https://book.douban.com/subject/5362856/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4668', '612', 'JavaScript DOM编程艺术 （第2版）', 'https://book.douban.com/subject/6038371/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4669', '612', '编写可维护的JavaScript', 'https://book.douban.com/subject/21792530/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4670', '612', 'JAVASCRIPT语言精髓与编程实践', 'https://book.douban.com/subject/3012828/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4671', '612', 'JavaScript设计模式', 'https://book.douban.com/subject/3329540/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4672', '612', '基于MVC的JavaScript Web富应用开发', 'https://book.douban.com/subject/10733304/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4673', '612', 'web性能实践日志', 'https://book.douban.com/subject/25891125/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4674', '612', 'Web性能权威指南', 'https://book.douban.com/subject/25856314/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4675', '612', '版本控制之道', 'https://book.douban.com/subject/4813786/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4676', '612', 'progit', 'http://iissnan.com/progit/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4677', '612', 'Git权威指南', 'https://book.douban.com/subject/6526452/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4678', '608', 'polymer', 'https://www.polymer-project.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4679', '608', 'Riot', 'http://riotjs.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4680', '621', 'Socket.io', 'http://socket.io/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4681', '621', 'D3', 'http://d3js.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4682', '621', 'Flot', 'http://www.flotcharts.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4683', '610', 'bounce', 'http://bouncejs.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4684', '610', 'move.js', 'https://visionmedia.github.io/move.js/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4685', '610', 'Effeckt.css', 'https://h5bp.github.io/Effeckt.css/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4686', '621', 'Handlebars', 'http://handlebarsjs.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4687', '621', 'Jade', 'http://jade-lang.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4688', '621', 'Ejs', 'http://www.embeddedjs.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4689', '621', 'CoffeeScript', 'http://coffeescript.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4690', '621', 'TypeScript', 'http://www.typescriptlang.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4691', '621', 'PhoneGap', 'https://cordova.apache.org/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4692', '621', 'mui', 'http://dev.dcloud.net.cn/mui/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4693', '621', 'NW', 'http://nwjs.io/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4694', '621', 'ourjs', 'http://ourjs.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4695', '619', '360用户体验设计中心', 'http://uxc.360.cn/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4696', '607', '玉伯', 'https://github.com/lifesinger', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4697', '607', ' 廖雪峰', 'http://www.liaoxuefeng.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4698', '607', '勾三股四', 'http://jiongks.name/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4699', '607', '司徒正美', 'http://www.cnblogs.com/rubylouvre/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4700', '607', 'JerryQu 的小站', 'https://imququ.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4701', '607', '前端小武', 'https://xuexb.com/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4702', '607', '赵鹏', 'http://zhaopeng.me/', '', null, '', null, null, null, null, '0', '1', 'Y', null, null, '0');
INSERT INTO `nav_links` VALUES ('4703', '0', 'test', 'link', null, null, null, null, null, null, null, '0', '1', 'Y', null, null, '0');
