-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'George','Lucas','george_lucas','password1'),(2,'Jeffrey','Abrams','jeffrey_abrams','password2');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_semester`
--

DROP TABLE IF EXISTS `course_semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_semester` (
  `course_semester_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `semester_id` int NOT NULL,
  PRIMARY KEY (`course_semester_id`),
  UNIQUE KEY `course_id` (`course_id`,`semester_id`),
  KEY `semester_id` (`semester_id`),
  CONSTRAINT `course_semester_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `course_semester_ibfk_2` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_semester`
--

LOCK TABLES `course_semester` WRITE;
/*!40000 ALTER TABLE `course_semester` DISABLE KEYS */;
INSERT INTO `course_semester` VALUES (1,1,1),(6,2,2),(2,3,2),(7,4,1),(3,5,1),(8,6,2),(4,7,2),(9,8,1),(5,9,1),(10,10,2);
/*!40000 ALTER TABLE `course_semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_student`
--

DROP TABLE IF EXISTS `course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_student` (
  `course_student_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `course_semester_id` int DEFAULT NULL,
  `result` enum('Pass','Fail') DEFAULT NULL,
  PRIMARY KEY (`course_student_id`),
  UNIQUE KEY `student_id` (`student_id`,`course_semester_id`),
  KEY `course_semester_id` (`course_semester_id`),
  CONSTRAINT `course_student_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `course_student_ibfk_2` FOREIGN KEY (`course_semester_id`) REFERENCES `course_semester` (`course_semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (1,1,1,'Pass'),(2,2,2,'Fail'),(3,3,4,'Pass'),(4,4,6,'Pass'),(5,5,9,'Pass'),(6,6,1,NULL),(7,7,2,NULL),(8,8,4,NULL),(9,9,6,NULL),(10,10,9,NULL),(11,11,1,NULL),(12,12,2,NULL),(13,13,4,NULL),(14,14,6,NULL),(15,15,9,NULL),(16,16,9,NULL),(17,17,1,NULL),(18,18,2,NULL),(19,19,4,NULL),(20,20,6,NULL),(21,20,1,'Pass');
/*!40000 ALTER TABLE `course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_teacher`
--

DROP TABLE IF EXISTS `course_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_teacher` (
  `course_teacher_id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int DEFAULT NULL,
  `course_semester_id` int DEFAULT NULL,
  PRIMARY KEY (`course_teacher_id`),
  UNIQUE KEY `teacher_id` (`teacher_id`,`course_semester_id`),
  KEY `course_semester_id` (`course_semester_id`),
  CONSTRAINT `course_teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  CONSTRAINT `course_teacher_ibfk_2` FOREIGN KEY (`course_semester_id`) REFERENCES `course_semester` (`course_semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_teacher`
--

LOCK TABLES `course_teacher` WRITE;
/*!40000 ALTER TABLE `course_teacher` DISABLE KEYS */;
INSERT INTO `course_teacher` VALUES (1,1,1),(2,2,2),(3,3,4),(4,4,6),(5,5,9);
/*!40000 ALTER TABLE `course_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Jedi 101'),(2,'The Force'),(3,'Ethics'),(4,'History'),(5,'Diplomacy'),(6,'Leadership'),(7,'Philosophy'),(8,'Medicine'),(9,'Combat'),(10,'Politics');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `coursesofferedinsemester`
--

DROP TABLE IF EXISTS `coursesofferedinsemester`;
/*!50001 DROP VIEW IF EXISTS `coursesofferedinsemester`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coursesofferedinsemester` AS SELECT 
 1 AS `course_name`,
 1 AS `semester_name`,
 1 AS `start_date`,
 1 AS `end_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semesters` (
  `semester_id` int NOT NULL AUTO_INCREMENT,
  `semester_name` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,'Fall 2023','2023-09-01','2023-12-20'),(2,'Spring 2024','2024-01-15','2024-05-15');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Luke','Skywalker','luke_skywalker','password10'),(2,'Leia','Organa','leia_organa','password11'),(3,'Han','Solo','han_solo','password12'),(4,'Bacca','Chew','chew_bacca','password13'),(5,'Lando','Calrissian','lando_calrissian','password14'),(6,'Padme','Amidala','padme_amidala','password15'),(7,'Anakin','Skywalker','anakin_skywalker','password16'),(8,'Rey','Skywalker','rey_skywalker','password17'),(9,'FN','2187','FN_2187','password18'),(10,'Poe','Dameron','poe_dameron','password19'),(11,'BB','8','bb_8','password20'),(12,'C','3PO','c_3po','password21'),(13,'D2','R2','r2_d2','password22'),(14,'Qui-Gon','Jinn','qui_gon_jinn','password23'),(15,'Shmi','Skywalker','shmi_skywalker','password24'),(16,'Bail','Organa','bail_organa','password25'),(17,'Mon','Mothma','mon_mothma','password26'),(18,'Wedge','Antilles','wedge_antilles','password27'),(19,'Admiral','Ackbar','admiral_ackbar','password28'),(20,'Rose','Tico','rose_tico','password29');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Yoda','Master','master_yoda','password3'),(2,'Mace','Windu','mace_windu','password4'),(3,'Obi-Wan','Kenobi','obi-wan_kenobi','password5'),(4,'Ki-Adi','Mundi','ki-adi_mundi','password6'),(5,'Plo','Koon','plo_koon','password7'),(6,'Shaak','Ti','shaak_ti','password8'),(7,'Kit','Fisto','kit_fisto','password9');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `coursesofferedinsemester`
--

/*!50001 DROP VIEW IF EXISTS `coursesofferedinsemester`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coursesofferedinsemester` AS select `c`.`course_name` AS `course_name`,`s`.`semester_name` AS `semester_name`,`s`.`start_date` AS `start_date`,`s`.`end_date` AS `end_date` from ((`course_semester` `cs` join `courses` `c` on((`cs`.`course_id` = `c`.`course_id`))) join `semesters` `s` on((`cs`.`semester_id` = `s`.`semester_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-10 16:21:54
