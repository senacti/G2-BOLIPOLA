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
  `logo_max_height` smallint(5) unsigned NOT NULL,
  `logo_max_width` smallint(5) unsigned NOT NULL,
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
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`),
  CONSTRAINT `admin_interface_theme_chk_1` CHECK (`logo_max_height` >= 0),
  CONSTRAINT `admin_interface_theme_chk_2` CHECK (`logo_max_width` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (1,'Django',0,'Administración de Django',1,'',1,'#0C4B33','#F5DD5D','#44B78B','#FFFFFF','#C9F0DD','#44B78B','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#0C4B33','#0C3C26','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'','0.3','',1,'#E74C3C',1,1,1,'code',1,0,0,'#FFFFCC','#FFFFFF',100,400,1,'default-select',1,0,0,0,'#29B864',0,1,0,1),(2,'BoliPola',1,'Bolipola Admin',1,'admin-interface/logo/logo_dB2Zd3S.png',1,'#CB4335','#FBFCFC','#FBFCFC','#FFFFFF','#F1F1F1','#B23B2E','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0C3C26','#156641','#CB4335','#BABBBB','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'admin-interface/favicon/logo_20tSYhH.png','0.3','',1,'#2BFF32',1,1,1,'code',1,0,0,'#DADBDB','#FFFFFF',100,400,1,'default-select',1,0,0,0,'#29B864',0,1,0,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Theme',1,'add_theme'),(2,'Can change Theme',1,'change_theme'),(3,'Can delete Theme',1,'delete_theme'),(4,'Can view Theme',1,'view_theme'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Calendario',7,'add_calendar'),(26,'Can change Calendario',7,'change_calendar'),(27,'Can delete Calendario',7,'delete_calendar'),(28,'Can view Calendario',7,'view_calendar'),(29,'Can add Categoría',8,'add_category'),(30,'Can change Categoría',8,'change_category'),(31,'Can delete Categoría',8,'delete_category'),(32,'Can view Categoría',8,'view_category'),(33,'Can add Comentario',9,'add_comment'),(34,'Can change Comentario',9,'change_comment'),(35,'Can delete Comentario',9,'delete_comment'),(36,'Can view Comentario',9,'view_comment'),(37,'Can add Evento',10,'add_event'),(38,'Can change Evento',10,'change_event'),(39,'Can delete Evento',10,'delete_event'),(40,'Can view Evento',10,'view_event'),(41,'Can add Inventario',11,'add_inventory'),(42,'Can change Inventario',11,'change_inventory'),(43,'Can delete Inventario',11,'delete_inventory'),(44,'Can view Inventario',11,'view_inventory'),(45,'Can add Salida',12,'add_output'),(46,'Can change Salida',12,'change_output'),(47,'Can delete Salida',12,'delete_output'),(48,'Can view Salida',12,'view_output'),(49,'Can add Jugador',13,'add_player'),(50,'Can change Jugador',13,'change_player'),(51,'Can delete Jugador',13,'delete_player'),(52,'Can view Jugador',13,'view_player'),(53,'Can add Producto',14,'add_product'),(54,'Can change Producto',14,'change_product'),(55,'Can delete Producto',14,'delete_product'),(56,'Can view Producto',14,'view_product'),(57,'Can add Reserva',15,'add_reservation'),(58,'Can change Reserva',15,'change_reservation'),(59,'Can delete Reserva',15,'delete_reservation'),(60,'Can view Reserva',15,'view_reservation'),(61,'Can add Venta',16,'add_sale'),(62,'Can change Venta',16,'change_sale'),(63,'Can delete Venta',16,'delete_sale'),(64,'Can view Venta',16,'view_sale'),(65,'Can add Venta y evento',17,'add_saleevent'),(66,'Can change Venta y evento',17,'change_saleevent'),(67,'Can delete Venta y evento',17,'delete_saleevent'),(68,'Can view Venta y evento',17,'view_saleevent'),(69,'Can add Venta e inventario',18,'add_saleinventory'),(70,'Can change Venta e inventario',18,'change_saleinventory'),(71,'Can delete Venta e inventario',18,'delete_saleinventory'),(72,'Can view Venta e inventario',18,'view_saleinventory'),(73,'Can add Venta y reserva',19,'add_salereservation'),(74,'Can change Venta y reserva',19,'change_salereservation'),(75,'Can delete Venta y reserva',19,'delete_salereservation'),(76,'Can view Venta y reserva',19,'view_salereservation'),(77,'Can add Venta y torneo',20,'add_saletournament'),(78,'Can change Venta y torneo',20,'change_saletournament'),(79,'Can delete Venta y torneo',20,'delete_saletournament'),(80,'Can view Venta y torneo',20,'view_saletournament'),(81,'Can add Equipo',21,'add_team'),(82,'Can change Equipo',21,'change_team'),(83,'Can delete Equipo',21,'delete_team'),(84,'Can view Equipo',21,'view_team'),(85,'Can add Torneo',22,'add_tournament'),(86,'Can change Torneo',22,'change_tournament'),(87,'Can delete Torneo',22,'delete_tournament'),(88,'Can view Torneo',22,'view_tournament'),(89,'Can add Torneo y equipo',23,'add_tournamentteam'),(90,'Can change Torneo y equipo',23,'change_tournamentteam'),(91,'Can delete Torneo y equipo',23,'delete_tournamentteam'),(92,'Can view Torneo y equipo',23,'view_tournamentteam'),(93,'Can add user',24,'add_userboli'),(94,'Can change user',24,'change_userboli'),(95,'Can delete user',24,'delete_userboli'),(96,'Can view user',24,'view_userboli'),(97,'Can add Carrito',25,'add_car'),(98,'Can change Carrito',25,'change_car'),(99,'Can delete Carrito',25,'delete_car'),(100,'Can view Carrito',25,'view_car'),(101,'Can add Carrito e inventario',26,'add_carinventory'),(102,'Can change Carrito e inventario',26,'change_carinventory'),(103,'Can delete Carrito e inventario',26,'delete_carinventory'),(104,'Can view Carrito e inventario',26,'view_carinventory'),(105,'Can add Venta y carrito',27,'add_salecar'),(106,'Can change Venta y carrito',27,'change_salecar'),(107,'Can delete Venta y carrito',27,'delete_salecar'),(108,'Can view Venta y carrito',27,'view_salecar'),(109,'Can add Entrada',28,'add_entry'),(110,'Can change Entrada',28,'change_entry'),(111,'Can delete Entrada',28,'delete_entry'),(112,'Can view Entrada',28,'view_entry'),(113,'Can add Like',29,'add_like'),(114,'Can change Like',29,'change_like'),(115,'Can delete Like',29,'delete_like'),(116,'Can view Like',29,'view_like');
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
  `date` date NOT NULL,
  `availability` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,'2023-09-24',0);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_products` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cost` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carrito_user_id_f2eb18ff_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `carrito_user_id_f2eb18ff_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`),
  CONSTRAINT `carrito_chk_1` CHECK (`total_products` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,0,1,0,2),(2,4,0,60000,4),(3,5,0,75000,4),(4,2,0,30000,4),(5,1,0,15000,4),(6,0,1,0,4);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_inventario`
