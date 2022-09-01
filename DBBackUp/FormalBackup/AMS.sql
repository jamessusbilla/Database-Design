-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: AMS
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activityID` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activityDescription` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`activityID`),
  KEY `index_activity` (`activityID`,`activityDescription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES ('A1','Exercise'),('A2','Shopping'),('A3','Chess'),('A4','Teaching Facebook');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitylog`
--

DROP TABLE IF EXISTS `activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activitylog` (
  `logID` int NOT NULL AUTO_INCREMENT,
  `activityID` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `patientID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `companionID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`logID`),
  KEY `activityID` (`activityID`),
  KEY `patientID` (`patientID`),
  KEY `companionID` (`companionID`),
  CONSTRAINT `activitylog_ibfk_1` FOREIGN KEY (`activityID`) REFERENCES `activity` (`activityID`),
  CONSTRAINT `activitylog_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `activitylog_ibfk_3` FOREIGN KEY (`companionID`) REFERENCES `companion` (`companionID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitylog`
--

LOCK TABLES `activitylog` WRITE;
/*!40000 ALTER TABLE `activitylog` DISABLE KEYS */;
INSERT INTO `activitylog` VALUES (1,'A1','P102','100001','2020-09-10','08:30:00','09:30:00'),(2,'A2','P102','100001','2020-09-10','09:30:00','10:30:00'),(3,'A3','P102','100002','2020-09-10','10:30:00','11:30:00');
/*!40000 ALTER TABLE `activitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carelog`
--

DROP TABLE IF EXISTS `carelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carelog` (
  `cLogID` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `patientID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `carerID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  PRIMARY KEY (`cLogID`),
  KEY `patientID` (`patientID`),
  KEY `carerID` (`carerID`),
  CONSTRAINT `carelog_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `carelog_ibfk_2` FOREIGN KEY (`carerID`) REFERENCES `carer` (`carerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carelog`
--

LOCK TABLES `carelog` WRITE;
/*!40000 ALTER TABLE `carelog` DISABLE KEYS */;
INSERT INTO `carelog` VALUES ('L1000','P101','C1000','2020-08-10','09:00:00','09:40:00'),('L1001','P101','C1000','2020-09-10','09:00:00','09:40:00');
/*!40000 ALTER TABLE `carelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carer`
--

DROP TABLE IF EXISTS `carer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carer` (
  `carerID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `cFirstName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cSurname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cContact` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  `cAddress` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cSuburb` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `cCity` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`carerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carer`
--

LOCK TABLES `carer` WRITE;
/*!40000 ALTER TABLE `carer` DISABLE KEYS */;
INSERT INTO `carer` VALUES ('C1000','Mitch','Glenwood','02145678234','1/100 St John Street','Maximillian','Christchurch','1989-05-12');
/*!40000 ALTER TABLE `carer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkup`
--

DROP TABLE IF EXISTS `checkup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkup` (
  `checkUpID` int NOT NULL AUTO_INCREMENT,
  `patientID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `doctorID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `conditionID` varchar(3) COLLATE utf8mb4_bin DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`checkUpID`),
  KEY `patientID` (`patientID`),
  KEY `doctorID` (`doctorID`),
  KEY `conditionID` (`conditionID`),
  KEY `index_checkups` (`checkUpID`,`conditionID`,`patientID`),
  CONSTRAINT `checkup_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `checkup_ibfk_2` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`),
  CONSTRAINT `checkup_ibfk_3` FOREIGN KEY (`conditionID`) REFERENCES `medicalrecord` (`conditionID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkup`
--

LOCK TABLES `checkup` WRITE;
/*!40000 ALTER TABLE `checkup` DISABLE KEYS */;
INSERT INTO `checkup` VALUES (1,'P102','D102','1','2020-06-01 01:28:31'),(2,'P102','D102','3','2020-06-01 02:28:31');
/*!40000 ALTER TABLE `checkup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companion`
--

DROP TABLE IF EXISTS `companion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companion` (
  `companionID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `firstName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `surname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `suburb` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`companionID`),
  KEY `index_companion` (`surname`,`firstName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companion`
--

LOCK TABLES `companion` WRITE;
/*!40000 ALTER TABLE `companion` DISABLE KEYS */;
INSERT INTO `companion` VALUES ('100001','June','Kathmandu','151 Riccarton Road','Riccarton','Christchurch','1990-08-07'),('100002','Edmund','Kathmandu','11 Riccarton Road','Riccarton','Christchurch','1991-08-07');
/*!40000 ALTER TABLE `companion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consent`
--

DROP TABLE IF EXISTS `consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consent` (
  `consentID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `consentTime` timestamp NULL DEFAULT NULL,
  `consentStatus` enum('stopped','withdrawn','given') COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `consentID` (`consentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consent`
--

LOCK TABLES `consent` WRITE;
/*!40000 ALTER TABLE `consent` DISABLE KEYS */;
INSERT INTO `consent` VALUES ('P102','2020-02-09 20:00:00','given'),('100001','2020-02-14 00:30:00','given'),('100002','2020-02-14 00:30:00','given'),('100001','2020-06-17 01:30:00','withdrawn');
/*!40000 ALTER TABLE `consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consentdocumentation`
--

DROP TABLE IF EXISTS `consentdocumentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consentdocumentation` (
  `consentID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `consentLocation` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `consentType` enum('written','online') COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `consentID` (`consentID`,`consentLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consentdocumentation`
--

LOCK TABLES `consentdocumentation` WRITE;
/*!40000 ALTER TABLE `consentdocumentation` DISABLE KEYS */;
INSERT INTO `consentdocumentation` VALUES ('P102','C:ACAMSProblem_StatementBCDE214 Enterprise Problem.docx','written'),('100001','C:ACAMSProblem_StatementBCDE214 Enterprise Problem.docx','written'),('100002','C:ACAMSProblem_StatementBCDE214 Enterprise Problem.docx','online');
/*!40000 ALTER TABLE `consentdocumentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `doctorID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `contactType` enum('work-hours','after-hours') COLLATE utf8mb4_bin DEFAULT NULL,
  `phoneNumber` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `doctorID` (`doctorID`,`phoneNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES ('D101','after-hours','01234567891'),('D101','work-hours','01234567892'),('D100','after-hours','01234567782'),('D100','work-hours','01234567678'),('D102','work-hours','01234567123');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `dFirstName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dSurname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `office` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `suburb` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `city` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`doctorID`),
  KEY `index_doctordetail` (`doctorID`,`dFirstName`,`dSurname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('D100','John','Doery','AG100','34 Robson Street','Hampshire','Christchurch','1967-03-04'),('D101','Jerry','Zamson','AG101','34 Rory Street','Campbell','Christchurch','1955-03-04'),('D102','Jenny','Doery','AG102','34 Alabame Street','Kent','Christchurch','1963-12-04');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalrecord`
--

DROP TABLE IF EXISTS `medicalrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalrecord` (
  `conditionID` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  `medicalCondition` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `servID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`conditionID`),
  KEY `servID` (`servID`),
  CONSTRAINT `medicalrecord_ibfk_1` FOREIGN KEY (`servID`) REFERENCES `medicalservice` (`servID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalrecord`
--

LOCK TABLES `medicalrecord` WRITE;
/*!40000 ALTER TABLE `medicalrecord` DISABLE KEYS */;
INSERT INTO `medicalrecord` VALUES ('1','Dental Problem','M01'),('2','Depression','M02'),('3','Heart Attack','M03');
/*!40000 ALTER TABLE `medicalrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalservice`
--

DROP TABLE IF EXISTS `medicalservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalservice` (
  `servID` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `servName` varchar(40) COLLATE utf8mb4_bin DEFAULT NULL,
  `servType` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `servAddress` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `servSuburb` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `servCity` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `servContact` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`servID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalservice`
--

LOCK TABLES `medicalservice` WRITE;
/*!40000 ALTER TABLE `medicalservice` DISABLE KEYS */;
INSERT INTO `medicalservice` VALUES ('M01','Mikes Dental Clinic','Dental','456 Rosewood Street','Parkson','Dunedin','01234567894'),('M02','Johns Psychiatric Clinic','Psychiatry','456 Rosebush Street','Appleby','Dunedin','01234957894'),('M03','St Johns Emergency Clinic','Hospital','45 Rosatom Street','Appleby','Dunedin','01234857894');
/*!40000 ALTER TABLE `medicalservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `pFirstName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pSurname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roomNumber` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P101','Naomi','Del fuego','G100','1955-08-15'),('P102','Noel','Fleming','G101','1955-08-15'),('P103','Mark','Jones','G102','1955-08-15');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relative`
--

DROP TABLE IF EXISTS `relative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relative` (
  `relativeID` varchar(6) COLLATE utf8mb4_bin NOT NULL,
  `rFirstName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rSurname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rAddress` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rSuburb` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `rCity` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `contact` varchar(12) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`relativeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relative`
--

LOCK TABLES `relative` WRITE;
/*!40000 ALTER TABLE `relative` DISABLE KEYS */;
INSERT INTO `relative` VALUES ('1','Kelly','Jones','342 Roosebelt Road','Seattle','Auckland','02134572891'),('2','James','Hope','31 Roosebelt Road','Seattle','Auckland','02134572871'),('3','Mark John','delos Santos','34 belt Road','Seattle','Auckland','02134132891');
/*!40000 ALTER TABLE `relative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `companionID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `skill` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `skill` (`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES ('100001','Driving'),('100001','Cooking'),('100002','Problem Solver');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vactivitylog`
--

DROP TABLE IF EXISTS `vactivitylog`;
/*!50001 DROP VIEW IF EXISTS `vactivitylog`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vactivitylog` AS SELECT 
 1 AS `logID`,
 1 AS `activityID`,
 1 AS `patientID`,
 1 AS `companionID`,
 1 AS `date`,
 1 AS `startTime`,
 1 AS `endTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vcarelog`
--

DROP TABLE IF EXISTS `vcarelog`;
/*!50001 DROP VIEW IF EXISTS `vcarelog`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vcarelog` AS SELECT 
 1 AS `cLogID`,
 1 AS `patientID`,
 1 AS `carerID`,
 1 AS `date`,
 1 AS `startTime`,
 1 AS `endTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vcarer`
--

DROP TABLE IF EXISTS `vcarer`;
/*!50001 DROP VIEW IF EXISTS `vcarer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vcarer` AS SELECT 
 1 AS `carerID`,
 1 AS `cFirstName`,
 1 AS `cSurname`,
 1 AS `cContact`,
 1 AS `cAddress`,
 1 AS `cSuburb`,
 1 AS `cCity`,
 1 AS `dob`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vcompanion`
--

DROP TABLE IF EXISTS `vcompanion`;
/*!50001 DROP VIEW IF EXISTS `vcompanion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vcompanion` AS SELECT 
 1 AS `companionID`,
 1 AS `firstName`,
 1 AS `surname`,
 1 AS `address`,
 1 AS `suburb`,
 1 AS `city`,
 1 AS `dob`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vcontact`
--

DROP TABLE IF EXISTS `vcontact`;
/*!50001 DROP VIEW IF EXISTS `vcontact`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vcontact` AS SELECT 
 1 AS `doctorID`,
 1 AS `contactType`,
 1 AS `phoneNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vdoctor`
--

DROP TABLE IF EXISTS `vdoctor`;
/*!50001 DROP VIEW IF EXISTS `vdoctor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vdoctor` AS SELECT 
 1 AS `doctorID`,
 1 AS `dFirstName`,
 1 AS `dSurname`,
 1 AS `office`,
 1 AS `address`,
 1 AS `suburb`,
 1 AS `city`,
 1 AS `dob`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visitation`
--

DROP TABLE IF EXISTS `visitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitation` (
  `visitationID` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  `patientID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `relativeID` varchar(6) COLLATE utf8mb4_bin DEFAULT NULL,
  `visitTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`visitationID`),
  KEY `patientID` (`patientID`),
  KEY `relativeID` (`relativeID`),
  CONSTRAINT `visitation_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `visitation_ibfk_2` FOREIGN KEY (`relativeID`) REFERENCES `relative` (`relativeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitation`
--

LOCK TABLES `visitation` WRITE;
/*!40000 ALTER TABLE `visitation` DISABLE KEYS */;
INSERT INTO `visitation` VALUES ('1','P101','1','2020-04-30 21:28:01'),('2','P103','2','2020-04-30 21:28:01'),('3','P102','3','2020-05-31 21:28:01');
/*!40000 ALTER TABLE `visitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vrelative`
--

DROP TABLE IF EXISTS `vrelative`;
/*!50001 DROP VIEW IF EXISTS `vrelative`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vrelative` AS SELECT 
 1 AS `relativeID`,
 1 AS `rFirstName`,
 1 AS `rSurname`,
 1 AS `rAddress`,
 1 AS `rSuburb`,
 1 AS `rCity`,
 1 AS `contact`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vvisitation`
--

DROP TABLE IF EXISTS `vvisitation`;
/*!50001 DROP VIEW IF EXISTS `vvisitation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vvisitation` AS SELECT 
 1 AS `visitationID`,
 1 AS `patientID`,
 1 AS `relativeID`,
 1 AS `visitTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vactivitylog`
--

/*!50001 DROP VIEW IF EXISTS `vactivitylog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vactivitylog` AS select `activitylog`.`logID` AS `logID`,`activitylog`.`activityID` AS `activityID`,`activitylog`.`patientID` AS `patientID`,`activitylog`.`companionID` AS `companionID`,`activitylog`.`date` AS `date`,`activitylog`.`startTime` AS `startTime`,`activitylog`.`endTime` AS `endTime` from `activitylog` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vcarelog`
--

/*!50001 DROP VIEW IF EXISTS `vcarelog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcarelog` AS select `carelog`.`cLogID` AS `cLogID`,`carelog`.`patientID` AS `patientID`,`carelog`.`carerID` AS `carerID`,`carelog`.`date` AS `date`,`carelog`.`startTime` AS `startTime`,`carelog`.`endTime` AS `endTime` from `carelog` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vcarer`
--

/*!50001 DROP VIEW IF EXISTS `vcarer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcarer` AS select `carer`.`carerID` AS `carerID`,`carer`.`cFirstName` AS `cFirstName`,`carer`.`cSurname` AS `cSurname`,`carer`.`cContact` AS `cContact`,`carer`.`cAddress` AS `cAddress`,`carer`.`cSuburb` AS `cSuburb`,`carer`.`cCity` AS `cCity`,`carer`.`dob` AS `dob` from `carer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vcompanion`
--

/*!50001 DROP VIEW IF EXISTS `vcompanion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcompanion` AS select `companion`.`companionID` AS `companionID`,`companion`.`firstName` AS `firstName`,`companion`.`surname` AS `surname`,`companion`.`address` AS `address`,`companion`.`suburb` AS `suburb`,`companion`.`city` AS `city`,`companion`.`dob` AS `dob` from `companion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vcontact`
--

/*!50001 DROP VIEW IF EXISTS `vcontact`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcontact` AS select `contact`.`doctorID` AS `doctorID`,`contact`.`contactType` AS `contactType`,`contact`.`phoneNumber` AS `phoneNumber` from `contact` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vdoctor`
--

/*!50001 DROP VIEW IF EXISTS `vdoctor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vdoctor` AS select `doctor`.`doctorID` AS `doctorID`,`doctor`.`dFirstName` AS `dFirstName`,`doctor`.`dSurname` AS `dSurname`,`doctor`.`office` AS `office`,`doctor`.`address` AS `address`,`doctor`.`suburb` AS `suburb`,`doctor`.`city` AS `city`,`doctor`.`dob` AS `dob` from `doctor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vrelative`
--

/*!50001 DROP VIEW IF EXISTS `vrelative`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vrelative` AS select `relative`.`relativeID` AS `relativeID`,`relative`.`rFirstName` AS `rFirstName`,`relative`.`rSurname` AS `rSurname`,`relative`.`rAddress` AS `rAddress`,`relative`.`rSuburb` AS `rSuburb`,`relative`.`rCity` AS `rCity`,`relative`.`contact` AS `contact` from `relative` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vvisitation`
--

/*!50001 DROP VIEW IF EXISTS `vvisitation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vvisitation` AS select `visitation`.`visitationID` AS `visitationID`,`visitation`.`patientID` AS `patientID`,`visitation`.`relativeID` AS `relativeID`,`visitation`.`visitTime` AS `visitTime` from `visitation` */;
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

-- Dump completed on 2020-08-28 22:10:42
