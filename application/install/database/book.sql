/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : luffycms

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-04-28 18:03:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `en_name` varchar(20) NOT NULL COMMENT '分类英文名称（用于前台url）',
  `path` varchar(20) DEFAULT NULL COMMENT '分类路径;格式： parent_ids,id,',
  `title` varchar(255) DEFAULT NULL COMMENT '前台显示的分类标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '前台显示的分类关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '前台显示的分类描述',
  `sort` int(3) NOT NULL DEFAULT '0' COMMENT '分类排序',
  `level` tinyint(2) NOT NULL DEFAULT '1' COMMENT '分类深度',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`en_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('6', '0', '上衣', 'jacket', '6,', '', '', '', '1', '1', '2017-04-22 13:56:53', '2017-04-22 15:24:24');
INSERT INTO `category` VALUES ('7', '6', '外套', 'coat', '6,7,', '', '', '', '1', '2', '2017-04-22 13:58:00', '2017-04-22 15:25:52');
INSERT INTO `category` VALUES ('9', '7', '牛仔外套', 'niuza', '6,7,9,', '111', '', '', '1', '3', '2017-04-22 16:02:21', '2017-04-24 17:30:59');

-- ----------------------------
-- Table structure for former
-- ----------------------------
DROP TABLE IF EXISTS `former`;
CREATE TABLE `former` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '规格名称:红色',
  `spec` text NOT NULL COMMENT '规格:数组类型',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `former_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='商品规格表';

