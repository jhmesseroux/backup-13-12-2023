-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jhmcode
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
-- Table structure for table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `experienceType` varchar(15) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `startMonth` varchar(10) NOT NULL,
  `endMonth` varchar(10) NOT NULL,
  `startYear` int NOT NULL,
  `endYear` int NOT NULL,
  `skills` json DEFAULT NULL,
  `current` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiences`
--

LOCK TABLES `experiences` WRITE;
/*!40000 ALTER TABLE `experiences` DISABLE KEYS */;
INSERT INTO `experiences` (`id`, `title`, `experienceType`, `companyName`, `description`, `location`, `startMonth`, `endMonth`, `startYear`, `endYear`, `skills`, `current`, `createdAt`, `updatedAt`) VALUES (1,'IT development manager','Part-time','Avalian','<li>Defining and implementing development strategies</li> <li>Managing development projects</li><li>Ensuring that developments meet user requirements</li><li>Carrying out tests on developments</li>','Rosario, Santa Fe, Argentina','Dec','May',2022,2023,'[\"SQL\", \"Oracle\", \"Pl/SQL\", \"Oracle Forms\", \"Toad\"]',0,'2023-12-12 20:57:23','2023-12-12 20:57:23');
/*!40000 ALTER TABLE `experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `level` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `skills` json DEFAULT NULL,
  `demoLink` varchar(255) DEFAULT NULL,
  `collaborators` json DEFAULT NULL,
  `gitBack` varchar(255) DEFAULT NULL,
  `gitFront` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `startMonth` varchar(10) NOT NULL,
  `endMonth` varchar(10) NOT NULL,
  `startYear` int NOT NULL,
  `endYear` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `level`, `title`, `description`, `photo`, `skills`, `demoLink`, `collaborators`, `gitBack`, `gitFront`, `location`, `startMonth`, `endMonth`, `startYear`, `endYear`, `createdAt`, `updatedAt`) VALUES (1,'Intermediate','Virtual Consultation System','Consultation system for a university where students can take appointments virtually','https://res.cloudinary.com/draxircbk/image/upload/v1702413055/jhmesseroux/Portfolio/7915189_3794012_gi07va.svg','[\"PHP\", \"Laravel\", \"Tailwind CSS\", \"Javascript\", \"HTML5\"]',NULL,NULL,'https://github.com/jhmesseroux/sistema-de-consulta/',NULL,'Rosario, Santa Fe, Argentina','Mar','Jul',2022,2022,'2023-12-12 20:31:42','2023-12-12 20:31:42');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` (`id`, `name`, `createdAt`, `updatedAt`) VALUES (1,'Reactjs','2023-12-12 20:04:34','2023-12-12 20:04:34'),(2,'React.js','2023-12-12 20:15:21','2023-12-12 20:15:21'),(3,'Node.js','2023-12-12 20:15:21','2023-12-12 20:15:21'),(4,'Express.js','2023-12-12 20:15:21','2023-12-12 20:15:21'),(5,'Tailwind CSS','2023-12-12 20:15:21','2023-12-12 20:15:21'),(6,'Mongodb','2023-12-12 20:15:21','2023-12-12 20:15:21'),(7,'CSS','2023-12-12 20:15:21','2023-12-12 20:15:21'),(8,'CSS3','2023-12-12 20:15:21','2023-12-12 20:15:21'),(9,'HTML','2023-12-12 20:15:21','2023-12-12 20:15:21'),(10,'HTML5','2023-12-12 20:15:21','2023-12-12 20:15:21'),(11,'Javascript','2023-12-12 20:15:21','2023-12-12 20:15:21'),(12,'Typescript','2023-12-12 20:15:21','2023-12-12 20:15:21'),(13,'SQL','2023-12-12 20:15:21','2023-12-12 20:15:21'),(14,'Mysql','2023-12-12 20:15:21','2023-12-12 20:15:21'),(15,'Git','2023-12-12 20:15:21','2023-12-12 20:15:21'),(16,'Github','2023-12-12 20:15:21','2023-12-12 20:15:21'),(17,'SASS','2023-12-12 20:15:21','2023-12-12 20:15:21'),(18,'PHP','2023-12-12 20:15:21','2023-12-12 20:15:21'),(19,'Laravel','2023-12-12 20:15:21','2023-12-12 20:15:21'),(20,'Pl/SQL','2023-12-12 20:15:21','2023-12-12 20:15:21'),(21,'Oracle','2023-12-12 20:15:21','2023-12-12 20:15:21'),(22,'Toad','2023-12-12 20:15:21','2023-12-12 20:15:21'),(23,'Oracle Forms','2023-12-12 20:15:21','2023-12-12 20:15:21'),(24,'Team player','2023-12-12 20:15:21','2023-12-12 20:15:21'),(25,'Maths','2023-12-12 20:15:21','2023-12-12 20:15:21'),(26,'Nextjs','2023-12-12 20:15:21','2023-12-12 20:15:21'),(27,'React Native','2023-12-12 20:15:21','2023-12-12 20:15:21'),(28,'SendGrid','2023-12-12 20:15:21','2023-12-12 20:15:21'),(29,'Cloudinary','2023-12-12 20:15:21','2023-12-12 20:15:21'),(30,'English','2023-12-12 20:15:21','2023-12-12 20:15:21'),(31,'Spanish','2023-12-12 20:15:21','2023-12-12 20:15:21'),(32,'French','2023-12-12 20:15:21','2023-12-12 20:15:21'),(33,'Creole','2023-12-12 20:15:21','2023-12-12 20:15:21'),(34,'Redux','2023-12-12 20:15:21','2023-12-12 20:15:21'),(35,'Python','2023-12-12 20:15:21','2023-12-12 20:15:21'),(36,'Expo','2023-12-12 20:15:21','2023-12-12 20:15:21'),(37,'Problem Solving','2023-12-12 20:15:21','2023-12-12 20:15:21');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `googleId` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user',
  `password` varchar(255) NOT NULL,
  `passwordChangedAt` datetime DEFAULT NULL,
  `passwordResetToken` varchar(255) DEFAULT NULL,
  `passwordResetExpires` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `googleId`, `email`, `photo`, `role`, `password`, `passwordChangedAt`, `passwordResetToken`, `passwordResetExpires`, `active`, `createdAt`, `updatedAt`) VALUES (1,'JHMcode',NULL,'admin@gmail.com',NULL,'admin','$2a$12$Ug4/vWp2dQ2XD/z3GZA/d.tG4Pi.HUoZIrInAYIvkH75w/8W/14QC',NULL,NULL,NULL,1,'2023-12-12 20:22:40','2023-12-12 20:22:40');
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

-- Dump completed on 2023-12-13 21:09:19
