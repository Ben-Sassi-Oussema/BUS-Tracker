-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: gpstracker
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gpslocations`
--

DROP TABLE IF EXISTS `gpslocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gpslocations` (
  `GPSLocationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` decimal(10,7) NOT NULL DEFAULT '0.0000000',
  `longitude` decimal(10,7) NOT NULL DEFAULT '0.0000000',
  `phoneNumber` varchar(50) NOT NULL DEFAULT '',
  `userName` varchar(50) NOT NULL DEFAULT '',
  `sessionID` varchar(50) NOT NULL DEFAULT '',
  `speed` int(10) unsigned NOT NULL DEFAULT '0',
  `direction` int(10) unsigned NOT NULL DEFAULT '0',
  `distance` decimal(10,1) NOT NULL DEFAULT '0.0',
  `gpsTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locationMethod` varchar(50) NOT NULL DEFAULT '',
  `accuracy` int(10) unsigned NOT NULL DEFAULT '0',
  `extraInfo` varchar(255) NOT NULL DEFAULT '',
  `eventType` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`GPSLocationID`),
  KEY `sessionIDIndex` (`sessionID`),
  KEY `phoneNumberIndex` (`phoneNumber`),
  KEY `userNameIndex` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpslocations`
--

LOCK TABLES `gpslocations` WRITE;
/*!40000 ALTER TABLE `gpslocations` DISABLE KEYS */;
INSERT INTO `gpslocations` (`GPSLocationID`, `lastUpdate`, `latitude`, `longitude`, `phoneNumber`, `userName`, `sessionID`, `speed`, `direction`, `distance`, `gpsTime`, `locationMethod`, `accuracy`, `extraInfo`, `eventType`) VALUES
(1, '2017-04-25 23:30:05', '36.7500000', '10.2000000', 'A27', 'A27', '8BA21D90-3F90-407F-BAAE-800B04B1F5EC', 0, 0, '0.0', '2017-01-03 18:37:00', 'na', 137, 'na', 'gpsTracker'),
(2, '2017-04-25 23:00:00', '36.8100000', '10.7000000', '20C', '20C', '8BA21D90-3F90-407F-BAAE-800B04B1F5EF', 0, 0, '0.0', '2017-04-25 07:50:00', 'na', 137, 'na', 'gpsTracker'),
(4, '2017-04-26 17:37:00', '35.7200000', '10.6300000', 'B25', 'B25', '8BA21D90-3F90-407F-BAAE-800B04B1F5ED', 0, 0, '0.0', '2017-04-25 22:00:00', 'na', 137, 'na', 'gpsTracker'),
(5, '2017-04-26 00:26:00', '36.9647000', '9.6479000', 'B26', 'B26', '8BA21D90-3F90-407F-BAAE-800B04B1F5EA', 0, 0, '0.0', '2017-04-26 00:02:00', 'na', 137, 'na', 'gpsTracker'),
(6, '2017-04-26 17:37:00', '36.0100000', '10.4800000', 'B27', 'B27', '8BA21D90-3F90-407F-BAAE-800B04B1F5EB', 0, 0, '0.0', '2017-04-25 22:00:00', 'na', 137, 'na', 'gpsTracker'),
(7, '2017-04-26 17:37:00', '33.7800000', '10.8600000', 'A25', 'A25', '8BA21D90-3F90-407F-BAAE-800B04B1F5EG', 0, 0, '0.0', '2017-01-03 18:37:00', 'na', 137, 'na', 'gpsTracker');
/*!40000 ALTER TABLE `gpslocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'gpstracker'
--
/*!50003 DROP PROCEDURE IF EXISTS `prcDeleteRoute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prcDeleteRoute`(
_sessionID VARCHAR(50))
BEGIN
  DELETE FROM gpslocations
  WHERE sessionID = _sessionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prcGetAllRoutesForMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prcGetAllRoutesForMap`()
BEGIN
SELECT sessionId, gpsTime, CONCAT('{ "latitude":"', CAST(latitude AS CHAR),'", "longitude":"', CAST(longitude AS CHAR), '", "speed":"', CAST(speed AS CHAR), '", "direction":"', CAST(direction AS CHAR), '", "distance":"', CAST(distance AS CHAR), '", "locationMethod":"', locationMethod, '", "gpsTime":"', DATE_FORMAT(gpsTime, '%b %e %Y %h:%i%p'), '", "userName":"', userName, '", "phoneNumber":"', phoneNumber, '", "sessionID":"', CAST(sessionID AS CHAR), '", "accuracy":"', CAST(accuracy AS CHAR), '", "extraInfo":"', extraInfo, '" }') json
FROM (SELECT MAX(GPSLocationID) ID
      FROM gpslocations
      WHERE sessionID != '0' && CHAR_LENGTH(sessionID) != 0 && gpstime != '0000-00-00 00:00:00'
      GROUP BY sessionID) AS MaxID
JOIN gpslocations ON gpslocations.GPSLocationID = MaxID.ID
ORDER BY gpsTime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prcGetRouteForMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prcGetRouteForMap`(
_sessionID VARCHAR(50))
BEGIN
  SELECT CONCAT('{ "latitude":"', CAST(latitude AS CHAR),'", "longitude":"', CAST(longitude AS CHAR), '", "speed":"', CAST(speed AS CHAR), '", "direction":"', CAST(direction AS CHAR), '", "distance":"', CAST(distance AS CHAR), '", "locationMethod":"', locationMethod, '", "gpsTime":"', DATE_FORMAT(gpsTime, '%b %e %Y %h:%i%p'), '", "userName":"', userName, '", "phoneNumber":"', phoneNumber, '", "sessionID":"', CAST(sessionID AS CHAR), '", "accuracy":"', CAST(accuracy AS CHAR), '", "extraInfo":"', extraInfo, '" }') json
  FROM gpslocations
  WHERE sessionID = _sessionID
  ORDER BY lastupdate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prcGetRoutes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prcGetRoutes`()
BEGIN
  CREATE TEMPORARY TABLE tempRoutes (
    sessionID VARCHAR(50),
    userName VARCHAR(50),
    startTime DATETIME,
    endTime DATETIME)
  ENGINE = MEMORY;

  INSERT INTO tempRoutes (sessionID, userName)
  SELECT DISTINCT sessionID, userName
  FROM gpslocations;

  UPDATE tempRoutes tr
  SET startTime = (SELECT MIN(gpsTime) FROM gpslocations gl
  WHERE gl.sessionID = tr.sessionID
  AND gl.userName = tr.userName);

  UPDATE tempRoutes tr
  SET endTime = (SELECT MAX(gpsTime) FROM gpslocations gl
  WHERE gl.sessionID = tr.sessionID
  AND gl.userName = tr.userName);

  SELECT

  CONCAT('{ "sessionID": "', CAST(sessionID AS CHAR),  '", "userName": "', userName, '", "times": "(', DATE_FORMAT(startTime, '%b %e %Y %h:%i%p'), ' - ', DATE_FORMAT(endTime, '%b %e %Y %h:%i%p'), ')" }') json
  FROM tempRoutes
  ORDER BY startTime DESC;

  DROP TABLE tempRoutes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prcSaveGPSLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `prcSaveGPSLocation`(
_latitude DECIMAL(10,7),
_longitude DECIMAL(10,7),
_speed INT(10),
_direction INT(10),
_distance DECIMAL(10,1),
_date TIMESTAMP,
_locationMethod VARCHAR(50),
_userName VARCHAR(50),
_phoneNumber VARCHAR(50),
_sessionID VARCHAR(50),
_accuracy INT(10),
_extraInfo VARCHAR(255),
_eventType VARCHAR(50)
)
BEGIN
   INSERT INTO gpslocations (latitude, longitude, speed, direction, distance, gpsTime, locationMethod, userName, phoneNumber,  sessionID, accuracy, extraInfo, eventType)
   VALUES (_latitude, _longitude, _speed, _direction, _distance, _date, _locationMethod, _userName, _phoneNumber, _sessionID, _accuracy, _extraInfo, _eventType);
   SELECT NOW();
END ;;
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

-- Dump completed on 2014-09-14 18:38:51
