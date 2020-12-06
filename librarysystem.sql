/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : librarysystem

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-01-02 01:23:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(5) NOT NULL DEFAULT '1' COMMENT '数字越大级别越大',
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'zs', '123', '2');
INSERT INTO `admin` VALUES ('2', 'ls', '123', '1');
INSERT INTO `admin` VALUES ('3', 'ww', '123', '3');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `adminId` int(11) NOT NULL COMMENT '管理员id',
  `id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`adminId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '1');
INSERT INTO `admin_menu` VALUES ('1', '2');
INSERT INTO `admin_menu` VALUES ('1', '3');
INSERT INTO `admin_menu` VALUES ('1', '4');
INSERT INTO `admin_menu` VALUES ('1', '5');
INSERT INTO `admin_menu` VALUES ('1', '6');
INSERT INTO `admin_menu` VALUES ('1', '7');
INSERT INTO `admin_menu` VALUES ('1', '8');
INSERT INTO `admin_menu` VALUES ('1', '9');
INSERT INTO `admin_menu` VALUES ('1', '10');
INSERT INTO `admin_menu` VALUES ('1', '11');
INSERT INTO `admin_menu` VALUES ('1', '12');
INSERT INTO `admin_menu` VALUES ('1', '13');
INSERT INTO `admin_menu` VALUES ('1', '14');
INSERT INTO `admin_menu` VALUES ('1', '15');
INSERT INTO `admin_menu` VALUES ('2', '2');
INSERT INTO `admin_menu` VALUES ('2', '3');
INSERT INTO `admin_menu` VALUES ('2', '4');
INSERT INTO `admin_menu` VALUES ('2', '7');
INSERT INTO `admin_menu` VALUES ('2', '8');
INSERT INTO `admin_menu` VALUES ('2', '9');
INSERT INTO `admin_menu` VALUES ('2', '10');
INSERT INTO `admin_menu` VALUES ('2', '11');
INSERT INTO `admin_menu` VALUES ('2', '12');

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(30) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `bookname` varchar(70) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `shelfid` int(11) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `bookcount` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', '', '987654', '金瓶梅', '1', '1', '嘻嘻嘻', '9', '100.00', '2019-12-08 23:11:14', null, '0');
INSERT INTO `bookinfo` VALUES ('6', null, '987655', '仲夏夜之梦', '1', '1', '莎士比亚', '19', '200.00', '2019-12-09 19:51:33', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('7', null, '987656', '红与黑', '5', '2', '汤司达', '10', '100.00', '2019-12-09 19:53:21', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('8', null, '987657', '人间喜剧', '5', '2', '巴尔扎特', '15', '150.00', '2019-12-09 19:53:57', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('9', null, '987658', 'King Oedipus', '4', '4', '忘了', '14', '80.00', '2019-12-09 19:55:07', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('10', null, '987659', '论语', '1', '1', '孔子', '10', '500.00', '2019-12-09 19:55:46', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('11', null, '987660', '纯粹理性批判', '4', '4', '康德', '1', '200.00', '2019-12-09 19:56:48', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('12', null, '987661', '经济的一本书', '3', '4', '莫得', '4', '100.00', '2019-12-09 19:59:50', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('13', null, '987662', '随便', '5', '4', '随便', '10', '200.00', '2019-12-13 17:01:00', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('14', null, '987663', '随便2', '3', '1', '随便2', '10', '50.00', '2019-12-14 19:44:42', 'zs', '0');
INSERT INTO `bookinfo` VALUES ('15', null, '987664', '随便3', '3', '1', '随便3', '50', '10.00', '2019-12-14 19:45:08', 'zs', '0');

-- ----------------------------
-- Table structure for bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf`;
CREATE TABLE `bookshelf` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookshelf
-- ----------------------------
INSERT INTO `bookshelf` VALUES ('1', 'A-1');
INSERT INTO `bookshelf` VALUES ('2', 'A-2');
INSERT INTO `bookshelf` VALUES ('4', 'B-1');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `typename` varchar(30) DEFAULT NULL,
  `days` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '历史文学类', '15');
INSERT INTO `booktype` VALUES ('3', '经济政治类', '15');
INSERT INTO `booktype` VALUES ('4', '哲学宗教类', '20');
INSERT INTO `booktype` VALUES ('5', '社会科学类', '10');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `readerId` varchar(30) DEFAULT NULL COMMENT '用户的条形码',
  `bookid` int(10) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `borrowTime` datetime DEFAULT NULL,
  `backTime` datetime DEFAULT NULL,
  `realbackTime` datetime DEFAULT NULL,
  `giveoperator` varchar(30) DEFAULT NULL,
  `backoperator` varchar(30) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `ifback` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('7', '201912070001', '1', '9876542442', '2019-12-10 22:24:10', '2019-12-25 22:24:10', '2019-12-10 22:25:47', 'zs', 'zs', '', '1');
INSERT INTO `borrow` VALUES ('8', '201912070001', '6', '9876556992', '2019-12-10 22:24:13', '2019-12-25 22:24:13', '2019-12-10 22:25:50', 'zs', 'zs', '', '1');
INSERT INTO `borrow` VALUES ('9', '201912070001', '7', '9876568673', '2019-12-10 22:24:17', '2019-12-20 22:24:17', '2019-12-10 22:25:52', 'zs', 'zs', '', '1');
INSERT INTO `borrow` VALUES ('10', '201912070001', '8', '9876575807', '2019-12-10 22:24:19', '2019-12-20 22:24:19', '2019-12-10 22:25:55', 'zs', 'zs', '', '1');
INSERT INTO `borrow` VALUES ('11', '201912070001', '12', '9876619914', '2019-12-10 22:25:35', '2019-12-25 22:25:35', null, 'zs', null, '', '0');
INSERT INTO `borrow` VALUES ('12', '201912070002', '9', '987658423', '2019-12-10 22:26:10', '2019-12-30 22:26:10', null, 'zs', null, '', '0');

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libraryname` varchar(50) DEFAULT NULL,
  `curator` varchar(10) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES ('1', '福师大图书馆', 'xxx', '1234567', '福建师范大学', '757736548@qq.com', 'https://www.baidu.com', '1971-12-01 00:00:00', '我真的不想再改错了');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `spread` int(255) DEFAULT NULL COMMENT '0不展开1展开',
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '读者管理', '', '1', '&#xe770;');
INSERT INTO `menu` VALUES ('2', '0', '图书管理', null, '0', '&#xe705;');
INSERT INTO `menu` VALUES ('3', '0', '借还管理', null, '0', '&#xe6b2;');
INSERT INTO `menu` VALUES ('4', '0', '系统设置', null, '0', '&#xe620;');
INSERT INTO `menu` VALUES ('5', '1', '读者类型管理', '../sys/toReaderTypeManager.action', '0', '&#xe613;');
INSERT INTO `menu` VALUES ('6', '1', '读者信息管理', '../sys/toReaderManager.action', '0', '&#xe60b;');
INSERT INTO `menu` VALUES ('7', '2', '图书类型管理', '../sys/toBookTypeManager.action', '0', '&#xe630;');
INSERT INTO `menu` VALUES ('8', '2', '图书信息管理', '../sys/toBookManager.action', '0', '&#xe62d;');
INSERT INTO `menu` VALUES ('9', '3', '图书借阅', '../sys/toBorrowManager.action', '0', '&#xe65b;');
INSERT INTO `menu` VALUES ('10', '3', '图书归还', '../sys/toReturnManager.action', '0', '&#xe65a;');
INSERT INTO `menu` VALUES ('11', '3', '借阅查询', '../sys/toSearchManager.action', '0', '&#xe656;');
INSERT INTO `menu` VALUES ('12', '4', '图书馆信息', '../sys/toLibraryManager.action', '0', '&#xe629;');
INSERT INTO `menu` VALUES ('13', '4', '管理员管理', '../sys/toAdminManager.action', '0', '&#xe632;');
INSERT INTO `menu` VALUES ('14', '4', '书架管理', '../sys/toBookShelfManager.action', '0', '&#xe649;');
INSERT INTO `menu` VALUES ('15', '4', '参数设置', '../sys/toCanshuManager.action', '0', '&#xe674;');

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `readerId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` int(4) DEFAULT NULL,
  `barcode` varchar(30) DEFAULT NULL,
  `vocation` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `paperType` int(10) DEFAULT NULL,
  `paperNO` varchar(20) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`readerId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('1', '小一', '0', '201912070001', '学生', '2019-12-08', '1', '1', '55558888', '123456', '123@qq.com', '2019-12-07 00:24:17', '测试添加1', '');
INSERT INTO `reader` VALUES ('2', '小二', '1', '201912070002', '莫得', '2019-12-08', '2', '1', '55559999', '234567', '456@laji.com', '2019-12-07 09:45:53', '', null);
INSERT INTO `reader` VALUES ('5', '小三', '1', '201912080001', '', '2019-12-08', '2', '0', '66667777', '987654', '4545@45545.com', '2019-12-08 09:54:59', '测试新增', 'zs');
INSERT INTO `reader` VALUES ('9', '小四', '1', '201912090001', '吃吃吃', '2014-11-09', '1', '1', '44446666', '456123', '575@ww.com', '2019-12-09 13:11:41', '', 'zs');

-- ----------------------------
-- Table structure for readertype
-- ----------------------------
DROP TABLE IF EXISTS `readertype`;
CREATE TABLE `readertype` (
  `readertypeId` int(10) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) DEFAULT NULL,
  `number` int(10) DEFAULT NULL,
  PRIMARY KEY (`readertypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readertype
-- ----------------------------
INSERT INTO `readertype` VALUES ('1', '普通用户', '10');
INSERT INTO `readertype` VALUES ('2', 'VIP用户', '20');
