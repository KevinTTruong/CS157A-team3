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
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `goal_id` int NOT NULL,
  `goal` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`goal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,'Finish personal project','2021-10-01','2021-10-25'),(2,'Get studying done','2021-11-01','2021-11-06'),(3,'Prepare for next week\'s class','2021-10-04','2021-10-10'),(4,'Set up documentation','2021-08-23','2021-08-30'),(5,'Finish homework','2021-11-02','2021-11-02'),(6,'Finish homework','2021-09-13','2021-09-20'),(7,'File taxes','2021-04-12','2021-04-15'),(8,'Be happy :)','2021-11-01','2021-11-30'),(9,'Workout at least 3 times a week!','2021-08-01','2021-08-01'),(10,'Eat at home 4 days this week','2021-09-13','2021-09-20'),(11,'Finish personal project','2021-08-01','2021-08-30'),(12,'Finish homework','2021-11-05','2021-11-05'),(13,'Apply to 3 internships','2021-10-11','2021-10-18'),(14,'Study for test','2021-10-02','2021-10-02'),(15,'Workout at least 30 min today','2021-11-01','2021-11-01'),(16,'FINISH 3 PAGES OF PAPER','2021-09-20','2021-09-27'),(17,'Finish lectures 2, 3','2021-09-06','2021-09-06'),(18,'finish slides by end of today!','2021-10-27','2021-10-27'),(19,'beat high score: 293','2021-10-11','2021-10-11'),(20,'Finish Section 1 of textbook notes','2021-11-01','2021-11-01'),(21,'Finish project report (sections 4, 6!!) + slides','2021-10-25','2021-10-29'),(22,'Set up vm','2021-11-01','2021-11-20'),(23,'Get started on personal project!','2021-10-18','2021-10-21'),(24,'Eat out only 3 times this week!!','2021-06-14','2021-06-21'),(25,'finish chapter 3 + 4 notes','2021-10-29','2021-10-29'),(26,'learn A, A minor, B, B minor chords','2021-09-27','2021-10-02'),(27,'practice guitar at least 3 times a week!!','2021-09-01','2021-09-30'),(28,'PREPARE SOURCES FOR PAPER (2 LEFT)','2021-08-20','2021-08-20'),(29,'FINISH PAPER + PRESENTATION + MODELS','2021-09-01','2021-09-28'),(30,'Apply to 10 internships!!','2021-10-01','2021-10-31'),(31,'Finish speech part 1','2021-10-26','2021-10-26'),(32,'Finish reading documents','2021-10-25','2021-11-01'),(33,'Visit 3 nursing homes this week','2021-10-16','2021-10-23'),(34,'Give 5 speeches this month!!','2021-09-01','2021-09-30'),(35,'Level up Akuoumaru','2021-09-26','2021-09-26'),(36,'Get all Akuoumaru mats','2021-08-09','2021-08-16'),(37,'Do Pale Flame domain 3 times this week','2021-08-16','2021-08-23'),(38,'Do 3 weekly bosses a week!!','2021-10-01','2021-11-04'),(39,'Send out emails to Gmail, hotmail','2021-09-28','2021-09-28'),(40,'Email 3 Yahoo mail executives this week','2021-09-27','2021-11-03'),(41,'Research some more about SEO algorithms','2021-10-25','2021-10-25'),(42,'Look into how to beat Yahoo mail','2021-08-30','2021-11-05'),(43,'Give a pop quiz to both classes today!!','2021-11-02','2021-11-02'),(44,'Prepare more happiness surveys for students','2021-11-01','2021-11-03'),(45,'Email 3 Gmail executives a week','2021-10-01','2021-11-04'),(46,'Hold 5 meetings this month','2021-11-01','2021-11-23'),(47,'Email Mike Wu twice a week this month','2021-11-01','2021-12-04'),(48,'Email Google twice a week this month','2021-11-01','2021-12-04'),(49,'Give out two pop quizzes a week this month','2021-11-01','2021-12-04');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-16 12:21:12
