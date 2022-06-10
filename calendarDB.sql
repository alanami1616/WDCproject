-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: calendarDB
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Current Database: `calendarDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `calendarDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `calendarDB`;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(63) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `guest_user_id` int DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `events_locationId_fk` (`location_id`),
  KEY `events_userId_fk` (`user_id`),
  KEY `events_guestUserId_fk` (`guest_user_id`),
  CONSTRAINT `events_guestUserId_fk` FOREIGN KEY (`guest_user_id`) REFERENCES `guest_users` (`guest_user_id`) ON DELETE SET NULL,
  CONSTRAINT `events_locationId_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE SET NULL,
  CONSTRAINT `events_userId_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_users`
--

DROP TABLE IF EXISTS `guest_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_users` (
  `guest_user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(63) DEFAULT NULL,
  `last_name` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`guest_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_users`
--

LOCK TABLES `guest_users` WRITE;
/*!40000 ALTER TABLE `guest_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invite_status`
--

DROP TABLE IF EXISTS `invite_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invite_status` (
  `invite_status_id` int NOT NULL AUTO_INCREMENT,
  `event_response` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `guest_user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  PRIMARY KEY (`invite_status_id`),
  KEY `inviteStatus_userID_fk` (`user_id`),
  KEY `inviteStatus_guestUserId_fk` (`guest_user_id`),
  KEY `inviteStatus_eventId_fk` (`event_id`),
  CONSTRAINT `inviteStatus_eventId_fk` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE SET NULL,
  CONSTRAINT `inviteStatus_guestUserId_fk` FOREIGN KEY (`guest_user_id`) REFERENCES `guest_users` (`guest_user_id`) ON DELETE SET NULL,
  CONSTRAINT `inviteStatus_userID_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_status`
--

LOCK TABLES `invite_status` WRITE;
/*!40000 ALTER TABLE `invite_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `invite_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(63) DEFAULT NULL,
  `city` varchar(63) DEFAULT NULL,
  `street_name` varchar(63) DEFAULT NULL,
  `street_number` int NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(63) DEFAULT NULL,
  `last_name` varchar(63) DEFAULT NULL,
  `email` varchar(127) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10  3:29:08
