-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-10-24 14:20:59
-- 服务器版本： 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- 表的结构 `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(40) NOT NULL,
  `act` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `account`
--

INSERT INTO `account` (`account_id`, `username`, `password`, `act`, `created_at`, `updated_at`) VALUES
                                                                                                       (1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, '2018-09-19 20:41:52', '2018-09-19 20:41:52'),
                                                                                                       (2, 'root', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1, '2018-09-19 20:43:19', '2018-09-19 20:43:19'),
                                                                                                       (3, 'doctor', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, '2018-09-27 20:03:42', '2018-09-27 20:03:42'),
                                                                                                       (5, 'elderUser', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1, '2018-10-17 23:32:33', '2018-10-17 23:32:33'),
                                                                                                       (6, 'doctorUser', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, '2018-10-17 23:33:40', '2018-10-17 23:33:40'),
                                                                                                       (7, 'familyUser', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 3, '2018-10-17 23:34:15', '2018-10-17 23:34:15'),
                                                                                                       (8, 'groupUser', '7c4a8d09ca3762af61e59520943dc26494f8941b', 4, '2018-10-17 23:35:17', '2018-10-17 23:35:17'),
                                                                                                       (9, 'system', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 5, '2018-10-17 23:35:59', '2018-10-17 23:35:59'),
                                                                                                       (10, 'familyTest', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 3, '2018-10-24 20:34:30', '2018-10-24 20:34:30'),
                                                                                                       (11, 'groupTest', '011c945f30ce2cbafc452f39840f025693339c42', 4, '2018-10-24 20:36:23', '2018-10-24 20:36:23'),
                                                                                                       (12, 'doctorTest', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2, '2018-10-24 20:37:57', '2018-10-24 20:37:57');

-- --------------------------------------------------------

--
-- 表的结构 `alarm`
--

DROP TABLE IF EXISTS `alarm`;
CREATE TABLE IF NOT EXISTS `alarm` (
  `alarm_id` int(11) NOT NULL AUTO_INCREMENT,
  `warning_id` int(11) NOT NULL,
  `health_value` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `handle` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`alarm_id`),
  KEY `warning_id` (`warning_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `alarm`
--

INSERT INTO `alarm` (`alarm_id`, `warning_id`, `health_value`, `created_at`, `handle`) VALUES
                                                                                              (31, 5, 123, '2018-10-18 20:15:25', 0),
                                                                                              (32, 5, 82, '2018-10-18 20:15:25', 0),
                                                                                              (33, 5, 143, '2018-10-18 20:15:25', 0),
                                                                                              (34, 5, 145, '2018-10-18 20:15:25', 0),
                                                                                              (35, 5, 87, '2018-10-18 20:15:26', 0),
                                                                                              (36, 5, 139, '2018-10-18 20:15:26', 0),
                                                                                              (37, 5, 140, '2018-10-18 20:15:26', 0),
                                                                                              (38, 5, 80, '2018-10-18 20:15:26', 0),
                                                                                              (39, 5, 138, '2018-10-18 20:15:26', 0),
                                                                                              (40, 5, 144, '2018-10-18 20:15:26', 0),
                                                                                              (41, 5, 81, '2018-10-18 20:15:26', 0),
                                                                                              (42, 5, 128, '2018-10-18 20:15:26', 0),
                                                                                              (43, 5, 149, '2018-10-18 20:15:26', 0),
                                                                                              (44, 5, 123, '2018-10-18 20:15:26', 0),
                                                                                              (45, 5, 131, '2018-10-18 20:15:26', 0),
                                                                                              (46, 5, 133, '2018-10-18 20:15:26', 0),
                                                                                              (47, 5, 136, '2018-10-18 20:15:27', 0),
                                                                                              (48, 5, 145, '2018-10-18 20:15:27', 0),
                                                                                              (49, 5, 138, '2018-10-18 20:15:27', 0),
                                                                                              (50, 8, 80, '2018-10-18 20:15:27', 0),
                                                                                              (51, 8, 76, '2018-10-18 20:15:27', 0),
                                                                                              (52, 8, 73, '2018-10-18 20:15:27', 0),
                                                                                              (53, 8, 53, '2018-10-18 20:15:27', 0),
                                                                                              (54, 8, 75, '2018-10-18 20:15:27', 0),
                                                                                              (55, 8, 79, '2018-10-18 20:15:27', 0),
                                                                                              (56, 8, 49, '2018-10-18 20:15:27', 0),
                                                                                              (57, 8, 53, '2018-10-18 20:15:27', 0),
                                                                                              (58, 8, 47, '2018-10-18 20:15:27', 0),
                                                                                              (59, 8, 49, '2018-10-18 20:15:27', 0),
                                                                                              (60, 8, 45, '2018-10-18 20:15:27', 0),
                                                                                              (61, 8, 59, '2018-10-18 20:15:27', 0),
                                                                                              (62, 8, 76, '2018-10-18 20:15:28', 0),
                                                                                              (63, 8, 75, '2018-10-18 20:15:28', 0),
                                                                                              (64, 8, 41, '2018-10-18 20:15:28', 0),
                                                                                              (65, 8, 51, '2018-10-18 20:15:28', 0),
                                                                                              (66, 8, 52, '2018-10-18 20:15:28', 0),
                                                                                              (67, 8, 41, '2018-10-18 20:15:28', 0),
                                                                                              (68, 8, 78, '2018-10-18 20:15:28', 0),
                                                                                              (69, 8, 53, '2018-10-18 20:15:28', 0),
                                                                                              (70, 8, 71, '2018-10-18 20:15:28', 0),
                                                                                              (71, 8, 44, '2018-10-18 20:15:29', 0),
                                                                                              (72, 8, 74, '2018-10-18 20:15:29', 0),
                                                                                              (73, 8, 56, '2018-10-18 20:15:29', 0),
                                                                                              (74, 3, 134, '2018-10-18 20:19:58', 0),
                                                                                              (75, 3, 130, '2018-10-18 20:19:58', 0),
                                                                                              (76, 3, 123, '2018-10-18 20:19:58', 0),
                                                                                              (77, 3, 186, '2018-10-18 20:19:58', 0),
                                                                                              (78, 3, 131, '2018-10-18 20:19:58', 0),
                                                                                              (79, 3, 127, '2018-10-18 20:19:58', 0),
                                                                                              (80, 3, 100, '2018-10-18 20:19:58', 0),
                                                                                              (81, 3, 195, '2018-10-18 20:19:58', 0),
                                                                                              (82, 3, 121, '2018-10-18 20:19:58', 0),
                                                                                              (83, 3, 133, '2018-10-18 20:19:59', 0),
                                                                                              (84, 3, 192, '2018-10-18 20:19:59', 0),
                                                                                              (85, 3, 110, '2018-10-18 20:19:59', 0),
                                                                                              (86, 3, 190, '2018-10-18 20:19:59', 0),
                                                                                              (87, 3, 190, '2018-10-18 20:19:59', 0),
                                                                                              (88, 3, 131, '2018-10-18 20:19:59', 0),
                                                                                              (89, 9, 144, '2018-10-18 23:00:38', 0),
                                                                                              (90, 9, 150, '2018-10-18 23:00:38', 0),
                                                                                              (91, 9, 147, '2018-10-18 23:00:38', 0),
                                                                                              (92, 9, 146, '2018-10-18 23:00:38', 0),
                                                                                              (93, 9, 141, '2018-10-18 23:00:38', 0),
                                                                                              (94, 9, 150, '2018-10-18 23:00:38', 0),
                                                                                              (95, 9, 143, '2018-10-18 23:00:39', 0),
                                                                                              (96, 9, 150, '2018-10-18 23:00:39', 0);

-- --------------------------------------------------------

--
-- 表的结构 `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` varchar(300) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `check_history`
--