-- ----------------------------
-- Records of former
-- ----------------------------
INSERT INTO `former` VALUES ('15', '上衣', '[{\"spec\":\"湍有那,砂岩\",\"name\":\"员\"},{\"spec\":\"搞,否\",\"name\":\"基\"}]', '2017-04-28 17:38:21', '2017-04-28 17:38:21');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL COMMENT '商品分类',
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `title` varchar(255) DEFAULT NULL COMMENT '前台显示的商品标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '前台显示的商品关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '前台显示的商品描述',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for handle_log
-- ----------------------------
DROP TABLE IF EXISTS `handle_log`;
CREATE TABLE `handle_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作用户',
  `route` varchar(50) NOT NULL COMMENT '路由地址',
  `msg` varchar(255) NOT NULL COMMENT '操作说明',
  `params` text COMMENT '请求参数',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL COMMENT '日志表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of handle_log
-- ----------------------------
INSERT INTO `handle_log` VALUES ('1', '1', 'role/add', '添加用户组[id:12]', '{\"data\":{\"name\":\"\\u5929\\u5929\\u5206\\u949f\",\"remark\":\"\\u5929\\u5929\\u5206\\u949f\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\"}}}', '2017-04-08 13:47:41', '2017-04-08 13:47:41');
INSERT INTO `handle_log` VALUES ('2', '1', 'role/destroy', '删除用户组[id:12]', '{\"id\":\"12\"}', '2017-04-08 13:47:57', '2017-04-08 13:47:57');
INSERT INTO `handle_log` VALUES ('3', '1', 'role/destroy', '删除用户组[id:11]', '{\"id\":\"11\"}', '2017-04-08 13:48:04', '2017-04-08 13:48:04');
INSERT INTO `handle_log` VALUES ('4', '1', 'role/destroy', '删除用户组[id:10]', '{\"id\":\"10\"}', '2017-04-08 13:48:10', '2017-04-08 13:48:10');
INSERT INTO `handle_log` VALUES ('5', '1', 'role/destroy', '删除用户组[id:9]', '{\"id\":\"9\"}', '2017-04-08 13:48:45', '2017-04-08 13:48:45');
INSERT INTO `handle_log` VALUES ('6', '1', 'role/destroy', '删除用户组[id:8]', '{\"id\":\"8\"}', '2017-04-08 13:49:45', '2017-04-08 13:49:45');
INSERT INTO `handle_log` VALUES ('7', '1', 'role/destroy', '删除用户组[id:7]', '{\"id\":\"7\"}', '2017-04-08 13:49:50', '2017-04-08 13:49:50');
INSERT INTO `handle_log` VALUES ('8', '1', 'role/destroy', '删除用户组[id:6]', '{\"id\":\"6\"}', '2017-04-08 13:49:56', '2017-04-08 13:49:56');
INSERT INTO `handle_log` VALUES ('9', '1', 'role/destroy', '删除用户组[id:5]', '{\"id\":\"5\"}', '2017-04-08 13:50:04', '2017-04-08 13:50:04');
INSERT INTO `handle_log` VALUES ('10', '1', 'user/edit', '修改用户[id:2]', '{\"data\":{\"name\":\"\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\",\"email\":\"canglaoshi@admin.com\",\"password\":\"\",\"confirm\":\"\",\"role\":\"2\",\"manager\":\"1\",\"status\":\"1\"},\"id\":\"2\"}', '2017-04-12 16:47:39', '2017-04-12 16:47:39');
INSERT INTO `handle_log` VALUES ('11', '1', 'rule/add', '权限菜单添加[id:18]', '{\"data\":{\"parent_id\":\"8\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"name\":\"index\\/log\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-12 17:40:07', '2017-04-12 17:40:07');
INSERT INTO `handle_log` VALUES ('12', '1', 'role/edit', '用户组修改[id:4]', '{\"data\":{\"name\":\"\\u5929\\u5929\\u5206\\u949f\",\"remark\":\"\\u5929\\u5929\\u5206\\u949f\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"18\":\"1\"}},\"id\":\"4\"}', '2017-04-12 17:40:19', '2017-04-12 17:40:19');
INSERT INTO `handle_log` VALUES ('13', '1', 'role/edit', '用户组修改[id:3]', '{\"data\":{\"name\":\"\\u9ec4\\u91d1\\u65e0\\u654c\\u7ec4\",\"remark\":\"\\u8fd9\\u7fa4\\u4eba\\u6709\\u5f88\\u591a\\u9ec4\\u91d1\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"\",\"15\":\"\",\"16\":\"\",\"14\":\"\",\"17\":\"\",\"5\":\"\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"18\":\"1\"}},\"id\":\"3\"}', '2017-04-12 17:40:28', '2017-04-12 17:40:28');
INSERT INTO `handle_log` VALUES ('14', '1', 'role/edit', '用户组修改[id:2]', '{\"data\":{\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"remark\":\"\\u7ba1\\u7406\\u540e\\u53f0\\u7528\\u6237\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"1\",\"5\":\"\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"18\":\"1\"}},\"id\":\"2\"}', '2017-04-12 17:40:37', '2017-04-12 17:40:37');
INSERT INTO `handle_log` VALUES ('15', '1', 'rule/edit', '修改权限菜单[id:18]', '{\"data\":{\"parent_id\":\"8\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"name\":\"index\\/log\",\"icon\":\"\",\"sort\":\"2\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"18\"}', '2017-04-12 17:40:56', '2017-04-12 17:40:56');
INSERT INTO `handle_log` VALUES ('16', '1', 'rule/edit', '修改权限菜单[id:10]', '{\"data\":{\"parent_id\":\"8\",\"title\":\"\\u9000\\u51fa\",\"name\":\"index\\/logout\",\"icon\":\"\",\"sort\":\"3\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"\"},\"id\":\"10\"}', '2017-04-12 17:41:09', '2017-04-12 17:41:09');
INSERT INTO `handle_log` VALUES ('17', '1', 'rule/edit', '修改权限菜单[id:18]', '{\"data\":{\"parent_id\":\"8\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"name\":\"index\\/log\",\"icon\":\"\",\"sort\":\"2\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"\"},\"id\":\"18\"}', '2017-04-12 17:41:26', '2017-04-12 17:41:26');
INSERT INTO `handle_log` VALUES ('18', '1', 'index/logout', '退出登录', '[]', '2017-04-12 17:57:28', '2017-04-12 17:57:28');
INSERT INTO `handle_log` VALUES ('19', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"cjvd\"}}', '2017-04-12 17:57:50', '2017-04-12 17:57:50');
INSERT INTO `handle_log` VALUES ('20', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"ezyv\"}}', '2017-04-14 14:02:42', '2017-04-14 14:02:42');
INSERT INTO `handle_log` VALUES ('21', '1', 'user/edit', '修改用户[id:2]', '{\"data\":{\"name\":\"\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\",\"email\":\"canglaoshi@admin.com\",\"password\":\"\",\"confirm\":\"\",\"role\":\"2\",\"manager\":\"\",\"status\":\"1\"},\"id\":\"2\"}', '2017-04-14 14:14:06', '2017-04-14 14:14:06');
INSERT INTO `handle_log` VALUES ('22', '1', 'user/edit', '修改用户[id:2]', '{\"data\":{\"name\":\"\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\",\"email\":\"canglaoshi@admin.com\",\"password\":\"000000\",\"confirm\":\"000000\",\"role\":\"2\",\"manager\":\"\",\"status\":\"1\"},\"id\":\"2\"}', '2017-04-14 14:14:25', '2017-04-14 14:14:25');
INSERT INTO `handle_log` VALUES ('23', '1', 'user/edit', '修改用户[id:2]', '{\"data\":{\"name\":\"\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\",\"email\":\"canglaoshi@admin.com\",\"password\":\"\",\"confirm\":\"\",\"role\":\"2\",\"manager\":\"\",\"status\":\"1\"},\"id\":\"2\"}', '2017-04-14 14:14:34', '2017-04-14 14:14:34');
INSERT INTO `handle_log` VALUES ('24', '1', 'user/add', '添加用户[id:4]', '{\"data\":{\"name\":\"\\u9ec4\\u80b2\\u4f73\",\"email\":\"sb112@admin.com\",\"password\":\"123123\",\"confirm\":\"123123\",\"role\":\"3\",\"manager\":\"1\",\"status\":\"1\"}}', '2017-04-14 15:07:47', '2017-04-14 15:07:47');
INSERT INTO `handle_log` VALUES ('25', '1', 'user/edit', '修改用户[id:4]', '{\"data\":{\"name\":\"\\u9ec4\\u80b2\\u4f73\",\"email\":\"sb112@admin.com\",\"password\":\"\",\"confirm\":\"\",\"role\":\"3\",\"manager\":\"\",\"status\":\"1\"},\"id\":\"4\"}', '2017-04-14 15:08:11', '2017-04-14 15:08:11');
INSERT INTO `handle_log` VALUES ('26', '1', 'user/allot', '用户分配权限[id:4]', '{\"data\":{\"rule\":{\"3\":\"1\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"18\":\"1\"}},\"id\":\"4\"}', '2017-04-14 15:10:48', '2017-04-14 15:10:48');
INSERT INTO `handle_log` VALUES ('27', '1', 'role/edit', '用户组修改[id:3]', '{\"data\":{\"name\":\"\\u9ec4\\u91d1\\u65e0\\u654c\\u7ec4\",\"remark\":\"\\u8fd9\\u7fa4\\u4eba\\u6709\\u5f88\\u591a\\u9ec4\\u91d1\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"\",\"16\":\"\",\"14\":\"\",\"17\":\"\",\"5\":\"1\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"2\":\"1\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"3\"}', '2017-04-14 15:21:17', '2017-04-14 15:21:17');
INSERT INTO `handle_log` VALUES ('28', '1', 'user/allot', '用户分配权限[id:3]', '{\"data\":{\"rule\":{\"3\":\"1\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"18\":\"1\"}},\"id\":\"3\"}', '2017-04-14 15:21:50', '2017-04-14 15:21:50');
INSERT INTO `handle_log` VALUES ('29', '1', 'user/allot', '用户分配权限[id:4]', '{\"data\":{\"rule\":{\"3\":\"1\",\"8\":\"1\",\"9\":\"1\",\"10\":\"1\",\"18\":\"1\"}},\"id\":\"4\"}', '2017-04-14 15:22:33', '2017-04-14 15:22:33');
INSERT INTO `handle_log` VALUES ('30', '1', 'role/edit', '用户组修改[id:3]', '{\"data\":{\"name\":\"\\u9ec4\\u91d1\\u65e0\\u654c\\u7ec4\",\"remark\":\"\\u8fd9\\u7fa4\\u4eba\\u6709\\u5f88\\u591a\\u9ec4\\u91d1\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"\",\"16\":\"\",\"14\":\"\",\"17\":\"\",\"5\":\"1\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"2\":\"1\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"3\"}', '2017-04-14 15:22:40', '2017-04-14 15:22:40');
INSERT INTO `handle_log` VALUES ('31', '1', 'role/edit', '用户组修改[id:2]', '{\"data\":{\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"remark\":\"\\u7ba1\\u7406\\u540e\\u53f0\\u7528\\u6237\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"1\",\"5\":\"\",\"11\":\"\",\"12\":\"\",\"13\":\"\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"2\"}', '2017-04-14 15:23:58', '2017-04-14 15:23:58');
INSERT INTO `handle_log` VALUES ('32', '1', 'role/add', '添加用户组[id:13]', '{\"data\":{\"name\":\"\\u5987\\u5973\\u8054\\u76df\",\"remark\":\"\\u5987\\u5973\\u8054\\u76df\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}}}', '2017-04-14 15:36:27', '2017-04-14 15:36:27');
INSERT INTO `handle_log` VALUES ('33', '1', 'role/edit', '用户组修改[id:13]', '{\"data\":{\"name\":\"\\u5987\\u5973\\u8054\\u76df\",\"remark\":\"\\u5987\\u5973\\u8054\\u76df\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"13\"}', '2017-04-14 15:41:48', '2017-04-14 15:41:48');
INSERT INTO `handle_log` VALUES ('34', '1', 'role/edit', '用户组修改[id:2]', '{\"data\":{\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"remark\":\"\\u7ba1\\u7406\\u540e\\u53f0\\u7528\\u6237\",\"rule\":{\"3\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"14\":\"1\",\"17\":\"\",\"5\":\"1\",\"11\":\"1\",\"12\":\"\",\"13\":\"\",\"2\":\"1\",\"6\":\"1\",\"7\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"2\"}', '2017-04-14 15:51:01', '2017-04-14 15:51:01');
INSERT INTO `handle_log` VALUES ('35', '1', 'index/logout', '退出登录', '[]', '2017-04-14 17:41:12', '2017-04-14 17:41:12');
INSERT INTO `handle_log` VALUES ('36', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"ns67\"}}', '2017-04-14 17:46:33', '2017-04-14 17:46:33');
INSERT INTO `handle_log` VALUES ('37', '1', 'index/logout', '退出登录', '[]', '2017-04-14 17:46:39', '2017-04-14 17:46:39');
INSERT INTO `handle_log` VALUES ('38', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"ax7c\"}}', '2017-04-14 17:47:06', '2017-04-14 17:47:06');
INSERT INTO `handle_log` VALUES ('39', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"ece5\"}}', '2017-04-14 17:48:07', '2017-04-14 17:48:07');
INSERT INTO `handle_log` VALUES ('40', '1', 'rule/add', '权限菜单添加[id:19]', '{\"data\":{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"name\":\"system\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-17 17:41:00', '2017-04-17 17:41:00');
INSERT INTO `handle_log` VALUES ('41', '1', 'rule/edit', '修改权限菜单[id:19]', '{\"data\":{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u8bbe\\u7f6e\",\"name\":\"system\",\"icon\":\"\",\"sort\":\"6\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"19\"}', '2017-04-17 17:42:38', '2017-04-17 17:42:38');
INSERT INTO `handle_log` VALUES ('42', '1', 'rule/add', '权限菜单添加[id:20]', '{\"data\":{\"parent_id\":\"19\",\"title\":\"\\u524d\\u53f0\\u5bfc\\u822a\",\"name\":\"system\\/navigation\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-17 17:43:40', '2017-04-17 17:43:40');
INSERT INTO `handle_log` VALUES ('43', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"m6du\"}}', '2017-04-22 10:12:10', '2017-04-22 10:12:10');
INSERT INTO `handle_log` VALUES ('44', '1', 'rule/add', '权限菜单添加[id:21]', '{\"data\":{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"name\":\"goods\",\"icon\":\"fa fa-cubes\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:15:08', '2017-04-22 10:15:08');
INSERT INTO `handle_log` VALUES ('45', '1', 'rule/edit', '修改权限菜单[id:21]', '{\"data\":{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"name\":\"goods\",\"icon\":\"fa fa-cubes\",\"sort\":\"2\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"21\"}', '2017-04-22 10:15:40', '2017-04-22 10:15:40');
INSERT INTO `handle_log` VALUES ('46', '1', 'rule/add', '权限菜单添加[id:22]', '{\"data\":{\"parent_id\":\"21\",\"title\":\"\\u5546\\u54c1\\u5217\\u8868\",\"name\":\"goods\\/index\",\"icon\":\"\",\"sort\":\"1\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:16:41', '2017-04-22 10:16:41');
INSERT INTO `handle_log` VALUES ('47', '1', 'rule/add', '权限菜单添加[id:23]', '{\"data\":{\"parent_id\":\"21\",\"title\":\"\\u5546\\u54c1\\u5206\\u7c7b\",\"name\":\"category\\/index\",\"icon\":\"\",\"sort\":\"2\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:18:01', '2017-04-22 10:18:01');
INSERT INTO `handle_log` VALUES ('48', '1', 'rule/add', '权限菜单添加[id:24]', '{\"data\":{\"parent_id\":\"22\",\"title\":\"\\u6dfb\\u52a0\\u5546\\u54c1\",\"name\":\"goods\\/add\",\"icon\":\"\",\"sort\":\"1\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:18:38', '2017-04-22 10:18:38');
INSERT INTO `handle_log` VALUES ('49', '1', 'rule/add', '权限菜单添加[id:25]', '{\"data\":{\"parent_id\":\"22\",\"title\":\"\\u4fee\\u6539\\u5546\\u54c1\",\"name\":\"goods\\/edit\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:19:02', '2017-04-22 10:19:02');
INSERT INTO `handle_log` VALUES ('50', '1', 'rule/add', '权限菜单添加[id:26]', '{\"data\":{\"parent_id\":\"22\",\"title\":\"\\u5220\\u9664\\u5546\\u54c1\",\"name\":\"goods\\/destroy\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:19:51', '2017-04-22 10:19:51');
INSERT INTO `handle_log` VALUES ('51', '1', 'rule/add', '权限菜单添加[id:27]', '{\"data\":{\"parent_id\":\"23\",\"title\":\"\\u6dfb\\u52a0\\u5206\\u7c7b\",\"name\":\"category\\/add\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:21:23', '2017-04-22 10:21:23');
INSERT INTO `handle_log` VALUES ('52', '1', 'rule/add', '权限菜单添加[id:28]', '{\"data\":{\"parent_id\":\"23\",\"title\":\"\\u4fee\\u6539\\u5206\\u7c7b\",\"name\":\"category\\/edit\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:21:46', '2017-04-22 10:21:46');
INSERT INTO `handle_log` VALUES ('53', '1', 'rule/add', '权限菜单添加[id:29]', '{\"data\":{\"parent_id\":\"23\",\"title\":\"\\u5220\\u9664\\u5206\\u7c7b\",\"name\":\"category\\/destroy\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:22:29', '2017-04-22 10:22:29');
INSERT INTO `handle_log` VALUES ('54', '1', 'rule/add', '权限菜单添加[id:30]', '{\"data\":{\"parent_id\":\"21\",\"title\":\"\\u5546\\u54c1\\u6a21\\u578b\",\"name\":\"former\\/index\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:24:13', '2017-04-22 10:24:13');
INSERT INTO `handle_log` VALUES ('55', '1', 'rule/add', '权限菜单添加[id:31]', '{\"data\":{\"parent_id\":\"30\",\"title\":\"\\u6dfb\\u52a0\\u6a21\\u578b\",\"name\":\"former\\/add\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:24:57', '2017-04-22 10:24:57');
INSERT INTO `handle_log` VALUES ('56', '1', 'rule/add', '权限菜单添加[id:32]', '{\"data\":{\"parent_id\":\"30\",\"title\":\"\\u4fee\\u6539\\u6a21\\u578b\",\"name\":\"former\\/edit\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 10:25:16', '2017-04-22 10:25:16');
INSERT INTO `handle_log` VALUES ('57', '1', 'former/add', '添加商品模型[id:1]', '{\"data\":{\"name\":\"\\u989c\\u8272\",\"spec\":\"\\u7ea2\\u8272,\\u767d\\u8272,\\u84dd\\u8272,\\u5361\\u5176\\u8272,\\u5929\\u84dd\\u8272\"}}', '2017-04-22 11:09:59', '2017-04-22 11:09:59');
INSERT INTO `handle_log` VALUES ('58', '1', 'former/edit', '修改商品模型[id:1]', '{\"data\":{\"name\":\"\\u989c\\u8272\",\"spec\":\"\\u7ea2\\u8272,\\u767d\\u8272,\\u84dd\\u8272,\\u5361\\u5176\\u8272,\\u5929\\u84dd\\u8272,\\u7eff\\u8272\"},\"id\":\"1\"}', '2017-04-22 11:21:47', '2017-04-22 11:21:47');
INSERT INTO `handle_log` VALUES ('59', '1', 'rule/add', '权限菜单添加[id:33]', '{\"data\":{\"parent_id\":\"30\",\"title\":\"\\u6a21\\u578b\\u5220\\u9664\",\"name\":\"former\\/destroy\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 11:29:00', '2017-04-22 11:29:00');
INSERT INTO `handle_log` VALUES ('60', '1', 'former/destroy', '删除商品模型[id:1]', '{\"id\":\"1\"}', '2017-04-22 11:31:38', '2017-04-22 11:31:38');
INSERT INTO `handle_log` VALUES ('61', '1', 'former/add', '添加商品模型[id:3]', '{\"data\":{\"name\":\"\\u989c\\u8272\",\"spec\":\"\\u7ea2\\u8272,\\u84dd\\u8272,\\u767d\\u8272\"}}', '2017-04-22 11:32:04', '2017-04-22 11:32:04');
INSERT INTO `handle_log` VALUES ('62', '1', 'former/add', '添加商品模型[id:4]', '{\"data\":{\"name\":\"\\u5c3a\\u5bf8\",\"spec\":\"\\u5927\\u7801,\\u4e2d\\u7801,\\u5c0f\\u7801\"}}', '2017-04-22 11:32:43', '2017-04-22 11:32:43');
INSERT INTO `handle_log` VALUES ('63', '1', 'category/add', '添加商品分类[id:1]', '{\"data\":{\"name\":\"\\u8863\\u670d\",\"parent_id\":\"0\",\"en_name\":\"clothes\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:44:18', '2017-04-22 13:44:18');
INSERT INTO `handle_log` VALUES ('64', '1', 'category/add', '添加商品分类[id:2]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\",\"parent_id\":\"1\",\"en_name\":\"jacket\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:47:00', '2017-04-22 13:47:00');
INSERT INTO `handle_log` VALUES ('65', '1', 'category/add', '添加商品分类[id:3]', '{\"data\":{\"name\":\"\\u886c\\u886b\",\"parent_id\":\"2\",\"en_name\":\"shirt\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:48:29', '2017-04-22 13:48:29');
INSERT INTO `handle_log` VALUES ('66', '1', 'category/add', '添加商品分类[id:4]', '{\"data\":{\"name\":\"T\\u6064\",\"parent_id\":\"2\",\"en_name\":\"tshirt\",\"sort\":\"2\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:51:33', '2017-04-22 13:51:33');
INSERT INTO `handle_log` VALUES ('67', '1', 'category/add', '添加商品分类[id:5]', '{\"data\":{\"name\":\"\\u5916\\u5957\",\"parent_id\":\"2\",\"en_name\":\"waitao\",\"sort\":\"3\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:53:39', '2017-04-22 13:53:39');
INSERT INTO `handle_log` VALUES ('68', '1', 'category/add', '添加商品分类[id:6]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\",\"parent_id\":\"0\",\"en_name\":\"jacket\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:56:53', '2017-04-22 13:56:53');
INSERT INTO `handle_log` VALUES ('69', '1', 'category/add', '添加商品分类[id:7]', '{\"data\":{\"name\":\"\\u5916\\u5957\",\"parent_id\":\"6\",\"en_name\":\"coat\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:58:00', '2017-04-22 13:58:00');
INSERT INTO `handle_log` VALUES ('70', '1', 'category/add', '添加商品分类[id:8]', '{\"data\":{\"name\":\"\\u4e2d\\u5c71\\u88c5\",\"parent_id\":\"7\",\"en_name\":\"Chinesetunicsuit\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 13:58:52', '2017-04-22 13:58:52');
INSERT INTO `handle_log` VALUES ('71', '1', 'category/edit', '修改商品分类[id:8]', '{\"data\":{\"name\":\"\\u4e2d\\u5c71\\u88c5\",\"en_name\":\"zhongshan\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"},\"id\":\"8\"}', '2017-04-22 14:34:49', '2017-04-22 14:34:49');
INSERT INTO `handle_log` VALUES ('72', '1', 'category/edit', '修改商品分类[id:8]', '{\"data\":{\"name\":\"\\u4e2d\\u5c71\\u88c5\",\"en_name\":\"Chinesetunicsuit\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"},\"id\":\"8\"}', '2017-04-22 14:34:57', '2017-04-22 14:34:57');
INSERT INTO `handle_log` VALUES ('73', '1', 'category/destroy', '删除商品分类[id:8]', '{\"id\":\"8\"}', '2017-04-22 14:51:09', '2017-04-22 14:51:09');
INSERT INTO `handle_log` VALUES ('74', '1', 'category/edit', '修改商品分类[id:6]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\",\"en_name\":\"jacket\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"},\"id\":\"6\"}', '2017-04-22 15:24:24', '2017-04-22 15:24:24');
INSERT INTO `handle_log` VALUES ('75', '1', 'category/edit', '修改商品分类[id:7]', '{\"data\":{\"name\":\"\\u5916\\u5957\",\"en_name\":\"coat\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"},\"id\":\"7\"}', '2017-04-22 15:25:52', '2017-04-22 15:25:52');
INSERT INTO `handle_log` VALUES ('76', '1', 'user/edit', '修改用户[id:2]', '{\"data\":{\"name\":\"\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\",\"email\":\"canglaoshi@admin.com\",\"password\":\"\",\"confirm\":\"\",\"role\":\"2\",\"manager\":\"\",\"status\":\"1\"},\"id\":\"2\"}', '2017-04-22 15:52:26', '2017-04-22 15:52:26');
INSERT INTO `handle_log` VALUES ('77', '1', 'user/edit', '修改用户[id:2]', '{\"data\":{\"name\":\"\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\\u4ed3\\u4e95\\u7a7a\",\"email\":\"canglaoshi@admin.com\",\"password\":\"\",\"confirm\":\"\",\"role\":\"2\",\"manager\":\"\",\"status\":\"1\"},\"id\":\"2\"}', '2017-04-22 15:54:58', '2017-04-22 15:54:58');
INSERT INTO `handle_log` VALUES ('78', '1', 'rule/edit', '修改权限菜单[id:24]', '{\"data\":{\"parent_id\":\"22\",\"title\":\"\\u6dfb\\u52a0\\u5546\\u54c1\",\"name\":\"goods\\/add\",\"icon\":\"\",\"sort\":\"1\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"24\"}', '2017-04-22 15:55:29', '2017-04-22 15:55:29');
INSERT INTO `handle_log` VALUES ('79', '1', 'role/edit', '用户组修改[id:4]', '{\"data\":{\"name\":\"\\u5929\\u5929\\u5206\\u949f\",\"remark\":\"\\u5929\\u5929\\u5206\\u949f\",\"rule\":{\"3\":\"1\",\"21\":\"\",\"22\":\"\",\"24\":\"\",\"25\":\"\",\"26\":\"\",\"23\":\"\",\"27\":\"\",\"28\":\"\",\"29\":\"\",\"30\":\"\",\"31\":\"\",\"32\":\"\",\"33\":\"\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"17\":\"1\",\"14\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"19\":\"\",\"20\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"4\"}', '2017-04-22 15:56:02', '2017-04-22 15:56:02');
INSERT INTO `handle_log` VALUES ('80', '1', 'role/edit', '用户组修改[id:13]', '{\"data\":{\"name\":\"\\u5987\\u5973\\u8054\\u76df\",\"remark\":\"\\u5987\\u5973\\u8054\\u76df\",\"rule\":{\"3\":\"1\",\"21\":\"1\",\"22\":\"1\",\"24\":\"1\",\"25\":\"1\",\"26\":\"1\",\"23\":\"1\",\"27\":\"1\",\"28\":\"1\",\"29\":\"1\",\"30\":\"1\",\"31\":\"1\",\"32\":\"1\",\"33\":\"1\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"17\":\"1\",\"14\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"19\":\"\",\"20\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}},\"id\":\"13\"}', '2017-04-22 15:56:16', '2017-04-22 15:56:16');
INSERT INTO `handle_log` VALUES ('81', '1', 'role/add', '添加用户组[id:14]', '{\"data\":{\"name\":\"\\u4e2d\\u5fc3\\u7ec4\",\"remark\":\"\\u4e2d\\u5fc3\\u7ec4\",\"rule\":{\"3\":\"1\",\"21\":\"\",\"22\":\"\",\"24\":\"\",\"25\":\"\",\"26\":\"\",\"23\":\"\",\"27\":\"\",\"28\":\"\",\"29\":\"\",\"30\":\"\",\"31\":\"\",\"32\":\"\",\"33\":\"\",\"1\":\"1\",\"4\":\"1\",\"15\":\"1\",\"16\":\"1\",\"17\":\"1\",\"14\":\"1\",\"5\":\"\",\"11\":\"1\",\"12\":\"1\",\"13\":\"1\",\"2\":\"\",\"6\":\"\",\"7\":\"\",\"19\":\"\",\"20\":\"\",\"8\":\"1\",\"9\":\"1\",\"18\":\"1\",\"10\":\"1\"}}}', '2017-04-22 15:56:42', '2017-04-22 15:56:42');
INSERT INTO `handle_log` VALUES ('82', '1', 'rule/add', '权限菜单添加[id:34]', '{\"data\":{\"parent_id\":\"20\",\"title\":\"\\u6dfb\\u52a0\\u5bfc\\u822a\",\"name\":\"system\\/add\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-22 15:57:35', '2017-04-22 15:57:35');
INSERT INTO `handle_log` VALUES ('83', '1', 'former/add', '添加商品模型[id:5]', '{\"data\":{\"name\":\"\\u957f\\u5ea6\",\"spec\":\"3M,5M,6M\"}}', '2017-04-22 15:58:33', '2017-04-22 15:58:33');
INSERT INTO `handle_log` VALUES ('84', '1', 'former/edit', '修改商品模型[id:5]', '{\"data\":{\"name\":\"\\u957f\\u5ea6\",\"spec\":\"3M,5M,6M\"},\"id\":\"5\"}', '2017-04-22 15:59:17', '2017-04-22 15:59:17');
INSERT INTO `handle_log` VALUES ('85', '1', 'category/add', '添加商品分类[id:9]', '{\"data\":{\"parent_id\":\"7\",\"name\":\"\\u725b\\u4ed4\\u5916\\u5957\",\"en_name\":\"niuzai\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"}}', '2017-04-22 16:02:21', '2017-04-22 16:02:21');
INSERT INTO `handle_log` VALUES ('86', '1', 'category/edit', '修改商品分类[id:9]', '{\"data\":{\"name\":\"\\u725b\\u4ed4\\u5916\\u5957\",\"en_name\":\"niuza\",\"sort\":\"1\",\"title\":\"\",\"keywords\":\"\",\"description\":\"\"},\"id\":\"9\"}', '2017-04-22 16:02:30', '2017-04-22 16:02:30');
INSERT INTO `handle_log` VALUES ('87', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"wsnc\"}}', '2017-04-24 15:31:55', '2017-04-24 15:31:55');
INSERT INTO `handle_log` VALUES ('88', '1', 'category/edit', '修改商品分类[id:9]', '{\"data\":{\"name\":\"\\u725b\\u4ed4\\u5916\\u5957\",\"en_name\":\"niuza\",\"sort\":\"1\",\"title\":\"111\",\"keywords\":\"\",\"description\":\"\"},\"id\":\"9\"}', '2017-04-24 17:30:59', '2017-04-24 17:30:59');
INSERT INTO `handle_log` VALUES ('89', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"euhv\"}}', '2017-04-27 12:09:15', '2017-04-27 12:09:15');
INSERT INTO `handle_log` VALUES ('90', '1', 'rule/add', '权限菜单添加[id:35]', '{\"data\":{\"parent_id\":\"3\",\"title\":\"\\u6587\\u4ef6\\u4e0a\\u4f20\",\"name\":\"index\\/upload\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"}}', '2017-04-27 16:02:59', '2017-04-27 16:02:59');
INSERT INTO `handle_log` VALUES ('91', '1', 'index/upload', '上传图片成功', '[]', '2017-04-27 16:06:28', '2017-04-27 16:06:28');
INSERT INTO `handle_log` VALUES ('92', '1', 'index/upload', '上传图片成功', '[]', '2017-04-27 16:06:52', '2017-04-27 16:06:52');
INSERT INTO `handle_log` VALUES ('93', '1', 'index/upload', '上传图片成功', '[]', '2017-04-27 16:08:11', '2017-04-27 16:08:11');
INSERT INTO `handle_log` VALUES ('94', '1', 'index/upload', '0', '[]', '2017-04-27 16:12:17', '2017-04-27 16:12:17');
INSERT INTO `handle_log` VALUES ('95', '1', 'index/upload', '0', '[]', '2017-04-27 17:39:56', '2017-04-27 17:39:56');
INSERT INTO `handle_log` VALUES ('96', '1', 'index/upload', '0', '[]', '2017-04-27 18:04:21', '2017-04-27 18:04:21');
INSERT INTO `handle_log` VALUES ('97', '1', 'index/upload', '0', '[]', '2017-04-27 18:06:54', '2017-04-27 18:06:54');
INSERT INTO `handle_log` VALUES ('98', '1', 'index/login', '用户登录', '{\"data\":{\"email\":\"admin@admin.com\",\"password\":\"1234567\",\"captcha\":\"ppj4\"}}', '2017-04-28 09:18:16', '2017-04-28 09:18:16');
INSERT INTO `handle_log` VALUES ('99', '1', 'index/upload', '0', '[]', '2017-04-28 09:18:30', '2017-04-28 09:18:30');
INSERT INTO `handle_log` VALUES ('100', '1', 'index/upload', '0', '[]', '2017-04-28 09:20:33', '2017-04-28 09:20:33');
INSERT INTO `handle_log` VALUES ('101', '1', 'index/upload', '0', '[]', '2017-04-28 09:22:12', '2017-04-28 09:22:12');
INSERT INTO `handle_log` VALUES ('102', '1', 'index/upload', '0', '[]', '2017-04-28 09:24:13', '2017-04-28 09:24:13');
INSERT INTO `handle_log` VALUES ('103', '1', 'index/upload', '0', '[]', '2017-04-28 09:30:20', '2017-04-28 09:30:20');
INSERT INTO `handle_log` VALUES ('104', '1', 'index/upload', '0', '[]', '2017-04-28 09:36:50', '2017-04-28 09:36:50');
INSERT INTO `handle_log` VALUES ('105', '1', 'index/upload', '0', '[]', '2017-04-28 09:51:09', '2017-04-28 09:51:09');
INSERT INTO `handle_log` VALUES ('106', '1', 'index/upload', '0', '[]', '2017-04-28 09:51:47', '2017-04-28 09:51:47');
INSERT INTO `handle_log` VALUES ('107', '1', 'index/upload', '0', '[]', '2017-04-28 09:52:18', '2017-04-28 09:52:18');
INSERT INTO `handle_log` VALUES ('108', '1', 'rule/edit', '修改权限菜单[id:30]', '{\"data\":{\"parent_id\":\"21\",\"title\":\"\\u5546\\u54c1\\u89c4\\u683c\",\"name\":\"spec\\/index\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"30\"}', '2017-04-28 16:22:32', '2017-04-28 16:22:32');
INSERT INTO `handle_log` VALUES ('109', '1', 'rule/edit', '修改权限菜单[id:31]', '{\"data\":{\"parent_id\":\"30\",\"title\":\"\\u6dfb\\u52a0\\u89c4\\u683c\",\"name\":\"spec\\/add\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"31\"}', '2017-04-28 16:22:48', '2017-04-28 16:22:48');
INSERT INTO `handle_log` VALUES ('110', '1', 'rule/edit', '修改权限菜单[id:32]', '{\"data\":{\"parent_id\":\"30\",\"title\":\"\\u4fee\\u6539\\u89c4\\u683c\",\"name\":\"spec\\/edit\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"32\"}', '2017-04-28 16:23:02', '2017-04-28 16:23:02');
INSERT INTO `handle_log` VALUES ('111', '1', 'rule/edit', '修改权限菜单[id:33]', '{\"data\":{\"parent_id\":\"30\",\"title\":\"\\u89c4\\u683c\\u5220\\u9664\",\"name\":\"spec\\/destroy\",\"icon\":\"\",\"sort\":\"255\",\"islink\":\"1\",\"isadmin\":\"\",\"isverify\":\"1\"},\"id\":\"33\"}', '2017-04-28 16:23:16', '2017-04-28 16:23:16');
INSERT INTO `handle_log` VALUES ('112', '1', 'spec/add', '添加商品模型[id:6]', '{\"data\":{\"name\":\"\\u5e74\\u4efd\",\"spec\":\"\\u4e09\\u5e74,\\u5341\\u5e74,\\u4e8c\\u5341\\u5e74\"}}', '2017-04-28 16:25:56', '2017-04-28 16:25:56');
INSERT INTO `handle_log` VALUES ('113', '1', 'spec/edit', '修改商品模型[id:5]', '{\"data\":{\"name\":\"\\u957f\\u5ea6\",\"spec\":\"3M,5M,6M,10M\"},\"id\":\"5\"}', '2017-04-28 16:26:09', '2017-04-28 16:26:09');
INSERT INTO `handle_log` VALUES ('114', '1', 'former/add', '添加商品模型[id:7]', '{\"data\":{\"name\":\"\\u6e4d\\u5728\\u5de5\",\"spec\":\"ddd,aaa\"}}', '2017-04-28 16:36:11', '2017-04-28 16:36:11');
INSERT INTO `handle_log` VALUES ('115', '1', 'former/edit', '修改商品模型[id:7]', '{\"data\":{\"name\":\"\\u6e4d\\u5728\\u5de5\",\"spec\":\"ddd,aaa,asd\"},\"id\":\"7\"}', '2017-04-28 16:37:11', '2017-04-28 16:37:11');
INSERT INTO `handle_log` VALUES ('116', '1', 'former/add', '添加商品模型[id:8]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\\u6a21\\u578b\",\"spec\":{\"name\":[\"\\u989c\\u8272\",\"\\u5c3a\\u5bf8\"],\"spec\":[\"\\u767d\\u8272,\\u7ea2\\u8272,\\u7070\\u8272\",\"M\\u7801\"]}}}', '2017-04-28 17:08:32', '2017-04-28 17:08:32');
INSERT INTO `handle_log` VALUES ('117', '1', 'former/destroy', '删除商品模型[id:8]', '{\"id\":\"8\"}', '2017-04-28 17:09:22', '2017-04-28 17:09:22');
INSERT INTO `handle_log` VALUES ('118', '1', 'former/add', '添加商品模型[id:9]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\\u6a21\\u578b\",\"spec\":{\"name\":[\"\\u989c\\u8272\",\"\\u5c3a\\u7801\"],\"spec\":[\"\\u7ea2\\u8272,\\u767d\\u8272,\\u9ed1\\u8272\",\"S\\u7801,M\\u7801\"]}}}', '2017-04-28 17:10:05', '2017-04-28 17:10:05');
INSERT INTO `handle_log` VALUES ('119', '1', 'former/add', '添加商品模型[id:10]', '{\"data\":{\"name\":\"\\u4e0b\\u6a21\\u578b\",\"spec\":{\"name\":[\"\\u6210\\u54c1\",\"\\u6ed1\"],\"spec\":[\"\\u6ca1\\u5728,\\u5728,\\u4e2d\\u8f66\",\"\\u6e4d,\\u5728\"]}}}', '2017-04-28 17:11:49', '2017-04-28 17:11:49');
INSERT INTO `handle_log` VALUES ('120', '1', 'former/add', '添加商品模型[id:11]', '{\"data\":{\"name\":\"\\u5954\\u5728\",\"spec\":{\"name\":[\"\\u9f99\\u9a91\",\"\\u9f99\\u9a912\"],\"spec\":[\"\\u593a,\\u5954,\\u5954\",\"\\u593a,\\u5954\"]}}}', '2017-04-28 17:13:17', '2017-04-28 17:13:17');
INSERT INTO `handle_log` VALUES ('121', '1', 'former/add', '添加商品模型[id:13]', '{\"data\":{\"name\":\"\\u5954\\u5728\\u5728\",\"spec\":{\"name\":[\"\\u9f99\\u9a91\",\"\\u9f99\\u9a912\"],\"spec\":[\"\\u593a,\\u5954,\\u5954\",\"\\u593a,\\u5954\"]}}}', '2017-04-28 17:28:55', '2017-04-28 17:28:55');
INSERT INTO `handle_log` VALUES ('122', '1', 'former/add', '添加商品模型[id:14]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\\u6a21\\u578b\",\"spec\":{\"name\":[\"\\u989c\\u8272\",\"\\u5c3a\\u7801\"],\"spec\":[\"\\u7ea2\\u8272,\\u767d\\u8272,\\u84dd\\u8272\",\"M\\u7801,L\\u7801\"]}}}', '2017-04-28 17:31:40', '2017-04-28 17:31:40');
INSERT INTO `handle_log` VALUES ('123', '1', 'former/add', '添加商品模型[id:15]', '{\"data\":{\"name\":\"\\u4e0a\\u8863\",\"spec\":{\"name\":[\"\\u5458\",\"\\u57fa\"],\"spec\":[\"\\u6e4d\\u6709\\u90a3,\\u7802\\u5ca9\",\"\\u641e,\\u5426\"]}}}', '2017-04-28 17:38:21', '2017-04-28 17:38:21');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '部门名称',
  `remark` varchar(255) DEFAULT '' COMMENT '简单说明',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('2', '用户管理', '管理后台用户', '2017-04-05 14:04:38', '2017-04-14 15:51:01');
INSERT INTO `role` VALUES ('3', '黄金无敌组', '这群人有很多黄金', '2017-04-05 16:39:50', '2017-04-14 15:22:40');
INSERT INTO `role` VALUES ('4', '天天分钟', '天天分钟', '2017-04-08 12:28:23', '2017-04-22 15:56:02');
INSERT INTO `role` VALUES ('13', '妇女联盟', '妇女联盟', '2017-04-14 15:36:27', '2017-04-22 15:56:15');
INSERT INTO `role` VALUES ('14', '中心组', '中心组', '2017-04-22 15:56:42', '2017-04-22 15:56:42');

-- ----------------------------
-- Table structure for role_rule
-- ----------------------------
DROP TABLE IF EXISTS `role_rule`;
CREATE TABLE `role_rule` (
  `role_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门权限菜单表';

