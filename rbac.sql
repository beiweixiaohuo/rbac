drop database `rbac`;
create database `rbac`;
use `rbac`;

CREATE TABLE `board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `context` varchar(1024) NOT NULL,
  `publisher` varchar(45) NOT NULL,
  `create_time` timestamp NOT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `isdelete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sn` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `emp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `workID` char(10) DEFAULT NULL COMMENT '工号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') DEFAULT NULL COMMENT '婚姻状况',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `politic` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int(11) DEFAULT NULL COMMENT '所属部门',
  `posId` int(11) DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(16) DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `workID_UNIQUE` (`workID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `idCard_UNIQUE` (`idCard`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `emp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `islock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into department values(1,'技术','technology');
insert into department values(2,'运营','operation');
insert into department values(3,'维护','vindicate');
insert into department values(4,'人事','personnel');

insert into emp_role values(1,3,2);
insert into emp_role values(2,1,3);
insert into emp_role values(3,2,1);

insert into employee values(1, '超级管理员','3f8f2144b6737d8d1608ee2593aca24d', 'c99ca1d4fecb41e28fe7fa03521cb253', '15999999999', 2, 0);#密码：123456
insert into employee values(2,'普通员工','3f8f2144b6737d8d1608ee2593aca24d','c99ca1d4fecb41e28fe7fa03521cb253','13888888888',1,0);
insert into employee values(3,'人事主管','3f8f2144b6737d8d1608ee2593aca24d','c99ca1d4fecb41e28fe7fa03521cb253','1477777777',2,0);

insert into permission values(1,'员工信息管理','可编辑员工信息');
insert into permission values(2,'部门管理','可对部门进行增删改操作');
insert into permission values(3,'角色管理','可对角色进行增删改操作');
insert into permission values(4,'职位管理','可对职位进行增删改操作');
insert into permission values(5,'权限管理','可对角色的权限更改');
insert into permission values(6,'公告管理','可对公告进行增删改操作');
insert into permission values(7,'账号管理','可对账号进行增删改操作');

insert into role values(1,'普通员工','123');
insert into role values(2,'人事主管','123');
insert into role values(3,'超级管理员','123');

insert into role_permission values(1,2,1);
insert into role_permission values(2,2,2);
insert into role_permission values(3,2,3);
insert into role_permission values(4,3,1);
insert into role_permission values(5,3,2);
insert into role_permission values(6,3,3);
insert into role_permission values(7,3,4);
insert into role_permission values(8,3,5);
insert into role_permission values(9,3,6);
insert into role_permission values(10,3,7);

INSERT INTO `position` VALUES ('4', 'P4(初级专员)', '4', '在专业领域，具有学习能力和潜能。');
INSERT INTO `position` VALUES ('5', 'P5(高级工程师)', '4', '在项目当中可以作为独立的项目组成员。');
INSERT INTO `position` VALUES ('6', 'P6(资深工程师)', '4', '可独立领导跨部门的项目。');
INSERT INTO `position` VALUES ('7', 'P7(技术专家)', '4', '是专业领域的资深人士。');
INSERT INTO `position` VALUES ('8', 'P8(高级专家)', '4', '开始参与部门相关策略的制定。');
INSERT INTO `position` VALUES ('9', 'P9(资深专家)', '4', '是某一领域中的资深专家。');

#邮箱不能重复，写自己的邮箱，在忘记密码的功能（需要先安装Redis）才可以接收到邮件，不测试改功能可以不用redis。
insert into emp_info values('1', '1', '超级管理员', '男', '2020-06-24', '111', '未婚', '汉族', '广东省', '群众', '邮箱1', '15999999999', '广东省', '2', '9', '劳务合同', '本科', '计算机科学与技术', '222', '2020-06-24', '在职', '2020-06-24', NULL, '2020-06-24', '2020-06-24');
insert into emp_info values('2', '2', '人事主管', '男', '2020-06-24', '22222', '已婚', '汉族', '广东省', '共产党员', '2@qq.com', '222', '广东省', '4', '8', '劳务合同', '硕士', '软件工程', '1', '2020-06-24', '在职', '2020-06-24', NULL, '2020-06-24', '2020-06-24');
insert into emp_info values('3', '3', '普通员工', '男', '2020-06-24', '3', '离异', '汉族', '广东省', '共青团员', '3@qq.com', '333', '广东省', '2', '7', '劳动合同', '博士', '电子商务', '3', '2020-06-24', '在职', '2020-06-24', NULL, '2020-06-24', '2020-06-24');
