CREATE DATABASE  IF NOT EXISTS `db_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_test`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_test
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `current_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_stock` int NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT 'activo',
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'SKU-001','Laptop Gamer','Laptop de alto rendimiento para videojuegos y diseño',1250.00,15,'activo','2026-09-22 16:46:34','2026-09-22 16:46:34'),(2,'SKU-002','Mouse Inalámbrico','Mouse ergonómico con conexión USB y Bluetooth',25.50,50,'activo','2026-09-22 16:46:34','2026-09-22 16:46:34'),(3,'P004','Teclado mecánico','Teclado mecánico con iluminación LED',850.00,12,'activo','2026-09-22 16:55:56','2026-09-22 16:55:56'),(4,'P005','Monitor 24 pulgadas','Monitor Full HD de 24 pulgadas',3200.00,8,'activo','2026-09-22 16:57:43','2026-09-22 16:57:43'),(5,'P006','Memoria USB 64GB','Memoria USB 3.0 de 64 GB',180.00,30,'activo','2026-09-22 16:58:06','2026-09-22 16:58:06'),(6,'P007','Webcam HD','Cámara web HD para computadora',450.00,18,'activo','2026-09-22 16:59:25','2026-09-22 16:59:25'),(7,'P008','Disco SSD 1TB','Unidad de almacenamiento SSD de 1 TB',1450.00,10,'activo','2026-09-22 16:59:45','2026-09-22 16:59:45'),(8,'AMZ003','Teclado Inalambrico','Teclado inalambrico para computadora con conexion USB.',449.00,10,'1','2026-09-22 17:01:03','2026-09-22 17:01:03'),(9,'AMZ004','Bocina Bluetooth','Bocina portatil Bluetooth con bateria recargable.',799.00,8,'1','2026-09-22 17:01:03','2026-09-22 17:01:03'),(10,'AMZ005','Monitor LED 24 Pulgadas','Monitor LED de 24 pulgadas para computadora con entrada HDMI.',2499.00,7,'1','2026-09-22 17:02:58','2026-09-22 17:02:58'),(11,'AMZ006','Camara Web HD','Camara web HD para videollamadas y clases en linea.',699.00,12,'1','2026-09-22 17:02:58','2026-09-22 17:02:58'),(12,'AMZ007','Memoria USB 64GB','Memoria USB de 64GB para almacenar y transferir archivos.',199.00,25,'1','2026-09-22 17:02:58','2026-09-22 17:02:58');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_products_after_insert` AFTER INSERT ON `productos` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        operation,
        db_user,
        operation_date,
        description,
        operation_status
    )
    VALUES (
        'tb_products',
        'Create',
        USER(),
        CURRENT_TIMESTAMP,
        CONCAT(
            'Producto creado. ID=', NEW.ID,
            ', SKU=', NEW.SKU,
            ', nombre=', NEW.name
        ),
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_productos_after_insert` AFTER INSERT ON `productos` FOR EACH ROW BEGIN 
    INSERT INTO tb_logs ( 
        table_name, 
        operation, 
        db_user, 
        operation_date, 
        description, 
        operation_status 
    ) 
    VALUES ( 
        'productos', 
        'Create', 
        USER(), 
        CURRENT_TIMESTAMP, 
        CONCAT(
            'Producto creado. ID=', NEW.id, 
            ', SKU=', NEW.sku, 
            ', nombre=', NEW.name
        ), 
        b'1' 
    ); 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_products_after_update` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        operation,
        db_user,
        operation_date,
        description,
        operation_status
    )
    VALUES (
        'tb_products',
        'Update',
        USER(),
        CURRENT_TIMESTAMP,
        CONCAT(
            'Producto actualizado. ID=', NEW.ID,
            ', SKU=', NEW.SKU,
            ', nombre=', NEW.name
        ),
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_products_after_delete` AFTER DELETE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        operation,
        db_user,
        operation_date,
        description,
        operation_status
    )
    VALUES (
        'tb_products',
        'Delete',
        USER(),
        CURRENT_TIMESTAMP,
        CONCAT(
            'Producto eliminado. ID=', OLD.ID,
            ', SKU=', OLD.SKU,
            ', nombre=', OLD.name
        ),
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_logs`
--

DROP TABLE IF EXISTS `tb_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_logs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `operation` enum('Create','Read','Update','Delete') NOT NULL,
  `db_user` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `operation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operation_status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logs`
--

LOCK TABLES `tb_logs` WRITE;
/*!40000 ALTER TABLE `tb_logs` DISABLE KEYS */;
INSERT INTO `tb_logs` VALUES (1,'tb_users','Create','root@localhost','Usuario creado, ID: 1, email: juan.perez@email.com, nickname: juanito99','2026-09-09 18:29:28',_binary ''),(2,'tb_users','Create','root@localhost','Usuario creado, ID: 2, email: maria.lopez@email.com, nickname: marial','2026-09-09 18:29:28',_binary ''),(3,'tb_users','Create','root@localhost','Usuario creado, ID: 3, email: carlos.mendoza@email.com, nickname: charly_dev','2026-09-09 18:29:28',_binary ''),(4,'tb_users','Create','erik.marti@PC-15','Usuario creado, ID: 4, email: ana.martinez@example.com, nickname: anamart','2026-09-09 18:52:16',_binary ''),(5,'tb_users','Create','erik.marti@PC-15','Usuario creado, ID: 5, email: diego.torres@example.com, nickname: dieguito','2026-09-09 18:52:16',_binary ''),(6,'tb_users','Create','erik.marti@PC-15','Usuario creado, ID: 6, email: lucia.fernandez@example.com, nickname: lu_fer','2026-09-09 18:52:16',_binary ''),(7,'tb_users','Delete','erik.marti@PC-15','Usuario eliminado. ID=5, email=diego.torres@example.com, nickname=dieguito, ultimo usuario que modifico=admin','2026-09-09 19:27:16',_binary ''),(8,'tb_users','Update','erik.marti@PC-15','Usuario actualizado, ID: 4, email: ana.martinez@example.com, nickname: ana_admin','2026-09-09 19:27:21',_binary ''),(9,'tb_users','Create','hector.morales@DESKTOP-CP9O4BF','Usuario creado, ID: 7, email: Hector120soto@gmail.com, nickname: hector','2026-09-15 11:30:55',_binary ''),(10,'tb_products','Create','root@localhost','Producto creado. ID=1, SKU=SKU-001, nombre=Laptop Gamer','2026-09-22 10:46:34',_binary ''),(11,'tb_products','Create','root@localhost','Producto creado. ID=2, SKU=SKU-002, nombre=Mouse Inalámbrico','2026-09-22 10:46:34',_binary ''),(12,'tb_products','Create','uriel.leonardo@PC-12','Producto creado. ID=3, SKU=P004, nombre=Teclado mecánico','2026-09-22 10:55:56',_binary ''),(13,'tb_products','Create','uriel.leonardo@PC-12','Producto creado. ID=4, SKU=P005, nombre=Monitor 24 pulgadas','2026-09-22 10:57:43',_binary ''),(14,'tb_products','Create','uriel.leonardo@PC-12','Producto creado. ID=5, SKU=P006, nombre=Memoria USB 64GB','2026-09-22 10:58:06',_binary ''),(15,'tb_products','Create','uriel.leonardo@PC-12','Producto creado. ID=6, SKU=P007, nombre=Webcam HD','2026-09-22 10:59:25',_binary ''),(16,'tb_products','Create','uriel.leonardo@PC-12','Producto creado. ID=7, SKU=P008, nombre=Disco SSD 1TB','2026-09-22 10:59:45',_binary ''),(17,'tb_products','Create','erick.uriel@PC-15','Producto creado. ID=8, SKU=AMZ003, nombre=Teclado Inalambrico','2026-09-22 11:01:03',_binary ''),(18,'tb_products','Create','erick.uriel@PC-15','Producto creado. ID=9, SKU=AMZ004, nombre=Bocina Bluetooth','2026-09-22 11:01:03',_binary ''),(19,'tb_products','Create','erick.uriel@PC-15','Producto creado. ID=10, SKU=AMZ005, nombre=Monitor LED 24 Pulgadas','2026-09-22 11:02:58',_binary ''),(20,'tb_products','Create','erick.uriel@PC-15','Producto creado. ID=11, SKU=AMZ006, nombre=Camara Web HD','2026-09-22 11:02:58',_binary ''),(21,'tb_products','Create','erick.uriel@PC-15','Producto creado. ID=12, SKU=AMZ007, nombre=Memoria USB 64GB','2026-09-22 11:02:58',_binary ''),(22,'tb_users','Create','lalo.mayate@PC-13','Usuario creado, ID: 8, email: luis@empresa.com, nickname: luis','2026-09-22 11:43:41',_binary ''),(23,'tb_users','Create','lalo.mayate@PC-13','Usuario creado, ID: 9, email: nazul@empresa.com, nickname: nazul','2026-09-22 11:43:41',_binary ''),(24,'tb_users','Create','lalo.mayate@PC-13','Usuario creado, ID: 10, email: blanca@empresa.com, nickname: blanca','2026-09-22 11:43:41',_binary '');
/*!40000 ALTER TABLE `tb_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `uq_email` (`email`),
  UNIQUE KEY `uq_nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (1,'juan.perez@email.com','juanito99','Password123!','2026-09-09 18:29:28','2026-09-15 11:17:03',NULL),(2,'maria.lopez@email.com','marial','MariaSecure789!','2026-09-09 18:29:28','2026-09-15 11:17:03',NULL),(3,'carlos.mendoza@email.com','charly_dev','CarlosDev2026$','2026-09-09 18:29:28','2026-09-15 11:17:03',NULL),(4,'ana.martinez@example.com','ana_admin','AnaNewPassword2026!','2026-09-09 18:52:16','2026-09-15 11:17:03',NULL),(6,'lucia.fernandez@example.com','lu_fer','L4#secret','2026-09-09 18:52:16','2026-09-15 11:17:03',NULL),(7,'Hector120soto@gmail.com','hector','cdf54bc65a611abb9e6703545109bfbe','2026-09-15 11:30:55','2026-09-15 11:30:55',NULL),(8,'luis@empresa.com','luis','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','2026-09-22 11:43:41','2026-09-22 11:43:41',NULL),(9,'nazul@empresa.com','nazul','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','2026-09-22 11:43:41','2026-09-22 11:43:41',NULL),(10,'blanca@empresa.com','blanca','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','2026-09-22 11:43:41','2026-09-22 11:43:41',NULL);
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_users_after_insert` AFTER INSERT ON `tb_users` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        operation,
        db_user,
        description,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_users',
        'Create',
        USER(),
        CONCAT('Usuario creado, ID: ', NEW.ID, ', email: ', NEW.email, ', nickname: ', NEW.nickname),
        CURRENT_TIMESTAMP,
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-22 11:49:46
