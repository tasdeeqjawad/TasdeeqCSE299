-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 05:04 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `train_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_id` int(200) NOT NULL,
  `Admin_name` varchar(200) NOT NULL,
  `Passwrd` varchar(200) NOT NULL,
  `customer_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(10)  NOT NULL,
  `Fname` varchar(10) NOT NULL,
  `Lname` varchar(10) NOT NULL,
  `Email` varchar(10) DEFAULT NULL,
  `Age` int(10) DEFAULT NULL CHECK (`Age` >= 18),
  `Gender` varchar(10) DEFAULT NULL,
  `Passwrd` varchar(10) NOT NULL,
  `Phone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Location_name` varchar(200) NOT NULL,
  `Description` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(200) NOT NULL,
  `payment_method` varchar(200) NOT NULL,
  `reservation_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(200) NOT NULL,
  `total_fare` int(200) NOT NULL,
  `no_of_ticket` int(200) NOT NULL,
  `train_no` int(200) NOT NULL,
  `customer_id` int(200) NOT NULL,
  `location_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `capacity` int(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  `ticket_price` int(200) NOT NULL,
  `train_no` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `station_name` varchar(200) NOT NULL,
  `location_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(200) NOT NULL,
  `Arrival_time` int(200) NOT NULL,
  `Depart_time` int(200) NOT NULL,
  `reservation_id` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_No` int(11) NOT NULL,
  `Name_of_Trains` varchar(512) DEFAULT NULL,
  `Off_day` varchar(512) DEFAULT NULL,
  `Starting_Station` varchar(512) DEFAULT NULL,
  `Departure_Time` varchar(512) DEFAULT NULL,
  `Arrival_station` varchar(512) DEFAULT NULL,
  `Arrival_Time` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_No`, `Name_of_Trains`, `Off_day`, `Starting_Station`, `Departure_Time`, `Arrival_station`, `Arrival_Time`) VALUES
