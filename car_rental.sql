-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 22, 2024 at 01:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `CarID` int(11) NOT NULL,
  `Model` varchar(100) NOT NULL,
  `Make` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `RegistrationYear` year(4) NOT NULL,
  `Description` text DEFAULT NULL,
  `PricePerDay` decimal(10,2) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `FuelType` varchar(50) NOT NULL,
  `Photo1` varchar(255) DEFAULT NULL,
  `Photo2` varchar(255) DEFAULT NULL,
  `Photo3` varchar(255) DEFAULT NULL,
  `Color` varchar(50) DEFAULT NULL,
  `SuitcaseCapacity` int(11) DEFAULT NULL,
  `Consumption` varchar(50) DEFAULT NULL,
  `Horsepower` varchar(50) DEFAULT NULL,
  `Length` varchar(50) DEFAULT NULL,
  `Width` varchar(50) DEFAULT NULL,
  `GearType` varchar(50) DEFAULT NULL,
  `Conditions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`CarID`, `Model`, `Make`, `Type`, `RegistrationYear`, `Description`, `PricePerDay`, `Capacity`, `FuelType`, `Photo1`, `Photo2`, `Photo3`, `Color`, `SuitcaseCapacity`, `Consumption`, `Horsepower`, `Length`, `Width`, `GearType`, `Conditions`) VALUES
(1, 'BMW', 'GER', 'Sedan', '2022', 'The best sport car ever ', 500.00, 4, 'Petrol', 'Project/Photo/BMWm4.1.jpg', 'Project/Photo/BMWm4.2.jpg', 'Project/Photo/BMWm4.3.jpg', 'Gray', 6, 'Moderate', '510', '4794', '1887', 'Automatic', 'Perfect '),
(13, 'BMW', 'GER', 'Sedan', '2022', 'The best sedan ever', 600.00, 5, 'Petrol', 'Project/Photo/BMWm5.1.avif', 'Project/Photo/BMWm5.2.avif', 'Project/Photo/BMWm5.3.avif', 'Red', 15, 'Moderate', '625', '4966', '1903	', 'Automatic', 'Perfect');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `IDNumber` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telephone` varchar(20) NOT NULL,
  `CreditCardDetails` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Role` enum('customer','manager') DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `FullName`, `Address`, `DateOfBirth`, `IDNumber`, `Email`, `Telephone`, `CreditCardDetails`, `Username`, `PasswordHash`, `Role`) VALUES
(1, 'Amer Daghlis', 'Salfit', '2003-10-12', '408595007', 'amerdaghlis10@gmail.com', '0598152215', 'NO', 'Admin', '$2y$10$REGitv4qEi6/T6161dqv4ecp4nXPYoSo9mCEFVuGQStEVrHUEERUa', 'manager'),
(3, 'Amer', 'a', '2003-10-12', '12345', 'amer@gmail.com', '12345', '12345', 'Amer', '$2y$10$REGitv4qEi6/T6161dqv4ecp4nXPYoSo9mCEFVuGQStEVrHUEERUa', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `LocationID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Telephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`LocationID`, `Name`, `Address`, `Telephone`) VALUES
(1, 'Salfit', 'Schools street', '0598******'),
(2, 'Ramallah', 'Al-Bireh', '0599******');

-- --------------------------------------------------------

--
-- Table structure for table `rentals`
--

CREATE TABLE `rentals` (
  `RentalID` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `RentalStartDate` date NOT NULL,
  `RentalEndDate` date NOT NULL,
  `PickUpLocationID` int(11) NOT NULL,
  `ReturnLocationID` int(11) NOT NULL,
  `TotalRentAmount` decimal(10,2) NOT NULL,
  `ReturnInitiated` tinyint(1) DEFAULT 0,
  `ReturnFinalized` tinyint(1) DEFAULT 0,
  `FinalCondition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`CarID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `IDNumber` (`IDNumber`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`LocationID`);

--
-- Indexes for table `rentals`
--
ALTER TABLE `rentals`
  ADD PRIMARY KEY (`RentalID`),
  ADD KEY `CarID` (`CarID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `PickUpLocationID` (`PickUpLocationID`),
  ADD KEY `ReturnLocationID` (`ReturnLocationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `CarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rentals`
--
ALTER TABLE `rentals`
  MODIFY `RentalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rentals`
--
ALTER TABLE `rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `cars` (`CarID`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `rentals_ibfk_3` FOREIGN KEY (`PickUpLocationID`) REFERENCES `locations` (`LocationID`),
  ADD CONSTRAINT `rentals_ibfk_4` FOREIGN KEY (`ReturnLocationID`) REFERENCES `locations` (`LocationID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
