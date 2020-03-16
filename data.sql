-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: mylab
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户',7,'add_user'),(20,'Can change 用户',7,'change_user'),(21,'Can delete 用户',7,'delete_user'),(22,'Can add 确认码',8,'add_confirmstring'),(23,'Can change 确认码',8,'change_confirmstring'),(24,'Can delete 确认码',8,'delete_confirmstring'),(25,'Can add captcha store',9,'add_captchastore'),(26,'Can change captcha store',9,'change_captchastore'),(27,'Can delete captcha store',9,'delete_captchastore'),(28,'Can add 单位名称',10,'add_company'),(29,'Can change 单位名称',10,'change_company'),(30,'Can delete 单位名称',10,'delete_company'),(31,'Can add 部门名称',11,'add_department'),(32,'Can change 部门名称',11,'change_department'),(33,'Can delete 部门名称',11,'delete_department'),(34,'Can add 员工信息',12,'add_employee'),(35,'Can change 员工信息',12,'change_employee'),(36,'Can delete 员工信息',12,'delete_employee'),(37,'Can add 专业名称',13,'add_professional'),(38,'Can change 专业名称',13,'change_professional'),(39,'Can delete 专业名称',13,'delete_professional'),(40,'Can add 专业职称',14,'add_professionaltitle'),(41,'Can change 专业职称',14,'change_professionaltitle'),(42,'Can delete 专业职称',14,'delete_professionaltitle'),(43,'Can add 领导职务',15,'add_leadershipposition'),(44,'Can change 领导职务',15,'change_leadershipposition'),(45,'Can delete 领导职务',15,'delete_leadershipposition'),(46,'Can add 员工详细信息',16,'add_employeedetail'),(47,'Can change 员工详细信息',16,'change_employeedetail'),(48,'Can delete 员工详细信息',16,'delete_employeedetail'),(49,'Can add 设备编号',17,'add_instrument'),(50,'Can change 设备编号',17,'change_instrument'),(51,'Can delete 设备编号',17,'delete_instrument'),(52,'Can add 项目单位',18,'add_unit'),(53,'Can change 项目单位',18,'change_unit'),(54,'Can delete 项目单位',18,'delete_unit'),(55,'Can add 项目信息',19,'add_item'),(56,'Can change 项目信息',19,'change_item'),(57,'Can delete 项目信息',19,'delete_item'),(58,'Can add 项目参考值信息',20,'add_itemrefference'),(59,'Can change 项目参考值信息',20,'change_itemrefference'),(60,'Can delete 项目参考值信息',20,'delete_itemrefference');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$YfILRNDUD8S2$j9NPnQHLUt9mlXOKZO8ZYr48EuctAYvAJpsRf+dDQ74=','2020-03-04 12:35:33.012729',1,'admin','','','3168886316@qq.com',1,1,'2020-02-28 15:36:12.149703');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (162,'DEJI','deji','50d43fb6b24731e53c12a69c3ac16844d0b161d0','2020-03-08 15:13:59.040649'),(163,'YRMD','yrmd','1e0452f67099d60f1596553e5a7bfccf7395a85c','2020-03-08 15:14:19.950400'),(165,'TXRA','txra','ecce6add45caad7c71329c3e750d6c8f42ec93a2','2020-03-08 16:13:22.909442'),(166,'YJFI','yjfi','82dc31d8a2643624f76490a9f6fdc4e3a47d60ef','2020-03-08 16:14:26.792461'),(167,'LKSH','lksh','5bde86057c1ba3c86eff9294d2f5307a837126e8','2020-03-08 16:16:16.148571'),(168,'NPFU','npfu','da7555e4b8ce5a8606f9cba62dda538558974b4b','2020-03-09 13:05:57.696446');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_index` int(11) NOT NULL,
  `company_name` varchar(50) NOT NULL,
  `company_address` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_name` (`company_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,1001,'资中县人民医院','资中县迎宾路92号'),(2,1002,'资中县中医院','资中县荷花池街23号'),(3,1003,'资中县妇幼保健院','资中县苌弘路252号'),(4,1004,'资中县资州医院','资中县资州大道西段66号'),(5,1005,'资中县归德中心卫生院','资中县归德镇柳河街15号'),(6,1006,'资中县顺河卫生院','资中县顺河场镇双峰寺村1组'),(7,1007,'迈克生物','成都市高新区百川路16号'),(8,1008,'成都华森医疗','成都市高朋东路3号 ');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_index` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_position` varchar(50) NOT NULL,
  `belong_company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_belong_company_a3ac8898_fk_company_id` (`belong_company`),
  CONSTRAINT `department_belong_company_a3ac8898_fk_company_id` FOREIGN KEY (`belong_company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,1,'检验科','门诊4楼',1),(2,2,'功能科','门诊4楼',1),(3,3,'急诊科','门诊1楼',1),(4,4,'放射科','门诊2楼',1),(5,5,'医务科','行政1楼',1),(6,6,'检验科','门诊3楼',2),(7,7,'技术部-硬件','3栋15-2#',7),(8,8,'销售部','5栋-6066',7),(9,9,'技术部-应用','3栋15-2#',7);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-28 16:32:47.114444','1','gzj:   32ea55ba153c8444d95dc6a1a4d74ddc055d831225156db879efce7a141c7926',3,'',8,1),(2,'2020-02-28 16:33:06.069680','1','gzj',3,'',7,1),(3,'2020-02-28 17:29:51.975302','2','gzj',2,'已修改 user_img 。',7,1),(4,'2020-03-01 06:54:53.125671','1','g/L',1,'Added.',18,1),(5,'2020-03-01 06:55:22.893391','2','g/ml',1,'Added.',18,1),(6,'2020-03-01 06:55:32.805732','3','mmol/L',1,'Added.',18,1),(7,'2020-03-01 06:55:44.981314','4','ummol/L',1,'Added.',18,1),(8,'2020-03-01 06:56:03.302612','4','ummol/L',2,'已修改 unit_index 。',18,1),(9,'2020-03-01 06:57:03.504297','1','GLU',1,'Added.',19,1),(10,'2020-03-01 06:57:51.960200','2','Urea',1,'Added.',19,1),(11,'2020-03-01 06:58:18.765249','3','crea',1,'Added.',19,1),(12,'2020-03-01 07:14:52.188700','1','GLU',3,'',19,1),(13,'2020-03-01 07:14:52.190694','2','Urea',3,'',19,1),(14,'2020-03-01 07:14:52.193685','3','crea',3,'',19,1),(15,'2020-03-01 07:15:03.378944','1','g/L',3,'',18,1),(16,'2020-03-01 07:15:03.381004','2','g/ml',3,'',18,1),(17,'2020-03-01 07:15:03.382998','3','mmol/L',3,'',18,1),(18,'2020-03-01 07:15:03.383995','4','ummol/L',3,'',18,1),(19,'2020-03-01 07:19:15.387161','1','mmol/L',1,'Added.',18,1),(20,'2020-03-01 07:19:27.692164','2','ummol/L',1,'Added.',18,1),(21,'2020-03-01 07:19:36.538636','3','g/L',1,'Added.',18,1),(22,'2020-03-01 07:20:50.797078','1','GLU',1,'Added.',19,1),(23,'2020-03-01 07:22:51.174889','2','GLU',1,'Added.',20,1),(24,'2020-03-03 11:26:31.705958','2','gzj',2,'已修改 user_img 。',7,1),(25,'2020-03-03 13:07:53.093685','2','gzj',2,'已修改 user_img 。',7,1),(26,'2020-03-04 12:38:53.250246','2','gzj',2,'已修改 user_img 。',7,1),(27,'2020-03-04 12:45:27.425608','2','gzj',2,'已修改 user_img 。',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'captcha','captchastore'),(10,'company','company'),(11,'company','department'),(12,'company','employee'),(16,'company','employeedetail'),(15,'company','leadershipposition'),(13,'company','professional'),(14,'company','professionaltitle'),(5,'contenttypes','contenttype'),(17,'instrument','instrument'),(19,'item','item'),(20,'item','itemrefference'),(18,'item','unit'),(8,'login','confirmstring'),(7,'login','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-28 14:40:14.390284'),(2,'auth','0001_initial','2020-02-28 14:40:14.731876'),(3,'admin','0001_initial','2020-02-28 14:40:14.800692'),(4,'admin','0002_logentry_remove_auto_add','2020-02-28 14:40:14.816625'),(5,'contenttypes','0002_remove_content_type_name','2020-02-28 14:40:14.943741'),(6,'auth','0002_alter_permission_name_max_length','2020-02-28 14:40:14.979619'),(7,'auth','0003_alter_user_email_max_length','2020-02-28 14:40:15.021508'),(8,'auth','0004_alter_user_username_opts','2020-02-28 14:40:15.028488'),(9,'auth','0005_alter_user_last_login_null','2020-02-28 14:40:15.056449'),(10,'auth','0006_require_contenttypes_0002','2020-02-28 14:40:15.061435'),(11,'auth','0007_alter_validators_add_error_messages','2020-02-28 14:40:15.068417'),(12,'login','0001_initial','2020-02-28 14:40:15.151220'),(13,'sessions','0001_initial','2020-02-28 14:40:15.179145'),(14,'captcha','0001_initial','2020-02-28 15:00:40.692377'),(15,'company','0001_initial','2020-02-28 16:54:30.216197'),(16,'company','0002_auto_20200229_1022','2020-02-29 02:22:47.212652'),(19,'instrument','0001_initial','2020-03-01 06:42:51.315065'),(20,'item','0001_initial','2020-03-01 07:18:54.089767');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3zd24ib54596prbfwbecel641wsgvayp','ZTQxYWZmNTU0MDU5NjdlNzg1NWViNDhmNTg2OTMxYTAwZGZmMDU1MDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjI2MmRkZmY1M2M5MWRkNzNkYWJlMmMwMzUzNjE1NDk5NjU3ODVkOCJ9','2020-03-15 06:45:30.262435'),('83fh8biev79cvhlrbdoh4dfofevzj5pi','MjUxYzU4ZjJhZTdiNWQ2M2YwOTk1MWVhOTBmOWZhZmE3Y2FkNjM2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMjYyZGRmZjUzYzkxZGQ3M2RhYmUyYzAzNTM2MTU0OTk2NTc4NWQ4IiwiaXNfbG9naW4iOnRydWUsInVzZXJfaWQiOjIsInVzZXJfbmFtZSI6Imd6aiJ9','2020-03-13 16:35:09.123399'),('8gmijwxwlu83mjytsz7m1tj1f8lpllyt','ZTQxYWZmNTU0MDU5NjdlNzg1NWViNDhmNTg2OTMxYTAwZGZmMDU1MDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjI2MmRkZmY1M2M5MWRkNzNkYWJlMmMwMzUzNjE1NDk5NjU3ODVkOCJ9','2020-03-17 13:07:36.003000'),('bb4qx4md6hhna76p1vpz036nexfb9ekc','ZTQxYWZmNTU0MDU5NjdlNzg1NWViNDhmNTg2OTMxYTAwZGZmMDU1MDp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjI2MmRkZmY1M2M5MWRkNzNkYWJlMmMwMzUzNjE1NDk5NjU3ODVkOCJ9','2020-03-18 12:35:33.015721'),('ik52n4mb8fnqz1xiio25fwukmrmeztaa','ODhkYjVkMTEwNGFjZWRiODZlNzFjZDExNzFmNWU5OTY4ZTVmMGVlODp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoifQ==','2020-03-18 01:59:08.276878'),('qzfnype16dc0xalo2rs2njwwxr39bhv0','ODhkYjVkMTEwNGFjZWRiODZlNzFjZDExNzFmNWU5OTY4ZTVmMGVlODp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoifQ==','2020-03-13 17:35:24.094907'),('s1hxlp8mulplow5n5eejv1a06e6mkowr','ODhkYjVkMTEwNGFjZWRiODZlNzFjZDExNzFmNWU5OTY4ZTVmMGVlODp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoifQ==','2020-03-17 13:45:10.059062'),('u54dew3x0vnljlt1eel9o1lzk9ptcglc','ODhkYjVkMTEwNGFjZWRiODZlNzFjZDExNzFmNWU5OTY4ZTVmMGVlODp7ImlzX2xvZ2luIjp0cnVlLCJ1c2VyX2lkIjoyLCJ1c2VyX25hbWUiOiJnemoifQ==','2020-03-18 01:47:08.232257');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_index` varchar(20) NOT NULL,
  `employee_name` varchar(10) NOT NULL,
  `employee_gender` varchar(10) NOT NULL,
  `employee_telephone` varchar(20) NOT NULL,
  `belong_department` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_index` (`employee_index`),
  KEY `employee_belong_department_6557abeb_fk_department_id` (`belong_department`),
  CONSTRAINT `employee_belong_department_6557abeb_fk_department_id` FOREIGN KEY (`belong_department`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'1001','葛志军','男','13684409803',1),(2,'1002','朱月','女','13600000000',1),(3,'1003','肖月强','男','13458874861',4),(4,'1004','李长江','男','13333333333',5),(6,'1005','何国兰','女','13548307356',6),(7,'1006','乔治','男','1350000000',7),(8,'1007','张**','女','1566622222',9);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_detail`
--

DROP TABLE IF EXISTS `employee_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_img` varchar(100) DEFAULT NULL,
  `employee_hire_date` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `belong_leadership_position` int(11),
  `belong_professional` int(11) NOT NULL,
  `belong_professional_title` int(11) NOT NULL,
  `employee_index` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `belong_professional` (`belong_professional`),
  UNIQUE KEY `belong_professional_title` (`belong_professional_title`),
  UNIQUE KEY `employee_index` (`employee_index`),
  KEY `employee_detail_f86a76e4` (`belong_leadership_position`),
  CONSTRAINT `emp_belong_leadership_position_ffceb92c_fk_leadershipposition_id` FOREIGN KEY (`belong_leadership_position`) REFERENCES `leadershipposition` (`id`),
  CONSTRAINT `emplo_belong_professional_title_9f339761_fk_professionaltitle_id` FOREIGN KEY (`belong_professional_title`) REFERENCES `professionaltitle` (`id`),
  CONSTRAINT `employee_detail_belong_professional_db02b379_fk_professional_id` FOREIGN KEY (`belong_professional`) REFERENCES `professional` (`id`),
  CONSTRAINT `employee_detail_employee_index_15c11d62_fk_employee_id` FOREIGN KEY (`employee_index`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_detail`
