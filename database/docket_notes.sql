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
  `account_id` int NOT NULL,
  `note_id` int NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`account_id`,`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1,'2 1/4 cups Gold Medal™ all-purpose flour,\n1 teaspoon baking soda,\n1/2 teaspoon salt,\n1 cup butter, softened,\n3/4 cup granulated sugar,\n3/4 cup packed brown sugar,\n1 egg,\n1 teaspoon vanilla,\n2 cups semisweet chocolate chips,\n1 cup coarsely chopped nuts, if desired\nFROM: https://www.bettycrocker.com/recipes/ultimate-chocolate-chip-cookies/77c14e03-d8b0-4844-846d-f19304f61c57\n***ANDY IS ALLERGIC TO PEANUTS***'),(1,2,'Question 1~ 17 are Multiple Choice with one correct answer and question 18~22 are Problem Solving. Please manage your time effectively and do as quickly as you can. Do not spend too much time on a single question. STUDY SQL + ERD DIAGRAMS!!!'),(1,22,'quizzes on:\n11/5\n11/8\n11/18\n11/25'),(2,3,'Mom\'s NEW number: 4082321235\nDad\'s NEW number: 4086712498'),(2,12,'Use genbank info for the documentation!! blast sequence across all of genbank'),(3,4,'note to self: dont take gfs chocolate'),(3,13,'note to self: BUY gf chocolate'),(3,14,'test in two weeks!!'),(4,15,'Workout plan for today: 3 sets of crunches, 3 sets of squats, 3 sets of lunges'),(4,16,'Meeting plan: setting up local db, github'),(4,23,'English test: 10/14\nMath test on 10/26'),(5,5,'CONCERT ON THE 3RD OF NOVEMBER\nticket link: https://www.ticketmaster.com/'),(5,17,'Slides 5-6 need diagrams. pgs 281 and 283 have good diagrams (figures 23.2, 23.5)'),(5,24,'Tax Day for individuals extended to May 17: Treasury, IRS extend filing and payment deadline: https://www.irs.gov/newsroom/tax-day-for-individuals-extended-to-may-17-treasury-irs-extend-filing-and-payment-deadline'),(6,6,'Booster shot on 11/4\nMom\'s bday on 11/23'),(6,18,'scores: 247 282 255'),(6,25,'One-Skillet Orzo With Tomatoes and Eggs!!\nhttps://www.epicurious.com/recipes/food/views/easy-one-skillet-orzo-with-tomatoes-and-eggs\n2 Tbsp. unsalted butter\n1 small or medium onion, finely chopped\n2 garlic cloves, thinly sliced\n½ tsp. crushed red pepper flakes\n1 cup orzo\n2 cups canned whole peeled tomatoes with juices (from one 28-oz. can), cut up with kitchen shears\n1¼ tsp. kosher salt\n4 large eggs\n4 oz. mozzarella, coarsely grated (about 1 cup)\nFreshly ground black pepper\nTorn basil leaves (for serving)'),(7,7,'chicken breast\nmilk\neggs\noreos\nwater\ncelery\ntomatoes\npotatoes\nCHECK COUPON LIST!!\n'),(7,19,'Good vid for b minor practice: https://www.youtube.com/watch?v=suJnbc2TERU'),(8,8,'7 storm beads, 6 amethyst chunks, 23 amakumo fruit, 11 famed handguards\nweapon and talents are wednesdays, boss anytime'),(8,20,'Report is due 11/10'),(8,26,'tartag banner 10/13-11/2\ngenshin lab maze event 10/21-11/8'),(9,9,'dynamic programming, linked lists, djikstras'),(9,10,'Paige - wants apple pie, Mom - wants pumpkin pie, Dad - Sweet potatoes, get some cider also!!'),(10,11,'apple, linkedin, adobe, salesforce, cisco opened up!!\napple is 11/5\nlinkedin is 11/7\nadobe, salesforce, cisco is 11/25\nAPPLY!'),(10,21,'make sure to use the correct resumes!!\napple and linkedin: SW Resume\nadobe: SW Intern Resume'),(11,27,'Michelle likes red roses'),(11,28,'Election day is coming up!!'),(11,29,'We, the People, recognize that we have responsibilities as well as rights; that our destinies are bound together; that a freedom which only asks what\'s in it for me, a freedom without a commitment to others, a freedom without love or charity or duty or patriotism, is unworthy of our founding ideals, and those who died in their defense.'),(11,30,'The unanimous Declaration of the thirteen united States of America, When in the Course of human events, it becomes necessary for one people to dissolve the political bands which have connected them with another, and to assume among the powers of the earth, the separate and equal station to which the Laws of Nature and of Nature\'s God entitle them, a decent respect to the opinions of mankind requires that they should declare the causes which impel them to the separation.'),(11,31,'Nor have We been wanting in attentions to our Brittish brethren. We have warned them from time to time of attempts by their legislature to extend an unwarrantable jurisdiction over us. We have reminded them of the circumstances of our emigration and settlement here. We have appealed to their native justice and magnanimity, and we have conjured them by the ties of our common kindred to disavow these usurpations, which, would inevitably interrupt our connections and correspondence. They too have been deaf to the voice of justice and of consanguinity. We must, therefore, acquiesce in the necessity, which denounces our Separation, and hold them, as we hold the rest of mankind, Enemies in War, in Peace Friends.'),(11,32,'Vengeance will be mine!!'),(11,33,'Need 4 more weap ascension mats'),(11,34,'Need a cr and an er piece'),(11,35,'It is Kazuha\'s birthday this month... Maybe a leaf will be fine'),(11,36,'I need the fish!! Must do event at least 3 times a week this month!'),(12,32,'Vengeance will be mine!!'),(12,33,'Need 4 more weap ascension mats'),(12,34,'Need a cr and an er piece'),(12,35,'It is Kazuha\'s birthday this month... Maybe a leaf will be fine'),(12,36,'I need the fish!! Must do event at least 3 times a week this month!'),(13,37,'Gmail servers went down on 9/23'),(13,38,'Need to send emails to Gmail, Yahoo mail, hotmail'),(13,39,'Next month, we need to develop a new email.\nUse this email policy: https://policy.arizona.edu/information-technology/electronic-mail-policy'),(14,40,'Google servers went down on 6/23'),(14,41,'Need to email all employees about new vacation policy'),(14,42,'November needs to have 5 meetings for executives.\nMessage Mike Wu for more details'),(15,43,'Need to give a pop quiz today'),(15,44,'Look into: https://www.trackinghappiness.com/happiness-scale-from-1-to-10/'),(15,45,'November needs to have 5 pop quizzes.\nLook at notes on Canvas to prepare');
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

-- Dump completed on 2021-11-02 16:02:32
