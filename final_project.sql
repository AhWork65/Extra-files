-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 08, 2022 at 03:28 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) COLLATE utf8_persian_ci NOT NULL DEFAULT '''''',
  `name` varchar(100) COLLATE utf8_persian_ci DEFAULT '''''',
  `family` varchar(100) COLLATE utf8_persian_ci DEFAULT '''''',
  `nationalcode` varchar(50) COLLATE utf8_persian_ci DEFAULT '''''',
  `birth_date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `Type` tinyint(4) DEFAULT '0',
  `Mobile` varchar(50) COLLATE utf8_persian_ci DEFAULT '''''',
  `creation_Date` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Id`, `Code`, `name`, `family`, `nationalcode`, `birth_date`, `status`, `Type`, `Mobile`, `creation_Date`) VALUES
(1, '1', '\'Amir\'', '\'heydari\'', '\'1234567890\'', '2022-03-24', 1, 0, '\'09121234567\'', '2022-03-25'),
(2, '2', '\'test\'', '\'test\'', '\'123\'', '2022-03-01', 0, 0, '\'0912\'', '2022-03-03'),
(3, '3', '\'Ali\'', '\'Ali\'', '\'1234567899\'', '1988-03-24', 0, 0, '\'09121234567\'', '2022-03-25'),
(5, '4', '\'Amir\'', '\'heydari\'', '\'1234567891\'', '2022-03-24', 0, 0, '\'09121234567\'', '2022-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `customer_deposit`
--

DROP TABLE IF EXISTS `customer_deposit`;
CREATE TABLE IF NOT EXISTS `customer_deposit` (
  `customer_id` bigint(50) DEFAULT NULL,
  `deposit_id` bigint(50) DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `deposit_id` (`deposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `customer_deposit`
--

INSERT INTO `customer_deposit` (`customer_id`, `deposit_id`) VALUES
(1, 17),
(1, 1),
(1, 2),
(1, 3),
(1, 11),
(1, 28),
(2, 28),
(3, 28);

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
CREATE TABLE IF NOT EXISTS `deposit` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `Number` varchar(100) COLLATE utf8_persian_ci NOT NULL DEFAULT '''0''',
  `Title` varchar(5000) COLLATE utf8_persian_ci DEFAULT '''''',
  `status` tinyint(4) DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `Currency` tinyint(4) DEFAULT '0',
  `balance` decimal(16,2) DEFAULT '0.00',
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Uniqe Number` (`Number`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `Number`, `Title`, `status`, `type`, `Currency`, `balance`, `open_date`, `close_date`) VALUES
(1, '123456', '\'شماره حساب 1\'', 0, 0, 0, '3.00', '2022-03-24', NULL),
(2, '2', '\'تست 2\'', 0, 0, 0, '12111281556.00', '2022-03-28', NULL),
(3, '34', '\'تست 3\'', 0, 0, 0, '3000000.00', '2022-03-24', NULL),
(11, '35', '\'تست 3\'', 0, 0, 0, '3000000.00', '2022-03-24', NULL),
(17, '37', '\'تست 3\'', 0, 0, 0, '3000000.00', '2022-03-24', NULL),
(23, '38', '\'تست 3\'', 0, 0, 0, '6000000.00', '2022-03-24', NULL),
(28, '39', '\'تست 3\'', 0, 0, 0, '99799850.00', '2022-03-24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '0',
  `InterestRate` tinyint(4) DEFAULT '0',
  `opening_date` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `loanPrice` decimal(32,2) DEFAULT '0.00',
  `totalinstallments` int(11) DEFAULT '0',
  `remainingInstallments` int(11) DEFAULT '0',
  `installmentsPrice` decimal(32,2) DEFAULT '0.00',
  `deposit_id` bigint(50) DEFAULT NULL,
  `Number` varchar(50) COLLATE utf8_persian_ci DEFAULT '''''',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Number` (`Number`),
  KEY `deposit_id` (`deposit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`id`, `type`, `InterestRate`, `opening_date`, `status`, `loanPrice`, `totalinstallments`, `remainingInstallments`, `installmentsPrice`, `deposit_id`, `Number`) VALUES
(1, 0, 1, '2022-04-08', 1, '1000000.00', 10, 7, '100075.00', 28, '12121212');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `todo_date` date DEFAULT NULL,
  `price` decimal(16,2) DEFAULT '0.00',
  `status` tinyint(4) DEFAULT '0',
  `type` tinyint(4) DEFAULT '0',
  `source_number` varchar(50) COLLATE utf8_persian_ci DEFAULT '''''',
  `issue_tracking` varchar(100) COLLATE utf8_persian_ci DEFAULT '''''',
  `description` varchar(5000) COLLATE utf8_persian_ci DEFAULT '''''',
  `destination_number` varchar(50) COLLATE utf8_persian_ci DEFAULT '''''',
  `SourceNumber` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `todo_date`, `price`, `status`, `type`, `source_number`, `issue_tracking`, `description`, `destination_number`, `SourceNumber`) VALUES
(21, '2022-04-08', '1000000.00', 0, 2, '39', '8892c577-43e0-4967-8c91-e9a7a9e8b5d9', NULL, '38', '\'3009\''),
(22, '2022-04-08', '1000000.00', 0, 2, '39', '988f1703-8bd0-4876-9d84-6d60c7280f13', NULL, '38', NULL),
(23, '2022-04-08', '1000000.00', 0, 2, '39', '6abe2c47-184e-4dd6-8485-c034b7bea5de', NULL, '38', NULL),
(24, '2022-04-08', '100075.00', 0, 1, '39', '47598de1-132b-4c0e-b78a-c2fcd82eaf7e', NULL, '', NULL),
(25, '2022-04-08', '100075.00', 0, 1, '39', '8961e24a-35c0-4c46-8644-0ceb01d3f543', NULL, '', NULL),
(26, '2022-04-08', '100075.00', 0, 1, '39', 'ce20a69b-1ed7-47ef-a28a-397f960817ff', NULL, '', NULL),
(27, '2022-04-08', '100075.00', 0, 1, '39', 'f5b99d24-517e-4e27-85cb-83d059acfb90', NULL, '', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_deposit`
--
ALTER TABLE `customer_deposit`
  ADD CONSTRAINT `customer_deposit_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Id`),
  ADD CONSTRAINT `customer_deposit_ibfk_2` FOREIGN KEY (`deposit_id`) REFERENCES `deposit` (`id`);

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`deposit_id`) REFERENCES `deposit` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
