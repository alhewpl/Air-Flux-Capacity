-- MySQL dump 10.13  Distrib 5.7.23, for osx10.13 (x86_64)
--
-- Host: localhost    Database: flights
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `registration_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES (1,'Boeing 737',1,'FL-0001'),(2,'Airbus 321',2,'FL-0002'),(3,'Boeing 747-400',3,'FL-0003'),(4,'Airbus A320',4,'FL-0004');
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES (1,'Tegel','TXL','Berlin'),(2,'Franz Josef Strauss','MUC','Munich'),(3,'Heathrow','LHR','London'),(4,'Helmut Schmidt','HAM','Hamburg');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_plan`
--

DROP TABLE IF EXISTS `flight_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `dept_time` time DEFAULT NULL,
  `duration` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `origin_idx` (`id`),
  KEY `destination_idx` (`id`,`origin`),
  KEY `destination_idx1` (`destination`,`origin`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_plan`
--

LOCK TABLES `flight_plan` WRITE;
/*!40000 ALTER TABLE `flight_plan` DISABLE KEYS */;
INSERT INTO `flight_plan` VALUES (1,'TXL','MUC','10:00:00','01:00:00'),(2,'TXL','MUC','15:00:00','01:00:00'),(3,'TXL','MUC','16:00:00','01:00:00'),(4,'TXL','MUC','18:00:00','01:00:00'),(5,'TXL','HAM','21:00:00','00:40:00'),(6,'MUC','LHR','10:00:00','02:00:00'),(7,'MUC','TXL','13:00:00','01:00:00'),(8,'MUC','TXL','15:00:00','01:00:00'),(9,'MUC','LHR','15:30:00','02:00:00'),(10,'MUC','LHR','10:00:00','02:00:00'),(11,'MUC','HAM','17:30:00','01:00:00'),(12,'MUC','LHR','18:00:00','02:30:00'),(13,'MUC','LHR','20:00:00','02:00:00'),(14,'MUC','TXL','22:00:00','01:00:00'),(15,'LHR','HAM','09:00:00','02:30:00'),(16,'LHR','TXL','12:00:00','02:00:00'),(17,'LHR','TXL','17:00:00','02:00:00'),(18,'LHR','MUC','20:30:00','02:00:00'),(19,'HAM','MUC','10:00:00','01:00:00'),(20,'HAM','MUC','13:00:00','01:00:00'),(21,'HAM','MUC','20:00:00','01:00:00');
/*!40000 ALTER TABLE `flight_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-26 15:51:32
