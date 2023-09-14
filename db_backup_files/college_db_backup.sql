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
INSERT INTO `admins` VALUES (1,'George','Lucas','george_lucas','0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e'),(2,'Jeffrey','Abrams','jeffrey_abrams','6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4');
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
INSERT INTO `course_semester` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_student`
--

LOCK TABLES `course_student` WRITE;
/*!40000 ALTER TABLE `course_student` DISABLE KEYS */;
INSERT INTO `course_student` VALUES (1,1,1,'Pass'),(2,2,2,'Fail'),(3,3,3,'Pass'),(4,4,4,'Pass'),(5,5,5,'Pass'),(6,6,1,'Pass'),(7,7,2,NULL),(8,8,3,NULL),(9,9,4,NULL),(10,10,5,NULL),(11,11,1,NULL),(12,12,2,NULL),(13,13,3,NULL),(14,14,4,NULL),(15,15,5,NULL),(16,16,1,NULL),(17,17,2,NULL),(18,18,3,NULL),(19,19,4,NULL),(20,20,5,NULL);
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
INSERT INTO `course_teacher` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
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
INSERT INTO `students` VALUES (1,'Luke','Skywalker','luke_skywalker','aa4a9ea03fcac15b5fc63c949ac34e7b0fd17906716ac3b8e58c599cdc5a52f0'),(2,'Leia','Organa','leia_organa','53d453b0c08b6b38ae91515dc88d25fbecdd1d6001f022419629df844f8ba433'),(3,'Han','Solo','han_solo','b3d17ebbe4f2b75d27b6309cfaae1487b667301a73951e7d523a039cd2dfe110'),(4,'Bacca','Chew','chew_bacca','48caafb68583936afd0d78a7bfd7046d2492fad94f3c485915f74bb60128620d'),(5,'Lando','Calrissian','lando_calrissian','c6863e1db9b396ed31a36988639513a1c73a065fab83681f4b77adb648fac3d6'),(6,'Padme','Amidala','padme_amidala','c63c2d34ebe84032ad47b87af194fedd17dacf8222b2ea7f4ebfee3dd6db2dfb'),(7,'Anakin','Skywalker','anakin_skywalker','17a3379984b560dc311bb921b7a46b28aa5cb495667382f887a44a7fdbca7a7a'),(8,'Rey','Skywalker','rey_skywalker','69bfb918de05145fba9dcee9688dfb23f6115845885e48fa39945eebb99d8527'),(9,'FN','2187','FN_2187','d2042d75a67922194c045da2600e1c92ff6d87e8fb6e0208606665f2d1dfa892'),(10,'Poe','Dameron','poe_dameron','5790ac3d0b8ae8afc72c2c6fb97654f2b73651c328de0a3b74854ade562dd17a'),(11,'BB','8','bb_8','7535d8f2d8c35d958995610f971287288ab5e8c82a3c4fdc2b6fb5d757a5b9f8'),(12,'C','3PO','c_3po','91a9ef3563010ea1af916083f9fb03a117d4d0d2a697f82368da1f737629f717'),(13,'D2','R2','r2_d2','d23c1038532dc71d0a60a7fb3d330d7606b7520e9e5ee0ddcdb27ee1bd5bc0cd'),(14,'Qui-Gon','Jinn','qui_gon_jinn','8b807aa0505a00b3ef49e26a2ade8e31fcd6c700d1a3aeee971b49d73da8e8ff'),(15,'Shmi','Skywalker','shmi_skywalker','fc8a9296208a0b281f84690423c5d77785e493f435e6292cc322840f543729d3'),(16,'Bail','Organa','bail_organa','0b544d6d8da1d1af25318e97e0ac5f6bc70bba49919463dc0074ede01a49d381'),(17,'Mon','Mothma','mon_mothma','869f2a98b0e3a6ea928ff0542330ea3c1e0ff8591801693350f1fc3f1e57e4c5'),(18,'Wedge','Antilles','wedge_antilles','9c7568513b9c85e73f3650c8b00e3259501096ccee9d3dbdae6ff5e84aabe3af'),(19,'Admiral','Ackbar','admiral_ackbar','6f5ea1c4acc7a563ea8cb3381a55f0183a2394d679ebb7db8312e047bbf87e0d'),(20,'Rose','Tico','rose_tico','48a94846b2a7386432b90ad13bcf9c66f1efdd3a97e0e14968c262c412fe22c8');
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
INSERT INTO `teachers` VALUES (1,'Yoda','Master','master_yoda','5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764'),(2,'Mace','Windu','mace_windu','b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b'),(3,'Obi-Wan','Kenobi','obi-wan_kenobi','8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023'),(4,'Ki-Adi','Mundi','ki-adi_mundi','598a1a400c1dfdf36974e69d7e1bc98593f2e15015eed8e9b7e47a83b31693d5'),(5,'Plo','Koon','plo_koon','5860836e8f13fc9837539a597d4086bfc0299e54ad92148d54538b5c3feefb7c'),(6,'Shaak','Ti','shaak_ti','57f3ebab63f156fd8f776ba645a55d96360a15eeffc8b0e4afe4c05fa88219aa'),(7,'Kit','Fisto','kit_fisto','9323dd6786ebcbf3ac87357cc78ba1abfda6cf5e55cd01097b90d4a286cac90e');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'college'
--
/*!50003 DROP PROCEDURE IF EXISTS `AssignCourseToSemester` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignCourseToSemester`(
    IN admin_username VARCHAR(30),  -- Input for admin username
    IN admin_password VARCHAR(255), -- Input for admin password
    IN selected_course_id INT,      -- Input for selected course ID
    IN selected_semester_id INT     -- Input for selected semester ID
)
BEGIN
    -- Declare variables to hold counts
    DECLARE admin_count INT DEFAULT 0;    -- Variable to hold the count of matching admin records
    DECLARE existing_count INT DEFAULT 0; -- Variable to hold the count of existing course-semester assignments

    -- Validate admin credentials by counting matching records in the 'admins' table
    SELECT COUNT(*) INTO admin_count 
    FROM admins 
    WHERE username = admin_username AND user_password = SHA2(admin_password,256);

    -- If admin credentials are valid (count is 1), proceed
    IF admin_count = 1 THEN
        -- Check if the course is already assigned to the semester by counting matching records
        SELECT COUNT(*) INTO existing_count 
        FROM course_semester 
        WHERE course_id = selected_course_id AND semester_id = selected_semester_id;

        -- If the course is not already assigned to the semester (count is 0), assign it
        IF existing_count = 0 THEN
            INSERT INTO course_semester (course_id, semester_id) 
            VALUES (selected_course_id, selected_semester_id);
            SELECT 'Course successfully assigned to semester' AS message; -- Success message
        ELSE
            SELECT 'This course is already assigned to the given semester' AS message; -- Error message
        END IF;
    ELSE
        SELECT 'Invalid admin username or password' AS message; -- Error message for invalid admin credentials
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignCourseToTeacher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignCourseToTeacher`(
    IN admin_username VARCHAR(30),             -- Input for admin username
    IN admin_password VARCHAR(255),            -- Input for admin password
    IN selected_teacher_id INT,                -- Input for selected teacher ID
    IN selected_course_semester_id INT         -- Input for selected course-semester ID
)
BEGIN
    -- Declare variables to hold counts
    DECLARE admin_count INT DEFAULT 0;         -- Variable to hold the count of matching admin records
    DECLARE existing_count INT DEFAULT 0;      -- Variable to hold the count of existing teacher-course assignments

    -- Validate admin credentials by counting matching records in the 'admins' table
    SELECT COUNT(*) INTO admin_count 
    FROM admins 
    WHERE username = admin_username AND user_password = SHA2(admin_password,256);

    -- If admin credentials are valid (count is 1), proceed
    IF admin_count = 1 THEN
        -- Check if the teacher is already assigned to the course-semester by counting matching records
        SELECT COUNT(*) INTO existing_count
        FROM course_teacher
        WHERE teacher_id = selected_teacher_id AND course_semester_id = selected_course_semester_id;

        -- If the teacher is not already assigned to the course-semester (count is 0), assign them
        IF existing_count = 0 THEN
            INSERT INTO course_teacher (teacher_id, course_semester_id)
            VALUES (selected_teacher_id, selected_course_semester_id);
            SELECT 'Teacher successfully assigned to course' AS message;  -- Success message
        ELSE
            SELECT 'Teacher is already assigned the course' AS message;  -- Error message
        END IF;
    ELSE
        SELECT 'Invalid admin username or password' AS message;  -- Error message for invalid admin credentials
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AssignResultToStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AssignResultToStudent`(
    IN teacher_username VARCHAR(30),            -- Input for teacher username
    IN teacher_password VARCHAR(255),           -- Input for teacher password
    IN selected_student_id INT,                 -- Input for selected student ID
    IN selected_course_semester_id INT,         -- Input for selected course-semester ID
    IN given_result ENUM('Pass', 'Fail')        -- Input for the result to be assigned
)
BEGIN
    -- Declare variables to hold counts and IDs
    DECLARE selected_teacher_id INT DEFAULT 0;  -- Variable to hold the teacher ID
    DECLARE teacher_count INT DEFAULT 0;        -- Variable to hold the count of matching teacher records
    DECLARE teacher_course_count INT DEFAULT 0; -- Variable to hold the count of teacher-course assignments
    DECLARE student_count INT DEFAULT 0;        -- Variable to hold the count of student-course enrollments

    -- Validate teacher credentials by counting matching records in the 'teachers' table
    SELECT COUNT(*) INTO teacher_count 
    FROM teachers 
    WHERE username = teacher_username AND user_password = SHA2(teacher_password,256);

    -- Get the teacher_id for the authenticated teacher
    SELECT teacher_id INTO selected_teacher_id
    FROM teachers
    WHERE username = teacher_username AND user_password = SHA2(teacher_password,256);

    -- Check if the teacher is assigned to the course for the given semester
    SELECT COUNT(*) INTO teacher_course_count
    FROM course_teacher
    WHERE teacher_id = selected_teacher_id AND course_semester_id = selected_course_semester_id;

    -- Validate teacher credentials and course assignment
    IF teacher_count = 0 THEN
        SELECT 'Invalid teacher username or password' AS message;  -- Error message for invalid teacher credentials
    ELSEIF teacher_course_count = 0 THEN
        SELECT 'Teacher not assigned to the course for the given semester' AS message;  -- Error message for unassigned teacher
    ELSE
        -- Check if the student is enrolled in the course for the given semester
        SELECT COUNT(*) INTO student_count
        FROM course_student
        WHERE student_id = selected_student_id AND course_semester_id = selected_course_semester_id;

        -- Validate student enrollment
        IF student_count = 0 THEN
            SELECT 'Student not enrolled in the course for the given semester' AS message;  -- Error message for unenrolled student
        ELSE
            -- Assign the result to the student for the course in the given semester
            UPDATE course_student
            SET result = given_result
            WHERE student_id = selected_student_id AND course_semester_id = selected_course_semester_id;

            SELECT 'Result successfully assigned to student' AS message;  -- Success message
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EnrollInCourse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EnrollInCourse`(
	IN studentID INT,                          -- Input for student ID
    IN student_password VARCHAR(255),          -- Input for student password
    IN selected_course_name VARCHAR(255),      -- Input for selected course name
    IN selected_semester_name VARCHAR(30)      -- Input for selected semester name
)
proc_label: BEGIN  -- Define a label at the beginning of the compound statement
	-- Declare variables for various checks and IDs
    DECLARE course_available INT;
    DECLARE is_already_enrolled INT;
    DECLARE selected_course_id INT;
    DECLARE selected_semester_id INT;
    DECLARE selected_course_semester_id INT;
    DECLARE actual_password VARCHAR(255);
    
	-- Declare a handler for duplicate key error
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
        SELECT 'Student is already enrolled in this course for the current semester' AS message;
    END;

    -- Verify the student's password
    SELECT user_password INTO actual_password 
    FROM students 
    WHERE student_id = studentID;
    
    IF actual_password != SHA2(student_password,256) THEN
        SELECT 'Invalid password' AS message;
        LEAVE proc_label;  -- Use LEAVE followed by the label name
    END IF;

    -- Get the selected_course_id and selected_semester_id
    SELECT course_id INTO selected_course_id 
    FROM courses 
    WHERE course_name = selected_course_name;
    
    SELECT semester_id INTO selected_semester_id 
    FROM semesters 
    WHERE semester_name = selected_semester_name;

    -- Check course availability by cross-referencing with course_semester table
    SELECT COUNT(*) INTO course_available
    FROM course_semester
    WHERE course_id = selected_course_id AND semester_id = selected_semester_id;

    -- Check if the student is already enrolled in the course for the current semester
    SELECT COUNT(*) INTO is_already_enrolled
    FROM course_student 
    WHERE course_semester_id = selected_course_semester_id AND student_id = studentID;

    -- If the course is available and the student is not already enrolled, then enroll the student
    IF course_available > 0 AND is_already_enrolled = 0 THEN
        SELECT course_semester_id INTO selected_course_semester_id 
        FROM course_semester 
        WHERE course_id = selected_course_id AND semester_id = selected_semester_id;
        
        INSERT INTO course_student (student_id, course_semester_id)
        VALUES (studentID, selected_course_semester_id);
    ELSE
        -- Output a message if the course is not available or the student is already enrolled
        IF course_available = 0 THEN
            SELECT 'Course is not available in the current semester' AS message;
        ELSE
            SELECT 'Student is already enrolled in this course for the current semester' AS message;
        END IF;
    END IF;
END; ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentCoursesAndResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentCoursesAndResults`(
	IN studentID INT,                          -- Input for student ID
    IN studentPassword VARCHAR(255)            -- Input for student password
)
proc_label: BEGIN
	-- Declare variables for password verification
    DECLARE actual_password VARCHAR(255);

    -- Verify the student's password
    SELECT user_password INTO actual_password 
    FROM students 
    WHERE student_id = studentID;

    IF actual_password != SHA2(studentPassword,256) THEN
        SELECT 'Invalid password' AS message;
        LEAVE proc_label;  -- Use LEAVE followed by the label name
    END IF;

    -- If password is verified, fetch the enrolled courses and grades
    SELECT 
        c.course_name,
        s.semester_name,
        cs.result  -- Assuming result is stored in course_student table
    FROM 
        course_student AS cs
    JOIN 
        course_semester AS csem ON cs.course_semester_id = csem.course_semester_id
    JOIN 
        courses AS c ON csem.course_id = c.course_id
    JOIN 
        semesters AS s ON csem.semester_id = s.semester_id
    WHERE 
        cs.student_id = studentID;
        
END; ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ViewStudentsInMyCourses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ViewStudentsInMyCourses`(
	IN teacherID INT,                          -- Input for teacher ID
    IN teacher_password VARCHAR(255)           -- Input for teacher password
)
proc_label: BEGIN
	-- Declare variables for password verification
    DECLARE actual_password VARCHAR(255);
    
    -- Verify the teacher's password
    SELECT user_password INTO actual_password 
    FROM teachers 
    WHERE teacher_id = teacherID;
    
    IF actual_password != SHA2(teacher_password, 256) THEN
        SELECT 'Invalid password' AS message;
        LEAVE proc_label;  -- Use LEAVE followed by the label name
    END IF;

    -- Query to get the list of students enrolled in the courses that the teacher teaches, along with their result
    SELECT 
        c.course_name,
        s.student_id,
        s.forename,
        s.surname,
        cs.result
    FROM 
        teachers AS t
    JOIN 
        course_teacher AS ct ON t.teacher_id = ct.teacher_id
    JOIN 
        course_semester AS csem ON ct.course_semester_id = csem.course_semester_id
    JOIN 
        courses AS c ON csem.course_id = c.course_id
    JOIN 
        course_student AS cs ON csem.course_semester_id = cs.course_semester_id
    JOIN 
        students AS s ON cs.student_id = s.student_id
    WHERE 
        t.teacher_id = teacherID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `coursesofferedinsemester`
--

/*!50001 DROP VIEW IF EXISTS `coursesofferedinsemester`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
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

-- Dump completed on 2023-09-15  0:14:52
