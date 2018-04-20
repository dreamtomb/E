/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : selectcoursedb

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2014-09-19 18:16:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_classinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_classinfo`;
CREATE TABLE `t_classinfo` (
  `classNumber` varchar(20) NOT NULL,
  `className` varchar(20) default NULL,
  `classSpecialFieldNumber` varchar(20) default NULL,
  `classBirthDate` varchar(10) default NULL,
  `classTeacherCharge` varchar(12) default NULL,
  `classTelephone` varchar(20) default NULL,
  `classMemo` varchar(100) default NULL,
  PRIMARY KEY  (`classNumber`),
  KEY `FK95BB201BA924E03B` (`classSpecialFieldNumber`),
  CONSTRAINT `FK95BB201BA924E03B` FOREIGN KEY (`classSpecialFieldNumber`) REFERENCES `t_specialfieldinfo` (`specialFieldNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_classinfo
-- ----------------------------
INSERT INTO `t_classinfo` VALUES ('2013050303', '2013级计算机3班', '0503', '2013-01-10', '宋青常', '15939401901', '测试班级aa');
INSERT INTO `t_classinfo` VALUES ('2013050403', '2013级电子信息3班', '0504', '2013-01-10', '双鱼林', '13558690869', '测试班级');

-- ----------------------------
-- Table structure for `t_collegeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_collegeinfo`;
CREATE TABLE `t_collegeinfo` (
  `collegeNumber` varchar(20) NOT NULL,
  `collegeName` varchar(20) default NULL,
  `collegeBirthDate` varchar(10) default NULL,
  `collegeMan` varchar(10) default NULL,
  `collegeTelephone` varchar(20) default NULL,
  `collegeMemo` varchar(100) default NULL,
  PRIMARY KEY  (`collegeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collegeinfo
-- ----------------------------
INSERT INTO `t_collegeinfo` VALUES ('05', '信息工程学院', '2009-01-07', '张大树', '13959319852', '测试学院');

-- ----------------------------
-- Table structure for `t_courseinfo_qq254540457`
-- ----------------------------
DROP TABLE IF EXISTS `t_courseinfo_qq254540457`;
CREATE TABLE `t_courseinfo_qq254540457` (
  `courseNumber` varchar(20) NOT NULL,
  `courseName` varchar(20) default NULL,
  `courseTeacher` varchar(20) default NULL,
  `courseTime` varchar(40) default NULL,
  `coursePlace` varchar(40) default NULL,
  `courseScore` float default NULL,
  `courseMemo` varchar(100) default NULL,
  PRIMARY KEY  (`courseNumber`),
  KEY `FK258A9AAB4FB4E18A` (`courseTeacher`),
  CONSTRAINT `FK258A9AAB4FB4E18A` FOREIGN KEY (`courseTeacher`) REFERENCES `t_teacher_qq287307421` (`teacherNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_courseinfo_qq254540457
-- ----------------------------
INSERT INTO `t_courseinfo_qq254540457` VALUES ('KC001', '安卓Android程序设计', 'TH001', '每周1下午1,2节', '6A-304', '3.5', '测试课程');
INSERT INTO `t_courseinfo_qq254540457` VALUES ('KC002', '计算机编译原理', 'TH002', '每周3上午1,2节', '7B-101', '3.6', '测试课程');
INSERT INTO `t_courseinfo_qq254540457` VALUES ('KC003', 'flash动画设计', 'TH001', '每周3下午3,4节', '8B-202', '3.8', '测试课程');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `newsId` int(11) NOT NULL auto_increment,
  `newsTitle` varchar(50) default NULL,
  `newsContent` longtext,
  `newsDate` varchar(10) default NULL,
  `newsPhoto` varchar(50) default NULL,
  PRIMARY KEY  (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '测试新闻标题', '测试新新闻内容哦！', '2014-01-01', 'upload/a0e2be10-99ff-47e9-a0aa-dc349ef90c8b.jpg');

-- ----------------------------
-- Table structure for `t_scoreinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_scoreinfo`;
CREATE TABLE `t_scoreinfo` (
  `scoreId` int(11) NOT NULL auto_increment,
  `studentNumber` varchar(20) default NULL,
  `courseNumber` varchar(20) default NULL,
  `scoreValue` float default NULL,
  `studentEvaluate` varchar(30) default NULL,
  PRIMARY KEY  (`scoreId`),
  KEY `FK1534983543F8B840` (`studentNumber`),
  KEY `FK15349835CBB4EC4E` (`courseNumber`),
  CONSTRAINT `FK15349835CBB4EC4E` FOREIGN KEY (`courseNumber`) REFERENCES `t_courseinfo_qq254540457` (`courseNumber`),
  CONSTRAINT `FK1534983543F8B840` FOREIGN KEY (`studentNumber`) REFERENCES `t_student_qq287307421` (`studentNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scoreinfo
-- ----------------------------
INSERT INTO `t_scoreinfo` VALUES ('1', '201305030317', 'KC001', '88.5', '成绩好');
INSERT INTO `t_scoreinfo` VALUES ('2', '201305030317', 'KC002', '92', '还行');
INSERT INTO `t_scoreinfo` VALUES ('3', '201305040318', 'KC001', '93', '好的啊');

-- ----------------------------
-- Table structure for `t_specialfieldinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_specialfieldinfo`;
CREATE TABLE `t_specialfieldinfo` (
  `specialFieldNumber` varchar(20) NOT NULL,
  `specialFieldName` varchar(20) default NULL,
  `specialCollegeNumber` varchar(20) default NULL,
  `specialBirthDate` varchar(10) default NULL,
  `specialMan` varchar(10) default NULL,
  `specialTelephone` varchar(20) default NULL,
  `specialMemo` varchar(100) default NULL,
  PRIMARY KEY  (`specialFieldNumber`),
  KEY `FK30F0289A6AE335E2` (`specialCollegeNumber`),
  CONSTRAINT `FK30F0289A6AE335E2` FOREIGN KEY (`specialCollegeNumber`) REFERENCES `t_collegeinfo` (`collegeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_specialfieldinfo
-- ----------------------------
INSERT INTO `t_specialfieldinfo` VALUES ('0503', '计算机科学与技术', '05', '2011-01-12', '刘光钟', '15929491029', '测试专业');
INSERT INTO `t_specialfieldinfo` VALUES ('0504', '电子信息技术', '05', '2010-01-19', '黄大河', '15939841190', '测试专业');

-- ----------------------------
-- Table structure for `t_studentselectcourseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_studentselectcourseinfo`;
CREATE TABLE `t_studentselectcourseinfo` (
  `selectId` int(11) NOT NULL auto_increment,
  `studentNumber` varchar(20) default NULL,
  `courseNumber` varchar(20) default NULL,
  PRIMARY KEY  (`selectId`),
  KEY `FK47DAEAF543F8B840` (`studentNumber`),
  KEY `FK47DAEAF5CBB4EC4E` (`courseNumber`),
  CONSTRAINT `FK47DAEAF5CBB4EC4E` FOREIGN KEY (`courseNumber`) REFERENCES `t_courseinfo_qq254540457` (`courseNumber`),
  CONSTRAINT `FK47DAEAF543F8B840` FOREIGN KEY (`studentNumber`) REFERENCES `t_student_qq287307421` (`studentNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_studentselectcourseinfo
-- ----------------------------
INSERT INTO `t_studentselectcourseinfo` VALUES ('1', '201305030317', 'KC001');
INSERT INTO `t_studentselectcourseinfo` VALUES ('2', '201305030317', 'KC002');
INSERT INTO `t_studentselectcourseinfo` VALUES ('3', '201305030317', 'KC003');
INSERT INTO `t_studentselectcourseinfo` VALUES ('4', '201305040318', 'KC001');
INSERT INTO `t_studentselectcourseinfo` VALUES ('5', '201305040318', 'KC002');
INSERT INTO `t_studentselectcourseinfo` VALUES ('6', '201305040318', 'KC003');

-- ----------------------------
-- Table structure for `t_student_qq287307421`
-- ----------------------------
DROP TABLE IF EXISTS `t_student_qq287307421`;
CREATE TABLE `t_student_qq287307421` (
  `studentNumber` varchar(20) NOT NULL,
  `studentName` varchar(12) default NULL,
  `studentPassword` varchar(30) default NULL,
  `studentSex` varchar(2) default NULL,
  `studentClassNumber` varchar(20) default NULL,
  `studentBirthday` varchar(10) default NULL,
  `studentState` varchar(20) default NULL,
  `studentPhoto` varchar(50) default NULL,
  `studentTelephone` varchar(20) default NULL,
  `studentEmail` varchar(30) default NULL,
  `studentQQ` varchar(20) default NULL,
  `studentAddress` varchar(100) default NULL,
  `studentMemo` varchar(100) default NULL,
  PRIMARY KEY  (`studentNumber`),
  KEY `FKA1F0E11B97DC0CE2` (`studentClassNumber`),
  CONSTRAINT `FKA1F0E11B97DC0CE2` FOREIGN KEY (`studentClassNumber`) REFERENCES `t_classinfo` (`classNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student_qq287307421
-- ----------------------------
INSERT INTO `t_student_qq287307421` VALUES ('201305030317', '双鱼林', '123456', '男', '2013050303', '1990-01-03', '团员', 'upload/9da24f18-bdfa-4909-8dba-9f8a11602963.jpg', '13558690869', 'wangjianlin1985@126.com', '287307421', '四川成都二仙桥', '测试学生');
INSERT INTO `t_student_qq287307421` VALUES ('201305040318', '刘光霞', '123456', '女', '2013050403', '1998-01-15', '党员', 'upload/6be773ab-2a53-456c-b80d-cdfc4816f1cf.jpg', '13908064703', 'lgx@163.com', '254540457', '四川达州aa', '测试学生');

-- ----------------------------
-- Table structure for `t_teacher_qq287307421`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher_qq287307421`;
CREATE TABLE `t_teacher_qq287307421` (
  `teacherNumber` varchar(20) NOT NULL,
  `teacherName` varchar(12) default NULL,
  `teacherPassword` varchar(30) default NULL,
  `teacherSex` varchar(2) default NULL,
  `teacherBirthday` varchar(10) default NULL,
  `teacherArriveDate` varchar(10) default NULL,
  `teacherCardNumber` varchar(20) default NULL,
  `teacherPhone` varchar(20) default NULL,
  `teacherPhoto` varchar(50) default NULL,
  `teacherAddress` varchar(100) default NULL,
  `teacherMemo` varchar(100) default NULL,
  PRIMARY KEY  (`teacherNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher_qq287307421
-- ----------------------------
INSERT INTO `t_teacher_qq287307421` VALUES ('TH001', '张小美', '123456', '女', '1984-01-18', '2012-01-03', '513030198401182341', '15395891234', 'upload/de0188ed-d26e-4946-84e5-54027beb6b48.jpg', '四川达州aaa', '测试老师aaa');
INSERT INTO `t_teacher_qq287307421` VALUES ('TH002', '吴亮', '123456', '男', '1962-01-10', '2013-01-08', '513412196201103412', '13593801934', 'upload/2e83f122-0296-4c21-9b51-75bb9919fa48.jpg', '四川南充', '测试老师');
