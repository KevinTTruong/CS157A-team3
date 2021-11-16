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
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` int NOT NULL,
  `notes` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'2 1/4 cups Gold Medal™ all-purpose flour,\n1 teaspoon baking soda,\n1/2 teaspoon salt,\n1 cup butter, softened,\n3/4 cup granulated sugar,\n3/4 cup packed brown sugar,\n1 egg,\n1 teaspoon vanilla,\n2 cups semisweet chocolate chips,\n1 cup coarsely chopped nuts, if desired\nFROM: https://www.bettycrocker.com/recipes/ultimate-chocolate-chip-cookies/77c14e03-d8b0-4844-846d-f19304f61c57\n***ANDY IS ALLERGIC TO PEANUTS***','2021-10-01','2021-10-31'),(2,'Question 1~ 17 are Multiple Choice with one correct answer and question 18~22 are Problem Solving. Please manage your time effectively and do as quickly as you can. Do not spend too much time on a single question. STUDY SQL + ERD DIAGRAMS!!!','2021-10-11','2021-10-18'),(3,'Mom\'s NEW number: 4082321235\nDad\'s NEW number: 4086712498','2021-11-01','2021-12-01'),(4,'note to self: dont take gfs chocolate','2021-10-31','2021-10-31'),(5,'CONCERT ON THE 3RD OF NOVEMBER\nticket link: https://www.ticketmaster.com/','2021-10-31','2021-11-03'),(6,'Booster shot on 11/4\nMom\'s bday on 11/23','2021-11-01','2021-11-23'),(7,'chicken breast\nmilk\neggs\noreos\nwater\ncelery\ntomatoes\npotatoes\nCHECK COUPON LIST!!\n','2021-10-06','2021-10-06'),(8,'7 storm beads, 6 amethyst chunks, 23 amakumo fruit, 11 famed handguards\nweapon and talents are wednesdays, boss anytime','2021-10-18','2021-10-25'),(9,'dynamic programming, linked lists, djikstras','2021-09-14','2021-09-19'),(10,'Paige - wants apple pie, Mom - wants pumpkin pie, Dad - Sweet potatoes, get some cider also!!','2021-08-28','2021-08-28'),(11,'apple, linkedin, adobe, salesforce, cisco opened up!!\napple is 11/5\nlinkedin is 11/7\nadobe, salesforce, cisco is 11/25\nAPPLY!','2021-10-11','2021-10-23'),(12,'Use genbank info for the documentation!! blast sequence across all of genbank','2021-09-06','2021-09-14'),(13,'note to self: BUY gf chocolate','2021-10-31','2021-10-31'),(14,'test in two weeks!!','2021-10-23','2021-10-23'),(15,'Workout plan for today: 3 sets of crunches, 3 sets of squats, 3 sets of lunges','2021-11-01','2021-11-01'),(16,'Meeting plan: setting up local db, github','2021-09-15','2021-09-15'),(17,'Slides 5-6 need diagrams. pgs 281 and 283 have good diagrams (figures 23.2, 23.5)','2021-10-25','2021-10-30'),(18,'scores: 247 282 255','2021-10-11','2021-10-11'),(19,'Good vid for b minor practice: https://www.youtube.com/watch?v=suJnbc2TERU','2021-10-01','2021-10-01'),(20,'Report is due 11/10','2021-10-26','2021-10-26'),(21,'make sure to use the correct resumes!!\napple and linkedin: SW Resume\nadobe: SW Intern Resume','2021-10-11','2021-10-13'),(22,'quizzes on:\n11/5\n11/8\n11/18\n11/25','2021-11-01','2021-11-25'),(23,'English test: 10/14\nMath test on 10/26','2021-10-07','2021-10-26'),(24,'Tax Day for individuals extended to May 17: Treasury, IRS extend filing and payment deadline: https://www.irs.gov/newsroom/tax-day-for-individuals-extended-to-may-17-treasury-irs-extend-filing-and-payment-deadline','2021-04-01','2021-05-17'),(25,'One-Skillet Orzo With Tomatoes and Eggs!!\nhttps://www.epicurious.com/recipes/food/views/easy-one-skillet-orzo-with-tomatoes-and-eggs\n2 Tbsp. unsalted butter\n1 small or medium onion, finely chopped\n2 garlic cloves, thinly sliced\n½ tsp. crushed red pepper flakes\n1 cup orzo\n2 cups canned whole peeled tomatoes with juices (from one 28-oz. can), cut up with kitchen shears\n1¼ tsp. kosher salt\n4 large eggs\n4 oz. mozzarella, coarsely grated (about 1 cup)\nFreshly ground black pepper\nTorn basil leaves (for serving)','2021-08-01','2021-08-17'),(26,'tartag banner 10/13-11/2\ngenshin lab maze event 10/21-11/8','2021-10-13','2021-11-02'),(27,'Michelle likes red roses','2021-08-04','2021-08-04'),(28,'Election day is coming up!!','2021-10-25','2021-11-03'),(29,'We, the People, recognize that we have responsibilities as well as rights; that our destinies are bound together; that a freedom which only asks what\'s in it for me, a freedom without a commitment to others, a freedom without love or charity or duty or patriotism, is unworthy of our founding ideals, and those who died in their defense.','2021-09-27','2021-09-30'),(30,'The unanimous Declaration of the thirteen united States of America, When in the Course of human events, it becomes necessary for one people to dissolve the political bands which have connected them with another, and to assume among the powers of the earth, the separate and equal station to which the Laws of Nature and of Nature\'s God entitle them, a decent respect to the opinions of mankind requires that they should declare the causes which impel them to the separation.','2021-10-01','2021-10-15'),(31,'Nor have We been wanting in attentions to our Brittish brethren. We have warned them from time to time of attempts by their legislature to extend an unwarrantable jurisdiction over us. We have reminded them of the circumstances of our emigration and settlement here. We have appealed to their native justice and magnanimity, and we have conjured them by the ties of our common kindred to disavow these usurpations, which, would inevitably interrupt our connections and correspondence. They too have been deaf to the voice of justice and of consanguinity. We must, therefore, acquiesce in the necessity, which denounces our Separation, and hold them, as we hold the rest of mankind, Enemies in War, in Peace Friends.','2021-06-01','2021-06-20'),(32,'Vengeance will be mine!!','2021-08-04','2021-08-04'),(33,'Need 4 more weap ascension mats','2021-08-09','2021-08-16'),(34,'Need a cr and an er piece','2021-08-16','2021-08-22'),(35,'It is Kazuha\'s birthday this month... Maybe a leaf will be fine','2021-10-01','2021-10-31'),(36,'I need the fish!! Must do event at least 3 times a week this month!','2021-09-30','2021-10-29'),(37,'Gmail servers went down on 9/23','2021-09-27','2021-09-27'),(38,'Need to send emails to Gmail, Yahoo mail, hotmail','2021-10-10','2021-10-14'),(39,'Next month, we need to develop a new email.\nUse this email policy: https://policy.arizona.edu/information-technology/electronic-mail-policy','2021-08-01','2021-09-30'),(40,'Google servers went down on 6/23','2021-10-20','2021-10-20'),(41,'Need to email all employees about new vacation policy','2021-10-18','2021-10-24'),(42,'November needs to have 5 meetings for executives.\nMessage Mike Wu for more details','2021-11-01','2021-11-30'),(43,'Need to give a pop quiz today','2021-11-02','2021-11-02'),(44,'Look into: https://www.trackinghappiness.com/happiness-scale-from-1-to-10/','2021-10-18','2021-10-21'),(45,'November needs to have 5 pop quizzes.\nLook at notes on Canvas to prepare','2021-10-25','2021-11-23');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
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