--

LOCK TABLES `employee_detail` WRITE;
/*!40000 ALTER TABLE `employee_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instrument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_index` varchar(50) NOT NULL,
  `instrument_name` varchar(50) NOT NULL,
  `instrument_status` varchar(10) NOT NULL,
  `instrument_start_date` date NOT NULL,
  `instrument_company` int(11) NOT NULL,
  `instrument_manager` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instrument_index` (`instrument_index`),
  KEY `instrument_instrument_company_390c710a_fk_company_id` (`instrument_company`),
  KEY `instrument_instrument_manager_30052658_fk_employee_id` (`instrument_manager`),
  CONSTRAINT `instrument_instrument_company_390c710a_fk_company_id` FOREIGN KEY (`instrument_company`) REFERENCES `company` (`id`),
  CONSTRAINT `instrument_instrument_manager_30052658_fk_employee_id` FOREIGN KEY (`instrument_manager`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES (1,'1001','日立7600','正常','2020-03-01',7,1),(2,'1002','日立7180','正常','2020-03-01',7,2),(3,'1003','强生5600','正常','2020-03-01',8,1);
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` int(11) NOT NULL,
  `item_chinese_name` varchar(20) NOT NULL,
  `item_english_name` varchar(20) NOT NULL,
  `item_method` varchar(20) NOT NULL,
  `is_calc` tinyint(1) NOT NULL,
  `is_use` tinyint(1) NOT NULL,
  `item_unit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_dfbc70d4` (`item_unit`),
  CONSTRAINT `item_item_unit_ef7ae81d_fk_unit_id` FOREIGN KEY (`item_unit`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,10010,'血糖','GLU','己糖激酶法',0,1,1),(2,10100,'总蛋白','TP','双缩脲法',1,1,3);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemrefference`
--

DROP TABLE IF EXISTS `itemrefference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemrefference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `start_age` int(11) DEFAULT NULL,
  `end_age` int(11) DEFAULT NULL,
  `age_unit` varchar(10) NOT NULL,
  `ref_low` decimal(10,3) DEFAULT NULL,
  `ref_high` decimal(10,3) DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemrefference_item_id_779af49f_fk_item_id` (`item_id`),
  CONSTRAINT `itemrefference_item_id_779af49f_fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemrefference`
--

LOCK TABLES `itemrefference` WRITE;
/*!40000 ALTER TABLE `itemrefference` DISABLE KEYS */;
INSERT INTO `itemrefference` VALUES (2,1,'',NULL,NULL,'',3.890,6.110,1);
/*!40000 ALTER TABLE `itemrefference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leadershipposition`
--

DROP TABLE IF EXISTS `leadershipposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leadershipposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_title_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leadershipposition`
--

LOCK TABLES `leadershipposition` WRITE;
/*!40000 ALTER TABLE `leadershipposition` DISABLE KEYS */;
/*!40000 ALTER TABLE `leadershipposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_confirmstring`
--

DROP TABLE IF EXISTS `login_confirmstring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_confirmstring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(256) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  CONSTRAINT `login_confirmstring_user_34eaf79d_fk_login_user_id` FOREIGN KEY (`user`) REFERENCES `login_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_confirmstring`
--

LOCK TABLES `login_confirmstring` WRITE;
/*!40000 ALTER TABLE `login_confirmstring` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_confirmstring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(254) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `c_time` datetime(6) NOT NULL,
  `has_confirmed` tinyint(1) NOT NULL,
  `user_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
INSERT INTO `login_user` VALUES (2,'gzj','7e5a2c6295d7b1c96f58dfdcbfe1d6d1fcf7b6e63d04e3ba592ade86d1901034','2589641825@qq.com','male','2020-02-28 16:33:56.896787',1,'gzj/avatar/touxiang/f247cee4.jpg');
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional`
--

DROP TABLE IF EXISTS `professional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional`
--

LOCK TABLES `professional` WRITE;
/*!40000 ALTER TABLE `professional` DISABLE KEYS */;
/*!40000 ALTER TABLE `professional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professionaltitle`
--

DROP TABLE IF EXISTS `professionaltitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professionaltitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_title_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professionaltitle`
--

LOCK TABLES `professionaltitle` WRITE;
/*!40000 ALTER TABLE `professionaltitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `professionaltitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_index` int(11) NOT NULL,
  `unit_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,1001,'mmol/L'),(2,1002,'ummol/L'),(3,1003,'g/L'),(4,1004,'mg/L'),(6,1005,'U/L');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-10 17:59:05
