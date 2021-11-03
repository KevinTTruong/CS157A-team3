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
  `account_id` int NOT NULL,
  `goal_id` int NOT NULL,
  `goal` text NOT NULL,
  PRIMARY KEY (`goal_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,1,'Finish personal project'),(1,2,'Get studying done'),(2,3,'Prepare for next week\'s class'),(3,4,'Set up documentation'),(3,5,'Finish homework'),(4,6,'Finish homework'),(5,7,'File taxes'),(5,8,'Be happy :)'),(6,9,'Workout at least 3 times a week!'),(8,10,'Eat at home 4 days this week'),(8,11,'Finish personal project'),(8,12,'Finish homework'),(10,13,'Apply to 3 internships'),(10,14,'Study for test'),(4,15,'Workout at least 30 min today'),(9,16,'FINISH 3 PAGES OF PAPER'),(2,17,'Finish lectures 2, 3'),(5,18,'finish slides by end of today!'),(6,19,'beat high score: 293'),(1,20,'Finish Section 1 of textbook notes'),(2,21,'Finish project report (sections 4, 6!!) + slides'),(3,22,'Set up vm'),(4,23,'Get started on personal project!'),(6,24,'Eat out only 3 times this week!!'),(7,25,'finish chapter 3 + 4 notes'),(7,26,'learn A, A minor, B, B minor chords'),(7,27,'practice guitar at least 3 times a week!!'),(9,28,'PREPARE SOURCES FOR PAPER (2 LEFT)'),(9,29,'FINISH PAPER + PRESENTATION + MODELS'),(10,30,'Apply to 10 internships!!'),(11,31,'Finish speech part 1'),(11,32,'Finish reading documents'),(11,33,'Visit 3 nursing homes this week'),(11,34,'Give 5 speeches this month!!'),(12,35,'Level up Akuoumaru'),(12,36,'Get all Akuoumaru mats'),(12,37,'Do Pale Flame domain 3 times this week'),(12,38,'Do 3 weekly bosses a week!!'),(13,39,'Send out emails to Gmail, hotmail'),(12,40,'Email 3 Yahoo mail executives this week'),(14,41,'Research some more about SEO algorithms'),(12,42,'Look into how to beat Yahoo mail'),(15,43,'Give a pop quiz to both classes today!!'),(15,44,'Prepare more happiness surveys for students'),(13,45,'Email 3 Gmail executives a week'),(14,46,'Hold 5 meetings this month'),(14,47,'Email Mike Wu twice a week this month'),(15,48,'Email Google twice a week this month'),(15,49,'Give out two pop quizzes a week this month');
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

-- Dump completed on 2021-11-02 16:02:33
