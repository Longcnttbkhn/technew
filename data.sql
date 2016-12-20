-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 20, 2016 at 07:15 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technew`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birth_day` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `about_me` varchar(10000) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `birth_day`, `address`, `phone`, `avatar`, `status`, `about_me`, `user_id`) VALUES
(1, 'Nguyễn Hoàng Long', '1995-06-18', 'Thanh Nhàn - Hai Bà Trưng - Hà Nội', '0123456789', '/api/authors/1/avatar/', 'APPROVED', '\n                ', 6),
(2, 'Minh Trang', NULL, NULL, NULL, NULL, 'APPROVED', NULL, 7),
(3, 'Minh Ngọc', NULL, NULL, NULL, NULL, 'APPROVED', NULL, 8),
(4, 'Long J', '1989-08-10', 'Thien duong', '7845623', '/api/authors/4/avatar/', 'APPROVED', '\n                ', 9),
(5, 'KnightZ', '1990-05-15', 'Bach khoa ha noi', '98657892', '/api/authors/5/avatar/', 'APPROVED', '\n                ', 10),
(6, 'Master dui', '1993-06-15', 'Ăn hại gia đình', '564213569', '/api/authors/6/avatar/', 'APPROVED', '\n                ', 11),
(7, 'NPQM', '1993-03-07', 'Sống tại nhà', '1653258987', '/api/authors/7/avatar/', 'APPROVED', '\n                ', 12),
(8, 'Ryan Kog', '1994-08-17', 'Đại học Hà Nội', '0132568945', '/api/authors/8/avatar/', 'APPROVED', '\n                ', 13),
(9, 'NEO', '1992-02-05', 'Làm việc tại trường Đời', '0124587988', '/api/authors/9/avatar/', 'APPROVED', '\n                ', 14),
(10, 'TVD', '1994-08-02', 'FA tại Hà Nội', '0456852356', '/api/authors/10/avatar/', 'APPROVED', '\n                ', 15);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Mobile'),
(2, 'Tin ICT'),
(3, 'Khám phá'),
(4, 'Internet'),
(5, 'Trà đá công nghệ'),
(6, 'Sống'),
(7, 'Thủ thuật');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DATABASECHANGELOG`
--

INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`) VALUES
('00000000000001', 'jhipster', 'classpath:config/liquibase/changelog/00000000000000_initial_schema.xml', '2016-12-20 22:25:26', 1, 'EXECUTED', '7:6a7d39085f403ef1508eef317552b709', 'createTable, createIndex (x2), createTable (x2), addPrimaryKey, createTable, addForeignKeyConstraint (x3), loadData, dropDefaultValue, loadData (x2), createTable (x2), addPrimaryKey, createIndex (x2), addForeignKeyConstraint, createTable, addUniqu...', '', NULL, '3.4.2', NULL, NULL),
('20161211142000-1', 'jhipster', 'classpath:config/liquibase/changelog/20161211142000_added_entity_Author.xml', '2016-12-20 22:25:27', 2, 'EXECUTED', '7:2ef1ae4dfaa05dcf8d5636dbcc95c6b0', 'createTable', '', NULL, '3.4.2', NULL, NULL),
('20161211142001-1', 'jhipster', 'classpath:config/liquibase/changelog/20161211142001_added_entity_Post.xml', '2016-12-20 22:25:27', 3, 'EXECUTED', '7:9b610e442f78a49d6323b2155cc3ea81', 'createTable, dropDefaultValue', '', NULL, '3.4.2', NULL, NULL),
('20161211142002-1', 'jhipster', 'classpath:config/liquibase/changelog/20161211142002_added_entity_Category.xml', '2016-12-20 22:25:28', 4, 'EXECUTED', '7:427d1fa4d62729b0c0595ffe7494ab7b', 'createTable', '', NULL, '3.4.2', NULL, NULL),
('20161211142003-1', 'jhipster', 'classpath:config/liquibase/changelog/20161211142003_added_entity_Comment.xml', '2016-12-20 22:25:28', 5, 'EXECUTED', '7:0409d773f606e3b6ad2c002989382c15', 'createTable', '', NULL, '3.4.2', NULL, NULL),
('20161211142000-2', 'jhipster', 'classpath:config/liquibase/changelog/20161211142000_added_entity_constraints_Author.xml', '2016-12-20 22:25:29', 6, 'EXECUTED', '7:76d7e2d2733aebc82588bb55c906bc08', 'addForeignKeyConstraint', '', NULL, '3.4.2', NULL, NULL),
('20161211142001-2', 'jhipster', 'classpath:config/liquibase/changelog/20161211142001_added_entity_constraints_Post.xml', '2016-12-20 22:25:32', 7, 'EXECUTED', '7:f1aae7923a71d59d0c90199af5d2b1a5', 'addForeignKeyConstraint (x2)', '', NULL, '3.4.2', NULL, NULL),
('20161211142003-2', 'jhipster', 'classpath:config/liquibase/changelog/20161211142003_added_entity_constraints_Comment.xml', '2016-12-20 22:25:34', 8, 'EXECUTED', '7:750108374a403bf242a6a2a35b4f7320', 'addForeignKeyConstraint (x2)', '', NULL, '3.4.2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jhi_authority`
--

CREATE TABLE `jhi_authority` (
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jhi_authority`
--

INSERT INTO `jhi_authority` (`name`) VALUES
('ROLE_ADMIN'),
('ROLE_AUTHOR'),
('ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `jhi_persistent_audit_event`
--

CREATE TABLE `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL,
  `principal` varchar(100) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jhi_persistent_audit_event`
--

INSERT INTO `jhi_persistent_audit_event` (`event_id`, `principal`, `event_date`, `event_type`) VALUES
(1, 'admin', '2016-12-20 15:26:11', 'AUTHENTICATION_SUCCESS'),
(2, 'null', '2016-12-20 15:41:49', 'AUTHENTICATION_FAILURE'),
(3, 'null', '2016-12-20 15:43:16', 'AUTHENTICATION_FAILURE'),
(4, 'null', '2016-12-20 15:43:43', 'AUTHENTICATION_FAILURE'),
(5, 'admin', '2016-12-20 15:45:11', 'AUTHENTICATION_SUCCESS'),
(6, 'longnh', '2016-12-20 15:47:34', 'AUTHENTICATION_SUCCESS'),
(7, 'longnh', '2016-12-20 15:47:52', 'AUTHENTICATION_SUCCESS'),
(8, 'admin', '2016-12-20 15:48:05', 'AUTHENTICATION_SUCCESS'),
(9, 'admin', '2016-12-20 16:02:48', 'AUTHENTICATION_SUCCESS'),
(10, 'ngocmiz@123', '2016-12-20 16:11:40', 'AUTHENTICATION_FAILURE'),
(11, 'admin', '2016-12-20 16:12:14', 'AUTHENTICATION_SUCCESS'),
(12, 'admin', '2016-12-20 16:19:31', 'AUTHENTICATION_SUCCESS'),
(13, 'longnh', '2016-12-20 16:26:08', 'AUTHENTICATION_SUCCESS'),
(14, 'ngocmiz@123', '2016-12-20 16:27:12', 'AUTHENTICATION_FAILURE'),
(15, 'ngocmiz@123', '2016-12-20 16:27:26', 'AUTHENTICATION_FAILURE'),
(16, 'ngocmiz@123', '2016-12-20 16:27:43', 'AUTHENTICATION_FAILURE'),
(17, 'ngocmiz@123', '2016-12-20 16:27:53', 'AUTHENTICATION_FAILURE'),
(18, 'longj', '2016-12-20 16:28:15', 'AUTHENTICATION_SUCCESS'),
(19, 'zknight@123', '2016-12-20 16:28:44', 'AUTHENTICATION_FAILURE'),
(20, 'zknight', '2016-12-20 16:28:51', 'AUTHENTICATION_SUCCESS'),
(21, 'admin', '2016-12-20 16:35:27', 'AUTHENTICATION_SUCCESS'),
(22, 'longj', '2016-12-20 16:36:43', 'AUTHENTICATION_SUCCESS'),
(23, 'admin', '2016-12-20 17:13:39', 'AUTHENTICATION_SUCCESS'),
(24, 'masterdui', '2016-12-20 17:15:25', 'AUTHENTICATION_SUCCESS'),
(25, 'npqm', '2016-12-20 17:23:12', 'AUTHENTICATION_SUCCESS'),
(26, 'ryankog', '2016-12-20 17:31:50', 'AUTHENTICATION_SUCCESS'),
(27, 'neo', '2016-12-20 17:43:34', 'AUTHENTICATION_SUCCESS'),
(28, 'tvd', '2016-12-20 17:51:40', 'AUTHENTICATION_SUCCESS'),
(29, 'admin', '2016-12-20 18:11:57', 'AUTHENTICATION_SUCCESS'),
(30, 'longnh', '2016-12-20 18:12:58', 'AUTHENTICATION_SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `jhi_persistent_audit_evt_data`
--

CREATE TABLE `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jhi_persistent_audit_evt_data`
--

INSERT INTO `jhi_persistent_audit_evt_data` (`event_id`, `name`, `value`) VALUES
(1, 'remoteAddress', '127.0.0.1'),
(1, 'sessionId', 'kpVdj8galjhILQl8ik5WYRFZPlqVCSh9WLfLDeQA'),
(2, 'message', 'Bad credentials'),
(2, 'remoteAddress', '127.0.0.1'),
(2, 'sessionId', 'S4YdBm2ZBpVnzvV7BcocDlBttXnCWVwnGQO93B0t'),
(2, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(3, 'message', 'Bad credentials'),
(3, 'remoteAddress', '127.0.0.1'),
(3, 'sessionId', '0JoRhAltqWmv8_cBh3C1AKXvbviCikyKLl8EihGe'),
(3, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(4, 'message', 'Bad credentials'),
(4, 'remoteAddress', '127.0.0.1'),
(4, 'sessionId', 'gmx2wb91ULsiUVpXFr7hVWm8jqqbShSf-K64c7Mb'),
(4, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(5, 'remoteAddress', '127.0.0.1'),
(5, 'sessionId', '8C7Y6R67_BzOXBfhZNacWx1Dc0M-4ihZc9nOcND8'),
(6, 'remoteAddress', '127.0.0.1'),
(6, 'sessionId', 'iHgqfIVremKBMqM74RlgbFA6Ln06nvtxzAjI95_A'),
(7, 'remoteAddress', '127.0.0.1'),
(7, 'sessionId', 'sgoKVGscFAVeT3ol8UOUyVqxyvhmK_4yPqJiiZOl'),
(8, 'remoteAddress', '127.0.0.1'),
(8, 'sessionId', 'xIu59GsLuzi7fvnOJcROJbQBKzhkyUdTNHJ0IRVg'),
(9, 'remoteAddress', '127.0.0.1'),
(9, 'sessionId', '5LC5DwCkYn8npP67-77MguaxkoFIR4V1f3spwvgS'),
(10, 'message', 'Bad credentials'),
(10, 'remoteAddress', '127.0.0.1'),
(10, 'sessionId', 'x9zCJqu-UgAVuWruXrYm2MjNfLHwZ4YirdFProhL'),
(10, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(11, 'remoteAddress', '127.0.0.1'),
(11, 'sessionId', 'hKKLe0tsKDvjko_XqaxDe__y3NT5nPF756fUtoUL'),
(12, 'remoteAddress', '127.0.0.1'),
(12, 'sessionId', '5uB4o4pahvjohMyQ9gI3P9LXDPH404Hzsq191wT6'),
(13, 'remoteAddress', '127.0.0.1'),
(13, 'sessionId', 'SnyofeyQVyBik-H3ZErmqxNsjPgB_FNRdX37HY6w'),
(14, 'message', 'Bad credentials'),
(14, 'remoteAddress', '127.0.0.1'),
(14, 'sessionId', 'Sy_lJk6i6WNmES5nCUrxGdHs_HwOGr5aZBzWpbCl'),
(14, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(15, 'message', 'Bad credentials'),
(15, 'remoteAddress', '127.0.0.1'),
(15, 'sessionId', 'cZWAQ1pPynfcSk4_Vp4WDm0B3ZZolT949Z-toY5p'),
(15, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(16, 'message', 'Bad credentials'),
(16, 'remoteAddress', '127.0.0.1'),
(16, 'sessionId', '1VCnD28eQ01YpUisbkuJImjXAfz9CQQXgOVJlrqH'),
(16, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(17, 'message', 'Bad credentials'),
(17, 'remoteAddress', '127.0.0.1'),
(17, 'sessionId', 'uA1zBWBJ_ps5993tGwGpsPPGHoXpyO8HsH5eaXHs'),
(17, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(18, 'remoteAddress', '127.0.0.1'),
(18, 'sessionId', 'VyVHn6A-uymUaMmol7Jz665Zj646QnwMLt5xT0nI'),
(19, 'message', 'Bad credentials'),
(19, 'remoteAddress', '127.0.0.1'),
(19, 'sessionId', 'S0ECli09SaUnZMDXN8q6klQ6EaSwmg5Gqhpsw-ix'),
(19, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
(20, 'remoteAddress', '127.0.0.1'),
(20, 'sessionId', 'Uc2POzPis-VnHKXN-ViVFa-qGAALFc-gBc2FwVOJ'),
(21, 'remoteAddress', '127.0.0.1'),
(21, 'sessionId', 'OVWCtAhnJMEmrUVQC15a6KKr5vVy7ogHDXq3GII-'),
(22, 'remoteAddress', '127.0.0.1'),
(22, 'sessionId', 't4yd9UWpMvYdeNGWdqFo4FP66pM2MQ0mNMTvNsEJ'),
(23, 'remoteAddress', '127.0.0.1'),
(23, 'sessionId', 'fRFUcATSa0v4ReFG9BmEcUad6qtap0O14P8aM2VO'),
(24, 'remoteAddress', '127.0.0.1'),
(24, 'sessionId', '_y2BIol4Q3huY7ncLU6WknBHMefMAMTyXqBLAJKd'),
(25, 'remoteAddress', '127.0.0.1'),
(25, 'sessionId', 't0IvgS5q1G1_TNvpFrxpKTPZYymY8SMH4CN1q0RI'),
(26, 'remoteAddress', '127.0.0.1'),
(26, 'sessionId', 'uV_egkCPp3Ea1ikmhAvs5XgPPZoG3bOAY4RSVIyV'),
(27, 'remoteAddress', '127.0.0.1'),
(27, 'sessionId', 'dCRh9bfy0JpmZ5bmsLEjV4Ol4JyvIWkoBrxqTS-S'),
(28, 'remoteAddress', '127.0.0.1'),
(28, 'sessionId', 'gjaLEkr-tFAG1eC3kKM9Jbhebn0_ByyAQx556t_E'),
(29, 'remoteAddress', '127.0.0.1'),
(29, 'sessionId', 'IbBQad2XAws7F-0KTCPRwoVbjafVc8Df8g3Xrird'),
(30, 'remoteAddress', '127.0.0.1'),
(30, 'sessionId', 'jVgn5iLuHoN-7gIO3enPosHH73DC5Jz2aBa6_NS4');

-- --------------------------------------------------------

--
-- Table structure for table `jhi_persistent_token`
--

CREATE TABLE `jhi_persistent_token` (
  `series` varchar(76) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `token_value` varchar(76) NOT NULL,
  `token_date` date DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jhi_persistent_token`
--

INSERT INTO `jhi_persistent_token` (`series`, `user_id`, `token_value`, `token_date`, `ip_address`, `user_agent`) VALUES
('4I7tvdIfEh2IFjytiVI/yg==', 6, 'JJchtr4v80rQJfBFe+qsfQ==', '2016-12-21', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0'),
('5Ejcvefu4MEXGXTW5PsLnQ==', 3, 'Ax/8V2asTPGtYLfmMrRTGA==', '2016-12-21', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0'),
('7zEA53L1aokUmkesUXoNwA==', 15, '8nd3Yl/g+IwC8W7twvwAXg==', '2016-12-21', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.100 Safari/537.36'),
('eADcAMiDgDmtzeBQx/UaXA==', 6, 'QKShtC//A96n9ltWgZHhlA==', '2016-12-20', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0'),
('LNlHP3rFHOkIZlDgepTaRQ==', 3, 'A32cCgVCQYtwzFGHp2kyvQ==', '2016-12-20', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:50.0) Gecko/20100101 Firefox/50.0');

-- --------------------------------------------------------

--
-- Table structure for table `jhi_social_user_connection`
--

CREATE TABLE `jhi_social_user_connection` (
  `id` bigint(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `provider_user_id` varchar(255) NOT NULL,
  `rank` bigint(20) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `expire_time` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jhi_user`
--

CREATE TABLE `jhi_user` (
  `id` bigint(20) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jhi_user`
--

INSERT INTO `jhi_user` (`id`, `login`, `password_hash`, `first_name`, `last_name`, `email`, `activated`, `lang_key`, `activation_key`, `reset_key`, `created_by`, `created_date`, `reset_date`, `last_modified_by`, `last_modified_date`) VALUES
(1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', b'1', 'en', NULL, NULL, 'system', '2016-12-20 15:25:22', NULL, 'system', '2016-12-20 15:25:22'),
(2, 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', b'1', 'en', NULL, NULL, 'system', '2016-12-20 15:25:22', NULL, 'system', '2016-12-20 15:25:22'),
(3, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', b'1', 'en', NULL, NULL, 'system', '2016-12-20 15:25:22', NULL, 'system', '2016-12-20 15:25:22'),
(4, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', b'1', 'en', NULL, NULL, 'system', '2016-12-20 15:25:22', NULL, 'system', '2016-12-20 15:25:22'),
(5, 'author', '$2a$10$57G20H2V8JQGQ3iF4fhh1.k.engt3QgKGvfxF/2cCgnl.qhBu9E2m', 'Author', 'Author', 'author@localhost', b'1', 'en', NULL, NULL, 'system', '2016-12-20 15:25:22', NULL, 'system', '2016-12-20 15:25:22'),
(6, 'longnh', '$2a$10$cxb/IW0Ci/SbFmvjTCeETO06nrUY.eM/URlPKzhepNHNQr3b/.dgS', NULL, NULL, 'hoanglong180695@gmail.com', b'1', 'vi', NULL, NULL, 'anonymousUser', '2016-12-20 15:47:08', NULL, 'anonymousUser', '2016-12-20 15:47:27'),
(7, 'minhtrang', '$2a$10$tRJxXsOqGdJ.wcoa53NLCecGQtZlP5YDyDnmJ9ZE67VV2olQei2Ta', 'Minh', 'Trang', 'MinhTrang@123', b'1', 'en', NULL, '59689406318618592420', 'admin', '2016-12-20 16:07:50', '2016-12-20 16:07:50', 'admin', '2016-12-20 16:07:50'),
(8, 'ngocmiz', '$2a$10$hQhbeGo2cDmvMljb7rju1eZYP6zI.wFmqBPwMGmQZSqrdpearSxXi', 'Minh', 'Ngọc', 'ngocmiz@123', b'1', 'en', NULL, '01475619001218275103', 'admin', '2016-12-20 16:10:02', '2016-12-20 16:10:02', 'admin', '2016-12-20 16:10:02'),
(9, 'longj', '$2a$10$zGfEN0VLEOZZOq3schE.Pu66NDUkW0Gmo3mEiqxgNU017llrRe5bW', NULL, NULL, 'longj@123', b'1', 'en', '31935996467604901279', NULL, 'anonymousUser', '2016-12-20 16:13:44', NULL, 'admin', '2016-12-20 16:20:42'),
(10, 'zknight', '$2a$10$RK.2ns8aRxmMw6aj.7RUzuYcKHvJ289SfcjspdHVlgbIFlFEkCesC', NULL, NULL, 'zknight@123', b'1', 'en', '76138190254056503609', NULL, 'anonymousUser', '2016-12-20 16:14:28', NULL, 'admin', '2016-12-20 16:20:52'),
(11, 'masterdui', '$2a$10$Jaf8H1LOsWP0SZfjt463dusDHtcjcGvOF8masLMl4ntb69kAc1qfG', NULL, NULL, 'masterdui@123', b'1', 'en', '13301060625334952834', NULL, 'anonymousUser', '2016-12-20 16:15:35', NULL, 'admin', '2016-12-20 16:21:01'),
(12, 'npqm', '$2a$10$/GjgSFB4BofBA63vYrL7zeUjWcH8vFYyMyAMtCZa03cIYXK2132ae', NULL, NULL, 'npqm@123', b'1', 'en', '34341153810054983815', NULL, 'anonymousUser', '2016-12-20 16:16:42', NULL, 'admin', '2016-12-20 16:21:10'),
(13, 'ryankog', '$2a$10$PthWqv4Wkbzs.GVvt0AyYuB0/iF9rbVIiJELV0Di/3RXviRJCDQ0W', NULL, NULL, 'ryankog@123', b'1', 'en', '57743973807021643273', NULL, 'anonymousUser', '2016-12-20 16:17:39', NULL, 'admin', '2016-12-20 16:21:21'),
(14, 'neo', '$2a$10$209b8L9LjBIzrTnBOPD/9O1U6w82FjYLXDnaw3GsVFzABr0Ta5Bbu', NULL, NULL, 'neo@123', b'1', 'en', '49177624655842999061', NULL, 'anonymousUser', '2016-12-20 16:18:21', NULL, 'admin', '2016-12-20 16:21:30'),
(15, 'tvd', '$2a$10$85mwCuo0LuNGs2k.TXgWoOZmNILLILP0sfJF6V5Wa5EZJ1dUMtLJ6', NULL, NULL, 'tvd@123', b'1', 'en', '34204967965093600172', NULL, 'anonymousUser', '2016-12-20 16:19:20', NULL, 'admin', '2016-12-20 16:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `jhi_user_authority`
--

CREATE TABLE `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jhi_user_authority`
--

INSERT INTO `jhi_user_authority` (`user_id`, `authority_name`) VALUES
(1, 'ROLE_ADMIN'),
(1, 'ROLE_USER'),
(3, 'ROLE_ADMIN'),
(3, 'ROLE_USER'),
(4, 'ROLE_USER'),
(5, 'ROLE_AUTHOR'),
(6, 'ROLE_AUTHOR'),
(6, 'ROLE_USER'),
(7, 'ROLE_AUTHOR'),
(7, 'ROLE_USER'),
(8, 'ROLE_AUTHOR'),
(8, 'ROLE_USER'),
(9, 'ROLE_AUTHOR'),
(9, 'ROLE_USER'),
(10, 'ROLE_AUTHOR'),
(10, 'ROLE_USER'),
(11, 'ROLE_AUTHOR'),
(11, 'ROLE_USER'),
(12, 'ROLE_AUTHOR'),
(12, 'ROLE_USER'),
(13, 'ROLE_AUTHOR'),
(13, 'ROLE_USER'),
(14, 'ROLE_AUTHOR'),
(14, 'ROLE_USER'),
(15, 'ROLE_AUTHOR'),
(15, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `decription` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL,
  `view` int(11) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `decription`, `avatar`, `status`, `created_date`, `view`, `author_id`, `category_id`) VALUES
(1, 'Phương pháp phẫu thuật mới có thể chữa trị cho những người gần như mù lòa trở về thị lực 20/20', '<p style="text-align: justify;">Trung tâm Ngăn chặn và Kiểm soát Bệnh tật (CDC) ước tính chỉ riêng trong năm 2010, có tới 2,5 triệu trường hợp phải cấp cứu hoặc tử vong do liên quan đến chấn thương sọ não tại Hoa Kỳ.</p><p style="text-align: justify;">Đây là loại chấn thương có thể gây ra nhiều biến chứng nguy hiểm ảnh hưởng đến thị lực của người bệnh, thậm chí dẫn đến mù lòa hoàn toàn. Hiện nay, các nhà nghiên cứu đã phát hiện ra rằng thị lực có thể được khôi phục ở những người từng bị chấn thương sọ não.</p><p style="text-align: justify;"><br/></p><div class="VCSortableInPreviewMode" type="Photo" style="width: 640px;text-align: justify;"><div style="text-align: center;"><img alt="" id="img_788838b0-c5b3-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/eyecloseup-1024-1482128526432.jpg" rel="http://genknews.genkcdn.vn/2016/eyecloseup-1024-1482128526432.jpg" type="photo"/></div><br/><br/><div class="PhotoCMS_Caption" style="width: 620px;"></div>Thậm chí, họ còn có thể hồi phục được hoàn toàn thị lực ở một số người bệnh bị ảnh hưởng nặng do bị chấn thương sọ não dẫn đến. <br/><br/>Một nghiên cứu nhỏ được thực hiện bởi các nhà nghiên cứu tại Đại học Y Washington, St. Louis; Viện Mắt Kresge tại Đại học Bang Wayne, Detroit; và Viện Mắt L.V. Prasad tại Ấn Độ đã được công bố trên tạp chí Ophthalmology.<br/><br/></div><p style="text-align: justify;">Nghiên cứu bao gồm 20 bệnh nhân, những người này đã được phẫu thuật chữa trị hội chứng Terson, một dạng đặc biệt của xuất huyết do chấn thương sọ não, điển hình do tại nạn giao thông. Một số bệnh nhân bị xuất huyết ở cả hai mắt, do đó cho phép nghiên cứu được thực hiện trên 28 con mắt.</p><p style="text-align: justify;">Phương pháp được sử dụng để khôi phục thị lực ở những bệnh nhân này được gọi là vitrectomy (thủ thuật lấy bỏ dịch thuỷ tinh). Việc phẫu thuật loại bỏ dịch mô phía sau võng mạc của mắt và thay thế nó bằng một loại dung dịch muối.</p><p style="text-align: justify;">Các bệnh nhân được chia ra các nhóm bao gồm những người được phẫu thuật trong vòng ba tháng sau khi bị xuất huyết và những người được phẫu thuật sau ba tháng.</p><p style="text-align: justify;"><strong>Thị lực rất kém trở về bình thường.</strong></p><p style="text-align: justify;">Chỉ một tháng sau khi được phẫu thuật, thị lực của người bệnh đã được cải thiện từ mức trung bình là 20/1290 đã lên đến 20/40. Trong vài tháng sau đó, phần lớn bệnh nhân đã đạt mức thị lực 20/20 (thị lực bình thường).</p><p style="text-align: justify;">Các nhà nghiên cứu lưu ý rằng thời gian từ khi chấn thương đến khi phẫu thuật không hề có ảnh hưởng đến kết quả hồi phục của người bệnh.</p><p style="text-align: justify;">Đây là một bước tiến quan trọng bởi thông thường sẽ có những yếu tố khác liên quan chặt chẽ đến tính mạng người bệnh cần phải được ổn định trước, sau đó mới có thể tiến hành phẫu thuật khôi phục thị lực cho người bệnh.</p><p style="text-align: justify;">Rajendra S. Apte, đến từ Đại học Y Washington cho biết: “<i>Điều quan trọng cần biết đó là chúng ta có thể chờ đợi sau bao lâu để tiến hành phẫu thuật mà không gây ra ảnh hưởng tiêu cực tới thị lực.</i>”</p><p style="text-align: justify;">Đây có thể là một tác động to lớn đến những con số thống kê, đem lại niềm hy vọng cho hàng triệu người mỗi năm.</p><p style="text-align: right;text-align: justify;"><i>Tham khảo Sciencealert</i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="text-align: justify;"><a href="http://genk.vn/nguoi-can-thi-khong-muon-mat-tang-do-thi-dung-quen-6-thoi-quen-vang-nay-20161215143841777.chn" type="2" target="_blank" style="font-size: 26px;font-weight: bold;"></a></div>', 'Thời điểm phẫu thuật không ảnh hưởng đến kết quả hồi phục của bệnh nhân.', '/api/posts/1/avatar/', 'APPROVED', '2016-12-20 16:51:06', 5, 1, 3),
(2, 'Phải chăng đây là địa điểm "creepy" nhất bạn có thể theo dõi thông qua Google Street View?', '<div><p style="font-size: 17px;vertical-align: baseline;"></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ra đời vào năm 2007, đây là công nghệ đặc trưng trong Google Maps và Google Earth. Với những phương tiện gắn camera hành trình của Google, tính năng này đã lưu giữ khá nhiều hình ảnh độc đáo từ khắp nơi trên thế giới. Dĩ nhiên, có những thứ kỳ quặc và đáng sợ cũng đã được ghi lại nhờ công cụ này.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Mới đây, người dùng Google Street View đã phát hiện ra một điểm địa đen tối và đáng sợ như vậy</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hãy làm theo hướng dẫn để khám phá địa điểm này:</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đầu tiên, hãy vào Google Maps, nhập địa chỉ <strong style="font-size: inherit;vertical-align: baseline;"><b><a class="link-inline-content" href="https://www.google.com.vn/webhp?sourceid=chrome-instant&amp;ion=1&amp;espv=2&amp;ie=UTF-8#q=220%20sansome%20st%20san%20francisco" rel="nofollow" target="_blank" style="font-size: inherit;vertical-align: baseline;color: blue;">220 Sansome St.SF, California</a></b></strong></p><div class="VCSortableInPreviewMode IMSCurrentEditorEditObject" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="&lt;br /&gt;vào Google Maps, nhập địa chỉ 220 Sansome St.SF, California&lt;br /&gt;" id="img_41e90390-c697-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/ssss-1482226363207.png" rel="http://genknews.genkcdn.vn/2016/ssss-1482226363207.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"><p style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">vào Google Maps, nhập địa chỉ 220 Sansome St.SF, California</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Địa chỉ này sẽ hiển thị tòa nhà số 220, click vào hình tòa nhà để bật công cụ Google Street View.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_b79c47e0-c698-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/dqwdq-1482226988935.png" rel="http://genknews.genkcdn.vn/2016/dqwdq-1482226988935.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Tiếp theo, click vào phần mái hiên màu xanh lá cây có số 220</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_9ab9c2a0-c699-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/dddd-1482227371141.png" rel="http://genknews.genkcdn.vn/2016/dddd-1482227371141.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Cú click này đã đưa bạn vào bên trong căn nhà số 220, toàn bộ tường và trần nhà được sơn đen xì.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_f2918da0-c699-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/1-1482227518877.png" rel="http://genknews.genkcdn.vn/2016/1-1482227518877.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đây mới là điều bất ngờ bên trong căn phòng...</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_be76f8b0-c69a-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/2-1482227861115.png" rel="http://genknews.genkcdn.vn/2016/2-1482227861115.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Có 5 người đội mũ trùm đen kiểu khùng bố, một phụ nữ nằm sõng soài trên mặt đất. Một đống USD vương vãi từ bàn xuống đất. Chuyện quái gì diễn ra ở đây vậy?</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_fbb78e00-c69b-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/3-1482228392802.png" rel="http://genknews.genkcdn.vn/2016/3-1482228392802.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Chưa hết, chuyển hướng sang căn phòng bên trái là cả một tập đoàn đội mũ trùm đen. Trông giống như một cuộc họp, người đàn ông mặc sơ mi trắng đeo cà vạt có vẻ như đang muốn truyền đạt điều gì đó.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Có vẻ như những tên &#34;người xấu&#34; này đều là iFan, tất cả đều dùng Macbook.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_f4c27000-c69c-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/4-1482228809222.png" rel="http://genknews.genkcdn.vn/2016/4-1482228809222.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Khám phá sâu hơn bên trong căn nhà, tiếp tục là một tập &#34;tập đoàn&#34; người đang làm rất nhiều hành động khác nhau.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_bdbfd650-c69d-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/thumb_w/640/2016/5-1482229148448.png" rel="http://genknews.genkcdn.vn/2016/5-1482229148448.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Trên màn hình và một số địa điểm trong phòng có logo hai con hươu và chữ M/H. Không lẽ tập đoàn &#34;người xấu&#34; này muốn để lại dấu ấn gì đó?</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 600px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_a1060ec0-c69e-11e6-8b7f-fd16126c7626" src="http://genknews.genkcdn.vn/2016/10421991-846379785392015-3506809125359561295-n-1482229529339.png" rel="http://genknews.genkcdn.vn/2016/10421991-846379785392015-3506809125359561295-n-1482229529339.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 580px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hóa ra, đây là trụ sở của công ty quảng cáo MUH-TAY-ZIK HOF-FER có trụ sở ở San Francisco. Có lẽ họ đang chuẩn bị cho một chiến dịch quảng cáo hoặc chương trình gì đó cho Giáng sinh năm nay.</p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div><p></p></div>', 'Chân thực và đáng sợ đến kỳ lạ.', '/api/posts/2/avatar/', 'APPROVED', '2016-12-20 16:56:38', 6, 5, 6),
(3, 'Nghiên cứu: Ung thư miệng di căn qua hạch vẫn có thể chữa trị 90%', '<p><span style="font-size: 17px;float: none;"></span></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Trong nhiệm vụ đánh bại bệnh <a href="http://genk.vn/ung-thu.htm" target="_blank" title="ung thư" style="font-size: inherit;vertical-align: baseline;color: blue;">ung thư</a>, các bác sĩ thường cố gắng tìm mọi cách để đưa thuốc hóa trị tấn công các tế bào khối u, đồng thời tránh cho bệnh nhân khỏi quá trình di căn của chúng. Hai điều cực kỳ quan trọng này có thể được thực hiện dễ dàng hơn, nếu họ biết được đâu là điểm yếu của tế bào ung thư và đâu là yếu tố thúc đẩy quá trình di căn của chúng.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Trên con đường tìm kiếm những tử huyệt ấy, các nhà khoa học đã phát hiện một protein thụ thể axit béo kí hiệu là CD36. Nó vừa làm nhiệm vụ thúc đẩy khối u ung thư phát triển vừa khiến chúng có thể di căn. Bởi vậy, can thiệp vào thụ thể này có thể là một mũi tên trúng hai đích trong điều trị ung thư.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Sự thật, các nhà khoa học đã chứng minh được điều đó trong một nghiên cứu mới công bố trên <a class="link-inline-content" href="http://www.nature.com/articles/nature20791.epdf?referrer_access_token=VA5M1oCdW-E9qG4simoNM9RgN0jAjWel9jnR3ZoTv0PXgBJ7gTORH9oXZrcpIj5GSx9TcGyeZcmapsGIhRAkXVlJjsiua3-LrKxXZxymsCKFQ-pml_5o1Vt67_MYO5TvdwFZwh3uCXUhXmlDssV0Oe5FiRtZt0QV0_BQH-iuphxvinEL2JJr6vomkkpIu9QwRvmJBh8_yCHcUZAlwe0D42zs14tV0EjFGIpYLE9yFidOEowkGTV8qprP_M-K7vOWgP6oYu3ckzt8wxopE-b5N-w1g0Sh5PQX-yfNLbQfpA8%3D&amp;tracking_referrer=arstechnica.com" rel="nofollow" target="_blank" style="font-size: inherit;vertical-align: baseline;color: blue;">tạp chí Nature</a>.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="&lt;br /&gt;Ung thư miệng di căn có thể chữa trị tới 90%, theo nghiên cứu mới&lt;br /&gt;" id="img_bf847020-c5e1-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/taking-a-lozenge-for-dry-mouth-from-oral-cancer-1482148404155.jpg" rel="http://genknews.genkcdn.vn/2016/taking-a-lozenge-for-dry-mouth-from-oral-cancer-1482148404155.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"><p style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">Ung thư miệng di căn có thể chữa trị tới 90%, theo nghiên cứu mới</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Nghiên cứu được dấn dắt bởi các giáo sư đến từ Viện Khoa học và Công nghệ Barcelona (BIST). Trong đó, họ thực hiện nuôi cấy nhiều loại tế bào ung thư miệng của con người và cấy chúng vào miệng chuột.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Một trong số các loại tế bào rất nguy hiểm có kí hiệu CD44bright. Các nhà nghiên cứu để ý chúng bởi những tế bào này sản sinh ra rất nhiều CD36, một protein thụ thế chất béo thường thấy trên bề mặt của các tế bào ung thư di căn, bao gồm cả các tế bào di căn đến hạch.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Như chúng ta đã biết, hạch di căn là một giai đoạn nguy hiểm nhất của ung thư, bởi từ đó, tế bào ung thư có thể dễ dàng di chuyển tới khắp các khu vực khác trên cơ thể.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Trong các tế bào CD44bright ở chuột, các nhà khoa học quan sát thấy CD36 nhận nhiệm vụ kích hoạt tín hiệu tế bào, thúc đẩy việc sản xuất năng lượng (ATP) từ chất béo. Để xác nhận xem điều này có liên quan đến sự phát triển của ung thư hay không, họ đã cho những con chuột ăn một chế độ giàu chất béo.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Quả thực sau đó, tình trạng ung thư miệng của những con chuột đã phát triển “<i style="font-size: inherit;vertical-align: baseline;"><i>hung hăng</i></i>” hơn, chúng cũng thể hiện sự di căn mạnh mẽ. Bằng chứng này đã xác nhận vai trò quan trọng của CD36 trong việc lây lan các tế bào ung thư.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Tuy nhiên, để chắc chắn một lần nữa, các nhà nghiên cứu đã quan sát các tế bào ung thư khác không có CD36. Kết quả là họ đã không tìm được dù chỉ một hạch di căn. Ngoài ra, các nhà khoa học cũng nhận thấy tế bào được lập trình để sản xuất thụ thể CD36 vượt mức, gây ra nhiều tổn thương hơn so với các tế bào ung thư miệng bình thường.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="&lt;br /&gt;Hình ảnh tế bào ung thư có thể giảm tới 90% sau 16 ngày điều trị&lt;br /&gt;" id="img_6fc9d2f0-c5e1-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/5-1482148250440-crop-1482148269991.png" rel="http://genknews.genkcdn.vn/2016/5-1482148250440-crop-1482148269991.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"><p style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">Hình ảnh tế bào ung thư có thể giảm tới 90% sau 16 ngày điều trị</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Bước tiếp theo, câu hỏi được đặt ra là: Liệu can thiệp vào thụ thể CD36 có khiến thế bào ung thư bị tước mất nguồn năng lượng để phát triển và di căn?</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Để trả lời các nhà khoa học đã điều trị những con chuột ung thư với hai loại kháng thể trung hòa CD36. Kết quả không ngoài mong đợi, những kháng thể giúp chống ung thư di căn. Cộng thêm đó, khối u ung thư tại miệng những con chuột cũng giữ nguyên kích thước và dừng phát triển.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ngay cả trên các con chuột mà ung thư đã tiến tới giai đoạn di căn, nếu được điều trị với kháng thể CD36, chúng có thể giảm kích thước khối u di căn tới 80-90%. Đặc biệt, 15% những con chuột này đạt tới độ thuyên giảm hoàn toàn. Liều điều trị kháng thể CD36 càng cao, bệnh tình của chúng càng nhẹ đi rõ rệt.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Cho tới nay, các tài liệu khoa học bước đầu chứng minh được mối tương quan tương tự giữa CD36 và sự phát triển của ung thư trên người. Các tế bào càng sản xuất nhiều CD36, bệnh ung thư càng phát triển hung hăng, để lại một tiên lượng xấu cho bệnh nhân ung thư.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Bởi vậy, các nhà khoa học đến từ Viện Khoa học và Công nghệ Barcelona đặt rất nhiều sự tin tưởng vào phương pháp điều trị kháng thể CD36. Họ đang xúc tiến các thử nghiệm tiếp theo để chứng minh nó hoạt động trên người. Đây rõ ràng là một tín hiệu đáng mừng cho các bệnh nhân ung thư, đặc biệt là ung thư miệng.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;">Tham khảo <i style="font-size: inherit;vertical-align: baseline;"><i>Arstechnica</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div><p><span style="float: none;"></span><div style="text-align: justify;"><br/></div></p><p></p>', 'Can thiệp vào thụ thể CD36 khiến thế bào ung thư bị tước mất nguồn năng lượng.', '/api/posts/3/avatar/', 'APPROVED', '2016-12-20 17:03:38', 4, 4, 6),
(4, 'Smartphone hiện tại đã quá nhàm chán, giờ chỉ còn màn hình gập cong là có thể khiến chúng ta thấy hứng thú', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Chỉ cần tác động một lực ấn mạnh lên màn hình điện thoại hình chữ nhật phổ biến như bao sản phẩm khác, nhưng lần này điều kỳ diệu là nó bất ngờ uốn cong khớp theo từng nét cạnh của cổ tay người dùng, khiến cho mọi người đều im lặng chứng kiến.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đúng vậy, chiếc điện thoại uốn dẻo như một khớp xoay này - được biết đến tên gọi CPlus - là một concept được giới thiệu bởi Lenovo tại tháng 6 vừa rồi, đi kèm với hai thiết bị khác là Moto Z và Phab 2 Pro, đã khiến khán giả được một phen bất ngờ và &#34;chết lặng&#34;. Tất nhiên đây chỉ là một nguyên mẫu thử nghiệm, nhưng nó quả thực đã mang đến một góc nhìn và bước nhảy vọt mới cho tương lai của lĩnh vực sản xuất điện thoại có khả năng uốn dẻo linh hoạt, thậm chí gập đôi màn hình.</p><div class="VCSortableInPreviewMode GifPhoto" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 570px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_e1ef2040-c5bb-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/lenovo-bendy-phone-slower-1482132140961.gif" rel="http://genknews.genkcdn.vn/2016/lenovo-bendy-phone-slower-1482132140961.gif" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><p style="font-size: 17px;vertical-align: baseline;"></p><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 550px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Chưa xét đến những cuộc chạy đua gắt gao về cấu hình và phần cứng cao cấp, nhưng thiết kế và vẻ ngoài hình khối của những chiếc điện thoại hiện nay đã và đang làm cộng đồng người tiêu dùng cảm thấy hời hợt và nhàm chán hơn. Đó là lý do tại sao công nghệ chế tạo mới này sẽ châm một ngòi nổ mới cho nền công nghiệp di động, kể cả khi vẫn có thể còn tồn tại những thiếu sót ban đầu trong quá trình hiện thực hóa.</p><hr style="text-align: justify;font-size: 17px;"/><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><strong style="font-size: inherit;vertical-align: baseline;"><b>Điều gì làm nên sức hấp dẫn của điện thoại uốn gập?</b></strong></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Về cơ bản, mọi người luôn cảm thấy có một sức hút độc đáo từ thiết kế kể trên là do quan điểm cố hữu về việc những sản phẩm trong phân khúc và thể loại đó vốn chưa bao giờ có khả năng như vậy, ít nhất là phải đi kèm với một cơ chế bản lề tinh vi phức tạp. Nhưng liệu còn có yếu tố nào nữa ngoài việc đặt ra một thử thách mới cho các nhà khoa học và thiết kế để người ta dồn sự chú ý của mình vào đó đến như vậy?</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Thực tế là vẫn còn! Cấu tạo gập giúp bạn thu nhỏ và tăng thêm sự tiện dụng cho thiết bị của mình khi mang theo bên người, với tỷ lệ thu nhỏ có thể lên đến gấp đôi. Ngoài ra, chúng có có tiềm năng sản xuất trên quy mô lớn và dễ chế tạo, lắp ghép hơn cho tổng thể toàn bộ thiết bị. Đây là nhận định của Roel Vertegaal, chủ Phòng nghiên cứu tại Đại học Queens (Canada) khi làm việc với các phát kiến tương tự.</p><div class="VCSortableInPreviewMode" id="videoid_20622" type="VideoStream" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"><div class="VideoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;"><p class="NLPlaceholderShow" style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">Điện thoại uốn dẻo chơi nhạc</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Bên cạnh đó, những hình thức cấu tạo thiết bị mới cũng sẽ tiếp tay mở ra thêm nhiều mục đích và cách thức sử dụng của cộng đồng người dùng công nghệ trên nền tảng, như một loại hình thao tác trong game mới, hoặc sử dụng chính cơ chế uốn cong để thực hiện tác vụ nào đó như video minh họa trên.</p><hr style="text-align: justify;font-size: 17px;"/><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><strong style="font-size: inherit;vertical-align: baseline;"><b>Chiếm lĩnh ưu thế</b></strong></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Nếu thiết kế màn hình uốn gập không có tiềm năng và sức hút lớn thì chẳng có nghĩa gì nó lại khiến nhiều công ty bỏ tiền và công sức ra phát triển đến như vậy. Tuy nhiên, sự thật là chúng ta hiếm khi nào dự đoán chính xác được tuổi thọ bền vững của một xu hướng công nghệ nào, cách nó đến cũng như đi khỏi thị hiếu của người tiêu dùng.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_6a82f670-c5bc-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/lg-g-flex-2-0212-1482132370834.jpg" rel="http://genknews.genkcdn.vn/2016/lg-g-flex-2-0212-1482132370834.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Dù vậy, ở đâu đó vẫn luôn có một lợi thế và ưu điểm nhất định dành cho kẻ chinh phục được sớm nhất và có nhiều kinh nghiệm kiểm soát, tùy chỉnh công nghệ đó kể từ khi cộng đồng công nghệ trên toàn thế giới dần nhận thức và biết đến.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Cụ thể, Samsung có thể là cái tên nắm giữ vị trí đó nếu họ là công ty đầu tiên giới thiệu thiết bị có khả năng uốn gập.<i style="font-size: inherit;vertical-align: baseline;"><i> &#34;Samsung nhiều khả năng sẽ ''lấy công chuộc tội'' sau sự cố trên thị trường di động vừa qua,&#34;</i></i> phát biểu bởi Wayne Lam, chuyên gia phân tích tại IHS Markit.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Thực ra thì điều khiến chúng ta cảm thấy hứng thú nhất lại là những phong trào mới mẻ đã và đang luôn được khởi xướng dành cho lĩnh vực công nghệ, thúc đẩy những góc nhìn độc đáo hơn bao giờ hết, kể cả khi phải trải qua cả một quá trình thử thách trắc trở để quyết định xem đâu mới xứng đáng là thứ được giữ lại và phát triển. Xét cho cùng, đây chính là yếu tố làm nên những sản phẩm ngày càng tuyệt vời hơn, mang đến cả thế giới công nghệ trong tay bạn.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Tham khảo: Cnet</i></i></p><div class="VCSortableInPreviewMode link-content-footer IMSCurrentEditorEditObject" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Rất nhiều những lĩnh vực trên thế giới, đặc biệt là công nghệ, luôn chứng kiến những bước đổi thay và khám phá không ngừng trong thiết kế và chế tạo.', '/api/posts/4/avatar/', 'APPROVED', '2016-12-20 17:08:29', 4, 4, 1),
(5, 'Giải quyết kê đơn kháng sinh ẩu bên trong bệnh viện đã khó, bên ngoài còn khó hơn nhiều', '<p style="text-align: justify;"><a href="http://genk.vn/khang-khang-sinh.htm" target="_blank" title="Kháng kháng sinh" style="font-size: inherit;vertical-align: baseline;color: blue;">Kháng kháng sinh</a> <span style="font-size: 17px;">là hiện tượng xảy ra khi vi khuẩn gây bệnh không bị tiêu diệt bởi thuốc kháng sinh. Nó kéo theo đó rất nhiều hệ quả tai hại, bao gồm: việc khó khăn hơn trong điều trị các bệnh nhiễm khuẩn, tăng chi phí chăm sóc sức khỏe. Bệnh nhân sẽ phải điều trị dài hạn hơn và cũng tăng khả năng tử vong cao hơn nếu kháng sinh mất tác dụng.</span>​</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Kháng kháng sinh được thúc đẩy bởi rất nhiều yếu tố. Nhưng quan trọng nhất phải kể đến vấn đề kê đơn. Bệnh nhân có thể nhận được những đơn thuốc kháng sinh “<i style="font-size: inherit;vertical-align: baseline;"><i>kê ẩu</i></i>”. Điều này bao gồm: sử dụng kháng sinh không cần thiết, sử dụng kháng sinh sai loại, không đúng liều lượng và thời gian điều trị.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 650px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="&lt;br /&gt;Kê đơn ẩu đang khiến tình trạng kháng kháng sinh ngày càng phát triển&lt;br /&gt;" id="img_d9093010-3b96-11e6-903b-bda170b64b36" src="http://genknews.genkcdn.vn/thumb_w/640/https://genknews.vcmedia.vn/2016/image-20160614-22388-nb92ko-1466942829091.jpg" rel="https://genknews.vcmedia.vn/2016/image-20160614-22388-nb92ko-1466942829091.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 502px;"><p style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">&#34;Kê đơn ẩu&#34; đang khiến tình trạng kháng kháng sinh ngày càng phát triển</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đáng nói, tình trạng này diễn ra không chỉ bên trong bệnh viện mà còn phức tạp hơn ở cả những cơ sở ngoại trú như phòng khám, hiệu thuốc tư nhân. Trong khi chúng ta có thể hạn chế “<i style="font-size: inherit;vertical-align: baseline;"><i>kê đơn ẩu</i></i>” trong bệnh viện một cách tương đối dễ bằng những chương trình quản lý kháng sinh, điều tương tự dường như bất khả thi đối với các cơ sở ngoại trú.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hãy cùng tìm hiểu xem tình trạng này có thể được giải quyết như thế nào bên trong và ngoài bệnh viện:</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><strong style="font-size: inherit;vertical-align: baseline;"><b>Trong bệnh viện</b></strong></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Kháng kháng sinh thường được nhắc đến là một “<i style="font-size: inherit;vertical-align: baseline;"><i>vấn đề toàn cầu</i></i>”. Những dữ liệu về kháng kháng sinh thường được tổng hợp trên phạm vi quốc gia và khu vực. Nhưng có một điểm xuất phát của kháng sinh mà chúng ta đang bỏ qua, đó là trên từng đơn thuốc của bác sĩ.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Những số liệu trên quy mô quốc gia hoặc toàn cầu có thể khiến bệnh viện và các bác sĩ “<i style="font-size: inherit;vertical-align: baseline;"><i>phủ nhận</i></i>” vai trò trong mỗi lần kê đơn của mình. Ngược lại, điều đó cũng có nghĩa rằng chúng ta chỉ cần giải quyết vấn đề này. Cá nhân hóa kháng kháng sinh thay vì “<i style="font-size: inherit;vertical-align: baseline;"><i>toàn cầu hóa</i></i>” chúng, thay đổi thói quen kê đơn của bác sĩ có thể là một giải pháp tích cực.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Điều này đã được chứng minh thông qua hiệu quả của các chương trình quản lý kháng sinh trong bệnh viện ở Hoa Kỳ. Từ những năm 1990, Trường Dược Đại học Florida đã thành lập một chương trình quản lý kháng sinh trên 400 bệnh viện. Họ thu thập dữ liệu sử dụng kháng sinh của mỗi bệnh viện trong vòng ít nhất 3 năm.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Sau đó, dữ liệu được so sánh với mức đề kháng của một số loại vi khuẩn thường gây ra nhiễm trùng. Từ đây, nếu có một mối quan hệ giữa thói quen &#34;<i style="font-size: inherit;vertical-align: baseline;"><i>kê đơn ẩu</i></i>&#34; của bác sĩ trong bệnh viện với tình trạng kháng kháng sinh, nó sẽ được chỉ ra cụ thể. Bởi các dữ liệu là giấy trắng mực đen, các bệnh viện và bác sĩ sẽ phải nhận trách nhiệm của họ.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 650px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="&lt;br /&gt;Chúng ta cần các bác sĩ có trách nhiệm hơn trong việc kê đơn&lt;br /&gt;" id="img_888f88a0-3b96-11e6-903b-bda170b64b36" src="http://genknews.genkcdn.vn/thumb_w/640/https://genknews.vcmedia.vn/2016/bigstock-healthcare-hospital-and-medic-69239800-1466942691107.jpg" rel="https://genknews.vcmedia.vn/2016/bigstock-healthcare-hospital-and-medic-69239800-1466942691107.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 432px;"><p style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">Chúng ta cần các bác sĩ có trách nhiệm hơn trong việc kê đơn</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ví dụ thực tế về kết quả của chiến dịch này, Imipenem, một loại kháng sinh phổ rộng, đã được xem xét với vi khuẩn Pseudomonas. Chương trình phát hiện ra rằng nếu các trung tâm y tế không thay đổi cách mà bác sĩ kê đơn cho bệnh nhân, sức kháng kháng sinh của Pseudomonas sẽ tăng lên 1% cho mỗi 30 liều Imipenem trung bình cho người trưởng thành.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><strong style="font-size: inherit;vertical-align: baseline;"><b>Ngoài bệnh viện</b></strong></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Một khảo sát tại Hoa Kỳ cho thấy cứ 1.000 lượt khám ngoại trú thì có đến 506 đơn kháng sinh được kê. Tuy nhiên, trong số này chỉ có 69.7% đơn thuốc hợp lý. Số còn lại được tính vào lạm dụng kháng sinh. Thông thường, đó sẽ là những bệnh như viêm phế quản, viêm xoang, viêm họng sẽ tự khỏi. Nhiều trường hợp bệnh gây ra bởi virus nên kháng sinh không có tác dụng điều trị.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ở Việt Nam, tuy chưa có một khảo sát tương tự, nhưng chúng ta cũng có thể dựa vào một số thống kê để nhận định vấn đề. Hiện tại, có khoảng hơn 30.000 cơ sở bán thuốc tư nhân trên toàn quốc. Một khảo sát của Bộ Y tế cho thấy có tới 91% nhà thuốc ở nông thôn và 80% nhà thuốc ở thành thị bán kháng sinh mà không cần đơn thuốc.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Do đó, để thực sự chiến đấu trong cuộc chiến chống kê đơn bừa bãi, chúng ta cần phải nhắm đến đối tượng là những cơ sở ngoại trú. Đáng tiếc, dường như điều này đang ở ngoài tầm với khi những đơn thuốc đang được kê mà thiếu sự kiểm soát.</p><div class="VCSortableInPreviewMode IMSCurrentEditorEditObject" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 620px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="&lt;br /&gt;Bán kháng sinh, dược sĩ vừa tạo thêm lợi nhuận cho mình lại vừa có thể làm hài lòng khách hàng&lt;br /&gt;" id="img_b59f2da0-3b96-11e6-903b-bda170b64b36" src="https://genknews.vcmedia.vn/2016/amma-med-shop-1466942770062.jpg" rel="https://genknews.vcmedia.vn/2016/amma-med-shop-1466942770062.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 600px;"><p style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">Bán kháng sinh, dược sĩ vừa tạo thêm lợi nhuận cho mình lại vừa có thể làm hài lòng khách hàng</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ngoài ra, có một điểm mấu chốt ở đây. Nhiều khi, việc bác sĩ kê kháng sinh trong đơn thuốc dưới sự ảnh hưởng và áp lực đến từ chính người bệnh. Họ yêu cầu và “<i style="font-size: inherit;vertical-align: baseline;"><i>hài lòng</i></i>” hơn khi có kháng sinh.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ví dụ thế này, một bệnh nhân bị viêm phế quản. Anh ta quyết định sẽ đi đến bệnh viện, hoặc một cơ sở khám bệnh ngoại trú, hoặc thậm chí chỉ là một tiệm thuốc. Để làm được điều đó, anh ta đã phải xin nghỉ làm một buổi sáng và giết thời gian ở phòng chờ.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đến lượt mình, với bệnh viêm phế quản, vị bác sĩ chỉ dành khoảng 3-5 phút để nói rằng anh nên nghỉ ngơi một chút, uống nhiều nước và sử dụng thuốc hạ sốt. Anh ta cảm thấy việc mình đầu tư quá nhiều cho buổi khám bệnh, như vậy là chưa thỏa đáng.</p>', 'Bán kháng sinh, dược sĩ vừa tạo thêm lợi nhuận cho mình lại vừa có thể làm hài lòng khách hàng.', '/api/posts/5/avatar/', 'APPROVED', '2016-12-20 17:12:58', 2, 5, 3),
(6, 'Samsung Electronics đặt mục tiêu 25 tỷ USD lợi nhuận trong năm 2017', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Nguồn tin từ Hàn Quốc cho biết Samsung đang tổ chức một cuộc họp chiến lược toàn công ty trong tuần này. Cuộc họp sẽ quyết định các chính sách phát triển của Samsung Electronics nhằm đạt mục tiêu lợi nhuận 25 tỷ USD trong năm tài chính tới.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 600px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_c6233d40-c68f-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/ss1-1482223143024.jpg" rel="http://genknews.genkcdn.vn/2016/ss1-1482223143024.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 580px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Chủ tịch Shin Jong-kyun cũng đã chủ trì cuộc họp bộ phận công nghệ thông tin và truyền thông di động của Samsung ngày hôm qua. Hôm nay, cuộc họp của bộ phận điện tử tiêu dùng đã diễn ra với sự chứng kiến của CEO Yoon Boo-keun.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Theo kế hoạch, ngày mai Phó Chủ tịch Kwon Oh-hyun sẽ làm việc với bộ phận giải pháp thiết bị của công ty.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Samsung Electronics đã thiết lập được một kỷ lục trong lịch sử của mình khi đạt mức lợi nhuận hoạt động 30,95 tỷ USD vào năm 2013. Tính từ thời điểm đó đến nay, công ty vẫn chưa một lần vượt qua được cột mốc này.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Việc tăng giá màn hình và chất bán dẫn cùng với giá USD cao được xem là điều kiện tiên quyết giúp <a href="http://genk.vn/samsung-electronics.htm" target="_blank" title="Samsung Electronics" style="font-size: inherit;vertical-align: baseline;color: blue;">Samsung Electronics</a> đạt được mục tiêu lợi nhuận trong năm 2017 sắp tới.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hồi đầu năm, Samsung Electronics dự kiến sẽ mở ra một kỷ nguyên mới với doanh thu hơn 168 tỷ USD nhờ doanh số Galaxy Note7. Tuy nhiên, sự cố cháy nổ của chiếc flagship này lại khiến công ty tiêu tốn đến 5,89 tỷ USD và khó lòng đạt được chỉ tiêu đã đặt ra từ đầu năm.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Trong các cuộc họp trong tuần này, mỗi bộ phận của Samsung Electronics sẽ thảo luận các điều kiện thị trường cụ thể và quyết định chiến lược kinh doanh của năm 2017.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Tham khảo: Sammobile</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Samsung Electronics đang tiến hành cuộc họp toàn công ty để đưa ra chiến lược nhằm đạt mức lợi nhuận 25 tỷ USD trong năm tới.', '/api/posts/6/avatar/', 'APPROVED', '2016-12-20 17:20:34', 2, 6, 2),
(7, 'Số lượng người đang sử dụng Note7 vẫn cao hơn cả LG V20, HTC Bolt và OnePlus 3T', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><a href="http://genk.vn/note7.htm" target="_blank" title="Note7" style="font-size: inherit;vertical-align: baseline;color: blue;">Note7</a> đã là quá khứ, không còn quá nhiều câu chuyện trên các mặt báo hay trang tin nhắc đến siêu phẩm này của Samsung nữa. Thế nhưng cho đến hiện nay, vẫn còn rất nhiều người đang sử dụng chiếc smartphone này, bất chấp việc nó có thể phát nổ bất cứ lúc nào.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Theo thống kê cuối năm của hãng nghiên cứu thị trường di động Apteligent, số lượng người đang sử dụng Note7 trên toàn cầu vẫn còn cao hơn cả nhiều smartphone cao cấp ra mắt gần đây.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_f4fd2980-c664-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/photo-0-1482204756895.jpg" rel="http://genknews.genkcdn.vn/2016/photo-0-1482204756895.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Cụ thể, Apteligent đã thống kê những mẫu smartphone ra mắt vào nửa cuối năm 2016, cho thấy số lượng người dùng Note7 hiện đang cao hơn cả LG V20, HTC Bolt và OnePlus 3T. Những mẫu smartphone có số lượng người dùng cao hơn Note7 là Google Pixel, Sony Xperia XZ.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Thống kê này chỉ bao gồm các smartphone ra mắt vào nửa cuối năm 2016, do đó mà những chiếc smartphone ra mắt trước đó như Galaxy S7 và S7 edge cũng có thể có lượng người dùng vượt trội hơn hẳn.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_29f27190-c665-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/photo-0-1482204845894.jpg" rel="http://genknews.genkcdn.vn/2016/photo-0-1482204845894.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Sau sự cố với Note7, Samsung đã tiến hành thu hồi trên toàn thế giới và cũng có nhiều biện pháp để ngăn người dùng tiếp tục sử dụng. Một trong số đó là đưa ra lời cảnh báo liên tục cho những người vẫn đang sử dụng Note7, hay hạn chế lượng pin có thể sạc.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Mạnh tay hơn, Samsung còn tung ra bản cập nhật cho Note7 để chặn Wi-Fi và kết nối di động. Tại các thị trường Úc, Canada và New Zealand, những chiếc Note7 vẫn đang hoạt động hoàn toàn có thể bị biến thành cục gạch.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Tuy nhiên có vẻ như tất cả những điều đó vẫn chưa đủ để ngăn người dùng tiếp tục sử dụng chiếc smartphone này.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Tham khảo: androidauthority</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Bất chấp việc có thể phát nổ bất cứ lúc nào, vẫn có rất nhiều người đang sử dụng Note7.', NULL, 'PENDING', '2016-12-20 17:22:07', 1, 6, 1),
(8, 'Facebook bắt đầu cho phép tất cả mọi người đăng status trên nền màu sắc', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Facebook vẫn luôn gắn bó với 2 tone màu chủ đạo là xanh và trắng, chúng ta có thể thấy trang News Feed của mạng xã hội này chỉ có background là màu trắng. Tuy nhiên, Facebook đang cố gắng thay đổi để thu hút người dùng hơn bằng những màu sắc bắt mắt mới.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Cách đây ít ngày, Facebook đã tiến hành thử nghiệm một tính năng mới. Đó là cho phép người dùng đăng các status với nền background màu sắc. Một số người dùng chưa được cập nhật tính năng mới này sẽ không thể nhìn thấy sự khác biệt.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 450px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_41269fc0-c65c-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/3-1482201016683.png" rel="http://genknews.genkcdn.vn/2016/3-1482201016683.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 430px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Tuy nhiên ngày hôm nay, Facebook đã bắt đầu cho phép tất cả mọi người có thể đăng status với background là những màu sắc khác nhau bên cạnh màu trắng truyền thống. Bên cạnh đó, tất cả mọi người dù đã cập nhật hay chưa đều có thể nhìn thấy những màu sắc bắt mắt này.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Bạn có thể thay đổi màu sắc một cách dễ dàng bằng cách bấm vào biểu tượng của tính năng này ở bên trái khi bắt đầu viết status. Có tất cả 7 màu sắc khác nhau, trong đó có một số màu background chuyển tone trông hấp dẫn hơn.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 450px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_40e18070-c65c-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/2-1482201016682.png" rel="http://genknews.genkcdn.vn/2016/2-1482201016682.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 430px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hiện tại, tất cả người dùng Android đều đã được cập nhật tính năng mới. Trong khi đó, những người dùng iOS và nền web sẽ được cập nhật trong một vài ngày tới.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Tính năng mới này cũng là động thái nhằm lôi kéo người dùng, khuyến khích họ đăng tải nhiều status cá nhân hơn. Khi mà báo cáo hồi đầu năm cho thấy tỷ lệ người dùng đăng tải status đã giảm 21%.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 450px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_40a513b0-c65c-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/1-1482201016681.png" rel="http://genknews.genkcdn.vn/2016/1-1482201016681.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 430px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Facebook cũng khẳng định rằng họ sẽ cố gắng ưu tiên những bài đăng của bạn bè và người thân, thay vì quá nhiều thông tin khác xuất hiện trên News Feed như hiện nay. Mặc dù vậy, CEO Mark Zuckerberg cũng tin rằng những nội dung mới như video, 360 độ hay VR sẽ ngày càng trở nên phổ biến hơn.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Tham khảo: techcrunch</i></i></p></div>', 'Tất cả mọi người đều có thể thấy những status màu sắc bắt mắt trên News Feed, thay vì một background màu trắng nhàm chán như trước đây.', NULL, 'PENDING', '2016-12-20 17:27:16', 3, 7, 4);
INSERT INTO `post` (`id`, `title`, `content`, `decription`, `avatar`, `status`, `created_date`, `view`, `author_id`, `category_id`) VALUES
(9, 'Amazon lần đầu tiên vận chuyển sản phẩm bằng drone đến tận cửa nhà khách hàng', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Khoảng 3 năm trước, trên một số phát sóng của show truyền hình 60 Minutes, CEO Jeff Bezos của Amazon đã tiết lộ công ty sẽ sớm đưa drone vào sử dụng để vận chuyển các kiện hàng và sản phẩm trong giới hạn đến 2,3kg để đưa đến tận cửa nhà người đặt mua chỉ trong 30 phút là nhiều nhất. Ông thậm chí còn cho công chúng xem thiết kế drone 8 động cơ được trang trí logo Amazon 2 màu đen vàng rất ấn tượng và hứa hẹn. 3 năm trôi qua, sau nhiều bước cải tiến về công nghệ và cả những lần đệ trình giấy phép lên Cục Hàng không Liên bang Mỹ (FAA), cuối cùng kế hoạch của Amazon đã được hiện thực hóa qua những bước đi chập chững đầu tiên.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_03eeab90-c2ae-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/prime-air-04-1481796318137.jpg" rel="http://genknews.genkcdn.vn/2016/prime-air-04-1481796318137.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ngày 14/12 vừa qua, Jeff Bezo đã tuyên bố Amazon đã chính thức hoàn thành chuyến giao hàng đầu tiên của mình bằng drone. Thực chất, lần vận chuyển này diễn ra vào ngày 7/12, là một phần trong chương trình riêng tư dành cho khách hàng thử nghiệm dịch vụ, diễn ra tại Cambridge, Anh Quốc. Toàn bộ quá trình giao hàng diễn ra trong 13 phút, từ lúc khách hàng xác nhận mua cho tới khi drone hạ cánh trên bãi cỏ trước nhà họ với kiện hàng. Amazon mới đây cũng tung ra một video ghi lại khoảnh khắc này, và Jeff Bezos đã đưa lên Twitter của mình ngay sau đó.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Theo lời dẫn từ video, chương trình thử nghiệm drone mới chỉ áp dụng cho 2 khách hàng tính đến nay, và sẽ dần tăng lên hàng chục, trăm người trong vài tháng sắp tới.</p><div class="VCSortableInPreviewMode" id="videoid_20585" type="VideoStream" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"><div class="VideoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;"><p class="NLPlaceholderShow" style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">First Prime Air Delivery</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Quy trình giao hàng được tính toán như sau: Amazon có hàng ngàn điểm lưu trữ và phân phối hàng hóa, phục vụ cho từng khu vực địa lý đa dạng khác nhau. Nếu có bất kỳ khách hàng nào đặt mua một món hàng có sẵn tại khu vực đó ở thời điểm hiện tại, quy trình Amazon Prime Air sẽ được kích hoạt, đồng nghĩa với việc sử dụng drone để giao hàng. Sau đó, gói hàng sẽ được chuyển từ một băng chuyền đến gắn vào drone đang chờ sẵn phục vụ. Và mọi việc còn lại chỉ là chờ đợi khách hàng nhận được sản phẩm.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Độ cao vận hành của drone là dưới 120m do đó sẽ không gây ảnh hưởng đến các chuyến bay hay hoạt động hàng không khác. Quãng đường bay rơi vào khoảng 16km kể từ điểm xuất phát, áp dụng công nghệ GPS định vị và xác định hướng đi, và khối lượng hàng không quá 2,3kg (86% hàng hóa trên Amazon đủ tiêu chuẩn vận chuyển này).</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Vẫn còn một số công đoạn khác nữa để Amazon Prime Air được hoàn toàn chấp thuận bởi FAA tại Mỹ, đó là lý do tại sao chương trình thử nghiệm này lại diễn ra tại Anh trước. Nhưng dù sao đi nữa, đây chỉ còn là vấn đề về mặt thời gian trước khi nó được đưa vào sử dụng rộng rãi như những loại hình phổ biến khác mà thôi.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Tham khảo: Mashable</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Một bước tiến tiên phong trong hình thức vận chuyển hàng hóa đến tay khách hàng của ông lớn bán lẻ trực tuyến Amazon.', NULL, 'APPROVED', '2016-12-20 17:30:32', 3, 7, 5),
(10, 'Thật tuyệt vời, Nokia Lumia 520 chạy mượt được Android 7.1 Nougat', '<div><p style="text-align: justify;"><span style="font-size: 17px;">Mới đây, một người dùng Youtube Việt Nam tên “nguyen thinh” đã đăng tải một video trình diễn phiên bản hệ điều hành Android 7.1 Nougat hoạt động trơn tru trên thiết bị Nokia Lumia 520. Video ngay lập tức đã gây được chú ý đến cộng đồng phát triển thế giới khi nó được chính trang công nghệ chuyên về di động Phonearena</span> <a class="link-inline-content" href="http://www.phonearena.com/news/See-an-old-Lumia-520-running-Android-7.1-Nougat_id89000" rel="nofollow" target="_blank" style="font-size: inherit;vertical-align: baseline;color: blue;">dẫn tin.</a>​</p><div class="VCSortableInPreviewMode" id="videoid_20577" type="VideoStream" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"><div class="VideoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;"><p class="NLPlaceholderShow" style="text-align: justify;font-size: 13.8px;vertical-align: baseline;">Lumia 520 running Android 7.1 Nougat</p></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Điều đáng chú ý ở đây là phiên bản Android 7.1 Nougat hoạt động trên Lumia 520 đã được thiết lập ngôn ngữ hiển thị là Tiếng Việt. Do đó, có thể thấy lập trình viên này là người Việt Nam và đang trong quá trình hoàn thành bản rom Android 7.1 Nougat cho Lumia 520.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Nhắc đôi chút về Nokia Lumia 520, đây là mẫu smartphone Windows Phone 8 giá rẻ 4-inch, 512MB RAM của Nokia được ra mắt từ năm 2013, và mẫu smartphone này chỉ được hỗ trợ nâng cấp chính thức lên phiên bản Windows Phone 8.1 sau một năm kể từ ngày phát hành. Và từ đó cho đến nay, nó đã rơi vào quên lãng khi không được nằm trong danh sách cập nhật lên phiên bản Windows 10 Mobie.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_14987040-c1fd-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/1-1481720324854.jpg" rel="http://genknews.genkcdn.vn/2016/1-1481720324854.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hi vọng sắp tới khi bản rom chính thức được hoàn thiện và phát hành, chắc hẳn đây sẽ là một làn gió tuyệt vời dành cho cộng đồng Lumia Việt Nam sau thời gian khá thất vọng với Windows 10 Mobile.</p></div>', 'Có thể bạn sẽ không tin vào mắt mình nhưng đây hoàn toàn là sự thật.', '/api/posts/10/avatar/', 'APPROVED', '2016-12-20 17:38:17', 4, 8, 7),
(11, 'Tim Cook là một trong những CEO “có giá” nhất thế giới', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Bảng xếp hạng mới của hãng tin Bloomberg đã đánh giá “Những CEO giá trị nhất thế giới”, cho thấy mức lương hàng năm của các CEO tương xứng như thế nào với hiệu quả điều hành của họ tại mỗi công ty.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 600px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_cb4a5c90-c1ad-11e6-886d-9942ae81e112" src="http://genknews.genkcdn.vn/2016/tim-cook-1481682394279-crop-1481682428078-1481686283501.jpg" rel="http://genknews.genkcdn.vn/2016/tim-cook-1481682394279-crop-1481682428078-1481686283501.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 580px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đã có 100 CEO đến từ các công ty trên khắp thế giới lọt vào danh sách này – trong đó có Apple, Alphabet (chính là Google), Verizon, và China Mobile.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Theo danh sách, CEO Tim Cook của Apple là CEO có giá thứ 11 trên thế giới. Tim Cook nhận mức thu nhập 10,3 triệu USD, “rất hời” khi so với lợi nhuận trung bình mà Apple thu về trong 3 năm là 22,6 triệu USD.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Thu nhập của Cook đến từ mức lương 2 triệu USD, thưởng 8 triệu USD và các khoản đền bù khác là 281.327 USD. Cook sở hữu trên 1,2 triệu cổ phiếu Apple, trị giá trên 130 triệu USD sau khi làm CEO Apple 5 năm, kể từ ngày 24/8/2011.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Bảng xếp hạng của Bloomberg bao gồm các công ty có giá trị thị trường 1 tỷ USD hoặc cao hơn, và mỗi CEO đã có 3 hoặc hơn 3 năm nắm giữ vị trí này.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Liệu các CEO đã nhận được khoản thu nhập xứng đáng? Theo nhận xét, con số 10 triệu USD của CEO Tim Cook Apple là một món hời khi so với lợi nhuận kinh tế trung bình của Apple trong 3 năm qua.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">CEO giá trị số 1 thế giới là Kosta Kartsotis của tập đoàn Fossil Group, người nắm giữ số cổ phần trị giá hơn 200 triệu USD của công ty. CEO Larry Page của Alphabet đứng thứ 3.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Theo ICTnews</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'CEO Larry Page của Alphabet đứng thứ 3 và Tim Cook đứng thứ 11 trong danh sách những CEO có giá trị nhất thế giới.', '/api/posts/11/avatar/', 'APPROVED', '2016-12-20 17:42:00', 2, 8, 5),
(12, 'Đừng hoàn toàn tin tưởng vào công cụ tìm kiếm của Google, thử tìm cụm "giá Galaxy S8" là hiểu', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Google là một công cụ tìm kiếm với lượng người dùng lớn nhất hành tinh hiện nay, đồng thời các thuật toán, mạng lưới cũng như trí tuệ nhân tạo chính là những yếu tố giúp tạo nên sự thành công của Google – Nhưng đi kèm với cái tốt luôn có cái xấu, ngoài những tin có giá trị “dùng được”, những loại tin tức nhảm nhí cũng không ít, từ đó khiến người dùng nhận được những thông tin sai lệch trong quá trình tìm kiếm bằng G</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Chắc hẳn nhiều bạn đọc đã nghe về vụ việc Facebook đang kiểm soát hàng loạt tin tức giả mạo xuất hiện trên newsfeed cá nhân của chúng ta. Chuyên ngỡ như đùa, nhưng &#34;tin giả&#34; có thể gây hiệu ứng “mang tính toàn cầu”, việc này thể hiện rất rõ qua đợt bầu cử tổng thống Mĩ vừa qua, chỉ cần một tin tức sai sự thật xuất hiện trên newsfeed Facebook, mọi chuyện sẽ đi sai chiều hướng và thậm chí kết quả bầu cử tại Mỹ cũng có thể bị lật ngược.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Vấn đề “tin giả” có thể ở bất kì lĩnh vực nào, từ chính trị, cho đến khoa học, kĩ thuật, công nghệ….Và lần này, hãy lấy ví dụ về kết quả tìm kiếm của từ khóa “Galaxy S8 price” khi tìm kiếm trên Google – Hàng loạt kết quả của các website có “tin giả” hiện ra, khiến người dùng sẽ nghĩ đây sẽ là những thông số thật sự của Galaxy S8.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_4fac7a40-bd6c-11e6-8745-47b7c39f5a4b" src="http://genknews.genkcdn.vn/thumb_w/640/2016/1-1481218353100.png" rel="http://genknews.genkcdn.vn/2016/1-1481218353100.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Vấn đề đầu tiên cần quan tâm: Kết quả đề xuất đầu tiên là một “bảng” về cấu hình, cũng như giá của Galaxy S8 hiện ra trên trang tìm kiếm Google – Gợi ý đầu tiên sẽ khiến nhiều người chú ý, bỏ qua các kết quả tìm kiếm khác và tại sao công cụ tìm kiếm từ Google lại muốn chúng ta chú ý vào thông tin giả này???</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Ngoài ra, còn điều gì nữa? Với “bảng” cấu hình bên trên, kể cả một cậu bé 15 tuổi có một chút hiểu biết về công nghệ sẽ vẫn có thể đánh lừa Google và thực hiện việc gợi ý website giải mạo tương tự. Riêng trong trường hợp vừa đề cập, Google đáng lẽ phải trả về một kết quả liên quan các website đưa tin “Samsung vẫn chưa ra mắt Galaxy S8” mới được gọi là thông tin hữu ích.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Thuật toán hiện nay vẫn chưa đủ thông minh, tất cả những thông tin, kết quả tìm kiếm Google gợi ý cho người dùng với từ khóa &#34;Galaxy S8 price&#34; chỉ là dự đoán từ những bài báo tin đồn. Ngoài ra, hãy thử đến từ khóa tiếp theo: “iPhone 8 Price”, một bảng kết quả trả về tương tự như thế, thậm chí dù là “thông tin giả”, nhưng thoạt nhìn lại còn thuyết phục hơn cả kết quả tìm kiếm của từ khóa trước với hình ảnh thiết kế lung linh,</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_5852fc50-bd6c-11e6-8745-47b7c39f5a4b" src="http://genknews.genkcdn.vn/thumb_w/640/2016/2-1481218367419.png" rel="http://genknews.genkcdn.vn/2016/2-1481218367419.png" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Những điều vừa đề cập bên trên đang là tình trạng báo động, hi vọng Google sẽ không chỉ khắc phục vấn đề sai lệch mà còn phải chỉnh sửa thuật toán để cải thiện mức độ chính xác trong các kết quả trả về. Lượng người sử dụng đông đảo và là công cụ phổ biến nhất hành tinh, Google phải hành động càng sớm càng tốt.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Tham khảo Phone Arena</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Chắc hẳn không ai xa lạ với việc sử dụng Google để tìm kiếm mọi thông tin, nhưng công nghệ càng phát triển, vấn đề sai lệch thông tin càng là vấn nạn cần được cảnh báo', '/api/posts/12/avatar/', 'APPROVED', '2016-12-20 17:47:19', 2, 9, 4),
(13, 'Apple Watch đời mới hóa "cục gạch" sau khi nâng cấp lên watchOS 3.1.1', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Phiên bản watchOS 3.1.1 cũng chỉ mới vừa chính thức được tung ra vào ngày hôm qua, tất cả các mẫu Apple Watch đều có thể nâng cấp được, kể cả các model ra mắt từ tháng 4/2015. Tuy nhiên, một số người dùng Apple Watch Series 2 khá &#34;xui xẻo&#34; khi update watchOS mới, thiết bị của họ đột nhiên bị brick và màn hình hiển thị thông báo như hình dưới.</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_e22b1230-c165-11e6-886d-9942ae81e112" src="http://genknews.genkcdn.vn/thumb_w/640/2016/1-1481655397683.jpg" rel="http://genknews.genkcdn.vn/2016/1-1481655397683.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Vậy nếu chẳng may vướng phải, làm sao giải quyết vấn đề này? Chỉ còn cách gửi Apple Watch Series 2 về Apple để bảo hành, bởi bạn không thể tự xử lý được.: Vì không có file IPSW để restore cũng như Apple Watch không có cổng kết nối cáp USB, việc tự mày mò sửa chữa là bất khả thi</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hãy đem ngay Apple Watch Series 2 ra trung tâm Apple nếu thiết bị gặp lỗi, ngoài ra nếu gần nhà không có cửa hàng ủy quyền của Apple, hãy gửi chuyển phát đến các trung tâm sửa chữa và bảo hành được ủy quyền.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Đối với những trường hợp &#34;may mắn&#34; hơn, thời gian cài đặt bản cập nhật cực lâu, nhưng vẫn không hoàn thành được quá trình nâng cấp. Một số khác phải cài đặt lại 2 lần mới có thể hoạt động bình thường, tuy nhiên người dùng Apple Watch Series 1 hoặc các phiên bản Apple Watch gốc hiện tại chưa có trường hợp bị ảnh hưởng</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Theo Wccftech</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Ngày hôm qua, nhiều người dùng update watchOS 3.1.1 cho Apple Watch Series 2 thì gặp hiện tượng brick.', '/api/posts/13/avatar/', 'APPROVED', '2016-12-20 17:50:46', 2, 9, 7),
(14, 'Có hai kiểu sếp "tồi", vậy sếp bạn thuộc loại nào?', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>*Lưu ý: Bài viết hoàn toàn vì mục đích khoa học, không nhằm công kích bất kỳ ai. Bạn có thể share thoải mái.</i></i></p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Sếp của bạn thời điểm hiện tại là người như thế nào? Nếu là sếp tốt, bạn quả là người may mắn. Nhưng trên thực tế, hiếm ai trải qua quãng đời &#34;đi cày&#34; mà không gặp phải ít nhất một vị sếp có thể khiến thời gian làm việc của bạn trở nên... khốn khổ.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Và theo như một nghiên cứu mới đây thì nếu như bạn có một vị sếp kinh khủng, khả năng lớn là người này sẽ rơi vào một trong hai loại sau đây: loại... rối loạn chức năng (dysfunctional), hoặc cực kỳ đen tối (dark).</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 634px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_32c36890-c671-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/2016/photo-0-1482210014055.jpg" rel="http://genknews.genkcdn.vn/2016/photo-0-1482210014055.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 614px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Cụ thể, các chuyên gia từ ĐH Binghampton và ĐH New York (Mỹ) đã thiết lập một tiêu chuẩn để xác định đâu là sếp tồi và những hành vi đặc biệt của họ. Kết quả, sếp tồi thường chỉ rơi vào hai loại vừa nêu trên.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Theo tiến sĩ Seth Spain - chủ nhiệm nghiên cứu: <i style="font-size: inherit;vertical-align: baseline;"><i>&#34;Họ chẳng làm hại bạn. Nhưng vì kỹ năng không đủ hoặc do tính cách, họ làm việc không được tốt lắm. Đó chính là những ông sếp... phiên bản lỗi, hay còn gọi là sếp rối loạn chức năng&#34;</i></i>.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Mấy vị sếp đen tối thì khác. Họ có tính cách phải gọi là... huỷ diệt, luôn tìm cách dìm người khác để nâng bản thân lên. Theo Spain, họ có 3 đặc điểm được gọi là &#34;bộ tam đen tối&#34;: thủ đoạn, tự cao, và hơi... tâm thần.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>&#34;Họ thích nhìn người khác đau khổ - thế nên họ sẽ rất xấu tính, thích bắt nạt và can thiệp vào đời sống nhân viên&#34;</i></i> - Spain cho biết.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Và dù là rơi vào loại nào, thì sếp tồi luôn là lý do khiến nhân viên gặp stress trong công việc.<i style="font-size: inherit;vertical-align: baseline;"><i>&#34;Cấp trên trực tiếp chính là một trong những nguyên nhân gây stress cho cấp dưới của họ.&#34;</i></i>- Spain chia sẻ.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Mục đích của nghiên cứu này là nhằm hiểu hơn về hành vi của các sếp, qua đó tìm cách giảm thiểu căng thẳng tại nơi làm việc. Theo Spain: <i style="font-size: inherit;vertical-align: baseline;"><i>&#34;Chúng tôi tin rằng hiểu được những đặc tính của sếp là rất quan trọng để phát triển sự nghiệp của bản thân. Nhất là khi một ông sếp tồi thực sự rất đáng lo ngại&#34;</i></i>.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Trí thức trẻ</i></i></p><div class="VCSortableInPreviewMode link-content-footer" type="link-content-footer" style="font-size: 17px;vertical-align: baseline;text-align: center;width: 650px;"></div></div>', 'Nếu bạn có một người sếp tốt, bạn quả là người may mắn. Nhưng hiếm ai trong cả cuộc đời làm việc không gặp phải một ông sếp tồi bao giờ.', '/api/posts/14/avatar/', 'APPROVED', '2016-12-20 17:55:09', 2, 10, 2),
(15, 'Samsung tuyên bố đã biết nguyên nhân khiến Galaxy Note7 phát nổ nhưng chưa sẵn sàng tiết lộ', '<div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Một khoảng thời gian khá dài sau khi thu hồi hai lần và cuối cùng khai tử Note7, Samsung vẫn không thể nào tái tạo được một vụ nổ Note7 trong phòng thí nghiệm nhằm tìm ra nguyên nhân. Nhưng nay, gã khổng lồ Hàn Quốc thông báo rằng đã tìm ra nguyên nhân khiến họ bị tổn thất tới 5 tỷ USD doanh thu cộng với các chi phí khác..</p><div class="VCSortableInPreviewMode" type="Photo" style="font-size: inherit;vertical-align: baseline;text-align: center;width: 640px;"><i></i><div style="text-align: justify;font-size: inherit;vertical-align: baseline;"><img alt="" id="img_fe2b13f0-c407-11e6-8431-abecdbba0613" src="http://genknews.genkcdn.vn/thumb_w/640/2016/6e9a2144b789f3fd1cbf202cd2ae053f-1481944926718.jpg" rel="http://genknews.genkcdn.vn/2016/6e9a2144b789f3fd1cbf202cd2ae053f-1481944926718.jpg" type="photo" style="font-size: inherit;vertical-align: bottom;"/></div><div class="PhotoCMS_Caption" style="font-size: inherit;vertical-align: baseline;text-align: left;width: 620px;"></div></div><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Samsung chia sẻ rằng họ đã chia sẻ kết quả điều tra nội bộ của mình với công ty nghiên cứu an toàn UL và Phòng thử nghiệm Hàn Quốc. Cách đây không lâu, gã khổng lồ Hàn Quốc tuyên bố rằng sẽ tiết lộ nguyên nhân khiến Galaxy Note7 phất nổ trước khi năm 2016 kết thúc. Tuy nhiên, mới đây, họ lại thông báo rằng đã biết nguyên nhân nhưng chưa sẵn sàng tiết lộ.</p><p style="text-align: justify;font-size: 17px;vertical-align: baseline;">Hồi đầu tháng, một báo cáo của bên thứ ba đã chỉ ra rằng chính lỗi thiết kế của pin sử dụng trong Note7 đã khiến thiết bị này phát nổ. Chính yêu cầu pin mỏng nhưng vẫn có dung lượng cao nhằm duy trì thiết kế mỏng và thời lượng pin lâu dài cho Note7 của Samsung đã khiến họ gặp họa.</p><p style="text-align: right;font-size: 17px;vertical-align: baseline;"><i style="font-size: inherit;vertical-align: baseline;"><i>Theo Phone Arena</i></i></p></div>', 'Gã khổng lồ Hàn Quốc cho rằng đây chưa phải là thời điểm phù hợp để công bố nguyên nhân khiến một trong những smartphone chủ lực trong năm 2016 của họ bị khai tử.', '/api/posts/15/avatar/', 'APPROVED', '2016-12-20 18:00:24', 6, 10, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comment_user_id` (`user_id`),
  ADD KEY `fk_comment_post_id` (`post_id`);

--
-- Indexes for table `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jhi_authority`
--
ALTER TABLE `jhi_authority`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `jhi_persistent_audit_event`
--
ALTER TABLE `jhi_persistent_audit_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `idx_persistent_audit_event` (`principal`,`event_date`);

--
-- Indexes for table `jhi_persistent_audit_evt_data`
--
ALTER TABLE `jhi_persistent_audit_evt_data`
  ADD PRIMARY KEY (`event_id`,`name`),
  ADD KEY `idx_persistent_audit_evt_data` (`event_id`);

--
-- Indexes for table `jhi_persistent_token`
--
ALTER TABLE `jhi_persistent_token`
  ADD PRIMARY KEY (`series`),
  ADD KEY `fk_user_persistent_token` (`user_id`);

--
-- Indexes for table `jhi_social_user_connection`
--
ALTER TABLE `jhi_social_user_connection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`provider_id`,`provider_user_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`provider_id`,`rank`);

--
-- Indexes for table `jhi_user`
--
ALTER TABLE `jhi_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `idx_user_login` (`login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `idx_user_email` (`email`);

--
-- Indexes for table `jhi_user_authority`
--
ALTER TABLE `jhi_user_authority`
  ADD PRIMARY KEY (`user_id`,`authority_name`),
  ADD KEY `fk_authority_name` (`authority_name`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_author_id` (`author_id`),
  ADD KEY `fk_post_category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jhi_persistent_audit_event`
--
ALTER TABLE `jhi_persistent_audit_event`
  MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `jhi_social_user_connection`
--
ALTER TABLE `jhi_social_user_connection`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jhi_user`
--
ALTER TABLE `jhi_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `fk_author_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `fk_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`);

--
-- Constraints for table `jhi_persistent_audit_evt_data`
--
ALTER TABLE `jhi_persistent_audit_evt_data`
  ADD CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`);

--
-- Constraints for table `jhi_persistent_token`
--
ALTER TABLE `jhi_persistent_token`
  ADD CONSTRAINT `fk_user_persistent_token` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`);

--
-- Constraints for table `jhi_user_authority`
--
ALTER TABLE `jhi_user_authority`
  ADD CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `fk_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
