-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 09:32 AM
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
-- Database: `ccc_worldwide`
--

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone1` varchar(255) NOT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `statename` varchar(255) NOT NULL,
  `nationalcode` varchar(255) DEFAULT NULL,
  `scode` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `email`, `phone1`, `phone2`, `country`, `state`, `city`, `address`, `statename`, `nationalcode`, `scode`, `category`, `created_at`, `updated_at`) VALUES
(1, 'olorunloga@gmail.com', '+2347066406443', '+2347066406443', 'Nigeria', 'Lagos', 'Ekoro', 'olorunloga close ekoro road', 'CCC-Olorunloga', 'NIG01', 'LA01', 'state', '2024-02-18 14:36:23', '2024-02-18 14:36:23'),
(2, 'Kut@gmail.com', '+2348138094492', '+2348030553054', 'Nigeria', 'Lagos', 'Agegge', 'Address', 'CCC-RHODE', 'NIG01', 'LA02', 'state', '2024-03-05 11:52:50', '2024-03-05 11:52:50'),
(0, 'Tejuoso@gmail.com', '+2349061125871', '+2349061125871', 'Nigeria', 'Lagos', 'Lagos', 'Tejuoso', 'Tejuoso', 'LA01', 'LA03', 'state', '2024-09-15 10:02:44', '2024-09-15 10:02:44');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
