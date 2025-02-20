--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements. See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership. The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License. You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied. See the License for the
-- specific language governing permissions and limitations
-- under the License.
--

-- MySQL dump 10.13  Distrib 5.1.60, for Win32 (ia32)
--
-- Host: localhost    Database: fineract_tenants
-- ------------------------------------------------------
-- Server version	5.1.60-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES UTF8MB4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `schema_version`
--

DROP TABLE IF EXISTS `schema_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = UTF8MB4 */;
CREATE TABLE `schema_version` (
  `version_rank` INT NOT NULL,
  `installed_rank` INT NOT NULL,
  `version` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` INT DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` INT NOT NULL,
  `success` tinyint NOT NULL,
  PRIMARY KEY (`version`),
  KEY `schema_version_vr_idx` (`version_rank`),
  KEY `schema_version_ir_idx` (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_version`
--

LOCK TABLES `schema_version` WRITE;
/*!40000 ALTER TABLE `schema_version` DISABLE KEYS */;
INSERT INTO `schema_version` (`version_rank`, `installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
  (1, 1, '1', 'mifos-platform-shared-tenants', 'SQL', 'V1__mifos-platform-shared-tenants.sql', -486745552, 'root', '2014-10-12 22:13:50', 896, 1),
  (2, 2, '2', 'externalize-connection-properties', 'SQL', 'V2__externalize-connection-properties.sql', 210473669, 'root', '2014-10-12 22:13:51', 661, 1);/*!40000 ALTER TABLE `schema_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = UTF8MB4 */;
CREATE TABLE `tenants` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `schema_name` varchar(100) NOT NULL,
  `timezone_id` varchar(100) NOT NULL,
  `country_id` INT DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `lastmodified_date` datetime DEFAULT NULL,
  `schema_server` varchar(100) NOT NULL DEFAULT 'localhost',
  `schema_server_port` varchar(10) NOT NULL DEFAULT '3306',
  `schema_username` varchar(100) NOT NULL DEFAULT 'root',
  `schema_password` varchar(100) NOT NULL DEFAULT 'mysql',
  `auto_update` tinyint NOT NULL DEFAULT '1',
  `pool_initial_size` INT DEFAULT 5,
  `pool_validation_interval` INT DEFAULT 30000,
  `pool_remove_abandoned` tinyint DEFAULT 1,
  `pool_remove_abandoned_timeout` INT DEFAULT 60,
  `pool_log_abandoned` tinyint DEFAULT 1,
  `pool_abandon_when_percentage_full` INT DEFAULT 50,
  `pool_test_on_borrow` tinyint DEFAULT 1,
  `pool_max_active` INT DEFAULT 40,
  `pool_min_idle` INT DEFAULT 20,
  `pool_max_idle` INT DEFAULT 10,
  `pool_suspect_timeout` INT DEFAULT 60,
  `pool_time_between_eviction_runs_millis` INT DEFAULT 34000,
  `pool_min_evictable_idle_time_millis` INT DEFAULT 60000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=UTF8MB4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` VALUES
(1,'default','default','fineract_default','Asia/Kolkata',NULL,NULL,NULL,NULL,'localhost','3306','root','mysql',1,5,30000,1,60,1,50,1,40,20,10,60,34000,60000);
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = UTF8MB4 */;
CREATE TABLE `timezones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL,
  `timezonename` varchar(100) NOT NULL,
  `comments` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=UTF8MB4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,'AD','Europe/Andorra',NULL),(2,'AE','Asia/Dubai',''),(3,'AF','Asia/Kabul',''),(4,'AG','America/Antigua',''),(5,'AI','America/Anguilla',''),(6,'AL','Europe/Tirane',''),(7,'AM','Asia/Yerevan',''),(8,'AO','Africa/Luanda',''),(9,'AQ','Antarctica/McMurdo','McMurdo Station, Ross Island'),(10,'AQ','Antarctica/South_Pole','Amundsen-Scott Station, South Pole'),(11,'AQ','Antarctica/Rothera','Rothera Station, Adelaide Island'),(12,'AQ','Antarctica/Palmer','Palmer Station, Anvers Island'),(13,'AQ','Antarctica/Mawson','Mawson Station, Holme Bay'),(14,'AQ','Antarctica/Davis','Davis Station, Vestfold Hills'),(15,'AQ','Antarctica/Casey','Casey Station, Bailey Peninsula'),(16,'AQ','Antarctica/Vostok','Vostok Station, Lake Vostok'),(17,'AQ','Antarctica/DumontDUrville','Dumont-dUrville Station, Terre Adelie'),(18,'AQ','Antarctica/Syowa','Syowa Station, E Ongul I'),(19,'AQ','Antarctica/Macquarie','Macquarie Island Station, Macquarie Island'),(20,'AR','America/Argentina/Buenos_Aires','Buenos Aires (BA, CF)'),(21,'AR','America/Argentina/Cordoba','most locations (CB, CC, CN, ER, FM, MN, SE, SF)'),(22,'AR','America/Argentina/Salta','(SA, LP, NQ, RN)'),(23,'AR','America/Argentina/Jujuy','Jujuy (JY)'),(24,'AR','America/Argentina/Tucuman','Tucuman (TM)'),(25,'AR','America/Argentina/Catamarca','Catamarca (CT), Chubut (CH)'),(26,'AR','America/Argentina/La_Rioja','La Rioja (LR)'),(27,'AR','America/Argentina/San_Juan','San Juan (SJ)'),(28,'AR','America/Argentina/Mendoza','Mendoza (MZ)'),(29,'AR','America/Argentina/San_Luis','San Luis (SL)'),(30,'AR','America/Argentina/Rio_Gallegos','Santa Cruz (SC)'),(31,'AR','America/Argentina/Ushuaia','Tierra del Fuego (TF)'),(32,'AS','Pacific/Pago_Pago',''),(33,'AT','Europe/Vienna',''),(34,'AU','Australia/Lord_Howe','Lord Howe Island'),(35,'AU','Australia/Hobart','Tasmania - most locations'),(36,'AU','Australia/Currie','Tasmania - King Island'),(37,'AU','Australia/Melbourne','Victoria'),(38,'AU','Australia/Sydney','New South Wales - most locations'),(39,'AU','Australia/Broken_Hill','New South Wales - Yancowinna'),(40,'AU','Australia/Brisbane','Queensland - most locations'),(41,'AU','Australia/Lindeman','Queensland - Holiday Islands'),(42,'AU','Australia/Adelaide','South Australia'),(43,'AU','Australia/Darwin','Northern Territory'),(44,'AU','Australia/Perth','Western Australia - most locations'),(45,'AU','Australia/Eucla','Western Australia - Eucla area'),(46,'AW','America/Aruba',''),(47,'AX','Europe/Mariehamn',''),(48,'AZ','Asia/Baku',''),(49,'BA','Europe/Sarajevo',''),(50,'BB','America/Barbados',''),(51,'BD','Asia/Dhaka',''),(52,'BE','Europe/Brussels',''),(53,'BF','Africa/Ouagadougou',''),(54,'BG','Europe/Sofia',''),(55,'BH','Asia/Bahrain',''),(56,'BI','Africa/Bujumbura',''),(57,'BJ','Africa/Porto-Novo',''),(58,'BL','America/St_Barthelemy',''),(59,'BM','Atlantic/Bermuda',''),(60,'BN','Asia/Brunei',''),(61,'BO','America/La_Paz',''),(62,'BQ','America/Kralendijk',''),(63,'BR','America/Noronha','Atlantic islands'),(64,'BR','America/Belem','Amapa, E Para'),(65,'BR','America/Fortaleza','NE Brazil (MA, PI, CE, RN, PB)'),(66,'BR','America/Recife','Pernambuco'),(67,'BR','America/Araguaina','Tocantins'),(68,'BR','America/Maceio','Alagoas, Sergipe'),(69,'BR','America/Bahia','Bahia'),(70,'BR','America/Sao_Paulo','S & SE Brazil (GO, DF, MG, ES, RJ, SP, PR, SC, RS)'),(71,'BR','America/Campo_Grande','Mato Grosso do Sul'),(72,'BR','America/Cuiaba','Mato Grosso'),(73,'BR','America/Santarem','W Para'),(74,'BR','America/Porto_Velho','Rondonia'),(75,'BR','America/Boa_Vista','Roraima'),(76,'BR','America/Manaus','E Amazonas'),(77,'BR','America/Eirunepe','W Amazonas'),(78,'BR','America/Rio_Branco','Acre'),(79,'BS','America/Nassau',''),(80,'BT','Asia/Thimphu',''),(81,'BW','Africa/Gaborone',''),(82,'BY','Europe/Minsk',''),(83,'BZ','America/Belize',''),(84,'CA','America/St_Johns','Newfoundland Time, including SE Labrador'),(85,'CA','America/Halifax','Atlantic Time - Nova Scotia (most places), PEI'),(86,'CA','America/Glace_Bay','Atlantic Time - Nova Scotia - places that did not observe DST 1966-1971'),(87,'CA','America/Moncton','Atlantic Time - New Brunswick'),(88,'CA','America/Goose_Bay','Atlantic Time - Labrador - most locations'),(89,'CA','America/Blanc-Sablon','Atlantic Standard Time - Quebec - Lower North Shore'),(90,'CA','America/Montreal','Eastern Time - Quebec - most locations'),(91,'CA','America/Toronto','Eastern Time - Ontario - most locations'),(92,'CA','America/Nipigon','Eastern Time - Ontario & Quebec - places that did not observe DST 1967-1973'),(93,'CA','America/Thunder_Bay','Eastern Time - Thunder Bay, Ontario'),(94,'CA','America/Iqaluit','Eastern Time - east Nunavut - most locations'),(95,'CA','America/Pangnirtung','Eastern Time - Pangnirtung, Nunavut'),(96,'CA','America/Resolute','Central Standard Time - Resolute, Nunavut'),(97,'CA','America/Atikokan','Eastern Standard Time - Atikokan, Ontario and Southampton I, Nunavut'),(98,'CA','America/Rankin_Inlet','Central Time - central Nunavut'),(99,'CA','America/Winnipeg','Central Time - Manitoba & west Ontario'),(100,'CA','America/Rainy_River','Central Time - Rainy River & Fort Frances, Ontario'),(101,'CA','America/Regina','Central Standard Time - Saskatchewan - most locations'),(102,'CA','America/Swift_Current','Central Standard Time - Saskatchewan - midwest'),(103,'CA','America/Edmonton','Mountain Time - Alberta, east British Columbia & west Saskatchewan'),(104,'CA','America/Cambridge_Bay','Mountain Time - west Nunavut'),(105,'CA','America/Yellowknife','Mountain Time - central Northwest Territories'),(106,'CA','America/Inuvik','Mountain Time - west Northwest Territories'),(107,'CA','America/Creston','Mountain Standard Time - Creston, British Columbia'),(108,'CA','America/Dawson_Creek','Mountain Standard Time - Dawson Creek & Fort Saint John, British Columbia'),(109,'CA','America/Vancouver','Pacific Time - west British Columbia'),(110,'CA','America/Whitehorse','Pacific Time - south Yukon'),(111,'CA','America/Dawson','Pacific Time - north Yukon'),(112,'CC','Indian/Cocos',''),(113,'CD','Africa/Kinshasa','west Dem. Rep. of Congo'),(114,'CD','Africa/Lubumbashi','east Dem. Rep. of Congo'),(115,'CF','Africa/Bangui',''),(116,'CG','Africa/Brazzaville',''),(117,'CH','Europe/Zurich',''),(118,'CI','Africa/Abidjan',''),(119,'CK','Pacific/Rarotonga',''),(120,'CL','America/Santiago','most locations'),(121,'CL','Pacific/Easter','Easter Island & Sala y Gomez'),(122,'CM','Africa/Douala',''),(123,'CN','Asia/Shanghai','east China - Beijing, Guangdong, Shanghai, etc.'),(124,'CN','Asia/Harbin','Heilongjiang (except Mohe), Jilin'),(125,'CN','Asia/Chongqing','central China - Sichuan, Yunnan, Guangxi, Shaanxi, Guizhou, etc.'),(126,'CN','Asia/Urumqi','most of Tibet & Xinjiang'),(127,'CN','Asia/Kashgar','west Tibet & Xinjiang'),(128,'CO','America/Bogota',''),(129,'CR','America/Costa_Rica',''),(130,'CU','America/Havana',''),(131,'CV','Atlantic/Cape_Verde',''),(132,'CW','America/Curacao',''),(133,'CX','Indian/Christmas',''),(134,'CY','Asia/Nicosia',''),(135,'CZ','Europe/Prague',''),(136,'DE','Europe/Berlin',''),(137,'DJ','Africa/Djibouti',''),(138,'DK','Europe/Copenhagen',''),(139,'DM','America/Dominica',''),(140,'DO','America/Santo_Domingo',''),(141,'DZ','Africa/Algiers',''),(142,'EC','America/Guayaquil','mainland'),(143,'EC','Pacific/Galapagos','Galapagos Islands'),(144,'EE','Europe/Tallinn',''),(145,'EG','Africa/Cairo',''),(146,'EH','Africa/El_Aaiun',''),(147,'ER','Africa/Asmara',''),(148,'ES','Europe/Madrid','mainland'),(149,'ES','Africa/Ceuta','Ceuta & Melilla'),(150,'ES','Atlantic/Canary','Canary Islands'),(151,'ET','Africa/Addis_Ababa',''),(152,'FI','Europe/Helsinki',''),(153,'FJ','Pacific/Fiji',''),(154,'FK','Atlantic/Stanley',''),(155,'FM','Pacific/Chuuk','Chuuk (Truk) and Yap'),(156,'FM','Pacific/Pohnpei','Pohnpei (Ponape)'),(157,'FM','Pacific/Kosrae','Kosrae'),(158,'FO','Atlantic/Faroe',''),(159,'FR','Europe/Paris',''),(160,'GA','Africa/Libreville',''),(161,'GB','Europe/London',''),(162,'GD','America/Grenada',''),(163,'GE','Asia/Tbilisi',''),(164,'GF','America/Cayenne',''),(165,'GG','Europe/Guernsey',''),(166,'GH','Africa/Accra',''),(167,'GI','Europe/Gibraltar',''),(168,'GL','America/Godthab','most locations'),(169,'GL','America/Danmarkshavn','east coast, north of Scoresbysund'),(170,'GL','America/Scoresbysund','Scoresbysund / Ittoqqortoormiit'),(171,'GL','America/Thule','Thule / Pituffik'),(172,'GM','Africa/Banjul',''),(173,'GN','Africa/Conakry',''),(174,'GP','America/Guadeloupe',''),(175,'GQ','Africa/Malabo',''),(176,'GR','Europe/Athens',''),(177,'GS','Atlantic/South_Georgia',''),(178,'GT','America/Guatemala',''),(179,'GU','Pacific/Guam',''),(180,'GW','Africa/Bissau',''),(181,'GY','America/Guyana',''),(182,'HK','Asia/Hong_Kong',''),(183,'HN','America/Tegucigalpa',''),(184,'HR','Europe/Zagreb',''),(185,'HT','America/Port-au-Prince',''),(186,'HU','Europe/Budapest',''),(187,'ID','Asia/Jakarta','Java & Sumatra'),(188,'ID','Asia/Pontianak','west & central Borneo'),(189,'ID','Asia/Makassar','east & south Borneo, Sulawesi (Celebes), Bali, Nusa Tengarra, west Timor'),(190,'ID','Asia/Jayapura','west New Guinea (Irian Jaya) & Malukus (Moluccas)'),(191,'IE','Europe/Dublin',''),(192,'IL','Asia/Jerusalem',''),(193,'IM','Europe/Isle_of_Man',''),(194,'IN','Asia/Kolkata',''),(195,'IO','Indian/Chagos',''),(196,'IQ','Asia/Baghdad',''),(197,'IR','Asia/Tehran',''),(198,'IS','Atlantic/Reykjavik',''),(199,'IT','Europe/Rome',''),(200,'JE','Europe/Jersey',''),(201,'JM','America/Jamaica',''),(202,'JO','Asia/Amman',''),(203,'JP','Asia/Tokyo',''),(204,'KE','Africa/Nairobi',''),(205,'KG','Asia/Bishkek',''),(206,'KH','Asia/Phnom_Penh',''),(207,'KI','Pacific/Tarawa','Gilbert Islands'),(208,'KI','Pacific/Enderbury','Phoenix Islands'),(209,'KI','Pacific/Kiritimati','Line Islands'),(210,'KM','Indian/Comoro',''),(211,'KN','America/St_Kitts',''),(212,'KP','Asia/Pyongyang',''),(213,'KR','Asia/Seoul',''),(214,'KW','Asia/Kuwait',''),(215,'KY','America/Cayman',''),(216,'KZ','Asia/Almaty','most locations'),(217,'KZ','Asia/Qyzylorda','Qyzylorda (Kyzylorda, Kzyl-Orda)'),(218,'KZ','Asia/Aqtobe','Aqtobe (Aktobe)'),(219,'KZ','Asia/Aqtau','Atyrau (Atirau, Guryev), Mangghystau (Mankistau)'),(220,'KZ','Asia/Oral','West Kazakhstan'),(221,'LA','Asia/Vientiane',''),(222,'LB','Asia/Beirut',''),(223,'LC','America/St_Lucia',''),(224,'LI','Europe/Vaduz',''),(225,'LK','Asia/Colombo',''),(226,'LR','Africa/Monrovia',''),(227,'LS','Africa/Maseru',''),(228,'LT','Europe/Vilnius',''),(229,'LU','Europe/Luxembourg',''),(230,'LV','Europe/Riga',''),(231,'LY','Africa/Tripoli',''),(232,'MA','Africa/Casablanca',''),(233,'MC','Europe/Monaco',''),(234,'MD','Europe/Chisinau',''),(235,'ME','Europe/Podgorica',''),(236,'MF','America/Marigot',''),(237,'MG','Indian/Antananarivo',''),(238,'MH','Pacific/Majuro','most locations'),(239,'MH','Pacific/Kwajalein','Kwajalein'),(240,'MK','Europe/Skopje',''),(241,'ML','Africa/Bamako',''),(242,'MM','Asia/Rangoon',''),(243,'MN','Asia/Ulaanbaatar','most locations'),(244,'MN','Asia/Hovd','Bayan-Olgiy, Govi-Altai, Hovd, Uvs, Zavkhan'),(245,'MN','Asia/Choibalsan','Dornod, Sukhbaatar'),(246,'MO','Asia/Macau',''),(247,'MP','Pacific/Saipan',''),(248,'MQ','America/Martinique',''),(249,'MR','Africa/Nouakchott',''),(250,'MS','America/Montserrat',''),(251,'MT','Europe/Malta',''),(252,'MU','Indian/Mauritius',''),(253,'MV','Indian/Maldives',''),(254,'MW','Africa/Blantyre',''),(255,'MX','America/Mexico_City','Central Time - most locations'),(256,'MX','America/Cancun','Central Time - Quintana Roo'),(257,'MX','America/Merida','Central Time - Campeche, Yucatan'),(258,'MX','America/Monterrey','Mexican Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas away from US border'),(259,'MX','America/Matamoros','US Central Time - Coahuila, Durango, Nuevo Leon, Tamaulipas near US border'),(260,'MX','America/Mazatlan','Mountain Time - S Baja, Nayarit, Sinaloa'),(261,'MX','America/Chihuahua','Mexican Mountain Time - Chihuahua away from US border'),(262,'MX','America/Ojinaga','US Mountain Time - Chihuahua near US border'),(263,'MX','America/Hermosillo','Mountain Standard Time - Sonora'),(264,'MX','America/Tijuana','US Pacific Time - Baja California near US border'),(265,'MX','America/Santa_Isabel','Mexican Pacific Time - Baja California away from US border'),(266,'MX','America/Bahia_Banderas','Mexican Central Time - Bahia de Banderas'),(267,'MY','Asia/Kuala_Lumpur','peninsular Malaysia'),(268,'MY','Asia/Kuching','Sabah & Sarawak'),(269,'MZ','Africa/Maputo',''),(270,'NA','Africa/Windhoek',''),(271,'NC','Pacific/Noumea',''),(272,'NE','Africa/Niamey',''),(273,'NF','Pacific/Norfolk',''),(274,'NG','Africa/Lagos',''),(275,'NI','America/Managua',''),(276,'NL','Europe/Amsterdam',''),(277,'NO','Europe/Oslo',''),(278,'NP','Asia/Kathmandu',''),(279,'NR','Pacific/Nauru',''),(280,'NU','Pacific/Niue',''),(281,'NZ','Pacific/Auckland','most locations'),(282,'NZ','Pacific/Chatham','Chatham Islands'),(283,'OM','Asia/Muscat',''),(284,'PA','America/Panama',''),(285,'PE','America/Lima',''),(286,'PF','Pacific/Tahiti','Society Islands'),(287,'PF','Pacific/Marquesas','Marquesas Islands'),(288,'PF','Pacific/Gambier','Gambier Islands'),(289,'PG','Pacific/Port_Moresby',''),(290,'PH','Asia/Manila',''),(291,'PK','Asia/Karachi',''),(292,'PL','Europe/Warsaw',''),(293,'PM','America/Miquelon',''),(294,'PN','Pacific/Pitcairn',''),(295,'PR','America/Puerto_Rico',''),(296,'PS','Asia/Gaza','Gaza Strip'),(297,'PS','Asia/Hebron','West Bank'),(298,'PT','Europe/Lisbon','mainland'),(299,'PT','Atlantic/Madeira','Madeira Islands'),(300,'PT','Atlantic/Azores','Azores'),(301,'PW','Pacific/Palau',''),(302,'PY','America/Asuncion',''),(303,'QA','Asia/Qatar',''),(304,'RE','Indian/Reunion',''),(305,'RO','Europe/Bucharest',''),(306,'RS','Europe/Belgrade',''),(307,'RU','Europe/Kaliningrad','Moscow-01 - Kaliningrad'),(308,'RU','Europe/Moscow','Moscow+00 - west Russia'),(309,'RU','Europe/Volgograd','Moscow+00 - Caspian Sea'),(310,'RU','Europe/Samara','Moscow+00 - Samara, Udmurtia'),(311,'RU','Asia/Yekaterinburg','Moscow+02 - Urals'),(312,'RU','Asia/Omsk','Moscow+03 - west Siberia'),(313,'RU','Asia/Novosibirsk','Moscow+03 - Novosibirsk'),(314,'RU','Asia/Novokuznetsk','Moscow+03 - Novokuznetsk'),(315,'RU','Asia/Krasnoyarsk','Moscow+04 - Yenisei River'),(316,'RU','Asia/Irkutsk','Moscow+05 - Lake Baikal'),(317,'RU','Asia/Yakutsk','Moscow+06 - Lena River'),(318,'RU','Asia/Vladivostok','Moscow+07 - Amur River'),(319,'RU','Asia/Sakhalin','Moscow+07 - Sakhalin Island'),(320,'RU','Asia/Magadan','Moscow+08 - Magadan'),(321,'RU','Asia/Kamchatka','Moscow+08 - Kamchatka'),(322,'RU','Asia/Anadyr','Moscow+08 - Bering Sea'),(323,'RW','Africa/Kigali',''),(324,'SA','Asia/Riyadh',''),(325,'SB','Pacific/Guadalcanal',''),(326,'SC','Indian/Mahe',''),(327,'SD','Africa/Khartoum',''),(328,'SE','Europe/Stockholm',''),(329,'SG','Asia/Singapore',''),(330,'SH','Atlantic/St_Helena',''),(331,'SI','Europe/Ljubljana',''),(332,'SJ','Arctic/Longyearbyen',''),(333,'SK','Europe/Bratislava',''),(334,'SL','Africa/Freetown',''),(335,'SM','Europe/San_Marino',''),(336,'SN','Africa/Dakar',''),(337,'SO','Africa/Mogadishu',''),(338,'SR','America/Paramaribo',''),(339,'SS','Africa/Juba',''),(340,'ST','Africa/Sao_Tome',''),(341,'SV','America/El_Salvador',''),(342,'SX','America/Lower_Princes',''),(343,'SY','Asia/Damascus',''),(344,'SZ','Africa/Mbabane',''),(345,'TC','America/Grand_Turk',''),(346,'TD','Africa/Ndjamena',''),(347,'TF','Indian/Kerguelen',''),(348,'TG','Africa/Lome',''),(349,'TH','Asia/Bangkok',''),(350,'TJ','Asia/Dushanbe',''),(351,'TK','Pacific/Fakaofo',''),(352,'TL','Asia/Dili',''),(353,'TM','Asia/Ashgabat',''),(354,'TN','Africa/Tunis',''),(355,'TO','Pacific/Tongatapu',''),(356,'TR','Europe/Istanbul',''),(357,'TT','America/Port_of_Spain',''),(358,'TV','Pacific/Funafuti',''),(359,'TW','Asia/Taipei',''),(360,'TZ','Africa/Dar_es_Salaam',''),(361,'UA','Europe/Kiev','most locations'),(362,'UA','Europe/Uzhgorod','Ruthenia'),(363,'UA','Europe/Zaporozhye','Zaporozhye, E Lugansk / Zaporizhia, E Luhansk'),(364,'UA','Europe/Simferopol','central Crimea'),(365,'UG','Africa/Kampala',''),(366,'UM','Pacific/Johnston','Johnston Atoll'),(367,'UM','Pacific/Midway','Midway Islands'),(368,'UM','Pacific/Wake','Wake Island'),(369,'US','America/New_York','Eastern Time'),(370,'US','America/Detroit','Eastern Time - Michigan - most locations'),(371,'US','America/Kentucky/Louisville','Eastern Time - Kentucky - Louisville area'),(372,'US','America/Kentucky/Monticello','Eastern Time - Kentucky - Wayne County'),(373,'US','America/Indiana/Indianapolis','Eastern Time - Indiana - most locations'),(374,'US','America/Indiana/Vincennes','Eastern Time - Indiana - Daviess, Dubois, Knox & Martin Counties'),(375,'US','America/Indiana/Winamac','Eastern Time - Indiana - Pulaski County'),(376,'US','America/Indiana/Marengo','Eastern Time - Indiana - Crawford County'),(377,'US','America/Indiana/Petersburg','Eastern Time - Indiana - Pike County'),(378,'US','America/Indiana/Vevay','Eastern Time - Indiana - Switzerland County'),(379,'US','America/Chicago','Central Time'),(380,'US','America/Indiana/Tell_City','Central Time - Indiana - Perry County'),(381,'US','America/Indiana/Knox','Central Time - Indiana - Starke County'),(382,'US','America/Menominee','Central Time - Michigan - Dickinson, Gogebic, Iron & Menominee Counties'),(383,'US','America/North_Dakota/Center','Central Time - North Dakota - Oliver County'),(384,'US','America/North_Dakota/New_Salem','Central Time - North Dakota - Morton County (except Mandan area)'),(385,'US','America/North_Dakota/Beulah','Central Time - North Dakota - Mercer County'),(386,'US','America/Denver','Mountain Time'),(387,'US','America/Boise','Mountain Time - south Idaho & east Oregon'),(388,'US','America/Shiprock','Mountain Time - Navajo'),(389,'US','America/Phoenix','Mountain Standard Time - Arizona'),(390,'US','America/Los_Angeles','Pacific Time'),(391,'US','America/Anchorage','Alaska Time'),(392,'US','America/Juneau','Alaska Time - Alaska panhandle'),(393,'US','America/Sitka','Alaska Time - southeast Alaska panhandle'),(394,'US','America/Yakutat','Alaska Time - Alaska panhandle neck'),(395,'US','America/Nome','Alaska Time - west Alaska'),(396,'US','America/Adak','Aleutian Islands'),(397,'US','America/Metlakatla','Metlakatla Time - Annette Island'),(398,'US','Pacific/Honolulu','Hawaii'),(399,'UY','America/Montevideo',''),(400,'UZ','Asia/Samarkand','west Uzbekistan'),(401,'UZ','Asia/Tashkent','east Uzbekistan'),(402,'VA','Europe/Vatican',''),(403,'VC','America/St_Vincent',''),(404,'VE','America/Caracas',''),(405,'VG','America/Tortola',''),(406,'VI','America/St_Thomas',''),(407,'VN','Asia/Ho_Chi_Minh',''),(408,'VU','Pacific/Efate',''),(409,'WF','Pacific/Wallis',''),(410,'WS','Pacific/Apia',''),(411,'YE','Asia/Aden',''),(412,'YT','Indian/Mayotte',''),(413,'ZA','Africa/Johannesburg',''),(414,'ZM','Africa/Lusaka',''),(415,'ZW','Africa/Harare','');
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-07 12:22:12
