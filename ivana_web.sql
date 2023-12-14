-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ivanaweb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `typeForm` enum('Consulta','Tasacion','Presupuesto','Consorcio','Boletin','Contacto','Sugerencia','Reclamo') NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(150) NOT NULL,
  `order` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `propertyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `propertyId` (`propertyId`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`id`, `filename`, `order`, `createdAt`, `updatedAt`, `propertyId`) VALUES (1,'d25bee89-8a18-4141-b2b7-c3342cf96fc7.jpg',0,'2023-11-07 16:14:50','2023-11-07 16:14:50',1),(2,'0f7e56ca-88e9-41c1-9392-92f46d173ffa.jpg',0,'2023-11-07 16:18:26','2023-11-07 16:18:26',3),(3,'a5bc3618-cd47-4466-8551-a3232c77803e.jpg',1,'2023-11-07 16:18:26','2023-11-07 16:18:26',3),(4,'2cf1a53b-5280-4621-88fa-4c0865073109.jpg',2,'2023-11-07 16:18:26','2023-11-07 16:18:26',3);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Info_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` (`id`, `key`, `value`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (1,'facebook','https://www.facebook.com/jhmesseroux','2023-11-07 16:36:29','2023-11-07 16:36:29',NULL),(2,'instagram','https://www.instagram.com/jhmesseroux','2023-11-07 16:36:44','2023-11-07 16:36:44',NULL),(3,'whatsapp','3417207882','2023-11-07 16:36:54','2023-11-07 16:36:54',NULL);
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `ip` varchar(25) NOT NULL,
  `device` varchar(500) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int DEFAULT NULL,
  `propertyId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `propertyId` (`propertyId`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `log_ibfk_2` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` (`id`, `action`, `ip`, `device`, `createdAt`, `updatedAt`, `userId`, `propertyId`) VALUES (1,'Logeo de usuario','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','2023-11-07 16:11:57','2023-11-07 16:11:57',1,NULL),(2,'Alta de propiedad','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','2023-11-07 16:12:12','2023-11-07 16:12:12',1,NULL),(3,'Alta de propiedad','::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36','2023-11-07 16:18:26','2023-11-07 16:18:26',1,NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerName` varchar(100) DEFAULT NULL,
  `folderId` varchar(10) NOT NULL,
  `type` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `addressNumber` varchar(10) NOT NULL,
  `addressLink` varchar(700) DEFAULT NULL,
  `locality` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT '1',
  `services` json NOT NULL,
  `planePath` varchar(300) DEFAULT NULL,
  `expenses` json NOT NULL,
  `isOutstanding` tinyint(1) NOT NULL DEFAULT '0',
  `showPrice` tinyint(1) NOT NULL DEFAULT '1',
  `showExpenses` tinyint(1) NOT NULL DEFAULT '1',
  `totalArea` varchar(10) DEFAULT NULL,
  `coveredArea` varchar(10) DEFAULT NULL,
  `rooms` varchar(10) DEFAULT NULL,
  `bathrooms` varchar(10) DEFAULT NULL,
  `bedrooms` varchar(10) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `dept` varchar(10) DEFAULT NULL,
  `antiquity` varchar(20) DEFAULT NULL,
  `price` float NOT NULL,
  `currency` varchar(3) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `orientation` varchar(50) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `suite` varchar(2) NOT NULL,
  `toilette` varchar(2) NOT NULL,
  `semicoveredArea` varchar(10) DEFAULT NULL,
  `uncoveredArea` varchar(10) DEFAULT NULL,
  `width` varchar(10) DEFAULT NULL,
  `length` varchar(10) DEFAULT NULL,
  `landArea` varchar(10) DEFAULT NULL,
  `buildingFloors` varchar(2) DEFAULT NULL,
  `garageCoverage` varchar(50) NOT NULL,
  `garages` varchar(2) DEFAULT NULL,
  `roofType` varchar(50) NOT NULL,
  `floorType` varchar(50) NOT NULL,
  `luminosity` varchar(50) NOT NULL,
  `situation` varchar(50) NOT NULL,
  `accessType` varchar(50) NOT NULL,
  `environments` json NOT NULL,
  `facilities` json NOT NULL,
  `propertyState` varchar(15) NOT NULL,
  `summarySheet` varchar(300) DEFAULT NULL,
  `zone` varchar(100) NOT NULL,
  `neighborhood` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Property_folderId_unique` (`folderId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` (`id`, `ownerName`, `folderId`, `type`, `state`, `address`, `addressNumber`, `addressLink`, `locality`, `zipCode`, `visibility`, `services`, `planePath`, `expenses`, `isOutstanding`, `showPrice`, `showExpenses`, `totalArea`, `coveredArea`, `rooms`, `bathrooms`, `bedrooms`, `floor`, `dept`, `antiquity`, `price`, `currency`, `description`, `orientation`, `summary`, `suite`, `toilette`, `semicoveredArea`, `uncoveredArea`, `width`, `length`, `landArea`, `buildingFloors`, `garageCoverage`, `garages`, `roofType`, `floorType`, `luminosity`, `situation`, `accessType`, `environments`, `facilities`, `propertyState`, `summarySheet`, `zone`, `neighborhood`, `createdAt`, `updatedAt`) VALUES (1,'Jean Messeroux','VX-909','Local','En venta','Pelegrini','789',NULL,'Rosario','2000',0,'\"[\\\"Luz\\\",\\\"Agua\\\",\\\"Gas Natural\\\",\\\"Cloacas\\\"]\"',NULL,'\"[\\\"Expensas\\\",\\\"ABL\\\",\\\"Agua\\\",\\\"Gas Natural\\\",\\\"Cloacas\\\"]\"',1,1,1,'4534','345','7','2','5','09','B','2020',4560000,'USD','<p>Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final.</p>','Centro','Using Lorem ipsum to focus attention on graphic elements in a webpage design proposal · One of the e','1','1','345','345','345','345','345','0','Semi cubierta','0','Losa','Madera','Poco luminoso','Vacía','Escalera','\"[\\\"Cocina\\\",\\\"Comedor\\\",\\\"Living\\\",\\\"Lavadero\\\"]\"','\"[\\\"Cocina\\\",\\\"Comedor\\\",\\\"Living\\\",\\\"Lavadero\\\"]\"','Bueno','Using Lorem ipsum to focus attention on graphic elements in a webpage design proposal · One of the earliest examples of the Lorem ipsum placeholder text on 1960s advertising','Centro','Luis Agote','2023-11-07 16:12:12','2023-11-07 16:18:30'),(3,'Jean Messeroux','VX-9g','Local','En venta','Pelegrini','789',NULL,'Rosario','2000',1,'\"[\\\"Luz\\\",\\\"Agua\\\",\\\"Gas Natural\\\",\\\"Cloacas\\\"]\"','ea9cd90e-fa5d-4186-b91e-294c122ac791.jpg','\"[\\\"Expensas\\\",\\\"ABL\\\",\\\"Agua\\\",\\\"Gas Natural\\\",\\\"Cloacas\\\"]\"',1,1,1,'4534','345','7','2','5','09','B','2020',4560000,'USD','<p>Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final.</p>','Centro','Using Lorem ipsum to focus attention on graphic elements in a webpage design proposal · One of the e','1','1','345','345','345','345','345','0','Semi cubierta','0','Losa','Madera','Poco luminoso','Vacía','Escalera','\"[\\\"Cocina\\\",\\\"Comedor\\\",\\\"Living\\\",\\\"Lavadero\\\"]\"','\"[\\\"Cocina\\\",\\\"Comedor\\\",\\\"Living\\\",\\\"Lavadero\\\"]\"','Bueno','Using Lorem ipsum to focus attention on graphic elements in a webpage design proposal · One of the earliest examples of the Lorem ipsum placeholder text on 1960s advertising','Centro','Luis Agote','2023-11-07 16:18:26','2023-11-07 16:18:33');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pathImage` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `passwordChangedAt` datetime DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetExpires` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `fullname`, `email`, `pathImage`, `password`, `passwordChangedAt`, `passwordResetToken`, `passwordResetExpires`, `createdAt`, `updatedAt`) VALUES (1,'Test','ivana@gmail.com','profile-image.jpg','$2b$10$UCbKz7zYFiuRJonmltkoeuYhpDW6SWowOdEUGC1H22PWLbSe2Eayu',NULL,NULL,NULL,'2023-11-07 16:08:03','2023-11-07 16:08:03');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 21:08:41
