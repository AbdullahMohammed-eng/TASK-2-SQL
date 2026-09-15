-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 15, 2026 at 01:22 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int NOT NULL,
  `CourseName` varchar(100) NOT NULL,
  `Credits` int DEFAULT NULL,
  `InstructorID` int DEFAULT NULL
) ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `CourseName`, `Credits`, `InstructorID`) VALUES
(1, 'Computer Programming (Python)', 3, 1),
(2, 'Modern Mathematics', 4, 2),
(3, 'Database Systems (SQL)', 3, 1),
(4, 'General Physics', 4, 3),
(5, 'Introduction to MySQL', 3, 1),
(6, 'Introduction to MySQL', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `EnrollmentID` int NOT NULL,
  `StudentID` int NOT NULL,
  `CourseID` int NOT NULL,
  `EnrollmentDate` date NOT NULL,
  `Grade` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`EnrollmentID`, `StudentID`, `CourseID`, `EnrollmentDate`, `Grade`) VALUES
(1, 1, 1, '2026-01-10', 'A'),
(2, 1, 3, '2026-01-12', 'A-'),
(3, 2, 2, '2026-01-11', 'B+'),
(4, 2, 4, '2026-01-15', 'B'),
(5, 3, 1, '2026-01-10', 'C+'),
(6, 4, 3, '2026-01-13', 'A'),
(7, 5, 2, '2026-01-14', 'B-');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `InstructorID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `HireDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`InstructorID`, `FirstName`, `LastName`, `Email`, `HireDate`) VALUES
(1, 'Mohamed', 'El-Araky', 'm.elaraky@school.com', '2018-09-01'),
(2, 'Mona', 'Abdel-Fattah', 'm.abdelfattah@school.com', '2020-02-15'),
(3, 'Tarek', 'El-Sayed', 't.elsayed@school.com', '2015-05-10'),
(4, 'Hassan', 'Mahmoud', 'hassan.mahmoud@school.com', '2021-09-01'),
(6, 'Hassan', 'Mahmoud', 'hassan.mahmoud.v2@school.com', '2021-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `BirthDate` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `BirthDate`, `Email`) VALUES
(1, 'Ahmed', 'Mahmoud', '2005-03-15', 'ahmed.m.updated@email.com'),
(2, 'Sara', 'Ali', '2004-07-22', 'sara.ali@email.com'),
(3, 'Omar', 'Hassan', '2005-11-05', 'omar.hassan@email.com'),
(4, 'Mariam', 'Khaled', '2004-01-30', 'mariam.khaled@email.com'),
(5, 'Youssef', 'Ibrahim', '2005-09-12', 'youssef.ibrahim@email.com'),
(6, 'Kareem', 'Samy', '2005-05-20', 'kareem.samy@email.com'),
(9, 'Kareem', 'Samy', '2005-05-20', 'kareem.samy.new@email.com'),
(10, 'Kareem', 'Samy', '2005-05-20', 'kareem.samy.v2@email.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`EnrollmentID`),
  ADD UNIQUE KEY `StudentID` (`StudentID`,`CourseID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`InstructorID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `EnrollmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `InstructorID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`InstructorID`) REFERENCES `instructors` (`InstructorID`) ON DELETE SET NULL;

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
