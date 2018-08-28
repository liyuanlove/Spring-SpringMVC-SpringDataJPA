/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : sssp

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 16/04/2018 23:35:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sssp_departments
-- ----------------------------
DROP TABLE IF EXISTS `sssp_departments`;
CREATE TABLE `sssp_departments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sssp_departments
-- ----------------------------
INSERT INTO `sssp_departments` VALUES (1, '总裁办');
INSERT INTO `sssp_departments` VALUES (2, '开发部');
INSERT INTO `sssp_departments` VALUES (3, '后勤部');
INSERT INTO `sssp_departments` VALUES (4, '公关部');

-- ----------------------------
-- Table structure for sssp_employees
-- ----------------------------
DROP TABLE IF EXISTS `sssp_employees`;
CREATE TABLE `sssp_employees`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birth` date NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `department_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtmdd0vtgj341otwtemgvqtwc8`(`department_id`) USING BTREE,
  CONSTRAINT `FKtmdd0vtgj341otwtemgvqtwc8` FOREIGN KEY (`department_id`) REFERENCES `sssp_departments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sssp_employees
-- ----------------------------
INSERT INTO `sssp_employees` VALUES (1, '2017-12-07', '2017-12-07 16:23:57', 'aa@atguigu.com', 'AA', 1);
INSERT INTO `sssp_employees` VALUES (2, '2017-12-05', '2017-12-05 16:24:01', 'bb@atguigu.com', 'BB', 2);
INSERT INTO `sssp_employees` VALUES (3, '2017-07-13', '2017-07-13 16:24:04', 'cc@atguigu.com', 'CC', 3);
INSERT INTO `sssp_employees` VALUES (4, '2010-06-07', '2010-06-07 16:24:11', 'dd@atguigu.com', 'DD', 4);
INSERT INTO `sssp_employees` VALUES (5, '2017-12-13', '2017-12-13 16:24:23', 'ee@atguigu.com', 'EE', 1);
INSERT INTO `sssp_employees` VALUES (6, '2009-10-07', '2009-10-07 16:24:30', 'ff@atguigu.com', 'FF', 2);
INSERT INTO `sssp_employees` VALUES (7, '2012-12-07', '2012-12-07 16:24:38', 'gg@atguigu.com', 'GG', 3);

SET FOREIGN_KEY_CHECKS = 1;
