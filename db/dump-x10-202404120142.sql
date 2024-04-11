-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: x10
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `aliases`
--

DROP TABLE IF EXISTS `aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `command` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aliases_bot_id_index` (`bot_id`),
  CONSTRAINT `aliases_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliases`
--

LOCK TABLES `aliases` WRITE;
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobans`
--

DROP TABLE IF EXISTS `autobans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autobans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `xatid` int NOT NULL,
  `citext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours` int NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autobans_bot_id_index` (`bot_id`),
  CONSTRAINT `autobans_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobans`
--

LOCK TABLES `autobans` WRITE;
/*!40000 ALTER TABLE `autobans` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autotemps`
--

DROP TABLE IF EXISTS `autotemps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autotemps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `xatid` int NOT NULL,
  `regname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autotemps_bot_id_index` (`bot_id`),
  CONSTRAINT `autotemps_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autotemps`
--

LOCK TABLES `autotemps` WRITE;
/*!40000 ALTER TABLE `autotemps` DISABLE KEYS */;
/*!40000 ALTER TABLE `autotemps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badwords`
--

DROP TABLE IF EXISTS `badwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badwords` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `badword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hours` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `badwords_bot_id_index` (`bot_id`),
  CONSTRAINT `badwords_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badwords`
--

LOCK TABLES `badwords` WRITE;
/*!40000 ALTER TABLE `badwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `badwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_command_minrank`
--

DROP TABLE IF EXISTS `bot_command_minrank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_command_minrank` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `command_id` int unsigned NOT NULL,
  `minrank_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bot_command_minrank_bot_id_index` (`bot_id`),
  KEY `bot_command_minrank_command_id_index` (`command_id`),
  KEY `bot_command_minrank_minrank_id_index` (`minrank_id`),
  CONSTRAINT `bot_command_minrank_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`),
  CONSTRAINT `bot_command_minrank_command_id_foreign` FOREIGN KEY (`command_id`) REFERENCES `commands` (`id`),
  CONSTRAINT `bot_command_minrank_minrank_id_foreign` FOREIGN KEY (`minrank_id`) REFERENCES `minranks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_command_minrank`
--

