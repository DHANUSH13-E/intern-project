-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: tamilnadu_culture_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `application_feedback`
--

DROP TABLE IF EXISTS `application_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `rating` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5fqgcdg953d0wowyt3ibq15ep` (`user_id`),
  CONSTRAINT `FK5fqgcdg953d0wowyt3ibq15ep` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `code` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int NOT NULL,
  `icon_class` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ta` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKiwylx6fb2dqdw8kfc31vaiiyp` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chatbot_qa_knowledge`
--

DROP TABLE IF EXISTS `chatbot_qa_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatbot_qa_knowledge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intent_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_ta` text COLLATE utf8mb4_unicode_ci,
  `verified` bit(1) NOT NULL,
  `related_entry_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjyip24ry0f8xe6bkgj1eguuw8` (`related_entry_id`),
  CONSTRAINT `FKjyip24ry0f8xe6bkgj1eguuw8` FOREIGN KEY (`related_entry_id`) REFERENCES `cultural_entries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_items`
--

DROP TABLE IF EXISTS `collection_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `added_at` datetime(6) NOT NULL,
  `collection_id` bigint NOT NULL,
  `entry_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKbu7hlux0a8j0ma00uqn8sxcjm` (`collection_id`,`entry_id`),
  KEY `FK2hgoykomwt9gtfust9o1w9htl` (`entry_id`),
  CONSTRAINT `FK2hgoykomwt9gtfust9o1w9htl` FOREIGN KEY (`entry_id`) REFERENCES `cultural_entries` (`id`),
  CONSTRAINT `FKrkp5wpkksx5aqex6v4qnq9912` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_private` bit(1) NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn7pdedyqaiddr0uxdj603my7d` (`user_id`),
  CONSTRAINT `FKn7pdedyqaiddr0uxdj603my7d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_translations`
--

DROP TABLE IF EXISTS `content_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_translations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `language_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewer_notes` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translated_full_description` text COLLATE utf8mb4_unicode_ci,
  `translated_short_description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `translated_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `entry_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKps64et6txep726cobttbg6y9r` (`entry_id`,`language_code`),
  CONSTRAINT `FKb4buh6pe3ifpl6jepoy0o79w6` FOREIGN KEY (`entry_id`) REFERENCES `cultural_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `correction_reports`
--

DROP TABLE IF EXISTS `correction_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `correction_reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(6) NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `entry_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdw3flx24tl1mav71huspyqcab` (`entry_id`),
  KEY `FKjd6ix78xfuncwa7p4a60rxs27` (`user_id`),
  CONSTRAINT `FKdw3flx24tl1mav71huspyqcab` FOREIGN KEY (`entry_id`) REFERENCES `cultural_entries` (`id`),
  CONSTRAINT `FKjd6ix78xfuncwa7p4a60rxs27` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cultural_entries`
--

DROP TABLE IF EXISTS `cultural_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cultural_entries` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `alternate_names` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authenticity_type` enum('ARCHAEOLOGICAL_SCHOLARLY','COMMUNITY_ORAL_HISTORY','FOLKLORE_LEGEND','HISTORICAL_FACT','RELIGIOUS_TRADITION') COLLATE utf8mb4_unicode_ci NOT NULL,
  `average_rating` double NOT NULL,
  `cover_image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `cultural_significance` text COLLATE utf8mb4_unicode_ci,
  `featured` bit(1) NOT NULL,
  `festivals_customs` text COLLATE utf8mb4_unicode_ci,
  `folklore_stories` text COLLATE utf8mb4_unicode_ci,
  `full_description` text COLLATE utf8mb4_unicode_ci,
  `hidden_gem` bit(1) NOT NULL,
  `history_origin` text COLLATE utf8mb4_unicode_ci,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `moderation_notes` text COLLATE utf8mb4_unicode_ci,
  `related_arts` text COLLATE utf8mb4_unicode_ci,
  `religion_community` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_references` text COLLATE utf8mb4_unicode_ci,
  `status` enum('APPROVED','CHANGES_REQUESTED','PENDING','REJECTED','UNDER_REVIEW') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ta` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ratings` int NOT NULL,
  `town_village` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `traditional_clothing` text COLLATE utf8mb4_unicode_ci,
  `traditional_cuisine` text COLLATE utf8mb4_unicode_ci,
  `updated_at` datetime(6) NOT NULL,
  `view_count` int NOT NULL,
  `category_id` bigint NOT NULL,
  `contributor_id` bigint DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ybvd5pmnh7491vugai14vtvx` (`category_id`),
  KEY `FKnjl6nm2hvc6wsxvc1cvtauxmo` (`contributor_id`),
  KEY `FKa1xy36wnkmq7sgush90tog35s` (`district_id`),
  CONSTRAINT `FK7ybvd5pmnh7491vugai14vtvx` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `FKa1xy36wnkmq7sgush90tog35s` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`),
  CONSTRAINT `FKnjl6nm2hvc6wsxvc1cvtauxmo` FOREIGN KEY (`contributor_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `name_en` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ta` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKgkpvb55aiiyu9n55qoxcwmkds` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `entry_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5rvcqtxnxa5tmism2vmtbr0aj` (`user_id`,`entry_id`),
  KEY `FKj2ryujcso7x43qyh4m4mh77y0` (`entry_id`),
  CONSTRAINT `FK6ffqdnwmm3ks4fenx2ml1uap8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj2ryujcso7x43qyh4m4mh77y0` FOREIGN KEY (`entry_id`) REFERENCES `cultural_entries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `otp_verifications`
--

DROP TABLE IF EXISTS `otp_verifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_verifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `attempts_count` int NOT NULL,
  `dev_otp_display` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime(6) NOT NULL,
  `last_sent_at` datetime(6) NOT NULL,
  `otp_hash` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ratings_reviews`
--

DROP TABLE IF EXISTS `ratings_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings_reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `rating` int NOT NULL,
  `review_text` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL,
  `entry_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKydxhowkbf89h6w07c9wb75km` (`user_id`,`entry_id`),
  KEY `FK97jy8rjrroa23539909uje2xd` (`entry_id`),
  CONSTRAINT `FK97jy8rjrroa23539909uje2xd` FOREIGN KEY (`entry_id`) REFERENCES `cultural_entries` (`id`),
  CONSTRAINT `FKhh6y4wd5qvm33w00gn93ekqv7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `country` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` bit(1) NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_country_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferred_language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('ROLE_ADMIN','ROLE_PUBLIC_USER') COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-13 20:48:45
