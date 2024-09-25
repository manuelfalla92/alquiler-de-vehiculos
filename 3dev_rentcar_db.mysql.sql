/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 3dev_rentcar_db
-- ------------------------------------------------------
-- Server version	10.11.9-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `price_per_day` decimal(8,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_reset_tokens_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2024_09_08_213045_create_cars_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES
(1,'App\\Models\\User',5,'auth_token','513191ced6f6256011ef85f1534ccb4db90e8cae2a73bda67bb27d3a02d227db','[\"*\"]',NULL,NULL,'2024-09-08 23:03:40','2024-09-08 23:03:40'),
(2,'App\\Models\\User',1,'auth_token','3ec05e383a32f1c6930c98ac72d34680fc14c395e48cba001e8ed62815f7a00f','[\"*\"]',NULL,NULL,'2024-09-08 23:03:59','2024-09-08 23:03:59'),
(3,'App\\Models\\User',5,'auth_token','6942db6e0153eed9c1ad581a4850ca3fc9f7675100dc52a0109b83233fd44e62','[\"*\"]',NULL,NULL,'2024-09-08 23:04:28','2024-09-08 23:04:28'),
(4,'App\\Models\\User',1,'auth_token','878be735efa7ecac32e54816eb72eb32bcffdbd9012efe3a47558fc4fcd2bebd','[\"*\"]',NULL,NULL,'2024-09-08 23:06:20','2024-09-08 23:06:20'),
(5,'App\\Models\\User',1,'auth_token','e14a80fc14f8cc9ff1abe26fcda6ea1663c1d1fa466a295129f3ebe4e9dee473','[\"*\"]',NULL,NULL,'2024-09-08 23:09:20','2024-09-08 23:09:20'),
(6,'App\\Models\\User',1,'auth_token','35f57b115c25cf844c357ecaa4edc7317414c92ff0f4c45d628c1fa9f6456207','[\"*\"]',NULL,NULL,'2024-09-08 23:11:00','2024-09-08 23:11:00'),
(7,'App\\Models\\User',1,'auth_token','72c2c1733a14804694625813b25485176dcb46f5a9b1082920831d3e06948b22','[\"*\"]',NULL,NULL,'2024-09-08 23:12:05','2024-09-08 23:12:05'),
(8,'App\\Models\\User',1,'auth_token','65b92ce3e7977e38f12dcb2c712332721bf019422233349d2bf5cfa06be9581d','[\"*\"]',NULL,NULL,'2024-09-08 23:52:53','2024-09-08 23:52:53'),
(9,'App\\Models\\User',1,'auth_token','9e5fda1677e2629c8d134e754aaa681666ef6cd4dc18a99817239ed978622921','[\"*\"]',NULL,NULL,'2024-09-08 23:56:01','2024-09-08 23:56:01'),
(10,'App\\Models\\User',1,'auth_token','9bb1bd692b5a058a1dd03e6e3b37d1e0d042660164443fc5589e48486ff14db8','[\"*\"]',NULL,NULL,'2024-09-08 23:58:29','2024-09-08 23:58:29'),
(11,'App\\Models\\User',1,'auth_token','6c14eea0aeb607ad9990f9382098775391e1d7ab5f95b50a4ad6a5a827bd65df','[\"*\"]',NULL,NULL,'2024-09-09 00:30:16','2024-09-09 00:30:16'),
(12,'App\\Models\\User',1,'auth_token','feae34ef48a69d7994a87b75273dfef813dd030f12db3d0a43866b8d9c2d092c','[\"*\"]',NULL,NULL,'2024-09-09 00:36:59','2024-09-09 00:36:59'),
(13,'App\\Models\\User',1,'auth_token','7785ace2d4b1597c164c140e622d095acfa913c0c365711500e48fbe4654c439','[\"*\"]',NULL,NULL,'2024-09-09 00:59:05','2024-09-09 00:59:05'),
(14,'App\\Models\\User',6,'auth_token','b8732e17c58d34bd106a4487dca2b556dcf880a438d44888ac96a19554e9e55b','[\"*\"]',NULL,NULL,'2024-09-11 02:20:34','2024-09-11 02:20:34');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Carlos Ramirez','cramirezruiz30@gmail.com',NULL,'$2y$12$Yfcx7/LzqunVve9iHN24UOmYqdHPTrSyOebi8zn4NMJ57QHhLgKuu',NULL,'2024-09-08 23:03:13','2024-09-08 23:03:13'),
(2,'Manuel Falla','manuelfalla1234@gmail.com',NULL,'$2y$12$A7/5Kvx97C8mQjLhPzmNF.MqDS.XuAWcW4OKXwpKXXtECdc9EiPoe',NULL,'2024-09-08 23:03:13','2024-09-08 23:03:13'),
(3,'Cliente 1','cliente1@gmail.com',NULL,'$2y$12$YwidBzMBVCm7ld36AXteXeYvTbtaIZt1N2dyHcKKBtLvyhfZhB2SO',NULL,'2024-09-08 23:03:14','2024-09-08 23:03:14'),
(4,'Cliente 2','cliente2@gmail.com',NULL,'$2y$12$Uj1be9A18pzaGfOOSlGnd.Vz8OZ8PUwImIjlCF89jnzKg.wBg0t2a',NULL,'2024-09-08 23:03:14','2024-09-08 23:03:14'),
(5,'Carlos Alberto Ramirez Ruiz','cramirezruizess@hotmail.com',NULL,'$2y$12$pxh4qDN5PIiekqmXvA3Ql.KcLbUWM/trlf1u0FEEh21Ospz8ByDsO',NULL,'2024-09-08 23:03:40','2024-09-08 23:03:40'),
(6,'Manuel Antonio','m@gmail.com',NULL,'$2y$12$c2agO0hZP1ZTxe4QVzueJ.sKJWeUHw/41xgMpt8CKL72JVQv2qEx.',NULL,'2024-09-11 02:20:34','2024-09-11 02:20:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database '3dev_rentcar_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-24  5:10:49
