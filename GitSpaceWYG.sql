-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: GitSpaceWYG
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add dynamic comment',7,'add_dynamiccomment'),(20,'Can change dynamic comment',7,'change_dynamiccomment'),(21,'Can delete dynamic comment',7,'delete_dynamiccomment'),(22,'Can add idea',8,'add_idea'),(23,'Can change idea',8,'change_idea'),(24,'Can delete idea',8,'delete_idea'),(25,'Can add article',9,'add_article'),(26,'Can change article',9,'change_article'),(27,'Can delete article',9,'delete_article'),(28,'Can add dynamic',10,'add_dynamic'),(29,'Can change dynamic',10,'change_dynamic'),(30,'Can delete dynamic',10,'delete_dynamic'),(31,'Can add article recommend',11,'add_articlerecommend'),(32,'Can change article recommend',11,'change_articlerecommend'),(33,'Can delete article recommend',11,'delete_articlerecommend'),(34,'Can add idea thumb up',12,'add_ideathumbup'),(35,'Can change idea thumb up',12,'change_ideathumbup'),(36,'Can delete idea thumb up',12,'delete_ideathumbup'),(37,'Can add article collection',13,'add_articlecollection'),(38,'Can change article collection',13,'change_articlecollection'),(39,'Can delete article collection',13,'delete_articlecollection'),(40,'Can add article comment',14,'add_articlecomment'),(41,'Can change article comment',14,'change_articlecomment'),(42,'Can delete article comment',14,'delete_articlecomment'),(43,'Can add person follow',15,'add_personfollow'),(44,'Can change person follow',15,'change_personfollow'),(45,'Can delete person follow',15,'delete_personfollow'),(46,'Can add person',16,'add_person'),(47,'Can change person',16,'change_person'),(48,'Can delete person',16,'delete_person'),(49,'Can add dynamic thumb up',17,'add_dynamicthumbup'),(50,'Can change dynamic thumb up',17,'change_dynamicthumbup'),(51,'Can delete dynamic thumb up',17,'delete_dynamicthumbup'),(52,'Can add idea collection',18,'add_ideacollection'),(53,'Can change idea collection',18,'change_ideacollection'),(54,'Can delete idea collection',18,'delete_ideacollection'),(55,'Can add article thumb up',19,'add_articlethumbup'),(56,'Can change article thumb up',19,'change_articlethumbup'),(57,'Can delete article thumb up',19,'delete_articlethumbup'),(58,'Can add idea recommend',20,'add_idearecommend'),(59,'Can change idea recommend',20,'change_idearecommend'),(60,'Can delete idea recommend',20,'delete_idearecommend');
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
  `username` varchar(150) NOT NULL,
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$4j0SSXh6x2Qz$caDTiHQ3a4++OrzKdRhQNyoh1PhYRE0iKtujpcPaZOY=','2018-07-05 15:19:33.300034',1,'linkcc','','','linkcc@qq.com',1,1,'2018-07-05 15:19:19.069467');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-07-05 15:36:51.466555','1','PersonFollow object',1,'[{\"added\": {}}]',15,1),(2,'2018-07-05 15:37:07.733511','2','PersonFollow object',1,'[{\"added\": {}}]',15,1),(3,'2018-07-05 15:37:17.934338','3','PersonFollow object',1,'[{\"added\": {}}]',15,1),(4,'2018-07-05 15:37:24.157146','4','PersonFollow object',1,'[{\"added\": {}}]',15,1),(5,'2018-07-06 08:12:38.545779','6','Bob',1,'[{\"added\": {}}]',10,1),(6,'2018-07-06 08:13:21.515480','1','Bob',1,'[{\"added\": {}}]',8,1),(7,'2018-07-06 08:51:53.816213','1','Bob',1,'[{\"added\": {}}]',18,1),(8,'2018-07-06 09:04:50.399460','1','theBobarticle',1,'[{\"added\": {}}]',9,1),(9,'2018-07-06 09:08:55.934902','3','ArticleComment object',1,'[{\"added\": {}}]',14,1),(10,'2018-07-06 09:21:37.283242','5','1123',1,'[{\"added\": {}}]',14,1),(11,'2018-07-06 09:49:33.351965','5','Bob',3,'',10,1),(12,'2018-07-06 10:53:32.170370','2','DynamicComment object',1,'[{\"added\": {}}]',7,1),(13,'2018-07-06 14:38:45.622280','2','2',2,'[{\"changed\": {\"fields\": [\"commentDynamic\"]}}]',7,1),(14,'2018-07-06 15:41:49.464408','1','Bob',3,'',17,1),(15,'2018-07-06 15:43:04.221233','2','Bob',1,'[{\"added\": {}}]',17,1),(16,'2018-07-06 15:45:45.478428','5','Bob',3,'',17,1),(17,'2018-07-06 15:45:45.483115','4','Bob',3,'',17,1),(18,'2018-07-06 15:45:45.486672','3','Bob',3,'',17,1),(19,'2018-07-06 17:35:41.905117','6','Bob',1,'[{\"added\": {}}]',17,1),(20,'2018-07-06 17:57:23.458771','10','Bob',3,'',17,1),(21,'2018-07-06 17:57:23.478606','9','Bob',3,'',17,1),(22,'2018-07-06 17:57:23.484355','8','Bob',3,'',17,1),(23,'2018-07-06 17:57:23.508306','7','Bob',3,'',17,1),(24,'2018-07-06 17:57:23.516889','6','Bob',3,'',17,1),(25,'2018-07-09 08:30:39.902495','2','Bob',3,'',17,1),(26,'2018-07-09 08:42:08.068476','7','Bob',3,'',17,1),(27,'2018-07-09 08:42:08.074499','6','Bob',3,'',17,1),(28,'2018-07-09 08:42:08.076304','5','Bob',3,'',17,1),(29,'2018-07-09 08:42:08.087821','4','Bob',3,'',17,1),(30,'2018-07-09 08:42:08.091265','3','Bob',3,'',17,1),(31,'2018-07-09 14:47:40.156199','8','8',2,'[{\"changed\": {\"fields\": [\"commentDynamic\", \"commentTime\"]}}]',7,1),(32,'2018-07-09 14:56:27.468474','16','16',3,'',7,1),(33,'2018-07-09 14:56:27.473470','15','15',3,'',7,1),(34,'2018-07-09 14:56:27.479622','14','14',3,'',7,1),(35,'2018-07-09 14:56:27.488326','13','13',3,'',7,1),(36,'2018-07-09 14:56:27.490791','12','12',3,'',7,1),(37,'2018-07-09 14:56:27.494249','11','11',3,'',7,1),(38,'2018-07-09 14:56:27.496643','10','10',3,'',7,1),(39,'2018-07-09 14:56:48.062917','9','9',3,'',7,1),(40,'2018-07-09 14:56:48.134226','8','8',3,'',7,1);
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
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'index','article'),(13,'index','articlecollection'),(14,'index','articlecomment'),(11,'index','articlerecommend'),(19,'index','articlethumbup'),(10,'index','dynamic'),(7,'index','dynamiccomment'),(17,'index','dynamicthumbup'),(8,'index','idea'),(18,'index','ideacollection'),(20,'index','idearecommend'),(12,'index','ideathumbup'),(16,'index','person'),(15,'index','personfollow'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-07-05 15:09:43.343295'),(2,'auth','0001_initial','2018-07-05 15:09:44.164353'),(3,'admin','0001_initial','2018-07-05 15:09:44.343349'),(4,'admin','0002_logentry_remove_auto_add','2018-07-05 15:09:44.377808'),(5,'contenttypes','0002_remove_content_type_name','2018-07-05 15:09:44.459150'),(6,'auth','0002_alter_permission_name_max_length','2018-07-05 15:09:44.502158'),(7,'auth','0003_alter_user_email_max_length','2018-07-05 15:09:44.532724'),(8,'auth','0004_alter_user_username_opts','2018-07-05 15:09:44.546514'),(9,'auth','0005_alter_user_last_login_null','2018-07-05 15:09:44.568252'),(10,'auth','0006_require_contenttypes_0002','2018-07-05 15:09:44.569559'),(11,'auth','0007_alter_validators_add_error_messages','2018-07-05 15:09:44.579720'),(12,'auth','0008_alter_user_username_max_length','2018-07-05 15:09:44.646985'),(13,'index','0001_initial','2018-07-05 15:09:45.502358'),(14,'index','0002_auto_20180705_1509','2018-07-05 15:09:45.590360'),(15,'sessions','0001_initial','2018-07-05 15:09:45.650598'),(16,'index','0003_auto_20180706_1024','2018-07-06 10:24:52.535875');
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
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('s6per63k7ckw86aftwhtel36uixvl3iu','OWU2MjVjZWQ1N2IxZDQxOTdiOTJkZjM2OThlMWE5M2VjZWYzYmI3NTp7InBlcnNvbklEIjoxLCJfYXV0aF91c2VyX2hhc2giOiI2NDA0NDc2MzdiZmNmMTVhNDdmMmU4Mjk1ZDcwOWFhNTVlZTU3MjgzIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2018-07-19 16:52:24.204022'),('s7mam8w1wgmkmuvcroru5j1n3dknf7mj','ZjAyOGYzZTU2YjhkZGRkZjlhOTJlMzc2Yzk1ZDgwMTY1OTAzNGIyNzp7InBlcnNvbklEIjoyfQ==','2018-07-19 16:56:39.922936');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_article`
--

DROP TABLE IF EXISTS `index_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_article` (
  `articleID` int(11) NOT NULL AUTO_INCREMENT,
  `createDate` datetime(6) NOT NULL,
  `contentURL` varchar(200) NOT NULL,
  `articleTitle` varchar(30) NOT NULL,
  `label` bigint(20) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`articleID`),
  KEY `index_article_sender_id_337444d3_fk_index_person_personID` (`sender_id`),
  CONSTRAINT `index_article_sender_id_337444d3_fk_index_person_personID` FOREIGN KEY (`sender_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_article`
--

LOCK TABLES `index_article` WRITE;
/*!40000 ALTER TABLE `index_article` DISABLE KEYS */;
INSERT INTO `index_article` VALUES (1,'2018-07-06 09:04:50.375912','http://indexBobArticle.url','theBobarticle',1,1);
/*!40000 ALTER TABLE `index_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_articlecollection`
--

DROP TABLE IF EXISTS `index_articlecollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_articlecollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionArticle_id` int(11) NOT NULL,
  `collectionUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articlecollect_collectionArticle_id_57cac181_fk_index_art` (`collectionArticle_id`),
  KEY `index_articlecollect_collectionUser_id_91f92553_fk_index_per` (`collectionUser_id`),
  CONSTRAINT `index_articlecollect_collectionArticle_id_57cac181_fk_index_art` FOREIGN KEY (`collectionArticle_id`) REFERENCES `index_article` (`articleID`),
  CONSTRAINT `index_articlecollect_collectionUser_id_91f92553_fk_index_per` FOREIGN KEY (`collectionUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_articlecollection`
--

LOCK TABLES `index_articlecollection` WRITE;
/*!40000 ALTER TABLE `index_articlecollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_articlecollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_articlecomment`
--

DROP TABLE IF EXISTS `index_articlecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_articlecomment` (
  `articleCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentContent` varchar(466) NOT NULL,
  `commentTime` datetime(6) NOT NULL,
  `commentArticle_id` int(11) NOT NULL,
  `commentUser_id` int(11) NOT NULL,
  PRIMARY KEY (`articleCommentID`),
  KEY `index_articlecomment_commentArticle_id_f56b89f5_fk_index_art` (`commentArticle_id`),
  KEY `index_articlecomment_commentUser_id_d1ab2c87_fk_index_per` (`commentUser_id`),
  CONSTRAINT `index_articlecomment_commentArticle_id_f56b89f5_fk_index_art` FOREIGN KEY (`commentArticle_id`) REFERENCES `index_article` (`articleID`),
  CONSTRAINT `index_articlecomment_commentUser_id_d1ab2c87_fk_index_per` FOREIGN KEY (`commentUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_articlecomment`
--

LOCK TABLES `index_articlecomment` WRITE;
/*!40000 ALTER TABLE `index_articlecomment` DISABLE KEYS */;
INSERT INTO `index_articlecomment` VALUES (3,'hello wuyinge','2018-07-06 09:08:00.000000',1,1),(5,'1123','2018-07-06 09:21:00.000000',1,2),(6,'2333','2018-07-06 09:26:24.000000',1,1),(7,'我是渣渣辉','2018-07-06 09:26:48.000000',1,1);
/*!40000 ALTER TABLE `index_articlecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_articlerecommend`
--

DROP TABLE IF EXISTS `index_articlerecommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_articlerecommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommendArticle_id` int(11) NOT NULL,
  `recommendtUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articlerecomme_recommendArticle_id_826a7ee1_fk_index_art` (`recommendArticle_id`),
  KEY `index_articlerecomme_recommendtUser_id_5cc7f666_fk_index_per` (`recommendtUser_id`),
  CONSTRAINT `index_articlerecomme_recommendArticle_id_826a7ee1_fk_index_art` FOREIGN KEY (`recommendArticle_id`) REFERENCES `index_article` (`articleID`),
  CONSTRAINT `index_articlerecomme_recommendtUser_id_5cc7f666_fk_index_per` FOREIGN KEY (`recommendtUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_articlerecommend`
--

LOCK TABLES `index_articlerecommend` WRITE;
/*!40000 ALTER TABLE `index_articlerecommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_articlerecommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_articlethumbup`
--

DROP TABLE IF EXISTS `index_articlethumbup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_articlethumbup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `likeArticle_id` int(11) NOT NULL,
  `likeUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articlethumbup_likeArticle_id_f98fb43e_fk_index_art` (`likeArticle_id`),
  KEY `index_articlethumbup_likeUser_id_878a389f_fk_index_per` (`likeUser_id`),
  CONSTRAINT `index_articlethumbup_likeArticle_id_f98fb43e_fk_index_art` FOREIGN KEY (`likeArticle_id`) REFERENCES `index_article` (`articleID`),
  CONSTRAINT `index_articlethumbup_likeUser_id_878a389f_fk_index_per` FOREIGN KEY (`likeUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_articlethumbup`
--

LOCK TABLES `index_articlethumbup` WRITE;
/*!40000 ALTER TABLE `index_articlethumbup` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_articlethumbup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_dynamic`
--

DROP TABLE IF EXISTS `index_dynamic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_dynamic` (
  `dynamicID` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `createDate` datetime(6) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`dynamicID`),
  KEY `index_dynamic_sender_id_95d60bd2_fk_index_person_personID` (`sender_id`),
  CONSTRAINT `index_dynamic_sender_id_95d60bd2_fk_index_person_personID` FOREIGN KEY (`sender_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_dynamic`
--

LOCK TABLES `index_dynamic` WRITE;
/*!40000 ALTER TABLE `index_dynamic` DISABLE KEYS */;
INSERT INTO `index_dynamic` VALUES (1,'   \r\n                    laksjdklasjkldjakldjklawjkdlajlk','2018-07-05 15:33:04.977473',1),(2,'   \r\n                    １２３１２３','2018-07-05 17:00:27.073554',1),(3,'   \r\n                    乌蝇哥牛牪犇逼！','2018-07-05 17:01:16.202613',2),(4,'   \r\n                    213213213','2018-07-05 17:42:47.760123',2),(6,'1111111111111111111111111111','2018-07-06 08:12:38.184545',1),(7,'1123','2018-07-06 10:20:35.866364',1),(8,'2333','2018-07-06 10:24:00.673245',1);
/*!40000 ALTER TABLE `index_dynamic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_dynamiccomment`
--

DROP TABLE IF EXISTS `index_dynamiccomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_dynamiccomment` (
  `dynamicCommentID` int(11) NOT NULL AUTO_INCREMENT,
  `commentContent` varchar(466) NOT NULL,
  `commentTime` datetime(6) NOT NULL,
  `commentDynamic_id` int(11) NOT NULL,
  `commentUser_id` int(11) NOT NULL,
  PRIMARY KEY (`dynamicCommentID`),
  KEY `index_dynamiccomment_commentUser_id_fa4c4da3_fk_index_per` (`commentUser_id`),
  KEY `index_dynamiccomment_commentDynamic_id_3350e20a_fk_index_dyn` (`commentDynamic_id`),
  CONSTRAINT `index_dynamiccomment_commentDynamic_id_3350e20a_fk_index_dyn` FOREIGN KEY (`commentDynamic_id`) REFERENCES `index_dynamic` (`dynamicID`),
  CONSTRAINT `index_dynamiccomment_commentUser_id_fa4c4da3_fk_index_per` FOREIGN KEY (`commentUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_dynamiccomment`
--

LOCK TABLES `index_dynamiccomment` WRITE;
/*!40000 ALTER TABLE `index_dynamiccomment` DISABLE KEYS */;
INSERT INTO `index_dynamiccomment` VALUES (2,'1123','2018-07-06 10:53:00.000000',2,1),(3,'23333','2018-07-06 10:59:13.000000',1,1),(4,'123','2018-07-06 14:42:49.000000',1,1),(5,'111','2018-07-06 15:14:37.000000',1,1),(6,'222','2018-07-06 17:52:51.000000',1,1),(7,'123','2018-07-09 08:21:03.000000',1,1),(17,'test222211','2018-07-09 15:03:24.000000',1,1),(18,'123','2018-07-09 15:11:44.000000',1,1),(19,'test','2018-07-09 15:30:30.000000',1,1),(20,'fuck','2018-07-09 15:43:12.000000',6,1),(21,'12312321312321321321321321','2018-07-09 15:45:35.000000',6,1),(22,'213213','2018-07-09 15:55:28.000000',2,1),(23,'321','2018-07-09 15:55:40.000000',6,1),(24,'/fuck','2018-07-09 16:04:33.000000',6,1),(25,'我是渣渣辉','2018-07-09 16:04:52.000000',6,1);
/*!40000 ALTER TABLE `index_dynamiccomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_dynamicthumbup`
--

DROP TABLE IF EXISTS `index_dynamicthumbup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_dynamicthumbup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `likeDynamic_id` int(11) NOT NULL,
  `likeUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dynamicthumbup_likeDynamic_id_3fac889f_fk_index_dyn` (`likeDynamic_id`),
  KEY `index_dynamicthumbup_likeUser_id_a0860f53_fk_index_per` (`likeUser_id`),
  CONSTRAINT `index_dynamicthumbup_likeDynamic_id_3fac889f_fk_index_dyn` FOREIGN KEY (`likeDynamic_id`) REFERENCES `index_dynamic` (`dynamicID`),
  CONSTRAINT `index_dynamicthumbup_likeUser_id_a0860f53_fk_index_per` FOREIGN KEY (`likeUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_dynamicthumbup`
--

LOCK TABLES `index_dynamicthumbup` WRITE;
/*!40000 ALTER TABLE `index_dynamicthumbup` DISABLE KEYS */;
INSERT INTO `index_dynamicthumbup` VALUES (8,1,1),(9,2,1),(10,6,1),(11,7,1),(12,8,1);
/*!40000 ALTER TABLE `index_dynamicthumbup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_idea`
--

DROP TABLE IF EXISTS `index_idea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_idea` (
  `ideaID` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `createDate` datetime(6) NOT NULL,
  `label` bigint(20) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`ideaID`),
  KEY `index_idea_sender_id_3b79b31a_fk_index_person_personID` (`sender_id`),
  CONSTRAINT `index_idea_sender_id_3b79b31a_fk_index_person_personID` FOREIGN KEY (`sender_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_idea`
--

LOCK TABLES `index_idea` WRITE;
/*!40000 ALTER TABLE `index_idea` DISABLE KEYS */;
INSERT INTO `index_idea` VALUES (1,'2333333333333333','2018-07-06 08:13:00.000000',1,1),(2,'   \r\n                    322222222222222222123','2018-07-06 08:29:33.000000',18,1);
/*!40000 ALTER TABLE `index_idea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_ideacollection`
--

DROP TABLE IF EXISTS `index_ideacollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_ideacollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collectionIdea_id` int(11) NOT NULL,
  `collectionUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ideacollection_collectionIdea_id_aaae2b9f_fk_index_ide` (`collectionIdea_id`),
  KEY `index_ideacollection_collectionUser_id_d0df5e09_fk_index_per` (`collectionUser_id`),
  CONSTRAINT `index_ideacollection_collectionIdea_id_aaae2b9f_fk_index_ide` FOREIGN KEY (`collectionIdea_id`) REFERENCES `index_idea` (`ideaID`),
  CONSTRAINT `index_ideacollection_collectionUser_id_d0df5e09_fk_index_per` FOREIGN KEY (`collectionUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_ideacollection`
--

LOCK TABLES `index_ideacollection` WRITE;
/*!40000 ALTER TABLE `index_ideacollection` DISABLE KEYS */;
INSERT INTO `index_ideacollection` VALUES (1,1,1);
/*!40000 ALTER TABLE `index_ideacollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_idearecommend`
--

DROP TABLE IF EXISTS `index_idearecommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_idearecommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recommendIdea_id` int(11) NOT NULL,
  `recommendrecommendUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_idearecommend_recommendIdea_id_8ef1e1dd_fk_index_ide` (`recommendIdea_id`),
  KEY `index_idearecommend_recommendrecommendUs_c627661c_fk_index_per` (`recommendrecommendUser_id`),
  CONSTRAINT `index_idearecommend_recommendIdea_id_8ef1e1dd_fk_index_ide` FOREIGN KEY (`recommendIdea_id`) REFERENCES `index_idea` (`ideaID`),
  CONSTRAINT `index_idearecommend_recommendrecommendUs_c627661c_fk_index_per` FOREIGN KEY (`recommendrecommendUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_idearecommend`
--

LOCK TABLES `index_idearecommend` WRITE;
/*!40000 ALTER TABLE `index_idearecommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_idearecommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_ideathumbup`
--

DROP TABLE IF EXISTS `index_ideathumbup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_ideathumbup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `likeIdea_id` int(11) NOT NULL,
  `likeUser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ideathumbup_likeIdea_id_f697b25d_fk_index_idea_ideaID` (`likeIdea_id`),
  KEY `index_ideathumbup_likeUser_id_bd202910_fk_index_person_personID` (`likeUser_id`),
  CONSTRAINT `index_ideathumbup_likeIdea_id_f697b25d_fk_index_idea_ideaID` FOREIGN KEY (`likeIdea_id`) REFERENCES `index_idea` (`ideaID`),
  CONSTRAINT `index_ideathumbup_likeUser_id_bd202910_fk_index_person_personID` FOREIGN KEY (`likeUser_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_ideathumbup`
--

LOCK TABLES `index_ideathumbup` WRITE;
/*!40000 ALTER TABLE `index_ideathumbup` DISABLE KEYS */;
/*!40000 ALTER TABLE `index_ideathumbup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_person`
--

DROP TABLE IF EXISTS `index_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_person` (
  `personID` int(11) NOT NULL AUTO_INCREMENT,
  `personName` varchar(30) NOT NULL,
  `personPassword` varchar(128) NOT NULL,
  `personMobile` varchar(20) NOT NULL,
  `personEmail` varchar(50) NOT NULL,
  `personImage` varchar(100) NOT NULL,
  `personInfo` varchar(100) DEFAULT NULL,
  `personSex` varchar(5) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `enrollDate` datetime(6) NOT NULL,
  PRIMARY KEY (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_person`
--

LOCK TABLES `index_person` WRITE;
/*!40000 ALTER TABLE `index_person` DISABLE KEYS */;
INSERT INTO `index_person` VALUES (1,'Bob','pbkdf2_sha256$36000$lGz4mi6xR4J6$Fju0Mwf3VqvPeaCEMiVxP3vK09XokNJ7oZksXXf3feE=','112233','112233@qq.com','/imgstimg.jpeg','我是渣渣辉。',NULL,1,'2018-07-05 15:27:43.301432'),(2,'Linkcc','pbkdf2_sha256$36000$jKk53AP7npE6$He+4uqlXjheYW2c9xCSdGz9MJ7zrI0MsIV3jm6SmArc=','123456','123456@qq.com','/imgsPenguins.jpg','我是渣渣辉。',NULL,1,'2018-07-05 15:35:31.406771');
/*!40000 ALTER TABLE `index_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `index_personfollow`
--

DROP TABLE IF EXISTS `index_personfollow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `index_personfollow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followee_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_personfollow_followee_id_11f3af26_fk_index_person_personID` (`followee_id`),
  KEY `index_personfollow_follower_id_7e190929_fk_index_person_personID` (`follower_id`),
  CONSTRAINT `index_personfollow_followee_id_11f3af26_fk_index_person_personID` FOREIGN KEY (`followee_id`) REFERENCES `index_person` (`personID`),
  CONSTRAINT `index_personfollow_follower_id_7e190929_fk_index_person_personID` FOREIGN KEY (`follower_id`) REFERENCES `index_person` (`personID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `index_personfollow`
--

LOCK TABLES `index_personfollow` WRITE;
/*!40000 ALTER TABLE `index_personfollow` DISABLE KEYS */;
INSERT INTO `index_personfollow` VALUES (3,2,1),(4,1,2);
/*!40000 ALTER TABLE `index_personfollow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-09 16:26:19
