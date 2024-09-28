-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2024 at 09:31 AM
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
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `flag_img` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `short_name`, `flag_img`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 'wisdom_countrypkg/img/country_flags/AF.png', '93', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(2, 'Albania', 'AL', 'wisdom_countrypkg/img/country_flags/AL.png', '355', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(3, 'Algeria', 'DZ', 'wisdom_countrypkg/img/country_flags/DZ.png', '213', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(4, 'American Samoa', 'AS', 'wisdom_countrypkg/img/country_flags/AS.png', '1684', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(5, 'Andorra', 'AD', 'wisdom_countrypkg/img/country_flags/AD.png', '376', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(6, 'Angola', 'AO', 'wisdom_countrypkg/img/country_flags/AO.png', '244', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(7, 'Anguilla', 'AI', 'wisdom_countrypkg/img/country_flags/AI.png', '1264', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(8, 'Antarctica', 'AQ', 'wisdom_countrypkg/img/country_flags/AQ.png', '0', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(9, 'Antigua And Barbuda', 'AG', 'wisdom_countrypkg/img/country_flags/AG.png', '1268', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(10, 'Argentina', 'AR', 'wisdom_countrypkg/img/country_flags/AR.png', '54', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(11, 'Armenia', 'AM', 'wisdom_countrypkg/img/country_flags/AM.png', '374', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(12, 'Aruba', 'AW', 'wisdom_countrypkg/img/country_flags/AW.png', '297', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(13, 'Australia', 'AU', 'wisdom_countrypkg/img/country_flags/AU.png', '61', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(14, 'Austria', 'AT', 'wisdom_countrypkg/img/country_flags/AT.png', '43', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(15, 'Azerbaijan', 'AZ', 'wisdom_countrypkg/img/country_flags/AZ.png', '994', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(16, 'Bahamas The', 'BS', 'wisdom_countrypkg/img/country_flags/BS.png', '1242', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(17, 'Bahrain', 'BH', 'wisdom_countrypkg/img/country_flags/BH.png', '973', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(18, 'Bangladesh', 'BD', 'wisdom_countrypkg/img/country_flags/BD.png', '880', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(19, 'Barbados', 'BB', 'wisdom_countrypkg/img/country_flags/BB.png', '1246', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(20, 'Belarus', 'BY', 'wisdom_countrypkg/img/country_flags/BY.png', '375', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(21, 'Belgium', 'BE', 'wisdom_countrypkg/img/country_flags/BE.png', '32', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(22, 'Belize', 'BZ', 'wisdom_countrypkg/img/country_flags/BZ.png', '501', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(23, 'Benin', 'BJ', 'wisdom_countrypkg/img/country_flags/BJ.png', '229', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(24, 'Bermuda', 'BM', 'wisdom_countrypkg/img/country_flags/BM.png', '1441', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(25, 'Bhutan', 'BT', 'wisdom_countrypkg/img/country_flags/BT.png', '975', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(26, 'Bolivia', 'BO', 'wisdom_countrypkg/img/country_flags/BO.png', '591', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(27, 'Bosnia and Herzegovina', 'BA', 'wisdom_countrypkg/img/country_flags/BA.png', '387', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(28, 'Botswana', 'BW', 'wisdom_countrypkg/img/country_flags/BW.png', '267', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(29, 'Bouvet Island', 'BV', 'wisdom_countrypkg/img/country_flags/BV.png', '0', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(30, 'Brazil', 'BR', 'wisdom_countrypkg/img/country_flags/BR.png', '55', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(31, 'British Indian Ocean Territory', 'IO', 'wisdom_countrypkg/img/country_flags/IO.png', '246', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(32, 'Brunei', 'BN', 'wisdom_countrypkg/img/country_flags/BN.png', '673', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(33, 'Bulgaria', 'BG', 'wisdom_countrypkg/img/country_flags/BG.png', '359', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(34, 'Burkina Faso', 'BF', 'wisdom_countrypkg/img/country_flags/BF.png', '226', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(35, 'Burundi', 'BI', 'wisdom_countrypkg/img/country_flags/BI.png', '257', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(36, 'Cambodia', 'KH', 'wisdom_countrypkg/img/country_flags/KH.png', '855', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(37, 'Cameroon', 'CM', 'wisdom_countrypkg/img/country_flags/CM.png', '237', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(38, 'Canada', 'CA', 'wisdom_countrypkg/img/country_flags/CA.png', '1', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(39, 'Cape Verde', 'CV', 'wisdom_countrypkg/img/country_flags/CV.png', '238', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(40, 'Cayman Islands', 'KY', 'wisdom_countrypkg/img/country_flags/KY.png', '1345', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(41, 'Central African Republic', 'CF', 'wisdom_countrypkg/img/country_flags/CF.png', '236', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(42, 'Chad', 'TD', 'wisdom_countrypkg/img/country_flags/TD.png', '235', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(43, 'Chile', 'CL', 'wisdom_countrypkg/img/country_flags/CL.png', '56', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(44, 'China', 'CN', 'wisdom_countrypkg/img/country_flags/CN.png', '86', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(45, 'Christmas Island', 'CX', 'wisdom_countrypkg/img/country_flags/CX.png', '61', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(46, 'Cocos (Keeling) Islands', 'CC', 'wisdom_countrypkg/img/country_flags/CC.png', '672', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(47, 'Colombia', 'CO', 'wisdom_countrypkg/img/country_flags/CO.png', '57', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(48, 'Comoros', 'KM', 'wisdom_countrypkg/img/country_flags/KM.png', '269', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(49, 'Cook Islands', 'CK', 'wisdom_countrypkg/img/country_flags/CK.png', '682', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(50, 'Costa Rica', 'CR', 'wisdom_countrypkg/img/country_flags/CR.png', '506', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(51, 'Cote D\'Ivoire (Ivory Coast)', 'CI', 'wisdom_countrypkg/img/country_flags/CI.png', '225', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(52, 'Croatia (Hrvatska)', 'HR', 'wisdom_countrypkg/img/country_flags/HR.png', '385', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(53, 'Cuba', 'CU', 'wisdom_countrypkg/img/country_flags/CU.png', '53', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(54, 'Cyprus', 'CY', 'wisdom_countrypkg/img/country_flags/CY.png', '357', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(55, 'Czech Republic', 'CZ', 'wisdom_countrypkg/img/country_flags/CZ.png', '420', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(56, 'Democratic Republic Of The Congo', 'CD', 'wisdom_countrypkg/img/country_flags/CD.png', '243', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(57, 'Denmark', 'DK', 'wisdom_countrypkg/img/country_flags/DK.png', '45', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(58, 'Djibouti', 'DJ', 'wisdom_countrypkg/img/country_flags/DJ.png', '253', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(59, 'Dominica', 'DM', 'wisdom_countrypkg/img/country_flags/DM.png', '1767', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(60, 'Dominican Republic', 'DO', 'wisdom_countrypkg/img/country_flags/DO.png', '1809', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(61, 'East Timor', 'TP', 'wisdom_countrypkg/img/country_flags/TP.png', '670', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(62, 'Ecuador', 'EC', 'wisdom_countrypkg/img/country_flags/EC.png', '593', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(63, 'Egypt', 'EG', 'wisdom_countrypkg/img/country_flags/EG.png', '20', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(64, 'El Salvador', 'SV', 'wisdom_countrypkg/img/country_flags/SV.png', '503', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(65, 'Equatorial Guinea', 'GQ', 'wisdom_countrypkg/img/country_flags/GQ.png', '240', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(66, 'Eritrea', 'ER', 'wisdom_countrypkg/img/country_flags/ER.png', '291', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(67, 'Estonia', 'EE', 'wisdom_countrypkg/img/country_flags/EE.png', '372', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(68, 'Ethiopia', 'ET', 'wisdom_countrypkg/img/country_flags/ET.png', '251', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(69, 'Falkland Islands', 'FK', 'wisdom_countrypkg/img/country_flags/FK.png', '500', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(70, 'Faroe Islands', 'FO', 'wisdom_countrypkg/img/country_flags/FO.png', '298', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(71, 'Fiji Islands', 'FJ', 'wisdom_countrypkg/img/country_flags/FJ.png', '679', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(72, 'Finland', 'FI', 'wisdom_countrypkg/img/country_flags/FI.png', '358', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(73, 'France', 'FR', 'wisdom_countrypkg/img/country_flags/FR.png', '33', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(74, 'French Guiana', 'GF', 'wisdom_countrypkg/img/country_flags/GF.png', '594', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(75, 'French Polynesia', 'PF', 'wisdom_countrypkg/img/country_flags/PF.png', '689', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(76, 'French Southern Territories', 'TF', 'wisdom_countrypkg/img/country_flags/TF.png', '0', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(77, 'Gabon', 'GA', 'wisdom_countrypkg/img/country_flags/GA.png', '241', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(78, 'Gambia The', 'GM', 'wisdom_countrypkg/img/country_flags/GM.png', '220', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(79, 'Georgia', 'GE', 'wisdom_countrypkg/img/country_flags/GE.png', '995', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(80, 'Germany', 'DE', 'wisdom_countrypkg/img/country_flags/DE.png', '49', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(81, 'Ghana', 'GH', 'wisdom_countrypkg/img/country_flags/GH.png', '233', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(82, 'Gibraltar', 'GI', 'wisdom_countrypkg/img/country_flags/GI.png', '350', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(83, 'Greece', 'GR', 'wisdom_countrypkg/img/country_flags/GR.png', '30', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(84, 'Greenland', 'GL', 'wisdom_countrypkg/img/country_flags/GL.png', '299', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(85, 'Grenada', 'GD', 'wisdom_countrypkg/img/country_flags/GD.png', '1473', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(86, 'Guadeloupe', 'GP', 'wisdom_countrypkg/img/country_flags/GP.png', '590', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(87, 'Guam', 'GU', 'wisdom_countrypkg/img/country_flags/GU.png', '1671', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(88, 'Guatemala', 'GT', 'wisdom_countrypkg/img/country_flags/GT.png', '502', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(89, 'Guernsey and Alderney', 'XU', 'wisdom_countrypkg/img/country_flags/XU.png', '44', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(90, 'Guinea', 'GN', 'wisdom_countrypkg/img/country_flags/GN.png', '224', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(91, 'Guinea-Bissau', 'GW', 'wisdom_countrypkg/img/country_flags/GW.png', '245', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(92, 'Guyana', 'GY', 'wisdom_countrypkg/img/country_flags/GY.png', '592', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(93, 'Haiti', 'HT', 'wisdom_countrypkg/img/country_flags/HT.png', '509', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(94, 'Heard and McDonald Islands', 'HM', 'wisdom_countrypkg/img/country_flags/HM.png', '0', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(95, 'Honduras', 'HN', 'wisdom_countrypkg/img/country_flags/HN.png', '504', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(96, 'Hong Kong S.A.R.', 'HK', 'wisdom_countrypkg/img/country_flags/HK.png', '852', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(97, 'Hungary', 'HU', 'wisdom_countrypkg/img/country_flags/HU.png', '36', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(98, 'Iceland', 'IS', 'wisdom_countrypkg/img/country_flags/IS.png', '354', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(99, 'India', 'IN', 'wisdom_countrypkg/img/country_flags/IN.png', '91', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(100, 'Indonesia', 'ID', 'wisdom_countrypkg/img/country_flags/ID.png', '62', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(101, 'Iran', 'IR', 'wisdom_countrypkg/img/country_flags/IR.png', '98', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(102, 'Iraq', 'IQ', 'wisdom_countrypkg/img/country_flags/IQ.png', '964', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(103, 'Ireland', 'IE', 'wisdom_countrypkg/img/country_flags/IE.png', '353', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(104, 'Israel', 'IL', 'wisdom_countrypkg/img/country_flags/IL.png', '972', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(105, 'Italy', 'IT', 'wisdom_countrypkg/img/country_flags/IT.png', '39', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(106, 'Jamaica', 'JM', 'wisdom_countrypkg/img/country_flags/JM.png', '1876', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(107, 'Japan', 'JP', 'wisdom_countrypkg/img/country_flags/JP.png', '81', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(108, 'Jersey', 'XJ', 'wisdom_countrypkg/img/country_flags/XJ.png', '44', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(109, 'Jordan', 'JO', 'wisdom_countrypkg/img/country_flags/JO.png', '962', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(110, 'Kazakhstan', 'KZ', 'wisdom_countrypkg/img/country_flags/KZ.png', '7', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(111, 'Kenya', 'KE', 'wisdom_countrypkg/img/country_flags/KE.png', '254', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(112, 'Kiribati', 'KI', 'wisdom_countrypkg/img/country_flags/KI.png', '686', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(113, 'Korea North', 'KP', 'wisdom_countrypkg/img/country_flags/KP.png', '850', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(114, 'Korea South', 'KR', 'wisdom_countrypkg/img/country_flags/KR.png', '82', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(115, 'Kuwait', 'KW', 'wisdom_countrypkg/img/country_flags/KW.png', '965', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(116, 'Kyrgyzstan', 'KG', 'wisdom_countrypkg/img/country_flags/KG.png', '996', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(117, 'Laos', 'LA', 'wisdom_countrypkg/img/country_flags/LA.png', '856', '2024-01-13 14:27:32', '2024-01-13 14:27:32'),
(118, 'Latvia', 'LV', 'wisdom_countrypkg/img/country_flags/LV.png', '371', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(119, 'Lebanon', 'LB', 'wisdom_countrypkg/img/country_flags/LB.png', '961', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(120, 'Lesotho', 'LS', 'wisdom_countrypkg/img/country_flags/LS.png', '266', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(121, 'Liberia', 'LR', 'wisdom_countrypkg/img/country_flags/LR.png', '231', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(122, 'Libya', 'LY', 'wisdom_countrypkg/img/country_flags/LY.png', '218', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(123, 'Liechtenstein', 'LI', 'wisdom_countrypkg/img/country_flags/LI.png', '423', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(124, 'Lithuania', 'LT', 'wisdom_countrypkg/img/country_flags/LT.png', '370', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(125, 'Luxembourg', 'LU', 'wisdom_countrypkg/img/country_flags/LU.png', '352', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(126, 'Macau S.A.R.', 'MO', 'wisdom_countrypkg/img/country_flags/MO.png', '853', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(127, 'Macedonia', 'MK', 'wisdom_countrypkg/img/country_flags/MK.png', '389', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(128, 'Madagascar', 'MG', 'wisdom_countrypkg/img/country_flags/MG.png', '261', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(129, 'Malawi', 'MW', 'wisdom_countrypkg/img/country_flags/MW.png', '265', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(130, 'Malaysia', 'MY', 'wisdom_countrypkg/img/country_flags/MY.png', '60', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(131, 'Maldives', 'MV', 'wisdom_countrypkg/img/country_flags/MV.png', '960', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(132, 'Mali', 'ML', 'wisdom_countrypkg/img/country_flags/ML.png', '223', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(133, 'Malta', 'MT', 'wisdom_countrypkg/img/country_flags/MT.png', '356', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(134, 'Man (Isle of)', 'XM', 'wisdom_countrypkg/img/country_flags/XM.png', '44', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(135, 'Marshall Islands', 'MH', 'wisdom_countrypkg/img/country_flags/MH.png', '692', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(136, 'Martinique', 'MQ', 'wisdom_countrypkg/img/country_flags/MQ.png', '596', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(137, 'Mauritania', 'MR', 'wisdom_countrypkg/img/country_flags/MR.png', '222', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(138, 'Mauritius', 'MU', 'wisdom_countrypkg/img/country_flags/MU.png', '230', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(139, 'Mayotte', 'YT', 'wisdom_countrypkg/img/country_flags/YT.png', '269', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(140, 'Mexico', 'MX', 'wisdom_countrypkg/img/country_flags/MX.png', '52', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(141, 'Micronesia', 'FM', 'wisdom_countrypkg/img/country_flags/FM.png', '691', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(142, 'Moldova', 'MD', 'wisdom_countrypkg/img/country_flags/MD.png', '373', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(143, 'Monaco', 'MC', 'wisdom_countrypkg/img/country_flags/MC.png', '377', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(144, 'Mongolia', 'MN', 'wisdom_countrypkg/img/country_flags/MN.png', '976', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(145, 'Montserrat', 'MS', 'wisdom_countrypkg/img/country_flags/MS.png', '1664', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(146, 'Morocco', 'MA', 'wisdom_countrypkg/img/country_flags/MA.png', '212', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(147, 'Mozambique', 'MZ', 'wisdom_countrypkg/img/country_flags/MZ.png', '258', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(148, 'Myanmar', 'MM', 'wisdom_countrypkg/img/country_flags/MM.png', '95', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(149, 'Namibia', 'NA', 'wisdom_countrypkg/img/country_flags/NA.png', '264', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(150, 'Nauru', 'NR', 'wisdom_countrypkg/img/country_flags/NR.png', '674', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(151, 'Nepal', 'NP', 'wisdom_countrypkg/img/country_flags/NP.png', '977', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(152, 'Netherlands Antilles', 'AN', 'wisdom_countrypkg/img/country_flags/AN.png', '599', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(153, 'Netherlands The', 'NL', 'wisdom_countrypkg/img/country_flags/NL.png', '31', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(154, 'New Caledonia', 'NC', 'wisdom_countrypkg/img/country_flags/NC.png', '687', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(155, 'New Zealand', 'NZ', 'wisdom_countrypkg/img/country_flags/NZ.png', '64', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(156, 'Nicaragua', 'NI', 'wisdom_countrypkg/img/country_flags/NI.png', '505', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(157, 'Niger', 'NE', 'wisdom_countrypkg/img/country_flags/NE.png', '227', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(158, 'Nigeria', 'NG', 'wisdom_countrypkg/img/country_flags/NG.png', '234', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(159, 'Niue', 'NU', 'wisdom_countrypkg/img/country_flags/NU.png', '683', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(160, 'Norfolk Island', 'NF', 'wisdom_countrypkg/img/country_flags/NF.png', '672', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(161, 'Northern Mariana Islands', 'MP', 'wisdom_countrypkg/img/country_flags/MP.png', '1670', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(162, 'Norway', 'NO', 'wisdom_countrypkg/img/country_flags/NO.png', '47', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(163, 'Oman', 'OM', 'wisdom_countrypkg/img/country_flags/OM.png', '968', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(164, 'Pakistan', 'PK', 'wisdom_countrypkg/img/country_flags/PK.png', '92', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(165, 'Palau', 'PW', 'wisdom_countrypkg/img/country_flags/PW.png', '680', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(166, 'Palestinian Territory Occupied', 'PS', 'wisdom_countrypkg/img/country_flags/PS.png', '970', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(167, 'Panama', 'PA', 'wisdom_countrypkg/img/country_flags/PA.png', '507', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(168, 'Papua new Guinea', 'PG', 'wisdom_countrypkg/img/country_flags/PG.png', '675', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(169, 'Paraguay', 'PY', 'wisdom_countrypkg/img/country_flags/PY.png', '595', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(170, 'Peru', 'PE', 'wisdom_countrypkg/img/country_flags/PE.png', '51', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(171, 'Philippines', 'PH', 'wisdom_countrypkg/img/country_flags/PH.png', '63', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(172, 'Pitcairn Island', 'PN', 'wisdom_countrypkg/img/country_flags/PN.png', '0', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(173, 'Poland', 'PL', 'wisdom_countrypkg/img/country_flags/PL.png', '48', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(174, 'Portugal', 'PT', 'wisdom_countrypkg/img/country_flags/PT.png', '351', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(175, 'Puerto Rico', 'PR', 'wisdom_countrypkg/img/country_flags/PR.png', '1787', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(176, 'Qatar', 'QA', 'wisdom_countrypkg/img/country_flags/QA.png', '974', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(177, 'Republic Of The Congo', 'CG', 'wisdom_countrypkg/img/country_flags/CG.png', '242', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(178, 'Reunion', 'RE', 'wisdom_countrypkg/img/country_flags/RE.png', '262', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(179, 'Romania', 'RO', 'wisdom_countrypkg/img/country_flags/RO.png', '40', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(180, 'Russia', 'RU', 'wisdom_countrypkg/img/country_flags/RU.png', '70', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(181, 'Rwanda', 'RW', 'wisdom_countrypkg/img/country_flags/RW.png', '250', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(182, 'Saint Helena', 'SH', 'wisdom_countrypkg/img/country_flags/SH.png', '290', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(183, 'Saint Kitts And Nevis', 'KN', 'wisdom_countrypkg/img/country_flags/KN.png', '1869', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(184, 'Saint Lucia', 'LC', 'wisdom_countrypkg/img/country_flags/LC.png', '1758', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(185, 'Saint Pierre and Miquelon', 'PM', 'wisdom_countrypkg/img/country_flags/PM.png', '508', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(186, 'Saint Vincent And The Grenadines', 'VC', 'wisdom_countrypkg/img/country_flags/VC.png', '1784', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(187, 'Samoa', 'WS', 'wisdom_countrypkg/img/country_flags/WS.png', '684', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(188, 'San Marino', 'SM', 'wisdom_countrypkg/img/country_flags/SM.png', '378', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(189, 'Sao Tome and Principe', 'ST', 'wisdom_countrypkg/img/country_flags/ST.png', '239', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(190, 'Saudi Arabia', 'SA', 'wisdom_countrypkg/img/country_flags/SA.png', '966', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(191, 'Senegal', 'SN', 'wisdom_countrypkg/img/country_flags/SN.png', '221', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(192, 'Serbia', 'RS', 'wisdom_countrypkg/img/country_flags/RS.png', '381', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(193, 'Seychelles', 'SC', 'wisdom_countrypkg/img/country_flags/SC.png', '248', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(194, 'Sierra Leone', 'SL', 'wisdom_countrypkg/img/country_flags/SL.png', '232', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(195, 'Singapore', 'SG', 'wisdom_countrypkg/img/country_flags/SG.png', '65', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(196, 'Slovakia', 'SK', 'wisdom_countrypkg/img/country_flags/SK.png', '421', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(197, 'Slovenia', 'SI', 'wisdom_countrypkg/img/country_flags/SI.png', '386', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(198, 'Smaller Territories of the UK', 'XG', 'wisdom_countrypkg/img/country_flags/XG.png', '44', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(199, 'Solomon Islands', 'SB', 'wisdom_countrypkg/img/country_flags/SB.png', '677', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(200, 'Somalia', 'SO', 'wisdom_countrypkg/img/country_flags/SO.png', '252', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(201, 'South Africa', 'ZA', 'wisdom_countrypkg/img/country_flags/ZA.png', '27', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(202, 'South Georgia', 'GS', 'wisdom_countrypkg/img/country_flags/GS.png', '0', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(203, 'South Sudan', 'SS', 'wisdom_countrypkg/img/country_flags/SS.png', '211', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(204, 'Spain', 'ES', 'wisdom_countrypkg/img/country_flags/ES.png', '34', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(205, 'Sri Lanka', 'LK', 'wisdom_countrypkg/img/country_flags/LK.png', '94', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(206, 'Sudan', 'SD', 'wisdom_countrypkg/img/country_flags/SD.png', '249', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(207, 'Suriname', 'SR', 'wisdom_countrypkg/img/country_flags/SR.png', '597', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(208, 'Svalbard And Jan Mayen Islands', 'SJ', 'wisdom_countrypkg/img/country_flags/SJ.png', '47', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(209, 'Swaziland', 'SZ', 'wisdom_countrypkg/img/country_flags/SZ.png', '268', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(210, 'Sweden', 'SE', 'wisdom_countrypkg/img/country_flags/SE.png', '46', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(211, 'Switzerland', 'CH', 'wisdom_countrypkg/img/country_flags/CH.png', '41', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(212, 'Syria', 'SY', 'wisdom_countrypkg/img/country_flags/SY.png', '963', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(213, 'Taiwan', 'TW', 'wisdom_countrypkg/img/country_flags/TW.png', '886', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(214, 'Tajikistan', 'TJ', 'wisdom_countrypkg/img/country_flags/TJ.png', '992', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(215, 'Tanzania', 'TZ', 'wisdom_countrypkg/img/country_flags/TZ.png', '255', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(216, 'Thailand', 'TH', 'wisdom_countrypkg/img/country_flags/TH.png', '66', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(217, 'Togo', 'TG', 'wisdom_countrypkg/img/country_flags/TG.png', '228', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(218, 'Tokelau', 'TK', 'wisdom_countrypkg/img/country_flags/TK.png', '690', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(219, 'Tonga', 'TO', 'wisdom_countrypkg/img/country_flags/TO.png', '676', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(220, 'Trinidad And Tobago', 'TT', 'wisdom_countrypkg/img/country_flags/TT.png', '1868', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(221, 'Tunisia', 'TN', 'wisdom_countrypkg/img/country_flags/TN.png', '216', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(222, 'Turkey', 'TR', 'wisdom_countrypkg/img/country_flags/TR.png', '90', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(223, 'Turkmenistan', 'TM', 'wisdom_countrypkg/img/country_flags/TM.png', '7370', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(224, 'Turks And Caicos Islands', 'TC', 'wisdom_countrypkg/img/country_flags/TC.png', '1649', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(225, 'Tuvalu', 'TV', 'wisdom_countrypkg/img/country_flags/TV.png', '688', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(226, 'Uganda', 'UG', 'wisdom_countrypkg/img/country_flags/UG.png', '256', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(227, 'Ukraine', 'UA', 'wisdom_countrypkg/img/country_flags/UA.png', '380', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(228, 'United Arab Emirates', 'AE', 'wisdom_countrypkg/img/country_flags/AE.png', '971', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(229, 'United Kingdom', 'GB', 'wisdom_countrypkg/img/country_flags/GB.png', '44', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(230, 'United States', 'US', 'wisdom_countrypkg/img/country_flags/US.png', '1', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(231, 'United States Minor Outlying Islands', 'UM', 'wisdom_countrypkg/img/country_flags/UM.png', '1', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(232, 'Uruguay', 'UY', 'wisdom_countrypkg/img/country_flags/UY.png', '598', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(233, 'Uzbekistan', 'UZ', 'wisdom_countrypkg/img/country_flags/UZ.png', '998', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(234, 'Vanuatu', 'VU', 'wisdom_countrypkg/img/country_flags/VU.png', '678', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(235, 'Vatican City State (Holy See)', 'VA', 'wisdom_countrypkg/img/country_flags/VA.png', '39', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(236, 'Venezuela', 'VE', 'wisdom_countrypkg/img/country_flags/VE.png', '58', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(237, 'Vietnam', 'VN', 'wisdom_countrypkg/img/country_flags/VN.png', '84', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(238, 'Virgin Islands (British)', 'VG', 'wisdom_countrypkg/img/country_flags/VG.png', '1284', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(239, 'Virgin Islands (US)', 'VI', 'wisdom_countrypkg/img/country_flags/VI.png', '1340', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(240, 'Wallis And Futuna Islands', 'WF', 'wisdom_countrypkg/img/country_flags/WF.png', '681', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(241, 'Western Sahara', 'EH', 'wisdom_countrypkg/img/country_flags/EH.png', '212', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(242, 'Yemen', 'YE', 'wisdom_countrypkg/img/country_flags/YE.png', '967', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(243, 'Yugoslavia', 'YU', 'wisdom_countrypkg/img/country_flags/YU.png', '38', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(244, 'Zambia', 'ZM', 'wisdom_countrypkg/img/country_flags/ZM.png', '260', '2024-01-13 14:27:33', '2024-01-13 14:27:33'),
(245, 'Zimbabwe', 'ZW', 'wisdom_countrypkg/img/country_flags/ZW.png', '263', '2024-01-13 14:27:33', '2024-01-13 14:27:33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
