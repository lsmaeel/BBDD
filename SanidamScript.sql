-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Sanidam
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

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
-- Current Database: `Sanidam`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Sanidam` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;

USE `Sanidam`;

--
-- Table structure for table `CITA`
--

DROP TABLE IF EXISTS `CITA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CITA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_profesional` int(11) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_profesional` (`id_profesional`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `CITA_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `CLIENTE` (`id`),
  CONSTRAINT `CITA_ibfk_2` FOREIGN KEY (`id_profesional`) REFERENCES `PROFESIONAL` (`id`),
  CONSTRAINT `CITA_ibfk_3` FOREIGN KEY (`id_sala`) REFERENCES `SALA` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CITA`
--

LOCK TABLES `CITA` WRITE;
/*!40000 ALTER TABLE `CITA` DISABLE KEYS */;
INSERT INTO `CITA` VALUES
(1,'2025-06-01 10:30:00',1,3,1),
(2,'2025-06-02 14:00:00',2,3,2);
/*!40000 ALTER TABLE `CITA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(15) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `localidad` varchar(50) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `tipo_seguro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `tipo_seguro` (`tipo_seguro`),
  CONSTRAINT `CLIENTE_ibfk_1` FOREIGN KEY (`tipo_seguro`) REFERENCES `SEGURO` (`cº_seguro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
INSERT INTO `CLIENTE` VALUES
(1,'12345678A','Juan','Pérez López','600123456','juan.perez@mail.com','Ciudad Real','Tomelloso','2024-01-15',1),
(2,'87654321B','María','García Ruiz','600654321','maria.garcia@mail.com','Ciudad Real','Alcázar de San Juan','2023-11-20',2),
(3,'23456789C','Luis','Martínez Gómez','600987654','luis.martinez@mail.com','Ciudad Real','Ciudad Real','2024-03-10',3);
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLINICA`
--

DROP TABLE IF EXISTS `CLINICA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLINICA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `localizacion` varchar(100) DEFAULT NULL,
  `numero_trabajadores` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLINICA`
--

LOCK TABLES `CLINICA` WRITE;
/*!40000 ALTER TABLE `CLINICA` DISABLE KEYS */;
INSERT INTO `CLINICA` VALUES
(1,'Clínica Tomelloso','Tomelloso',40),
(2,'Clínica Alcázar de San Juan','Alcázar de San Juan',25),
(3,'Clínica Ciudad Real','Ciudad Real',30);
/*!40000 ALTER TABLE `CLINICA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL`
--

DROP TABLE IF EXISTS `PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERSONAL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(15) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `puesto_trabajo` enum('ADMINISTRATIVO','MANTENIMIENTO','PROFESIONAL') DEFAULT NULL,
  `id_clinica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `id_clinica` (`id_clinica`),
  CONSTRAINT `PERSONAL_ibfk_1` FOREIGN KEY (`id_clinica`) REFERENCES `CLINICA` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL`
--

LOCK TABLES `PERSONAL` WRITE;
/*!40000 ALTER TABLE `PERSONAL` DISABLE KEYS */;
INSERT INTO `PERSONAL` VALUES
(1,'11111111X','Ana','Fernández','600112233','ana.fernandez@clinica.com',1800.00,'ADMINISTRATIVO',1),
(2,'22222222Y','Carlos','Sánchez','600223344','carlos.sanchez@clinica.com',2000.00,'MANTENIMIENTO',2),
(3,'33333333Z','Lucía','Rodríguez','600334455','lucia.rodriguez@clinica.com',2500.00,'PROFESIONAL',3);
/*!40000 ALTER TABLE `PERSONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFESIONAL`
--

DROP TABLE IF EXISTS `PROFESIONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFESIONAL` (
  `id` int(11) NOT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `especialidad` enum('DOCTOR','CIRUJANO','ENFERMERO') DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `PROFESIONAL_ibfk_1` FOREIGN KEY (`id`) REFERENCES `PERSONAL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFESIONAL`
--

LOCK TABLES `PROFESIONAL` WRITE;
/*!40000 ALTER TABLE `PROFESIONAL` DISABLE KEYS */;
INSERT INTO `PROFESIONAL` VALUES
(3,'33333333Z','DOCTOR','Ciudad Real','600334455','Lucía','Rodríguez',2500.00,'lucia.rodriguez@clinica.com');
/*!40000 ALTER TABLE `PROFESIONAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALA`
--

DROP TABLE IF EXISTS `SALA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('CONSULTA','QUIROFANO','HABITACION') DEFAULT NULL,
  `id_clinica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_clinica` (`id_clinica`),
  CONSTRAINT `SALA_ibfk_1` FOREIGN KEY (`id_clinica`) REFERENCES `CLINICA` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALA`
--

LOCK TABLES `SALA` WRITE;
/*!40000 ALTER TABLE `SALA` DISABLE KEYS */;
INSERT INTO `SALA` VALUES
(1,'CONSULTA',1),
(2,'QUIROFANO',1),
(3,'HABITACION',2);
/*!40000 ALTER TABLE `SALA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEGURO`
--

DROP TABLE IF EXISTS `SEGURO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEGURO` (
  `cº_seguro` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('TODO_RIESGO','MEDIO','BASICO') DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `caracteristicas` text DEFAULT NULL,
  PRIMARY KEY (`cº_seguro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEGURO`
--

LOCK TABLES `SEGURO` WRITE;
/*!40000 ALTER TABLE `SEGURO` DISABLE KEYS */;
INSERT INTO `SEGURO` VALUES
(1,'TODO_RIESGO',1200.00,'Cobertura completa, incluye daños a terceros y robo'),
(2,'MEDIO',800.00,'Cobertura parcial, sin robo ni daños voluntarios'),
(3,'BASICO',400.00,'Cobertura mínima, solo daños a terceros');
/*!40000 ALTER TABLE `SEGURO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICULO`
--

DROP TABLE IF EXISTS `VEHICULO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VEHICULO` (
  `matricula` varchar(15) NOT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `tipo` enum('COCHE','AMBULANCIA') DEFAULT NULL,
  `id_clinica` int(11) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  KEY `id_clinica` (`id_clinica`),
  CONSTRAINT `VEHICULO_ibfk_1` FOREIGN KEY (`id_clinica`) REFERENCES `CLINICA` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICULO`
--

LOCK TABLES `VEHICULO` WRITE;
/*!40000 ALTER TABLE `VEHICULO` DISABLE KEYS */;
INSERT INTO `VEHICULO` VALUES
('1234ABC','Model S','Tesla','2021-05-10','COCHE',1),
('5678DEF','Sprinter','Mercedes','2019-11-15','AMBULANCIA',2);
/*!40000 ALTER TABLE `VEHICULO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 19:35:49