-- ----------------------------
-- Records of role_rule
-- ----------------------------
INSERT INTO `role_rule` VALUES ('2', '1');
INSERT INTO `role_rule` VALUES ('2', '2');
INSERT INTO `role_rule` VALUES ('2', '3');
INSERT INTO `role_rule` VALUES ('2', '4');
INSERT INTO `role_rule` VALUES ('2', '5');
INSERT INTO `role_rule` VALUES ('2', '6');
INSERT INTO `role_rule` VALUES ('2', '8');
INSERT INTO `role_rule` VALUES ('2', '9');
INSERT INTO `role_rule` VALUES ('2', '10');
INSERT INTO `role_rule` VALUES ('2', '11');
INSERT INTO `role_rule` VALUES ('2', '14');
INSERT INTO `role_rule` VALUES ('2', '15');
INSERT INTO `role_rule` VALUES ('2', '16');
INSERT INTO `role_rule` VALUES ('2', '18');
INSERT INTO `role_rule` VALUES ('3', '1');
INSERT INTO `role_rule` VALUES ('3', '2');
INSERT INTO `role_rule` VALUES ('3', '3');
INSERT INTO `role_rule` VALUES ('3', '4');
INSERT INTO `role_rule` VALUES ('3', '5');
INSERT INTO `role_rule` VALUES ('3', '8');
INSERT INTO `role_rule` VALUES ('3', '9');
INSERT INTO `role_rule` VALUES ('3', '10');
INSERT INTO `role_rule` VALUES ('3', '18');
INSERT INTO `role_rule` VALUES ('4', '1');
INSERT INTO `role_rule` VALUES ('4', '3');
INSERT INTO `role_rule` VALUES ('4', '4');
INSERT INTO `role_rule` VALUES ('4', '8');
INSERT INTO `role_rule` VALUES ('4', '9');
INSERT INTO `role_rule` VALUES ('4', '10');
INSERT INTO `role_rule` VALUES ('4', '11');
INSERT INTO `role_rule` VALUES ('4', '12');
INSERT INTO `role_rule` VALUES ('4', '13');
INSERT INTO `role_rule` VALUES ('4', '14');
INSERT INTO `role_rule` VALUES ('4', '15');
INSERT INTO `role_rule` VALUES ('4', '16');
INSERT INTO `role_rule` VALUES ('4', '17');
INSERT INTO `role_rule` VALUES ('4', '18');
INSERT INTO `role_rule` VALUES ('13', '1');
INSERT INTO `role_rule` VALUES ('13', '3');
INSERT INTO `role_rule` VALUES ('13', '4');
INSERT INTO `role_rule` VALUES ('13', '8');
INSERT INTO `role_rule` VALUES ('13', '9');
INSERT INTO `role_rule` VALUES ('13', '10');
INSERT INTO `role_rule` VALUES ('13', '11');
INSERT INTO `role_rule` VALUES ('13', '12');
INSERT INTO `role_rule` VALUES ('13', '13');
INSERT INTO `role_rule` VALUES ('13', '14');
INSERT INTO `role_rule` VALUES ('13', '15');
INSERT INTO `role_rule` VALUES ('13', '16');
INSERT INTO `role_rule` VALUES ('13', '17');
INSERT INTO `role_rule` VALUES ('13', '18');
INSERT INTO `role_rule` VALUES ('13', '21');
INSERT INTO `role_rule` VALUES ('13', '22');
INSERT INTO `role_rule` VALUES ('13', '23');
INSERT INTO `role_rule` VALUES ('13', '24');
INSERT INTO `role_rule` VALUES ('13', '25');
INSERT INTO `role_rule` VALUES ('13', '26');
INSERT INTO `role_rule` VALUES ('13', '27');
INSERT INTO `role_rule` VALUES ('13', '28');
INSERT INTO `role_rule` VALUES ('13', '29');
INSERT INTO `role_rule` VALUES ('13', '30');
INSERT INTO `role_rule` VALUES ('13', '31');
INSERT INTO `role_rule` VALUES ('13', '32');
INSERT INTO `role_rule` VALUES ('13', '33');
INSERT INTO `role_rule` VALUES ('14', '1');
INSERT INTO `role_rule` VALUES ('14', '3');
INSERT INTO `role_rule` VALUES ('14', '4');
INSERT INTO `role_rule` VALUES ('14', '8');
INSERT INTO `role_rule` VALUES ('14', '9');
INSERT INTO `role_rule` VALUES ('14', '10');
INSERT INTO `role_rule` VALUES ('14', '11');
INSERT INTO `role_rule` VALUES ('14', '12');
INSERT INTO `role_rule` VALUES ('14', '13');
INSERT INTO `role_rule` VALUES ('14', '14');
INSERT INTO `role_rule` VALUES ('14', '15');
INSERT INTO `role_rule` VALUES ('14', '16');
INSERT INTO `role_rule` VALUES ('14', '17');
INSERT INTO `role_rule` VALUES ('14', '18');

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `name` varchar(100) NOT NULL COMMENT 'url地址 c+a',
  `title` varchar(100) NOT NULL COMMENT '菜单名称',
  `islink` tinyint(5) NOT NULL DEFAULT '0' COMMENT '是否菜单',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员才有的权限 0 不是 1 是',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `sort` int(3) NOT NULL DEFAULT '255' COMMENT '排序',
  `isverify` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要验证: 0 不需要 1需要',
  `level` tinyint(2) DEFAULT NULL COMMENT '级别',
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rulename` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='权限&菜单表';

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('1', '0', 'user', '用户管理', '1', '1', null, '6', '0', '1', '2017-03-31 16:04:04', '2017-03-31 16:04:06');
INSERT INTO `rule` VALUES ('2', '1', 'rule/index', '菜单权限', '1', '1', '', '3', '1', '2', '2017-04-01 15:35:35', '2017-04-01 15:35:35');
INSERT INTO `rule` VALUES ('3', '0', 'index/main', '首页面板', '1', '0', '', '1', '0', '1', '2017-04-01 15:48:18', '2017-04-01 17:41:22');
INSERT INTO `rule` VALUES ('4', '1', 'user/index', '用户列表', '1', '1', '', '1', '0', '2', '2017-04-01 15:59:42', '2017-04-01 15:59:42');
INSERT INTO `rule` VALUES ('5', '1', 'role/index', '用户分组', '1', '1', '', '2', '1', '2', '2017-04-01 16:03:43', '2017-04-01 16:03:43');
INSERT INTO `rule` VALUES ('6', '2', 'rule/add', '菜单添加', '0', '1', '', '1', '1', '3', '2017-04-01 16:31:52', '2017-04-01 17:04:11');
INSERT INTO `rule` VALUES ('7', '2', 'rule/edit', '修改菜单', '0', '1', '', '2', '1', '3', '2017-04-01 16:42:20', '2017-04-01 17:06:00');
INSERT INTO `rule` VALUES ('8', '0', 'personal', '个人中心', '1', '0', '', '7', '0', '1', '2017-04-01 17:07:00', '2017-04-01 17:41:39');
INSERT INTO `rule` VALUES ('9', '8', 'index/personal', '个人中心', '1', '0', '', '1', '0', '2', '2017-04-01 17:35:30', '2017-04-08 10:05:03');
INSERT INTO `rule` VALUES ('10', '8', 'index/logout', '退出', '1', '0', '', '3', '0', '2', '2017-04-01 17:36:31', '2017-04-12 17:41:09');
INSERT INTO `rule` VALUES ('11', '5', 'role/add', '添加分组', '0', '1', '', '1', '0', '3', '2017-04-06 09:59:33', '2017-04-06 10:54:05');
INSERT INTO `rule` VALUES ('12', '5', 'role/edit', '修改分组', '0', '1', '', '2', '0', '3', '2017-04-06 10:53:43', '2017-04-06 10:53:56');
INSERT INTO `rule` VALUES ('13', '5', 'role/destroy', '删除分组', '0', '1', '', '3', '0', '3', '2017-04-06 10:54:41', '2017-04-06 10:54:41');
INSERT INTO `rule` VALUES ('14', '4', 'user/allot', '分配用户权限', '0', '1', '', '5', '0', '3', '2017-04-08 09:49:49', '2017-04-08 09:49:49');
INSERT INTO `rule` VALUES ('15', '4', 'user/add', '添加用户', '0', '1', '', '2', '0', '3', '2017-04-08 09:51:40', '2017-04-08 09:51:40');
INSERT INTO `rule` VALUES ('16', '4', 'user/edit', '修改用户', '0', '1', '', '3', '0', '3', '2017-04-08 09:52:04', '2017-04-08 09:52:31');
INSERT INTO `rule` VALUES ('17', '4', 'user/status', '禁用用户', '0', '1', '', '5', '0', '3', '2017-04-08 09:55:44', '2017-04-08 09:55:44');
INSERT INTO `rule` VALUES ('18', '8', 'index/log', '操作日志', '1', '0', '', '2', '0', '2', '2017-04-12 17:40:07', '2017-04-12 17:41:26');
INSERT INTO `rule` VALUES ('19', '0', 'system', '系统设置', '1', '0', '', '6', '1', '1', '2017-04-17 17:41:00', '2017-04-17 17:42:37');
INSERT INTO `rule` VALUES ('20', '19', 'system/navigation', '前台导航', '1', '0', '', '255', '1', '2', '2017-04-17 17:43:40', '2017-04-17 17:43:40');
INSERT INTO `rule` VALUES ('21', '0', 'goods', '商品管理', '1', '0', 'fa fa-cubes', '2', '1', '1', '2017-04-22 10:15:08', '2017-04-22 10:15:40');
INSERT INTO `rule` VALUES ('22', '21', 'goods/index', '商品列表', '1', '0', '', '1', '1', '2', '2017-04-22 10:16:41', '2017-04-22 10:16:41');
INSERT INTO `rule` VALUES ('23', '21', 'category/index', '商品分类', '1', '0', '', '2', '1', '2', '2017-04-22 10:18:00', '2017-04-22 10:18:00');
INSERT INTO `rule` VALUES ('24', '22', 'goods/add', '添加商品', '0', '0', '', '1', '1', '3', '2017-04-22 10:18:37', '2017-04-22 15:55:29');
INSERT INTO `rule` VALUES ('25', '22', 'goods/edit', '修改商品', '0', '0', '', '255', '1', '3', '2017-04-22 10:19:02', '2017-04-22 10:19:02');
INSERT INTO `rule` VALUES ('26', '22', 'goods/destroy', '删除商品', '0', '0', '', '255', '1', '3', '2017-04-22 10:19:50', '2017-04-22 10:19:50');
INSERT INTO `rule` VALUES ('27', '23', 'category/add', '添加分类', '0', '0', '', '255', '1', '3', '2017-04-22 10:21:23', '2017-04-22 10:21:23');
INSERT INTO `rule` VALUES ('28', '23', 'category/edit', '修改分类', '0', '0', '', '255', '1', '3', '2017-04-22 10:21:46', '2017-04-22 10:21:46');
INSERT INTO `rule` VALUES ('29', '23', 'category/destroy', '删除分类', '0', '0', '', '255', '1', '3', '2017-04-22 10:22:29', '2017-04-22 10:22:29');
INSERT INTO `rule` VALUES ('30', '21', 'former/index', '商品模型', '1', '0', '', '255', '1', '2', '2017-04-22 10:24:13', '2017-04-28 16:22:32');
INSERT INTO `rule` VALUES ('31', '30', 'former/add', '添加模型', '0', '0', '', '255', '1', '3', '2017-04-22 10:24:57', '2017-04-28 16:22:48');
INSERT INTO `rule` VALUES ('32', '30', 'former/edit', '修改模型', '0', '0', '', '255', '1', '3', '2017-04-22 10:25:16', '2017-04-28 16:23:02');
INSERT INTO `rule` VALUES ('33', '30', 'former/destroy', '模型删除', '1', '0', '', '255', '1', '3', '2017-04-22 11:29:00', '2017-04-28 16:23:16');
INSERT INTO `rule` VALUES ('34', '20', 'system/add', '添加导航', '0', '0', '', '255', '1', '3', '2017-04-22 15:57:34', '2017-04-22 15:57:34');
INSERT INTO `rule` VALUES ('35', '3', 'index/upload', '文件上传', '0', '0', '', '255', '1', '2', '2017-04-27 16:02:59', '2017-04-27 16:02:59');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '登录邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `role` int(10) NOT NULL DEFAULT '0' COMMENT '角色 ：0为超级管理员，只能有一个超级管理员，并且超级管理员不可禁用',
  `manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否部门管理者 0 否 1是',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态 1 开启 0 关闭',
  `last_ip` varchar(255) DEFAULT NULL,
  `last_time` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin@admin.com', 'fcea920f7412b5da7be0cf42b8c93759', '0', '0', '超管', '18526232020', '1', '127.0.0.1', '2017-04-28 09:18:16', '2017-03-22 10:35:17', '2017-04-28 09:18:16');