LOCK TABLES `bot_command_minrank` WRITE;
/*!40000 ALTER TABLE `bot_command_minrank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_command_minrank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_statuses`
--

DROP TABLE IF EXISTS `bot_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_statuses`
--

LOCK TABLES `bot_statuses` WRITE;
/*!40000 ALTER TABLE `bot_statuses` DISABLE KEYS */;
INSERT INTO `bot_statuses` VALUES (1,'Online','2024-04-11 13:38:40','2024-04-11 13:38:40'),(2,'Offline','2024-04-11 13:38:40','2024-04-11 13:38:40'),(3,'Error','2024-04-11 13:38:40','2024-04-11 13:38:40'),(4,'Suspended','2024-04-11 13:38:40','2024-04-11 13:38:40');
/*!40000 ALTER TABLE `bot_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_user`
--

DROP TABLE IF EXISTS `bot_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bot_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bot_user_bot_id_foreign` (`bot_id`),
  KEY `bot_user_user_id_foreign` (`user_id`),
  CONSTRAINT `bot_user_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`),
  CONSTRAINT `bot_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_user`
--

LOCK TABLES `bot_user` WRITE;
/*!40000 ALTER TABLE `bot_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `botlang`
--

DROP TABLE IF EXISTS `botlang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botlang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `botlang_sentences_id` bigint unsigned NOT NULL,
  `bot_id` int unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `botlang_botlang_sentences_id_index` (`botlang_sentences_id`),
  KEY `botlang_bot_id_index` (`bot_id`),
  CONSTRAINT `botlang_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`),
  CONSTRAINT `botlang_botlang_sentences_id_foreign` FOREIGN KEY (`botlang_sentences_id`) REFERENCES `botlang_sentences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botlang`
--

LOCK TABLES `botlang` WRITE;
/*!40000 ALTER TABLE `botlang` DISABLE KEYS */;
/*!40000 ALTER TABLE `botlang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `botlang_sentences`
--

DROP TABLE IF EXISTS `botlang_sentences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botlang_sentences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sentences` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botlang_sentences`
--

LOCK TABLES `botlang_sentences` WRITE;
/*!40000 ALTER TABLE `botlang_sentences` DISABLE KEYS */;
INSERT INTO `botlang_sentences` VALUES (1,'cmd.steam.wrongsteamid','{\"en\": \"Your steamid is wrong!\"}','2024-04-11 13:38:40','2024-04-11 13:38:40'),(2,'cmd.steam.notplaying','{\"en\": \"You are not playing at this moment.\"}','2024-04-11 13:38:40','2024-04-11 13:38:40'),(3,'cmd.steam.nosteamid','{\"en\": \"Please, set a steamid in panel.\"}','2024-04-11 13:38:40','2024-04-11 13:38:40'),(4,'cmd.steam.isplaying','{\"en\": \"$0 is playing $1\"}','2024-04-11 13:38:40','2024-04-11 13:38:40');
/*!40000 ALTER TABLE `botlang_sentences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `botlogs`
--

DROP TABLE IF EXISTS `botlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botlogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chatid` int NOT NULL,
  `typemessage` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `botlogs_chatid_index` (`chatid`),
  KEY `botlogs_typemessage_index` (`typemessage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botlogs`
--

LOCK TABLES `botlogs` WRITE;
/*!40000 ALTER TABLE `botlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `botlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bots`
--

DROP TABLE IF EXISTS `bots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `creator_user_id` int unsigned NOT NULL,
  `bot_status_id` int unsigned DEFAULT NULL,
  `server_id` int unsigned DEFAULT NULL,
  `language_id` int unsigned NOT NULL,
  `premium` bigint NOT NULL DEFAULT '1',
  `chatid` bigint NOT NULL,
  `chatname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chatpw` int DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bot(glow#000080#c0ccd4)(hat#Eb)',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '123',
  `homepage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'xatbot.fr',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'xatbot.fr#000080#c0ccd4',
  `pcback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autowelcome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Hello!',
  `toggleautowelcome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pm',
  `ticklemessage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customcommand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '!',
  `maxkick` int NOT NULL DEFAULT '3',
  `maxkickban` int NOT NULL DEFAULT '1',
  `maxflood` int NOT NULL DEFAULT '10',
  `maxchar` int NOT NULL DEFAULT '10',
  `maxsmilies` int NOT NULL DEFAULT '10',
  `automember` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `automessage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `automessagetime` int NOT NULL DEFAULT '30',
  `autorestart` tinyint(1) NOT NULL DEFAULT '1',
  `gameban_unban` tinyint(1) NOT NULL DEFAULT '1',
  `powersdisabled` json DEFAULT NULL,
  `togglemoderation` tinyint(1) NOT NULL DEFAULT '1',
  `premiumfreeze` bigint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `minstaffautotemp` int NOT NULL DEFAULT '2',
  `toggleradio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'off',
  `togglelinkfilter` tinyint(1) NOT NULL DEFAULT '0',
  `was_connected` tinyint(1) NOT NULL DEFAULT '0',
  `kickafk_minutes` int NOT NULL DEFAULT '30',
  `togglemessages` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bots_chatid_unique` (`chatid`),
  UNIQUE KEY `bots_chatname_unique` (`chatname`),
  KEY `bots_bot_status_id_foreign` (`bot_status_id`),
  KEY `bots_creator_user_id_index` (`creator_user_id`),
  KEY `bots_server_id_index` (`server_id`),
  KEY `bots_language_id_index` (`language_id`),
  CONSTRAINT `bots_bot_status_id_foreign` FOREIGN KEY (`bot_status_id`) REFERENCES `bot_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `bots_creator_user_id_foreign` FOREIGN KEY (`creator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `bots_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `bots_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bots`
--

LOCK TABLES `bots` WRITE;
/*!40000 ALTER TABLE `bots` DISABLE KEYS */;
/*!40000 ALTER TABLE `bots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_level` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,'8ball','',1,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(2,'active','',2,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(3,'allmissing','',1,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(4,'badge','',4,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(5,'ban','',4,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(6,'boot','',4,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(7,'bump','',3,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(8,'calc','',2,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(9,'chatinfos','',3,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(10,'choose','',1,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(11,'clear','',4,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(12,'countdown','',2,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(13,'dice','',1,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(14,'die','',4,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(15,'dunce','',3,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(16,'dx','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(17,'edit','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(18,'everymissing','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(19,'gag','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(20,'game','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(21,'gameban','',3,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(22,'gamebanme','',2,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(23,'getmain','',5,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(24,'guestself','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(25,'hash','',2,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(26,'horoscope','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(27,'hush','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(28,'jinx','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(29,'joke','',2,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(30,'kick','',3,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(31,'kickall','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(32,'latestpower','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(33,'listsmilies','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(34,'love','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(35,'misc','',1,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(36,'mostactive','',2,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(37,'mute','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(38,'naughtystep','',4,'2024-04-11 13:38:38','2024-04-11 13:38:38'),(39,'online','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(40,'pool','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(41,'poorest','',2,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(42,'premium','',3,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(43,'price','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(44,'randomnumber','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(45,'randomsmiley','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(46,'randomuser','',2,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(47,'rank','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(48,'refresh','',5,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(49,'reverseban','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(50,'say','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(51,'search','',2,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(52,'shortname','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(53,'sinbin','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(54,'slots','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(55,'started','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(56,'store','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(57,'temp','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(58,'test','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(59,'twitch','',2,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(60,'unbadge','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(61,'unban','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(62,'undunce','',3,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(63,'unnaughtystep','',4,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(64,'unyellowcard','',3,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(65,'users','',2,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(66,'value','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(67,'wallet','',5,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(68,'whatis','',1,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(69,'wikipedia','',2,'2024-04-11 13:38:39','2024-04-11 13:38:39'),(70,'xd','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(71,'yellowcard','',3,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(72,'youtube','',2,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(73,'zap','',3,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(74,'zipban','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(75,'hasmost','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(76,'userinfo','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(77,'lastseen','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(78,'power','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(79,'weather','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(80,'pc','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(81,'pm','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(82,'scroll','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(83,'xatwiki','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(84,'leastactive','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(85,'twitter','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(86,'radio','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(87,'autotemp','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(88,'mail','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(89,'snitch','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(90,'staff','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(91,'customcommand','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(92,'autoban','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(93,'minrank','',5,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(94,'alias','',5,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(95,'response','',5,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(96,'logs','',3,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(97,'spotify','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(98,'richest','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(99,'commands','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(100,'modproof','',3,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(101,'game','',4,'2024-04-11 13:38:40','2024-04-11 13:38:40'),(102,'steam','',1,'2024-04-11 13:38:40','2024-04-11 13:38:40');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customcommands`
--

DROP TABLE IF EXISTS `customcommands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customcommands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `command` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minrank_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customcommands_bot_id_index` (`bot_id`),
  KEY `customcommands_minrank_id_index` (`minrank_id`),
  CONSTRAINT `customcommands_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`),
  CONSTRAINT `customcommands_minrank_id_foreign` FOREIGN KEY (`minrank_id`) REFERENCES `minranks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customcommands`
--

LOCK TABLES `customcommands` WRITE;
/*!40000 ALTER TABLE `customcommands` DISABLE KEYS */;
/*!40000 ALTER TABLE `customcommands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','2024-04-11 13:38:36','2024-04-11 13:38:36'),(2,'Français','fr','2024-04-11 13:38:36','2024-04-11 13:38:36');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linksfilter`
--

DROP TABLE IF EXISTS `linksfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linksfilter` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `linksfilter_bot_id_index` (`bot_id`),
  CONSTRAINT `linksfilter_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linksfilter`
--

LOCK TABLES `linksfilter` WRITE;
/*!40000 ALTER TABLE `linksfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `linksfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chatid` int NOT NULL,
  `citext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chatname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `typemessage` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_chatid_index` (`chatid`),
  KEY `logs_citext_index` (`citext`),
  KEY `logs_chatname_index` (`chatname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails`
--

DROP TABLE IF EXISTS `mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mails` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `touser` int NOT NULL,
  `fromuser` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `store` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mails_touser_index` (`touser`),
  KEY `mails_fromuser_index` (`fromuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails`
--

LOCK TABLES `mails` WRITE;
/*!40000 ALTER TABLE `mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_10_16_134348_create_languages_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_reset_tokens_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2015_01_15_105324_create_roles_table',1),(6,'2015_01_15_114412_create_role_user_table',1),(7,'2015_01_26_115212_create_permissions_table',1),(8,'2015_01_26_115523_create_permission_role_table',1),(9,'2015_02_09_132439_create_permission_user_table',1),(10,'2017_03_27_075542_create_servers_table',1),(11,'2017_03_27_075813_create_bot_statuses_table',1),(12,'2017_03_27_075852_create_bots_table',1),(13,'2017_03_27_075908_create_bot_user_table',1),(14,'2017_03_27_091023_create_minranks_table',1),(15,'2017_03_27_091757_create_commands_table',1),(16,'2017_03_27_095014_create_bot_command_minrank_table',1),(17,'2017_04_24_135015_create_staffs_table',1),(18,'2017_04_25_091613_create_autotemps_table',1),(19,'2017_04_25_134202_create_snitchs_table',1),(20,'2017_04_27_152108_create_botlang_sentences_table',1),(21,'2017_04_27_152116_create_botlang_table',1),(22,'2017_04_28_091217_create_aliases_table',1),(23,'2017_05_09_114322_create_responses_table',1),(24,'2017_05_09_114333_create_badwords_table',1),(25,'2017_05_12_072647_create_ticket_departments_table',1),(26,'2017_05_12_072650_create_tickets_table',1),(27,'2017_05_12_072657_create_ticket_messages_table',1),(28,'2017_06_05_143521_create_userinfo_table',1),(29,'2017_07_17_120702_create_autobans_table',1),(30,'2017_07_17_120726_create_linksfilter_table',1),(31,'2017_07_17_120841_create_customcommands_table',1),(32,'2017_07_17_120919_create_botlogs_table',1),(33,'2017_07_21_095007_add_minstaffautotemp_bots_table',1),(34,'2017_07_24_215151_add_toggleradio_bots_table',1),(35,'2017_07_24_224836_add_togglelinkfilter_bots_table',1),(36,'2017_07_31_204549_create_mails_table',1),(37,'2017_08_03_135715_create_logs_table',1),(38,'2017_09_22_224836_add_wasconnected_bots_table',1),(39,'2017_09_24_172714_add_avatar_users_table',1),(40,'2017_09_25_172714_add_sharekey_users_table',1),(41,'2017_09_30_123949_add_spotify_users_table',1),(42,'2017_10_16_134404_create_sitelang_sentences_table',1),(43,'2017_11_28_134404_add_kickafkminute_bots_table',1),(44,'2018_01_08_095607_add_togglemessages_bots_table',1),(45,'2018_05_14_092822_add_steam_users_table',1),(46,'2018_05_14_092910_add_botstat_users_table',1),(47,'2018_08_15_140334_create_user_events_table',1),(48,'2019_02_07_144258_add_softdelete_bots_table',1),(49,'2019_08_19_000000_create_failed_jobs_table',1),(50,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minranks`
--

DROP TABLE IF EXISTS `minranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minranks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minranks`
--

LOCK TABLES `minranks` WRITE;
/*!40000 ALTER TABLE `minranks` DISABLE KEYS */;
INSERT INTO `minranks` VALUES (1,'Bot Owner',6,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(2,'Main Owner',5,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(3,'Owner',4,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(4,'Moderator',3,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(5,'Member',2,'2024-04-11 13:38:37','2024-04-11 13:38:37'),(6,'Guest',1,'2024-04-11 13:38:37','2024-04-11 13:38:37');
/*!40000 ALTER TABLE `minranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_user`
--

LOCK TABLES `permission_user` WRITE;
/*!40000 ALTER TABLE `permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `phrase` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responses_bot_id_index` (`bot_id`),
  CONSTRAINT `responses_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1,1,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(2,5,5,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(3,3,7,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(4,2,8,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(5,4,10,'2024-04-11 13:38:36','2024-04-11 13:38:36');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin','',10,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(2,'senior.helper','senior.helper','',4,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(3,'helper','helper','',3,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(4,'translator','translator','',2,'2024-04-11 13:38:36','2024-04-11 13:38:36'),(5,'user','user','',1,'2024-04-11 13:38:36','2024-04-11 13:38:36');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,'Sun','2024-04-11 13:38:36','2024-04-11 13:38:36'),(2,'Mercury','2024-04-11 13:38:36','2024-04-11 13:38:36'),(3,'Venus','2024-04-11 13:38:36','2024-04-11 13:38:36'),(4,'Earth','2024-04-11 13:38:36','2024-04-11 13:38:36'),(5,'Mars','2024-04-11 13:38:36','2024-04-11 13:38:36'),(6,'Jupiter','2024-04-11 13:38:37','2024-04-11 13:38:37'),(7,'Saturn','2024-04-11 13:38:37','2024-04-11 13:38:37'),(8,'Uranus','2024-04-11 13:38:37','2024-04-11 13:38:37'),(9,'Neptune','2024-04-11 13:38:37','2024-04-11 13:38:37'),(10,'Pluto','2024-04-11 13:38:37','2024-04-11 13:38:37');
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitelang_sentences`
--

DROP TABLE IF EXISTS `sitelang_sentences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitelang_sentences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sentences` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitelang_sentences`
--

LOCK TABLES `sitelang_sentences` WRITE;
/*!40000 ALTER TABLE `sitelang_sentences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitelang_sentences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snitchs`
--

DROP TABLE IF EXISTS `snitchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snitchs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `xatid` int NOT NULL,
  `regname` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `snitchs_bot_id_index` (`bot_id`),
  CONSTRAINT `snitchs_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snitchs`
--

LOCK TABLES `snitchs` WRITE;
/*!40000 ALTER TABLE `snitchs` DISABLE KEYS */;
/*!40000 ALTER TABLE `snitchs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bot_id` int unsigned NOT NULL,
  `xatid` int NOT NULL,
  `regname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minrank_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffs_minrank_id_foreign` (`minrank_id`),
  KEY `staffs_bot_id_index` (`bot_id`),
  CONSTRAINT `staffs_bot_id_foreign` FOREIGN KEY (`bot_id`) REFERENCES `bots` (`id`),
  CONSTRAINT `staffs_minrank_id_foreign` FOREIGN KEY (`minrank_id`) REFERENCES `minranks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_departments`
--

DROP TABLE IF EXISTS `ticket_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_departments`
--

LOCK TABLES `ticket_departments` WRITE;
/*!40000 ALTER TABLE `ticket_departments` DISABLE KEYS */;
INSERT INTO `ticket_departments` VALUES (1,'Help','2024-04-11 13:38:40','2024-04-11 13:38:40'),(2,'Report','2024-04-11 13:38:41','2024-04-11 13:38:41'),(3,'Payment issue','2024-04-11 13:38:41','2024-04-11 13:38:41'),(4,'Suggestion','2024-04-11 13:38:41','2024-04-11 13:38:41'),(5,'Staff','2024-04-11 13:38:41','2024-04-11 13:38:41');
/*!40000 ALTER TABLE `ticket_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_messages`
--

DROP TABLE IF EXISTS `ticket_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `ticket_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_messages_user_id_index` (`user_id`),
  KEY `ticket_messages_ticket_id_index` (`ticket_id`),
  CONSTRAINT `ticket_messages_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
  CONSTRAINT `ticket_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_messages`
--

LOCK TABLES `ticket_messages` WRITE;
/*!40000 ALTER TABLE `ticket_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(1) NOT NULL,
  `department_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_user_id_index` (`user_id`),
  KEY `tickets_department_id_index` (`department_id`),
  CONSTRAINT `tickets_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `ticket_departments` (`id`),
  CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_events`
--

DROP TABLE IF EXISTS `user_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `xatid` int NOT NULL,
  `rank` int NOT NULL,
  `chatid` int NOT NULL,
  `chatname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_bans` int NOT NULL,
  `amount_commands` int NOT NULL,
  `amount_kicks` int NOT NULL,
  `amount_messages` int NOT NULL,
  `amount_ranks` int NOT NULL,
  `connected_at` timestamp NOT NULL,
  `left_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_events_xatid_chatid_left_at_index` (`xatid`,`chatid`,`left_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_events`
--

LOCK TABLES `user_events` WRITE;
/*!40000 ALTER TABLE `user_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `xatid` int NOT NULL,
  `citext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chatid` int NOT NULL,
  `chatname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `packet` json NOT NULL,
  `optout` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userinfo_xatid_index` (`xatid`),
  KEY `userinfo_citext_index` (`citext`),
  KEY `userinfo_regname_index` (`regname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `citext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xatid` bigint NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int unsigned NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spotify` json DEFAULT NULL,
  `steam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `botstat` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_regname_unique` (`regname`),
  UNIQUE KEY `users_xatid_unique` (`xatid`),
  UNIQUE KEY `users_citext_unique` (`citext`),
  KEY `users_language_id_index` (`language_id`),
  CONSTRAINT `users_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'sdf','admin@gmail.com','admin','test',9797,'$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',2,'127.0.0.1',NULL,'2024-04-11 12:24:14','2024-04-11 13:39:11','sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i','hCv101UbYJ2G0AuDOOKRULmB0WSb0tGsSPPAqcG0FNmGaKpAHC1JsAVxNWGA',NULL,NULL,NULL),(5,'user1223','user@gmail.com','user','user',12345,'$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',2,'127.0.0.1',NULL,'2024-04-11 12:24:14',NULL,'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',NULL,NULL,NULL,NULL),(7,'helper123','helper@gmail.com','helper','helper',4354,'$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',1,'127.0.0.1',NULL,'2024-04-11 12:24:14',NULL,'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',NULL,NULL,NULL,NULL),(8,'senior.helper','senior.helper@gmail.com','senior.helper','senior.helper',546546,'$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',2,'127.0.0.1',NULL,'2024-04-11 12:24:14',NULL,'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',NULL,NULL,NULL,NULL),(10,'translator','translator@gmail.com','translator','translator',34546,'$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',1,'127.0.0.1',NULL,'2024-04-11 12:24:14',NULL,'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'x10'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12  1:42:56
