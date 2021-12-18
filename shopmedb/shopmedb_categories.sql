-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shopmedb
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `image` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jx1ptm0r46dop8v0o7nmgfbeq` (`alias`),
  UNIQUE KEY `UK_t8o6pivur7nn124jehx7cygw5` (`name`),
  KEY `FKsaok720gsu4u2wrgbk10b5n8d` (`parent_id`),
  CONSTRAINT `FKsaok720gsu4u2wrgbk10b5n8d` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'electronics',_binary '','electronics.png','Electronics',NULL),(2,'camera',_binary '','camera.jpg','Camera & Photo',1),(3,'computers',_binary '\0','computers.png','Computers',NULL),(4,'cellphones',_binary '','cellphones.png','Cell Phones & Accessories',1),(5,'desktop_computers',_binary '','desktop computers.png','Desktops',3),(6,'laptop_computers',_binary '','laptop computers.png','Laptops',3),(8,'computer_components',_binary '\0','computer components.png','Computer Components',3),(9,'camera_bags_cases',_binary '','bags_cases.png','Bags & Cases',2),(10,'digital_cameras',_binary '','digital cameras.png','Digital Cameras',2),(11,'camera_flashes',_binary '','flashes.png','Flashes',2),(12,'camera_lenses',_binary '','lenses.png','Lenses',2),(13,'camera_tripods_monopods',_binary '','tripods_monopods.png','Tripods & Monopods',2),(14,'carrier_cellphones',_binary '','carrier cellphones.png','Carrier Cell Phones',4),(15,'unlocked_cellphones',_binary '','unlocked cellphones.png','Unlocked Cell Phones',4),(16,'cellphone_accessories',_binary '','cellphone accessories.png','Accessories',4),(17,'cellphone_cables_adapters',_binary '','cables and adapters.png','Cables & Adapters',16),(18,'microsd_cards',_binary '','microsd cards.png','MicroSD Cards',16),(19,'cellphone_stands',_binary '','cellphone_stands.png','Stands',16),(20,'cellphone_cases',_binary '','cellphone cases.png','Cases',16),(21,'headphones',_binary '','headphones.png','Headphones',16),(22,'computer_processors',_binary '','computer processors.png','CPU Processors Unit',8),(23,'computer_graphic_cards',_binary '','graphic cards.png','Graphic Cards',8),(24,'hard_drive',_binary '','internal hard drive.png','Internal Hard Drives',8),(25,'computer_optical_drives',_binary '','internal optical drives.png','Internal Optical Drives',8),(26,'computer_power_supplies',_binary '','power supplies.png','Power Supplies',8),(27,'solid_state_drives',_binary '','solid state drives.png','Solid State Drives',8),(29,'computer_memory',_binary '','computer memory.png','Memory',8),(30,'computer_motherboard',_binary '','motherboards.png','Motherboard',8),(31,'computer_network_cards',_binary '','network cards.png','Network Cards',8);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-18 17:36:37
