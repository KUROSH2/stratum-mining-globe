-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pool
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.10.1

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
-- Table structure for table `accountBalance`
--

DROP TABLE IF EXISTS `accountBalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountBalance` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` int(255) NOT NULL,
  `balance` varchar(40) DEFAULT NULL,
  `sendAddress` varchar(255) DEFAULT '',
  `paid` varchar(40) DEFAULT '0',
  `threshold` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`),
  KEY `b_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=903 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locks` (
  `name` varchar(11) NOT NULL,
  `locked` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `networkBlocks`
--

DROP TABLE IF EXISTS `networkBlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkBlocks` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `blockNumber` int(255) NOT NULL,
  `timestamp` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8883 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `timestap` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT ' ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool`
--

DROP TABLE IF EXISTS `pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool` (
  `parameter` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `DB_Version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pool_worker`
--

DROP TABLE IF EXISTS `pool_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_worker` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `associatedUserId` int(255) NOT NULL,
  `username` char(50) DEFAULT NULL,
  `password` char(255) DEFAULT NULL,
  `allowed_hosts` text,
  `speed` float DEFAULT NULL,
  `total_shares` int(11) DEFAULT '0',
  `last_checkin` int(11) DEFAULT '0',
  `total_rejects` int(11) DEFAULT '0',
  `total_found` int(11) DEFAULT '0',
  `alive` tinyint(1) DEFAULT NULL,
  `difficulty` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `p_username` (`username`),
  KEY `pool_worker_associatedUserId` (`associatedUserId`),
  KEY `pool_worker_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1807 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `setting` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`setting`),
  KEY `set_setting` (`setting`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shares`
--

DROP TABLE IF EXISTS `shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shares` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `rem_host` varchar(255) DEFAULT NULL,
  `username` varchar(120) NOT NULL,
  `our_result` enum('Y','N') NOT NULL,
  `upstream_result` enum('Y','N') DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `solution` varchar(257) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_num` int(11) DEFAULT NULL,
  `prev_block_hash` text,
  `useragent` text,
  `difficulty` int(11) DEFAULT NULL,
  `DB_Version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shares_time` (`time`),
  KEY `shares_our_result` (`our_result`),
  KEY `idx_id` (`id`),
  KEY `idx_rem_host` (`rem_host`),
  KEY `idx_username` (`username`),
  KEY `idx_upstream_result` (`upstream_result`),
  KEY `shares_time_username` (`time`,`username`(10)),
  KEY `shares_upstreamresult` (`upstream_result`),
  KEY `shares_username` (`username`(10))
) ENGINE=InnoDB AUTO_INCREMENT=33456935 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shares_archive`
--

DROP TABLE IF EXISTS `shares_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shares_archive` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rem_host` text,
  `username` text,
  `our_result` tinyint(1) DEFAULT NULL,
  `upstream_result` tinyint(1) DEFAULT NULL,
  `reason` text,
  `solution` text,
  `block_num` int(11) DEFAULT NULL,
  `prev_block_hash` text,
  `useragent` text,
  `difficulty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shares_archive_found`
--

DROP TABLE IF EXISTS `shares_archive_found`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shares_archive_found` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rem_host` text,
  `username` text,
  `our_result` tinyint(1) DEFAULT NULL,
  `upstream_result` tinyint(1) DEFAULT NULL,
  `reason` text,
  `solution` text,
  `block_num` int(11) DEFAULT NULL,
  `prev_block_hash` text,
  `useragent` text,
  `difficulty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shares_counted`
--

DROP TABLE IF EXISTS `shares_counted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shares_counted` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockNumber` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `invalid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17616562 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shares_shelved`
--

DROP TABLE IF EXISTS `shares_shelved`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shares_shelved` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `rem_host` varchar(255) DEFAULT NULL,
  `username` varchar(120) NOT NULL,
  `our_result` enum('Y','N') NOT NULL,
  `upstream_result` enum('Y','N') DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `solution` varchar(257) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_num` int(11) DEFAULT NULL,
  `prev_block_hash` text,
  `useragent` text,
  `difficulty` int(11) DEFAULT NULL,
  `DB_Version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shares_time` (`time`),
  KEY `shares_our_result` (`our_result`),
  KEY `idx_id` (`id`),
  KEY `idx_rem_host` (`rem_host`),
  KEY `idx_username` (`username`),
  KEY `idx_upstream_result` (`upstream_result`),
  KEY `shares_time_username` (`time`,`username`(10)),
  KEY `shares_upstreamresult` (`upstream_result`),
  KEY `shares_username` (`username`(10))
) ENGINE=InnoDB AUTO_INCREMENT=32368885 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unconfirmed_rewards`
--

DROP TABLE IF EXISTS `unconfirmed_rewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unconfirmed_rewards` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` int(255) NOT NULL,
  `blockNumber` int(255) NOT NULL,
  `amount` varchar(40) NOT NULL,
  `rewarded` enum('N','Y') NOT NULL DEFAULT 'N',
  `shares` int(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `unconfirmed_rewards_blockNumber` (`blockNumber`),
  KEY `unconfirmed_rewards_rewarded` (`rewarded`),
  KEY `unconfirmed_rewards_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=8236 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userHashrates`
--

DROP TABLE IF EXISTS `userHashrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userHashrates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(255) NOT NULL,
  `hashrate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `userHashrates_id1` (`userId`),
  KEY `userId_timestamp` (`userId`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2597836 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webUsers`
--

DROP TABLE IF EXISTS `webUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webUsers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `admin` int(1) NOT NULL,
  `username` varchar(40) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'Associated email: used for validating users, and re-setting passwords',
  `emailAuthPin` varchar(10) NOT NULL COMMENT 'The pin required to authorize that email address',
  `secret` varchar(10) NOT NULL,
  `loggedIp` varchar(255) NOT NULL,
  `sessionTimeoutStamp` int(255) NOT NULL,
  `accountLocked` int(255) NOT NULL COMMENT 'This is the timestamp when the account will be unlocked(usually used to lock accounts that are trying to be bruteforced)',
  `accountFailedAttempts` int(2) NOT NULL COMMENT 'This counts the number of failed attempts for web login',
  `pin` varchar(255) NOT NULL COMMENT 'four digit pin to allow account changes',
  `share_count` int(11) NOT NULL DEFAULT '0',
  `stale_share_count` int(11) NOT NULL DEFAULT '0',
  `shares_this_round` int(11) NOT NULL DEFAULT '0',
  `api_key` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `activeEmail` int(1) DEFAULT NULL,
  `donate_percent` varchar(11) DEFAULT '1',
  `btc_lock` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `u_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=907 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `winning_shares`
--

DROP TABLE IF EXISTS `winning_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `winning_shares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockNumber` int(11) NOT NULL,
  `username` varchar(11) NOT NULL,
  `share_id` int(255) NOT NULL DEFAULT '0',
  `rewarded` enum('N','Y') NOT NULL DEFAULT 'N',
  `amount` varchar(40) NOT NULL DEFAULT '0',
  `confirms` smallint(6) NOT NULL DEFAULT '0',
  `txid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `scored` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `winning_shares_scored` (`scored`)
) ENGINE=InnoDB AUTO_INCREMENT=7107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-14 14:49:14
