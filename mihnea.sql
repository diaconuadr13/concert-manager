-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mihnea
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `concerte`
--

DROP TABLE IF EXISTS `concerte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concerte` (
  `idconcert` bigint NOT NULL AUTO_INCREMENT,
  `idmuzician` bigint NOT NULL,
  `idstil` bigint NOT NULL,
  `dataconcert` date NOT NULL,
  `locatie` varchar(255) NOT NULL,
  `altedetalii` varchar(255) NOT NULL,
  PRIMARY KEY (`idconcert`),
  KEY `concerte_ibfk_1` (`idmuzician`),
  KEY `concerte_ibfk_2` (`idstil`),
  CONSTRAINT `concerte_ibfk_1` FOREIGN KEY (`idmuzician`) REFERENCES `muzicieni` (`idmuzician`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `concerte_ibfk_2` FOREIGN KEY (`idstil`) REFERENCES `stiluri_muzicale` (`idstil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concerte`
--

LOCK TABLES `concerte` WRITE;
/*!40000 ALTER TABLE `concerte` DISABLE KEYS */;
INSERT INTO `concerte` VALUES (1,1,1,'2023-01-01','Cluj','Concert caritabil'),(2,1,2,'2024-03-21','Cluj','Festivalul Primăverii'),(3,2,2,'2024-04-30','Iași','Concert în aer liber'),(4,2,3,'2024-05-05','Constanța','Eveniment privat'),(5,1,1,'2024-06-10','Timișoara','Festival jazzzzz');
/*!40000 ALTER TABLE `concerte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muzicieni`
--

DROP TABLE IF EXISTS `muzicieni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muzicieni` (
  `idmuzician` bigint NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  `prenume` varchar(45) NOT NULL,
  `datanasterii` date NOT NULL,
  `taraorigine` varchar(100) NOT NULL,
  `instrumentprincipal` varchar(100) NOT NULL,
  PRIMARY KEY (`idmuzician`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muzicieni`
--

LOCK TABLES `muzicieni` WRITE;
/*!40000 ALTER TABLE `muzicieni` DISABLE KEYS */;
INSERT INTO `muzicieni` VALUES (1,'Popescu','Ion','2024-01-17','România','Chitară'),(2,'Ionescu','Maria ','1985-03-15','România','Pian'),(3,'Vasile','Andrei ','1992-08-10','România','Vioară');
/*!40000 ALTER TABLE `muzicieni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stiluri_muzicale`
--

DROP TABLE IF EXISTS `stiluri_muzicale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stiluri_muzicale` (
  `idstil` bigint NOT NULL AUTO_INCREMENT,
  `numestil` varchar(100) NOT NULL,
  `originestil` varchar(100) NOT NULL,
  `perioadapopularitate` varchar(100) NOT NULL,
  PRIMARY KEY (`idstil`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stiluri_muzicale`
--

LOCK TABLES `stiluri_muzicale` WRITE;
/*!40000 ALTER TABLE `stiluri_muzicale` DISABLE KEYS */;
INSERT INTO `stiluri_muzicale` VALUES (1,'Clasic','Europaa','Anii 19202'),(2,'Rock','Marea Britanie','Anii 1950'),(3,'Clasic','Europaa','Secolul XVIII'),(9,'nu','nu','nu');
/*!40000 ALTER TABLE `stiluri_muzicale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 22:57:38
