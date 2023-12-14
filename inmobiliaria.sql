-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: inmobiliaria
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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `role` varchar(12) NOT NULL DEFAULT 'admin',
  `email` varchar(70) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `passwordChangedAt` datetime DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetExpires` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_organization_id_account_unique` (`email`,`OrganizationId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `username`, `role`, `email`, `OrganizationId`, `password`, `avatar`, `passwordChangedAt`, `passwordResetToken`, `passwordResetExpires`, `createdAt`, `updatedAt`) VALUES (2,'turay390','admin','turay390@gmail.com',3,'$2a$12$wCezXjsw7gIDU/krp1ZhAukaiGWakmWCxvcVFSIjU6sSjlDfmFNXe',NULL,NULL,NULL,NULL,'2023-12-03 22:20:00','2023-12-04 19:51:52');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrators` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `role` varchar(12) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `passwordChangedAt` datetime DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetExpires` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id_account_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` (`id`, `username`, `role`, `email`, `password`, `avatar`, `passwordChangedAt`, `passwordResetToken`, `passwordResetExpires`, `createdAt`, `updatedAt`) VALUES (1,'Test','superAdmin','admin@gmail.com','$2a$12$FDBM1hiQCJS8mN0ubHt9Uedq1y8sBY3iMIsII2SyNXfvXYdJi1on6',NULL,NULL,NULL,NULL,'2023-12-03 21:19:30','2023-12-03 21:19:30');
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PropertyId` bigint NOT NULL,
  `type` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `state` varchar(11) DEFAULT 'En curso',
  `charged` tinyint(1) DEFAULT '0',
  `belongsTo` varchar(11) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `category` varchar(15) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PropertyId` (`PropertyId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`PropertyId`) REFERENCES `properties` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `budgets_ibfk_2` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claims`
--

DROP TABLE IF EXISTS `claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claims` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PropertyId` bigint NOT NULL,
  `state` varchar(10) NOT NULL DEFAULT 'Abierto',
  `details` longtext,
  `description` varchar(255) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `OrganizationId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PropertyId` (`PropertyId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`PropertyId`) REFERENCES `properties` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `claims_ibfk_2` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claims`
--

LOCK TABLES `claims` WRITE;
/*!40000 ALTER TABLE `claims` DISABLE KEYS */;
INSERT INTO `claims` (`id`, `PropertyId`, `state`, `details`, `description`, `createdAt`, `updatedAt`, `OrganizationId`) VALUES (1,4,'Abierto','[{\"comment\":\"Primer comentario de Jean\",\"date\":\"2023-12-05T14:54:22.763Z\",\"id\":\"c31abbd8-a00b-4ca4-bafc-519768c5db5d\"}]','PRIMER RECLAMO DE L SISTEMA','2023-12-05','2023-12-05',3);
/*!40000 ALTER TABLE `claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractpersons`
--

DROP TABLE IF EXISTS `contractpersons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractpersons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ContractId` bigint NOT NULL,
  `PersonId` bigint NOT NULL,
  `role` varchar(10) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `person_contract_role_unique` (`PersonId`,`ContractId`,`role`),
  KEY `ContractId` (`ContractId`),
  CONSTRAINT `contractpersons_ibfk_1` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contractpersons_ibfk_2` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractpersons`
--

LOCK TABLES `contractpersons` WRITE;
/*!40000 ALTER TABLE `contractpersons` DISABLE KEYS */;
INSERT INTO `contractpersons` (`id`, `ContractId`, `PersonId`, `role`, `createdAt`, `updatedAt`) VALUES (1,1,5,'INQUILINO','2023-12-04 20:48:39','2023-12-04 20:48:39'),(2,1,5,'GARANTE','2023-12-04 20:48:39','2023-12-04 20:48:39'),(3,2,4,'INQUILINO','2023-12-04 20:55:12','2023-12-04 20:55:12'),(12,3,7,'INQUILINO','2023-12-05 15:11:10','2023-12-05 15:11:10'),(13,3,9,'GARANTE','2023-12-05 15:11:10','2023-12-05 15:11:10'),(14,4,6,'INQUILINO','2023-12-11 14:15:29','2023-12-11 14:15:29'),(15,4,5,'GARANTE','2023-12-11 14:15:29','2023-12-11 14:15:29'),(20,2,8,'GARANTE','2023-12-11 14:34:13','2023-12-11 14:34:13'),(21,2,7,'GARANTE','2023-12-11 14:34:13','2023-12-11 14:34:13'),(22,2,4,'GARANTE','2023-12-11 14:34:13','2023-12-11 14:34:13'),(23,2,10,'GARANTE','2023-12-11 14:34:13','2023-12-11 14:34:13');
/*!40000 ALTER TABLE `contractpersons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractprices`
--

DROP TABLE IF EXISTS `contractprices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contractprices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ContractId` bigint NOT NULL,
  `amount` float NOT NULL,
  `percent` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `amount_contractid_createdat_unique` (`amount`,`ContractId`,`createdAt`),
  KEY `ContractId` (`ContractId`),
  CONSTRAINT `contractprices_ibfk_1` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractprices`
--

LOCK TABLES `contractprices` WRITE;
/*!40000 ALTER TABLE `contractprices` DISABLE KEYS */;
INSERT INTO `contractprices` (`id`, `ContractId`, `amount`, `percent`, `createdAt`, `updatedAt`) VALUES (1,1,150000,0,'2023-12-04 20:48:39','2023-12-04 20:48:39'),(2,2,135000,0,'2023-12-04 20:55:12','2023-12-04 20:55:12'),(3,3,250000,0,'2023-12-05 15:11:10','2023-12-05 15:11:10'),(4,4,87878,0,'2023-12-11 14:15:29','2023-12-11 14:15:29'),(5,3,765000,206,'2023-12-11 15:31:16','2023-12-11 15:31:16'),(6,3,994500,30,'2023-12-11 15:31:24','2023-12-11 15:31:24'),(7,3,1004440,1,'2023-12-11 18:13:15','2023-12-11 18:13:15'),(8,3,1024530,2,'2023-12-11 18:16:50','2023-12-11 18:16:50'),(9,3,1034780,1,'2023-12-11 18:17:16','2023-12-11 18:17:16'),(10,3,1035820,0.1,'2023-12-11 18:18:19','2023-12-11 18:18:19'),(11,3,1046180,1,'2023-12-11 18:20:49','2023-12-11 18:20:49'),(12,1,165000,10,'2023-12-11 18:24:38','2023-12-11 18:24:38'),(13,1,202950,23,'2023-12-11 18:24:50','2023-12-11 18:24:50'),(14,3,1150800,10,'2023-12-11 18:26:40','2023-12-11 18:26:40'),(15,4,175756,100,'2023-12-11 18:29:09','2023-12-11 18:29:09');
/*!40000 ALTER TABLE `contractprices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PropertyId` bigint NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `admFeesPorc` float NOT NULL DEFAULT '2',
  `state` varchar(10) DEFAULT 'En curso',
  `comission` float NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `booking` float DEFAULT NULL,
  `deposit` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `motive` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `property_organization_state_unique` (`OrganizationId`,`PropertyId`,`startDate`,`state`),
  KEY `PropertyId` (`PropertyId`),
  CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`PropertyId`) REFERENCES `properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` (`id`, `PropertyId`, `startDate`, `endDate`, `admFeesPorc`, `state`, `comission`, `OrganizationId`, `booking`, `deposit`, `description`, `motive`, `createdAt`, `updatedAt`) VALUES (1,2,'2023-12-01','2027-12-31',2,'Finalizado',8,3,0,0,'','','2023-12-04 20:48:39','2023-12-11 13:52:50'),(2,3,'2022-12-01','2024-11-30',2,'En curso',10,3,677,57567,'una descripcion',NULL,'2023-12-04 20:55:12','2023-12-05 03:02:33'),(3,4,'2024-01-06','2025-01-05',2,'En curso',9,3,0,0,'',NULL,'2023-12-05 15:11:10','2023-12-05 15:11:10'),(4,2,'2023-11-26','2024-01-06',2,'En curso',7,3,0,0,'',NULL,'2023-12-11 14:15:29','2023-12-11 14:17:23');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtlogs`
--

DROP TABLE IF EXISTS `debtlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debtlogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `OrganizationId` bigint DEFAULT NULL,
  `ContractId` bigint DEFAULT NULL,
  `PersonId` bigint DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OrganizationId` (`OrganizationId`),
  KEY `ContractId` (`ContractId`),
  KEY `PersonId` (`PersonId`),
  CONSTRAINT `debtlogs_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `debtlogs_ibfk_2` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `debtlogs_ibfk_3` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtlogs`
--

LOCK TABLES `debtlogs` WRITE;
/*!40000 ALTER TABLE `debtlogs` DISABLE KEYS */;
INSERT INTO `debtlogs` (`id`, `title`, `status`, `OrganizationId`, `ContractId`, `PersonId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (1,'SE GENERARON CON EXITO LAS DEUDAS DE Noviembre/2023 PARA EL CONTRATO DE LA PROPIEDAD Mendoza 45966 10 B','SUCCESS',3,2,NULL,'2023-12-05 19:18:43','2023-12-05 19:18:43',NULL),(3,'ERROR AL GENERAR LAS DEUDAS DE Noviembre/2023 PARA LOS PROPPIETARIOS ','FAIL',NULL,NULL,NULL,'2023-12-05 19:24:05','2023-12-05 19:24:05',NULL),(5,'ERROR AL GENERAR LAS DEUDAS DE Noviembre/2023 PARA LOS PROPPIETARIOS ','FAIL',NULL,NULL,NULL,'2023-12-05 19:27:18','2023-12-05 19:27:18',NULL),(7,'ERROR AL GENERAR LAS DEUDAS DE Noviembre/2023 PARA LOS PROPPIETARIOS ','FAIL',NULL,NULL,NULL,'2023-12-05 19:27:50','2023-12-05 19:27:50',NULL),(9,'ERROR AL GENERAR LAS DEUDAS DE Noviembre/2023 PARA LOS PROPPIETARIOS ','FAIL',NULL,NULL,NULL,'2023-12-05 19:29:11','2023-12-05 19:29:11',NULL),(11,'ERROR AL GENERAR LAS DEUDAS DE Noviembre/2023 PARA LOS PROPPIETARIOS ','FAIL',NULL,NULL,NULL,'2023-12-05 19:30:00','2023-12-05 19:30:00',NULL),(12,'SE GENERARON CON EXITO LAS DEUDAS DE Noviembre/2023 PARA EL PROPPIETARIO Propietario Jean','SUCCESS',3,NULL,1,'2023-12-05 19:31:31','2023-12-05 19:31:31',NULL),(13,'SE GENERARON CON EXITO LAS DEUDAS DE Noviembre/2023 PARA EL PROPPIETARIO James Pierre','SUCCESS',3,NULL,2,'2023-12-05 19:31:31','2023-12-05 19:31:31',NULL),(14,'SE GENERARON CON EXITO LAS DEUDAS DE Noviembre/2023 PARA EL PROPPIETARIO fakename19196','SUCCESS',3,NULL,3,'2023-12-05 19:31:31','2023-12-05 19:31:31',NULL);
/*!40000 ALTER TABLE `debtlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debts`
--

DROP TABLE IF EXISTS `debts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `OrganizationId` bigint NOT NULL,
  `ContractId` bigint NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  `amount` float NOT NULL,
  `description` varchar(100) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `rent` tinyint(1) NOT NULL DEFAULT '0',
  `debt` tinyint(1) NOT NULL DEFAULT '1',
  `paidDate` datetime DEFAULT NULL,
  `isOwner` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `OrganizationId` (`OrganizationId`),
  KEY `ContractId` (`ContractId`),
  CONSTRAINT `debts_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `debts_ibfk_2` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debts`
--

LOCK TABLES `debts` WRITE;
/*!40000 ALTER TABLE `debts` DISABLE KEYS */;
INSERT INTO `debts` (`id`, `OrganizationId`, `ContractId`, `month`, `year`, `amount`, `description`, `paid`, `rent`, `debt`, `paidDate`, `isOwner`, `createdAt`, `updatedAt`) VALUES (1,3,2,11,2023,135000,'ALQUILER Mendoza 45966 10 BNoviembre/2023',0,1,1,NULL,0,'2023-12-05 19:18:43','2023-12-05 19:18:43'),(2,3,2,11,2023,2700,'GASTOS DE GESTION Noviembre/2023',0,0,1,NULL,0,'2023-12-05 19:18:43','2023-12-05 19:18:43'),(3,3,2,11,2023,3500,'SEGURO Noviembre/2023',0,0,1,NULL,0,'2023-12-05 19:18:43','2023-12-05 19:18:43'),(4,3,2,11,2023,250,'COMPENSASION Noviembre/2023',0,0,1,NULL,0,'2023-12-05 19:18:43','2023-12-05 19:18:43'),(10,3,2,11,2023,135000,'ALQUILER Mendoza 45966 10 B Noviembre/2023',0,1,1,NULL,1,'2023-12-05 19:31:31','2023-12-11 14:14:10'),(11,3,2,11,2023,-13500,'HONORARIOS Mendoza 45966 10 B Noviembre/2023',0,0,1,NULL,1,'2023-12-05 19:31:31','2023-12-11 14:14:10'),(12,3,2,11,2023,750,'API Noviembre/2023',1,0,1,'2023-12-11 18:30:33',1,'2023-12-05 19:31:31','2023-12-11 18:30:33');
/*!40000 ALTER TABLE `debts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventualities`
--

DROP TABLE IF EXISTS `eventualities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventualities` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PropertyId` bigint DEFAULT NULL,
  `paymentId` bigint DEFAULT NULL,
  `ContractId` bigint DEFAULT NULL,
  `clientAmount` float NOT NULL,
  `ownerAmount` float NOT NULL,
  `clientPaid` datetime DEFAULT NULL,
  `ownerPaid` datetime DEFAULT NULL,
  `isReverted` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expiredDate` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `OrganizationId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PropertyId` (`PropertyId`),
  KEY `ContractId` (`ContractId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `eventualities_ibfk_1` FOREIGN KEY (`PropertyId`) REFERENCES `properties` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `eventualities_ibfk_2` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `eventualities_ibfk_3` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventualities`
--

LOCK TABLES `eventualities` WRITE;
/*!40000 ALTER TABLE `eventualities` DISABLE KEYS */;
INSERT INTO `eventualities` (`id`, `PropertyId`, `paymentId`, `ContractId`, `clientAmount`, `ownerAmount`, `clientPaid`, `ownerPaid`, `isReverted`, `title`, `description`, `expiredDate`, `createdAt`, `updatedAt`, `OrganizationId`) VALUES (1,2,NULL,NULL,1200,700,'2023-12-05 03:37:34',NULL,0,'REPARACION DEL BANO','','2023-12-05','2023-12-04 21:04:22','2023-12-11 14:13:52',3),(2,NULL,NULL,2,500,0,'2023-12-05 03:36:20',NULL,0,'Compra de materias primas','','2023-12-05','2023-12-04 21:04:51','2023-12-05 03:36:20',3),(3,NULL,NULL,2,455,200,'2023-12-05 03:28:35',NULL,0,'Una eventualidad de prueba','','2023-12-05','2023-12-05 02:58:55','2023-12-11 14:14:12',3),(6,NULL,7,1,76600,0,'2023-12-05 03:45:08',NULL,1,'Saldo Diciembre/2023','Saldo Diciembre/2023','2024-01-04','2023-12-05 03:37:34','2023-12-05 03:45:08',3);
/*!40000 ALTER TABLE `eventualities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ContractId` bigint NOT NULL,
  `description` varchar(20) NOT NULL,
  `amount` float NOT NULL,
  `isOwner` tinyint(1) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `OrganizationId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ContractId` (`ContractId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` (`id`, `ContractId`, `description`, `amount`, `isOwner`, `createdAt`, `updatedAt`, `OrganizationId`) VALUES (1,1,'SEGURO',1400,0,'2023-12-04 21:01:03','2023-12-04 21:01:03',3),(2,1,'TGI',900,0,'2023-12-04 21:01:31','2023-12-04 21:01:31',3),(3,1,'API',350,0,'2023-12-04 21:02:01','2023-12-04 21:02:01',3),(4,1,'AGUAS',3000,1,'2023-12-04 21:02:26','2023-12-04 21:02:26',3),(5,2,'API',750,1,'2023-12-04 21:02:41','2023-12-04 21:02:41',3),(6,2,'SEGURO',3500,0,'2023-12-04 21:02:53','2023-12-04 21:02:53',3),(7,2,'COMPENSASION',250,0,'2023-12-04 21:03:05','2023-12-04 21:03:05',3);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maillogs`
--

DROP TABLE IF EXISTS `maillogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maillogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `motive` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `OrganizationId` bigint DEFAULT NULL,
  `PersonId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `OrganizationId` (`OrganizationId`),
  KEY `PersonId` (`PersonId`),
  CONSTRAINT `maillogs_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `maillogs_ibfk_2` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maillogs`
--

LOCK TABLES `maillogs` WRITE;
/*!40000 ALTER TABLE `maillogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `maillogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PlanId` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  `docType` varchar(50) NOT NULL,
  `docNumber` varchar(15) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(70) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `direction` varchar(20) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  KEY `PlanId` (`PlanId`),
  CONSTRAINT `organizations_ibfk_1` FOREIGN KEY (`PlanId`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` (`id`, `PlanId`, `name`, `docType`, `docNumber`, `phone`, `email`, `country`, `province`, `city`, `direction`, `avatar`, `createdAt`, `updatedAt`) VALUES (2,1,'Immobiliaria Centro','CUIT','90867536292','34172079883','admcentro@gmail.com',NULL,NULL,NULL,NULL,NULL,'2023-12-03 22:00:35','2023-12-03 22:00:35'),(3,1,'Turay','CUIL','95904838','3427207882','turay390@gmail.com',NULL,NULL,NULL,NULL,'https://res.cloudinary.com/draxircbk/image/upload/v1649478136/jhmesseroux/hilaire_qzluvj.jpg','2023-12-03 22:20:00','2023-12-03 22:20:00');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgpayments`
--

DROP TABLE IF EXISTS `orgpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgpayments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `OrganizationId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_organization_id_zone_unique` (`OrganizationId`),
  CONSTRAINT `orgpayments_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgpayments`
--

LOCK TABLES `orgpayments` WRITE;
/*!40000 ALTER TABLE `orgpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `orgpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `key` varchar(20) NOT NULL,
  `value` varchar(500) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_organization_id_parameter_unique` (`key`,`OrganizationId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `parameters_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` (`id`, `key`, `value`, `OrganizationId`, `description`, `createdAt`, `updatedAt`) VALUES (1,'TEXT_VEN_CONT','Texto que se enviara cuando avisan a los inquilinos sobre el vencimiento de sus contratos ..',3,'','2023-12-03 23:26:17','2023-12-03 23:26:17'),(2,'GASTOS_BANCARIOS','1500',3,'Lo que pagan los inquilinos cuando pagan con transferencias bancarias','2023-12-04 20:26:06','2023-12-04 20:26:06'),(3,'PUNITORIOS_DIARIO','0.5',3,'','2023-12-04 20:28:31','2023-12-04 20:28:31');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ContractId` bigint DEFAULT NULL,
  `PersonId` bigint DEFAULT NULL,
  `PaymentTypeId` bigint NOT NULL,
  `recharge` float NOT NULL DEFAULT '0',
  `year` int NOT NULL,
  `month` int NOT NULL,
  `total` float NOT NULL,
  `paidTotal` float DEFAULT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `paidCurrentMonth` tinyint(1) NOT NULL DEFAULT '0',
  `expenseDetails` longtext,
  `date` date NOT NULL DEFAULT '2023-12-03',
  `eventualityDetails` longtext,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `OrganizationId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ContractId` (`ContractId`),
  KEY `PersonId` (`PersonId`),
  KEY `PaymentTypeId` (`PaymentTypeId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ContractId`) REFERENCES `contracts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`PaymentTypeId`) REFERENCES `paymenttypes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_4` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `ContractId`, `PersonId`, `PaymentTypeId`, `recharge`, `year`, `month`, `total`, `paidTotal`, `obs`, `paidCurrentMonth`, `expenseDetails`, `date`, `eventualityDetails`, `createdAt`, `updatedAt`, `OrganizationId`) VALUES (3,2,NULL,2,0,2023,12,136955,0,'',1,'[{\"ContractId\":2,\"date\":\"12/5/2023,\",\"updatedAt\":\"12/5/2023, 12:28:18 AM\",\"deletedAt\":null,\"description\":\"ALQUILER Mendoza 45966 10 B Diciembre/2023\",\"amount\":135000,\"createdAt\":\"1701746898478\",\"paidCurrentMonth\":true,\"id\":\"0d74771b-07c4-42f3-a73a-064b2f66bd69\"},{\"id\":1701746914993,\"description\":\"Gastos Bancarios\",\"amount\":1500,\"isBankExpense\":true,\"createdAt\":\"12/5/2023, 12:28:34 AM\"}]','2023-12-05','[{\"id\":3,\"PropertyId\":null,\"paymentId\":null,\"ContractId\":2,\"clientAmount\":455,\"ownerAmount\":200,\"clientPaid\":null,\"ownerPaid\":null,\"isReverted\":false,\"title\":\"Una eventualidad de prueba\",\"description\":\"\",\"expiredDate\":\"2023-12-05\",\"createdAt\":\"2023-12-05T02:58:55.000Z\",\"updatedAt\":\"2023-12-05T03:28:00.000Z\",\"OrganizationId\":3}]','2023-12-05 03:28:35','2023-12-05 03:28:35',3),(5,2,NULL,3,0,2023,12,6950,0,'',0,'[{\"ContractId\":2,\"date\":\"12/5/2023,\",\"updatedAt\":\"12/5/2023, 12:35:49 AM\",\"deletedAt\":null,\"description\":\"GASTOS DE GESTION Diciembre/2023\",\"amount\":2700,\"createdAt\":\"1701747349577\",\"id\":\"034f8da4-6808-4b39-b62b-d57cc197a17c\"},{\"id\":7,\"ContractId\":2,\"description\":\"COMPENSASION Diciembre/2023\",\"amount\":250,\"isOwner\":false,\"createdAt\":\"2023-12-04T21:03:05.000Z\",\"updatedAt\":\"2023-12-04T21:03:05.000Z\",\"OrganizationId\":3},{\"id\":6,\"ContractId\":2,\"description\":\"SEGURO Diciembre/2023\",\"amount\":3500,\"isOwner\":false,\"createdAt\":\"2023-12-04T21:02:53.000Z\",\"updatedAt\":\"2023-12-04T21:02:53.000Z\",\"OrganizationId\":3}]','2023-12-05','[{\"id\":2,\"PropertyId\":null,\"paymentId\":null,\"ContractId\":2,\"clientAmount\":500,\"ownerAmount\":0,\"clientPaid\":null,\"ownerPaid\":null,\"isReverted\":false,\"title\":\"Compra de materias primas\",\"description\":\"\",\"expiredDate\":\"2023-12-05\",\"createdAt\":\"2023-12-04T21:04:51.000Z\",\"updatedAt\":\"2023-12-05T03:28:00.000Z\",\"OrganizationId\":3}]','2023-12-05 03:36:20','2023-12-05 03:36:20',3),(6,1,NULL,2,0,2023,12,2750,0,'',0,'[{\"id\":2,\"ContractId\":1,\"description\":\"TGI Diciembre/2023\",\"amount\":900,\"isOwner\":false,\"createdAt\":\"2023-12-04T21:01:31.000Z\",\"updatedAt\":\"2023-12-04T21:01:31.000Z\",\"OrganizationId\":3},{\"id\":3,\"ContractId\":1,\"description\":\"API Diciembre/2023\",\"amount\":350,\"isOwner\":false,\"createdAt\":\"2023-12-04T21:02:01.000Z\",\"updatedAt\":\"2023-12-04T21:02:01.000Z\",\"OrganizationId\":3},{\"id\":1701747411797,\"description\":\"Gastos Bancarios\",\"amount\":1500,\"isBankExpense\":true,\"createdAt\":\"12/5/2023, 12:36:51 AM\"}]','2023-12-05','[]','2023-12-05 03:36:51','2023-12-05 03:36:51',3),(7,1,NULL,1,0,2023,12,155600,79000,'',1,'[{\"ContractId\":1,\"date\":\"12/5/2023,\",\"updatedAt\":\"12/5/2023, 12:37:02 AM\",\"deletedAt\":null,\"description\":\"GASTOS DE GESTION Diciembre/2023\",\"amount\":3000,\"createdAt\":\"1701747422938\",\"id\":\"2061a64c-dc27-41b5-8c89-bf4510dff494\"},{\"id\":1,\"ContractId\":1,\"description\":\"SEGURO Diciembre/2023\",\"amount\":1400,\"isOwner\":false,\"createdAt\":\"2023-12-04T21:01:03.000Z\",\"updatedAt\":\"2023-12-04T21:01:03.000Z\",\"OrganizationId\":3},{\"ContractId\":1,\"date\":\"12/5/2023,\",\"updatedAt\":\"12/5/2023, 12:37:02 AM\",\"deletedAt\":null,\"description\":\"ALQUILER Sarmiento 87124 25 5 Diciembre/2023\",\"amount\":150000,\"createdAt\":\"1701747422938\",\"paidCurrentMonth\":true,\"id\":\"0d27c9f2-dd41-4348-8805-c2a7f45840be\"}]','2023-12-05','[{\"id\":1,\"PropertyId\":2,\"paymentId\":null,\"ContractId\":null,\"clientAmount\":1200,\"ownerAmount\":700,\"clientPaid\":null,\"ownerPaid\":null,\"isReverted\":false,\"title\":\"REPARACION DEL BANO\",\"description\":\"\",\"expiredDate\":\"2023-12-05\",\"createdAt\":\"2023-12-04T21:04:22.000Z\",\"updatedAt\":\"2023-12-05T03:27:56.000Z\",\"OrganizationId\":3}]','2023-12-05 03:37:34','2023-12-05 03:37:34',3),(9,1,NULL,3,0,2023,12,76600,0,'',0,'[]','2023-12-05','[{\"id\":6,\"PropertyId\":null,\"paymentId\":7,\"ContractId\":1,\"clientAmount\":76600,\"ownerAmount\":0,\"clientPaid\":null,\"ownerPaid\":null,\"isReverted\":true,\"title\":\"Saldo Diciembre/2023\",\"description\":\"Saldo Diciembre/2023\",\"expiredDate\":\"2024-01-04\",\"createdAt\":\"2023-12-05T03:37:34.000Z\",\"updatedAt\":\"2023-12-05T03:37:34.000Z\",\"OrganizationId\":3}]','2023-12-05 03:45:08','2023-12-05 03:45:08',3),(14,NULL,1,3,0,2023,12,87878,NULL,'',0,'[{\"amount\":87878,\"description\":\"ALQUILER Sarmiento 87124 25 5 Diciembre/2023\",\"id\":\"f2513d1c-023f-4d06-95c9-4b75647c7e3c\",\"ContractId\":4,\"paidCurrentMonth\":true,\"rent\":true,\"createdAt\":\"12/11/2023, 11:23:11 AM\",\"updatedAt\":\"12/11/2023, 11:23:11 AM\"}]','2023-12-11','[]','2023-12-11 14:23:18','2023-12-11 14:23:18',3),(15,2,NULL,3,0,2023,12,750,0,'',0,'[{\"id\":12,\"OrganizationId\":3,\"ContractId\":2,\"month\":11,\"year\":2023,\"amount\":750,\"description\":\"API Noviembre/2023\",\"paid\":false,\"rent\":false,\"debt\":true,\"paidDate\":null,\"isOwner\":true,\"createdAt\":\"2023-12-05T19:31:31.000Z\",\"updatedAt\":\"2023-12-11T14:14:08.000Z\",\"Contract\":{\"id\":2,\"PropertyId\":3,\"startDate\":\"2022-12-01\",\"endDate\":\"2024-11-30\",\"admFeesPorc\":2,\"state\":\"En curso\",\"comission\":10,\"OrganizationId\":3,\"booking\":677,\"deposit\":57567,\"description\":\"una descripcion\",\"motive\":null,\"createdAt\":\"2023-12-04T20:55:12.000Z\",\"updatedAt\":\"2023-12-05T03:02:33.000Z\",\"Property\":{\"id\":3,\"city\":\"LUJAN\",\"province\":\"San Luis\",\"ZoneId\":3,\"PropertyTypeId\":4,\"PersonId\":2,\"street\":\"Mendoza\",\"number\":\"45966\",\"isFor\":\"Alquiler\",\"state\":\"Ocupado\",\"folderNumber\":\"45966\",\"OrganizationId\":3,\"description\":null,\"nroPartWater\":\"\",\"nroPartMuni\":\"\",\"nroPartAPI\":\"\",\"nroPartGas\":\"\",\"floor\":\"10\",\"dept\":\"B\",\"createdAt\":\"2023-12-04T20:36:27.000Z\",\"updatedAt\":\"2023-12-04T20:55:12.000Z\"}}}]','2023-12-11','[]','2023-12-11 18:30:33','2023-12-11 18:30:33',3);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymenttypes`
--

DROP TABLE IF EXISTS `paymenttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymenttypes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_organization_id_pmtType_unique` (`name`,`OrganizationId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `paymenttypes_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymenttypes`
--

LOCK TABLES `paymenttypes` WRITE;
/*!40000 ALTER TABLE `paymenttypes` DISABLE KEYS */;
INSERT INTO `paymenttypes` (`id`, `name`, `OrganizationId`, `createdAt`, `updatedAt`) VALUES (1,'Efectivo',3,'2023-12-04 20:18:57','2023-12-04 20:18:57'),(2,'Transferencias Bancarias',3,'2023-12-04 20:19:01','2023-12-04 20:19:01'),(3,'Tarjeta de Débito',3,'2023-12-04 20:23:17','2023-12-04 20:23:17'),(5,'Criptomonedas',3,'2023-12-04 20:23:47','2023-12-04 20:23:47');
/*!40000 ALTER TABLE `paymenttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fullName` varchar(50) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `docType` varchar(9) NOT NULL,
  `docNumber` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `isOwner` tinyint(1) NOT NULL DEFAULT '0',
  `province` varchar(70) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL,
  `codePostal` varchar(10) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `docType_docNumber_OrganizationId_unique` (`docType`,`docNumber`,`OrganizationId`),
  UNIQUE KEY `email_organization_unique` (`email`,`OrganizationId`),
  UNIQUE KEY `phone_organization_unique` (`phone`,`OrganizationId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` (`id`, `fullName`, `OrganizationId`, `phone`, `email`, `docType`, `docNumber`, `address`, `isOwner`, `province`, `city`, `codePostal`, `createdAt`, `updatedAt`) VALUES (1,'Propietario Jean',3,'1701721764035','fakemail1764035@gmail.com','CUIT','1721764035','fake address',1,'Santa Fe','ROSARIO','S2000','2023-12-04 20:29:24','2023-12-04 20:29:48'),(2,'James Pierre',3,'1701721793656','fakemail1793656@gmail.com','CUIL','1721793656','fake address',1,'Santa Fe','ROSARIO','S2000','2023-12-04 20:29:53','2023-12-04 20:30:10'),(3,'fakename19196',3,'1701721819196','fakemail1819196@gmail.com','DNI','1721819196','fake address',1,'Santa Fe','ROSARIO','S2000','2023-12-04 20:30:19','2023-12-04 20:30:33'),(4,'Ivo D\'Ursi',3,'1701721837359','ivodursi@gmail.com','DNI','1721837359','fake address',0,'Santa Fe','ROSARIO','S2000','2023-12-04 20:30:37','2023-12-04 20:30:57'),(5,'Evenson Messeroux',3,'1701721860531','evensonmess@gmail.com','CUIL','1721860531','fake address',0,'Santa Fe','ROSARIO','S2000','2023-12-04 20:31:00','2023-12-04 20:31:17'),(6,'fakename92701',3,'1701721892701','fakemail1892701@gmail.com','CUIT','1721892701','fake address',1,'Santa Fe','ROSARIO','S2000','2023-12-04 20:31:32','2023-12-04 20:31:33'),(7,'fakename96054',3,'1701721896055','fakemail1896054@gmail.com','CUIT','1721896055','fake address',0,'Santa Fe','ROSARIO','S2000','2023-12-04 20:31:36','2023-12-04 20:31:37'),(8,'fakename00495',3,'1701721900495','fakemail1900495@gmail.com','CUIL','1721900495','fake address',1,'Santa Fe','ROSARIO','S2000','2023-12-04 20:31:40','2023-12-04 20:31:47'),(9,'fakename11532',3,'1701721911532','fakemail1911532@gmail.com','DNI','1721911532','fake address',0,'Santa Fe','ROSARIO','S2000','2023-12-04 20:31:51','2023-12-04 20:31:52'),(10,'Marcos Lorenzo',3,'1701721915338','marcosloren90@gmail.com','CUIT','1721915338','fake address',0,'Santa Fe','ROSARIO','S2000','2023-12-04 20:31:55','2023-12-04 20:32:38');
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planitems`
--

DROP TABLE IF EXISTS `planitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planitems` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `PlanId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquePlanItemDescription` (`description`,`PlanId`),
  KEY `PlanId` (`PlanId`),
  CONSTRAINT `planitems_ibfk_1` FOREIGN KEY (`PlanId`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planitems`
--

LOCK TABLES `planitems` WRITE;
/*!40000 ALTER TABLE `planitems` DISABLE KEYS */;
INSERT INTO `planitems` (`id`, `description`, `PlanId`, `createdAt`, `updatedAt`) VALUES (1,'Administrar contratos',2,'2023-12-03 21:26:44','2023-12-03 21:26:44');
/*!40000 ALTER TABLE `planitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquePlanName` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` (`id`, `name`, `description`, `createdAt`, `updatedAt`) VALUES (1,'Free','Free plan for beginners','2023-12-03 21:20:02','2023-12-03 21:20:02'),(2,'Standard','Plan basico para empresas chicas hasta 200 propiedades','2023-12-03 21:20:41','2023-12-03 21:20:41'),(3,'Premuium','Mejor plan para empresas grandes.','2023-12-03 21:21:15','2023-12-03 21:21:15');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `ZoneId` bigint NOT NULL,
  `PropertyTypeId` bigint NOT NULL,
  `PersonId` bigint NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(5) NOT NULL,
  `isFor` varchar(8) NOT NULL DEFAULT 'Alquiler',
  `state` varchar(7) NOT NULL DEFAULT 'Libre',
  `folderNumber` varchar(10) DEFAULT NULL,
  `OrganizationId` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nroPartWater` varchar(50) DEFAULT NULL,
  `nroPartMuni` varchar(50) DEFAULT NULL,
  `nroPartAPI` varchar(50) DEFAULT NULL,
  `nroPartGas` varchar(50) DEFAULT NULL,
  `floor` varchar(3) DEFAULT NULL,
  `dept` varchar(3) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folderNumber_pty__unique` (`folderNumber`,`OrganizationId`),
  KEY `ZoneId` (`ZoneId`),
  KEY `PropertyTypeId` (`PropertyTypeId`),
  KEY `PersonId` (`PersonId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `properties_ibfk_1` FOREIGN KEY (`ZoneId`) REFERENCES `zones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `properties_ibfk_2` FOREIGN KEY (`PropertyTypeId`) REFERENCES `propertytypes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `properties_ibfk_3` FOREIGN KEY (`PersonId`) REFERENCES `persons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `properties_ibfk_4` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `city`, `province`, `ZoneId`, `PropertyTypeId`, `PersonId`, `street`, `number`, `isFor`, `state`, `folderNumber`, `OrganizationId`, `description`, `nroPartWater`, `nroPartMuni`, `nroPartAPI`, `nroPartGas`, `floor`, `dept`, `createdAt`, `updatedAt`) VALUES (1,'ROSARIO','Santa Fe',2,1,1,'fake street','61154','Alquiler','Libre','61154',3,NULL,'','','','','54','4','2023-12-04 20:34:42','2023-12-04 20:35:39'),(2,'ROSARIO','Santa Fe',2,6,1,'Sarmiento','87124','Alquiler','Ocupado','87125',3,NULL,'','','','','25','5','2023-12-04 20:35:24','2023-12-11 14:15:29'),(3,'LUJAN','San Luis',3,4,2,'Mendoza','45966','Alquiler','Ocupado','45966',3,NULL,'','','','','10','B','2023-12-04 20:36:27','2023-12-04 20:55:12'),(4,'ROSARIO','Santa Fe',1,5,3,'Alvear','94931','Alquiler','Ocupado','94931',3,NULL,'','','','','1','1','2023-12-04 20:37:10','2023-12-05 15:11:10');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertytypes`
--

DROP TABLE IF EXISTS `propertytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertytypes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `desc_organization_id_ptyType_unique` (`description`,`OrganizationId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `propertytypes_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertytypes`
--

LOCK TABLES `propertytypes` WRITE;
/*!40000 ALTER TABLE `propertytypes` DISABLE KEYS */;
INSERT INTO `propertytypes` (`id`, `description`, `OrganizationId`, `createdAt`, `updatedAt`) VALUES (1,'Mono ambiente',3,'2023-12-04 20:24:09','2023-12-04 20:24:09'),(2,'CASA',3,'2023-12-04 20:24:17','2023-12-04 20:24:17'),(3,'Depto 2D',3,'2023-12-04 20:24:31','2023-12-04 20:25:07'),(4,'Oficina',3,'2023-12-04 20:24:37','2023-12-04 20:24:37'),(5,'Galpon',3,'2023-12-04 20:24:42','2023-12-04 20:24:42'),(6,'CASA 3D',3,'2023-12-04 20:24:57','2023-12-04 20:24:57');
/*!40000 ALTER TABLE `propertytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `PropertyId` bigint NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `participants` json NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_organization_id_zone_unique` (`PropertyId`,`OrganizationId`,`date`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`PropertyId`) REFERENCES `properties` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` (`id`, `PropertyId`, `OrganizationId`, `date`, `description`, `participants`, `createdAt`, `updatedAt`) VALUES (1,3,3,'2023-12-14 05:15:00','','\"[{\\\"phone\\\":\\\"23490930898\\\",\\\"fullName\\\":\\\"Jean Messeroux\\\",\\\"email\\\":\\\"mess@gmail.com\\\",\\\"id\\\":\\\"97394582-13c7-44dd-b9a1-0b36cd6f76c9\\\"},{\\\"phone\\\":\\\"89879090809\\\",\\\"fullName\\\":\\\"James Le bon\\\",\\\"email\\\":\\\"jameslebon@test.com\\\",\\\"id\\\":\\\"7df5103a-46a3-428d-a81f-406a75c01e9c\\\"}]\"','2023-12-05 15:14:29','2023-12-05 15:14:29');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `OrganizationId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_organization_id_zone_unique` (`name`,`OrganizationId`),
  KEY `OrganizationId` (`OrganizationId`),
  CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`OrganizationId`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`id`, `name`, `OrganizationId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (1,'Sur',3,'2023-12-04 20:18:42','2023-12-04 20:18:42',NULL),(2,'Norte',3,'2023-12-04 20:18:46','2023-12-04 20:18:46',NULL),(3,'Centro',3,'2023-12-04 20:18:50','2023-12-04 20:18:50',NULL);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 21:07:26
