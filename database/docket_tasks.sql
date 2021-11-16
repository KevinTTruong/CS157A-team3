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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL,
  `title` varchar(100) DEFAULT 'Unnamed task',
  `description` text,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Finish math hw','','2021-10-24','23:59:00'),(2,'Study bio notes','chapters 3-5, 6','2021-11-02','20:00:00'),(3,'Finish section 1 of textbook','chapters 1-2 (pgs 10-47)','2021-11-01','20:00:00'),(4,'Finish lecture 2 notes','On Canvas!! under files','2021-09-06','23:59:00'),(5,'Finish lecture 3 notes','On Canvas!! under files','2021-09-06','23:59:00'),(6,'Download ubuntu','Directions in cs 149 canvas','2021-11-01','23:59:00'),(7,'Finish calc 3 homework','','2021-11-02','23:59:00'),(8,'Organize document sections','Title, table of contents, abstract, body x4, conclusion','2021-08-26','18:00:00'),(9,'Finish CS157A hw','','2021-09-13','23:59:00'),(10,'Finish CS157A report','Meeting with partners at 3:00 pm','2021-09-15','23:59:00'),(11,'Learn A','https://www.guitarlessons.org/lessons/chords/a/','2021-09-28','23:59:00'),(12,'Learn A minor','https://www.guitarlessons.org/lessons/chords/a-minor/','2021-09-29','23:59:00'),(13,'Slides part 1','Use research in google drive','2021-10-26','23:59:00'),(14,'slides part 2','use info from textbook (pgs 276-289)','2021-10-27','23:59:00'),(15,'Learn B','https://www.guitarlessons.org/lessons/chords/b/','2021-09-30','23:59:00'),(16,'Learn B minor','https://www.guitarlessons.org/lessons/chords/b-minor/','2021-10-01','23:59:00'),(17,'Finish project sections 1, 2','Upload to google drive when finished','2021-10-26','23:59:00'),(18,'Finish CS108 hw','talk to partner about report','2021-11-05','23:59:00'),(19,'BIO PAPER SOURCES 1 AND 2','ADD TO BIBLIOGRAPHY --> UPLOAD TO DRIVE','2021-08-20','23:59:00'),(20,'Apply to apple','SWE resume','2021-10-11','23:59:00'),(21,'Apply to linkedin','SWE resume','2021-10-13','23:59:00'),(22,'Apply to adobe','SWE intern resume','2021-10-15','23:59:00');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
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
