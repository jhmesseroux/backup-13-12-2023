-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: maranidb
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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `precio` float NOT NULL,
  `cod_art` varchar(50) NOT NULL,
  `dsc_art` varchar(500) NOT NULL,
  `createdAt` datetime NOT NULL,
  `ult_fec_publicacion` datetime NOT NULL,
  `RubroArtId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articulos_cod_art_unique` (`cod_art`),
  KEY `RubroArtId` (`RubroArtId`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`RubroArtId`) REFERENCES `rubros_art` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogos`
--

DROP TABLE IF EXISTS `catalogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dsc_catag` varchar(50) NOT NULL,
  `link` varchar(300) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogos`
--

LOCK TABLES `catalogos` WRITE;
/*!40000 ALTER TABLE `catalogos` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_adm`
--

DROP TABLE IF EXISTS `categorias_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_adm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dsc_cat` varchar(250) NOT NULL,
  `icono` varchar(300) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorias_adm_dsc_cat_unique` (`dsc_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_adm`
--

LOCK TABLES `categorias_adm` WRITE;
/*!40000 ALTER TABLE `categorias_adm` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items-pedido`
--

DROP TABLE IF EXISTS `items-pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items-pedido` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `cod_art` varchar(50) NOT NULL,
  `dsc_art` varchar(500) NOT NULL,
  `dsc_cat` varchar(50) NOT NULL,
  `cod_rubro` varchar(50) NOT NULL,
  `dsc_rubro` varchar(250) NOT NULL,
  `cant` int NOT NULL,
  `precio` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PedidoId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PedidoId` (`PedidoId`),
  CONSTRAINT `items-pedido_ibfk_1` FOREIGN KEY (`PedidoId`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items-pedido`
--

LOCK TABLES `items-pedido` WRITE;
/*!40000 ALTER TABLE `items-pedido` DISABLE KEYS */;
INSERT INTO `items-pedido` (`id`, `uuid`, `cod_art`, `dsc_art`, `dsc_cat`, `cod_rubro`, `dsc_rubro`, `cant`, `precio`, `createdAt`, `updatedAt`, `PedidoId`) VALUES (1,'258e4815-b5d0-47fe-8e7a-8c3203699d0e','200j','varchar(500)','varchar(50)','varchar(50)','varchar(250)',9,1204,'2023-08-29 21:19:19','2023-08-29 21:19:19',1),(2,'22425429-a5c6-42c6-bace-dda05853a184','200j','varchar(500)','varchar(50)','varchar(50)','varchar(250)',9,1204,'2023-08-29 21:26:08','2023-08-29 21:26:08',2),(3,'96a47c4a-3433-4b3d-acfd-6dd86e6ceac3','200j','varchar(500)','varchar(50)','varchar(50)','varchar(250)',9,1204,'2023-11-30 01:14:30','2023-11-30 01:14:30',3);
/*!40000 ALTER TABLE `items-pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logpedidos`
--

DROP TABLE IF EXISTS `logpedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logpedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `oldState` varchar(50) NOT NULL,
  `newState` varchar(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `UserId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PedidoId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `PedidoId` (`PedidoId`),
  CONSTRAINT `logpedidos_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `logpedidos_ibfk_2` FOREIGN KEY (`PedidoId`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logpedidos`
--

LOCK TABLES `logpedidos` WRITE;
/*!40000 ALTER TABLE `logpedidos` DISABLE KEYS */;
INSERT INTO `logpedidos` (`id`, `oldState`, `newState`, `ip`, `UserId`, `createdAt`, `updatedAt`, `PedidoId`) VALUES (1,'Pendiente','En Proceso','::1',2,'2023-09-02 22:27:09','2023-09-02 22:27:09',1),(2,'En Proceso','Resuelto','::1',2,'2023-09-02 22:31:47','2023-09-02 22:31:47',1),(3,'Resuelto','superadmin@gmail.com','::1',2,'2023-09-02 22:48:06','2023-09-02 22:48:06',1),(4,'Resuelto','Pendiente','::1',2,'2023-09-02 22:48:16','2023-09-02 22:48:16',1),(5,'Pendiente','Resuelto','::1',6,'2023-11-30 01:21:04','2023-11-30 01:21:04',3),(6,'Borrador','Resuelto','::1',6,'2023-11-30 01:21:38','2023-11-30 01:21:38',3),(7,'Resuelto','Borrador','::1',6,'2023-11-30 01:22:33','2023-11-30 01:22:33',3),(8,'Borrador','Pendientes','::1',6,'2023-11-30 01:22:57','2023-11-30 01:22:57',3),(9,'Borrador','Pendiente','::1',6,'2023-11-30 01:23:12','2023-11-30 01:23:12',3),(10,'Borrador','Pendiente','::1',6,'2023-11-30 01:24:30','2023-11-30 01:24:30',3),(11,'Borrador','Pendiente','::1',6,'2023-11-30 01:25:13','2023-11-30 01:25:13',3),(12,'Borrador','Pendiente','::1',6,'2023-11-30 01:26:13','2023-11-30 01:26:13',3),(13,'Borrador','Pendiente','::1',6,'2023-11-30 01:26:32','2023-11-30 01:26:32',3),(14,'Borrador','Pendiente','::1',6,'2023-11-30 01:27:15','2023-11-30 01:27:15',3),(15,'Borrador','Pendiente','::1',6,'2023-11-30 01:27:36','2023-11-30 01:27:36',3),(16,'Borrador','Pendiente','::1',6,'2023-11-30 01:29:23','2023-11-30 01:29:23',3);
/*!40000 ALTER TABLE `logpedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros`
--

DROP TABLE IF EXISTS `parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_atencion_cli` varchar(255) NOT NULL,
  `email_contacto` varchar(255) DEFAULT NULL,
  `emial_pedidos` varchar(255) DEFAULT NULL,
  `email_admin` varchar(255) DEFAULT NULL,
  `nombre_empresa` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pag_web` varchar(55) NOT NULL,
  `celu_wsp` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros`
--

LOCK TABLES `parametros` WRITE;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` char(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `fec_ped` date NOT NULL DEFAULT '2023-08-29',
  `est_ped` varchar(50) NOT NULL,
  `UserId` bigint NOT NULL,
  `obs` varchar(500) DEFAULT NULL,
  `cuit` varchar(11) DEFAULT NULL,
  `domFiscal` varchar(55) DEFAULT NULL,
  `domEnvio` varchar(11) DEFAULT NULL,
  `condFiscal` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `uuid_2` (`uuid`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` (`id`, `uuid`, `fec_ped`, `est_ped`, `UserId`, `obs`, `cuit`, `domFiscal`, `domEnvio`, `condFiscal`, `email`, `nombre`, `telefono`, `createdAt`, `updatedAt`) VALUES (1,'96734ef9-c98c-4071-b1bf-ce7e23c85be9','2023-08-29','Pendiente',1,'.................','123123','2120','12','Exento','vhjh@gmail.com','varchar(500)','varchar(50)','2023-08-29 21:19:19','2023-09-02 22:48:16'),(2,'cc441006-8a65-4844-b5cd-9ccfed166be6','2023-08-29','Pendiente',1,NULL,'200j','2120','12','Exento','vhjh@gmail.com','varchar(500)','varchar(50)','2023-08-29 21:26:08','2023-08-29 21:26:08'),(3,'9a06bcc2-d846-4908-810c-7753bcf74909','2023-11-29','Pendiente',1,'newabssssssssssssssss','ahora','2120','12','Exento','vhjh@gmail.com','varchar(500)','varchar(50)','2023-11-30 01:29:23','2023-11-30 01:29:23');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dsc_promo` varchar(50) DEFAULT NULL,
  `det_promo` varchar(500) NOT NULL,
  `fec_vig_desde` datetime NOT NULL,
  `fec_vig_hasta` datetime NOT NULL,
  `est_promo` varchar(50) NOT NULL,
  `banner` varchar(300) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubros_art`
--

DROP TABLE IF EXISTS `rubros_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubros_art` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dsc_rubro` varchar(250) NOT NULL,
  `cod_rubro` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `CategoriaAdmId` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rubros_art_cod_rubro_unique` (`cod_rubro`),
  KEY `CategoriaAdmId` (`CategoriaAdmId`),
  CONSTRAINT `rubros_art_ibfk_1` FOREIGN KEY (`CategoriaAdmId`) REFERENCES `categorias_adm` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubros_art`
--

LOCK TABLES `rubros_art` WRITE;
/*!40000 ALTER TABLE `rubros_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `rubros_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cuit` varchar(11) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `domFiscal` varchar(50) DEFAULT NULL,
  `domEnvio` varchar(50) DEFAULT NULL,
  `condFiscal` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(12) NOT NULL DEFAULT 'user',
  `password` varchar(255) NOT NULL,
  `googleId` varchar(255) DEFAULT NULL,
  `passwordChangedAt` datetime DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetExpires` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `nombre`, `apellido`, `cuit`, `telefono`, `domFiscal`, `domEnvio`, `condFiscal`, `email`, `role`, `password`, `googleId`, `passwordChangedAt`, `passwordResetToken`, `passwordResetExpires`, `createdAt`, `updatedAt`) VALUES (1,'Admin Test','DEV',NULL,NULL,NULL,NULL,NULL,'admin_test@gmail.com','admin','$2a$12$XepVvJdJzvBfk6t08MLH9OZvb5As9FPvOiBJE/SEyyNVxJPUtfFY.',NULL,NULL,NULL,NULL,'2023-08-29 21:18:58','2023-08-29 21:18:58'),(2,'Super','User',NULL,NULL,NULL,NULL,NULL,'superadmin@gmail.com','superAdmin','$2a$12$i80vhDDyZ8H02bMjXrUxJusTnj6zS2sBpshhjde4oLwyKKLgli6yu',NULL,NULL,NULL,NULL,'2023-09-02 22:05:07','2023-09-02 22:05:07'),(4,'Super','User',NULL,'9090909090',NULL,NULL,NULL,'superadmin1@gmail.com','superAdmin','$2a$12$sZ9apAbHkctFCPjOtH1Laey8FvKvX9TXK8pWQzv9f.XMGE2L7L5uG',NULL,NULL,NULL,NULL,'2023-09-02 23:25:37','2023-09-02 23:28:00'),(6,'Super','User',NULL,'435345452345',NULL,NULL,NULL,'testapp713@gmail.com','user','$2a$12$5DK1/kz/RV21tqurOfTIkO5W/t0iQw.3/SvidPFJGUOANjyTV0bNm',NULL,NULL,NULL,NULL,'2023-11-30 01:13:34','2023-11-30 01:13:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 21:09:45
