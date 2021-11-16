-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: docket
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notification_id` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` varchar(5) NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'2021-10-24','20:00:00','text'),(2,'2021-11-02','17:00:00','text'),(3,'2021-11-01','18:30:00','text'),(4,'2021-09-06','13:00:00','text'),(5,'2021-09-06','17:00:00','text'),(6,'2021-11-01','20:00:00','text'),(7,'2021-11-02','22:00:00','text'),(8,'2021-08-26','17:00:00','text'),(9,'2021-09-13','23:59:00','text'),(10,'2021-09-15','15:00:00','text'),(11,'2021-09-28','20:00:00','email'),(12,'2021-09-29','20:00:00','email'),(13,'2021-10-26','19:00:00','text'),(14,'2021-10-27','19:00:00','text'),(15,'2021-09-30','20:00:00','email'),(16,'2021-10-01','20:00:00','email'),(17,'2021-10-26','22:00:00','text'),(18,'2021-11-05','13:00:00','text'),(19,'2021-08-20','21:00:00','email'),(20,'2021-10-11','15:00:00','email'),(21,'2021-10-13','15:00:00','email'),(22,'2021-10-15','15:00:00','email'),(23,'2021-10-15','15:00:00','text'),(24,'2021-09-29','20:00:00','text'),(25,'2021-09-06','17:00:00','email');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-16 12:21:11
