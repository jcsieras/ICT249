-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2013 at 01:09 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `msu_enrollment`
--

-- --------------------------------------------------------

--
-- Table structure for table `akan_account`
--

CREATE TABLE IF NOT EXISTS `akan_account` (
  `akan_account_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`akan_account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `akan_account`
--

INSERT INTO `akan_account` (`akan_account_id`, `student_id`, `password`) VALUES
(1, '2013-12345', '12345678'),
(2, '2012-12354', '12345678'),
(3, '2010-13445', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `cor`
--

CREATE TABLE IF NOT EXISTS `cor` (
  `cor_id` int(11) NOT NULL AUTO_INCREMENT,
  `cor_stat` varchar(10) NOT NULL,
  PRIMARY KEY (`cor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE IF NOT EXISTS `enrollment` (
  `enrollment_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `term_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`enrollment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `student_id`, `term_id`, `schedule_id`) VALUES
(1, '2013-12345', 1, 1),
(2, '2013-12345', 1, 2),
(3, '2013-12345', 1, 3),
(4, '2013-12345', 1, 4),
(5, '2013-12345', 1, 5),
(6, '2012-12354', 1, 6),
(7, '2012-12354', 1, 7),
(8, '2012-12354', 1, 8),
(9, '2012-12354', 1, 9);

-- --------------------------------------------------------

--
-- Table structure for table `prf`
--

CREATE TABLE IF NOT EXISTS `prf` (
  `prf_id` int(11) NOT NULL AUTO_INCREMENT,
  `prf_stat` varchar(20) NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `term_id` int(11) NOT NULL,
  `date_printed` date NOT NULL,
  PRIMARY KEY (`prf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `prf`
--

INSERT INTO `prf` (`prf_id`, `prf_stat`, `student_id`, `term_id`, `date_printed`) VALUES
(1, 'Not Yet Printed', '2013-12345', 1, '0000-00-00'),
(2, 'Printed', '2012-12354', 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(20) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time` varchar(20) NOT NULL,
  `room` varchar(5) NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `subj_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`schedule_id`, `section`, `day`, `time`, `room`, `instructor`, `subj_id`) VALUES
(1, 'Bb', 'MTh', '7:00-8:30AM', '211', 'FYD', 1),
(2, 'Cc', 'MTh', '8:30-10:00AM', '212', 'TRG', 2),
(3, 'Dd', 'MTh', '10:00-11:30AM', '213', 'FYD', 3),
(4, 'Ee', 'MTh', '11:30-1:00PM', '214', 'TRG', 4),
(5, 'Ff', 'MTh', '1:00-2:30PM', '311', 'JYS', 5),
(6, 'Gg', 'MTh', '2:30-4:00PM', '312', 'LKJ', 6),
(7, 'Hh', 'MTh', '4:00-5:30PM', '313', 'FYD', 7),
(8, 'Ii', 'TF', '7:00-8:30AM', '314', 'FYD', 8),
(9, 'Jj', 'TF', '8:30-10:00AM', '212', 'TRG', 9),
(10, 'Kk', 'TF', '8:30-10:00AM', '311', 'JYS', 10),
(11, 'Ll', 'TF', '11:30-1:00PM', '312', 'LKJ', 11),
(12, 'Mm', 'TF', '1:00-2:30PM', '422', 'GTY', 12),
(13, 'Nn', 'TF', '1:00-2:30PM', '324', 'FRT', 13);

-- --------------------------------------------------------

--
-- Table structure for table `soa`
--

CREATE TABLE IF NOT EXISTS `soa` (
  `soa_id` int(11) NOT NULL AUTO_INCREMENT,
  `soa_stat` varchar(10) NOT NULL,
  PRIMARY KEY (`soa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `idnumber` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `course` varchar(20) NOT NULL,
  `college` varchar(20) NOT NULL,
  `scholarhip_stat` varchar(20) NOT NULL,
  `scholastic_stat` varchar(20) NOT NULL,
  PRIMARY KEY (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`idnumber`, `student_id`, `fname`, `lname`, `mname`, `gender`, `course`, `college`, `scholarhip_stat`, `scholastic_stat`) VALUES
(1, '2013-12345', 'BENIGNO', 'AQUINO', 'C', 'MALE', 'BS IT', 'CIT', 'PAYING', 'PROBATIONARY'),
(2, '2012-12354', 'JOSEPH', 'ESTRADA', 'E', 'MALE', 'BS PA', 'CPA', 'TUITION PRIVILEDGE', 'REGULAR'),
(3, '2010-13445', 'GLORIA', 'ARROYO', 'M', 'FEMALE', 'BS ECON', 'CBAA', 'ACADEMIC SCHOLAR', 'REGULAR');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `subj_id` int(11) NOT NULL AUTO_INCREMENT,
  `subj_code` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `units` int(11) NOT NULL,
  `lec_hours` int(11) NOT NULL,
  `lab_hours` int(11) NOT NULL,
  `lec_rate` double NOT NULL,
  `lab_rate` double NOT NULL,
  PRIMARY KEY (`subj_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subj_id`, `subj_code`, `title`, `units`, `lec_hours`, `lab_hours`, `lec_rate`, `lab_rate`) VALUES
(1, 'CSC 100', 'FUNDAMENTAL COMPUTING	', 3, 3, 3, 50, 500),
(2, 'CSC 101', 'INTRODUCTION TO COMPUTER PROGRAMMING 1', 3, 3, 3, 50, 500),
(3, 'CSC 102', 'INTRODUCTION TO COMPUTER PROGRAMMING 2', 3, 3, 3, 50, 500),
(4, 'CSC 1', 'COMPUTER FUNDAMENTALS 1', 3, 2, 3, 50, 500),
(5, 'CSC 2', 'COMPUTER FUNDAMENTALS 2', 3, 2, 4, 50, 500),
(6, 'ENG 1', 'FRESHMEN ENGLISH', 3, 3, 0, 50, 0),
(7, 'ENG 2', 'ENGLISH WRITING', 3, 3, 0, 50, 0),
(8, 'ENG 2', 'ENGLISH WRITING', 3, 3, 0, 50, 0),
(9, 'ENG 3', 'ENGLISH COMMUNICATION', 3, 3, 0, 50, 0),
(10, 'ENG 4', 'ENGLISH LITERATURE', 3, 3, 0, 50, 0),
(11, 'ENG 8', 'TECHNICAL WRITING', 3, 3, 0, 50, 0),
(12, 'MATH 1', 'COLLEGE ALGEBRA', 3, 3, 0, 50, 0),
(13, 'MATH 17', 'COLLEGE ALGEBRA AND TRIGONOMETRY', 6, 6, 0, 50, 0),
(14, 'MATH 51', 'CALCULUS 1', 6, 6, 0, 50, 0),
(15, 'MATH 61', 'CALCULUS 2', 6, 6, 0, 50, 0),
(16, 'ACCNT 101', 'ACCOUNTING 1', 6, 6, 0, 50, 0),
(17, 'ACCNT 102', 'ACCOUNTING 2', 6, 6, 0, 50, 0),
(18, 'CHEM 101', 'COLLEGE CHEMISTRY 1', 5, 3, 5, 50, 300),
(19, 'BIO 1', 'BIOLOGY 1', 3, 2, 2, 50, 200);

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE IF NOT EXISTS `term` (
  `term_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_yr` varchar(20) NOT NULL,
  `semester` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`term_id`, `school_yr`, `semester`, `start_date`) VALUES
(1, '2013-2014', 'First Semester', '2013-06-04'),
(2, '2013-2014', 'Second Semester', '2013-11-04');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