(701, 'Subarna Express', 'Friday', 'Chittagong', '7:00', 'Dhaka', '12:40'),
(702, 'Subarna Express', 'Friday', 'Dhaka', '15:00', 'Chittagong', '20:30'),
(703, 'Mohanagar Goduli', 'No', 'Chittagong', '15:00', 'Dhaka', '22:15'),
(704, 'Mohanagar Provati', 'No', 'Dhaka', '7:45', 'Chittagong', '14:55'),
(705, 'Ekota Express', 'Tuesday', 'Dhaka', '10:00', 'Dinajpur', '19:45'),
(706, 'Ekota Express', 'Monday', 'Dinajpur', '21:20', 'Dhaka', '7:10'),
(707, 'Tista Express', 'Monday', 'Dhaka', '7:30', 'Dewangong', '12:45'),
(708, 'Tista Express', 'Monday', 'Dewangong', '15:00', 'Dhaka', '20:45'),
(709, 'Parabat Express', 'Tuesday', 'Dhaka', '6:35', 'Sylhet', '13:40'),
(710, 'Parabat Express', 'Tuesday', 'Sylhet', '15:00', 'Dhaka', '22:25'),
(711, 'Upukol Express', 'Wednesday', 'Noakhali', '6:00', 'Dhaka', '12:30'),
(712, 'Upukol Express', 'Tuesday', 'Dhaka', '15:20', 'Noakhali', '21:40'),
(713, 'Karutoa Express', 'No', 'Santahar', '16:25', 'Borimari', '22:30'),
(714, 'Karutoa Express', 'No', 'Borimari', '17:00', 'Santahar', '23:10'),
(717, 'Joyantika Express', 'No', 'Dhaka', '12:00', 'Sylhet', '19:45'),
(718, 'Joyantika Express', 'Thursday', 'Sylhet', '8:40', 'Dhaka', '16:20'),
(719, 'Paharika Express', 'Monday', 'Chittagong', '8:45', 'Sylhet', '18:00'),
(720, 'Paharika Express', 'Saturday', 'Sylhet', '10:15', 'Chittagong', '20:05'),
(721, 'Mohanagar Express', 'Sunday', 'Chittagong', '12:30', 'Dhaka', '19:30'),
(722, 'Mohanagar Express', 'Sunday', 'Dhaka', '21:00', 'Chittagong', '5:00'),
(723, 'Uddayan Express', 'Saturday', 'Chittagong', '21:45', 'Sylhet', '6:55'),
(724, 'Uddayan Express', 'Sunday', 'Sylhet', '21:20', 'Chittagong', '6:35'),
(729, 'Meghna Express', 'No', 'Chittagong', '17:15', 'Chandpur', '22:00'),
(730, 'Meghna Express', 'No', 'Chandpur', '5:00', 'Chittagong', '10:00'),
(735, 'Agnibina Express', 'No', 'Dhaka', '9:40', 'Tarakandi', '15:20'),
(736, 'Agnibina Express', 'No', 'Tarakandi', '16:30', 'Dhaka', '23:00'),
(737, 'Egarosindhur Provati', 'Wednesday', 'Dhaka', '7:15', 'Kisoregonj', '11:15'),
(738, 'Egarosindhur Provati', 'No', 'Kisoregonj', '6:45', 'Dhaka', '10:45'),
(739, 'Upaban Express', 'Wednesday', 'Dhaka', '21:50', 'Sylhet', '5:30'),
(740, 'Upaban Express', 'No', 'Sylhet', '22:00', 'Dhaka', '5:25'),
(741, 'Turna Express', 'No', 'Chittagong', '23:00', 'Dhaka', '6:30'),
(742, 'Turna Express', 'No', 'Dhaka', '23:30', 'Chittagong', '7:10'),
(743, 'Bharamaputra', 'No', 'Dhaka', '18:00', 'Dewangong', '0:20'),
(744, 'Bharamaputra', 'No', 'Dewangong', '6:30', 'Dhaka', '12:50'),
(745, 'Jamuna Express', 'No', 'Dhaka', '16:40', 'B.B. East', '0:20'),
(746, 'Jamuna Express', 'No', 'B.B. East', '1:10', 'Dhaka', '8:00'),
(749, 'Egarosindhur Goduli', 'No', 'Dhaka', '18:30', 'Kisoregonj', '22:45'),
(750, 'Egarosindhur Goduli', 'Wednesday', 'Kisoregonj', '12:30', 'Dhaka', '16:45'),
(751, 'Lalmoni Express', 'Friday', 'Dhaka', '22:10', 'Lalmonirhat', '8:20'),
(752, 'Lalmoni Express', 'Friday', 'Lalmonirhat', '10:40', 'Dhaka', '21:05'),
(757, 'Drutojan Express', 'Wednesday', 'Dhaka', '19:40', 'Dinajpur', '5:30'),
(758, 'Drutojan Express', 'Wednesday', 'Dinajpur', '7:40', 'Dhaka', '17:55'),
(767, 'Dolonchapa Express', 'No', 'Santahar', '13:30', 'Dinajpur', '20:30'),
(768, 'Dolonchapa Express', 'No', 'Dinajpur', '5:40', 'Santahar', '12:20'),
(771, 'Rangpur Express', 'Sunday', 'Dhaka', '9:00', 'Rangpur', '19:00'),
(772, 'Rangpur Express', 'Sunday', 'Rangpur', '20:00', 'Dhaka', '6:05'),
(773, 'Kalani Express', 'Friday', 'Dhaka', '16:00', 'Sylhet', '22:45'),
(774, 'Kalani Express', 'Friday', 'Sylhet', '7:00', 'Dhaka', '14:10'),
(777, 'Haor Express', 'Wednesday', 'Dhaka', '23:50', 'Mohangonj', '6:10'),
(778, 'Haor Express', 'Thursday', 'Mohangonj', '8:30', 'Dhaka', '15:00'),
(781, 'Kishorgonj Express', 'Friday', 'Dhaka', '10:20', 'Kishorgonj', '14:15'),
(782, 'Kishorgonj Express', 'Friday', 'Kishorgonj', '14:40', 'Dhaka', '18:50'),
(783, 'Bijoy Express', 'Wednesday', 'Chittagong', '7:20', 'Mymensingh', '16:45'),
(784, 'Bijoy Express', 'Tuesday', 'Mymensingh', '20:00', 'Chittagong', '5:30'),
(787, 'Sonar Bangla Express', 'Saturday', 'Chittagong', '17:00', 'Dhaka', '22:40'),
(788, 'Sonar Bangla Express', 'Saturday', 'Dhaka', '7:00', 'Chittagong', '12:40'),
(789, 'Mohangonj Express', 'Monday', 'Dhaka', '12:20', 'Mohangonj', '18:50'),
(790, 'Mohangonj Express', 'Monday', 'Mohangonj', '22:00', 'Dhaka', '4:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Location_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `train_no` (`train_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `location_name` (`location_name`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`capacity`),
  ADD KEY `train_no` (`train_no`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_name`),
  ADD KEY `location_name` (`location_name`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_No`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `train` (`Train_No`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`Customer_ID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`location_name`) REFERENCES `location` (`Location_name`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `train` (`Train_No`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`location_name`) REFERENCES `location` (`Location_name`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
