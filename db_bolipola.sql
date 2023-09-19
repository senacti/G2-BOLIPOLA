-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_bolipola
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) unsigned NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) unsigned NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (1,'Django',0,'Administración de Django',1,'',1,'#0C4B33','#F5DD5D','#44B78B','#FFFFFF','#C9F0DD','#44B78B','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#0C4B33','#0C3C26','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'','0.3','',1,'#E74C3C',1,1,1,'code',1,0,0,'#FFFFCC','#FFFFFF',100,400,1,'default-select',1,0,0,0,'#29B864',0,1,0,1),(2,'Bolipola',1,'BoliPola admin',1,'admin-interface/logo/logo.png',1,'#CB4335','#FBFCFC','#FBFCFC','#FFFFFF','#F1F1F1','#B23B2E','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#CB4335','#BABBBB','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'admin-interface/favicon/logo.png','0.3','',1,'#2BFF32',1,1,1,'code',1,0,0,'#DADBDB','#FFFFFF',70,400,1,'default-select',1,0,0,0,'#29B864',0,1,0,1);
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Theme',1,'add_theme'),(2,'Can change Theme',1,'change_theme'),(3,'Can delete Theme',1,'delete_theme'),(4,'Can view Theme',1,'view_theme'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Calendario',7,'add_calendar'),(26,'Can change Calendario',7,'change_calendar'),(27,'Can delete Calendario',7,'delete_calendar'),(28,'Can view Calendario',7,'view_calendar'),(29,'Can add Categoría',8,'add_category'),(30,'Can change Categoría',8,'change_category'),(31,'Can delete Categoría',8,'delete_category'),(32,'Can view Categoría',8,'view_category'),(33,'Can add Comentario',9,'add_comment'),(34,'Can change Comentario',9,'change_comment'),(35,'Can delete Comentario',9,'delete_comment'),(36,'Can view Comentario',9,'view_comment'),(37,'Can add Evento',10,'add_event'),(38,'Can change Evento',10,'change_event'),(39,'Can delete Evento',10,'delete_event'),(40,'Can view Evento',10,'view_event'),(41,'Can add Inventario',11,'add_inventory'),(42,'Can change Inventario',11,'change_inventory'),(43,'Can delete Inventario',11,'delete_inventory'),(44,'Can view Inventario',11,'view_inventory'),(45,'Can add Salida',12,'add_output'),(46,'Can change Salida',12,'change_output'),(47,'Can delete Salida',12,'delete_output'),(48,'Can view Salida',12,'view_output'),(49,'Can add Jugador',13,'add_player'),(50,'Can change Jugador',13,'change_player'),(51,'Can delete Jugador',13,'delete_player'),(52,'Can view Jugador',13,'view_player'),(53,'Can add Producto',14,'add_product'),(54,'Can change Producto',14,'change_product'),(55,'Can delete Producto',14,'delete_product'),(56,'Can view Producto',14,'view_product'),(57,'Can add Reserva',15,'add_reservation'),(58,'Can change Reserva',15,'change_reservation'),(59,'Can delete Reserva',15,'delete_reservation'),(60,'Can view Reserva',15,'view_reservation'),(61,'Can add Venta',16,'add_sale'),(62,'Can change Venta',16,'change_sale'),(63,'Can delete Venta',16,'delete_sale'),(64,'Can view Venta',16,'view_sale'),(65,'Can add Equipo',17,'add_team'),(66,'Can change Equipo',17,'change_team'),(67,'Can delete Equipo',17,'delete_team'),(68,'Can view Equipo',17,'view_team'),(69,'Can add Torneo',18,'add_tournament'),(70,'Can change Torneo',18,'change_tournament'),(71,'Can delete Torneo',18,'delete_tournament'),(72,'Can view Torneo',18,'view_tournament'),(73,'Can add Torneo y equipo',19,'add_tournamentteam'),(74,'Can change Torneo y equipo',19,'change_tournamentteam'),(75,'Can delete Torneo y equipo',19,'delete_tournamentteam'),(76,'Can view Torneo y equipo',19,'view_tournamentteam'),(77,'Can add user',20,'add_userboli'),(78,'Can change user',20,'change_userboli'),(79,'Can delete user',20,'delete_userboli'),(80,'Can view user',20,'view_userboli'),(81,'Can add Venta y torneo',21,'add_saletournament'),(82,'Can change Venta y torneo',21,'change_saletournament'),(83,'Can delete Venta y torneo',21,'delete_saletournament'),(84,'Can view Venta y torneo',21,'view_saletournament'),(85,'Can add Venta y reserva',22,'add_salereservation'),(86,'Can change Venta y reserva',22,'change_salereservation'),(87,'Can delete Venta y reserva',22,'delete_salereservation'),(88,'Can view Venta y reserva',22,'view_salereservation'),(89,'Can add Venta e inventario',23,'add_saleinventory'),(90,'Can change Venta e inventario',23,'change_saleinventory'),(91,'Can delete Venta e inventario',23,'delete_saleinventory'),(92,'Can view Venta e inventario',23,'view_saleinventory'),(93,'Can add Venta y evento',24,'add_saleevent'),(94,'Can change Venta y evento',24,'change_saleevent'),(95,'Can delete Venta y evento',24,'delete_saleevent'),(96,'Can view Venta y evento',24,'view_saleevent');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `forOlder` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` int(10) unsigned NOT NULL CHECK (`score` >= 0),
  `text` longtext NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_user_id_a50ac53c_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `comentario_user_id_a50ac53c_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
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
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-09-18 04:10:49.421570','2','Bolipola',1,'[{\"added\": {}}]',1,1),(2,'2023-09-18 13:50:20.024976','1','Torneo Bolipola',1,'[{\"added\": {}}]',18,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(1,'admin_interface','theme'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(7,'core','calendar'),(8,'core','category'),(9,'core','comment'),(10,'core','event'),(11,'core','inventory'),(12,'core','output'),(13,'core','player'),(14,'core','product'),(15,'core','reservation'),(16,'core','sale'),(24,'core','saleevent'),(23,'core','saleinventory'),(22,'core','salereservation'),(21,'core','saletournament'),(17,'core','team'),(18,'core','tournament'),(19,'core','tournamentteam'),(6,'sessions','session'),(20,'user','userboli');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-18 04:02:29.552109'),(2,'contenttypes','0002_remove_content_type_name','2023-09-18 04:02:30.343525'),(3,'auth','0001_initial','2023-09-18 04:02:34.285548'),(4,'auth','0002_alter_permission_name_max_length','2023-09-18 04:02:35.894732'),(5,'auth','0003_alter_user_email_max_length','2023-09-18 04:02:35.991884'),(6,'auth','0004_alter_user_username_opts','2023-09-18 04:02:36.064170'),(7,'auth','0005_alter_user_last_login_null','2023-09-18 04:02:36.095286'),(8,'auth','0006_require_contenttypes_0002','2023-09-18 04:02:36.160555'),(9,'auth','0007_alter_validators_add_error_messages','2023-09-18 04:02:36.270024'),(10,'auth','0008_alter_user_username_max_length','2023-09-18 04:02:36.370627'),(11,'auth','0009_alter_user_last_name_max_length','2023-09-18 04:02:36.554484'),(12,'auth','0010_alter_group_name_max_length','2023-09-18 04:02:36.962009'),(13,'auth','0011_update_proxy_permissions','2023-09-18 04:02:37.020227'),(14,'auth','0012_alter_user_first_name_max_length','2023-09-18 04:02:37.087559'),(15,'user','0001_initial','2023-09-18 04:02:41.193013'),(16,'admin','0001_initial','2023-09-18 04:02:44.184523'),(17,'admin','0002_logentry_remove_auto_add','2023-09-18 04:02:44.255874'),(18,'admin','0003_logentry_add_action_flag_choices','2023-09-18 04:02:44.286345'),(19,'admin_interface','0001_initial','2023-09-18 04:02:44.533745'),(20,'admin_interface','0002_add_related_modal','2023-09-18 04:02:45.038409'),(21,'admin_interface','0003_add_logo_color','2023-09-18 04:02:45.169046'),(22,'admin_interface','0004_rename_title_color','2023-09-18 04:02:45.275572'),(23,'admin_interface','0005_add_recent_actions_visible','2023-09-18 04:02:45.407276'),(24,'admin_interface','0006_bytes_to_str','2023-09-18 04:02:45.468608'),(25,'admin_interface','0007_add_favicon','2023-09-18 04:02:45.594795'),(26,'admin_interface','0008_change_related_modal_background_opacity_type','2023-09-18 04:02:45.840900'),(27,'admin_interface','0009_add_enviroment','2023-09-18 04:02:46.205082'),(28,'admin_interface','0010_add_localization','2023-09-18 04:02:46.249271'),(29,'admin_interface','0011_add_environment_options','2023-09-18 04:02:46.830469'),(30,'admin_interface','0012_update_verbose_names','2023-09-18 04:02:46.869902'),(31,'admin_interface','0013_add_related_modal_close_button','2023-09-18 04:02:47.092789'),(32,'admin_interface','0014_name_unique','2023-09-18 04:02:47.350980'),(33,'admin_interface','0015_add_language_chooser_active','2023-09-18 04:02:47.505662'),(34,'admin_interface','0016_add_language_chooser_display','2023-09-18 04:02:47.911285'),(35,'admin_interface','0017_change_list_filter_dropdown','2023-09-18 04:02:47.977515'),(36,'admin_interface','0018_theme_list_filter_sticky','2023-09-18 04:02:48.351512'),(37,'admin_interface','0019_add_form_sticky','2023-09-18 04:02:48.643359'),(38,'admin_interface','0020_module_selected_colors','2023-09-18 04:02:49.201206'),(39,'admin_interface','0021_file_extension_validator','2023-09-18 04:02:49.352794'),(40,'admin_interface','0022_add_logo_max_width_and_height','2023-09-18 04:02:49.611098'),(41,'admin_interface','0023_theme_foldable_apps','2023-09-18 04:02:49.741915'),(42,'admin_interface','0024_remove_theme_css','2023-09-18 04:02:49.842382'),(43,'admin_interface','0025_theme_language_chooser_control','2023-09-18 04:02:50.213036'),(44,'admin_interface','0026_theme_list_filter_highlight','2023-09-18 04:02:50.495861'),(45,'admin_interface','0027_theme_list_filter_removal_links','2023-09-18 04:02:50.616717'),(46,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2023-09-18 04:02:50.842905'),(47,'admin_interface','0029_theme_css_generic_link_active_color','2023-09-18 04:02:51.002849'),(48,'admin_interface','0030_theme_collapsible_stacked_inlines_and_more','2023-09-18 04:02:51.793800'),(49,'core','0001_initial','2023-09-18 04:02:58.832757'),(50,'core','0002_initial','2023-09-18 04:03:20.480896'),(51,'sessions','0001_initial','2023-09-18 04:03:21.156150'),(52,'core','0003_tournament_active','2023-09-18 13:27:22.136214'),(53,'core','0004_alter_tournament_number_teams_and_more','2023-09-18 13:42:01.503216'),(54,'core','0005_remove_sale_discount_remove_sale_total_discount','2023-09-18 14:02:49.577940'),(55,'core','0006_sale_name','2023-09-18 14:26:07.450636'),(56,'core','0007_remove_sale_name','2023-09-18 16:19:34.153833'),(57,'core','0002_rename_registration_cost_tournament_cost','2023-09-18 21:11:06.431411'),(58,'core','0003_alter_sale_status','2023-09-18 21:42:28.859695'),(59,'core','0004_alter_sale_inventory','2023-09-18 23:58:47.911653'),(60,'core','0002_alter_inventory_entry_date_alter_output_output_date_and_more','2023-09-19 01:03:21.722776'),(61,'core','0003_alter_inventory_entry_date_alter_output_output_date_and_more','2023-09-19 01:11:49.998548'),(62,'core','0004_alter_inventory_entry_date_alter_output_output_date_and_more','2023-09-19 01:34:52.292329'),(63,'core','0005_alter_inventory_entry_date_alter_output_output_date_and_more','2023-09-19 01:46:04.548899'),(64,'core','0006_alter_inventory_entry_date_alter_output_output_date_and_more','2023-09-19 01:49:21.075484');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8x1cilopkkm28katf7e5uktanr8ctmh4','.eJxVjDsOwjAQBe_iGlns2ma9lPQ5g7X-gAPIkeKkQtwdIqWA9s3Me6kg61LD2sscxqzOCtXhd4uSHqVtIN-l3SadprbMY9Sbonfa9TDl8rzs7t9BlV6_NdhoCBMnB-wNHwt4dsycAawFErZkKYskMgXwilIEEClFjxZP6NT7A62mNog:1qiMlQ:IkE97wBocJmT1l2nwItQ6P5gep3RGGV3QeohqLhYqRE','2023-10-02 22:30:44.400468');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `color` varchar(20) NOT NULL,
  `players_num` int(10) unsigned NOT NULL CHECK (`players_num` >= 0),
  `avatar` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo_user_id_6697ca39_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `equipo_user_id_6697ca39_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Leones pro','Amarillo',2,'team_avatar/miFotoDeGit.jpg',2),(2,'Maria\'s team','Morado',1,'group.png',3);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `cost` double NOT NULL,
  `guests` int(10) unsigned NOT NULL CHECK (`guests` >= 0),
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entry_date` datetime(6) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL CHECK (`product_quantity` >= 0),
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventario_product_id_a1edc06a_fk_producto_id` (`product_id`),
  CONSTRAINT `inventario_product_id_a1edc06a_fk_producto_id` FOREIGN KEY (`product_id`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dorsal` bigint(20) unsigned NOT NULL CHECK (`dorsal` >= 0),
  `age` int(10) unsigned NOT NULL CHECK (`age` >= 0),
  `gender` varchar(50) NOT NULL,
  `position` varchar(60) NOT NULL,
  `yellow_card` int(11) NOT NULL,
  `blue_card` int(11) NOT NULL,
  `red_card` int(11) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jugador_team_id_ade94278_fk_equipo_id` (`team_id`),
  CONSTRAINT `jugador_team_id_ade94278_fk_equipo_id` FOREIGN KEY (`team_id`) REFERENCES `equipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Juan','Ochoa',19,17,'Masculino','Delantero',0,0,0,1),(2,'Julián','Gómez',11,24,'Masculino','Portero',0,0,0,1),(3,'Juanita','Molana',15,19,'Femenino','Centrocampista',0,0,0,2);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cost` double NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `due_date` date NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_category_id_d39dad7c_fk_categoria_id` (`category_id`),
  CONSTRAINT `producto_category_id_d39dad7c_fk_categoria_id` FOREIGN KEY (`category_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `availability` tinyint(1) NOT NULL,
  `place` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `cost` double NOT NULL,
  `calendar_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_calendar_id_0e77bd6e_fk_calendario_id` (`calendar_id`),
  CONSTRAINT `reserva_calendar_id_0e77bd6e_fk_calendario_id` FOREIGN KEY (`calendar_id`) REFERENCES `calendario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `output_date` datetime(6) NOT NULL,
  `product_quantity_out` int(10) unsigned NOT NULL CHECK (`product_quantity_out` >= 0),
  `inventory_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salida_inventory_id_3d569ade_fk_inventario_id` (`inventory_id`),
  CONSTRAINT `salida_inventory_id_3d569ade_fk_inventario_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `number_teams` int(10) unsigned NOT NULL CHECK (`number_teams` >= 0),
  `registered_teams` int(10) unsigned NOT NULL CHECK (`registered_teams` >= 0),
  `date` datetime(6) NOT NULL,
  `prize_payment` double NOT NULL,
  `cost` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES (1,'Torneo Bolipola',16,0,'2024-12-12 12:00:00.000000',5000000,200000,1);
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo_equipo`
--

DROP TABLE IF EXISTS `torneo_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneo_equipo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goals_for` int(11) NOT NULL,
  `goals_against` int(11) NOT NULL,
  `goals_diff` int(11) NOT NULL,
  `games_tied` int(11) NOT NULL,
  `games_won` int(11) NOT NULL,
  `games_lost` int(11) NOT NULL,
  `games_played` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `tournament_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `torneo_equipo_team_id_aff5ce69_fk_equipo_id` (`team_id`),
  KEY `torneo_equipo_tournament_id_2a153cdb_fk_torneo_id` (`tournament_id`),
  CONSTRAINT `torneo_equipo_team_id_aff5ce69_fk_equipo_id` FOREIGN KEY (`team_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `torneo_equipo_tournament_id_2a153cdb_fk_torneo_id` FOREIGN KEY (`tournament_id`) REFERENCES `torneo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo_equipo`
--

LOCK TABLES `torneo_equipo` WRITE;
/*!40000 ALTER TABLE `torneo_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `torneo_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userboli`
--

DROP TABLE IF EXISTS `user_userboli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userboli` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `range` int(10) unsigned NOT NULL CHECK (`range` >= 0),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userboli`
--

LOCK TABLES `user_userboli` WRITE;
/*!40000 ALTER TABLE `user_userboli` DISABLE KEYS */;
INSERT INTO `user_userboli` VALUES (1,'pbkdf2_sha256$600000$i762hqy2ckcb9g4EKvS5u2$l/JivSr81q3uLw2RKRNzvi9BSsR4YkscmN20XVJlK8s=','2023-09-18 22:29:43.872226',1,'admin@admin.com','Juanjo','Ochoa',1,1,'2023-09-18 04:04:00.696989','admin@admin.com','avatar/miFotoDeGit.jpg','2005-12-14','3111234567','Masculino',0),(2,'pbkdf2_sha256$600000$dm1naVl76cJ2xesJ8OzfwI$8XZwefJG4o9FlYFHCMU5Q53gZ4h98yTcThi9Zm6RL1g=','2023-09-18 22:30:44.358430',0,'calisto@hotmail.com','Eduardo','Calisto',0,1,'2023-09-18 04:12:09.778209','calisto@hotmail.com','avatar/anImage.jpg','2000-08-09','8723411316','Otro',0),(3,'pbkdf2_sha256$600000$wBsJ11HtC6n5dybGM5qz6f$byJpydm5CcTl1wH/gS79VfNGy0/aSOCk1/dYuGBsxBQ=','2023-09-18 06:06:45.739453',0,'sopa@gmail.com','María','Ibañez',0,1,'2023-09-18 05:57:26.603003','sopa@gmail.com','avatar/pensando.png','1998-12-12','6545645465','Femenino',0);
/*!40000 ALTER TABLE `user_userboli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userboli_groups`
--

DROP TABLE IF EXISTS `user_userboli_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userboli_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userboli_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userboli_groups_userboli_id_group_id_a1fadfcc_uniq` (`userboli_id`,`group_id`),
  KEY `user_userboli_groups_group_id_c57ab420_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_userboli_groups_group_id_c57ab420_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_userboli_groups_userboli_id_3cbe31ac_fk_user_userboli_id` FOREIGN KEY (`userboli_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userboli_groups`
--

LOCK TABLES `user_userboli_groups` WRITE;
/*!40000 ALTER TABLE `user_userboli_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userboli_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userboli_user_permissions`
--

DROP TABLE IF EXISTS `user_userboli_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userboli_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userboli_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_userboli_user_permi_userboli_id_permission_i_046faf5d_uniq` (`userboli_id`,`permission_id`),
  KEY `user_userboli_user_p_permission_id_b052ddf3_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_userboli_user_p_permission_id_b052ddf3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_userboli_user_p_userboli_id_0c75c885_fk_user_user` FOREIGN KEY (`userboli_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userboli_user_permissions`
--

LOCK TABLES `user_userboli_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_userboli_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userboli_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_cost` double NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `type` varchar(50) NOT NULL,
  `product_quantity` int(10) unsigned NOT NULL CHECK (`product_quantity` >= 0),
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_user_id_9f98c281_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `venta_user_id_9f98c281_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (10,200000,'Efectivo','En proceso...','2023-09-18 20:53:46.153024','Torneo',1,2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_evento`
--

DROP TABLE IF EXISTS `venta_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_evento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_evento`
--

LOCK TABLES `venta_evento` WRITE;
/*!40000 ALTER TABLE `venta_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_inventario`
--

DROP TABLE IF EXISTS `venta_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_inventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `inventory_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_inventario`
--

LOCK TABLES `venta_inventario` WRITE;
/*!40000 ALTER TABLE `venta_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_reserva`
--

DROP TABLE IF EXISTS `venta_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_reserva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reservation_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_reserva`
--

LOCK TABLES `venta_reserva` WRITE;
/*!40000 ALTER TABLE `venta_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_torneo`
--

DROP TABLE IF EXISTS `venta_torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_torneo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) NOT NULL,
  `tournament_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_torneo`
--

LOCK TABLES `venta_torneo` WRITE;
/*!40000 ALTER TABLE `venta_torneo` DISABLE KEYS */;
INSERT INTO `venta_torneo` VALUES (9,10,1);
/*!40000 ALTER TABLE `venta_torneo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-18 21:08:42