DROP TABLE IF EXISTS `check_history`;
CREATE TABLE IF NOT EXISTS `check_history` (
  `ch_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `check_name` varchar(100) NOT NULL,
  `check_reason` varchar(100) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ch_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `check_history`
--

INSERT INTO `check_history` (`ch_id`, `account_id`, `hospital_name`, `section`, `check_name`, `check_reason`, `doctor_id`, `created_at`) VALUES
                                                                                                                                                (1, 1, '郫县人民医院', '骨科', '骨质疏松', '诊断骨质', 3, '2018-09-27 20:36:00');

-- --------------------------------------------------------

--
-- 表的结构 `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `elder_id` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `handle` int(11) NOT NULL DEFAULT '0',
  `handle_content` varchar(100) DEFAULT '',
  `handle_time` datetime DEFAULT NULL,
  PRIMARY KEY (`complaint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `complaint`
--

INSERT INTO `complaint` (`complaint_id`, `elder_id`, `content`, `created_at`, `handle`, `handle_content`, `handle_time`) VALUES
                                                                                                                                (2, 1, '123', '2018-08-22 21:57:54', 0, '', NULL),
                                                                                                                                (3, 1, '456', '2018-09-22 21:57:54', 1, '！', '2018-10-22 23:11:10');

-- --------------------------------------------------------

--
-- 表的结构 `connection`
--

DROP TABLE IF EXISTS `connection`;
CREATE TABLE IF NOT EXISTS `connection` (
  `connection_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`connection_id`),
  UNIQUE KEY `account_id` (`account_id`,`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `doctor_evaluate`
--

DROP TABLE IF EXISTS `doctor_evaluate`;
CREATE TABLE IF NOT EXISTS `doctor_evaluate` (
  `evaluate_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `evaluate` int(11) NOT NULL DEFAULT '1',
  `suggest` varchar(300) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`evaluate_id`),
  KEY `account_id` (`account_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `doctor_evaluate`
--

INSERT INTO `doctor_evaluate` (`evaluate_id`, `account_id`, `doctor_id`, `evaluate`, `suggest`, `created_at`) VALUES
                                                                                                                     (2, 1, 3, 4, '你好', '2018-10-17 21:05:18'),
                                                                                                                     (3, 1, 12, 1, '身体还不错', '2018-10-24 20:41:03');

-- --------------------------------------------------------

--
-- 表的结构 `doctor_user`
--

DROP TABLE IF EXISTS `doctor_user`;
CREATE TABLE IF NOT EXISTS `doctor_user` (
  `account_id` int(11) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `hospital_name` varchar(30) DEFAULT NULL,
  `section` varchar(30) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `gender` int(11) DEFAULT '0',
  `age` int(11) DEFAULT '30',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `doctor_user`
--

INSERT INTO `doctor_user` (`account_id`, `realname`, `phone`, `address`, `hospital_name`, `section`, `icon`, `gender`, `age`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                 (3, '胡康玲', '18181818182', '四川省·成都市', '华西·医科', '口腔2科', NULL, 0, 34, '2018-09-27 20:04:35', '2018-10-22 20:42:15'),
                                                                                                                                                                 (6, 'doctorUser', '', '', '', '', NULL, 1, 30, '2018-10-17 23:33:41', '2018-10-23 22:46:08'),
                                                                                                                                                                 (12, '小小孩', '10086', '北京', '北京', '儿科', NULL, 0, 25, '2018-10-24 20:37:57', '2018-10-24 20:38:27');

-- --------------------------------------------------------

--
-- 表的结构 `drug_history`
--

DROP TABLE IF EXISTS `drug_history`;
CREATE TABLE IF NOT EXISTS `drug_history` (
  `dh_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `drug_name` varchar(100) NOT NULL,
  `total_size` varchar(100) NOT NULL,
  `once_size` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `drug_type` varchar(100) NOT NULL,
  `type_detail` varchar(100) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dh_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `drug_history`
--

INSERT INTO `drug_history` (`dh_id`, `account_id`, `hospital_name`, `drug_name`, `total_size`, `once_size`, `unit`, `status`, `drug_type`, `type_detail`, `doctor_id`, `created_at`) VALUES
                                                                                                                                                                                            (1, 1, '四川省肿瘤医院', '益赛普', '10只/每盒', '每次25毫克，皮下注射', '25毫克/每只', 1, '西药', '败血症', 3, '2018-09-27 20:52:17');

-- --------------------------------------------------------

--
-- 表的结构 `elder_user`
--

DROP TABLE IF EXISTS `elder_user`;
CREATE TABLE IF NOT EXISTS `elder_user` (
  `account_id` int(11) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `gender` int(11) DEFAULT '0',
  `age` int(11) DEFAULT '60',
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `id_card` varchar(30) DEFAULT NULL,
  `ss_id` varchar(30) DEFAULT NULL,
  `has_allergy` tinyint(1) NOT NULL DEFAULT '0',
  `has_trauma` tinyint(1) NOT NULL DEFAULT '0',
  `has_operation` tinyint(1) NOT NULL DEFAULT '0',
  `has_inheritance` tinyint(1) NOT NULL DEFAULT '0',
  `icon` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `elder_user`
--

INSERT INTO `elder_user` (`account_id`, `realname`, `gender`, `age`, `address`, `phone`, `id_card`, `ss_id`, `has_allergy`, `has_trauma`, `has_operation`, `has_inheritance`, `icon`, `created_at`, `updated_at`) VALUES
                                                                                                                                                                                                                         (1, '测试1', 0, 72, '北京市·朝阳区·哒哒哒哒哒?', '12345678920', '12345678998765432', '12345678998765432', 0, 0, 1, 0, NULL, '2018-10-08 19:52:11', '2018-10-08 19:52:11'),
                                                                                                                                                                                                                         (2, '测试2', 1, 70, '四川·成都', '12345678920', '12345678998765433', '12345678998765432', 1, 0, 1, 0, NULL, '2018-10-08 19:52:11', '2018-10-08 19:52:11'),
                                                                                                                                                                                                                         (5, 'elderUser', 0, 60, NULL, NULL, '123123123123123123', NULL, 0, 0, 0, 0, NULL, '2018-10-17 23:32:33', '2018-10-17 23:32:33');

-- --------------------------------------------------------

--
-- 表的结构 `family_user`
--

DROP TABLE IF EXISTS `family_user`;
CREATE TABLE IF NOT EXISTS `family_user` (
  `account_id` int(11) NOT NULL,
  `realname` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT '',
  `address` varchar(20) DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `family_user`
--

INSERT INTO `family_user` (`account_id`, `realname`, `phone`, `address`, `created_at`, `updated_at`) VALUES
                                                                                                            (7, '老人家人', '18434343433', '北京市·朝阳区·四环', '2018-10-17 23:34:15', '2018-10-24 20:30:05'),
                                                                                                            (10, '家庭测试', '12345678920', '中北大学', '2018-10-24 20:34:30', '2018-10-24 20:34:43');

-- --------------------------------------------------------

--
-- 表的结构 `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `family_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`follow_id`),
  UNIQUE KEY `account_id` (`account_id`,`family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `follow`
--

INSERT INTO `follow` (`follow_id`, `account_id`, `family_id`, `created_at`) VALUES
                                                                                   (3, 2, 7, '2018-10-18 22:57:46'),
                                                                                   (5, 1, 7, '2018-10-24 20:26:57'),
                                                                                   (9, 2, 10, '2018-10-24 20:35:35');

-- --------------------------------------------------------

--
-- 表的结构 `group_user`
--

DROP TABLE IF EXISTS `group_user`;
CREATE TABLE IF NOT EXISTS `group_user` (
  `account_id` int(11) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT '',
  `address` varchar(100) DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `group_user`
--

INSERT INTO `group_user` (`account_id`, `realname`, `phone`, `address`, `created_at`, `updated_at`) VALUES
                                                                                                           (8, 'groupUser', '10086', '中国移动', '2018-10-17 23:35:17', '2018-10-23 20:23:29'),
                                                                                                           (11, '社区测试', '1231', '123', '2018-10-24 20:36:24', '2018-10-24 20:36:42');

-- --------------------------------------------------------

--
-- 表的结构 `health_data`
--

DROP TABLE IF EXISTS `health_data`;
CREATE TABLE IF NOT EXISTS `health_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `data` varchar(1000) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`data_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `health_data`
--

INSERT INTO `health_data` (`data_id`, `data`, `account_id`, `type`, `created_at`) VALUES
                                                                                         (1, '{\"systolic\": 123,\"diastolic\": 67,\"pulse\": 80}', 1, 1, '2018-09-24'),
                                                                                         (2, '{\"value\":3.5,\"duration\":8}', 1, 2, '2018-09-23'),
                                                                                         (3, '{\"value\":3.6,\"duration\":8}', 1, 2, '2018-09-24'),
                                                                                         (4, '{\"height\":177.3,\"weight\":45, \"bmi\":23}', 1, 3, '2018-09-24'),
                                                                                         (5, '{\"height\":158,\"weight\":71,\"bmi\":28.4}', 1, 3, '2018-10-10'),
                                                                                         (6, '{\"value\":0.4,\"duration\":22}', 1, 2, '2018-10-01'),
                                                                                         (7, '{\"systolic\":99,\"diastolic\":71,\"pulse\":143}', 1, 1, '2018-10-18'),
                                                                                         (8, '{\"value\":0.8,\"duration\":24}', 1, 2, '2018-10-05'),
                                                                                         (9, '{\"value\":0.6,\"duration\":18}', 1, 2, '2018-10-16'),
                                                                                         (10, '{\"value\":0.4,\"duration\":24}', 1, 2, '2018-10-07'),
                                                                                         (11, '{\"systolic\":136,\"diastolic\":69,\"pulse\":126}', 1, 1, '2018-10-17'),
                                                                                         (12, '{\"systolic\":143,\"diastolic\":76,\"pulse\":150}', 1, 1, '2018-10-01'),
                                                                                         (13, '{\"systolic\":107,\"diastolic\":52,\"pulse\":184}', 1, 1, '2018-10-15'),
                                                                                         (14, '{\"systolic\":105,\"diastolic\":66,\"pulse\":125}', 1, 1, '2018-10-04'),
                                                                                         (15, '{\"value\":0.7,\"duration\":10}', 1, 2, '2018-10-07'),
                                                                                         (16, '{\"value\":0.4,\"duration\":6}', 1, 2, '2018-10-11'),
                                                                                         (17, '{\"value\":0.8,\"duration\":17}', 1, 2, '2018-10-05'),
                                                                                         (18, '{\"value\":0.4,\"duration\":9}', 1, 2, '2018-09-30'),
                                                                                         (19, '{\"height\":192,\"weight\":93,\"bmi\":25.2}', 1, 3, '2018-10-11'),
                                                                                         (20, '{\"systolic\":110,\"diastolic\":69,\"pulse\":108}', 1, 1, '2018-10-08'),
                                                                                         (21, '{\"height\":127,\"weight\":42,\"bmi\":26}', 1, 3, '2018-10-06'),
                                                                                         (22, '{\"value\":0.8,\"duration\":8}', 1, 2, '2018-10-05'),
                                                                                         (23, '{\"value\":0.1,\"duration\":15}', 1, 2, '2018-10-17'),
                                                                                         (24, '{\"systolic\":123,\"diastolic\":63,\"pulse\":65}', 1, 1, '2018-10-15'),
                                                                                         (25, '{\"systolic\":82,\"diastolic\":80,\"pulse\":72}', 1, 1, '2018-09-30'),
                                                                                         (26, '{\"value\":0.2,\"duration\":10}', 1, 2, '2018-10-05'),
                                                                                         (27, '{\"height\":160,\"weight\":97,\"bmi\":37.8}', 1, 3, '2018-10-15'),
                                                                                         (28, '{\"height\":100,\"weight\":48,\"bmi\":47.9}', 1, 3, '2018-10-06'),
                                                                                         (29, '{\"systolic\":87,\"diastolic\":63,\"pulse\":116}', 1, 1, '2018-10-02'),
                                                                                         (30, '{\"height\":177,\"weight\":31,\"bmi\":9.8}', 1, 3, '2018-09-30'),
                                                                                         (31, '{\"height\":131,\"weight\":62,\"bmi\":36.1}', 1, 3, '2018-10-17'),
                                                                                         (32, '{\"height\":121,\"weight\":117,\"bmi\":79.9}', 1, 3, '2018-10-08'),
                                                                                         (33, '{\"value\":0.2,\"duration\":6}', 1, 2, '2018-10-12'),
                                                                                         (34, '{\"systolic\":145,\"diastolic\":73,\"pulse\":115}', 1, 1, '2018-10-01'),
                                                                                         (35, '{\"height\":140,\"weight\":36,\"bmi\":18.3}', 1, 3, '2018-10-08'),
                                                                                         (36, '{\"systolic\":133,\"diastolic\":78,\"pulse\":111}', 1, 1, '2018-10-16'),
                                                                                         (37, '{\"systolic\":114,\"diastolic\":45,\"pulse\":75}', 1, 1, '2018-10-12'),
                                                                                         (38, '{\"systolic\":106,\"diastolic\":53,\"pulse\":191}', 1, 1, '2018-10-17'),
                                                                                         (39, '{\"value\":0.4,\"duration\":9}', 1, 2, '2018-10-15'),
                                                                                         (40, '{\"value\":0.3,\"duration\":14}', 1, 2, '2018-10-15'),
                                                                                         (41, '{\"value\":0.1,\"duration\":15}', 1, 2, '2018-10-03'),
                                                                                         (42, '{\"systolic\":102,\"diastolic\":41,\"pulse\":75}', 1, 1, '2018-10-14'),
                                                                                         (43, '{\"value\":0.2,\"duration\":14}', 1, 2, '2018-10-16'),
                                                                                         (44, '{\"systolic\":91,\"diastolic\":59,\"pulse\":164}', 1, 1, '2018-10-12'),
                                                                                         (45, '{\"height\":190,\"weight\":61,\"bmi\":16.8}', 1, 3, '2018-10-14'),
                                                                                         (46, '{\"height\":161,\"weight\":38,\"bmi\":14.6}', 1, 3, '2018-10-09'),
                                                                                         (47, '{\"value\":0.5,\"duration\":23}', 1, 2, '2018-10-01'),
                                                                                         (48, '{\"systolic\":131,\"diastolic\":41,\"pulse\":112}', 1, 1, '2018-10-15'),
                                                                                         (49, '{\"height\":170,\"weight\":49,\"bmi\":16.9}', 1, 3, '2018-10-07'),
                                                                                         (50, '{\"height\":134,\"weight\":51,\"bmi\":28.4}', 1, 3, '2018-09-30'),
                                                                                         (51, '{\"systolic\":80,\"diastolic\":49,\"pulse\":95}', 1, 1, '2018-10-05'),
                                                                                         (52, '{\"systolic\":140,\"diastolic\":67,\"pulse\":149}', 1, 1, '2018-10-04'),
                                                                                         (53, '{\"value\":0.7,\"duration\":7}', 1, 2, '2018-09-30'),
                                                                                         (54, '{\"value\":0.5,\"duration\":23}', 1, 2, '2018-10-16'),
                                                                                         (55, '{\"height\":145,\"weight\":120,\"bmi\":57}', 1, 3, '2018-09-29'),
                                                                                         (56, '{\"systolic\":92,\"diastolic\":51,\"pulse\":43}', 1, 1, '2018-10-14'),
                                                                                         (57, '{\"systolic\":128,\"diastolic\":76,\"pulse\":184}', 1, 1, '2018-10-12'),
                                                                                         (58, '{\"height\":159,\"weight\":97,\"bmi\":38.3}', 1, 3, '2018-10-03'),
                                                                                         (59, '{\"height\":176,\"weight\":88,\"bmi\":28.4}', 1, 3, '2018-10-03'),
                                                                                         (60, '{\"value\":0.1,\"duration\":8}', 1, 2, '2018-10-10'),
                                                                                         (61, '{\"value\":0.4,\"duration\":16}', 1, 2, '2018-10-18'),
                                                                                         (62, '{\"value\":0.7,\"duration\":9}', 1, 2, '2018-10-17'),
                                                                                         (63, '{\"height\":195,\"weight\":114,\"bmi\":29.9}', 1, 3, '2018-10-07'),
                                                                                         (64, '{\"value\":0.6,\"duration\":20}', 1, 2, '2018-10-03'),
                                                                                         (65, '{\"height\":149,\"weight\":103,\"bmi\":46.3}', 1, 3, '2018-10-16'),
                                                                                         (66, '{\"height\":173,\"weight\":108,\"bmi\":36}', 1, 3, '2018-10-12'),
                                                                                         (67, '{\"height\":190,\"weight\":103,\"bmi\":28.5}', 1, 3, '2018-10-16'),
                                                                                         (68, '{\"height\":131,\"weight\":97,\"bmi\":56.5}', 1, 3, '2018-10-05'),
                                                                                         (69, '{\"height\":110,\"weight\":61,\"bmi\":50.4}', 1, 3, '2018-10-11'),
                                                                                         (70, '{\"systolic\":145,\"diastolic\":65,\"pulse\":116}', 1, 1, '2018-10-17'),
                                                                                         (71, '{\"height\":180,\"weight\":76,\"bmi\":23.4}', 1, 3, '2018-10-14'),
                                                                                         (72, '{\"systolic\":138,\"diastolic\":53,\"pulse\":67}', 1, 1, '2018-10-05'),
                                                                                         (73, '{\"value\":0.1,\"duration\":16}', 1, 2, '2018-10-02'),
                                                                                         (74, '{\"systolic\":117,\"diastolic\":53,\"pulse\":70}', 1, 1, '2018-10-01'),
                                                                                         (75, '{\"systolic\":139,\"diastolic\":75,\"pulse\":71}', 1, 1, '2018-10-02'),
                                                                                         (76, '{\"value\":0.6,\"duration\":16}', 1, 2, '2018-10-10'),
                                                                                         (77, '{\"height\":162,\"weight\":70,\"bmi\":26.6}', 1, 3, '2018-10-06'),
                                                                                         (78, '{\"systolic\":138,\"diastolic\":44,\"pulse\":114}', 1, 1, '2018-10-18'),
                                                                                         (79, '{\"systolic\":144,\"diastolic\":47,\"pulse\":60}', 1, 1, '2018-10-06'),
                                                                                         (80, '{\"value\":0.7,\"duration\":15}', 1, 2, '2018-10-12'),
                                                                                         (81, '{\"systolic\":94,\"diastolic\":79,\"pulse\":87}', 1, 1, '2018-10-04'),
                                                                                         (82, '{\"height\":159,\"weight\":110,\"bmi\":43.5}', 1, 3, '2018-10-12'),
                                                                                         (83, '{\"systolic\":149,\"diastolic\":75,\"pulse\":107}', 1, 1, '2018-10-12'),
                                                                                         (84, '{\"value\":0.2,\"duration\":9}', 1, 2, '2018-10-05'),
                                                                                         (85, '{\"systolic\":119,\"diastolic\":74,\"pulse\":72}', 1, 1, '2018-10-18'),
                                                                                         (86, '{\"height\":186,\"weight\":74,\"bmi\":21.3}', 1, 3, '2018-10-04'),
                                                                                         (87, '{\"systolic\":104,\"diastolic\":70,\"pulse\":200}', 1, 1, '2018-10-11'),
                                                                                         (88, '{\"height\":123,\"weight\":107,\"bmi\":70.7}', 1, 3, '2018-10-02'),
                                                                                         (89, '{\"height\":170,\"weight\":67,\"bmi\":23.1}', 1, 3, '2018-10-05'),
                                                                                         (90, '{\"systolic\":90,\"diastolic\":63,\"pulse\":139}', 1, 1, '2018-10-01'),
                                                                                         (91, '{\"height\":144,\"weight\":82,\"bmi\":39.5}', 1, 3, '2018-09-30'),
                                                                                         (92, '{\"value\":0.8,\"duration\":21}', 1, 2, '2018-10-12'),
                                                                                         (93, '{\"value\":0.5,\"duration\":8}', 1, 2, '2018-10-18'),
                                                                                         (94, '{\"height\":173,\"weight\":73,\"bmi\":24.3}', 1, 3, '2018-10-12'),
                                                                                         (95, '{\"systolic\":91,\"diastolic\":60,\"pulse\":47}', 1, 1, '2018-10-14'),
                                                                                         (96, '{\"height\":153,\"weight\":49,\"bmi\":20.9}', 1, 3, '2018-10-10'),
                                                                                         (97, '{\"value\":0.2,\"duration\":7}', 1, 2, '2018-10-14'),
                                                                                         (98, '{\"value\":0.2,\"duration\":21}', 1, 2, '2018-10-11'),
                                                                                         (99, '{\"height\":159,\"weight\":114,\"bmi\":45}', 1, 3, '2018-10-10'),
                                                                                         (100, '{\"height\":130,\"weight\":83,\"bmi\":49.1}', 1, 3, '2018-09-30'),
                                                                                         (101, '{\"height\":133,\"weight\":105,\"bmi\":59.3}', 1, 3, '2018-10-08'),
                                                                                         (102, '{\"systolic\":81,\"diastolic\":49,\"pulse\":166}', 1, 1, '2018-10-06'),
                                                                                         (103, '{\"systolic\":111,\"diastolic\":56,\"pulse\":172}', 1, 1, '2018-10-18'),
                                                                                         (104, '{\"value\":0.8,\"duration\":12}', 1, 2, '2018-10-05'),
                                                                                         (105, '{\"height\":142,\"weight\":81,\"bmi\":40.1}', 2, 3, '2018-10-15'),
                                                                                         (106, '{\"value\":0.5,\"duration\":22}', 2, 2, '2018-10-07'),
                                                                                         (107, '{\"height\":105,\"weight\":106,\"bmi\":96.1}', 2, 3, '2018-09-29'),
                                                                                         (108, '{\"value\":0.6,\"duration\":5}', 2, 2, '2018-10-02'),
                                                                                         (109, '{\"systolic\":106,\"diastolic\":78,\"pulse\":114}', 2, 1, '2018-10-09'),
                                                                                         (110, '{\"value\":0.4,\"duration\":23}', 2, 2, '2018-10-14'),
                                                                                         (111, '{\"value\":0.6,\"duration\":14}', 2, 2, '2018-10-11'),
                                                                                         (112, '{\"height\":115,\"weight\":105,\"bmi\":79.3}', 2, 3, '2018-10-03'),
                                                                                         (113, '{\"height\":144,\"weight\":41,\"bmi\":19.7}', 2, 3, '2018-09-29'),
                                                                                         (114, '{\"height\":103,\"weight\":119,\"bmi\":112.1}', 2, 3, '2018-10-05'),
                                                                                         (115, '{\"height\":171,\"weight\":79,\"bmi\":27}', 2, 3, '2018-10-08'),
                                                                                         (116, '{\"systolic\":112,\"diastolic\":72,\"pulse\":57}', 2, 1, '2018-10-18'),
                                                                                         (117, '{\"value\":0.5,\"duration\":12}', 2, 2, '2018-10-17'),
                                                                                         (118, '{\"value\":0.4,\"duration\":1}', 2, 2, '2018-10-05'),
                                                                                         (119, '{\"height\":109,\"weight\":114,\"bmi\":95.9}', 2, 3, '2018-10-03'),
                                                                                         (120, '{\"height\":174,\"weight\":101,\"bmi\":33.3}', 2, 3, '2018-10-02'),
                                                                                         (121, '{\"height\":180,\"weight\":107,\"bmi\":33}', 2, 3, '2018-10-05'),
                                                                                         (122, '{\"systolic\":138,\"diastolic\":60,\"pulse\":199}', 2, 1, '2018-09-30'),
                                                                                         (123, '{\"value\":0.5,\"duration\":18}', 2, 2, '2018-10-09'),
                                                                                         (124, '{\"value\":0.5,\"duration\":11}', 2, 2, '2018-10-12'),
                                                                                         (125, '{\"height\":135,\"weight\":111,\"bmi\":60.9}', 2, 3, '2018-09-30'),
                                                                                         (126, '{\"height\":179,\"weight\":75,\"bmi\":23.4}', 2, 3, '2018-10-03'),
                                                                                         (127, '{\"height\":151,\"weight\":55,\"bmi\":24.1}', 2, 3, '2018-10-13'),
                                                                                         (128, '{\"height\":105,\"weight\":86,\"bmi\":78}', 2, 3, '2018-09-30'),
                                                                                         (129, '{\"height\":190,\"weight\":57,\"bmi\":15.7}', 2, 3, '2018-10-14'),
                                                                                         (130, '{\"systolic\":85,\"diastolic\":52,\"pulse\":43}', 2, 1, '2018-10-07'),
                                                                                         (131, '{\"value\":0.4,\"duration\":10}', 2, 2, '2018-10-02'),
                                                                                         (132, '{\"height\":190,\"weight\":107,\"bmi\":29.6}', 2, 3, '2018-10-14'),
                                                                                         (133, '{\"height\":178,\"weight\":83,\"bmi\":26.1}', 2, 3, '2018-10-01'),
                                                                                         (134, '{\"systolic\":128,\"diastolic\":79,\"pulse\":159}', 2, 1, '2018-10-14'),
                                                                                         (135, '{\"value\":0.7,\"duration\":5}', 2, 2, '2018-10-17'),
                                                                                         (136, '{\"systolic\":106,\"diastolic\":64,\"pulse\":183}', 2, 1, '2018-10-10'),
                                                                                         (137, '{\"height\":127,\"weight\":116,\"bmi\":71.9}', 2, 3, '2018-10-03'),
                                                                                         (138, '{\"height\":173,\"weight\":69,\"bmi\":23}', 2, 3, '2018-10-05'),
                                                                                         (139, '{\"height\":198,\"weight\":36,\"bmi\":9.1}', 2, 3, '2018-10-06'),
                                                                                         (140, '{\"systolic\":150,\"diastolic\":78,\"pulse\":149}', 2, 1, '2018-10-16'),
                                                                                         (141, '{\"height\":108,\"weight\":85,\"bmi\":72.8}', 2, 3, '2018-09-30'),
                                                                                         (142, '{\"height\":138,\"weight\":69,\"bmi\":36.2}', 2, 3, '2018-10-10'),
                                                                                         (143, '{\"systolic\":147,\"diastolic\":63,\"pulse\":111}', 2, 1, '2018-10-02'),
                                                                                         (144, '{\"systolic\":123,\"diastolic\":64,\"pulse\":170}', 2, 1, '2018-10-05'),
                                                                                         (145, '{\"value\":0.6,\"duration\":13}', 2, 2, '2018-09-30'),
                                                                                         (146, '{\"systolic\":141,\"diastolic\":53,\"pulse\":126}', 2, 1, '2018-10-04'),
                                                                                         (147, '{\"systolic\":143,\"diastolic\":45,\"pulse\":133}', 2, 1, '2018-10-14'),
                                                                                         (148, '{\"systolic\":84,\"diastolic\":61,\"pulse\":184}', 2, 1, '2018-10-09'),
                                                                                         (149, '{\"systolic\":150,\"diastolic\":67,\"pulse\":71}', 2, 1, '2018-10-13'),
                                                                                         (150, '{\"height\":107,\"weight\":51,\"bmi\":44.5}', 2, 3, '2018-09-29'),
                                                                                         (151, '{\"systolic\":84,\"diastolic\":72,\"pulse\":95}', 2, 1, '2018-10-02'),
                                                                                         (152, '{\"systolic\":124,\"diastolic\":44,\"pulse\":63}', 2, 1, '2018-10-08'),
                                                                                         (153, '{\"height\":156,\"weight\":49,\"bmi\":20.1}', 2, 3, '2018-10-16'),
                                                                                         (154, '{\"systolic\":112,\"diastolic\":70,\"pulse\":47}', 2, 1, '2018-10-08'),
                                                                                         (155, '{\"systolic\":138,\"diastolic\":46,\"pulse\":126}', 2, 1, '2018-10-05'),
                                                                                         (156, '{\"value\":0.6,\"duration\":24}', 2, 2, '2018-10-02'),
                                                                                         (157, '{\"height\":142,\"weight\":53,\"bmi\":26.2}', 2, 3, '2018-10-01'),
                                                                                         (158, '{\"systolic\":117,\"diastolic\":70,\"pulse\":135}', 2, 1, '2018-10-15'),
                                                                                         (159, '{\"systolic\":126,\"diastolic\":41,\"pulse\":91}', 2, 1, '2018-10-18'),
                                                                                         (160, '{\"height\":147,\"weight\":45,\"bmi\":20.8}', 2, 3, '2018-10-05'),
                                                                                         (161, '{\"value\":0.2,\"duration\":15}', 2, 2, '2018-09-30'),
                                                                                         (162, '{\"systolic\":150,\"diastolic\":77,\"pulse\":139}', 2, 1, '2018-09-30'),
                                                                                         (163, '{\"systolic\":118,\"diastolic\":49,\"pulse\":179}', 2, 1, '2018-10-11'),
                                                                                         (164, '{\"height\":176,\"weight\":34,\"bmi\":10.9}', 2, 3, '2018-10-17'),
                                                                                         (165, '{\"systolic\":136,\"diastolic\":53,\"pulse\":174}', 2, 1, '2018-09-29'),
                                                                                         (166, '{\"value\":0.1,\"duration\":7}', 2, 2, '2018-10-10'),
                                                                                         (167, '{\"systolic\":113,\"diastolic\":70,\"pulse\":48}', 2, 1, '2018-10-09'),
                                                                                         (168, '{\"value\":0.2,\"duration\":2}', 2, 2, '2018-10-07'),
                                                                                         (169, '{\"height\":109,\"weight\":83,\"bmi\":69.8}', 2, 3, '2018-10-07'),
                                                                                         (170, '{\"value\":0.5,\"duration\":17}', 2, 2, '2018-10-07'),
                                                                                         (171, '{\"systolic\":108,\"diastolic\":77,\"pulse\":141}', 2, 1, '2018-10-10'),
                                                                                         (172, '{\"value\":0.4,\"duration\":0}', 2, 2, '2018-10-06'),
                                                                                         (173, '{\"value\":0.7,\"duration\":2}', 2, 2, '2018-10-02'),
                                                                                         (174, '{\"height\":139,\"weight\":40,\"bmi\":20.7}', 2, 3, '2018-10-02'),
                                                                                         (175, '{\"systolic\":146,\"diastolic\":61,\"pulse\":172}', 2, 1, '2018-10-02'),
                                                                                         (176, '{\"height\":112,\"weight\":70,\"bmi\":55.8}', 2, 3, '2018-10-09'),
                                                                                         (177, '{\"height\":136,\"weight\":31,\"bmi\":16.7}', 2, 3, '2018-10-04'),
                                                                                         (178, '{\"systolic\":119,\"diastolic\":65,\"pulse\":80}', 2, 1, '2018-10-07'),
                                                                                         (179, '{\"height\":197,\"weight\":105,\"bmi\":27}', 2, 3, '2018-10-07'),
                                                                                         (180, '{\"height\":126,\"weight\":60,\"bmi\":37.7}', 2, 3, '2018-10-09'),
                                                                                         (181, '{\"value\":0.6,\"duration\":24}', 2, 2, '2018-09-30'),
                                                                                         (182, '{\"systolic\":144,\"diastolic\":78,\"pulse\":137}', 2, 1, '2018-09-28'),
                                                                                         (183, '{\"systolic\":132,\"diastolic\":59,\"pulse\":54}', 2, 1, '2018-10-03'),
                                                                                         (184, '{\"value\":0.8,\"duration\":0}', 2, 2, '2018-09-29'),
                                                                                         (185, '{\"systolic\":106,\"diastolic\":50,\"pulse\":142}', 2, 1, '2018-10-14'),
                                                                                         (186, '{\"height\":147,\"weight\":85,\"bmi\":39.3}', 2, 3, '2018-09-30'),
                                                                                         (187, '{\"systolic\":112,\"diastolic\":71,\"pulse\":126}', 2, 1, '2018-10-15'),
                                                                                         (188, '{\"height\":157,\"weight\":107,\"bmi\":43.4}', 2, 3, '2018-10-09'),
                                                                                         (189, '{\"systolic\":133,\"diastolic\":73,\"pulse\":88}', 2, 1, '2018-10-12'),
                                                                                         (190, '{\"systolic\":140,\"diastolic\":74,\"pulse\":146}', 2, 1, '2018-10-10'),
                                                                                         (191, '{\"systolic\":138,\"diastolic\":69,\"pulse\":129}', 2, 1, '2018-10-02'),
                                                                                         (192, '{\"systolic\":123,\"diastolic\":43,\"pulse\":193}', 2, 1, '2018-10-14'),
                                                                                         (193, '{\"value\":0.5,\"duration\":23}', 2, 2, '2018-10-14'),
                                                                                         (194, '{\"height\":153,\"weight\":87,\"bmi\":37.1}', 2, 3, '2018-10-02'),
                                                                                         (195, '{\"systolic\":88,\"diastolic\":72,\"pulse\":50}', 2, 1, '2018-10-08'),
                                                                                         (196, '{\"height\":125,\"weight\":93,\"bmi\":59.5}', 2, 3, '2018-10-05'),
                                                                                         (197, '{\"systolic\":116,\"diastolic\":57,\"pulse\":68}', 2, 1, '2018-10-05'),
                                                                                         (198, '{\"value\":0.7,\"duration\":20}', 2, 2, '2018-10-18'),
                                                                                         (199, '{\"height\":132,\"weight\":82,\"bmi\":47}', 2, 3, '2018-10-09'),
                                                                                         (200, '{\"value\":0.4,\"duration\":9}', 2, 2, '2018-10-01'),
                                                                                         (201, '{\"value\":0.1,\"duration\":17}', 2, 2, '2018-10-09'),
                                                                                         (202, '{\"height\":199,\"weight\":95,\"bmi\":23.9}', 2, 3, '2018-10-10'),
                                                                                         (203, '{\"systolic\":84,\"diastolic\":44,\"pulse\":136}', 2, 1, '2018-09-30'),
                                                                                         (204, '{\"height\":146,\"weight\":45,\"bmi\":21.1}', 2, 3, '2018-10-15'),
                                                                                         (205, '{\"height\":187,\"weight\":117,\"bmi\":33.4}', 5, 3, '2018-10-11'),
                                                                                         (206, '{\"height\":181,\"weight\":43,\"bmi\":13.1}', 5, 3, '2018-10-05'),
                                                                                         (207, '{\"systolic\":145,\"diastolic\":64,\"pulse\":184}', 5, 1, '2018-10-16'),
                                                                                         (208, '{\"value\":0.8,\"duration\":12}', 5, 2, '2018-10-09'),
                                                                                         (209, '{\"systolic\":93,\"diastolic\":63,\"pulse\":77}', 5, 1, '2018-10-03'),
                                                                                         (210, '{\"height\":126,\"weight\":81,\"bmi\":51}', 5, 3, '2018-10-03'),
                                                                                         (211, '{\"value\":0.5,\"duration\":0}', 5, 2, '2018-10-02'),
                                                                                         (212, '{\"systolic\":149,\"diastolic\":53,\"pulse\":121}', 5, 1, '2018-09-29'),
                                                                                         (213, '{\"height\":196,\"weight\":46,\"bmi\":11.9}', 5, 3, '2018-10-13'),
                                                                                         (214, '{\"height\":141,\"weight\":114,\"bmi\":57.3}', 5, 3, '2018-10-12'),
                                                                                         (215, '{\"height\":177,\"weight\":54,\"bmi\":17.2}', 5, 3, '2018-10-13'),
                                                                                         (216, '{\"height\":187,\"weight\":105,\"bmi\":30}', 5, 3, '2018-09-30'),
                                                                                         (217, '{\"systolic\":118,\"diastolic\":69,\"pulse\":47}', 5, 1, '2018-10-02'),
                                                                                         (218, '{\"value\":0.8,\"duration\":7}', 5, 2, '2018-10-11'),
                                                                                         (219, '{\"height\":185,\"weight\":98,\"bmi\":28.6}', 5, 3, '2018-10-14'),
                                                                                         (220, '{\"value\":0.4,\"duration\":0}', 5, 2, '2018-10-03'),
                                                                                         (221, '{\"height\":130,\"weight\":77,\"bmi\":45.5}', 5, 3, '2018-10-12'),
                                                                                         (222, '{\"value\":0.3,\"duration\":20}', 5, 2, '2018-10-08'),
                                                                                         (223, '{\"systolic\":115,\"diastolic\":61,\"pulse\":109}', 5, 1, '2018-10-11'),
                                                                                         (224, '{\"systolic\":125,\"diastolic\":76,\"pulse\":48}', 5, 1, '2018-10-17'),
                                                                                         (225, '{\"height\":189,\"weight\":58,\"bmi\":16.2}', 5, 3, '2018-10-08'),
                                                                                         (226, '{\"value\":0.1,\"duration\":12}', 5, 2, '2018-10-05'),
                                                                                         (227, '{\"systolic\":140,\"diastolic\":61,\"pulse\":98}', 5, 1, '2018-10-05'),
                                                                                         (228, '{\"systolic\":82,\"diastolic\":45,\"pulse\":175}', 5, 1, '2018-09-29'),
                                                                                         (229, '{\"value\":0.7,\"duration\":9}', 5, 2, '2018-10-14'),
                                                                                         (230, '{\"systolic\":135,\"diastolic\":52,\"pulse\":194}', 5, 1, '2018-09-29'),
                                                                                         (231, '{\"height\":141,\"weight\":38,\"bmi\":19.1}', 5, 3, '2018-10-14'),
                                                                                         (232, '{\"height\":155,\"weight\":96,\"bmi\":39.9}', 5, 3, '2018-10-08'),
                                                                                         (233, '{\"height\":156,\"weight\":79,\"bmi\":32.4}', 5, 3, '2018-10-15'),
                                                                                         (234, '{\"height\":118,\"weight\":118,\"bmi\":84.7}', 5, 3, '2018-10-13'),
                                                                                         (235, '{\"value\":0.2,\"duration\":12}', 5, 2, '2018-10-08'),
                                                                                         (236, '{\"systolic\":111,\"diastolic\":79,\"pulse\":116}', 5, 1, '2018-10-07'),
                                                                                         (237, '{\"systolic\":117,\"diastolic\":68,\"pulse\":165}', 5, 1, '2018-10-11'),
                                                                                         (238, '{\"systolic\":82,\"diastolic\":66,\"pulse\":165}', 5, 1, '2018-10-06'),
                                                                                         (239, '{\"height\":135,\"weight\":76,\"bmi\":41.7}', 5, 3, '2018-10-15'),
                                                                                         (240, '{\"value\":0.3,\"duration\":15}', 5, 2, '2018-10-11'),
                                                                                         (241, '{\"height\":189,\"weight\":88,\"bmi\":24.6}', 5, 3, '2018-10-13'),
                                                                                         (242, '{\"height\":168,\"weight\":84,\"bmi\":29.7}', 5, 3, '2018-10-04'),
                                                                                         (243, '{\"systolic\":134,\"diastolic\":74,\"pulse\":83}', 5, 1, '2018-10-03'),
                                                                                         (244, '{\"systolic\":97,\"diastolic\":78,\"pulse\":134}', 5, 1, '2018-10-14'),
                                                                                         (245, '{\"height\":132,\"weight\":49,\"bmi\":28.1}', 5, 3, '2018-09-30'),
                                                                                         (246, '{\"systolic\":116,\"diastolic\":54,\"pulse\":100}', 5, 1, '2018-10-02'),
                                                                                         (247, '{\"value\":0.7,\"duration\":23}', 5, 2, '2018-10-03'),
                                                                                         (248, '{\"value\":0.7,\"duration\":15}', 5, 2, '2018-09-29'),
                                                                                         (249, '{\"height\":182,\"weight\":43,\"bmi\":12.9}', 5, 3, '2018-10-12'),
                                                                                         (250, '{\"systolic\":145,\"diastolic\":73,\"pulse\":44}', 5, 1, '2018-10-03'),
                                                                                         (251, '{\"value\":0.4,\"duration\":4}', 5, 2, '2018-10-09'),
                                                                                         (252, '{\"height\":154,\"weight\":109,\"bmi\":45.9}', 5, 3, '2018-10-05'),
                                                                                         (253, '{\"height\":184,\"weight\":52,\"bmi\":15.3}', 5, 3, '2018-10-17'),
                                                                                         (254, '{\"systolic\":144,\"diastolic\":74,\"pulse\":171}', 5, 1, '2018-10-05'),
                                                                                         (255, '{\"height\":138,\"weight\":63,\"bmi\":33}', 5, 3, '2018-10-16'),
                                                                                         (256, '{\"value\":0.2,\"duration\":18}', 5, 2, '2018-10-03'),
                                                                                         (257, '{\"height\":158,\"weight\":47,\"bmi\":18.8}', 5, 3, '2018-10-11'),
                                                                                         (258, '{\"value\":0.8,\"duration\":13}', 5, 2, '2018-10-09'),
                                                                                         (259, '{\"height\":113,\"weight\":71,\"bmi\":55.6}', 5, 3, '2018-10-08'),
                                                                                         (260, '{\"height\":105,\"weight\":110,\"bmi\":99.7}', 5, 3, '2018-10-07'),
                                                                                         (261, '{\"height\":143,\"weight\":34,\"bmi\":16.6}', 5, 3, '2018-10-07'),
                                                                                         (262, '{\"height\":126,\"weight\":46,\"bmi\":28.9}', 5, 3, '2018-10-01'),
                                                                                         (263, '{\"value\":0.6,\"duration\":8}', 5, 2, '2018-10-15'),
                                                                                         (264, '{\"value\":0.1,\"duration\":14}', 5, 2, '2018-10-08'),
                                                                                         (265, '{\"value\":0.3,\"duration\":11}', 5, 2, '2018-09-29'),
                                                                                         (266, '{\"systolic\":93,\"diastolic\":68,\"pulse\":68}', 5, 1, '2018-10-11'),
                                                                                         (267, '{\"systolic\":99,\"diastolic\":62,\"pulse\":194}', 5, 1, '2018-10-02'),
                                                                                         (268, '{\"systolic\":112,\"diastolic\":40,\"pulse\":123}', 5, 1, '2018-10-08'),
                                                                                         (269, '{\"value\":0.7,\"duration\":10}', 5, 2, '2018-10-17'),
                                                                                         (270, '{\"height\":164,\"weight\":108,\"bmi\":40.1}', 5, 3, '2018-10-15'),
                                                                                         (271, '{\"value\":0.5,\"duration\":13}', 5, 2, '2018-10-01'),
                                                                                         (272, '{\"value\":0.7,\"duration\":2}', 5, 2, '2018-10-05'),
                                                                                         (273, '{\"systolic\":94,\"diastolic\":76,\"pulse\":68}', 5, 1, '2018-10-01'),
                                                                                         (274, '{\"systolic\":147,\"diastolic\":63,\"pulse\":124}', 5, 1, '2018-10-07'),
                                                                                         (275, '{\"value\":0.6,\"duration\":19}', 5, 2, '2018-10-03'),
                                                                                         (276, '{\"height\":144,\"weight\":88,\"bmi\":42.4}', 5, 3, '2018-10-16'),
                                                                                         (277, '{\"value\":0.6,\"duration\":7}', 5, 2, '2018-10-01'),
                                                                                         (278, '{\"systolic\":136,\"diastolic\":45,\"pulse\":181}', 5, 1, '2018-10-14'),
                                                                                         (279, '{\"systolic\":88,\"diastolic\":43,\"pulse\":181}', 5, 1, '2018-09-30'),
                                                                                         (280, '{\"value\":0.7,\"duration\":23}', 5, 2, '2018-10-03'),
                                                                                         (281, '{\"value\":0.4,\"duration\":4}', 5, 2, '2018-10-17'),
                                                                                         (282, '{\"height\":157,\"weight\":47,\"bmi\":19}', 5, 3, '2018-10-17'),
                                                                                         (283, '{\"value\":0.1,\"duration\":19}', 5, 2, '2018-10-08'),
                                                                                         (284, '{\"systolic\":120,\"diastolic\":68,\"pulse\":86}', 5, 1, '2018-10-05'),
                                                                                         (285, '{\"height\":195,\"weight\":70,\"bmi\":18.4}', 5, 3, '2018-10-08'),
                                                                                         (286, '{\"value\":0.7,\"duration\":18}', 5, 2, '2018-09-29'),
                                                                                         (287, '{\"value\":0.6,\"duration\":0}', 5, 2, '2018-10-15'),
                                                                                         (288, '{\"height\":163,\"weight\":95,\"bmi\":35.7}', 5, 3, '2018-10-06'),
                                                                                         (289, '{\"systolic\":136,\"diastolic\":46,\"pulse\":53}', 5, 1, '2018-10-06'),
                                                                                         (290, '{\"value\":0.7,\"duration\":19}', 5, 2, '2018-10-02'),
                                                                                         (291, '{\"systolic\":119,\"diastolic\":48,\"pulse\":44}', 5, 1, '2018-10-16'),
                                                                                         (292, '{\"height\":105,\"weight\":103,\"bmi\":93.4}', 5, 3, '2018-10-04'),
                                                                                         (293, '{\"height\":122,\"weight\":52,\"bmi\":34.9}', 5, 3, '2018-10-04'),
                                                                                         (294, '{\"height\":116,\"weight\":83,\"bmi\":61.6}', 5, 3, '2018-10-09'),
                                                                                         (295, '{\"value\":0.4,\"duration\":16}', 5, 2, '2018-09-29'),
                                                                                         (296, '{\"value\":0.7,\"duration\":6}', 5, 2, '2018-10-03'),
                                                                                         (297, '{\"value\":0.1,\"duration\":16}', 5, 2, '2018-10-07'),
                                                                                         (298, '{\"systolic\":130,\"diastolic\":66,\"pulse\":175}', 5, 1, '2018-10-16'),
                                                                                         (299, '{\"height\":167,\"weight\":103,\"bmi\":36.9}', 5, 3, '2018-10-09'),
                                                                                         (300, '{\"systolic\":116,\"diastolic\":52,\"pulse\":155}', 5, 1, '2018-09-29'),
                                                                                         (301, '{\"height\":152,\"weight\":81,\"bmi\":35}', 5, 3, '2018-10-01'),
                                                                                         (302, '{\"height\":178,\"weight\":84,\"bmi\":26.5}', 5, 3, '2018-10-16'),
                                                                                         (303, '{\"height\":138,\"weight\":52,\"bmi\":27.3}', 5, 3, '2018-10-16'),
                                                                                         (304, '{\"height\":116,\"weight\":30,\"bmi\":22.2}', 5, 3, '2018-10-08');

-- --------------------------------------------------------

--
-- 表的结构 `main_menu`
--

DROP TABLE IF EXISTS `main_menu`;
CREATE TABLE IF NOT EXISTS `main_menu` (
  `main_id` int(11) NOT NULL AUTO_INCREMENT,
  `main_name` varchar(20) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `main_menu`
--

INSERT INTO `main_menu` (`main_id`, `main_name`, `icon`, `type`) VALUES
                                                                        (1, '健康监测', '', 1),
                                                                        (2, '健康监护', '', 1),
                                                                        (3, '健康档案', '', 1),
                                                                        (4, '亲人关怀', '', 1),
                                                                        (5, '家庭医生', '', 1),
                                                                        (6, '咨询问题', '', 2),
                                                                        (7, '医生评估', '', 2),
                                                                        (8, '老人信息', '', 3),
                                                                        (9, '告警信息', '', 3),
                                                                        (10, '地图定位', '', 3),
                                                                        (11, '档案管理', '', 4),
                                                                        (12, '工单管理', '', 4),
                                                                        (13, '投诉管理', '', 4),
                                                                        (15, '档案管理', '', 5),
                                                                        (16, '调度过程', '', 5),
                                                                        (17, '决策分析', '', 5),
                                                                        (18, '个体预警', '', 5);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `uri` varchar(100) NOT NULL,
  `main_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `main_id` (`main_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`menu_id`, `name`, `uri`, `main_id`) VALUES
                                                                (1, '血压指标', '/health_data/blood_pressure', 1),
                                                                (2, '血糖指标', '/health_data/blood_sugar', 1),
                                                                (3, '身高体重指标', '/health_data/height_weight', 1),
                                                                (4, '地图定位', '/health_monitor/position', 2),
                                                                (5, '异常指标', '/health_monitor/alarm_show', 2),
                                                                (6, '预警设置', '/health_monitor/warning_set', 2),
                                                                (7, '提醒设置', '/health_monitor/notice_show', 2),
                                                                (8, '个人档案', '/health_history/me', 3),
                                                                (9, '门诊病历', '/health_history/sick_history', 3),
                                                                (10, '检验项目', '/health_history/check_history', 3),
                                                                (11, '用药记录', '/health_history/drug_history', 3),
                                                                (12, '健康档案调阅申请', '/record_auth/apply', 4),
                                                                (13, '健康档案调阅授权', '/record_auth/invoke', 4),
                                                                (14, '健康档案查询', '/record_auth/show', 4),
                                                                (15, '医生专家库', '/my_doctor/show', 5),
                                                                (16, '我的咨询', '/my_doctor/my_question', 5),
                                                                (17, '查看详情', '/doctor_user/question', 6),
                                                                (18, '查看详情', '/doctor_user/evaluate', 7),
                                                                (19, '亲人档案', '/family_user/record', 8),
                                                                (20, '异常指标信息', '/family_user/alarm', 9),
                                                                (21, '老人定位', '/family_user/position', 10),
                                                                (22, '老人档案', '/user_manage/elder', 11),
                                                                (23, '家庭医生', '/user_manage/doctor', 11),
                                                                (24, '老人定位', '/user_manage/position', 11),
                                                                (26, '工单处理', '/work_order/show', 12),
                                                                (27, '待处投诉', '/complaint/un_handle', 13),
                                                                (28, '已处理投诉', '/complaint/handle', 13),
                                                                (29, '总投诉量', '/complaint/stat', 13),
                                                                (30, '基础数据统计', '/system_user/stat', 15),
                                                                (31, '老人档案', '/user_manage/elder', 15),
                                                                (32, '家庭医生', '/user_manage/doctor', 15),
                                                                (36, '查看详情', '/system_user/alarm', 18);

-- --------------------------------------------------------

--
-- 表的结构 `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_type` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `frequency` varchar(10) NOT NULL,
  `last` datetime NOT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `notice`
--

INSERT INTO `notice` (`notice_id`, `notice_type`, `account_id`, `start`, `end`, `frequency`, `last`) VALUES
                                                                                                            (1, 2, 1, '2018-09-27 00:00:00', '2018-09-29 13:30:00', '2:2', '2018-09-18 00:00:00'),
                                                                                                            (3, 1, 1, '2018-09-18 00:00:00', '2018-09-29 13:30:00', '2:5', '2018-09-18 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `gps_data` varchar(1000) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `position`
--

INSERT INTO `position` (`id`, `account_id`, `gps_data`, `created_at`) VALUES
                                                                             (1, 1, '[{\"longitude\":113.56,\"latitude\":34.5666},{\"longitude\":113.86,\"latitude\":34.5666},{\"longitude\":113.57,\"latitude\":35.5666}]', '2018-09-24');

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`),
  KEY `account_id` (`account_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `record_authorization`
--

DROP TABLE IF EXISTS `record_authorization`;
CREATE TABLE IF NOT EXISTS `record_authorization` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `from_id_2` (`from_id`,`to_id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `record_authorization`
--

INSERT INTO `record_authorization` (`record_id`, `from_id`, `to_id`, `stat`, `updated_at`, `created_at`) VALUES
                                                                                                                (1, 1, 2, 1, '2018-10-12 20:37:55', '2018-10-12 20:37:55'),
                                                                                                                (2, 2, 1, 1, '2018-10-12 20:37:55', '2018-10-12 20:37:55');

-- --------------------------------------------------------

--
-- 表的结构 `sick_history`
--

DROP TABLE IF EXISTS `sick_history`;
CREATE TABLE IF NOT EXISTS `sick_history` (
  `sh_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `result` varchar(100) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `method` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sh_id`),
  KEY `account_id` (`account_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sick_history`
--

INSERT INTO `sick_history` (`sh_id`, `account_id`, `hospital_name`, `section`, `result`, `doctor_id`, `method`, `created_at`) VALUES
                                                                                                                                     (1, 1, '成都军区机关医院', '口腔科', '口腔溃疡', 3, '镇痛防感染', '2018-09-27 20:03:10');

-- --------------------------------------------------------

--
-- 表的结构 `warning`
--

DROP TABLE IF EXISTS `warning`;
CREATE TABLE IF NOT EXISTS `warning` (
  `warning_id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(10) NOT NULL,
  `min_val` float NOT NULL,
  `max_val` float NOT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`warning_id`),
  UNIQUE KEY `uni_account_type` (`account_id`,`key_name`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `warning`
--

INSERT INTO `warning` (`warning_id`, `key_name`, `min_val`, `max_val`, `used`, `account_id`, `created_at`) VALUES
                                                                                                                  (3, 'height', 140, 180, 1, 1, '2018-09-24 18:33:14'),
                                                                                                                  (5, 'systolic', 90, 120, 1, 1, '2018-09-25 20:47:03'),
                                                                                                                  (8, 'diastolic', 60, 70, 1, 1, '2018-09-25 20:56:02'),
                                                                                                                  (9, 'systolic', 10, 140, 1, 2, '2018-10-18 22:59:21');

-- --------------------------------------------------------

--
-- 表的结构 `work_order`
--

DROP TABLE IF EXISTS `work_order`;
CREATE TABLE IF NOT EXISTS `work_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `elder_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `price` float NOT NULL,
  `service_time` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `elder_id` (`elder_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `work_order`
--

INSERT INTO `work_order` (`order_id`, `elder_id`, `account_id`, `type`, `content`, `price`, `service_time`, `created_at`) VALUES
                                                                                                                                 (2, 1, 8, 2, '测试', 152, '2018-12-24 ', '2018-10-22 22:55:52'),
                                                                                                                                 (3, 1, 11, 3, '123', 1, '今天', '2018-10-24 20:37:25');

--
-- 限制导出的表
--

--
-- 限制表 `alarm`
--
ALTER TABLE `alarm`
  ADD CONSTRAINT `alarm_warning` FOREIGN KEY (`warning_id`) REFERENCES `warning` (`warning_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_question_id_fk` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_main_id_FK` FOREIGN KEY (`main_id`) REFERENCES `main_menu` (`main_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
