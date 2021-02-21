CREATE DATABASE  IF NOT EXISTS `bohni_nithya` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bohni_nithya`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bohni_nithya
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_role` (
  `admin_role_id` int NOT NULL,
  `admin_id` int NOT NULL,
  `rold_id` int NOT NULL,
  PRIMARY KEY (`admin_role_id`),
  KEY `admin_id_fk_idx` (`admin_id`),
  KEY `role_id_fk_idx` (`rold_id`),
  CONSTRAINT `admin_id_fk` FOREIGN KEY (`admin_id`) REFERENCES `admin_users` (`admin_id`),
  CONSTRAINT `role_id_fk` FOREIGN KEY (`rold_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `admin_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `userName` varchar(425) NOT NULL,
  `password` varchar(45) NOT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `email` varchar(155) DEFAULT NULL,
  `lastLogin` varchar(47) DEFAULT NULL,
  `isActive` bit(24) NOT NULL,
  `location` varchar(45) NOT NULL,
  `user_role_id` int NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `user_id_idx` (`user_role_id`),
  CONSTRAINT `user_role_idfk` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `apply_id` int NOT NULL,
  `new_applicant_id` int NOT NULL,
  `banner_id` int NOT NULL,
  `phone` int NOT NULL,
  `completion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`apply_id`),
  KEY `banner_id_fk2_idx` (`banner_id`),
  KEY `new_applicant_id_fk1_idx` (`new_applicant_id`),
  CONSTRAINT `banner_id_fk2` FOREIGN KEY (`banner_id`) REFERENCES `posts` (`banner_id`),
  CONSTRAINT `new_applicant_id_fk1` FOREIGN KEY (`new_applicant_id`) REFERENCES `new_applicant` (`new_applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approvals`
--

DROP TABLE IF EXISTS `approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approvals` (
  `ap_id` int NOT NULL,
  `new_applicant_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`ap_id`),
  KEY `customer_id_fk_idx` (`customer_id`),
  KEY `new_applicant_fkid_idx` (`new_applicant_id`),
  CONSTRAINT `customer_id_fk6` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `new_applicant_fkid` FOREIGN KEY (`new_applicant_id`) REFERENCES `new_applicant` (`new_applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvals`
--

LOCK TABLES `approvals` WRITE;
/*!40000 ALTER TABLE `approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_categories`
--

DROP TABLE IF EXISTS `business_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  `category_image` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `featured` int DEFAULT NULL,
  `user_role_id` int NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`),
  KEY `user_role_id_fk_idx` (`user_role_id`),
  CONSTRAINT `user_roleid_fk` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_categories`
--

LOCK TABLES `business_categories` WRITE;
/*!40000 ALTER TABLE `business_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_sellers`
--

DROP TABLE IF EXISTS `business_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_sellers` (
  `seller_id` int NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `category_id` int NOT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_title` varchar(45) DEFAULT NULL,
  `flat` varchar(45) DEFAULT NULL,
  `latitude` text,
  `longtitude` tinytext,
  `active` int DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `phone_no` int DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `region` varchar(45) DEFAULT NULL,
  `owner_email` varchar(45) NOT NULL,
  PRIMARY KEY (`seller_id`),
  UNIQUE KEY `category_id_UNIQUE` (`category_id`),
  UNIQUE KEY `owner_email_UNIQUE` (`owner_email`),
  KEY `category_id_fk_idx` (`category_id`),
  CONSTRAINT `category_id_fk3` FOREIGN KEY (`category_id`) REFERENCES `business_categories` (`category_id`),
  CONSTRAINT `owner_email_fk3` FOREIGN KEY (`owner_email`) REFERENCES `expense` (`owner_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_sellers`
--

LOCK TABLES `business_sellers` WRITE;
/*!40000 ALTER TABLE `business_sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_services`
--

DROP TABLE IF EXISTS `business_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_services` (
  `service_id` int NOT NULL,
  `category_id` int NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_title` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone_no` int DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `latitude` text,
  `longtitude` text,
  `active` int DEFAULT NULL,
  `zipcode` int DEFAULT NULL,
  `owner_email` varchar(45) NOT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `owner_email_UNIQUE` (`owner_email`),
  KEY `category_id_fk4_idx` (`category_id`),
  CONSTRAINT `category_id_fk4` FOREIGN KEY (`category_id`) REFERENCES `business_categories` (`category_id`),
  CONSTRAINT `owner_email_fk6` FOREIGN KEY (`owner_email`) REFERENCES `expense` (`owner_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_services`
--

LOCK TABLES `business_services` WRITE;
/*!40000 ALTER TABLE `business_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_description`
--

DROP TABLE IF EXISTS `customer_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_description` (
  `customer-type-id` int NOT NULL,
  `customer_description` varchar(45) DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`customer-type-id`),
  KEY `customer_id_fk_idx` (`customer_id`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_description`
--

LOCK TABLES `customer_description` WRITE;
/*!40000 ALTER TABLE `customer_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `flat` varchar(145) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) NOT NULL,
  `country` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `latitude` tinytext NOT NULL,
  `longtitude` tinytext NOT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `expense_id` int NOT NULL,
  `owner_email` varchar(45) NOT NULL,
  `payee` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `payment_mode` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`expense_id`),
  UNIQUE KEY `owner_email_UNIQUE` (`owner_email`),
  KEY `seller_id_fk_idx` (`category_id`),
  CONSTRAINT `seller_id_fk` FOREIGN KEY (`category_id`) REFERENCES `business_sellers` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_applicant`
--

DROP TABLE IF EXISTS `new_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_applicant` (
  `new_applicant_id` int NOT NULL,
  `user_role_id` int NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_status` enum('0,1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Usertype` enum('vendor,customer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` int DEFAULT NULL COMMENT 'Active=0, Deactive=1',
  `user_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_type` enum('fixed,moved') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery` enum('Y,N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invite_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`new_applicant_id`),
  KEY `user_role_id_fk2_idx` (`user_role_id`),
  CONSTRAINT `user_role_id_fk2` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_applicant`
--

LOCK TABLES `new_applicant` WRITE;
/*!40000 ALTER TABLE `new_applicant` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_products`
--

DROP TABLE IF EXISTS `new_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_products` (
  `item_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `itemt_name` varchar(225) DEFAULT NULL,
  `item_quantity_per_unit` varchar(45) DEFAULT NULL,
  `item_unit_price` decimal(10,2) DEFAULT NULL,
  `item_type` varchar(45) DEFAULT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `service_id_fk1_idx` (`service_id`),
  KEY `seller_id_fk6_idx` (`seller_id`),
  CONSTRAINT `seller_id_fk6` FOREIGN KEY (`seller_id`) REFERENCES `business_sellers` (`seller_id`),
  CONSTRAINT `service_id_fk8` FOREIGN KEY (`service_id`) REFERENCES `business_services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_products`
--

LOCK TABLES `new_products` WRITE;
/*!40000 ALTER TABLE `new_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_customer_details`
--

DROP TABLE IF EXISTS `order_customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_customer_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `unit_price` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_fk1_idx` (`order_id`),
  CONSTRAINT `order_id_fk1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_customer_details`
--

LOCK TABLES `order_customer_details` WRITE;
/*!40000 ALTER TABLE `order_customer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `required_date` datetime DEFAULT NULL,
  `order_title` varchar(425) DEFAULT NULL,
  `order_type` varchar(45) DEFAULT NULL,
  `order_unit` varchar(45) DEFAULT NULL,
  `order_at_rate` decimal(10,0) DEFAULT NULL,
  `order_sub_total` decimal(10,0) DEFAULT NULL,
  `order_quantity` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `item_id_fk5_idx` (`item_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `item_id_fk5` FOREIGN KEY (`item_id`) REFERENCES `new_products` (`item_id`),
  CONSTRAINT `user_id_fk8` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_customer`
--

DROP TABLE IF EXISTS `orders_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_customer` (
  `id` int NOT NULL,
  `seller_id` int NOT NULL,
  `seller_name` varchar(45) DEFAULT NULL,
  `service_id` int NOT NULL,
  `service_name` varchar(45) DEFAULT NULL,
  `customer_id` int NOT NULL,
  `cust_name` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_id_fk2_idx` (`seller_id`),
  KEY `service_id_fk2_idx` (`service_id`),
  CONSTRAINT `seller_id_fk2` FOREIGN KEY (`seller_id`) REFERENCES `business_sellers` (`seller_id`),
  CONSTRAINT `service_id_fk2` FOREIGN KEY (`service_id`) REFERENCES `business_services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_customer`
--

LOCK TABLES `orders_customer` WRITE;
/*!40000 ALTER TABLE `orders_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `banner_id` int NOT NULL,
  `banner_title` varchar(45) DEFAULT NULL,
  `banner_url` varchar(45) DEFAULT NULL,
  `banner_link` varchar(45) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `isActive` int NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `img_id` int NOT NULL,
  `item_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `item_id_fk1_idx` (`item_id`),
  CONSTRAINT `item_id_fk1` FOREIGN KEY (`item_id`) REFERENCES `new_products` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `customer_id` int NOT NULL,
  `seller_id` int NOT NULL,
  `service_id` int NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `review` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `seller_id_fk3_idx` (`seller_id`),
  KEY `service_id_fk3_idx` (`service_id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `seller_id_fk3` FOREIGN KEY (`seller_id`) REFERENCES `business_sellers` (`seller_id`),
  CONSTRAINT `service_id_fk3` FOREIGN KEY (`service_id`) REFERENCES `business_services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL,
  `code` varchar(120) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `description` varchar(425) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_product`
--

DROP TABLE IF EXISTS `seller_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_product` (
  `seller_product_id` int NOT NULL,
  `sellers_id` int NOT NULL,
  `category_id` int NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `quantity_per_unit` int DEFAULT NULL,
  `unit_price` varchar(45) DEFAULT NULL,
  `unit_in_stock` varchar(45) DEFAULT NULL,
  `units_on_order` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`seller_product_id`),
  KEY `category_idfk_idx` (`category_id`),
  KEY `sellers_idfk_idx` (`sellers_id`),
  CONSTRAINT `category_idfk` FOREIGN KEY (`category_id`) REFERENCES `business_categories` (`category_id`),
  CONSTRAINT `sellers_idfk` FOREIGN KEY (`sellers_id`) REFERENCES `business_sellers` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_product`
--

LOCK TABLES `seller_product` WRITE;
/*!40000 ALTER TABLE `seller_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_product`
--

DROP TABLE IF EXISTS `service_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_product` (
  `service_product_id` int NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `service_id` int NOT NULL,
  `category_id` int NOT NULL,
  `qunatity_per_unit` int DEFAULT NULL,
  `unit_price` varchar(45) DEFAULT NULL,
  `unit_in_stock` varchar(45) DEFAULT NULL,
  `units_on_order` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`service_product_id`),
  KEY `service_id_fk_idx` (`service_id`),
  KEY `category_id_fk1_idx` (`category_id`),
  CONSTRAINT `category_id_fk1` FOREIGN KEY (`category_id`) REFERENCES `business_categories` (`category_id`),
  CONSTRAINT `service_idfk` FOREIGN KEY (`service_id`) REFERENCES `business_services` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_product`
--

LOCK TABLES `service_product` WRITE;
/*!40000 ALTER TABLE `service_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider` (
  `id` int NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider`
--

LOCK TABLES `slider` WRITE;
/*!40000 ALTER TABLE `slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_role_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `flat` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `latitude` tinytext,
  `longtitude` tinytext,
  `profile` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `invite_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role_id_fk_idx` (`user_role_id`),
  CONSTRAINT `user_role_id_fk` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
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

-- Dump completed on 2021-02-20 22:26:03
