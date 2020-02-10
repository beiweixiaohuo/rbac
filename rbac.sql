CREATE DATABASE `rbac` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `rbac`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sn` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into department values(1,'����','technology');
insert into department values(2,'��Ӫ','operation');
insert into department values(3,'ά��','vindicate');
insert into department values(4,'����','personnel');


CREATE TABLE `emp_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into emp_role values(1,3,2);
insert into emp_role values(2,1,3);
insert into emp_role values(3,2,1);


CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(128) NOT NULL,
  `age` int(11) NOT NULL,
  `admin` varchar(8) NOT NULL,
  `dept_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into employee values(1,'��������Ա','123456','111@qq.com',21,'true',3);
insert into employee values(2,'��ͨԱ��','123456','222@qq.com',21,'false',1);
insert into employee values(3,'��������','123456','333@qq.com',21,'true',2);


CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into permission values(1,'���Ա��',null);
insert into permission values(2,'�޸�Ա��',null);
insert into permission values(3,'ɾ��Ա��',null);
insert into permission values(4,'���/�޸Ĳ���',null);
insert into permission values(5,'ɾ������',null);
insert into permission values(6,'���/�޸Ľ�ɫ',null);
insert into permission values(7,'ɾ����ɫ',null);
insert into permission values(8,'Ȩ�޹���',null);



CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into role values(1,'��ͨԱ��','123');
insert into role values(2,'��������','123');
insert into role values(3,'��������Ա','123');


CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
insert into role_permission values(11,3,8);

