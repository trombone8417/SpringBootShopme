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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_oce3937d2f4mpfqrycbr0l93m` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Canon','Canon.png'),(2,'Fujifilm','Fujifilm.png'),(3,'Sony','Sony.png'),(4,'HP','HP.png'),(5,'SanDisk','SanDisk.png'),(6,'Western Digital','Western Digital.png'),(7,'Panasonic','Panasonic.png'),(8,'Pelican','Pelican.png'),(9,'Apple','Apple.png'),(10,'Samsung','Samsung.png'),(11,'Olympus','Olympus.png'),(12,'CADeN','Caden.png'),(13,'AmazonBasics','amazonbasics.png'),(14,'Nikon','Nikon.png'),(15,'Neewer','Neewer.png'),(16,'Sigma','Sigma.png'),(17,'Bosch','Bosch.png'),(18,'Joby','Joby.png'),(19,'GoPro','GoPro.png'),(20,'Manfrotto','Manfrotto.png'),(21,'Google','Google.png'),(22,'LG','LG.png'),(23,'Motorola','Motorola.png'),(24,'Pantech','Pantech.png'),(25,'Huawei','Huawei.png'),(26,'Xiaomi','Xiaomi.png'),(27,'HOVAMP','Hovamp.png'),(28,'Aioneus','Aioneus.png'),(29,'XIAE','XIAE.png'),(30,'Everyworth','Everyworth.png'),(31,'Lexar','Lexar.png'),(32,'Nulaxy','Nulaxy.png'),(33,'Fitfort','Fitfort.png'),(34,'PopSockets','PopSocket.png'),(35,'SHAWE','SHAWE.png'),(36,'Lenovo','Lenovo.png'),(37,'Acer','Acer.png'),(38,'Dell','Dell.png'),(39,'Intel','Intel.png'),(40,'ASUS','ASUS.png'),(41,'Microsoft','Microsoft.png'),(42,'DragonTouch','DragonTouch.png'),(43,'AMD','AMD.png'),(44,'XFX','XFX.png'),(45,'MSI','MSI.png'),(46,'Seagate','Seagate.png'),(47,'Cosair','Corsair.png'),(48,'Thermaltake','Thermaltake.png'),(49,'Kingston','Kingston.png'),(50,'Creative','Creative.png'),(51,'Crucial','Crucial.png'),(52,'HyperX','HyperX.png'),(53,'Gigabyte','Gigabyte.png'),(54,'TP-Link','TP-Link.png');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-18 17:36:36
