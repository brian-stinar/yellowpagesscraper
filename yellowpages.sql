-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: yellowpages
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1-log

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
-- Table structure for table `spiderResults`
--

DROP TABLE IF EXISTS `spiderResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spiderResults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `streetAddress` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `timeScraped` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spiderResults`
--

LOCK TABLES `spiderResults` WRITE;
/*!40000 ALTER TABLE `spiderResults` DISABLE KEYS */;
INSERT INTO `spiderResults` VALUES (362,'Tensegrity Fitness','(505) 255-4543','203 Wellesley Dr SE','Albuquerque','NM','http://www.tensegrityfitness.com','2013-09-21 16:07:36'),(363,'Purple Pink Rhino','(505) 804-6445','115 Harvard Dr SE Ste 11','Albuquerque','NM','','2013-09-21 16:07:36'),(364,'Momentum Pilates & Gyrotonic','(505) 256-1144','3001 Monte Vista Blvd NE','Albuquerque','NM','http://www.momentumstudio.com','2013-09-21 16:07:36'),(365,'Body + Brain Holistic Yoga & Fitness In Nob Hill','(505) 262-2211','2950 Central Ave SE','Albuquerque','NM','http://www.bodynbrain.com/Nob-Hill/','2013-09-21 16:07:36'),(366,'Akka Karate Usa','(505) 265-5885','2929 Monte Vista Blvd NE','Albuquerque','NM','','2013-09-21 16:07:36'),(367,'Discount Fitness Equipment','(505) 255-3400','2901 Indian School Rd NE','Albuquerque','NM','http://www.discountfitnessequipment.com','2013-09-21 16:07:36'),(368,'Floatation Therapy * Massage Therapy * Hot Yoga','(505) 270-6876','127 Bryn Mawr Dr SE Ste D','Albuquerque','NM','http://www.enlightenothers.com/','2013-09-21 16:07:36'),(369,'Jazzercise','(505) 385-7989','625 Dartmouth Dr NE','Albuquerque','NM','http://www.jazzercise.com','2013-09-21 16:07:36'),(370,'Break A Way Fitness Nutrition','(505) 350-2451','1101 Dr Martin Luther King Jr Ave NE','Albuquerque','NM','http://www.coachbecky.com','2013-09-21 16:07:36'),(371,'The Sports Clubs','(505) 244-3483','400 Gold Ave SW','Albuquerque','NM','http://www.thesportsclubsnm.com/','2013-09-21 16:07:36'),(372,'Downtown Sports & Wellness','(505) 242-1500','40 First Plaza Ctr NW # 76','Albuquerque','NM','http://www.nmsw.com','2013-09-21 16:07:36'),(373,'Gold\'s Gym','(505) 266-4653','400 Gold Ave SW # 102','Albuquerque','NM','http://www.goldsgym.com/','2013-09-21 16:07:36'),(374,'Planet Fitness','(505) 833-4444','3301 Coors Blvd NW # 4','Albuquerque','NM','','2013-09-21 16:07:36'),(375,'Whole Woman Inc','(505) 243-4010','418 Central Ave SE','Albuquerque','NM','http://www.wholewomancenter.com','2013-09-21 16:07:36'),(376,'Gyrotonic A B Q','(505) 639-4961','312 Adams St SE','Albuquerque','NM','','2013-09-21 16:07:36'),(377,'New Mexico Sports & Wellness','(505) 857-0123','','','','http://www.nmsw.com/delnorte','2013-09-21 16:07:36'),(378,'Studio SWAY','(505) 417-7062','105 Jefferson St NE','Albuquerque','NM','http://www.studiosway.com','2013-09-21 16:07:36'),(379,'Marsha\'s Fitness Center of the SW','(505) 681-4941','','Albuquerque','NM','','2013-09-21 16:07:36'),(380,'Serendipity Integrated Ftns','(505) 266-5300','314 Washington St SE','Albuquerque','NM','','2013-09-21 16:07:36'),(381,'Momma D\'s Dungeon','(505) 255-1800','5501 Acoma Rd SE','Albuquerque','NM','','2013-09-21 16:07:36'),(382,'Zero Point Parkour','(505) 264-2797','1100 3rd St NW','Albuquerque','NM','','2013-09-21 16:07:36'),(383,'Global Health Partnerships','(505) 503-8891','','Albuquerque','NM','','2013-09-21 16:07:36'),(384,'Baby Boot Camp','(505) 715-2307','','Albuquerque','NM','','2013-09-21 16:07:36'),(385,'All-Star Youth','(505) 899-1666','PO Box 66746','Albuquerque','NM','http://www.allstaryouth.com','2013-09-21 16:07:36'),(386,'Golden Tiger','(505) 857-9500','','Albuquerque','NM','','2013-09-21 16:07:36'),(387,'Liberty Gym','(505) 884-8012','2401 Jefferson St NE','Albuquerque','NM','http://www.libertygym.com','2013-09-21 16:07:36'),(388,'Mike\'s Gym','(505) 255-4423','1214 San Pedro Dr NE','Albuquerque','NM','http://www.mikesgymnm.com','2013-09-21 16:07:36'),(389,'Midtown Sports & Wellness','(505) 888-4811','4100 Prospect Ave NE','Albuquerque','NM','http://www.nmsw.com/midtown','2013-09-21 16:07:36'),(390,'Absolute Results Personal Training Gym','(505) 883-3006','3520 Pan American Fwy NE','Albuquerque','NM','http://www.absoluteresultsgym.com','2013-09-21 16:07:36'),(391,'Absolute Results Personal','(505) 270-1528','3620 Pan American Fwy NE','Albuquerque','NM','','2013-09-21 16:07:36'),(392,'Tensegrity Fitness','(505) 255-4543','203 Wellesley Dr SE','Albuquerque','NM','http://www.tensegrityfitness.com','2013-09-21 16:07:36'),(393,'Purple Pink Rhino','(505) 804-6445','115 Harvard Dr SE Ste 11','Albuquerque','NM','','2013-09-21 16:07:36'),(394,'Momentum Pilates & Gyrotonic','(505) 256-1144','3001 Monte Vista Blvd NE','Albuquerque','NM','http://www.momentumstudio.com','2013-09-21 16:07:36'),(395,'Body + Brain Holistic Yoga & Fitness In Nob Hill','(505) 262-2211','2950 Central Ave SE','Albuquerque','NM','http://www.bodynbrain.com/Nob-Hill/','2013-09-21 16:07:36'),(396,'Akka Karate Usa','(505) 265-5885','2929 Monte Vista Blvd NE','Albuquerque','NM','','2013-09-21 16:07:36'),(397,'Discount Fitness Equipment','(505) 255-3400','2901 Indian School Rd NE','Albuquerque','NM','http://www.discountfitnessequipment.com','2013-09-21 16:07:36'),(398,'Floatation Therapy * Massage Therapy * Hot Yoga','(505) 270-6876','127 Bryn Mawr Dr SE Ste D','Albuquerque','NM','http://www.enlightenothers.com/','2013-09-21 16:07:36'),(399,'Jazzercise','(505) 385-7989','625 Dartmouth Dr NE','Albuquerque','NM','http://www.jazzercise.com','2013-09-21 16:07:36'),(400,'Break A Way Fitness Nutrition','(505) 350-2451','1101 Dr Martin Luther King Jr Ave NE','Albuquerque','NM','http://www.coachbecky.com','2013-09-21 16:07:36'),(401,'The Sports Clubs','(505) 244-3483','400 Gold Ave SW','Albuquerque','NM','http://www.thesportsclubsnm.com/','2013-09-21 16:07:36'),(402,'Downtown Sports & Wellness','(505) 242-1500','40 First Plaza Ctr NW # 76','Albuquerque','NM','http://www.nmsw.com','2013-09-21 16:07:36'),(403,'Gold\'s Gym','(505) 266-4653','400 Gold Ave SW # 102','Albuquerque','NM','http://www.goldsgym.com/','2013-09-21 16:07:36'),(404,'Planet Fitness','(505) 833-4444','3301 Coors Blvd NW # 4','Albuquerque','NM','','2013-09-21 16:07:36'),(405,'Whole Woman Inc','(505) 243-4010','418 Central Ave SE','Albuquerque','NM','http://www.wholewomancenter.com','2013-09-21 16:07:36'),(406,'Gyrotonic A B Q','(505) 639-4961','312 Adams St SE','Albuquerque','NM','','2013-09-21 16:07:36'),(407,'New Mexico Sports & Wellness','(505) 857-0123','','','','http://www.nmsw.com/delnorte','2013-09-21 16:07:36'),(408,'Studio SWAY','(505) 417-7062','105 Jefferson St NE','Albuquerque','NM','http://www.studiosway.com','2013-09-21 16:07:36'),(409,'Marsha\'s Fitness Center of the SW','(505) 681-4941','','Albuquerque','NM','','2013-09-21 16:07:36'),(410,'Serendipity Integrated Ftns','(505) 266-5300','314 Washington St SE','Albuquerque','NM','','2013-09-21 16:07:36'),(411,'Momma D\'s Dungeon','(505) 255-1800','5501 Acoma Rd SE','Albuquerque','NM','','2013-09-21 16:07:36'),(412,'Zero Point Parkour','(505) 264-2797','1100 3rd St NW','Albuquerque','NM','','2013-09-21 16:07:36'),(413,'Global Health Partnerships','(505) 503-8891','','Albuquerque','NM','','2013-09-21 16:07:36'),(414,'Baby Boot Camp','(505) 715-2307','','Albuquerque','NM','','2013-09-21 16:07:36'),(415,'All-Star Youth','(505) 899-1666','PO Box 66746','Albuquerque','NM','http://www.allstaryouth.com','2013-09-21 16:07:36'),(416,'Golden Tiger','(505) 857-9500','','Albuquerque','NM','','2013-09-21 16:07:36'),(417,'Liberty Gym','(505) 884-8012','2401 Jefferson St NE','Albuquerque','NM','http://www.libertygym.com','2013-09-21 16:07:36'),(418,'Mike\'s Gym','(505) 255-4423','1214 San Pedro Dr NE','Albuquerque','NM','http://www.mikesgymnm.com','2013-09-21 16:07:36'),(419,'Midtown Sports & Wellness','(505) 888-4811','4100 Prospect Ave NE','Albuquerque','NM','http://www.nmsw.com/midtown','2013-09-21 16:07:36'),(420,'Absolute Results Personal Training Gym','(505) 883-3006','3520 Pan American Fwy NE','Albuquerque','NM','http://www.absoluteresultsgym.com','2013-09-21 16:07:36'),(421,'Absolute Results Personal','(505) 270-1528','3620 Pan American Fwy NE','Albuquerque','NM','','2013-09-21 16:07:36'),(422,'Tensegrity Fitness','(505) 255-4543','203 Wellesley Dr SE','Albuquerque','NM','http://www.tensegrityfitness.com','2013-09-21 16:07:36'),(423,'Purple Pink Rhino','(505) 804-6445','115 Harvard Dr SE Ste 11','Albuquerque','NM','','2013-09-21 16:07:36'),(424,'Momentum Pilates & Gyrotonic','(505) 256-1144','3001 Monte Vista Blvd NE','Albuquerque','NM','http://www.momentumstudio.com','2013-09-21 16:07:36'),(425,'Body + Brain Holistic Yoga & Fitness In Nob Hill','(505) 262-2211','2950 Central Ave SE','Albuquerque','NM','http://www.bodynbrain.com/Nob-Hill/','2013-09-21 16:07:36'),(426,'Akka Karate Usa','(505) 265-5885','2929 Monte Vista Blvd NE','Albuquerque','NM','','2013-09-21 16:07:36'),(427,'Discount Fitness Equipment','(505) 255-3400','2901 Indian School Rd NE','Albuquerque','NM','http://www.discountfitnessequipment.com','2013-09-21 16:07:36'),(428,'Floatation Therapy * Massage Therapy * Hot Yoga','(505) 270-6876','127 Bryn Mawr Dr SE Ste D','Albuquerque','NM','http://www.enlightenothers.com/','2013-09-21 16:07:36'),(429,'Jazzercise','(505) 385-7989','625 Dartmouth Dr NE','Albuquerque','NM','http://www.jazzercise.com','2013-09-21 16:07:36'),(430,'Break A Way Fitness Nutrition','(505) 350-2451','1101 Dr Martin Luther King Jr Ave NE','Albuquerque','NM','http://www.coachbecky.com','2013-09-21 16:07:36'),(431,'The Sports Clubs','(505) 244-3483','400 Gold Ave SW','Albuquerque','NM','http://www.thesportsclubsnm.com/','2013-09-21 16:07:36'),(432,'Downtown Sports & Wellness','(505) 242-1500','40 First Plaza Ctr NW # 76','Albuquerque','NM','http://www.nmsw.com','2013-09-21 16:07:36'),(433,'Gold\'s Gym','(505) 266-4653','400 Gold Ave SW # 102','Albuquerque','NM','http://www.goldsgym.com/','2013-09-21 16:07:36'),(434,'Planet Fitness','(505) 833-4444','3301 Coors Blvd NW # 4','Albuquerque','NM','','2013-09-21 16:07:36'),(435,'Whole Woman Inc','(505) 243-4010','418 Central Ave SE','Albuquerque','NM','http://www.wholewomancenter.com','2013-09-21 16:07:36'),(436,'Gyrotonic A B Q','(505) 639-4961','312 Adams St SE','Albuquerque','NM','','2013-09-21 16:07:36'),(437,'New Mexico Sports & Wellness','(505) 857-0123','','','','http://www.nmsw.com/delnorte','2013-09-21 16:07:36'),(438,'Studio SWAY','(505) 417-7062','105 Jefferson St NE','Albuquerque','NM','http://www.studiosway.com','2013-09-21 16:07:36'),(439,'Marsha\'s Fitness Center of the SW','(505) 681-4941','','Albuquerque','NM','','2013-09-21 16:07:36'),(440,'Serendipity Integrated Ftns','(505) 266-5300','314 Washington St SE','Albuquerque','NM','','2013-09-21 16:07:36'),(441,'Momma D\'s Dungeon','(505) 255-1800','5501 Acoma Rd SE','Albuquerque','NM','','2013-09-21 16:07:36'),(442,'Zero Point Parkour','(505) 264-2797','1100 3rd St NW','Albuquerque','NM','','2013-09-21 16:07:36'),(443,'Global Health Partnerships','(505) 503-8891','','Albuquerque','NM','','2013-09-21 16:07:36'),(444,'Baby Boot Camp','(505) 715-2307','','Albuquerque','NM','','2013-09-21 16:07:36'),(445,'All-Star Youth','(505) 899-1666','PO Box 66746','Albuquerque','NM','http://www.allstaryouth.com','2013-09-21 16:07:36'),(446,'Golden Tiger','(505) 857-9500','','Albuquerque','NM','','2013-09-21 16:07:36'),(447,'Liberty Gym','(505) 884-8012','2401 Jefferson St NE','Albuquerque','NM','http://www.libertygym.com','2013-09-21 16:07:36'),(448,'Mike\'s Gym','(505) 255-4423','1214 San Pedro Dr NE','Albuquerque','NM','http://www.mikesgymnm.com','2013-09-21 16:07:36'),(449,'Midtown Sports & Wellness','(505) 888-4811','4100 Prospect Ave NE','Albuquerque','NM','http://www.nmsw.com/midtown','2013-09-21 16:07:36'),(450,'Absolute Results Personal Training Gym','(505) 883-3006','3520 Pan American Fwy NE','Albuquerque','NM','http://www.absoluteresultsgym.com','2013-09-21 16:07:36'),(451,'Absolute Results Personal','(505) 270-1528','3620 Pan American Fwy NE','Albuquerque','NM','','2013-09-21 16:07:36'),(452,'Tensegrity Fitness','(505) 255-4543','203 Wellesley Dr SE','Albuquerque','NM','http://www.tensegrityfitness.com','2013-09-21 16:07:36'),(453,'Purple Pink Rhino','(505) 804-6445','115 Harvard Dr SE Ste 11','Albuquerque','NM','','2013-09-21 16:07:36'),(454,'Momentum Pilates & Gyrotonic','(505) 256-1144','3001 Monte Vista Blvd NE','Albuquerque','NM','http://www.momentumstudio.com','2013-09-21 16:07:37'),(455,'Body + Brain Holistic Yoga & Fitness In Nob Hill','(505) 262-2211','2950 Central Ave SE','Albuquerque','NM','http://www.bodynbrain.com/Nob-Hill/','2013-09-21 16:07:37'),(456,'Akka Karate Usa','(505) 265-5885','2929 Monte Vista Blvd NE','Albuquerque','NM','','2013-09-21 16:07:37'),(457,'Discount Fitness Equipment','(505) 255-3400','2901 Indian School Rd NE','Albuquerque','NM','http://www.discountfitnessequipment.com','2013-09-21 16:07:37'),(458,'Floatation Therapy * Massage Therapy * Hot Yoga','(505) 270-6876','127 Bryn Mawr Dr SE Ste D','Albuquerque','NM','http://www.enlightenothers.com/','2013-09-21 16:07:37'),(459,'Jazzercise','(505) 385-7989','625 Dartmouth Dr NE','Albuquerque','NM','http://www.jazzercise.com','2013-09-21 16:07:37'),(460,'Break A Way Fitness Nutrition','(505) 350-2451','1101 Dr Martin Luther King Jr Ave NE','Albuquerque','NM','http://www.coachbecky.com','2013-09-21 16:07:37'),(461,'The Sports Clubs','(505) 244-3483','400 Gold Ave SW','Albuquerque','NM','http://www.thesportsclubsnm.com/','2013-09-21 16:07:37'),(462,'Downtown Sports & Wellness','(505) 242-1500','40 First Plaza Ctr NW # 76','Albuquerque','NM','http://www.nmsw.com','2013-09-21 16:07:37'),(463,'Gold\'s Gym','(505) 266-4653','400 Gold Ave SW # 102','Albuquerque','NM','http://www.goldsgym.com/','2013-09-21 16:07:37'),(464,'Planet Fitness','(505) 833-4444','3301 Coors Blvd NW # 4','Albuquerque','NM','','2013-09-21 16:07:37'),(465,'Whole Woman Inc','(505) 243-4010','418 Central Ave SE','Albuquerque','NM','http://www.wholewomancenter.com','2013-09-21 16:07:37'),(466,'Gyrotonic A B Q','(505) 639-4961','312 Adams St SE','Albuquerque','NM','','2013-09-21 16:07:37'),(467,'New Mexico Sports & Wellness','(505) 857-0123','','','','http://www.nmsw.com/delnorte','2013-09-21 16:07:37'),(468,'Studio SWAY','(505) 417-7062','105 Jefferson St NE','Albuquerque','NM','http://www.studiosway.com','2013-09-21 16:07:37'),(469,'Marsha\'s Fitness Center of the SW','(505) 681-4941','','Albuquerque','NM','','2013-09-21 16:07:37'),(470,'Serendipity Integrated Ftns','(505) 266-5300','314 Washington St SE','Albuquerque','NM','','2013-09-21 16:07:37'),(471,'Momma D\'s Dungeon','(505) 255-1800','5501 Acoma Rd SE','Albuquerque','NM','','2013-09-21 16:07:37'),(472,'Zero Point Parkour','(505) 264-2797','1100 3rd St NW','Albuquerque','NM','','2013-09-21 16:07:37'),(473,'Global Health Partnerships','(505) 503-8891','','Albuquerque','NM','','2013-09-21 16:07:37'),(474,'Baby Boot Camp','(505) 715-2307','','Albuquerque','NM','','2013-09-21 16:07:37'),(475,'All-Star Youth','(505) 899-1666','PO Box 66746','Albuquerque','NM','http://www.allstaryouth.com','2013-09-21 16:07:37'),(476,'Golden Tiger','(505) 857-9500','','Albuquerque','NM','','2013-09-21 16:07:37'),(477,'Liberty Gym','(505) 884-8012','2401 Jefferson St NE','Albuquerque','NM','http://www.libertygym.com','2013-09-21 16:07:37'),(478,'Mike\'s Gym','(505) 255-4423','1214 San Pedro Dr NE','Albuquerque','NM','http://www.mikesgymnm.com','2013-09-21 16:07:37'),(479,'Midtown Sports & Wellness','(505) 888-4811','4100 Prospect Ave NE','Albuquerque','NM','http://www.nmsw.com/midtown','2013-09-21 16:07:37'),(480,'Absolute Results Personal Training Gym','(505) 883-3006','3520 Pan American Fwy NE','Albuquerque','NM','http://www.absoluteresultsgym.com','2013-09-21 16:07:37'),(481,'Absolute Results Personal','(505) 270-1528','3620 Pan American Fwy NE','Albuquerque','NM','','2013-09-21 16:07:37'),(482,'Tensegrity Fitness','(505) 255-4543','203 Wellesley Dr SE','Albuquerque','NM','http://www.tensegrityfitness.com','2013-09-21 16:07:37'),(483,'Purple Pink Rhino','(505) 804-6445','115 Harvard Dr SE Ste 11','Albuquerque','NM','','2013-09-21 16:07:37'),(484,'Momentum Pilates & Gyrotonic','(505) 256-1144','3001 Monte Vista Blvd NE','Albuquerque','NM','http://www.momentumstudio.com','2013-09-21 16:07:37'),(485,'Body + Brain Holistic Yoga & Fitness In Nob Hill','(505) 262-2211','2950 Central Ave SE','Albuquerque','NM','http://www.bodynbrain.com/Nob-Hill/','2013-09-21 16:07:37'),(486,'Akka Karate Usa','(505) 265-5885','2929 Monte Vista Blvd NE','Albuquerque','NM','','2013-09-21 16:07:37'),(487,'Discount Fitness Equipment','(505) 255-3400','2901 Indian School Rd NE','Albuquerque','NM','http://www.discountfitnessequipment.com','2013-09-21 16:07:37'),(488,'Floatation Therapy * Massage Therapy * Hot Yoga','(505) 270-6876','127 Bryn Mawr Dr SE Ste D','Albuquerque','NM','http://www.enlightenothers.com/','2013-09-21 16:07:37'),(489,'Jazzercise','(505) 385-7989','625 Dartmouth Dr NE','Albuquerque','NM','http://www.jazzercise.com','2013-09-21 16:07:37'),(490,'Break A Way Fitness Nutrition','(505) 350-2451','1101 Dr Martin Luther King Jr Ave NE','Albuquerque','NM','http://www.coachbecky.com','2013-09-21 16:07:37'),(491,'The Sports Clubs','(505) 244-3483','400 Gold Ave SW','Albuquerque','NM','http://www.thesportsclubsnm.com/','2013-09-21 16:07:37'),(492,'Downtown Sports & Wellness','(505) 242-1500','40 First Plaza Ctr NW # 76','Albuquerque','NM','http://www.nmsw.com','2013-09-21 16:07:37'),(493,'Gold\'s Gym','(505) 266-4653','400 Gold Ave SW # 102','Albuquerque','NM','http://www.goldsgym.com/','2013-09-21 16:07:37'),(494,'Planet Fitness','(505) 833-4444','3301 Coors Blvd NW # 4','Albuquerque','NM','','2013-09-21 16:07:37'),(495,'Whole Woman Inc','(505) 243-4010','418 Central Ave SE','Albuquerque','NM','http://www.wholewomancenter.com','2013-09-21 16:07:37'),(496,'Gyrotonic A B Q','(505) 639-4961','312 Adams St SE','Albuquerque','NM','','2013-09-21 16:07:37'),(497,'New Mexico Sports & Wellness','(505) 857-0123','','','','http://www.nmsw.com/delnorte','2013-09-21 16:07:37'),(498,'Studio SWAY','(505) 417-7062','105 Jefferson St NE','Albuquerque','NM','http://www.studiosway.com','2013-09-21 16:07:37'),(499,'Marsha\'s Fitness Center of the SW','(505) 681-4941','','Albuquerque','NM','','2013-09-21 16:07:37'),(500,'Serendipity Integrated Ftns','(505) 266-5300','314 Washington St SE','Albuquerque','NM','','2013-09-21 16:07:37'),(501,'Momma D\'s Dungeon','(505) 255-1800','5501 Acoma Rd SE','Albuquerque','NM','','2013-09-21 16:07:37'),(502,'Zero Point Parkour','(505) 264-2797','1100 3rd St NW','Albuquerque','NM','','2013-09-21 16:07:37'),(503,'Global Health Partnerships','(505) 503-8891','','Albuquerque','NM','','2013-09-21 16:07:37'),(504,'Baby Boot Camp','(505) 715-2307','','Albuquerque','NM','','2013-09-21 16:07:37'),(505,'All-Star Youth','(505) 899-1666','PO Box 66746','Albuquerque','NM','http://www.allstaryouth.com','2013-09-21 16:07:37'),(506,'Golden Tiger','(505) 857-9500','','Albuquerque','NM','','2013-09-21 16:07:37'),(507,'Liberty Gym','(505) 884-8012','2401 Jefferson St NE','Albuquerque','NM','http://www.libertygym.com','2013-09-21 16:07:37'),(508,'Mike\'s Gym','(505) 255-4423','1214 San Pedro Dr NE','Albuquerque','NM','http://www.mikesgymnm.com','2013-09-21 16:07:37'),(509,'Midtown Sports & Wellness','(505) 888-4811','4100 Prospect Ave NE','Albuquerque','NM','http://www.nmsw.com/midtown','2013-09-21 16:07:37'),(510,'Absolute Results Personal Training Gym','(505) 883-3006','3520 Pan American Fwy NE','Albuquerque','NM','http://www.absoluteresultsgym.com','2013-09-21 16:07:37'),(511,'Absolute Results Personal','(505) 270-1528','3620 Pan American Fwy NE','Albuquerque','NM','','2013-09-21 16:07:37'),(512,'Tensegrity Fitness','(505) 255-4543','203 Wellesley Dr SE','Albuquerque','NM','http://www.tensegrityfitness.com','2013-09-21 16:07:37'),(513,'Purple Pink Rhino','(505) 804-6445','115 Harvard Dr SE Ste 11','Albuquerque','NM','','2013-09-21 16:07:37'),(514,'Momentum Pilates & Gyrotonic','(505) 256-1144','3001 Monte Vista Blvd NE','Albuquerque','NM','http://www.momentumstudio.com','2013-09-21 16:07:37'),(515,'Body + Brain Holistic Yoga & Fitness In Nob Hill','(505) 262-2211','2950 Central Ave SE','Albuquerque','NM','http://www.bodynbrain.com/Nob-Hill/','2013-09-21 16:07:37'),(516,'Akka Karate Usa','(505) 265-5885','2929 Monte Vista Blvd NE','Albuquerque','NM','','2013-09-21 16:07:37'),(517,'Discount Fitness Equipment','(505) 255-3400','2901 Indian School Rd NE','Albuquerque','NM','http://www.discountfitnessequipment.com','2013-09-21 16:07:37'),(518,'Floatation Therapy * Massage Therapy * Hot Yoga','(505) 270-6876','127 Bryn Mawr Dr SE Ste D','Albuquerque','NM','http://www.enlightenothers.com/','2013-09-21 16:07:37'),(519,'Jazzercise','(505) 385-7989','625 Dartmouth Dr NE','Albuquerque','NM','http://www.jazzercise.com','2013-09-21 16:07:37'),(520,'Break A Way Fitness Nutrition','(505) 350-2451','1101 Dr Martin Luther King Jr Ave NE','Albuquerque','NM','http://www.coachbecky.com','2013-09-21 16:07:37'),(521,'The Sports Clubs','(505) 244-3483','400 Gold Ave SW','Albuquerque','NM','http://www.thesportsclubsnm.com/','2013-09-21 16:07:37'),(522,'Downtown Sports & Wellness','(505) 242-1500','40 First Plaza Ctr NW # 76','Albuquerque','NM','http://www.nmsw.com','2013-09-21 16:07:37'),(523,'Gold\'s Gym','(505) 266-4653','400 Gold Ave SW # 102','Albuquerque','NM','http://www.goldsgym.com/','2013-09-21 16:07:37'),(524,'Planet Fitness','(505) 833-4444','3301 Coors Blvd NW # 4','Albuquerque','NM','','2013-09-21 16:07:37'),(525,'Whole Woman Inc','(505) 243-4010','418 Central Ave SE','Albuquerque','NM','http://www.wholewomancenter.com','2013-09-21 16:07:37'),(526,'Gyrotonic A B Q','(505) 639-4961','312 Adams St SE','Albuquerque','NM','','2013-09-21 16:07:37'),(527,'New Mexico Sports & Wellness','(505) 857-0123','','','','http://www.nmsw.com/delnorte','2013-09-21 16:07:37'),(528,'Studio SWAY','(505) 417-7062','105 Jefferson St NE','Albuquerque','NM','http://www.studiosway.com','2013-09-21 16:07:37'),(529,'Marsha\'s Fitness Center of the SW','(505) 681-4941','','Albuquerque','NM','','2013-09-21 16:07:37'),(530,'Serendipity Integrated Ftns','(505) 266-5300','314 Washington St SE','Albuquerque','NM','','2013-09-21 16:07:37'),(531,'Momma D\'s Dungeon','(505) 255-1800','5501 Acoma Rd SE','Albuquerque','NM','','2013-09-21 16:07:37'),(532,'Zero Point Parkour','(505) 264-2797','1100 3rd St NW','Albuquerque','NM','','2013-09-21 16:07:37'),(533,'Global Health Partnerships','(505) 503-8891','','Albuquerque','NM','','2013-09-21 16:07:37'),(534,'Baby Boot Camp','(505) 715-2307','','Albuquerque','NM','','2013-09-21 16:07:37'),(535,'All-Star Youth','(505) 899-1666','PO Box 66746','Albuquerque','NM','http://www.allstaryouth.com','2013-09-21 16:07:37'),(536,'Golden Tiger','(505) 857-9500','','Albuquerque','NM','','2013-09-21 16:07:37'),(537,'Liberty Gym','(505) 884-8012','2401 Jefferson St NE','Albuquerque','NM','http://www.libertygym.com','2013-09-21 16:07:37'),(538,'Mike\'s Gym','(505) 255-4423','1214 San Pedro Dr NE','Albuquerque','NM','http://www.mikesgymnm.com','2013-09-21 16:07:37'),(539,'Midtown Sports & Wellness','(505) 888-4811','4100 Prospect Ave NE','Albuquerque','NM','http://www.nmsw.com/midtown','2013-09-21 16:07:37'),(540,'Absolute Results Personal Training Gym','(505) 883-3006','3520 Pan American Fwy NE','Albuquerque','NM','http://www.absoluteresultsgym.com','2013-09-21 16:07:37'),(541,'Absolute Results Personal','(505) 270-1528','3620 Pan American Fwy NE','Albuquerque','NM','','2013-09-21 16:07:37');
/*!40000 ALTER TABLE `spiderResults` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-21 16:13:54