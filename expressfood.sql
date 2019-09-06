-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 06, 2019 at 09:49 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `bikers`
--

DROP TABLE IF EXISTS `bikers`;
CREATE TABLE IF NOT EXISTS `bikers` (
  `bikerID` int(11) NOT NULL AUTO_INCREMENT,
  `bikerFirstName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bikerLastName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bikerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bikers`
--

INSERT INTO `bikers` (`bikerID`, `bikerFirstName`, `bikerLastName`) VALUES
(1, 'Speed E', 'Gonzalez'),
(2, 'Jeff', 'Gordon'),
(3, 'Lance', 'Armstrong'),
(4, 'Thibaut', 'Pinot'),
(5, 'George', 'Jones'),
(6, 'Laura', 'Wilder'),
(7, 'Tweety', 'Bird');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `clientID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` float DEFAULT NULL,
  PRIMARY KEY (`clientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clientID`, `firstName`, `lastName`, `address`, `distance`) VALUES
(1, 'Andy', 'Warhol', '123 Anywhere Dr, Grand Rapids, MI 49505', NULL),
(2, 'Sandra', 'Dee', '101 Summer Lovin\' Ln, Grand Rapids, MI 49506', NULL),
(3, 'Taylor', 'Lautner', '453 Wolf Way, Grand Rapids, MI 49505', NULL),
(4, 'Joseph', 'Jonas', '8790 Music Blvd, Grand Rapids, MI 49505', NULL),
(5, 'Dolly', 'Parton', '8889 Butterfly Blvd, Grand Rapids, MI 49505', NULL),
(6, 'Cynthia', 'Lauper', '2677 Turnaround Terrace Pl, Grand Rapids, MI 49505', NULL),
(7, 'Peter', 'Piper', '144 Piper Dr, Grand Rapids, MI 49505', NULL),
(8, 'Jessica', 'Lange', '2785 Horror Show St, Grand Rapids, MI 49505', NULL),
(9, 'Liber', 'Aci', '4782 Feather Dr, Grand Rapids, MI 49505', NULL),
(10, 'Euk A', 'Lele', '986 Strum St, Grand Rapids, MI 49505', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
CREATE TABLE IF NOT EXISTS `dishes` (
  `dishID` int(11) NOT NULL AUTO_INCREMENT,
  `dishName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dishType` int(11) NOT NULL COMMENT '1: Main; 2: Dessert',
  PRIMARY KEY (`dishID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`dishID`, `dishName`, `dishType`) VALUES
(1, 'Lasagna', 1),
(2, 'Chicken Parmesan', 1),
(5, 'Tacos', 1),
(6, 'Peach Pie', 2),
(7, 'Cheesecake', 2),
(8, 'Rotisserie Chicken', 1),
(9, 'Brownies', 2),
(10, 'Bacon Cheeseburger', 1),
(11, 'S\'mores Trifle', 2),
(12, 'Yogurt Parfait', 2),
(13, 'Strawberry Shortcake', 2),
(14, 'Meatloaf', 1),
(15, 'Shepherd\'s Pie', 1),
(16, 'Beef Burgundy', 1),
(17, 'Lemon Tart', 2),
(18, 'Apple Crumble', 2),
(19, 'Macaroni and Cheese with Bacon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `menuID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `mainDish1` int(11) NOT NULL,
  `mainDish2` int(11) NOT NULL,
  `dessert1` int(11) NOT NULL,
  `dessert2` int(11) NOT NULL,
  PRIMARY KEY (`menuID`),
  KEY `fk_mainDish1` (`mainDish1`) USING BTREE,
  KEY `fk_mainDish2` (`mainDish2`),
  KEY `fk_dessert1` (`dessert1`),
  KEY `fk_dessert2` (`dessert2`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`menuID`, `date`, `mainDish1`, `mainDish2`, `dessert1`, `dessert2`) VALUES
(1, '2019-08-01', 10, 16, 18, 9),
(2, '2019-08-02', 14, 2, 12, 6),
(3, '2019-08-03', 8, 5, 13, 11),
(4, '2019-08-04', 19, 2, 7, 12),
(5, '2019-08-05', 2, 5, 11, 17),
(6, '2019-08-06', 8, 15, 18, 9),
(7, '2019-08-07', 14, 1, 13, 12),
(8, '2019-08-08', 5, 16, 11, 6),
(9, '2019-08-09', 16, 2, 12, 11),
(10, '2019-08-10', 15, 19, 11, 17),
(11, '2019-08-11', 10, 19, 6, 12),
(12, '2019-08-12', 14, 8, 17, 12),
(13, '2019-08-13', 2, 19, 12, 9),
(14, '2019-08-14', 16, 10, 18, 7),
(15, '2019-08-15', 8, 15, 13, 9),
(16, '2019-08-16', 15, 19, 17, 13),
(17, '2019-08-17', 15, 1, 12, 6),
(18, '2019-08-18', 16, 15, 12, 17),
(19, '2019-08-19', 5, 10, 17, 7),
(20, '2019-08-20', 10, 1, 12, 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `clientID` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  `bikerID` int(11) NOT NULL,
  `mainDish1Quantity` int(11) DEFAULT NULL,
  `mainDish2Quantity` int(11) DEFAULT NULL,
  `dessert1Quantity` int(11) DEFAULT NULL,
  `dessert2Quantity` int(11) DEFAULT NULL,
  `orderedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderID`),
  KEY `fk_cliendID` (`clientID`),
  KEY `fk_menuID` (`menuID`),
  KEY `fk_bikerID` (`bikerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `clientID`, `menuID`, `bikerID`, `mainDish1Quantity`, `mainDish2Quantity`, `dessert1Quantity`, `dessert2Quantity`, `orderedAt`) VALUES
(1, 1, 1, 1, 2, NULL, 18, 0, '2019-08-01 13:19:17'),
(2, 6, 6, 2, NULL, NULL, NULL, 0, '2019-08-06 19:19:17'),
(3, 1, 12, 3, 3, 2, 4, 4, '2019-08-12 12:17:00'),
(4, 4, 15, 4, NULL, 1, 1, NULL, '2019-08-15 15:37:25'),
(5, 8, 17, 5, 3, NULL, 2, 1, '2019-08-17 12:10:12'),
(6, 2, 4, 6, 2, 2, 1, 3, '2019-08-04 11:09:48'),
(7, 10, 11, 7, NULL, 2, 4, 1, '2019-08-11 17:29:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `fk_dessert1` FOREIGN KEY (`dessert1`) REFERENCES `dishes` (`dishID`),
  ADD CONSTRAINT `fk_dessert2` FOREIGN KEY (`dessert2`) REFERENCES `dishes` (`dishID`),
  ADD CONSTRAINT `fk_mainDish1` FOREIGN KEY (`mainDish1`) REFERENCES `dishes` (`dishID`),
  ADD CONSTRAINT `fk_mainDish2` FOREIGN KEY (`mainDish2`) REFERENCES `dishes` (`dishID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_bikerID` FOREIGN KEY (`bikerID`) REFERENCES `bikers` (`bikerID`),
  ADD CONSTRAINT `fk_cliendID` FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`),
  ADD CONSTRAINT `fk_menuID` FOREIGN KEY (`menuID`) REFERENCES `menus` (`menuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
