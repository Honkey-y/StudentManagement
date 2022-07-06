/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.28 : Database - yangstudent
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yangstudent` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yangstudent`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cid` int NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `cname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `choose` tinyint(1) DEFAULT NULL COMMENT '是否选修',
  `credits` int DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `course` */

insert  into `course`(`cid`,`cname`,`choose`,`credits`) values (1,'大型软硬件实验周',0,4),(2,'linux操作系统',0,4),(4,'Java高级2',1,2),(5,'单片机',1,4),(6,'编译原理',0,2);

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `gid` int NOT NULL AUTO_INCREMENT COMMENT '成绩id',
  `sid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外键-学生id',
  `cid` int DEFAULT NULL COMMENT '外键-课程id',
  `grades` double(10,2) DEFAULT NULL COMMENT '成绩',
  PRIMARY KEY (`gid`),
  KEY `cid` (`cid`),
  KEY `sid` (`sid`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `course` (`cid`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `grades` */

insert  into `grades`(`gid`,`sid`,`cid`,`grades`) values (5,'2',2,88.00),(6,'2',4,99.00),(7,'1',1,66.00),(8,'2',1,NULL),(9,'1',2,NULL),(10,'1',4,NULL),(11,'1',5,NULL),(12,'2',6,NULL),(13,'2',5,NULL),(14,'1',6,NULL),(15,'2',6,NULL),(16,'1',4,NULL),(17,'2',1,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `stunum` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stupassword` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `student` */

insert  into `student`(`sid`,`stunum`,`sname`,`stupassword`,`gender`,`birthday`) values ('1','2132Z12433','王洋','123456',1,'2000-09-16'),('2','2132Z12433','杨凯胜','123456',0,'1999-10-04'),('23b73a6e-ca7b-4d95-9ede-8d21cc8ad849','2132Z12433','小徐','123456',0,'1999-10-04'),('9c76ab06-8c6f-4349-917c-04a59674cb0f','2132Z12433','小杨','123456',1,'2000-09-16'),('a3f36599-f0cf-4bd3-95b3-33556a8fc02a','2132Z12433','小杨','123456',0,'2000-09-16'),('fa704c94-e14d-40a8-b5f7-79cfc994668e','213123','sadsad','123456',0,'2000-09-16');

/*Table structure for table `thirdcg` */

DROP TABLE IF EXISTS `thirdcg`;

CREATE TABLE `thirdcg` (
  `tid` int NOT NULL,
  `sid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gid` int DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `thirdcg` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varbinary(30) DEFAULT NULL,
  `posts` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`realname`,`posts`) values (21,'1111','934b535800b1cba8f96a5d72f72f1611','小杨','班主任'),(22,'','934b535800b1cba8f96a5d72f72f1611','徐紫嫣','教导主任'),(23,'197','b59c67bf196a4758191e42f76670ceba','小杨','班主任'),(24,'3333','2be9bd7a3434f7038ca27d1918de58bd','sadsad','班主任'),(25,'4','202cb962ac59075b964b07152d234b70','小杨','教导主任'),(26,'5','e4da3b7fbbce2345d7772b0674a318d5','sadsad','班主任'),(27,'6','1679091c5a880faf6fb5e6087eb1b2dc','小杨1','班主任'),(31,'sadasd','c99a11a53a3748269e3f86d7ac38df11','asdasd',NULL),(32,'787','3621f1454cacf995530ea53652ddf8fb','小杨','班主任'),(33,'8','c9f0f895fb98ab9159f51fd0297e236d','徐紫嫣','学工助理'),(34,'9','45c48cce2e2d7fbdea1afc51c7c6ad26','小徐','班主任'),(35,'33','182be0c5cdcd5072bb1864cdee4d3d6e','',NULL),(36,'333','310dcbbf4cce62f762a2aaa148d556bd','111','班主任'),(37,'444','550a141f12de6341fba65b0ad0433500','sad','班主任'),(38,'999','b706835de79a2b4e80506f582af3676a','sadsad111','学工助理'),(40,'sadsa111','ebb6bcb4b2f6220edb7130447bdb4131','sad','班主任'),(42,'1999999','65a3ae52c278e2b96852e99530d41233','sad','教导主任'),(43,'123','123','杨凯胜','教师'),(48,'1231111','202cb962ac59075b964b07152d234b70','小杨','教导主任'),(49,'213213123','202cb962ac59075b964b07152d234b70','123213',NULL),(50,'111','d41d8cd98f00b204e9800998ecf8427e','小杨','班主任'),(51,'1','c4ca4238a0b923820dcc509a6f75849b','小徐','班主任'),(52,'1977016033','6f18a4d49b75b106d51c329e1d00f4b1','杨凯胜','教导主任');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
