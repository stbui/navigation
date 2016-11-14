/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : navigation

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-11-14 18:35:40
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
-- Table structure for nav_catalog
-- ----------------------------
DROP TABLE IF EXISTS `nav_catalog`;
CREATE TABLE `nav_catalog` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(100) NOT NULL COMMENT '名称',
  `description` text COMMENT '详细介绍',
  `topic_id` int(10) unsigned DEFAULT '0' COMMENT '显示的数据量',
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '状态',
  `redirect_url` varchar(255) DEFAULT '' COMMENT '跳转地址,更多链接',
  `image_link` varchar(255) NOT NULL,
  `sort_order` int(10) DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `status_is` (`status_is`)
) ENGINE=MyISAM AUTO_INCREMENT=662 DEFAULT CHARSET=utf8;

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
-- Table structure for nav_links
-- ----------------------------
DROP TABLE IF EXISTS `nav_links`;
CREATE TABLE `nav_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` text NOT NULL COMMENT '链接',
  `link_github` text,
  `tag` text COMMENT '摘要',
  `description` varchar(255) DEFAULT NULL,
  `image_link` text COMMENT '图片链接',
  `sort_order` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `user_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '用户',
  `catalog_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分类',
  `topic_id` smallint(5) NOT NULL,
  `status_is` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT '可用状态',
  `create_time` datetime DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8571 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for nav_topic
-- ----------------------------
DROP TABLE IF EXISTS `nav_topic`;
CREATE TABLE `nav_topic` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `status_is` enum('Y','N') NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `top_is` enum('N','Y') NOT NULL DEFAULT 'N',
  `pv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=gbk;