INSERT INTO `user` VALUES ('2', 'canglaoshi@admin.com', '670b14728ad9902aecba32e22fa4f6bd', '2', '0', '仓井空仓井空仓井空', null, '1', null, null, '2017-04-06 12:03:12', '2017-04-22 15:54:58');
INSERT INTO `user` VALUES ('3', 'xixi@admin.com', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '纱纱相', null, '1', null, null, '2017-04-06 17:20:17', '2017-04-06 17:30:52');
INSERT INTO `user` VALUES ('4', 'sb112@admin.com', '4297f44b13955235245b2497399d7a93', '3', '0', '黄育佳', null, '1', null, null, '2017-04-14 15:07:47', '2017-04-14 15:08:11');

-- ----------------------------
-- Table structure for user_rule
-- ----------------------------
DROP TABLE IF EXISTS `user_rule`;
CREATE TABLE `user_rule` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `rule_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限菜单表';

-- ----------------------------
-- Records of user_rule
-- ----------------------------
INSERT INTO `user_rule` VALUES ('3', '2', '3');
INSERT INTO `user_rule` VALUES ('3', '2', '8');
INSERT INTO `user_rule` VALUES ('3', '2', '9');
INSERT INTO `user_rule` VALUES ('3', '2', '10');
INSERT INTO `user_rule` VALUES ('3', '2', '18');
INSERT INTO `user_rule` VALUES ('4', '3', '3');
INSERT INTO `user_rule` VALUES ('4', '3', '8');
INSERT INTO `user_rule` VALUES ('4', '3', '9');
INSERT INTO `user_rule` VALUES ('4', '3', '10');
INSERT INTO `user_rule` VALUES ('4', '3', '18');
