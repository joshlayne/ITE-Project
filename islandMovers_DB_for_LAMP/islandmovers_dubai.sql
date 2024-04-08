-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 06, 2024 at 03:14 PM
-- Server version: 8.3.0
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `islandmovers_dubai`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `CountryID` int NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`CountryID`, `CountryName`) VALUES
(4, 'Dubai');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `CountryID` int DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `CountryID` (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CountryID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`) VALUES
(1, 4, 'Mohammed', 'Abdullah', 'mohammed@example.com', '123456789'),
(2, 4, 'Fatima', 'Al Maktoum', 'fatima@example.com', '987654321'),
(3, 4, 'Youssef', 'Ahmed', 'youssef@example.com', '555123456');

-- --------------------------------------------------------

--
-- Table structure for table `partnerrides`
--

DROP TABLE IF EXISTS `partnerrides`;
CREATE TABLE IF NOT EXISTS `partnerrides` (
  `PartnerRideID` int NOT NULL AUTO_INCREMENT,
  `PartnerID` int DEFAULT NULL,
  `RideID` int DEFAULT NULL,
  `SharingDateTime` datetime DEFAULT NULL,
  `SharingStatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PartnerRideID`),
  KEY `PartnerID` (`PartnerID`),
  KEY `RideID` (`RideID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `partnerrides`
--

INSERT INTO `partnerrides` (`PartnerRideID`, `PartnerID`, `RideID`, `SharingDateTime`, `SharingStatus`) VALUES
(1, 1, 4, '2024-02-12 08:00:00', 'Shared'),
(2, 2, 5, '2024-02-12 10:30:00', 'Not Shared'),
(3, 3, 6, '2024-02-12 12:45:00', 'Shared');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
CREATE TABLE IF NOT EXISTS `partners` (
  `PartnerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `ContactPerson` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `ContractStartDate` date DEFAULT NULL,
  `ContractEndDate` date DEFAULT NULL,
  PRIMARY KEY (`PartnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`PartnerID`, `Name`, `Location`, `ContactPerson`, `Email`, `Phone`, `ContractStartDate`, `ContractEndDate`) VALUES
(1, 'IslandBop', 'Dubai Marina', 'Ahmed Ali', 'ahmed@example.com', '1234567890', '2024-01-01', '2024-12-31'),
(2, 'IslandBop', 'Downtown Dubai', 'Fatima Mohammed', 'fatima@example.com', '9876543210', '2024-02-01', '2024-12-31'),
(3, 'IslandBop', 'Jumeirah Beach', 'Youssef Khan', 'youssef@example.com', '5551234567', '2024-01-15', '2024-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `rides`
--

DROP TABLE IF EXISTS `rides`;
CREATE TABLE IF NOT EXISTS `rides` (
  `RideID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `VehicleID` int DEFAULT NULL,
  `PickupLocation` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `RideDateTime` datetime DEFAULT NULL,
  `RideStatus` varchar(50) DEFAULT NULL,
  `RideCost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`RideID`),
  KEY `UserID` (`UserID`),
  KEY `VehicleID` (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`RideID`, `UserID`, `VehicleID`, `PickupLocation`, `Destination`, `RideDateTime`, `RideStatus`, `RideCost`) VALUES
(4, 1, 4, 'Marina Mall', 'Palm Jumeirah', '2024-02-12 08:00:00', 'Completed', '30.00'),
(5, 2, 5, 'Dubai Mall', 'Burj Khalifa', '2024-02-12 10:30:00', 'Completed', '30.00'),
(6, 3, 6, 'JBR Walk', 'Atlantis The Palm', '2024-02-12 12:45:00', 'Completed', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `taxi_drivers`
--

DROP TABLE IF EXISTS `taxi_drivers`;
CREATE TABLE IF NOT EXISTS `taxi_drivers` (
  `DriverID` int NOT NULL AUTO_INCREMENT,
  `CountryID` int DEFAULT NULL,
  `VehicleID` int DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DriverID`),
  KEY `CountryID` (`CountryID`),
  KEY `VehicleID` (`VehicleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxi_drivers`
--

INSERT INTO `taxi_drivers` (`DriverID`, `CountryID`, `VehicleID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Location`) VALUES
(1, 4, 4, 'Ali', 'Khalid', 'ali@example.com', '123456789', 'Dubai Marina'),
(2, 4, 5, 'Hassan', 'Ahmed', 'hassan@example.com', '987654321', 'Downtown Dubai'),
(3, 4, 6, 'Khalifa', 'Saeed', 'khalifa@example.com', '555123456', 'Jumeirah Beach');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `RideID` int DEFAULT NULL,
  `TransactionDateTime` datetime DEFAULT NULL,
  `TransactionAmount` decimal(10,2) DEFAULT NULL,
  `PaymentMethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `RideID` (`RideID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransactionID`, `CustomerID`, `RideID`, `TransactionDateTime`, `TransactionAmount`, `PaymentMethod`) VALUES
(1, 1, 4, '2024-02-12 08:15:00', '30.00', 'Credit Card'),
(2, 2, 5, '2024-02-12 10:45:00', '25.00', 'Cash'),
(3, 2, 6, '2024-02-12 10:45:00', '25.00', 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `VehicleID` int NOT NULL AUTO_INCREMENT,
  `VehicleType` varchar(255) DEFAULT NULL,
  `LicensePlate` varchar(20) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `CountryID` int DEFAULT NULL,
  PRIMARY KEY (`VehicleID`),
  KEY `CountryID` (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`VehicleID`, `VehicleType`, `LicensePlate`, `Color`, `Year`, `CountryID`) VALUES
(4, 'Sedan', 'ABC123', 'Red', 2020, 4),
(5, 'SUV', 'XYZ789', 'Blue', 2019, 4),
(6, 'Hatchback', 'DEF456', 'Black', 2021, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`);

--
-- Constraints for table `partnerrides`
--
ALTER TABLE `partnerrides`
  ADD CONSTRAINT `partnerrides_ibfk_1` FOREIGN KEY (`PartnerID`) REFERENCES `partners` (`PartnerID`),
  ADD CONSTRAINT `partnerrides_ibfk_2` FOREIGN KEY (`RideID`) REFERENCES `rides` (`RideID`);

--
-- Constraints for table `rides`
--
ALTER TABLE `rides`
  ADD CONSTRAINT `rides_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `rides_ibfk_2` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`);

--
-- Constraints for table `taxi_drivers`
--
ALTER TABLE `taxi_drivers`
  ADD CONSTRAINT `taxi_drivers_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`),
  ADD CONSTRAINT `taxi_drivers_ibfk_2` FOREIGN KEY (`VehicleID`) REFERENCES `vehicles` (`VehicleID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`RideID`) REFERENCES `rides` (`RideID`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
