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
-- Table structure for table `brands_categories`
--

DROP TABLE IF EXISTS `brands_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands_categories` (
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`,`category_id`),
  KEY `FK6x68tjj3eay19skqlhn7ls6ai` (`category_id`),
  CONSTRAINT `FK58ksmicdguvu4d7b6yglgqvxo` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `FK6x68tjj3eay19skqlhn7ls6ai` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands_categories`
--

LOCK TABLES `brands_categories` WRITE;
/*!40000 ALTER TABLE `brands_categories` DISABLE KEYS */;
INSERT INTO `brands_categories` VALUES (6,1),(1,2),(2,2),(3,2),(7,2),(8,2),(9,4),(4,5),(9,5),(10,5),(36,5),(37,5),(38,5),(39,5),(40,5),(4,6),(9,6),(10,6),(36,6),(37,6),(38,6),(40,6),(9,7),(10,7),(36,7),(37,7),(38,7),(40,7),(41,7),(42,7),(8,9),(12,9),(13,9),(1,10),(3,10),(7,10),(11,10),(14,10),(1,11),(3,11),(14,11),(15,11),(1,12),(14,12),(16,12),(17,13),(18,13),(19,13),(20,13),(9,14),(10,14),(21,14),(22,14),(23,14),(24,14),(9,15),(10,15),(21,15),(23,15),(25,15),(26,15),(27,17),(28,17),(29,17),(30,17),(5,18),(10,18),(31,18),(20,19),(32,19),(33,19),(34,19),(35,19),(39,22),(43,22),(43,23),(44,23),(45,23),(5,24),(6,24),(10,24),(46,24),(10,25),(22,25),(40,25),(40,26),(47,26),(48,26),(5,27),(6,27),(10,27),(49,27),(40,28),(50,28),(5,29),(6,29),(10,29),(47,29),(49,29),(51,29),(52,29),(40,30),(45,30),(53,30),(5,31),(54,31);
/*!40000 ALTER TABLE `brands_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-18 17:36:35
