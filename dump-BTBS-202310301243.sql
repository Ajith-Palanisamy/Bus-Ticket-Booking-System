-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (arm64)
--
-- Host: localhost    Database: BTBS
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_role_id` bigint NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_UN` (`email`),
  KEY `account_FK` (`user_role_id`),
  CONSTRAINT `account_FK` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (9,'ajith@gmail.com','$2a$10$nF7.WKbSLayjCiEtNtc5fOdTL4NMpAaNMNcvfmI0KDc8xyLShWV6q',2),(10,'sai@gmail.com','$2a$10$zpswqEGDuVk0bDCxY2hgeOwOBPGXfFhsxftUO7otBkqGqODAEh0RS',2),(11,'admin@gmail.com','$2a$10$nF7.WKbSLayjCiEtNtc5fOdTL4NMpAaNMNcvfmI0KDc8xyLShWV6q',1),(12,'sathish@gmail.com','$2a$10$u3RNXNyxh5oP0kOdYwkEQ.7zs/Y0pbR.S4mXRKbQCKqN0q0IvhUUO',2),(13,'deepak@gmail.com','$2a$10$2vvabm7gcwtFOCO9an4dP.nWqPkCy1cxfE8J6iWufNa4G219i8rMO',3);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` bigint NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  CONSTRAINT `admin_FK` FOREIGN KEY (`admin_id`) REFERENCES `account` (`account_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (11,'Admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` bigint NOT NULL AUTO_INCREMENT,
  `trip_id` bigint DEFAULT NULL,
  `booked_by` bigint DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `booking_FK` (`booked_by`),
  KEY `booking_FK_1` (`trip_id`),
  CONSTRAINT `booking_FK` FOREIGN KEY (`booked_by`) REFERENCES `account` (`account_id`),
  CONSTRAINT `booking_FK_1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (12,34,9,'Booked'),(13,43,9,'Cancelled'),(14,74,9,'Cancelled'),(15,77,9,'Booked'),(16,78,9,'Cancelled'),(17,78,9,'Cancelled'),(18,36,9,'Trip Cancelled'),(19,78,10,'Booked'),(20,38,9,'Trip Cancelled'),(21,38,9,'Cancelled'),(22,39,9,'Booked'),(23,42,9,'Trip Cancelled'),(24,32,9,'Booked'),(25,79,10,'Booked'),(26,79,9,'Booked'),(27,80,9,'Booked'),(28,80,12,'Booked'),(29,79,12,'Booked');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus` (
  `bus_id` bigint NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(100) DEFAULT NULL,
  `bus_number` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `ac` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `isAvailable` bigint DEFAULT '1',
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`bus_id`),
  KEY `bus_ac_IDX` (`ac`) USING BTREE,
  KEY `bus_type_IDX` (`type`) USING BTREE,
  KEY `bus_FK` (`owner_id`),
  CONSTRAINT `bus_FK` FOREIGN KEY (`owner_id`) REFERENCES `bus_owner` (`bus_owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (7,'KRISH TRAVELS','TN37DX7905','SEATER',1,9,1,9),(8,'INTER CITY','TN42A9876','SLEEPER',0,12,1,9),(9,'Orange Travels','TN38AS1232','SLEEPER',0,36,1,9),(14,'YBM TRAVELS','TN98BC4287','SLEEPER',1,30,1,9),(15,'JP TRAVELS','KL56S3452','SLEEPER',1,24,1,10);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_owner`
--

DROP TABLE IF EXISTS `bus_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_owner` (
  `bus_owner_id` bigint NOT NULL,
  `aadhar_number` varchar(100) DEFAULT NULL,
  `pan_number` varchar(100) DEFAULT NULL,
  `wallet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`bus_owner_id`),
  CONSTRAINT `bus_owner_FK` FOREIGN KEY (`bus_owner_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_owner`
--

LOCK TABLES `bus_owner` WRITE;
/*!40000 ALTER TABLE `bus_owner` DISABLE KEYS */;
INSERT INTO `bus_owner` VALUES (9,'987654321010','ABCD',-1200),(10,'123456789012','1234567890',4100),(11,'6382778409','ABCD',0),(12,'123456789012','AB12CD12EF23',0);
/*!40000 ALTER TABLE `bus_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `pan_number` varchar(100) DEFAULT NULL,
  `aadhar_number` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `request_FK` (`user_id`),
  CONSTRAINT `request_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,10,'1234567890','123456789012','Rejected','2023-10-24'),(3,10,'1234567890','123456789012','Accepted','2023-10-24'),(4,12,'AB12CD12EF23','123456789012','Rejected','2023-10-24'),(5,12,'AB12CD12EF23','123456789012','Accepted','2023-10-25');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seating`
--

DROP TABLE IF EXISTS `seating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seating` (
  `bus_id` bigint NOT NULL,
  `seat_number` varchar(100) NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `isAvailable` tinyint DEFAULT '1',
  PRIMARY KEY (`bus_id`,`seat_number`),
  CONSTRAINT `seatings_FK` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seating`
--

LOCK TABLES `seating` WRITE;
/*!40000 ALTER TABLE `seating` DISABLE KEYS */;
INSERT INTO `seating` VALUES (7,'A1','SEATER',1),(7,'A2','SEATER',1),(7,'A3','SEATER',1),(7,'B1','SEATER',1),(7,'B2','SEATER',1),(7,'B3','SEATER',1),(7,'C1','SEATER',1),(7,'C2','SEATER',1),(7,'C3','SEATER',1),(8,'LA1','LOWER',1),(8,'LA2','LOWER',1),(8,'LA3','LOWER',1),(8,'LB1','LOWER',1),(8,'LB2','LOWER',1),(8,'LB3','LOWER',1),(8,'UA1','UPPER',1),(8,'UA2','UPPER',1),(8,'UA3','UPPER',1),(8,'UB1','UPPER',1),(8,'UB2','UPPER',1),(8,'UB3','UPPER',1),(9,'LA1','LOWER',1),(9,'LA2','LOWER',1),(9,'LA3','LOWER',1),(9,'LB1','LOWER',1),(9,'LB2','LOWER',1),(9,'LB3','LOWER',1),(9,'LC1','LOWER',1),(9,'LC2','LOWER',1),(9,'LC3','LOWER',1),(9,'LD1','LOWER',1),(9,'LD2','LOWER',1),(9,'LD3','LOWER',1),(9,'LE1','LOWER',1),(9,'LE2','LOWER',1),(9,'LE3','LOWER',1),(9,'LF1','LOWER',1),(9,'LF2','LOWER',1),(9,'LF3','LOWER',1),(9,'UA1','UPPER',1),(9,'UA2','UPPER',1),(9,'UA3','UPPER',1),(9,'UB1','UPPER',1),(9,'UB2','UPPER',1),(9,'UB3','UPPER',1),(9,'UC1','UPPER',1),(9,'UC2','UPPER',1),(9,'UC3','UPPER',1),(9,'UD1','UPPER',1),(9,'UD2','UPPER',1),(9,'UD3','UPPER',1),(9,'UE1','UPPER',1),(9,'UE2','UPPER',1),(9,'UE3','UPPER',1),(9,'UF1','UPPER',1),(9,'UF2','UPPER',1),(9,'UF3','UPPER',1),(14,'LA1','LOWER',1),(14,'LA2','LOWER',1),(14,'LA3','LOWER',1),(14,'LB1','LOWER',1),(14,'LB2','LOWER',1),(14,'LB3','LOWER',1),(14,'LC1','LOWER',1),(14,'LC2','LOWER',1),(14,'LC3','LOWER',1),(14,'LD1','LOWER',1),(14,'LD2','LOWER',1),(14,'LD3','LOWER',1),(14,'LE1','LOWER',1),(14,'LE2','LOWER',1),(14,'LE3','LOWER',1),(14,'UA1','UPPER',1),(14,'UA2','UPPER',1),(14,'UA3','UPPER',1),(14,'UB1','UPPER',1),(14,'UB2','UPPER',1),(14,'UB3','UPPER',1),(14,'UC1','UPPER',1),(14,'UC2','UPPER',1),(14,'UC3','UPPER',1),(14,'UD1','UPPER',1),(14,'UD2','UPPER',1),(14,'UD3','UPPER',1),(14,'UE1','UPPER',1),(14,'UE2','UPPER',1),(14,'UE3','UPPER',1),(15,'LA1','LOWER',1),(15,'LA2','LOWER',1),(15,'LA3','LOWER',1),(15,'LB1','LOWER',1),(15,'LB2','LOWER',1),(15,'LB3','LOWER',1),(15,'LC1','LOWER',1),(15,'LC2','LOWER',1),(15,'LC3','LOWER',1),(15,'LD1','LOWER',1),(15,'LD2','LOWER',1),(15,'LD3','LOWER',1),(15,'UA1','UPPER',1),(15,'UA2','UPPER',1),(15,'UA3','UPPER',1),(15,'UB1','UPPER',1),(15,'UB2','UPPER',1),(15,'UB3','UPPER',1),(15,'UC1','UPPER',1),(15,'UC2','UPPER',1),(15,'UC3','UPPER',1),(15,'UD1','UPPER',1),(15,'UD2','UPPER',1),(15,'UD3','UPPER',1);
/*!40000 ALTER TABLE `seating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` bigint NOT NULL AUTO_INCREMENT,
  `booking_id` bigint DEFAULT NULL,
  `seat_number` varchar(100) DEFAULT NULL,
  `passenger_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `prize` int DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `refund` int DEFAULT '0',
  PRIMARY KEY (`ticket_id`),
  KEY `ticket_FK` (`booking_id`),
  CONSTRAINT `ticket_FK` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (12,12,'LA1','Ajith','Male',300,'Booked','LOWER',0),(13,12,'LA2','Kavya','Female',300,'Booked','LOWER',0),(14,13,'UA2','Deepak','Male',850,'Cancelled and Refunded','UPPER',850),(15,13,'LA1','Ram','Male',1200,'Cancelled and Refunded','LOWER',1200),(16,14,'LA1','Durai','Male',1200,'Cancelled and Refunded','LOWER',1200),(17,14,'LA2','Maithan','Male',1200,'Cancelled and Refunded','LOWER',1200),(18,14,'UC3','Nithish','Male',850,'Cancelled and Refunded','UPPER',850),(19,15,'LA1','Naveen','Male',1100,'Booked','LOWER',0),(20,15,'LB2','Abisheik','Male',1100,'Booked','LOWER',0),(21,15,'UA2','Deepak','Male',1000,'Cancelled','UPPER',0),(22,16,'LA1','Yuvan','Male',1100,'Cancelled and Refunded','LOWER',1100),(23,16,'LB2','Akil','Male',1100,'Cancelled','LOWER',0),(24,17,'LA1','A','Male',1100,'Cancelled','LOWER',0),(25,18,'A1','A','Male',900,'Trip Cancelled','SEATER',900),(26,18,'A3','B','Male',900,'Trip Cancelled','SEATER',900),(27,19,'LA2','A','Male',1100,'Booked','LOWER',0),(28,19,'LC2','B','Male',1100,'Booked','LOWER',0),(29,20,'A1','A','Male',900,'Trip Cancelled','SEATER',900),(30,20,'B1','B','Male',900,'Trip Cancelled','SEATER',900),(31,20,'C2','C','Male',900,'Trip Cancelled','SEATER',900),(32,21,'B2','3','Female',900,'Cancelled and Refunded','SEATER',900),(33,21,'C1','g','Female',900,'Cancelled and Refunded','SEATER',900),(34,22,'A1','xsw','Male',900,'Cancelled and Refunded','SEATER',900),(35,23,'LA1','huh','Male',1200,'Trip Cancelled','LOWER',1200),(36,24,'A1','A','Male',400,'Booked','SEATER',0),(37,24,'B1','B','Female',400,'Booked','SEATER',0),(38,24,'B2','C','Female',400,'Cancelled and Refunded','SEATER',400),(39,25,'LA1','Sathish','Male',900,'Booked','LOWER',0),(40,25,'UB3','Vishnu','Female',700,'Booked','UPPER',0),(41,26,'LA2','Ajith','Male',900,'Booked','LOWER',0),(42,26,'UC1','Deepan','Male',700,'Booked','UPPER',0),(43,26,'UD2','Ram','Male',700,'Booked','UPPER',0),(44,27,'LA1','Prabu','Male',900,'Booked','LOWER',0),(45,27,'UA1','kADHIR','Male',700,'Booked','UPPER',0),(46,28,'LA2','A','Male',900,'Booked','LOWER',0),(47,28,'UB1','B','Male',700,'Booked','UPPER',0),(48,28,'UC2','C','Male',700,'Cancelled and Refunded','UPPER',700),(49,29,'LC3','Ajith','Male',900,'Booked','LOWER',0);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `trip_id` bigint NOT NULL AUTO_INCREMENT,
  `trip_schedule_id` bigint DEFAULT NULL,
  `trip_date` date DEFAULT NULL,
  `seater_prize` int DEFAULT NULL,
  `upper_sleeper_prize` int DEFAULT NULL,
  `lower_sleeper_prize` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `trip_FK` (`trip_schedule_id`),
  CONSTRAINT `trip_FK` FOREIGN KEY (`trip_schedule_id`) REFERENCES `trip_schedule` (`trip_schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (32,15,'2023-11-06',400,0,0,'Booking Opened','07:00:00','13:00:00'),(33,15,'2023-11-07',400,0,0,'Booking Opened','07:00:00','13:00:00'),(34,16,'2023-10-21',0,400,300,'Booking Opened','15:00:00','18:00:00'),(35,17,'2023-11-01',900,0,0,'Cancelled','21:00:00','03:00:00'),(36,17,'2023-11-02',900,0,0,'Cancelled','21:00:00','03:00:00'),(37,17,'2023-11-03',900,0,0,'Cancelled','21:00:00','03:00:00'),(38,17,'2023-11-04',900,0,0,'Cancelled','21:00:00','03:00:00'),(39,17,'2023-11-05',900,0,0,'Booking Opened','21:00:00','03:00:00'),(40,18,'2023-11-01',100,0,0,'Cancelled','06:00:00','13:00:00'),(41,19,'2023-11-01',666,0,0,'Cancelled','13:01:00','16:04:00'),(42,20,'2023-11-02',0,850,1200,'Cancelled','19:30:00','03:30:00'),(43,20,'2023-11-03',0,850,1200,'Cancelled','19:30:00','03:30:00'),(44,20,'2023-11-04',0,850,1200,'Cancelled','19:30:00','03:30:00'),(45,20,'2023-11-05',0,850,1200,'Cancelled','19:30:00','03:30:00'),(46,20,'2023-11-06',0,850,1200,'Cancelled','19:30:00','03:30:00'),(47,20,'2023-11-07',0,850,1200,'Cancelled','19:30:00','03:30:00'),(48,20,'2023-11-08',0,850,1200,'Cancelled','19:30:00','03:30:00'),(49,20,'2023-11-09',0,850,1200,'Cancelled','19:30:00','03:30:00'),(50,20,'2023-11-10',0,850,1200,'Cancelled','19:30:00','03:30:00'),(51,20,'2023-11-11',0,850,1200,'Cancelled','19:30:00','03:30:00'),(52,20,'2023-11-12',0,850,1200,'Cancelled','19:30:00','03:30:00'),(53,20,'2023-11-13',0,850,1200,'Cancelled','19:30:00','03:30:00'),(54,20,'2023-11-14',0,850,1200,'Cancelled','19:30:00','03:30:00'),(55,20,'2023-11-15',0,850,1200,'Cancelled','19:30:00','03:30:00'),(56,20,'2023-11-16',0,850,1200,'Cancelled','19:30:00','03:30:00'),(57,20,'2023-11-17',0,850,1200,'Cancelled','19:30:00','03:30:00'),(58,20,'2023-11-18',0,850,1200,'Cancelled','19:30:00','03:30:00'),(59,20,'2023-11-19',0,850,1200,'Cancelled','19:30:00','03:30:00'),(60,20,'2023-11-20',0,850,1200,'Cancelled','19:30:00','03:30:00'),(61,20,'2023-11-21',0,850,1200,'Cancelled','19:30:00','03:30:00'),(62,20,'2023-11-22',0,850,1200,'Cancelled','19:30:00','03:30:00'),(63,20,'2023-11-23',0,850,1200,'Cancelled','19:30:00','03:30:00'),(64,20,'2023-11-24',0,850,1200,'Cancelled','19:30:00','03:30:00'),(65,20,'2023-11-25',0,850,1200,'Cancelled','19:30:00','03:30:00'),(66,20,'2023-11-26',0,850,1200,'Cancelled','19:30:00','03:30:00'),(67,20,'2023-11-27',0,850,1200,'Cancelled','19:30:00','03:30:00'),(68,20,'2023-11-28',0,850,1200,'Cancelled','19:30:00','03:30:00'),(69,20,'2023-11-29',0,850,1200,'Cancelled','19:30:00','03:30:00'),(70,20,'2023-11-30',0,850,1200,'Cancelled','19:30:00','03:30:00'),(71,20,'2023-12-01',0,850,1200,'Cancelled','19:30:00','03:30:00'),(72,20,'2023-12-02',0,850,1200,'Cancelled','19:30:00','03:30:00'),(73,20,'2023-12-03',0,850,1200,'Cancelled','19:30:00','03:30:00'),(74,20,'2023-12-04',0,850,1200,'Cancelled','19:30:00','03:30:00'),(75,20,'2023-12-05',0,850,1200,'Cancelled','19:30:00','03:30:00'),(76,20,'2023-12-06',0,850,1200,'Cancelled','19:30:00','03:30:00'),(77,21,'2023-10-23',0,1000,1100,'Booking Opened','22:00:00','05:00:00'),(78,21,'2023-10-24',0,1000,1100,'Booking Opened','22:00:00','05:00:00'),(79,22,'2023-10-25',0,700,900,'Booking Opened','19:00:00','03:00:00'),(80,22,'2023-10-26',0,700,900,'Booking Opened','19:00:00','03:00:00'),(81,22,'2023-10-27',0,700,900,'Booking Opened','19:00:00','03:00:00');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_schedule`
--

DROP TABLE IF EXISTS `trip_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_schedule` (
  `trip_schedule_id` bigint NOT NULL AUTO_INCREMENT,
  `bus_id` bigint DEFAULT NULL,
  `from` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `to` varchar(100) DEFAULT NULL,
  `trip_start_time` time DEFAULT NULL,
  `trip_duration` time DEFAULT NULL,
  `schedule_start_date` date DEFAULT NULL,
  `schedule_end_date` date DEFAULT NULL,
  `seater_prize` int DEFAULT NULL,
  `upper_sleeper_prize` int DEFAULT NULL,
  `lower_sleeper_prize` int DEFAULT NULL,
  `isActive` tinyint DEFAULT '1',
  PRIMARY KEY (`trip_schedule_id`),
  KEY `trip_schedule_FK` (`bus_id`),
  CONSTRAINT `trip_schedule_FK` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_schedule`
--

LOCK TABLES `trip_schedule` WRITE;
/*!40000 ALTER TABLE `trip_schedule` DISABLE KEYS */;
INSERT INTO `trip_schedule` VALUES (15,7,'Coimbatore','Banglore','07:00:00','06:00:00','2023-11-06','2023-11-07',400,0,0,1),(16,8,'Coimbatore','Banglore','15:00:00','03:00:00','2023-10-21','2023-10-21',0,400,300,1),(17,7,'Coimbatore','Chennai','21:00:00','06:00:00','2023-11-01','2023-11-05',900,0,0,1),(18,7,'Chennai','Banglore','06:00:00','07:00:00','2023-11-01','2023-11-01',100,0,0,1),(19,7,'Chennai','Banglore','13:01:00','03:03:00','2023-11-01','2023-11-01',666,0,0,1),(20,9,'Coimbatore','Banglore','19:30:00','08:00:00','2023-11-02','2023-12-06',0,850,1200,0),(21,14,'Coimbatore','Chennai','22:00:00','07:00:00','2023-10-23','2023-10-24',0,1000,1100,1),(22,15,'Coimbatore','Chennai','19:00:00','08:00:00','2023-10-25','2023-10-27',0,700,900,1);
/*!40000 ALTER TABLE `trip_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `wallet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_FK` FOREIGN KEY (`user_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'Ajith','9876543210','3500'),(10,'Sai','9842325889','-1600'),(11,'Admin','6382778409','0'),(12,'Sathish','9842325889','-2500'),(13,'Deepak','9842325889','0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT,
  `user_role` varchar(100) NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'bus_owner'),(3,'user');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BTBS'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-30 12:43:06