--

DROP TABLE IF EXISTS `carrito_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito_inventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_id` bigint(20) NOT NULL,
  `inventory_id` bigint(20) NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `carrito_inventario_car_id_11d06df3_fk_carrito_id` (`car_id`),
  KEY `carrito_inventario_inventory_id_6f91f89b_fk_inventario_id` (`inventory_id`),
  CONSTRAINT `carrito_inventario_car_id_11d06df3_fk_carrito_id` FOREIGN KEY (`car_id`) REFERENCES `carrito` (`id`),
  CONSTRAINT `carrito_inventario_inventory_id_6f91f89b_fk_inventario_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventario` (`id`),
  CONSTRAINT `carrito_inventario_chk_1` CHECK (`quantity` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_inventario`
--

LOCK TABLES `carrito_inventario` WRITE;
/*!40000 ALTER TABLE `carrito_inventario` DISABLE KEYS */;
INSERT INTO `carrito_inventario` VALUES (3,2,2,5),(4,3,2,5),(5,4,2,2),(6,5,2,1);
/*!40000 ALTER TABLE `carrito_inventario` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'A',0),(2,'Alcohol',1),(3,'Paquetes',0),(4,'Cigarros',1),(5,'Bebidas',0);
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
  `score` int(10) unsigned NOT NULL,
  `text` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_user_id_a50ac53c_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `comentario_user_id_a50ac53c_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`),
  CONSTRAINT `comentario_chk_1` CHECK (`score` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (3,1,'Buen servicio','2023-11-26 19:31:11.209873',4),(5,0,'Genial esto','2023-11-26 20:29:25.291432',2),(6,2,'Me encanta','2023-11-26 20:31:23.854930',2);
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
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-09-21 21:54:54.587056','1','Pelea de pollos',1,'[{\"added\": {}}]',22,1),(2,'2023-09-22 01:48:43.981596','2','Duendes navideños',1,'[{\"added\": {}}]',22,1),(3,'2023-09-22 13:48:07.814288','2','BoliPola',1,'[{\"added\": {}}]',1,1),(4,'2023-09-22 15:04:55.752191','1','False - 2023-09-24',1,'[{\"added\": {}}]',7,1),(5,'2023-09-22 15:14:54.470428','3','Sena',1,'[{\"added\": {}}]',22,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(1,'admin_interface','theme'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(7,'core','calendar'),(25,'core','car'),(26,'core','carinventory'),(8,'core','category'),(9,'core','comment'),(28,'core','entry'),(10,'core','event'),(11,'core','inventory'),(29,'core','like'),(12,'core','output'),(13,'core','player'),(14,'core','product'),(15,'core','reservation'),(16,'core','sale'),(27,'core','salecar'),(17,'core','saleevent'),(18,'core','saleinventory'),(19,'core','salereservation'),(20,'core','saletournament'),(21,'core','team'),(22,'core','tournament'),(23,'core','tournamentteam'),(6,'sessions','session'),(24,'user','userboli');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-09-21 21:43:10.605045'),(2,'contenttypes','0002_remove_content_type_name','2023-09-21 21:43:11.638856'),(3,'auth','0001_initial','2023-09-21 21:43:16.971088'),(4,'auth','0002_alter_permission_name_max_length','2023-09-21 21:43:18.045787'),(5,'auth','0003_alter_user_email_max_length','2023-09-21 21:43:18.097834'),(6,'auth','0004_alter_user_username_opts','2023-09-21 21:43:18.138872'),(7,'auth','0005_alter_user_last_login_null','2023-09-21 21:43:18.180910'),(8,'auth','0006_require_contenttypes_0002','2023-09-21 21:43:18.220947'),(9,'auth','0007_alter_validators_add_error_messages','2023-09-21 21:43:18.323039'),(10,'auth','0008_alter_user_username_max_length','2023-09-21 21:43:18.364076'),(11,'auth','0009_alter_user_last_name_max_length','2023-09-21 21:43:18.407115'),(12,'auth','0010_alter_group_name_max_length','2023-09-21 21:43:18.538002'),(13,'auth','0011_update_proxy_permissions','2023-09-21 21:43:18.581041'),(14,'auth','0012_alter_user_first_name_max_length','2023-09-21 21:43:18.622079'),(15,'user','0001_initial','2023-09-21 21:43:23.837394'),(16,'admin','0001_initial','2023-09-21 21:43:25.628516'),(17,'admin','0002_logentry_remove_auto_add','2023-09-21 21:43:25.673550'),(18,'admin','0003_logentry_add_action_flag_choices','2023-09-21 21:43:25.799665'),(19,'admin_interface','0001_initial','2023-09-21 21:43:26.186075'),(20,'admin_interface','0002_add_related_modal','2023-09-21 21:43:26.741647'),(21,'admin_interface','0003_add_logo_color','2023-09-21 21:43:26.879772'),(22,'admin_interface','0004_rename_title_color','2023-09-21 21:43:27.295069'),(23,'admin_interface','0005_add_recent_actions_visible','2023-09-21 21:43:27.866564'),(24,'admin_interface','0006_bytes_to_str','2023-09-21 21:43:27.936628'),(25,'admin_interface','0007_add_favicon','2023-09-21 21:43:28.232896'),(26,'admin_interface','0008_change_related_modal_background_opacity_type','2023-09-21 21:43:28.487965'),(27,'admin_interface','0009_add_enviroment','2023-09-21 21:43:28.964441'),(28,'admin_interface','0010_add_localization','2023-09-21 21:43:29.069302'),(29,'admin_interface','0011_add_environment_options','2023-09-21 21:43:29.743236'),(30,'admin_interface','0012_update_verbose_names','2023-09-21 21:43:29.780235'),(31,'admin_interface','0013_add_related_modal_close_button','2023-09-21 21:43:30.172236'),(32,'admin_interface','0014_name_unique','2023-09-21 21:43:30.527672'),(33,'admin_interface','0015_add_language_chooser_active','2023-09-21 21:43:30.686816'),(34,'admin_interface','0016_add_language_chooser_display','2023-09-21 21:43:30.825809'),(35,'admin_interface','0017_change_list_filter_dropdown','2023-09-21 21:43:30.863262'),(36,'admin_interface','0018_theme_list_filter_sticky','2023-09-21 21:43:31.001387'),(37,'admin_interface','0019_add_form_sticky','2023-09-21 21:43:31.430929'),(38,'admin_interface','0020_module_selected_colors','2023-09-21 21:43:31.698171'),(39,'admin_interface','0021_file_extension_validator','2023-09-21 21:43:31.738208'),(40,'admin_interface','0022_add_logo_max_width_and_height','2023-09-21 21:43:32.017034'),(41,'admin_interface','0023_theme_foldable_apps','2023-09-21 21:43:32.238234'),(42,'admin_interface','0024_remove_theme_css','2023-09-21 21:43:32.336324'),(43,'admin_interface','0025_theme_language_chooser_control','2023-09-21 21:43:32.545496'),(44,'admin_interface','0026_theme_list_filter_highlight','2023-09-21 21:43:32.680619'),(45,'admin_interface','0027_theme_list_filter_removal_links','2023-09-21 21:43:32.830755'),(46,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2023-09-21 21:43:33.084398'),(47,'admin_interface','0029_theme_css_generic_link_active_color','2023-09-21 21:43:33.317610'),(48,'admin_interface','0030_theme_collapsible_stacked_inlines_and_more','2023-09-21 21:43:33.847595'),(49,'core','0001_initial','2023-09-21 21:43:42.527992'),(50,'core','0002_initial','2023-09-21 21:44:01.942249'),(51,'sessions','0001_initial','2023-09-21 21:44:02.758885'),(52,'core','0003_carinventory_quantity_inventory_quantity_reserved','2023-10-20 00:25:43.699254'),(53,'core','0002_remove_inventory_disabled','2023-10-30 14:12:37.615624'),(54,'core','0003_inventory_disabled','2023-10-30 14:12:37.637102'),(55,'core','0004_remove_output_output_date','2023-10-30 14:13:56.330179'),(56,'core','0005_output_output_date','2023-10-30 14:14:28.539507'),(57,'core','0006_output_inventory_output_product_quantity_out','2023-10-30 14:17:22.279482'),(58,'core','0002_remove_output_car','2023-10-30 14:32:06.032981'),(59,'core','0003_output_car','2023-10-30 14:32:24.876814'),(60,'core','0004_entry','2023-11-01 20:17:24.293227'),(61,'core','0005_rename_output_date_output_date_remove_output_car_and_more','2023-11-01 20:17:30.168534'),(62,'core','0006_remove_output_individual_cost_output_car','2023-11-01 20:17:31.120977'),(63,'core','0007_remove_entry_individual_cost','2023-11-01 20:17:31.283942'),(64,'core','0008_remove_entry_cost','2023-11-01 20:36:45.974309'),(65,'core','0009_remove_output_cost','2023-11-02 10:27:19.763508'),(66,'core','0010_alter_comment_date_alter_comment_score_and_more','2023-11-26 18:10:17.055797'),(67,'core','0011_alter_like_options_alter_comment_text','2023-11-26 19:27:47.815991'),(68,'core','0012_alter_comment_date','2023-11-26 19:31:01.713800');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6c3cop7e2rc1gp1u2z6mm6ifvn4ikydq','.eJxVjEEOwiAQRe_C2pCxZYC4dO8ZyDADUjWQlHbVeHdt0oVu_3vvbyrQupSw9jSHSdRFGXX63SLxM9UdyIPqvWludZmnqHdFH7TrW5P0uh7u30GhXr51pjOIgJjRZ0wmDeOAhJSBs0QGFIiCZHEEF9FZQOOBJSfHPltiUu8PA3k42w:1qjmYc:Y_33CIOAGHWGvMAoNoUNrnm1egaBtimjjac2piasmGo','2023-10-06 15:15:22.621705');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `total_products` int(10) unsigned NOT NULL CHECK (`total_products` >= 0),
  `inventory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entrada_inventory_id_e0e9ba00_fk_inventario_id` (`inventory_id`),
  CONSTRAINT `entrada_inventory_id_e0e9ba00_fk_inventario_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (2,'2023-11-01 20:37:30.951874',1,5);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
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
  `players_num` int(10) unsigned NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipo_user_id_6697ca39_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `equipo_user_id_6697ca39_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`),
  CONSTRAINT `equipo_chk_1` CHECK (`players_num` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Los diomedez','Rojo',12,'team_avatar/eliminar.png',2),(2,'Mario y los luigis','Verde',15,'team_avatar/marioteam.jpeg',6),(3,'julian','Azul',0,'group.png',10),(4,'Gallinas ciegas','Amarillo',2,'team_avatar/fondo.jpg',4);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
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
  `product_quantity` int(10) unsigned NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity_reserved` int(10) unsigned NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `inventario_product_id_a1edc06a_fk_producto_id` (`product_id`),
  CONSTRAINT `inventario_product_id_a1edc06a_fk_producto_id` FOREIGN KEY (`product_id`) REFERENCES `producto` (`id`),
  CONSTRAINT `inventario_chk_1` CHECK (`product_quantity` >= 0),
  CONSTRAINT `inventario_chk_2` CHECK (`quantity_reserved` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,'2023-09-21 21:51:55.087442',25,1,0,0),(2,'2023-09-21 21:53:24.062129',2,2,1,0),(4,'2023-09-22 01:31:40.004380',10,4,0,0),(5,'2023-09-22 01:33:53.717422',42,5,0,0),(6,'2023-09-22 01:35:35.698512',18,6,0,0),(7,'2023-09-22 01:37:38.221147',5,7,0,0),(9,'2023-11-03 00:12:56.519169',0,9,0,0);
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
  `dorsal` bigint(20) unsigned NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `gender` varchar(50) NOT NULL,
  `position` varchar(60) NOT NULL,
  `yellow_card` int(11) NOT NULL,
  `blue_card` int(11) NOT NULL,
  `red_card` int(11) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jugador_team_id_ade94278_fk_equipo_id` (`team_id`),
  CONSTRAINT `jugador_team_id_ade94278_fk_equipo_id` FOREIGN KEY (`team_id`) REFERENCES `equipo` (`id`),
  CONSTRAINT `jugador_chk_1` CHECK (`dorsal` >= 0),
  CONSTRAINT `jugador_chk_2` CHECK (`age` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Juan','Ochoa',14,17,'Masculino','Centrocampista',0,0,0,2),(2,'Marisol','Gomex',12,19,'Otro','Defensa',0,0,0,2),(3,'Cachaco','Peñazco',19,15,'Masculino','Portero',0,0,0,2),(4,'Miguel','Kika',13,25,'Masculino','Delantero',0,0,0,2),(5,'Luis','Ibañez',24,19,'Masculino','Defensa',0,0,0,2),(6,'Carolina','Ñuñez',99,32,'Femenino','Delantero',0,0,0,2),(7,'Julián','Bernardo',7,17,'Masculino','Defensa',0,0,0,2),(8,'Dragui','Sao',32,24,'Otro','Delantero',0,0,0,2),(9,'Felipe','Mendoza',1,54,'Masculino','Delantero',0,0,0,2),(10,'Maria','Basquez',76,18,'Femenino','Centrocampista',0,0,0,2),(11,'Mario','Volador',8,13,'Otro','Centrocampista',0,0,0,2),(12,'Miguel','Pulido',65,19,'Masculino','Defensa',0,0,0,2),(13,'Diego','Perez',4,16,'Masculino','Portero',0,0,0,2),(14,'Camilo','Hernesto',45,45,'Masculino','Centrocampista',0,0,0,2),(15,'Vichado','Ñunez',98,27,'Masculino','Defensa',0,0,0,2),(17,'Juan','Ochoa',14,17,'Masculino','Centrocampista',0,0,0,1),(18,'Marisol','Gomex',12,19,'Otro','Defensa',0,0,0,1),(19,'Cachaco','Peñazco',19,15,'Masculino','Portero',0,0,0,1),(20,'Miguel','Kika',13,25,'Masculino','Delantero',0,0,0,1),(21,'Luis','Ibañez',24,19,'Masculino','Defensa',0,0,0,1),(22,'Carolina','Ñuñez',99,32,'Femenino','Delantero',0,0,0,1),(23,'Julián','Bernardo',7,17,'Masculino','Defensa',0,0,0,1),(24,'Dragui','Sao',32,24,'Otro','Delantero',0,0,0,1),(25,'Felipe','Mendoza',1,54,'Masculino','Delantero',0,0,0,1),(26,'Maria','Basquez',76,18,'Femenino','Centrocampista',0,0,0,1),(27,'Mario','Volador',8,13,'Otro','Centrocampista',0,0,0,1),(28,'Miguel','Pulido',65,19,'Masculino','Defensa',0,0,0,1),(29,'julian','castro',13,15,'Masculino','Delantero',0,0,0,4),(30,'Juan','Ochux',13,18,'Masculino','Portero',0,0,0,4);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `like_comment_id_ffffeb92_fk_comentario_id` (`comment_id`),
  KEY `like_user_id_318aef4d_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `like_comment_id_ffffeb92_fk_comentario_id` FOREIGN KEY (`comment_id`) REFERENCES `comentario` (`id`),
  CONSTRAINT `like_user_id_318aef4d_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
INSERT INTO `like` VALUES (4,6,2),(6,3,2),(10,6,4);
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Tequila',150000,'Tequila patrón reposado','product/960022-TEQUILA_PATRON_REPOSADO_BOTELLA_700ML_cOaB8qq.png','2024-12-12',2),(2,'Aguardiente',15000,'Medio litro de aguardiente azul','product/example.jpg','2023-11-15',2),(4,'Marboro',12000,'Media caja marboro, 20 unidades','product/477dc5_7a85a1376b274ae5be033608141920eemv2.webp','2024-09-12',4),(5,'Lucky Strike',6000,'Lucky Strike Azul x10','product/10007_202102242259134412668-600x600.jpeg','2025-08-12',4),(6,'Aguardiente',20000,'Aguardiente antioqueño verde 375ml','product/asfadsf_9mAP6cI.webp','2026-05-12',2),(7,'Gatorade',4000,'Gatorade naranja 500ml','product/supermercados_la_vaquita_supervaquita_gatorade_500ml_frutas_tropicales_bebidas__Q9DfUSU.webp','2025-08-09',5),(9,'Example',17000,'Jejejej','default_product.png','2025-12-12',3);
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
  `place` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `cost` double NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2','Bolirana','2023-09-24','12:12:00.000000','14:56:00.000000',98400,1),(2,'2','Bolirana','2023-09-24','13:45:00.000000','15:34:00.000000',65400,1),(3,'2','Bolirana','2004-09-12','02:30:00.000000','16:30:00.000000',504000,0);
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
  `date` datetime(6) NOT NULL,
  `inventory_id` bigint(20) DEFAULT NULL,
  `total_products` int(10) unsigned NOT NULL CHECK (`total_products` >= 0),
  `type` varchar(50) NOT NULL,
  `car_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salida_inventory_id_3d569ade_fk_inventario_id` (`inventory_id`),
  KEY `salida_car_id_29f01413_fk_carrito_id` (`car_id`),
  CONSTRAINT `salida_car_id_29f01413_fk_carrito_id` FOREIGN KEY (`car_id`) REFERENCES `carrito` (`id`),
  CONSTRAINT `salida_inventory_id_3d569ade_fk_inventario_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
INSERT INTO `salida` VALUES (1,'2023-11-01 20:44:28.518647',NULL,5,'compra',3),(2,'2023-11-02 10:07:13.850085',7,10,'inventario',NULL),(3,'2023-11-02 10:15:21.154304',2,1,'inventario',NULL),(4,'2023-11-02 10:21:41.418582',2,1,'inventario',NULL),(5,'2023-11-02 23:57:54.178784',4,9,'inventario',NULL);
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
  `number_teams` int(10) unsigned NOT NULL,
  `date` datetime(6) NOT NULL,
  `prize_payment` double NOT NULL,
  `cost` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `torneo_chk_1` CHECK (`number_teams` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES (1,'Pelea de pollos',16,'2024-12-12 12:30:00.000000',10000000,20000,0),(2,'Duendes navideños',10,'2023-10-10 14:15:00.000000',2400000,120000,0),(3,'Sena',16,'2023-09-22 15:14:14.000000',-5000000,200000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo_equipo`
--

LOCK TABLES `torneo_equipo` WRITE;
/*!40000 ALTER TABLE `torneo_equipo` DISABLE KEYS */;
INSERT INTO `torneo_equipo` VALUES (1,0,0,0,0,0,0,0,0,2,1),(2,2,1,1,3,5,1,9,18,1,2);
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
  `range` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `user_userboli_chk_1` CHECK (`range` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userboli`
--

LOCK TABLES `user_userboli` WRITE;
/*!40000 ALTER TABLE `user_userboli` DISABLE KEYS */;
INSERT INTO `user_userboli` VALUES (1,'pbkdf2_sha256$600000$8IDOdeuJRmtqRYS3dgo1Mj$8uVyG2jEv1orAReTNgwQ2XYWSIq462H0OE44O9wU1lI=','2023-11-26 22:30:59.826267',1,'admin@admin.com','Juan','Ochoa',1,1,'2023-09-21 21:46:34.184997','admin@admin.com','avatar/miFotoDeGit_ZfFF493.jpg','2005-12-14','3225452102','Otro',0),(2,'pbkdf2_sha256$600000$OikFUkoMpadJ1OfKTWHIch$R+P9zL2LRbu2aJRg+J5KDzuXmz7zgbTQa/e+sV8id4g=','2023-11-26 20:28:43.183489',0,'sopa@gmail.com','Sopita','Ibañez',0,1,'2023-09-21 21:56:23.931162','sopa@gmail.com','avatar/9yr7_ifq5_221215.jpg','2003-09-10','3115698784','Femenino',300),(3,'pbkdf2_sha256$600000$IYBSemf7A00wGN0aPcKnba$cr6Dy6GachFlawetcLCKi13QkbqYRgQolfvux4/AFEk=','2023-09-21 22:56:08.726909',0,'carro@hotmail.com','Felipe','Mendoza',0,1,'2023-09-21 22:56:08.431641','carro@hotmail.com','avatar/internet.png','1997-10-13','3254169874','Masculino',0),(4,'pbkdf2_sha256$600000$zOI57xW5IYllH9VLVlF3vO$KK272K8VCMRVTIrO+up4guvDQTEZVF4VFLbH0XXPz8I=','2023-11-26 22:29:26.302174',0,'calisto@hotmail.com','Miguel','Fernandez',0,1,'2023-09-21 23:03:12.339924','calisto@hotmail.com','avatar/nerd.png','2003-01-10','3547896215','Otro',175),(5,'pbkdf2_sha256$600000$t2nP0FrdmLtU7CduFf7Hnb$phf9sZO5jDw3SEwyIC7mS6AkFL0dO6LWhPrxA6FK1B0=','2023-09-21 23:07:34.993857',0,'maribel@gmail.com','Sara','Mendoza',0,1,'2023-09-21 23:07:34.711361','maribel@gmail.com','avatar/como.png','2005-07-05','3225414756','Femenino',0),(6,'pbkdf2_sha256$600000$bEUBAYu3U3VowHcCoAx24N$m6Zx9BWkKBf+DcHMjMz6EHbbDwhaNGmOwpF36wIsU2s=','2023-09-22 02:19:07.190625',0,'mario@gmail.com','Mario','Boloñez',0,1,'2023-09-21 23:10:46.617006','mario@gmail.com','avatar/mario.png','2010-10-12','3524178555','Masculino',150),(10,'pbkdf2_sha256$600000$tGEyBC9yBYc1VPjiRf4ro9$P6QMWFA6HEkjmpTAaXjl1RpeQUGOlvFMMbzZ5G+kiCU=','2023-09-22 14:44:32.958246',0,'julian@hotmail.com','julian','castro',0,1,'2023-09-22 14:41:37.222338','julian@hotmail.com','exampleUser.png','2006-11-09','3015415613','Masculino',0),(11,'pbkdf2_sha256$600000$cm4AP2uSJjd8JznIwqRh2X$kyia7KIW9YxCUXng25g0lXsRCjbh2hb1E/VntA41x6Y=','2023-09-22 14:58:28.908990',0,'miguel@gmail.com','Miguel','Pulido',0,1,'2023-09-22 14:58:28.141627','miguel@gmail.com','avatar/editar.png','2003-09-12','3225478695','Masculino',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `product_quantity` int(10) unsigned NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_user_id_9f98c281_fk_user_userboli_id` (`user_id`),
  CONSTRAINT `venta_user_id_9f98c281_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`),
  CONSTRAINT `venta_chk_1` CHECK (`product_quantity` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,98400,'Efectivo','Cancelado','2023-09-21 22:09:46.701553','Reserva',1,2),(2,20000,'Efectivo','Comprado','2023-09-21 23:56:07.371521','Torneo',1,6),(3,65400,'Efectivo','En proceso...','2023-09-22 00:24:41.749095','Reserva',1,6),(4,20000,'Efectivo','En proceso...','2023-09-22 01:45:40.180694','Torneo',1,2),(5,120000,'Efectivo','Comprado','2023-09-22 13:21:16.319903','Torneo',1,2),(6,60000,'Efectivo','Cancelado','2023-11-01 20:39:12.401909','Productos',4,4),(7,75000,'Efectivo','Comprado','2023-11-01 20:41:05.236448','Productos',5,4),(8,30000,'Efectivo','Cancelado','2023-11-01 20:45:36.388036','Productos',2,4),(9,15000,'Efectivo','En proceso...','2023-11-01 20:53:02.313811','Productos',1,4);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_carrito`
--

DROP TABLE IF EXISTS `venta_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_carrito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `car_id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_carrito_car_id_903fc97f_fk_carrito_id` (`car_id`),
  KEY `venta_carrito_sale_id_0f55ffc7_fk_venta_id` (`sale_id`),
  CONSTRAINT `venta_carrito_car_id_903fc97f_fk_carrito_id` FOREIGN KEY (`car_id`) REFERENCES `carrito` (`id`),
  CONSTRAINT `venta_carrito_sale_id_0f55ffc7_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_carrito`
--

LOCK TABLES `venta_carrito` WRITE;
/*!40000 ALTER TABLE `venta_carrito` DISABLE KEYS */;
INSERT INTO `venta_carrito` VALUES (1,2,6),(2,3,7),(3,4,8),(4,5,9);
/*!40000 ALTER TABLE `venta_carrito` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `venta_reserva_reservation_id_0075a4d9_fk_reserva_id` (`reservation_id`),
  KEY `venta_reserva_sale_id_3d4f7ed0_fk_venta_id` (`sale_id`),
  CONSTRAINT `venta_reserva_reservation_id_0075a4d9_fk_reserva_id` FOREIGN KEY (`reservation_id`) REFERENCES `reserva` (`id`),
  CONSTRAINT `venta_reserva_sale_id_3d4f7ed0_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_reserva`
--

LOCK TABLES `venta_reserva` WRITE;
/*!40000 ALTER TABLE `venta_reserva` DISABLE KEYS */;
INSERT INTO `venta_reserva` VALUES (1,1,1),(2,2,3);
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
  PRIMARY KEY (`id`),
  KEY `venta_torneo_sale_id_ffa6bfa1_fk_venta_id` (`sale_id`),
  KEY `venta_torneo_tournament_id_0114354e_fk_torneo_id` (`tournament_id`),
  CONSTRAINT `venta_torneo_sale_id_ffa6bfa1_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`),
  CONSTRAINT `venta_torneo_tournament_id_0114354e_fk_torneo_id` FOREIGN KEY (`tournament_id`) REFERENCES `torneo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_torneo`
--

LOCK TABLES `venta_torneo` WRITE;
/*!40000 ALTER TABLE `venta_torneo` DISABLE KEYS */;
INSERT INTO `venta_torneo` VALUES (1,2,1),(2,4,1),(3,5,2);
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

-- Dump completed on 2023-11-26 23:09:53
