-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: restaurante_isarza
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `alergenos`
--

DROP TABLE IF EXISTS `alergenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergenos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergenos`
--

LOCK TABLES `alergenos` WRITE;
/*!40000 ALTER TABLE `alergenos` DISABLE KEYS */;
INSERT INTO `alergenos` VALUES (1,'gluten'),(2,'leche'),(3,'huevos'),(4,'pescado'),(5,'sulfitos'),(6,'sésamo'),(7,'altramuces'),(8,'soja'),(9,'frutos de cascara'),(10,'cacahuetes'),(11,'moluscos'),(12,'cereales'),(13,'crustaceo');
/*!40000 ALTER TABLE `alergenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Bodas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementos_menu`
--

DROP TABLE IF EXISTS `elementos_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementos_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `plato_id` int DEFAULT NULL,
  `orden` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `plato_id` (`plato_id`),
  CONSTRAINT `elementos_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`),
  CONSTRAINT `elementos_menu_ibfk_2` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementos_menu`
--

LOCK TABLES `elementos_menu` WRITE;
/*!40000 ALTER TABLE `elementos_menu` DISABLE KEYS */;
INSERT INTO `elementos_menu` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,1),(6,1,6,2),(7,1,7,3),(8,1,8,1),(9,1,9,2),(10,1,10,3),(11,1,11,1),(12,2,12,1),(13,2,13,2),(14,2,14,3),(15,2,15,4),(16,2,16,1),(17,2,17,2),(18,2,18,3),(19,2,19,4),(20,2,20,1),(21,2,21,2),(22,2,22,3),(23,2,23,1),(24,3,24,1),(25,3,25,2),(26,3,26,3),(27,3,27,4),(28,3,28,1),(29,3,29,2),(30,3,30,3),(31,3,31,4),(32,3,32,1),(33,3,33,2),(34,3,34,3),(35,3,35,1);
/*!40000 ALTER TABLE `elementos_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_precio_cond`
--

DROP TABLE IF EXISTS `menu_precio_cond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_precio_cond` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `condicion` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id` (`menu_id`),
  CONSTRAINT `menu_precio_cond_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_precio_cond`
--

LOCK TABLES `menu_precio_cond` WRITE;
/*!40000 ALTER TABLE `menu_precio_cond` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_precio_cond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subcategoria_id` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategoria_id` (`subcategoria_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`subcategoria_id`) REFERENCES `subcategorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,1,'Menú Sondika'),(2,2,'Menú Txorierri'),(3,3,'Menú Izarza');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos`
--

DROP TABLE IF EXISTS `platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `tipo` enum('Aperitivo','Entrante','Principal','Postre') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos`
--

LOCK TABLES `platos` WRITE;
/*!40000 ALTER TABLE `platos` DISABLE KEYS */;
INSERT INTO `platos` VALUES (1,'Croquetas de bacalao, jamón y Txistorra','Aperitivo'),(2,'Mousse de bonito con muselina de piquillos','Aperitivo'),(3,'Txupito de sopa de calabaza y vainilla','Aperitivo'),(4,'Jamón Ibérico acompañado de tostadas de pan con tomate y ajo','Aperitivo'),(5,'Ensalada de láminas de ventresca, pimientos confitados y patatas asadas','Entrante'),(6,'Tarrina de mousse de foie y hongos con confitura','Entrante'),(7,'Crep relleno de cremoso de pulpo con patata, pimentón y salsa','Entrante'),(8,'Merluza asada con guiso de txipirones','Principal'),(9,'Sorbete de mandarina al martini blanco','Principal'),(10,'Paletilla de cordero lechal asado y manzana en compota','Principal'),(11,'Tarta nupcial','Postre'),(12,'Croquetas de bacalao, jamón y hongos','Aperitivo'),(13,'Txupito de gazpacho','Aperitivo'),(14,'Taco empanado de bonito y pisto','Aperitivo'),(15,'Jamón Ibérico acompañado de tostadas de pan con tomate y ajo','Aperitivo'),(16,'Ensalada de txangurro, anchoas en timbal de patata y aliño de su coral','Entrante'),(17,'Mi cuit de pato con manzana en dos cocciones y geleé de moscatel','Entrante'),(18,'Rollito de bacalao, pimiento verde y puerro con pil-pil de pimientos rojos','Entrante'),(19,'Vieiras salteadas con pesto de confitura de algas y tallos de lechuga mini','Entrante'),(20,'Bacalao dos gustos (Pil-Pil y Bizkaina)','Principal'),(21,'Sorbete de mojito','Principal'),(22,'Paletilla de cordero lechal a baja temperatura con compota de manzana y alcachofa salteada','Principal'),(23,'Tarta nupcial acompañada con helado','Postre'),(24,'Croquetas de jamón, txistorra y queso azul','Aperitivo'),(25,'Brocheta de pollo de corral y yogurt griego espaciado','Aperitivo'),(26,'Cucharilla de patata asada y ali oli de miel y hierbas frescas','Aperitivo'),(27,'Jamón Ibérico acompañado de tostadas de pan con tomate y ajo','Aperitivo'),(28,'Ensalada de bogavante descascarillado con guacamole ligero y brotes tiernos de temporada','Entrante'),(29,'Cream broule de Mi Cuit de Foie reposado en vino de oporto y pomelo en salazón','Entrante'),(30,'Pimientos rellenos de rape y sopa cremosa de abacanto','Entrante'),(31,'Langostinos al horno con refrito de ajo al txakoli','Entrante'),(32,'Rape a la plancha con refrito de ajos y patatas panaderas','Principal'),(33,'Sorbete de manzana verde con vodka','Principal'),(34,'Solomillo a la plancha con tarrina tocinera y patata','Principal'),(35,'Tarta nupcial acompañada con helado','Postre');
/*!40000 ALTER TABLE `platos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platos_alergenos`
--

DROP TABLE IF EXISTS `platos_alergenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platos_alergenos` (
  `plato_id` int NOT NULL,
  `alergeno_id` int NOT NULL,
  PRIMARY KEY (`plato_id`,`alergeno_id`),
  KEY `alergeno_id` (`alergeno_id`),
  CONSTRAINT `platos_alergenos_ibfk_1` FOREIGN KEY (`plato_id`) REFERENCES `platos` (`id`),
  CONSTRAINT `platos_alergenos_ibfk_2` FOREIGN KEY (`alergeno_id`) REFERENCES `alergenos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platos_alergenos`
--

LOCK TABLES `platos_alergenos` WRITE;
/*!40000 ALTER TABLE `platos_alergenos` DISABLE KEYS */;
INSERT INTO `platos_alergenos` VALUES (1,1),(2,1),(4,1),(6,1),(7,1),(9,1),(10,1),(12,1),(13,1),(15,1),(16,1),(17,1),(18,1),(20,1),(21,1),(24,1),(27,1),(29,1),(30,1),(33,1),(34,1),(1,2),(2,2),(4,2),(5,2),(6,2),(7,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(29,2),(30,2),(33,2),(35,2),(1,3),(4,3),(7,3),(9,3),(10,3),(11,3),(12,3),(14,3),(15,3),(18,3),(21,3),(23,3),(24,3),(27,3),(29,3),(33,3),(35,3),(1,4),(2,4),(5,4),(8,4),(10,4),(12,4),(14,4),(16,4),(18,4),(20,4),(30,4),(32,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(16,5),(17,5),(18,5),(19,5),(20,5),(21,5),(22,5),(23,5),(24,5),(25,5),(26,5),(27,5),(28,5),(29,5),(30,5),(32,5),(33,5),(34,5),(35,5),(4,6),(6,6),(11,6),(13,6),(14,6),(15,6),(17,6),(23,6),(27,6),(34,6),(35,6),(4,7),(13,7),(14,7),(15,7),(23,7),(27,7),(29,7),(34,7),(35,7),(4,8),(6,8),(11,8),(13,8),(14,8),(15,8),(17,8),(23,8),(25,8),(27,8),(29,8),(35,8),(4,9),(6,9),(9,9),(11,9),(13,9),(14,9),(15,9),(17,9),(21,9),(23,9),(27,9),(29,9),(33,9),(35,9),(11,10),(23,10),(35,10),(5,11),(7,11),(8,11),(19,11),(11,12),(23,12),(35,12),(16,13),(28,13);
/*!40000 ALTER TABLE `platos_alergenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategorias`
--

DROP TABLE IF EXISTS `subcategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria_id` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`),
  UNIQUE KEY `nombre_3` (`nombre`),
  UNIQUE KEY `nombre_4` (`nombre`),
  UNIQUE KEY `nombre_5` (`nombre`),
  UNIQUE KEY `nombre_6` (`nombre`),
  UNIQUE KEY `nombre_7` (`nombre`),
  UNIQUE KEY `nombre_8` (`nombre`),
  UNIQUE KEY `nombre_9` (`nombre`),
  UNIQUE KEY `nombre_10` (`nombre`),
  UNIQUE KEY `nombre_11` (`nombre`),
  UNIQUE KEY `nombre_12` (`nombre`),
  UNIQUE KEY `nombre_13` (`nombre`),
  UNIQUE KEY `nombre_14` (`nombre`),
  UNIQUE KEY `nombre_15` (`nombre`),
  UNIQUE KEY `nombre_16` (`nombre`),
  UNIQUE KEY `nombre_17` (`nombre`),
  UNIQUE KEY `nombre_18` (`nombre`),
  UNIQUE KEY `nombre_19` (`nombre`),
  UNIQUE KEY `nombre_20` (`nombre`),
  UNIQUE KEY `nombre_21` (`nombre`),
  UNIQUE KEY `nombre_22` (`nombre`),
  UNIQUE KEY `nombre_23` (`nombre`),
  UNIQUE KEY `nombre_24` (`nombre`),
  UNIQUE KEY `nombre_25` (`nombre`),
  UNIQUE KEY `nombre_26` (`nombre`),
  UNIQUE KEY `nombre_27` (`nombre`),
  UNIQUE KEY `nombre_28` (`nombre`),
  UNIQUE KEY `nombre_29` (`nombre`),
  UNIQUE KEY `nombre_30` (`nombre`),
  UNIQUE KEY `nombre_31` (`nombre`),
  UNIQUE KEY `nombre_32` (`nombre`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategorias`
--

LOCK TABLES `subcategorias` WRITE;
/*!40000 ALTER TABLE `subcategorias` DISABLE KEYS */;
INSERT INTO `subcategorias` VALUES (1,1,'Sondika'),(2,1,'Txorierri'),(3,1,'Izarza');
/*!40000 ALTER TABLE `subcategorias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06 10:41:53
