-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 30, 2024 at 02:38 AM
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
-- Database: `upsDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `enlisted`
--

CREATE TABLE `enlisted` (
  `subject` varchar(20) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enlisted`
--

INSERT INTO `enlisted` (`subject`, `section`, `day`, `start_time`, `end_time`) VALUES
('CMSC124 LAB', 1, 'Tuesday', '11:30:00', '13:00:00'),
('CMSC124 LAB', 2, 'Tuesday', '14:30:00', '16:00:00'),
('CMSC124 LAB', 3, 'Tuesday', '16:00:00', '17:30:00'),
('CMSC124 LAB', 4, 'Tuesday', '13:00:00', '14:30:00'),
('CMSC128 LAB', 1, 'Tuesday', '10:00:00', '11:30:00'),
('CMSC128 LAB', 2, 'Tuesday', '14:30:00', '16:00:00'),
('CMSC128 LAB', 3, 'Tuesday', '16:00:00', '17:30:00'),
('CMSC128 LAB', 4, 'Tuesday', '11:30:00', '13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `subject` varchar(20) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`subject`, `section`, `day`, `start_time`, `end_time`) VALUES
('CMSC124', 1, 'Tuesday', '08:00:00', '09:00:00'),
('CMSC124 LAB', 1, 'Tuesday', '11:30:00', '13:00:00'),
('CMSC124 LAB', 2, 'Tuesday', '14:30:00', '16:00:00'),
('CMSC124', 2, 'Tuesday', '09:00:00', '10:00:00'),
('CMSC124 LAB', 3, 'Tuesday', '16:00:00', '17:30:00'),
('CMSC124 LAB', 4, 'Tuesday', '13:00:00', '14:30:00'),
('CMSC128', 1, 'Tuesday', '08:00:00', '09:00:00'),
('CMSC128 LAB', 1, 'Tuesday', '10:00:00', '11:30:00'),
('CMSC128 LAB', 2, 'Tuesday', '14:30:00', '16:00:00'),
('CMSC128', 2, 'Tuesday', '09:00:00', '10:00:00'),
('CMSC128 LAB', 3, 'Tuesday', '16:00:00', '17:30:00'),
('CMSC128 LAB', 4, 'Tuesday', '11:30:00', '13:00:00'),
('CMSC131', 1, 'Monday', '08:00:00', '09:00:00'),
('CMSC131 LAB', 1, 'Monday', '10:00:00', '11:30:00'),
('CMSC131', 2, 'Monday', '09:00:00', '10:00:00'),
('CMSC131 LAB', 2, 'Monday', '13:00:00', '14:30:00'),
('CMSC131 LAB', 3, 'Monday', '14:30:00', '16:00:00'),
('CMSC131 LAB', 4, 'Wednesday', '10:00:00', '13:00:00'),
('CMSC141', 1, 'Monday', '10:00:00', '11:30:00'),
('CMSC141', 2, 'Monday', '11:30:00', '13:00:00'),
('CMSC134', 1, 'Tuesday', '10:00:00', '11:30:00'),
('CMSC134', 2, 'Tuesday', '11:30:00', '13:00:00'),
('STAT105', 1, 'Wednesday', '08:00:00', '09:00:00'),
('STAT105', 2, 'Wednesday', '09:00:00', '10:00:00'),
('STAT105 LAB', 1, 'Wednesday', '10:00:00', '11:30:00'),
('STAT105 LAB', 2, 'Wednesday', '13:00:00', '14:30:00'),
('STAT105 LAB', 3, 'Wednesday', '14:30:00', '16:00:00'),
('STAT105 LAB', 4, 'Wednesday', '16:00:00', '17:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `student_ID` int(9) NOT NULL,
  `name` varchar(30) NOT NULL,
  `degree_program` varchar(30) NOT NULL,
  `year_level` int(1) NOT NULL,
  `degree_level` varchar(20) NOT NULL,
  `scholarship` varchar(30) NOT NULL,
  `student_id_pic` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`student_ID`, `name`, `degree_program`, `year_level`, `degree_level`, `scholarship`, `student_id_pic`) VALUES
(202208331, 'DARAH VIA D. MOSCOSO', 'B.S. in Computer Science', 2, 'Undergraduate', 'Free Tuition and Other Fees', 'student_id_pic/moscoso.png'),
(202200888, 'PATEGARA, CHRISTALIE HABLADO', 'B.S. in Computer Science', 2, 'Undergraduate', '---', 'student_id_pic/pategara.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `Study_Plan`
--

CREATE TABLE `Study_Plan` (
  `degree_program` varchar(30) NOT NULL,
  `study_plan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Study_Plan`
--

INSERT INTO `Study_Plan` (`degree_program`, `study_plan`) VALUES
('B.S. in Computer Science', 'files/study-plan');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `student_id` int(9) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`student_id`, `password`) VALUES
(202208331, 'moscoso'),
(202200888, 'finalproject');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
