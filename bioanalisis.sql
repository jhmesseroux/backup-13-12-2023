-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bioanalisis
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
-- Table structure for table `analyses`
--

DROP TABLE IF EXISTS `analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analyses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `protocolNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecRecibo` date NOT NULL,
  `SolicitanteId` int NOT NULL,
  `ClientId` int NOT NULL,
  `SpeccyId` int NOT NULL,
  `VarietyId` int DEFAULT NULL,
  `establecimiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `procedencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `germinacion` tinyint(1) DEFAULT NULL,
  `vigor` tinyint(1) DEFAULT NULL,
  `humedad` tinyint(1) DEFAULT NULL,
  `tetrazolio` tinyint(1) DEFAULT NULL,
  `pesoMilSemilla` tinyint(1) DEFAULT NULL,
  `fecIniIncubGer` datetime DEFAULT NULL,
  `fecFinIncubGer` datetime DEFAULT NULL,
  `fecConteoGer` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `finishDate` datetime DEFAULT NULL,
  `VigorId` int DEFAULT NULL,
  `TetrazolioId` int DEFAULT NULL,
  `HumedadId` int DEFAULT NULL,
  `PesoMilSemillaId` int DEFAULT NULL,
  `anormalidades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `anormalidadesMasFrec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `UserId` int NOT NULL,
  `pretatamiento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_analisis_clients_idx` (`ClientId`),
  KEY `FK_analisis_solicitante_idx` (`SolicitanteId`),
  KEY `FK_analisis_varieties_idx` (`VarietyId`),
  KEY `FK_analisiis_species_idx` (`SpeccyId`),
  CONSTRAINT `FK_clientes_analisis` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_solicitantes_analisis` FOREIGN KEY (`SolicitanteId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_speccies_analisis` FOREIGN KEY (`SpeccyId`) REFERENCES `speccies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_varieties_analisis` FOREIGN KEY (`VarietyId`) REFERENCES `varieties` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyses`
--

LOCK TABLES `analyses` WRITE;
/*!40000 ALTER TABLE `analyses` DISABLE KEYS */;
INSERT INTO `analyses` (`id`, `protocolNumber`, `fecRecibo`, `SolicitanteId`, `ClientId`, `SpeccyId`, `VarietyId`, `establecimiento`, `procedencia`, `estado`, `observacion`, `germinacion`, `vigor`, `humedad`, `tetrazolio`, `pesoMilSemilla`, `fecIniIncubGer`, `fecFinIncubGer`, `fecConteoGer`, `createdAt`, `updatedAt`, `finishDate`, `VigorId`, `TetrazolioId`, `HumedadId`, `PesoMilSemillaId`, `anormalidades`, `anormalidadesMasFrec`, `UserId`, `pretatamiento`) VALUES (6,'G-01/22','2022-09-06',15,13,7,7,'La Mulata','','finalizado','',1,0,0,0,0,NULL,NULL,NULL,'2022-09-06 21:35:11','2022-09-18 03:16:26','2022-09-18 00:00:00',NULL,NULL,NULL,NULL,'','',1,''),(8,'G-07/22','2022-09-20',13,15,7,6,'asd','asd','finalizado','asd',1,1,0,0,0,NULL,NULL,NULL,'2022-09-20 18:41:28','2022-11-11 18:45:29','2022-11-11 00:00:00',NULL,NULL,NULL,NULL,'','',1,''),(9,'G-09/22','2022-10-17',14,18,6,5,'La Mulata','San Justo','activo','',1,1,0,0,0,NULL,NULL,NULL,'2022-10-17 13:11:18','2022-10-17 19:27:51',NULL,NULL,NULL,NULL,NULL,'','',1,''),(10,'G-010/22','2022-10-17',15,18,7,7,'La Paulina','Casilda','finalizado','',1,1,1,1,0,'2022-06-03 00:00:00','2022-07-09 00:00:00','2022-07-21 00:00:00','2022-10-17 13:13:29','2023-05-18 22:49:11','2023-05-18 00:00:00',3,NULL,NULL,NULL,'','',1,''),(11,'G-011/22','2022-11-01',15,13,6,14,'','','finalizado','',1,0,0,0,0,'2023-01-06 00:00:00','2023-01-26 00:00:00','2023-01-31 00:00:00','2022-11-01 20:46:41','2023-03-09 19:58:37','2023-03-09 00:00:00',NULL,NULL,NULL,NULL,'','',1,''),(14,'G-013/23','2023-01-26',18,18,7,7,'asd','asd','finalizado','',1,0,0,0,0,'2023-01-27 00:00:00','2023-03-23 00:00:00','2023-04-02 00:00:00','2023-01-26 13:22:25','2023-03-23 18:31:48','2023-03-24 00:00:00',NULL,NULL,NULL,NULL,'','',1,''),(17,'G-015/23','2023-01-26',19,19,7,6,'asd','asd','finalizado','',1,0,0,0,0,NULL,NULL,NULL,'2023-01-26 13:40:35','2023-01-26 13:46:15','2023-01-26 00:00:00',NULL,NULL,NULL,NULL,'','',1,''),(18,'G-018/23','2023-01-27',19,13,7,6,'Fgj','Cgb','finalizado','',1,0,0,0,0,NULL,NULL,NULL,'2023-01-27 20:50:13','2023-03-23 18:26:59','2023-03-23 00:00:00',NULL,NULL,NULL,NULL,'','',1,''),(19,'G-019/23','2023-01-30',19,19,7,5,'test','test','activo','Test',1,1,1,1,1,'2023-01-18 00:00:00','2023-01-25 00:00:00','2023-01-30 00:00:00','2023-01-30 16:49:59','2023-03-03 18:49:38',NULL,NULL,NULL,NULL,NULL,'','',1,''),(20,'G-020/23','2023-03-03',14,18,10,10,'','','activo','',1,1,1,0,0,NULL,NULL,NULL,'2023-03-03 20:14:48','2023-03-03 20:14:48',NULL,NULL,NULL,NULL,NULL,'','',1,''),(21,'G-021/23','2023-03-09',21,21,6,13,'','','activo','Silo 1',1,1,0,0,0,NULL,NULL,NULL,'2023-03-09 14:48:38','2023-03-09 14:48:38',NULL,NULL,NULL,NULL,NULL,'','',1,''),(22,'G-022/23','2023-03-09',21,21,6,18,'','','finalizado','Silo 4',1,1,0,0,0,'2023-05-01 00:00:00','2023-05-26 00:00:00','2023-06-03 00:00:00','2023-03-09 14:50:45','2023-05-19 00:31:58','2023-05-18 00:00:00',4,NULL,NULL,NULL,'','',1,''),(23,'G-023/23','2023-05-22',27,27,6,18,'eeee nuev','eeee nuevo ','activo','eeeeeee ',1,1,1,1,1,NULL,NULL,NULL,'2023-05-22 20:35:30','2023-12-10 03:19:08',NULL,NULL,NULL,NULL,NULL,'Cotiled,Coleopt,H.E.M,Yema,Plántula,Hojas 1°,Raiz','reteee nuevo ',2,'nuevo pretata editar'),(24,'G-024/23','2023-12-08',26,27,10,21,'','','activo','',1,0,0,1,0,NULL,NULL,NULL,'2023-12-02 02:37:14','2023-12-02 02:41:38',NULL,NULL,NULL,NULL,NULL,'Raiz,Cotiled,Plántula','',1,''),(25,'G-025/23','2023-12-02',25,18,10,12,'ghfg ','gf gh','activo','',1,1,0,0,0,NULL,NULL,NULL,'2023-12-02 02:48:29','2023-12-02 02:48:29',NULL,NULL,NULL,NULL,NULL,'Cotiled','',1,'hfgh g'),(26,'G-026/23','2023-12-01',24,26,10,12,'','','activo','',1,0,0,0,0,NULL,NULL,NULL,'2023-12-02 02:52:43','2023-12-02 02:52:43',NULL,NULL,NULL,NULL,NULL,'','',1,''),(27,'G-027/23','2023-12-09',26,24,10,21,'nnnn','nnn','activo','',1,0,0,0,0,NULL,NULL,NULL,'2023-12-10 02:29:01','2023-12-10 02:29:01',NULL,NULL,NULL,NULL,NULL,'','',2,'nnnn'),(28,'G-028/23','2023-12-09',18,21,10,9,'ttt','ttt','activo','',1,1,1,0,0,NULL,NULL,NULL,'2023-12-10 02:44:48','2023-12-10 02:56:35',NULL,NULL,NULL,NULL,NULL,'Plántula,Yema','',2,'ttt');
/*!40000 ALTER TABLE `analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adress` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `condition` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cuilCuit` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `observation` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullname` (`fullname`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `fullname`, `phone`, `adress`, `condition`, `cuilCuit`, `observation`, `email`, `createdAt`, `updatedAt`) VALUES (13,'Rorgan SRL','0341156436187','Casilda','Insc','12345567889','','rorgansrl@gmail.com','2022-09-05 18:41:54','2022-09-06 18:46:45'),(14,'Perez, Jose','23423424','Rosario','Insc','','','perez@gmail.com','2022-09-05 18:43:08','2022-09-06 19:02:31'),(15,'Rodriguez, Juan Carlos','4423432','ewrew','Exento','312312312313','','asdsada@dasd.com','2022-09-06 18:44:33','2022-09-06 18:45:12'),(18,'La Paulina SRL','12312312','Casilda','Insc','20-12903812392-9','','lapaulin@gmail.com','2022-10-17 13:12:20','2022-10-17 13:12:20'),(19,'Garcia Juan jose','2423423432','','Monotrib','2384239444','','','2022-11-01 20:15:36','2022-11-01 20:15:36'),(20,'Pereyra JuAN','77777','CASILDA','','','','PEPEEP@77.COM','2023-03-03 19:34:56','2023-03-03 19:34:56'),(21,'Olivieri Franco','3464440949','CASILDA ','','','','francoolivieri95@gmail.com','2023-03-09 14:46:34','2023-03-09 14:46:34'),(22,'Agro Messi SRL -  Danilo Messi','3467675542','','','','','d_messi@hotmail.com','2023-03-09 20:09:38','2023-03-23 18:52:20'),(23,'Ferrari Carlos y Roberto','3464440082','','','','','','2023-03-14 13:42:17','2023-03-14 13:42:17'),(24,'Cooperativa Provisión de Agua Potable - Chabás','03464480222','Chabás','Insc','30585946520','','coopaguagerencia@gmail.com','2023-03-15 19:57:11','2023-03-15 20:00:32'),(25,'Cooperativa Provisión de Obras y Servicios Arequito (CEODAL)','03464471137','Arequito','Insc','33557362539','','ceodal@dat1.net.ar','2023-03-15 20:10:36','2023-03-15 20:10:36'),(26,'Coop.  Prov. de Obras y Serv. Públicos de Fuentes LTDA.','3464493500','Fuentes','Insc','30590073284','','gerenciafuentes@dat1.net.ar','2023-03-15 20:18:52','2023-03-15 20:19:14'),(27,'test','341720788','rosario','No-Insc','20-90856545-3','Soy un ingeniero en sistema','test@gmail.com','2023-05-12 00:31:25','2023-05-12 00:31:25'),(28,'ghfhj','23490930898','fghjfgh','Cons. Final','99-99999999','ghjfhjfh','fghgfgd@dsfd.com','2023-12-10 03:51:06','2023-12-10 03:51:06'),(29,'ana11',NULL,'sarmiento 1247','hello','11111111','I am the boss','jea22n@gmail.com','2023-12-10 03:57:07','2023-12-10 03:57:07'),(30,'Evenson','23490930898','Rosario','No-Insc','99-9999988','Soy Evenson un ingeniero en sistema que se recibio en la utn y que ahora es uno de los mejores del mundo ','admcentro@gmail.com','2023-12-10 04:14:54','2023-12-10 04:14:54'),(31,'New client','80900890','New Ros','No-Insc','78-0978-78','New Client mail -> newone@text-klk\nnew Clienphone :: 9008787897\nalgo mas : 89jjkhfjhjkd\nultimp test :: eeoienjkkdfdsf\nfgsfd gf dg sdfgs\nsdfg sfdgsfd gsdfg sfdg fgsdf gsdfgsd\ngsdfg dfgsg df gsfgs\nsdfgs fdgsdfg sfdgsfdg sdfg\n','newclient@gmail.com','2023-12-10 04:18:14','2023-12-10 04:18:14');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `germinacions`
--

DROP TABLE IF EXISTS `germinacions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `germinacions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AnalysisId` int NOT NULL,
  `orden` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `normales` float DEFAULT NULL,
  `duras` float DEFAULT NULL,
  `frescas` float DEFAULT NULL,
  `anormales` float DEFAULT NULL,
  `muertas` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_germinaciones_analisis_idx` (`AnalysisId`),
  CONSTRAINT `FK_germinaciones_analisis_id` FOREIGN KEY (`AnalysisId`) REFERENCES `analyses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `germinacions`
--

LOCK TABLES `germinacions` WRITE;
/*!40000 ALTER TABLE `germinacions` DISABLE KEYS */;
INSERT INTO `germinacions` (`id`, `AnalysisId`, `orden`, `normales`, `duras`, `frescas`, `anormales`, `muertas`, `createdAt`, `updatedAt`) VALUES (31,6,'1',0,0,0,0,0,'2022-09-06 21:35:11','2022-09-18 03:16:24'),(32,6,'2',0,0,0,0,0,'2022-09-06 21:35:11','2022-09-18 03:16:24'),(33,6,'3',0,0,0,0,0,'2022-09-06 21:35:11','2022-09-18 03:16:24'),(34,6,'4',0,0,0,0,0,'2022-09-06 21:35:11','2022-09-18 03:16:25'),(35,6,'Prom. Dec',0,0,0,0,0,'2022-09-06 21:35:11','2022-09-18 03:16:25'),(36,6,'Prom',0,0,0,0,0,'2022-09-06 21:35:11','2022-09-18 03:16:26'),(43,8,'1',0,0,0,0,0,'2022-09-20 18:41:28','2022-11-11 18:45:26'),(44,8,'2',0,0,0,0,0,'2022-09-20 18:41:28','2022-11-11 18:45:27'),(45,8,'3',0,0,0,0,0,'2022-09-20 18:41:28','2022-11-11 18:45:27'),(46,8,'4',0,0,0,0,0,'2022-09-20 18:41:28','2022-11-11 18:45:27'),(47,8,'Prom. Dec',0,0,0,0,0,'2022-09-20 18:41:28','2022-11-11 18:45:28'),(48,8,'Prom',0,0,0,0,0,'2022-09-20 18:41:28','2022-11-11 18:45:28'),(49,9,'1',0,0,0,0,0,'2022-10-17 13:11:18','2022-10-17 19:27:48'),(50,9,'2',0,0,0,0,0,'2022-10-17 13:11:18','2022-10-17 19:27:49'),(51,9,'3',0,0,0,0,0,'2022-10-17 13:11:18','2022-10-17 19:27:49'),(52,9,'4',0,0,0,0,0,'2022-10-17 13:11:18','2022-10-17 19:27:50'),(53,9,'Prom. Dec',0,0,0,0,0,'2022-10-17 13:11:18','2022-10-17 19:27:50'),(54,9,'Prom',0,0,0,0,0,'2022-10-17 13:11:18','2022-10-17 19:27:50'),(55,10,'1',96,1,0,1,2,'2022-10-17 13:13:29','2023-05-18 22:49:10'),(56,10,'2',97,1,1,0,1,'2022-10-17 13:13:29','2023-05-18 22:49:11'),(57,10,'3',98,1,1,0,0,'2022-10-17 13:13:29','2023-05-18 22:49:11'),(58,10,'4',94,1,1,0,4,'2022-10-17 13:13:29','2023-05-18 22:49:11'),(59,10,'Prom. Dec',96.25,1,0.75,0.25,1.75,'2022-10-17 13:13:29','2023-05-18 22:49:11'),(60,10,'Prom',96,1,1,0,2,'2022-10-17 13:13:29','2023-05-18 22:49:11'),(61,11,'1',97,0,2,0,1,'2022-11-01 20:46:41','2023-03-09 19:58:34'),(62,11,'2',95,0,2,1,2,'2022-11-01 20:46:41','2023-03-09 19:58:35'),(63,11,'3',95,0,2,0,3,'2022-11-01 20:46:41','2023-03-09 19:58:35'),(64,11,'4',97,0,2,0,1,'2022-11-01 20:46:41','2023-03-09 19:58:36'),(65,11,'Prom. Dec',96,0,2,0.25,1.75,'2022-11-01 20:46:41','2023-03-09 19:58:36'),(66,11,'Prom',96,0,2,0,2,'2022-11-01 20:46:41','2023-03-09 19:58:37'),(79,14,'1',97,0,2,0,1,'2023-01-26 13:22:25','2023-03-23 18:31:46'),(80,14,'2',94,0,2,1,3,'2023-01-26 13:22:25','2023-03-23 18:31:46'),(81,14,'3',98,0,1,0,1,'2023-01-26 13:22:25','2023-03-23 18:31:46'),(82,14,'4',92,0,3,2,3,'2023-01-26 13:22:25','2023-03-23 18:31:47'),(83,14,'Prom. Dec',95.25,0,2,0.75,2,'2023-01-26 13:22:25','2023-03-23 18:31:47'),(84,14,'Prom',95,0,2,1,2,'2023-01-26 13:22:25','2023-03-23 18:31:48'),(97,17,'1',97,0,2,0,1,'2023-01-26 13:40:35','2023-01-26 13:46:12'),(98,17,'2',95,0,2,1,2,'2023-01-26 13:40:35','2023-01-26 13:46:12'),(99,17,'3',95,0,2,0,3,'2023-01-26 13:40:35','2023-01-26 13:46:13'),(100,17,'4',97,0,2,0,1,'2023-01-26 13:40:35','2023-01-26 13:46:13'),(101,17,'Prom. Dec',96,0,2,0.25,1.75,'2023-01-26 13:40:35','2023-01-26 13:46:14'),(102,17,'Prom',96,0,2,0,2,'2023-01-26 13:40:35','2023-01-26 13:46:14'),(103,18,'1',97,0,1,2,0,'2023-01-27 20:50:13','2023-03-23 18:26:56'),(104,18,'2',98,0,2,0,0,'2023-01-27 20:50:13','2023-03-23 18:26:56'),(105,18,'3',97,0,1,2,0,'2023-01-27 20:50:13','2023-03-23 18:26:57'),(106,18,'4',97,0,3,0,0,'2023-01-27 20:50:13','2023-03-23 18:26:57'),(107,18,'Prom. Dec',97.25,0,1.75,1,0,'2023-01-27 20:50:13','2023-03-23 18:26:58'),(108,18,'Prom',97,0,2,1,0,'2023-01-27 20:50:13','2023-03-23 18:26:59'),(109,19,'1',98,2,0,0,0,'2023-01-30 16:49:59','2023-03-03 18:49:36'),(110,19,'2',94,2,3,0,1,'2023-01-30 16:49:59','2023-03-03 18:49:36'),(111,19,'3',100,0,0,0,0,'2023-01-30 16:49:59','2023-03-03 18:49:36'),(112,19,'4',92,4,2,0,2,'2023-01-30 16:49:59','2023-03-03 18:49:37'),(113,19,'Prom. Dec',96,2,1.25,0,0.75,'2023-01-30 16:49:59','2023-03-03 18:49:37'),(114,19,'Prom',96,2,1,0,1,'2023-01-30 16:49:59','2023-03-03 18:49:38'),(115,20,'1',0,0,0,0,0,'2023-03-03 20:14:48','2023-03-03 20:14:48'),(116,20,'2',0,0,0,0,0,'2023-03-03 20:14:48','2023-03-03 20:14:48'),(117,20,'3',0,0,0,0,0,'2023-03-03 20:14:48','2023-03-03 20:14:48'),(118,20,'4',0,0,0,0,0,'2023-03-03 20:14:48','2023-03-03 20:14:48'),(119,20,'Prom. Dec',0,0,0,0,0,'2023-03-03 20:14:48','2023-03-03 20:14:48'),(120,20,'Prom',0,0,0,0,0,'2023-03-03 20:14:48','2023-03-03 20:14:48'),(121,21,'1',0,0,0,0,0,'2023-03-09 14:48:38','2023-03-09 14:48:38'),(122,21,'2',0,0,0,0,0,'2023-03-09 14:48:38','2023-03-09 14:48:38'),(123,21,'3',0,0,0,0,0,'2023-03-09 14:48:38','2023-03-09 14:48:38'),(124,21,'4',0,0,0,0,0,'2023-03-09 14:48:38','2023-03-09 14:48:38'),(125,21,'Prom. Dec',0,0,0,0,0,'2023-03-09 14:48:38','2023-03-09 14:48:38'),(126,21,'Prom',0,0,0,0,0,'2023-03-09 14:48:38','2023-03-09 14:48:38'),(127,22,'1',98,1,0,0,1,'2023-03-09 14:50:45','2023-05-19 00:31:58'),(128,22,'2',95,2,1,1,1,'2023-03-09 14:50:45','2023-05-19 00:31:58'),(129,22,'3',98,1,0,0,1,'2023-03-09 14:50:45','2023-05-19 00:31:58'),(130,22,'4',94,3,0,2,1,'2023-03-09 14:50:45','2023-05-19 00:31:58'),(131,22,'Prom. Dec',96.25,1.75,0.25,0.75,1,'2023-03-09 14:50:45','2023-05-19 00:31:58'),(132,22,'Prom',96,2,0,1,1,'2023-03-09 14:50:45','2023-05-19 00:31:58'),(133,23,'1',0,0,0,0,0,'2023-05-22 20:35:30','2023-12-10 03:19:08'),(134,23,'2',0,0,0,0,0,'2023-05-22 20:35:30','2023-12-10 03:19:08'),(135,23,'3',0,0,0,0,0,'2023-05-22 20:35:30','2023-12-10 03:19:08'),(136,23,'4',0,0,0,0,0,'2023-05-22 20:35:30','2023-12-10 03:19:08'),(137,23,'Prom. Dec',0,0,0,0,0,'2023-05-22 20:35:30','2023-12-10 03:19:08'),(138,23,'Prom',0,0,0,0,0,'2023-05-22 20:35:30','2023-12-10 03:19:08'),(139,24,'1',0,0,0,0,0,'2023-12-02 02:37:14','2023-12-02 02:41:38'),(140,24,'2',0,0,0,0,0,'2023-12-02 02:37:14','2023-12-02 02:41:38'),(141,24,'3',0,0,0,0,0,'2023-12-02 02:37:14','2023-12-02 02:41:38'),(142,24,'4',0,0,0,0,0,'2023-12-02 02:37:14','2023-12-02 02:41:38'),(143,24,'Prom. Dec',0,0,0,0,0,'2023-12-02 02:37:14','2023-12-02 02:41:38'),(144,24,'Prom',0,0,0,0,0,'2023-12-02 02:37:14','2023-12-02 02:41:38'),(145,25,'1',0,0,0,0,0,'2023-12-02 02:48:29','2023-12-02 02:48:29'),(146,25,'2',0,0,0,0,0,'2023-12-02 02:48:29','2023-12-02 02:48:29'),(147,25,'3',0,0,0,0,0,'2023-12-02 02:48:29','2023-12-02 02:48:29'),(148,25,'4',0,0,0,0,0,'2023-12-02 02:48:29','2023-12-02 02:48:29'),(149,25,'Prom. Dec',0,0,0,0,0,'2023-12-02 02:48:29','2023-12-02 02:48:29'),(150,25,'Prom',0,0,0,0,0,'2023-12-02 02:48:29','2023-12-02 02:48:29'),(151,26,'1',0,0,0,0,0,'2023-12-02 02:52:43','2023-12-02 02:52:43'),(152,26,'2',0,0,0,0,0,'2023-12-02 02:52:43','2023-12-02 02:52:43'),(153,26,'3',0,0,0,0,0,'2023-12-02 02:52:43','2023-12-02 02:52:43'),(154,26,'4',0,0,0,0,0,'2023-12-02 02:52:43','2023-12-02 02:52:43'),(155,26,'Prom. Dec',0,0,0,0,0,'2023-12-02 02:52:43','2023-12-02 02:52:43'),(156,26,'Prom',0,0,0,0,0,'2023-12-02 02:52:43','2023-12-02 02:52:43'),(157,27,'1',0,0,0,0,0,'2023-12-10 02:29:01','2023-12-10 02:29:01'),(158,27,'2',0,0,0,0,0,'2023-12-10 02:29:01','2023-12-10 02:29:01'),(159,27,'3',0,0,0,0,0,'2023-12-10 02:29:01','2023-12-10 02:29:01'),(160,27,'4',0,0,0,0,0,'2023-12-10 02:29:01','2023-12-10 02:29:01'),(161,27,'Prom. Dec',0,0,0,0,0,'2023-12-10 02:29:01','2023-12-10 02:29:01'),(162,27,'Prom',0,0,0,0,0,'2023-12-10 02:29:01','2023-12-10 02:29:01');
/*!40000 ALTER TABLE `germinacions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humedads`
--

DROP TABLE IF EXISTS `humedads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humedads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cantHumedad` float DEFAULT NULL,
  `AnalysisId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_humedades_analisis_idx` (`AnalysisId`),
  CONSTRAINT `FK_humedades_analisis_id` FOREIGN KEY (`AnalysisId`) REFERENCES `analyses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humedads`
--

LOCK TABLES `humedads` WRITE;
/*!40000 ALTER TABLE `humedads` DISABLE KEYS */;
/*!40000 ALTER TABLE `humedads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paraguas`
--

DROP TABLE IF EXISTS `paraguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paraguas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipPar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dscPar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uniMed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valRef` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipDat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paraguas`
--

LOCK TABLES `paraguas` WRITE;
/*!40000 ALTER TABLE `paraguas` DISABLE KEYS */;
INSERT INTO `paraguas` (`id`, `tipPar`, `dscPar`, `uniMed`, `valRef`, `options`, `tipDat`, `createdAt`, `updatedAt`) VALUES (1,'FQ','pH','','6,5 a 8,5','Test1,Test2','Texto','2022-09-06 21:42:14','2022-10-17 14:10:39'),(2,'ORG','Color','','Incolora','Incolora,turbia','Lista','2022-09-06 21:44:32','2022-10-17 14:11:18'),(4,'ORG','Turbiedad','','Máx. 3 UNT','Menor a 3 UNT,Mayor a 3 UNT','Lista','2022-09-13 21:18:37','2022-10-17 14:10:47'),(7,'FQ','Conductividad Eléctrica','dS/m','---','','Texto','2022-10-17 14:08:43','2022-10-17 14:39:28'),(8,'ORG','Olor','','Sin Valores extraños','Sulfuroso,Sin Valores extraños','Lista','2022-10-17 14:12:38','2022-10-17 14:45:06'),(9,'FQ','Sólidos disueltos totales','mg/l','Máx 1500 mg/l','','Texto','2022-10-17 14:14:14','2022-10-17 14:14:14'),(10,'FQ','Cloruros','mg/l','Max 350 mg/l','','Texto','2022-10-17 14:15:08','2022-10-17 14:15:08'),(11,'FQ','Nitratos','mg/l','Max. 45 mg/l','','Texto','2022-10-17 14:35:55','2022-10-17 14:35:55'),(12,'FQ','Nitritos','mg/l','Máx. 0.10 mg/l','','Texto','2022-10-17 14:36:40','2022-10-17 14:36:40'),(13,'FQ','Amoníaco','mg/l','Máx. 0.20 mg/l','','Texto','2022-10-17 14:37:09','2022-10-17 14:37:09'),(14,'FQ','Dureza total','mg/l','Máx. 400 mg/l','','Texto','2022-10-17 14:37:44','2022-10-17 14:38:01'),(15,'FQ','Alcalinidad total','mg/l','---','','Texto','2022-10-17 14:38:44','2022-10-17 14:38:44'),(16,'FQ','Alcalinidad de carbonatos','mg/l','---','','Texto','2022-10-17 14:39:19','2022-10-17 14:39:19'),(17,'FQ','Alcalinidad de bicarbonatos	','mg/l','---','','Texto','2022-10-17 14:40:05','2022-10-17 14:40:05'),(18,'FQ','Sulfatos','mg/l','Máx. 400 mg/l','','Texto','2022-10-17 14:41:07','2022-10-17 14:41:07'),(19,'FQ','Arsénico','mg/l','---','','Texto','2022-10-17 14:41:34','2022-10-17 14:41:34'),(20,'BAC','Recuento de bacterias aerobias mesófilas (APC - 35°C - 48 hs)','UFC/ml','100 UFC/ml','','Texto','2022-10-17 15:17:18','2022-10-17 15:17:18'),(21,'BAC','Número más probable de bacterias coliformes (Caldo lauril sulfato - 48 hs - 35°C)','','Menor o igual a 2.2 NMP/100 ml','Menor a 2.2 NMP/100 ml,Menor o igual a 2.2 NMP/100 ml','Lista','2022-10-17 15:20:13','2022-10-17 15:20:13'),(22,'BAC','Investigación de Escherichia coli, en 100 ml','','Ausencia','Presencia,Ausencia','Lista','2022-10-17 15:21:23','2023-03-03 20:04:13'),(23,'BAC','Investigación de Pseudomona aeruginosa (Caldo asparagina, 24 - 48 hs, 37°C, en 100 ml)','','Ausencia','Presencia,Ausencia','Lista','2022-10-17 15:22:09','2022-10-17 15:22:09'),(24,'FQ','Fluor','mg/l','1,50 mg/l','','Texto','2022-10-17 15:34:25','2022-10-17 15:34:25'),(26,'FQ','sales','mg/l','max 10%','non tiene,10%,+80%','Lista','2022-11-01 19:57:39','2022-11-01 19:57:39'),(27,'FQ','temp','°','15 °','0 a 12,12 a 20','Lista','2023-03-03 20:05:58','2023-03-03 20:05:58');
/*!40000 ALTER TABLE `paraguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parsuelos`
--

DROP TABLE IF EXISTS `parsuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parsuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dscPar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uniMed` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `tipDat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valRef` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dscPar_UNIQUE` (`dscPar`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parsuelos`
--

LOCK TABLES `parsuelos` WRITE;
/*!40000 ALTER TABLE `parsuelos` DISABLE KEYS */;
INSERT INTO `parsuelos` (`id`, `dscPar`, `options`, `uniMed`, `createdAt`, `updatedAt`, `tipDat`, `valRef`) VALUES (12,'pH','','--','2022-09-05 18:30:41','2022-09-05 18:30:41','Texto',''),(13,'Conductividad Eléctrica','','dS/m','2022-09-05 18:30:57','2023-01-20 21:58:53','Texto','b'),(14,'Nitrógeno Total','','%','2022-09-05 18:31:26','2022-09-05 18:35:14','Texto',''),(15,'Materia Orgánica','','%','2022-09-05 18:34:44','2022-09-05 18:34:44','Texto',''),(16,'Nitrato (N-NO3)','','ppm','2022-09-05 18:34:58','2022-09-05 18:34:58','Texto',''),(17,'Nitrato NO3','','ppm','2022-09-05 18:35:24','2022-09-05 18:35:24','Texto',''),(18,'Fósforo disponible','','ppm','2022-09-05 18:35:33','2023-01-20 21:58:55','Texto','c'),(19,'Azufre S-SO4','','ppm','2022-09-05 18:35:42','2023-01-20 21:58:50','Texto','a'),(21,'Zinc','','ppm','2022-11-01 20:01:56','2022-11-01 20:01:56','Texto','');
/*!40000 ALTER TABLE `parsuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesomilsemillas`
--

DROP TABLE IF EXISTS `pesomilsemillas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesomilsemillas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `AnalysisId` int NOT NULL,
  `rtdo1` float DEFAULT NULL,
  `rtdo2` float DEFAULT NULL,
  `prom` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpesosmilsemillas_analisis_id_idx` (`AnalysisId`),
  CONSTRAINT `FKpesosmilsemillas_analisis_id` FOREIGN KEY (`AnalysisId`) REFERENCES `analyses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesomilsemillas`
--

LOCK TABLES `pesomilsemillas` WRITE;
/*!40000 ALTER TABLE `pesomilsemillas` DISABLE KEYS */;
/*!40000 ALTER TABLE `pesomilsemillas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reganaaguas`
--

DROP TABLE IF EXISTS `reganaaguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reganaaguas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nroProtocolo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecRecib` date NOT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SolicitanteId` int DEFAULT NULL,
  `ClientId` int DEFAULT NULL,
  `lugExtraccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `procedencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecFinal` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Bacteriológico` tinyint DEFAULT NULL,
  `FísicoQuímico` tinyint DEFAULT NULL,
  `QuímicoCompleto` tinyint DEFAULT NULL,
  `QuímicoParcial` tinyint DEFAULT NULL,
  `QuímicoPotabilidad` tinyint DEFAULT NULL,
  `QuímicoSumario` tinyint DEFAULT NULL,
  `notes` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_client_reganaagua_idx` (`ClientId`),
  KEY `FK_solicitante_regnanaagua_idx` (`SolicitanteId`),
  CONSTRAINT `FK_client_reganaagua` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_solicitante_regnanaagua` FOREIGN KEY (`SolicitanteId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reganaaguas`
--

LOCK TABLES `reganaaguas` WRITE;
/*!40000 ALTER TABLE `reganaaguas` DISABLE KEYS */;
INSERT INTO `reganaaguas` (`id`, `nroProtocolo`, `fecRecib`, `estado`, `SolicitanteId`, `ClientId`, `lugExtraccion`, `procedencia`, `observacion`, `fecFinal`, `createdAt`, `updatedAt`, `Bacteriológico`, `FísicoQuímico`, `QuímicoCompleto`, `QuímicoParcial`, `QuímicoPotabilidad`, `QuímicoSumario`, `notes`) VALUES (1,'A-1','2022-09-17','finalizado',15,13,'','','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2022-09-18 00:00:00','2022-09-17 03:02:59','2023-01-19 21:02:52',1,1,1,1,1,1,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(3,'A-2','2022-10-17','finalizado',14,13,'Pozo casilda2','aguas casilda','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2023-03-03 00:00:00','2022-10-17 18:43:00','2023-03-03 19:57:59',1,0,1,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(4,'A-4','2022-10-17','finalizado',NULL,19,'Lisandro de la Torre 4545 b','Chabas','una buena obs sirve mucho','2023-01-23 00:00:00','2022-10-17 19:20:06','2023-01-23 19:03:49',0,1,0,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(5,'A-5','2022-11-01','finalizado',14,13,'poz 5','','una buena obs sirve mucho','2023-01-12 00:00:00','2022-11-01 20:41:05','2023-01-12 23:33:16',1,0,0,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(6,'A-6','2023-01-19','finalizado',NULL,18,'','','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2023-01-23 00:00:00','2023-01-19 21:01:36','2023-01-23 19:02:36',1,0,0,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(10,'A-7','2023-02-06','finalizado',19,14,'Lisandro de la Torre 4545 b','Chabas','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2023-02-06 00:00:00','2023-02-06 22:02:20','2023-02-06 22:03:29',1,1,1,1,0,1,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(11,'A-11','2023-03-03','finalizado',20,18,'','','xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2023-03-23 00:00:00','2023-03-03 19:36:59','2023-03-23 18:42:29',1,0,0,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(12,'A-12','2023-03-09','finalizado',22,22,'Agua de Surgente','','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2023-03-09 00:00:00','2023-03-09 20:10:22','2023-03-09 20:15:26',0,1,0,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(13,'A-13','2023-03-15','finalizado',24,24,'Bajada de tanque','Chabás','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica','2023-03-15 00:00:00','2023-03-15 20:21:23','2023-03-15 20:22:36',1,0,0,0,0,0,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(14,'A-14','2023-03-24','activo',27,27,'lugar de extra','procedencia legal','Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica',NULL,'2023-05-12 00:32:11','2023-05-12 01:24:55',1,0,0,0,0,1,'xto final. Aunque no posee actualmente fuentes para justificar sus hipótesis, el profesor de filología clásica'),(15,'A-15','2023-12-02','activo',25,23,'','','',NULL,'2023-12-02 02:54:14','2023-12-02 02:54:14',0,0,0,0,0,0,NULL),(16,'A-16','2023-12-01','activo',26,NULL,'','','',NULL,'2023-12-02 02:55:09','2023-12-02 02:55:09',0,0,0,0,0,0,NULL),(17,'A-17','2023-12-07','activo',23,18,'','','',NULL,'2023-12-02 03:00:54','2023-12-02 03:01:32',0,0,1,0,0,0,NULL),(18,'A-18','2023-12-01','activo',25,23,'','','',NULL,'2023-12-02 03:02:07','2023-12-02 03:02:07',1,0,0,0,0,0,NULL),(19,'A-19','2023-02-12','activo',25,23,'','','',NULL,'2023-12-02 03:04:19','2023-12-02 03:04:19',0,0,0,1,0,0,NULL);
/*!40000 ALTER TABLE `reganaaguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reganasuelos`
--

DROP TABLE IF EXISTS `reganasuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reganasuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nroProtocolo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecRecib` date NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'activo',
  `SolicitanteId` int NOT NULL,
  `ClientId` int NOT NULL,
  `caractLote` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `superficieAprox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profundidad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `procedencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cultivoAnt` int DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Grupo3` tinyint(1) NOT NULL,
  `fecFinal` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clientsSolicitante_regnanasuelo_idx` (`SolicitanteId`),
  KEY `FK_client_reganasuelo_idx` (`ClientId`,`SolicitanteId`),
  CONSTRAINT `FK_clientsSolicitante_reganasuelo_id` FOREIGN KEY (`ClientId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_solicitanteClients_reganasuelo_id` FOREIGN KEY (`SolicitanteId`) REFERENCES `clients` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reganasuelos`
--

LOCK TABLES `reganasuelos` WRITE;
/*!40000 ALTER TABLE `reganasuelos` DISABLE KEYS */;
INSERT INTO `reganasuelos` (`id`, `nroProtocolo`, `fecRecib`, `estado`, `SolicitanteId`, `ClientId`, `caractLote`, `superficieAprox`, `profundidad`, `procedencia`, `cultivoAnt`, `observacion`, `Grupo3`, `fecFinal`, `createdAt`, `updatedAt`) VALUES (6,'S-1','2022-09-05','finalizado',14,18,'','34','4','Cañada de Gomez',7,'nb bn',1,'2023-01-12 00:00:00','2022-09-05 18:49:56','2023-01-12 23:38:14'),(9,'S-8','2022-10-17','finalizado',15,13,'un bajo','123','5 m','Cañada de Gomez',7,'',1,'2023-03-15 00:00:00','2022-10-17 23:16:20','2023-03-15 20:37:10'),(11,'S-10','2022-11-01','activo',19,13,'','','','rosario',NULL,'',1,NULL,'2022-11-01 20:15:54','2023-03-03 19:56:25'),(12,'S-12','2023-01-20','finalizado',18,18,'asd','asd','asd','asd',5,'asd',1,'2023-05-23 00:00:00','2023-01-20 21:59:51','2023-05-23 15:59:53'),(13,'S-13','2023-03-23','finalizado',22,22,'','','','',19,'',1,'2023-03-23 00:00:00','2023-03-23 18:47:42','2023-03-23 18:50:28');
/*!40000 ALTER TABLE `reganasuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regparanaaguas`
--

DROP TABLE IF EXISTS `regparanaaguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regparanaaguas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parAguaId` int DEFAULT NULL,
  `regAnaAguaId` int DEFAULT NULL,
  `valObt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `parAnaAguaId` int DEFAULT NULL,
  `tipAnaAguaId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parAguas_regparanaagua_idx` (`parAguaId`),
  KEY `FK_tipanaagua_idx` (`tipAnaAguaId`),
  KEY `FK_reganagua_regparanaagua_idx` (`regAnaAguaId`),
  CONSTRAINT `FK_parAguas_regparanaagua` FOREIGN KEY (`parAguaId`) REFERENCES `paraguas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_reganagua_regparanaagua` FOREIGN KEY (`regAnaAguaId`) REFERENCES `reganaaguas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tipanaagua_reganaaguas` FOREIGN KEY (`tipAnaAguaId`) REFERENCES `tipanaaguas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regparanaaguas`
--

LOCK TABLES `regparanaaguas` WRITE;
/*!40000 ALTER TABLE `regparanaaguas` DISABLE KEYS */;
INSERT INTO `regparanaaguas` (`id`, `parAguaId`, `regAnaAguaId`, `valObt`, `createdAt`, `updatedAt`, `parAnaAguaId`, `tipAnaAguaId`) VALUES (137,20,5,'yyythhu009','2023-01-12 23:33:16','2023-01-12 23:33:16',NULL,1),(174,2,1,'test','2023-01-19 21:02:52','2023-01-19 21:02:52',NULL,1),(183,23,6,'Presencia','2023-01-23 19:02:36','2023-01-23 19:02:36',NULL,1),(196,1,4,'98','2023-01-23 19:03:49','2023-01-23 19:03:49',NULL,2),(197,19,4,'41','2023-01-23 19:03:49','2023-01-23 19:03:49',NULL,2),(254,23,10,'Presencia','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,1),(255,22,10,'Presencia','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,1),(256,21,10,'Menor o igual a 2.2 NMP/100 ml','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,1),(257,20,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,1),(258,10,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(259,2,10,'Incolora','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(260,12,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(261,13,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(262,14,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(263,15,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(264,16,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(265,19,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(266,18,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,2),(267,19,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,3),(268,13,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,3),(269,15,10,'yyythhu009j','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,3),(270,16,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,3),(271,2,10,'Incolora','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(272,4,10,'Mayor a 3 UNT','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(273,7,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(274,19,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(275,11,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(276,24,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(277,1,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,4),(278,2,10,'turbia','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,6),(279,4,10,'Mayor a 3 UNT','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,6),(280,1,10,'10','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,6),(281,7,10,'41','2023-02-06 22:03:29','2023-02-06 22:03:29',NULL,6),(324,22,3,'Ausencia','2023-03-03 19:57:59','2023-03-03 19:57:59',NULL,1),(325,23,3,'Presencia','2023-03-03 19:57:59','2023-03-03 19:57:59',NULL,1),(326,21,3,'Menor o igual a 2.2 NMP/100 ml','2023-03-03 19:57:59','2023-03-03 19:57:59',NULL,1),(327,20,3,'7.5','2023-03-03 19:57:59','2023-03-03 19:57:59',NULL,1),(328,1,3,'7,5','2023-03-03 19:57:59','2023-03-03 19:57:59',NULL,1),(345,10,12,'1072,6','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(346,4,12,'Menor a 3 UNT','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(347,8,12,'Sin Valores extraños','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(348,2,12,'Incolora','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(349,17,12,'277,3','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(350,1,12,'7.74','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(351,7,12,'9.850','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(352,9,12,'5800','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(353,11,12,'1,0','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(354,12,12,'0,09','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(355,13,12,'0,10','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(356,14,12,'75,0','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(357,15,12,'307,3','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(358,16,12,'30,0','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(359,19,12,'0.034','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(360,18,12,'1659,0','2023-03-09 20:15:26','2023-03-09 20:15:26',NULL,2),(365,23,13,'Ausencia','2023-03-15 20:22:36','2023-03-15 20:22:36',NULL,1),(366,22,13,'Ausencia','2023-03-15 20:22:36','2023-03-15 20:22:36',NULL,1),(367,21,13,'Menor a 2.2 NMP/100 ml','2023-03-15 20:22:36','2023-03-15 20:22:36',NULL,1),(368,20,13,'2','2023-03-15 20:22:36','2023-03-15 20:22:36',NULL,1),(369,22,11,'Presencia','2023-03-23 18:42:29','2023-03-23 18:42:29',NULL,1),(370,23,11,'Ausencia','2023-03-23 18:42:29','2023-03-23 18:42:29',NULL,1),(371,21,11,'Menor a 2.2 NMP/100 ml','2023-03-23 18:42:29','2023-03-23 18:42:29',NULL,1),(372,20,11,'10','2023-03-23 18:42:29','2023-03-23 18:42:29',NULL,1),(389,22,14,'','2023-05-12 01:24:55','2023-05-12 01:24:55',NULL,1),(390,21,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,1),(391,20,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,1),(392,23,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,1),(393,2,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,6),(394,4,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,6),(395,1,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,6),(396,7,14,'','2023-05-12 01:24:56','2023-05-12 01:24:56',NULL,6),(401,19,17,'','2023-12-02 03:01:32','2023-12-02 03:01:32',NULL,3),(402,13,17,'','2023-12-02 03:01:32','2023-12-02 03:01:32',NULL,3),(403,15,17,'','2023-12-02 03:01:32','2023-12-02 03:01:32',NULL,3),(404,16,17,'','2023-12-02 03:01:32','2023-12-02 03:01:32',NULL,3),(405,20,18,'','2023-12-02 03:02:07','2023-12-02 03:02:07',NULL,1),(406,23,18,'','2023-12-02 03:02:07','2023-12-02 03:02:07',NULL,1),(407,2,19,'','2023-12-02 03:04:19','2023-12-02 03:04:19',NULL,4),(408,4,19,'','2023-12-02 03:04:19','2023-12-02 03:04:19',NULL,4),(409,7,19,'','2023-12-02 03:04:19','2023-12-02 03:04:19',NULL,4),(410,19,19,'','2023-12-02 03:04:19','2023-12-02 03:04:19',NULL,4),(411,24,19,'','2023-12-02 03:04:19','2023-12-02 03:04:19',NULL,4);
/*!40000 ALTER TABLE `regparanaaguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regparanasuelos`
--

DROP TABLE IF EXISTS `regparanasuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regparanasuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parSueloId` int DEFAULT NULL,
  `regAnaSueloId` int DEFAULT NULL,
  `tipAnaSueloId` int DEFAULT NULL,
  `valObt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regparsueloidParam_idx` (`parSueloId`),
  KEY `FK_tipanasuelo_regparanasuelo_idx` (`tipAnaSueloId`),
  KEY `FK_reganasuelo_regparanasuelo_idx` (`regAnaSueloId`),
  CONSTRAINT `FK_parSuelo_regparsuelo` FOREIGN KEY (`parSueloId`) REFERENCES `parsuelos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_reganasuelo_regparanasuelo` FOREIGN KEY (`regAnaSueloId`) REFERENCES `reganasuelos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tipanasuelo_regparanasuelo` FOREIGN KEY (`tipAnaSueloId`) REFERENCES `tipanasuelos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regparanasuelos`
--

LOCK TABLES `regparanasuelos` WRITE;
/*!40000 ALTER TABLE `regparanasuelos` DISABLE KEYS */;
INSERT INTO `regparanasuelos` (`id`, `parSueloId`, `regAnaSueloId`, `tipAnaSueloId`, `valObt`, `createdAt`, `updatedAt`) VALUES (234,13,6,1,'44.1','2023-01-12 23:38:14','2023-01-12 23:38:14'),(235,14,6,1,'33','2023-01-12 23:38:14','2023-01-12 23:38:14'),(236,12,6,1,'44','2023-01-12 23:38:14','2023-01-12 23:38:14'),(237,18,6,1,'55','2023-01-12 23:38:14','2023-01-12 23:38:14'),(238,19,6,1,'66','2023-01-12 23:38:14','2023-01-12 23:38:14'),(239,15,6,1,'33.1','2023-01-12 23:38:14','2023-01-12 23:38:14'),(240,16,6,1,'88','2023-01-12 23:38:14','2023-01-12 23:38:14'),(241,17,6,1,'99','2023-01-12 23:38:14','2023-01-12 23:38:14'),(248,13,11,1,'1','2023-03-03 19:56:25','2023-03-03 19:56:25'),(249,14,11,1,'7','2023-03-03 19:56:25','2023-03-03 19:56:25'),(250,18,11,1,'10','2023-03-03 19:56:25','2023-03-03 19:56:25'),(251,19,11,1,'','2023-03-03 19:56:25','2023-03-03 19:56:25'),(252,15,11,1,'       ','2023-03-03 19:56:25','2023-03-03 19:56:25'),(253,16,11,1,'','2023-03-03 19:56:25','2023-03-03 19:56:25'),(254,17,11,1,'','2023-03-03 19:56:25','2023-03-03 19:56:25'),(255,12,11,1,'','2023-03-03 19:56:25','2023-03-03 19:56:25'),(262,13,9,1,'1.565','2023-03-15 20:37:10','2023-03-15 20:37:10'),(263,14,9,1,'09','2023-03-15 20:37:10','2023-03-15 20:37:10'),(264,18,9,1,'15','2023-03-15 20:37:10','2023-03-15 20:37:10'),(265,19,9,1,'25','2023-03-15 20:37:10','2023-03-15 20:37:10'),(266,15,9,1,'77','2023-03-15 20:37:10','2023-03-15 20:37:10'),(267,16,9,1,'66','2023-03-15 20:37:10','2023-03-15 20:37:10'),(268,17,9,1,'55','2023-03-15 20:37:10','2023-03-15 20:37:10'),(269,12,9,1,'44','2023-03-15 20:37:10','2023-03-15 20:37:10'),(276,19,13,1,'10','2023-03-23 18:50:28','2023-03-23 18:50:28'),(277,13,13,1,'10','2023-03-23 18:50:28','2023-03-23 18:50:28'),(278,18,13,1,'10','2023-03-23 18:50:28','2023-03-23 18:50:28'),(282,13,12,1,'          kgh','2023-05-23 15:59:53','2023-05-23 15:59:53'),(283,18,12,1,'gj','2023-05-23 15:59:53','2023-05-23 15:59:53'),(284,19,12,1,'hgjg','2023-05-23 15:59:53','2023-05-23 15:59:53');
/*!40000 ALTER TABLE `regparanasuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speccies`
--

DROP TABLE IF EXISTS `speccies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speccies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `scientificName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `try` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `abreviatura` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sustrato` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `temperatura` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantityDays` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `scientificName` (`scientificName`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speccies`
--

LOCK TABLES `speccies` WRITE;
/*!40000 ALTER TABLE `speccies` DISABLE KEYS */;
INSERT INTO `speccies` (`id`, `scientificName`, `name`, `try`, `createdAt`, `updatedAt`, `abreviatura`, `sustrato`, `temperatura`, `quantityDays`) VALUES (5,'Zea Mays','Maiz',NULL,'2022-09-06 19:16:48','2023-03-13 20:09:01','S','ARENA','25',7),(6,'Triticum aestivum','Trigo',NULL,'2022-09-06 19:18:58','2023-03-13 20:11:00','S','ARENA','20',8),(7,'Helianthus annuus','Girasol',NULL,'2022-09-06 19:21:04','2023-03-09 19:49:43','S','ARENA','25',10),(10,'Glycine Max','Soja',NULL,'2022-09-06 19:50:37','2023-03-09 19:50:13','S','ARENA','25',8),(18,'Pisum sativum','Arveja',NULL,'2023-03-09 19:51:28','2023-03-09 19:53:15','S','ARENA','20',8),(19,'Medicago sativa','Alfalfa',NULL,'2023-03-13 20:10:32','2023-03-13 20:10:32','BP','EP','20',10),(20,'Avena sativa','Avena',NULL,'2023-03-13 20:12:08','2023-03-13 20:12:08','S','ARENA','20',10),(21,'Sorghum bicolor','Sorgo',NULL,'2023-03-13 20:14:36','2023-03-13 20:14:36','S','ARENA','20',10),(22,'Hordeum vulgare','Cebada',NULL,'2023-03-13 20:15:21','2023-03-13 20:15:21','S','ARENA','20',7),(23,'Lens culinaris','Lenteja',NULL,'2023-03-13 20:18:08','2023-03-13 20:18:08','S','ARENA','20',10),(24,'Secale cereale','Centeno',NULL,'2023-03-13 20:20:07','2023-03-13 20:20:07','S','ARENA','20',7);
/*!40000 ALTER TABLE `speccies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tetrazolios`
--

DROP TABLE IF EXISTS `tetrazolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tetrazolios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `semViables` float DEFAULT NULL,
  `AnalysisId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tetrazolies_analisis_id_idx` (`AnalysisId`),
  CONSTRAINT `FK_tetrazolies_analisis_id` FOREIGN KEY (`AnalysisId`) REFERENCES `analyses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tetrazolios`
--

LOCK TABLES `tetrazolios` WRITE;
/*!40000 ALTER TABLE `tetrazolios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tetrazolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipanaaguas`
--

DROP TABLE IF EXISTS `tipanaaguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipanaaguas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomTipAna` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `abrTipAna` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipanaaguas`
--

LOCK TABLES `tipanaaguas` WRITE;
/*!40000 ALTER TABLE `tipanaaguas` DISABLE KEYS */;
INSERT INTO `tipanaaguas` (`id`, `nomTipAna`, `abrTipAna`, `createdAt`, `updatedAt`) VALUES (1,'Bacteriológico','Bac','2022-09-05 03:05:42','2022-09-05 03:05:42'),(2,'Físico-Químico','FQ','2022-09-05 03:06:47','2022-09-05 03:06:47'),(3,'Químico-Completo','QC','2022-09-05 03:07:14','2022-09-05 03:07:14'),(4,'Químico-Parcial','QP','2022-09-05 03:07:34','2022-09-05 03:07:34'),(5,'Químico-Potabilidad','QPO','2022-09-05 03:08:14','2022-09-05 03:08:14'),(6,'Químico-Sumario','QS','2022-09-05 03:08:27','2022-09-05 03:08:27');
/*!40000 ALTER TABLE `tipanaaguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipanasuelos`
--

DROP TABLE IF EXISTS `tipanasuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipanasuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dscTipAna` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipanasuelos`
--

LOCK TABLES `tipanasuelos` WRITE;
/*!40000 ALTER TABLE `tipanasuelos` DISABLE KEYS */;
INSERT INTO `tipanasuelos` (`id`, `dscTipAna`, `createdAt`, `updatedAt`) VALUES (1,'Grupo 3','2022-08-28 00:43:57','2022-08-28 00:43:57');
/*!40000 ALTER TABLE `tipanasuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipparaguas`
--

DROP TABLE IF EXISTS `tipparaguas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipparaguas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipAnaAguaId` int DEFAULT NULL,
  `parAguaId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_tipparaguas_paraguaa_idx` (`parAguaId`),
  KEY `FH_tipparaguas_tipanaaguas_idx` (`tipAnaAguaId`),
  KEY `FK_tipparaguas_paraguas_idx` (`parAguaId`),
  CONSTRAINT `FK_tipparaguas_paraguuas` FOREIGN KEY (`parAguaId`) REFERENCES `paraguas` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tipparaguas_tipanaaguuas` FOREIGN KEY (`tipAnaAguaId`) REFERENCES `tipanaaguas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipparaguas`
--

LOCK TABLES `tipparaguas` WRITE;
/*!40000 ALTER TABLE `tipparaguas` DISABLE KEYS */;
INSERT INTO `tipparaguas` (`id`, `tipAnaAguaId`, `parAguaId`, `createdAt`, `updatedAt`, `order`) VALUES (4,6,2,'2022-10-17 14:09:33','2022-10-17 14:09:33',0),(5,6,4,'2022-10-17 14:09:33','2022-10-17 14:09:33',0),(6,6,1,'2022-10-17 14:09:33','2022-10-17 14:09:33',0),(7,6,7,'2022-10-17 14:09:33','2022-10-17 14:09:33',0),(8,2,2,'2022-10-17 14:42:12','2023-03-03 20:07:56',3),(9,2,8,'2022-10-17 14:42:12','2023-03-03 20:07:56',2),(10,2,4,'2022-10-17 14:42:12','2023-03-03 20:07:56',1),(11,2,17,'2022-10-17 14:43:48','2023-03-03 20:07:56',4),(12,2,1,'2022-10-17 14:43:48','2023-03-03 20:07:56',5),(13,2,7,'2022-10-17 14:43:48','2023-03-03 20:07:56',6),(14,2,9,'2022-10-17 14:43:48','2023-03-03 20:07:56',7),(15,2,10,'2022-10-17 14:43:48','2023-03-03 20:07:56',0),(16,2,11,'2022-10-17 14:43:48','2023-03-03 20:07:56',8),(17,2,12,'2022-10-17 14:43:48','2023-03-03 20:07:56',10),(18,2,13,'2022-10-17 14:43:48','2023-03-03 20:07:56',11),(19,2,14,'2022-10-17 14:43:48','2023-03-03 20:07:56',12),(20,2,15,'2022-10-17 14:43:48','2023-03-03 20:07:56',13),(21,2,16,'2022-10-17 14:43:48','2023-03-03 20:07:56',14),(22,2,19,'2022-10-17 14:43:48','2023-03-03 20:07:56',15),(23,2,18,'2022-10-17 14:43:48','2023-03-03 20:07:56',16),(24,1,22,'2022-10-17 15:22:58','2023-03-23 18:40:51',0),(25,1,23,'2022-10-17 15:22:58','2023-03-23 18:40:51',3),(26,1,21,'2022-10-17 15:22:58','2023-03-23 18:40:51',1),(27,1,20,'2022-10-17 15:22:58','2023-03-23 18:40:51',2),(28,4,2,'2022-10-17 15:35:17','2022-10-17 15:35:17',0),(29,4,4,'2022-10-17 15:35:17','2022-10-17 15:35:17',0),(30,4,7,'2022-10-17 15:36:07','2022-10-17 15:36:07',0),(31,4,19,'2022-10-17 15:36:07','2022-10-17 15:36:07',0),(32,4,11,'2022-10-17 15:36:07','2022-10-17 15:36:07',0),(33,4,24,'2022-10-17 15:36:07','2022-10-17 15:36:07',0),(34,4,1,'2022-10-17 15:36:42','2022-10-17 15:36:42',0),(35,3,19,'2022-11-01 19:54:54','2022-11-01 19:54:54',0),(36,3,13,'2022-11-01 19:54:54','2022-11-01 19:54:54',0),(37,3,15,'2022-11-01 19:54:54','2022-11-01 19:54:54',0),(38,3,16,'2022-11-01 19:54:54','2022-11-01 19:54:54',0);
/*!40000 ALTER TABLE `tipparaguas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipparsuelos`
--

DROP TABLE IF EXISTS `tipparsuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipparsuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipAnaSueloId` int DEFAULT NULL,
  `parSueloId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_tipanasuelo_parsuelo_id_idx` (`parSueloId`),
  KEY `FK_tipanasuelo_tipparsuelo_id_idx` (`tipAnaSueloId`),
  CONSTRAINT `FK_tipparsuelos_parsuelos_id` FOREIGN KEY (`parSueloId`) REFERENCES `parsuelos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_tipparsuelos_tipanasuelos_id` FOREIGN KEY (`tipAnaSueloId`) REFERENCES `tipanasuelos` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipparsuelos`
--

LOCK TABLES `tipparsuelos` WRITE;
/*!40000 ALTER TABLE `tipparsuelos` DISABLE KEYS */;
INSERT INTO `tipparsuelos` (`id`, `tipAnaSueloId`, `parSueloId`, `createdAt`, `updatedAt`, `order`) VALUES (10,1,13,'2022-09-05 18:31:35','2023-01-12 23:34:53',3),(11,1,14,'2022-09-05 18:31:35','2023-01-12 23:34:53',4),(13,1,18,'2022-09-05 18:35:51','2023-01-12 23:34:53',5),(14,1,19,'2022-09-05 18:35:51','2023-01-12 23:34:53',2),(15,1,15,'2022-09-05 18:35:51','2023-01-12 23:34:53',6),(16,1,16,'2022-09-05 18:35:51','2023-01-12 23:34:53',7),(17,1,17,'2022-09-05 18:35:51','2023-01-12 23:34:53',8),(19,1,21,'2023-01-12 19:33:25','2023-01-12 23:34:53',1),(20,1,12,'2023-01-12 23:34:48','2023-01-12 23:34:53',0);
/*!40000 ALTER TABLE `tipparsuelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES (1,'Test','admin@gmail.com','$2a$10$sfYPekhKspIWDag1e.d77uRhDBMSfJf3RoDO3JEVb0G1tggwD.RI.','2022-08-28 00:41:33','2022-08-28 00:41:33'),(2,'James Rodrigues','james@gmail.com','$2a$10$p.lH/TPBYkrsV9CBt9K82eb0Rq/j8Kx3ud6OFXkKyqD2XtZg15pn6','2023-05-22 19:58:10','2023-05-22 19:58:10');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varieties`
--

DROP TABLE IF EXISTS `varieties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varieties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `speccyId` int NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_varieties_species_idx` (`speccyId`),
  CONSTRAINT `FK_speccies_varieties` FOREIGN KEY (`speccyId`) REFERENCES `speccies` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varieties`
--

LOCK TABLES `varieties` WRITE;
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;
INSERT INTO `varieties` (`id`, `speccyId`, `uuid`, `name`, `active`, `description`, `createdAt`, `updatedAt`) VALUES (5,7,'3da6877d-8cdf-490f-a2d1-c6b27e11791e','Aguara 6',1,NULL,'2022-09-06 19:22:39','2022-09-16 18:44:07'),(6,7,'f5968bc6-bef3-4f48-bca6-eaa2fea9001e','Cacique 312',1,NULL,'2022-09-06 19:23:07','2022-09-06 19:23:07'),(7,7,'e597520c-fb69-423b-8b98-968675f060ed','Syn-4066',1,NULL,'2022-09-06 19:24:24','2022-09-06 19:24:24'),(9,10,'589be569-3ccd-47d6-bafc-e475f4aed85a','N A 5009 RG',1,NULL,'2022-10-17 13:16:46','2022-10-17 13:17:40'),(10,10,'e07b99aa-8a96-4039-920e-08dc4cee30c0','DM 4612 RSF',1,NULL,'2022-10-17 13:17:19','2022-10-17 13:17:19'),(11,10,'72bc94d5-c369-487b-b81c-9bec73efbf40','DM 3810',1,NULL,'2022-10-17 13:18:05','2022-10-17 13:18:05'),(12,10,'7854521c-85d1-4790-945e-71c698f38e99','SYN SPS 4x4',1,NULL,'2022-10-17 13:18:42','2022-10-17 13:18:42'),(13,6,'cb4d95d1-7b6b-495e-a987-3fc0ae289118','Baguette 620',1,NULL,'2022-10-17 13:21:19','2022-10-17 13:21:19'),(14,6,'e1c9fbfe-c2f8-494e-8989-8eeeb2500b1f','ACA 360.3',1,NULL,'2022-10-17 13:23:49','2022-11-01 19:46:23'),(15,5,'4c69d621-bfa5-47ff-90a1-af16cb214e40','SYN 979 Vipterra',1,NULL,'2022-10-17 13:28:12','2022-10-17 13:28:12'),(16,5,'ced42e8e-40c1-4110-8088-54276f15cc45','NK 890 Vipterra',1,NULL,'2022-10-17 13:28:31','2022-10-17 13:28:31'),(17,10,'aa31048b-32b4-466d-a5af-0909ba437528','ND',1,NULL,'2023-03-03 20:12:10','2023-03-03 20:12:10'),(18,6,'9c3bf552-0789-45d4-8867-a84a0d62ee1f','Pehuen',1,NULL,'2023-03-09 14:50:05','2023-03-09 14:50:05'),(21,10,'618301b9-6a50-4a3b-a507-21701ef8791f','MD',1,NULL,'2023-03-23 18:45:04','2023-03-23 18:45:04'),(23,10,'b761b0d2-4caa-4e05-a406-55ce64bea422','MD',1,NULL,'2023-05-17 22:13:56','2023-05-17 22:13:56');
/*!40000 ALTER TABLE `varieties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vigors`
--

DROP TABLE IF EXISTS `vigors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vigors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rtdo` float DEFAULT NULL,
  `temperatura` float DEFAULT NULL,
  `sustrato` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `fecFinIncub` datetime DEFAULT NULL,
  `fecIncubFrio` datetime DEFAULT NULL,
  `fecCalor` datetime DEFAULT NULL,
  `fecIniIncub` datetime DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  `AnalysisId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vigores_analisis_id_idx` (`AnalysisId`),
  CONSTRAINT `FK_vigores_analisis_id` FOREIGN KEY (`AnalysisId`) REFERENCES `analyses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vigors`
--

LOCK TABLES `vigors` WRITE;
/*!40000 ALTER TABLE `vigors` DISABLE KEYS */;
INSERT INTO `vigors` (`id`, `rtdo`, `temperatura`, `sustrato`, `createdAt`, `fecFinIncub`, `fecIncubFrio`, `fecCalor`, `fecIniIncub`, `updatedAt`, `AnalysisId`) VALUES (3,90,NULL,NULL,'2023-03-13 20:23:04','2023-03-15 00:00:00','2023-03-09 00:00:00','2023-03-23 00:00:00','2023-03-06 00:00:00','2023-05-18 22:49:10',10),(4,12,NULL,NULL,'2023-05-18 23:16:58','2023-05-27 00:00:00','2023-05-28 00:00:00','2023-05-21 00:00:00','2023-05-01 00:00:00','2023-05-19 00:31:58',22);
/*!40000 ALTER TABLE `vigors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 21:06:55
