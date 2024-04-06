-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 05, 2024 at 08:16 PM
-- Server version: 8.3.0
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `islandmovers_dominica`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`CountryID`, `CountryName`) VALUES
(2, 'Dominica');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `CountryID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`) VALUES
(1, 2, 'Sophia', 'Smith', 'sophia@example.com', '1234567890'),
(2, 2, 'Ethan', 'Johnson', 'ethan@example.com', '9876543210'),
(3, 2, 'Olivia', 'Williams', 'olivia@example.com', '5551234567');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `partnerrides`
--

INSERT INTO `partnerrides` (`PartnerRideID`, `PartnerID`, `RideID`, `SharingDateTime`, `SharingStatus`) VALUES
(1, 1, 1, '2024-02-12 08:15:00', 'Shared'),
(2, 2, 2, '2024-02-12 10:45:00', 'Not shared'),
(3, 3, 3, '2024-02-12 12:50:00', 'Shared');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`PartnerID`, `Name`, `Location`, `ContactPerson`, `Email`, `Phone`, `ContractStartDate`, `ContractEndDate`) VALUES
(1, 'IslandBop', 'Roseau', 'Sophia Adams', 'sophia@example.com', '1234567890', '2024-01-01', '2024-12-31'),
(2, 'IslandBop', 'Portsmouth', 'Daniel Garcia', 'daniel@example.com', '9876543210', '2024-02-01', '2024-12-31'),
(3, 'IslandBop', 'Marigot', 'Olivia Rodriguez', 'olivia@example.com', '5551234567', '2024-01-15', '2024-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `PromotionID` int NOT NULL AUTO_INCREMENT,
  `CountryID` int DEFAULT NULL,
  `PromotionName` varchar(255) DEFAULT NULL,
  `PromotionType` varchar(50) DEFAULT NULL,
  `PromotionValue` decimal(10,2) DEFAULT NULL,
  `ValidDays` varchar(50) DEFAULT NULL,
  `ValidPeriodStart` datetime DEFAULT NULL,
  `ValidPeriodEnd` datetime DEFAULT NULL,
  PRIMARY KEY (`PromotionID`),
  KEY `CountryID` (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`PromotionID`, `CountryID`, `PromotionName`, `PromotionType`, `PromotionValue`, `ValidDays`, `ValidPeriodStart`, `ValidPeriodEnd`) VALUES
(1, 2, 'Tuesday Discount', 'discount', '5.00', 'Tuesday', '2024-01-01 00:00:00', '2024-12-31 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rides`
--

INSERT INTO `rides` (`RideID`, `UserID`, `VehicleID`, `PickupLocation`, `Destination`, `RideDateTime`, `RideStatus`, `RideCost`) VALUES
(1, 1, 4, 'ABC Street', 'XYZ Street', '2024-02-12 08:00:00', 'Completed', '20.00'),
(2, 2, 5, 'DEF Road', 'GHI Avenue', '2024-02-12 10:30:00', 'Pending', NULL),
(3, 3, 6, 'JKL Lane', 'MNO Boulevard', '2024-02-12 12:45:00', 'Completed', '15.00'),
(7, 1, 4, 'ABC Street', 'XYZ Street', '2024-02-12 08:00:00', 'Completed', '20.00'),
(8, 2, 5, 'DEF Road', 'GHI Avenue', '2024-02-12 10:30:00', 'Pending', NULL),
(9, 3, 6, 'JKL Lane', 'MNO Boulevard', '2024-02-12 12:45:00', 'Completed', '15.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `taxi_drivers`
--

INSERT INTO `taxi_drivers` (`DriverID`, `CountryID`, `VehicleID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Location`) VALUES
(4, 2, 4, 'Michael', 'Jones', 'michael@example.com', '1234567890', 'Roseau'),
(5, 2, 5, 'Emma', 'Williams', 'emma@example.com', '9876543210', 'Portsmouth'),
(6, 2, 6, 'David', 'Brown', 'david@example.com', '5551234567', 'Grand Bay');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransactionID`, `CustomerID`, `RideID`, `TransactionDateTime`, `TransactionAmount`, `PaymentMethod`) VALUES
(1, 1, 1, '2024-02-12 08:30:00', '20.00', 'Credit Card'),
(2, 2, 2, '2024-02-12 11:00:00', NULL, 'Cash'),
(3, 3, 3, '2024-02-12 13:00:00', '15.00', 'Credit Card');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`VehicleID`, `VehicleType`, `LicensePlate`, `Color`, `Year`, `CountryID`) VALUES
(4, 'Sedan', 'ABC123', 'Red', 2020, 2),
(5, 'SUV', 'XYZ789', 'Blue', 2019, 2),
(6, 'Hatchback', 'DEF456', 'Black', 2021, 2);

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
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`CountryID`) REFERENCES `countries` (`CountryID`);

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
