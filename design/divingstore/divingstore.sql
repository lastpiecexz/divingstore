/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.12-log : Database - divingstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`divingstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `divingstore`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `orderdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_r_customer_book` (`c_id`),
  CONSTRAINT `fk_r_customer_book` FOREIGN KEY (`c_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='预约单';

/*Data for the table `book` */

insert  into `book`(`id`,`c_id`,`orderdate`) values (1,1,'2016-02-06 10:36:20');

/*Table structure for table `bookitem` */

DROP TABLE IF EXISTS `bookitem`;

CREATE TABLE `bookitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `i_id` smallint(6) DEFAULT NULL,
  `c_id` int(11) NOT NULL,
  `p_id` smallint(6) DEFAULT NULL,
  `b_id` int(11) NOT NULL,
  `targetdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `destinations` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_r_book_item` (`b_id`),
  KEY `fk_r_customer_item` (`c_id`),
  KEY `fk_r_instructor_item` (`i_id`),
  KEY `fk_r_item_service` (`p_id`),
  CONSTRAINT `fk_r_item_service` FOREIGN KEY (`p_id`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_r_book_item` FOREIGN KEY (`b_id`) REFERENCES `book` (`id`),
  CONSTRAINT `fk_r_customer_item` FOREIGN KEY (`c_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_r_instructor_item` FOREIGN KEY (`i_id`) REFERENCES `instructor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='预定项目';

/*Data for the table `bookitem` */

insert  into `bookitem`(`id`,`i_id`,`c_id`,`p_id`,`b_id`,`targetdate`,`destinations`) values (1,NULL,2,1,1,'2016-02-06 10:41:35',NULL),(2,1,3,3,1,'2016-02-06 10:41:25',NULL);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passportno` varchar(32) DEFAULT NULL,
  `cname` varchar(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `ename` varchar(64) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `weixin` varchar(64) DEFAULT NULL,
  `mobile` varchar(18) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='客户信息';

/*Data for the table `customer` */

insert  into `customer`(`id`,`passportno`,`cname`,`password`,`ename`,`gender`,`birth`,`weixin`,`mobile`,`email`) values (1,'E03339527','甄嬛','123','ZHEN HUAN','F','1982-10-20','zhenhuan','+86-13912312345','zhenhuan@163.com'),(2,'E04441234','花千骨','123','HUA QIANGU','F','1992-08-21','huaqiangu','+86-18001205444','huaqiangu@126.com'),(3,'E05558798','芈月','123','MI YUE','F','1983-12-19','miyue','+86-13012121212','miyue@163.com');

/*Table structure for table `instructor` */

DROP TABLE IF EXISTS `instructor`;

CREATE TABLE `instructor` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `password` char(32) DEFAULT NULL,
  `cno` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `intro` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='教练';

/*Data for the table `instructor` */

insert  into `instructor`(`id`,`password`,`cno`,`name`,`gender`,`birth`,`intro`) values (1,'123','339359','JOJO','M','1990-01-01','史心 JOJO\r\nPADI Rating:Open water Scuba Instructor');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='服务项目';

/*Data for the table `project` */

insert  into `project`(`id`,`projectname`,`content`,`price`,`remark`) values (1,'SN 浮潜','一天2个岛',160,'包含装备 午餐 潜导'),(2,'DSD 体验潜水','一天2次潜水',350,'包含装备 午餐 潜导'),(3,'FD 欢乐潜水','1天3次潜水',300,'包含装备 午餐 潜导'),(4,'SPD 诗巴丹套餐','1天FD，一天诗巴丹',1150,'包含装备 午餐 潜导'),(5,'RC 红树林','15:00出发',185,'包含晚餐'),(6,'OW 课程3天','1天理论 2天出海',1100,'包含 装备 出海午餐 教练 教材'),(7,'OW 课程4天','1天理论 3天出海',1300,'包含 装备 出海午餐 教练 教材'),(8,'AOW 课程2天','2天出海',1100,'包含 装备 出海午餐 教练 教材'),(9,'OW 3天住宿套餐','Sipadan Inn酒店',1250,'包含3天住宿'),(10,'OW 4天住宿套餐','Sipadan Inn酒店',1500,'包含4天住宿'),(11,'OW+AOW 5天住宿套餐','Sipadan Inn酒店',2450,'包含5天住宿'),(12,'RESCUE 救援','1天理论 2天出海 4潜',1200,'包含 装备 出海午餐 教练 教材'),(13,'DM 潜水长','15天课程 15天免费出海实习',3000,'不含700马币教材和178澳币申请费');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `dayofweek` tinyint(4) DEFAULT NULL,
  `islands` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='日程表';

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`dayofweek`,`islands`) values (1,1,'军舰岛 SIBUAN,咖亚岛 GAYA'),(2,2,'邦邦岛 POMPOM,海龟岛 PANDANAN'),(3,3,'珍珠岛 BOHEY DULANG,曼达布湾岛 MANTABUAN'),(4,4,'军舰岛 SIBUAN,咖亚岛 GAYA'),(5,5,'马达京岛 MATAKING,海龟岛 PANDANAN'),(6,6,'马步岛 MABUL,卡帕莱 KAPALAI'),(7,7,'珍珠岛 BOHEY DULANG,曼达布湾岛 MANTABUAN');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
