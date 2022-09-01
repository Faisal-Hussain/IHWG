-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2022 at 04:33 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ihwg`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads_settings`
--

CREATE TABLE `ads_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:active,0:pause',
  `homeopath` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advocate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads_settings`
--

INSERT INTO `ads_settings` (`id`, `url`, `heading`, `image`, `status`, `homeopath`, `advocate`, `user`, `created_at`, `updated_at`) VALUES
(1, 'https://www.youtube.com/watch?v=YEBPyVvy9iI&ab_channel=TeoCRi', 'ABC', 'uploads/cms/1634707023-WhatsApp-Image-2021-10-19-at-9.32.49-AM.jpeg', 0, 'homeopath', 'advocate', 'user', '2021-10-20 12:17:03', '2021-11-19 11:39:58'),
(2, 'https://www.youtube.com/watch?v=zMxZovxcx-o&ab_channel=Wrsh98', 'XYZ', 'uploads/cms/1634707067-download.jpg', 1, 'homeopath', 'advocate', 'user', '2021-10-20 12:17:47', '2021-10-20 12:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `album_photos`
--

CREATE TABLE `album_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `album_photos`
--

INSERT INTO `album_photos` (`id`, `album_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 21, 'uploads/img/1640775173-tour_2.jpg', NULL, '2021-12-29 09:52:53', '2021-12-29 09:52:53'),
(6, 23, 'uploads/img/1640779234-images-(8).jpg', NULL, '2021-12-29 11:00:34', '2021-12-29 11:00:34'),
(7, 22, 'uploads/img/1640779323-images-(10).jpg', NULL, '2021-12-29 11:02:03', '2021-12-29 11:02:03'),
(8, 23, 'uploads/img/1640781291-images-(10).jpg', NULL, '2021-12-29 11:34:51', '2021-12-29 11:34:51'),
(9, 23, 'uploads/img/1640781306-screencapture-ihwg-test-contact-us-2021-12-15-11_58_22.png', NULL, '2021-12-29 11:35:06', '2021-12-29 11:35:06'),
(11, 21, 'uploads/img/1640782545-download-(13).jpg', NULL, '2021-12-29 11:55:45', '2021-12-29 11:55:45'),
(12, 21, 'uploads/img/1640782559-images-(8).jpg', NULL, '2021-12-29 11:55:59', '2021-12-29 11:55:59'),
(13, 21, 'uploads/img/1640782570-download-(7).jpg', NULL, '2021-12-29 11:56:10', '2021-12-29 11:56:10');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `body` longtext NOT NULL,
  `keywords` longtext NOT NULL,
  `featured_image` varchar(255) NOT NULL DEFAULT 'uploads/articles/default-article.png',
  `status` enum('published','unpublished','discard','spam','pending','favorite') NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `uuid`, `category`, `summary`, `body`, `keywords`, `featured_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, 'Where does it come from abc?', 'where-does-it-come-from-abc?', '270821045757', 'new', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Ha', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>', 'nature, beauty', 'uploads/blogs/1630479424-Amazon-Forest-wallpaper.jpg', 'published', '2021-08-26 23:57:57', '2021-09-01 01:57:04'),
(2, 10, 'Where can I get some?', 'where-can-i-get-some?', '010921070507', 'new one', 'any variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'beauty, new', 'uploads/articles/1630479907-banner-7.jpg', 'published', '2021-09-01 02:05:07', '2021-09-01 02:05:07'),
(3, 10, 'The standard Lorem Ipsum passage, used since the 1500s', 'the-standard-lorem-ipsum-passage,-used-since-the-1500s', '010921070602', 'abc', 'sum dolor sit amet, consectetur adipiscing', '<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>', 'abc, new', 'uploads/articles/1630479962-banner-4.jpg', 'published', '2021-09-01 02:06:02', '2021-09-01 02:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`id`, `title`, `slug`, `path`, `created_at`, `updated_at`) VALUES
(1, 'Default Badge', 'default-badge', 'uploads/badges/default_badge.png', '2021-10-06 07:56:11', '2021-10-06 07:56:11'),
(2, 'Certified Neutritionist', 'certified-neutritionist', 'uploads/badges/certified_neutritionist.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(3, 'Medical Doctor', 'medical-doctor', 'uploads/badges/medical_doctor.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(4, 'Registered Homeopath', 'registered-homeopath', 'uploads/badges/registered_homeopath.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(5, 'Registered Massage Therapist', 'registered-massage-therapist', 'uploads/badges/registered_massage_therapist.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(6, 'Registered Midwife', 'registered-midwife', 'uploads/badges/registered_midwife.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(7, 'Registered Naturopath', 'registered-naturopath', 'uploads/badges/registered_naturopath.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(8, 'Registered Psychologist', 'registered-psychologist', 'uploads/badges/registered_psychologist.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(9, 'Registered Yoga Instructor', 'registered-yoga-instructor', 'uploads/badges/registered_yoga_instructor.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12'),
(10, 'Reiki Master', 'reiki-master', 'uploads/badges/reiki_master.png', '2021-10-06 07:56:12', '2021-10-06 07:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `badge_requests`
--

CREATE TABLE `badge_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `badge_id` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `attachement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','pending','cancelled','closed','spammed','completed','not applicable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `badge_requests`
--

INSERT INTO `badge_requests` (`id`, `user_id`, `badge_id`, `description`, `attachement`, `status`, `created_at`, `updated_at`) VALUES
(1, 24, 4, 'Add an official identification document for yourself or your business to show that your Page or profile is connected to the public figure, celebrity or brand it represents.\r\n\r\nDocument typeAdd an official identification document for yourself or your business to show that your Page or profile is connected to the public figure, celebrity or brand it represents.\r\n\r\nDocument typeAdd an official identification document for yourself or your business to show that your Page or profile is connected to the public figure, celebrity or brand it represents.\r\n\r\nDocument type', NULL, 'pending', '2021-10-08 03:02:44', '2021-10-08 19:45:18'),
(2, 24, 7, 'fdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asdfdasssssssssssssssssssssf  asdf asd', 'uploads/badges/requests/1633680358-banner-3.jpg', 'pending', '2021-10-08 03:05:58', '2021-10-08 19:40:37'),
(3, 10, 6, 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', NULL, 'pending', '2021-10-08 05:02:09', '2021-10-08 19:38:19'),
(4, 10, 6, 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', NULL, 'pending', '2021-10-08 05:02:09', '2021-10-08 19:34:03'),
(5, 11, 10, 'kngklmgdjsknfdjds snfd jksndf fdsjnfjnjisadngfv msndakjgfn mcnjsadnfidjs nufgdufh nbsudihfui nmudshfuisdfj jsdnfnfsd fnniosijdniodehttp://www.google.com', 'uploads/badges/requests/1635750140-m1.jpg', 'pending', '2021-11-01 06:02:20', '2021-11-01 06:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `featured_image` varchar(255) NOT NULL DEFAULT 'uploads/blogs/default-blogs.png',
  `featured_image_alt` text,
  `status` enum('published','drafts','cancelled','Latest','Featured','Trending','Copied') NOT NULL DEFAULT 'published',
  `meta_description` text NOT NULL,
  `keywords` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart_wish_lists`
--

CREATE TABLE `cart_wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shop_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_wish_lists`
--

INSERT INTO `cart_wish_lists` (`id`, `user_id`, `shop_product_id`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2021-09-01 04:11:49', '2021-09-01 04:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `receiver_id`, `created_at`, `updated_at`) VALUES
(1, 6, 10, '2021-08-25 08:24:57', '2021-10-20 14:58:57'),
(2, 5, 11, '2021-08-26 08:18:02', '2021-08-26 08:18:50');

-- --------------------------------------------------------

--
-- Table structure for table `day_slots`
--

CREATE TABLE `day_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `timetable_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `specific_day` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `slot_type` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '0 All Day, 1 Specific Day, 2 Closed Day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `day_slots`
--

INSERT INTO `day_slots` (`id`, `timetable_id`, `user_id`, `specific_day`, `from`, `to`, `is_closed`, `slot_type`, `created_at`, `updated_at`) VALUES
(3, 3, 11, NULL, '01:00', '23:30', 0, '0', '2021-10-28 09:47:31', '2021-10-28 09:47:31'),
(6, 4, 11, NULL, '04:00', '06:00', 0, '0', '2021-12-03 15:26:15', '2021-12-03 15:26:15'),
(7, 4, 11, NULL, '08:00', '10:00', 0, '0', '2021-12-03 15:26:15', '2021-12-03 15:26:15'),
(8, 1, 11, NULL, '01:00', '03:00', 0, '0', '2021-12-03 17:50:49', '2021-12-03 17:50:49'),
(9, 1, 11, NULL, '05:00', '09:00', 0, '0', '2021-12-03 17:50:49', '2021-12-03 17:50:49'),
(10, 1, 11, NULL, '10:00', '12:00', 0, '0', '2021-12-03 17:50:49', '2021-12-03 17:50:49'),
(13, 2, 11, NULL, '06:30', '23:30', 0, '0', '2021-12-27 07:14:19', '2021-12-27 07:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) DEFAULT '0.00',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` enum('one_time','monthly','other','N/A') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'one_time',
  `status` enum('active','inactive','pending','closed','paused','N/A') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `user_id`, `price`, `transaction_id`, `payment_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 20.00, 'PAYID-MEXCNMA92C09184W3581774A', 'monthly', 'closed', '2021-08-31 07:56:04', '2021-09-01 00:32:34'),
(2, 5, 20.00, 'PAYID-MEXRAZA7Y9876701G4570301', 'monthly', 'closed', '2021-09-01 00:32:34', '2021-10-06 23:56:22'),
(3, 11, 10.00, 'PAYID-MF5FPYQ7YA66419F92889420', 'one_time', 'closed', '2021-10-28 06:57:53', '2022-01-10 06:26:04'),
(4, 11, 10.00, 'PAYID-MF5FQPY1MV263935Y259743E', 'one_time', 'closed', '2021-10-28 06:59:13', '2022-01-10 06:26:04'),
(5, 11, 10.00, 'PAYID-MF5FSXY7UM550869V046874G', 'one_time', 'closed', '2021-10-28 07:04:01', '2022-01-10 06:26:04'),
(6, 11, 25.00, 'PAYID-MF5FTSA61851060A0413845F', 'one_time', 'closed', '2021-10-28 07:05:53', '2022-01-10 06:26:04'),
(7, 10, 25.00, 'PAYID-MF5G3MQ5F808578T87379910', 'one_time', 'closed', '2021-10-28 08:31:10', '2021-10-28 09:09:51'),
(8, 10, 20.00, 'PAYID-MF5G5LY7R017924KA332100G', 'one_time', 'closed', '2021-10-28 08:34:59', '2021-10-28 09:09:51'),
(9, 10, 25.00, 'PAYID-MF5HJSI2FT326256X887460B', 'one_time', 'closed', '2021-10-28 09:01:13', '2021-10-28 09:09:51'),
(10, 10, 25.00, 'PAYID-MF5HJSI2FT326256X887460B', 'one_time', 'closed', '2021-10-28 09:03:41', '2021-10-28 09:09:51'),
(11, 10, 25.00, 'PAYID-MF5HLHQ3PF70294GD585750U', 'one_time', 'closed', '2021-10-28 09:04:41', '2021-10-28 09:09:51'),
(12, 10, 25.00, 'PAYID-MF5HMEI1KX28210XE1213042', 'one_time', 'closed', '2021-10-28 09:06:28', '2021-10-28 09:09:51'),
(13, 10, 25.00, 'PAYID-MF5HNXI0NP72665EB7344918', 'one_time', 'active', '2021-10-28 09:09:51', '2021-10-28 09:09:51'),
(14, 11, 10.00, '0RA721173N374381T', 'one_time', 'closed', '2021-12-28 06:05:10', '2022-01-10 06:26:04'),
(15, 11, 14.00, '950304157N6754839', 'one_time', 'active', '2022-01-10 06:26:04', '2022-01-10 06:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uploads/events/default-event.png',
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('virtual','in-person','other','N/A') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'virtual',
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hosts` text COLLATE utf8mb4_unicode_ci,
  `vendors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive','pending','closed','paused','N/A') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `title`, `description`, `thumbnail`, `category`, `type`, `venue`, `location`, `latitude`, `longitude`, `hosts`, `vendors`, `status`, `created_at`, `updated_at`) VALUES
(2, 10, 'Where does it come from', 'ng through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in s updateed', 'uploads/events//1629894172-banner-8.jpg', 'New Cat', 'virtual', '12', 'Johar Town, Lahore, Pakistan', '31.469693', '74.27284610000001', '65', '765', 'active', '2021-08-25 05:29:52', '2021-08-25 07:24:00'),
(4, 10, 'The standard Lorem Ipsum passage, used since the 1500s', 's unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea comm', 'uploads/events//1629894302-banner-2.jpg', 'Cicero', 'in-person', NULL, 'ARFA Tower, Ferozepur Road, Nishtar Town, Lahore, Pakistan', '31.4757684', '74.34257199999999', '786', '876', 'active', '2021-08-25 07:25:02', '2021-08-25 07:25:25'),
(5, 7, 'My new event at homeopathy awareness', 'new event at homeopathy', 'uploads/events//1629957447-Amazon-Forest-wallpaper.jpg', 'Homeopathy', 'virtual', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2021-08-26 00:57:27', '2021-08-26 00:57:27'),
(6, 10, 'Global Pollution Awareness Program', 'new car parts', 'uploads/events//1629957937-495-4952480_black-audi-2019-buick-regal-black-hd-png.png', 'Car Parts', 'virtual', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2021-08-26 01:05:37', '2021-08-26 01:05:37'),
(7, 10, 'Abc', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"', 'uploads/events//1634120453-download-(1).jpg', 'Therapy', 'in-person', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2021-10-13 17:20:54', '2021-10-13 17:20:54'),
(8, 10, 'Abc', 'ok', 'uploads/events//1634716837-1633680358-banner-3.jpg', 'abc', 'in-person', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2021-10-20 15:00:37', '2021-10-20 15:00:37'),
(9, 10, 'This is Testing Event', 'This is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing descriptionThis is a testing description.', 'uploads/events//1634881125-download.jpg', 'abc', 'in-person', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2021-10-22 00:38:45', '2021-10-22 00:38:45'),
(10, 10, 'This is next event', 'This is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but eventThis is nothing a palm but event.', 'uploads/events//1634882106-images.jpg', 'xyz', 'in-person', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2021-10-22 00:55:06', '2021-10-22 00:55:06'),
(11, 10, 'Event create for testing On 31 Dec 2021', 'This is the description of text which is being tested.', 'uploads/events//1640945636-medfully.png', 'sd', 'in-person', NULL, 'Pakistan Chowk, Saddar Karachi, Pakistan', '24.8539874', '67.0124112', 'hd', 'dfda', 'active', '2021-12-31 09:13:56', '2021-12-31 09:13:56'),
(12, 10, 'Another Event For Testing', 'venuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenuevenue', 'uploads/events//1640946043-2nd.png', 'sd', 'in-person', 'Karachi Sindh Pakistan', 'San Diego, CA, USA', '32.715738', '-117.1610838', 'hd', 'kjh', 'active', '2021-12-31 09:20:43', '2021-12-31 09:21:38'),
(13, 10, 'first event for 2022', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'uploads/events//1640955324-rev-3.png', 'sd', 'in-person', 'Lahore Pakistan', 'Dallas, TX, USA', '32.7766642', '-96.79698789999999', 'hd', 'faisal', 'active', '2021-12-31 11:55:24', '2021-12-31 11:55:24');

-- --------------------------------------------------------

--
-- Table structure for table `event_requests`
--

CREATE TABLE `event_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_timing_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive','rejected','pending','closed','paused','N/A') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_requests`
--

INSERT INTO `event_requests` (`id`, `user_id`, `event_timing_id`, `status`, `created_at`, `updated_at`) VALUES
(12, 10, 28, 'closed', '2021-08-26 07:44:49', '2021-09-24 07:43:42'),
(13, 10, 32, 'active', '2021-08-26 07:44:53', '2021-09-24 07:43:45'),
(14, 10, 29, 'pending', '2021-08-26 07:45:05', '2021-10-06 00:40:24'),
(15, 5, 31, 'pending', '2021-08-26 08:34:00', '2021-09-24 07:43:39'),
(20, 10, 36, 'pending', '2021-10-22 05:11:50', '2021-10-22 05:11:50'),
(21, 10, 37, 'pending', '2021-10-22 05:14:30', '2021-10-22 05:14:30'),
(22, 11, 40, 'pending', '2021-12-31 10:13:51', '2021-12-31 10:13:51'),
(23, 11, 38, 'pending', '2021-12-31 10:25:11', '2021-12-31 10:25:11'),
(24, 11, 41, 'active', '2021-12-31 11:56:13', '2021-12-31 11:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `event_timings`
--

CREATE TABLE `event_timings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_timings`
--

INSERT INTO `event_timings` (`id`, `event_id`, `date`, `time`, `created_at`, `updated_at`) VALUES
(26, 6, '2021-09-17', '01:30', '2021-08-26 02:05:36', '2021-08-26 02:05:36'),
(27, 6, '2021-09-18', '03:30', '2021-08-26 02:05:36', '2021-08-26 02:05:36'),
(28, 5, '2021-09-09', '07:30', '2021-08-26 02:05:50', '2021-08-26 02:05:50'),
(29, 4, '2021-08-27', '19:30', '2021-08-26 02:06:05', '2021-08-26 02:06:05'),
(30, 4, '2021-08-28', '21:00', '2021-08-26 02:06:05', '2021-08-26 02:06:05'),
(31, 2, '2021-08-27', '07:00', '2021-08-26 02:06:19', '2021-08-26 02:06:19'),
(32, 2, '2021-08-28', '09:30', '2021-08-26 02:06:19', '2021-08-26 02:06:19'),
(33, 2, '2021-08-29', '14:30', '2021-08-26 02:06:19', '2021-08-26 02:06:19'),
(34, 7, '2021-10-13', '01:00', '2021-10-13 17:20:54', '2021-10-13 17:20:54'),
(35, 8, '2021-10-20', '01:00', '2021-10-20 15:00:37', '2021-10-20 15:00:37'),
(36, 9, '2021-10-22', '01:00', '2021-10-22 00:38:45', '2021-10-22 00:38:45'),
(37, 10, '2021-10-23', '01:00', '2021-10-22 00:55:06', '2021-10-22 00:55:06'),
(38, 11, '2022-01-02', '01:00', '2021-12-31 09:13:56', '2021-12-31 09:13:56'),
(40, 12, '2022-01-01', '01:00', '2021-12-31 09:21:38', '2021-12-31 09:21:38'),
(41, 13, '2022-01-01', '01:00', '2021-12-31 11:55:25', '2021-12-31 11:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `followings`
--

CREATE TABLE `followings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `following_type` varchar(255) NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','pending','cancelled','closed','blocked','other') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `followings`
--

INSERT INTO `followings` (`id`, `user_id`, `following_type`, `following_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'App\\Models\\User', 7, 'pending', NULL, NULL),
(6, 5, 'App\\Models\\SocialPostTag', 39, 'pending', NULL, NULL),
(8, 6, 'App\\Models\\UserSocialGroup', 2, 'pending', NULL, NULL),
(9, 6, 'App\\Models\\UserSocialGroup', 3, 'pending', NULL, NULL),
(11, 10, 'App\\Models\\UserSocialGroup', 3, 'pending', NULL, NULL),
(15, 5, 'App\\Models\\User', 10, 'pending', NULL, NULL),
(16, 5, 'App\\Models\\User', 11, 'pending', NULL, NULL),
(17, 17, 'App\\Models\\User', 13, 'pending', NULL, NULL),
(18, 17, 'App\\Models\\User', 15, 'pending', NULL, NULL),
(19, 6, 'App\\Models\\User', 5, 'pending', NULL, NULL),
(20, 18, 'App\\Models\\SocialPostTag', 104, 'pending', NULL, NULL),
(21, 18, 'App\\Models\\SocialPostTag', 21, 'pending', NULL, NULL),
(22, 18, 'App\\Models\\SocialPostTag', 6, 'pending', NULL, NULL),
(23, 18, 'App\\Models\\UserSocialGroup', 11, 'pending', NULL, NULL),
(24, 18, 'App\\Models\\UserSocialGroup', 2, 'pending', NULL, NULL),
(25, 18, 'App\\Models\\UserSocialGroup', 10, 'pending', NULL, NULL),
(26, 18, 'App\\Models\\UserSocialGroup', 3, 'pending', NULL, NULL),
(27, 18, 'App\\Models\\UserSocialGroup', 6, 'pending', NULL, NULL),
(28, 18, 'App\\Models\\UserSocialGroup', 8, 'pending', NULL, NULL),
(29, 18, 'App\\Models\\UserSocialGroup', 7, 'pending', NULL, NULL),
(30, 18, 'App\\Models\\UserSocialGroup', 1, 'active', NULL, '2021-09-08 02:09:00'),
(31, 18, 'App\\Models\\UserSocialGroup', 5, 'pending', NULL, NULL),
(32, 18, 'App\\Models\\User', 13, 'pending', NULL, NULL),
(33, 18, 'App\\Models\\User', 15, 'pending', NULL, NULL),
(34, 18, 'App\\Models\\User', 7, 'pending', NULL, NULL),
(35, 18, 'App\\Models\\User', 14, 'pending', NULL, NULL),
(36, 18, 'App\\Models\\User', 11, 'pending', NULL, NULL),
(37, 18, 'App\\Models\\User', 6, 'pending', NULL, NULL),
(38, 18, 'App\\Models\\User', 16, 'pending', NULL, NULL),
(39, 18, 'App\\Models\\User', 10, 'pending', NULL, NULL),
(41, 5, 'App\\Models\\UserSocialGroup', 8, 'pending', NULL, NULL),
(42, 11, 'App\\Models\\UserSocialGroup', 3, 'pending', NULL, NULL),
(43, 11, 'App\\Models\\UserSocialGroup', 7, 'pending', NULL, NULL),
(44, 10, 'App\\Models\\UserSocialGroup', 7, 'pending', NULL, NULL),
(45, 10, 'App\\Models\\UserSocialGroup', 8, 'pending', NULL, NULL),
(46, 10, 'App\\Models\\UserSocialGroup', 4, 'pending', NULL, NULL),
(47, 10, 'App\\Models\\UserSocialGroup', 1, 'pending', NULL, NULL),
(48, 12, 'App\\Models\\UserSocialGroup', 3, 'pending', NULL, NULL),
(49, 12, 'App\\Models\\UserSocialGroup', 1, 'pending', NULL, NULL),
(50, 12, 'App\\Models\\UserSocialGroup', 4, 'pending', NULL, NULL),
(51, 12, 'App\\Models\\UserSocialGroup', 7, 'pending', NULL, NULL),
(52, 12, 'App\\Models\\UserSocialGroup', 8, 'pending', NULL, NULL),
(53, 13, 'App\\Models\\UserSocialGroup', 3, 'pending', NULL, NULL),
(54, 13, 'App\\Models\\UserSocialGroup', 1, 'pending', NULL, NULL),
(55, 13, 'App\\Models\\UserSocialGroup', 4, 'pending', NULL, NULL),
(56, 13, 'App\\Models\\UserSocialGroup', 8, 'pending', NULL, NULL),
(57, 13, 'App\\Models\\UserSocialGroup', 7, 'pending', NULL, NULL),
(58, 11, 'App\\Models\\User', 11, 'pending', NULL, NULL),
(59, 12, 'App\\Models\\User', 11, 'pending', NULL, NULL),
(61, 11, 'App\\Models\\User', 5, 'pending', NULL, NULL),
(62, 10, 'App\\Models\\User', 6, 'pending', NULL, NULL),
(63, 10, 'App\\Models\\User', 11, 'pending', NULL, NULL),
(64, 10, 'App\\Models\\User', 5, 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `forum_category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `views` bigint(20) NOT NULL DEFAULT '0',
  `status` enum('active','popular','discard','spam','pending','favorite') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum_categories`
--

CREATE TABLE `forum_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` enum('active','inactive','cancelled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum_comments`
--

CREATE TABLE `forum_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `status` enum('helpful','not_helpful','spam','trashed','pending') NOT NULL DEFAULT 'helpful',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `forum_reactions`
--

CREATE TABLE `forum_reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `f_a_q_s`
--

CREATE TABLE `f_a_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `f_a_q_s`
--

INSERT INTO `f_a_q_s` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(2, 'Here is y second Question?', '<p>Here will the answer of a question</p>', '2021-11-10 16:22:51', '2021-11-10 16:22:51'),
(3, 'molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"\r\n\r\n1914 translation by H. Rackham\r\n\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"\r\n\r\nSection 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"\r\n\r\n1914 translation by H. Rackham\r\n\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">yeteq eqruyeq uieqyriuqe uiiqyrwui</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">equrtmolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguismolestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: 700; color: rgb(0, 0, 0); font-size: 14px; letter-spacing: normal; padding: 0px;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; letter-spacing: normal; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis</p>', '2021-12-06 10:55:44', '2021-12-06 10:55:44');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_badges_settings`
--

CREATE TABLE `homeopath_badges_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `homeopath_id` bigint(20) UNSIGNED NOT NULL,
  `badge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `badge_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeopath_badges_settings`
--

INSERT INTO `homeopath_badges_settings` (`id`, `homeopath_id`, `badge_id`, `badge_name`, `status`, `created_at`, `updated_at`) VALUES
(3, 8, NULL, 'Badge', 'true', '2022-01-12 03:59:19', '2022-01-12 04:30:26'),
(4, 8, NULL, 'Booking Milestone', 'false', '2022-01-12 04:06:32', '2022-01-12 12:15:54'),
(5, 8, NULL, 'Events Attended', 'true', '2022-01-12 04:15:21', '2022-01-12 04:30:36'),
(6, 8, NULL, 'Events Hosted', 'true', '2022-01-12 04:15:35', '2022-01-12 04:30:35'),
(7, 8, NULL, 'Articals', 'true', '2022-01-12 04:15:35', '2022-01-12 04:30:34'),
(8, 8, NULL, 'Years', 'true', '2022-01-12 04:15:55', '2022-01-12 04:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_categories`
--

CREATE TABLE `homeopath_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homeopath_categories`
--

INSERT INTO `homeopath_categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'origins of homeoppathy', 'origins-of-homeoppathy', '2021-08-27 08:01:14', '2021-08-27 08:01:14'),
(2, 'Explore Children', 'explore-children', '2021-09-03 02:06:40', '2021-09-03 02:06:40');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_documents`
--

CREATE TABLE `homeopath_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:image,0:document'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeopath_documents`
--

INSERT INTO `homeopath_documents` (`id`, `user_id`, `title`, `file`, `created_at`, `updated_at`, `type`) VALUES
(2, 6, 'Adult health intake Form', 'uploads/homeopath/documents//1630667412-1626431057.pdf', '2021-09-03 06:10:12', '2021-09-03 06:10:12', 1),
(3, 19, NULL, 'uploads/homeopath/documents//1630667633-1626431057.pdf', '2021-09-03 06:13:56', '2021-09-03 06:13:56', 1),
(4, 6, 'New Willa Form Summit', 'uploads/homeopath/documents//1633428358-banner-5.jpg', '2021-10-05 04:56:26', '2021-10-05 05:05:58', 1),
(5, 6, 'Old Will Power Agency Supers', 'uploads/homeopath/documents//1633428390-banner-4.jpg', '2021-10-05 05:06:30', '2021-10-05 05:06:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_holidays`
--

CREATE TABLE `homeopath_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `holiday_from` date DEFAULT NULL,
  `holiday_to` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeopath_holidays`
--

INSERT INTO `homeopath_holidays` (`id`, `user_id`, `holiday_from`, `holiday_to`, `created_at`, `updated_at`) VALUES
(1, 11, '2021-12-16', '2021-12-17', '2021-12-15 10:16:21', '2021-12-15 10:16:21');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_images`
--

CREATE TABLE `homeopath_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homeopath_images`
--

INSERT INTO `homeopath_images` (`id`, `user_id`, `image`, `created_at`, `updated_at`, `role`) VALUES
(2, 19, 'uploads/homeopath//1630667024-Start-Here!.png', '2021-09-03 06:03:44', '2021-09-03 06:03:44', NULL),
(3, 11, 'uploads/homeopath//1636730894-download-(6).jpg', '2021-11-12 14:28:14', '2021-11-12 14:28:14', NULL),
(5, 11, 'uploads/homeopath//1636731068-images-(6).jpg', '2021-11-12 14:31:08', '2021-11-12 14:31:08', NULL),
(6, 11, 'uploads/homeopath//1636731928-download-(2).jpg', '2021-11-12 14:31:24', '2021-11-12 14:45:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_libraries`
--

CREATE TABLE `homeopath_libraries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `homeopath_category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homeopath_libraries`
--

INSERT INTO `homeopath_libraries` (`id`, `homeopath_category_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'WHAT IS LOREM IPSUM?', '<div style=\"text-align: justify;\"><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span></div><div style=\"letter-spacing: 0.14px;\"><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span></div><div style=\"letter-spacing: 0.14px;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span></div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span></div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span></div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"><br></span></div></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\"></div>', '2021-08-27 08:02:05', '2021-12-06 11:15:18');
INSERT INTO `homeopath_libraries` (`id`, `homeopath_category_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(2, 2, 'THE STANDARD LOREM IPSUM PASSAG', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><div><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p></div><div><br></div>', '2021-09-03 02:07:59', '2021-09-03 02:07:59'),
(3, 1, 'E FINIBUS BONORUM ET MALORUM', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguis</p>', '2021-09-03 02:08:33', '2021-09-03 02:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_profiles`
--

CREATE TABLE `homeopath_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_profile_img` varchar(250) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `caption` text,
  `registration_number` varchar(255) DEFAULT NULL,
  `specializations` text,
  `location` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `certifications` varchar(255) DEFAULT NULL,
  `affiliations` varchar(255) DEFAULT NULL,
  `estabilished_at` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `focuses` longtext,
  `service_document` varchar(255) NOT NULL DEFAULT 'uploads/documents/form.pdf',
  `service_document_inner` varchar(250) DEFAULT NULL,
  `service_time_interval` varchar(255) NOT NULL DEFAULT '15',
  `edu_designation` longtext,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homeopath_profiles`
--

INSERT INTO `homeopath_profiles` (`id`, `user_id`, `service_profile_img`, `designation`, `caption`, `registration_number`, `specializations`, `location`, `latitude`, `longitude`, `certifications`, `affiliations`, `estabilished_at`, `created_at`, `updated_at`, `focuses`, `service_document`, `service_document_inner`, `service_time_interval`, `edu_designation`, `address`) VALUES
(1, 6, 'uploads/users/default.png', 'Medical Officer', 'No caption right now', NULL, 'are,you,abc', 'La Rochelle, France', '46.160329', '-1.151139', 'abc', 'good', '4', '2021-08-23 02:10:42', '2021-08-23 02:10:42', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(2, 7, 'uploads/users/default.png', 'Medical Officer', 'No Caption right now', NULL, 'abc,def,ghi', 'Lakeside Shopping Centre, West Thurrock, Grays, UK', '51.4874046', '0.283173', 'new certifications', 'no affiliations', '3', '2021-08-23 02:14:12', '2021-08-23 02:14:12', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(3, 13, 'uploads/users/default.png', 'abc', 'jjjj', NULL, 'fdas,fdsa', 'Dallas, TX, USA', '32.7766642', '-96.79698789999999', 'ddd', 'ddd', '1', '2021-08-26 08:11:14', '2021-08-26 08:11:14', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(4, 12, 'uploads/users/default.png', 'homeo101', 'homeo101', NULL, 'ab,cd,e', 'Lahore, Pakistan', '24.8607343', '67.0011364', 'homeo101', 'homeo101', '1', '2021-08-27 06:13:47', '2021-08-27 06:13:47', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(5, 19, 'uploads/users/default.png', 'Laravel Developer', 'Laravel Developer', NULL, 'laravel,developer', 'Afghanistan', '31.5203696', '74.35874729999999', 'Laravel Developer', 'Laravel Developer', '4', '2021-09-03 02:19:26', '2021-09-03 02:19:26', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(7, 5, 'uploads/users/default.png', 'abc', 'abcx', '41243123', 'a,d,v', 'Lahore, Pakistan', '33.93911', '67.709953', 'ddd', 'ddd', '1', '2021-10-08 01:12:24', '2021-10-08 01:12:24', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(8, 11, 'uploads/services/1640598236-logo.png', 'abc', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make', 'pak123', 'homeo,SEO,WEB,HTML,CSS,BOOTSTRAP,JAVASCRIPT,JQUERY,VUE JS,LARAVEL,PHP', 'London, UK', '51.5073509', '-0.1277583', 'abc', 'ddddf', '1', '2021-10-18 17:52:26', '2022-01-10 06:37:10', 'homeo , SEO,WEB , HTML , CSS , BOOTSTRAP , JAVASCRIPT , JQUERY , VUE JS , LARAVEL , PHP', 'uploads/documents/users//1640677724-Details.pdf', 'uploads/documents/users//1640678720-Medfully-Blog-Revisions-and-Feedback.pdf', '5', NULL, NULL),
(9, 33, 'uploads/users/default.png', 'sdafd', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make', 'sdfsdafds', 'social,post', 'Frankfurt, Germany', '50.1109221', '8.6821267', 'sdads', 'dsfsdafds', '1', '2021-12-07 05:06:24', '2021-12-07 05:06:24', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(10, 40, 'uploads/users/default.png', 'sdafd', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make', 'sdfsdafds', 'cdvfc', 'CVS, Broadway, New York, NY, USA', '40.75439530000001', '-73.986453', 'sdads', 'dsfsdafds', '1', '2021-12-16 03:57:49', '2021-12-16 03:57:49', NULL, 'uploads/documents/form.pdf', NULL, '15', NULL, NULL),
(14, 48, NULL, 'sad', 'assdadsasdsdadas', 'sdfsdafds', 'sasda', 'DSW Designer Shoe Warehouse, West 34th Street, New York, NY, USA', '40.751432', '-73.991185', '[\"uploads\\/homeopathProfile\\/certifications\\/1641974679-M-(1)-(1).docx\",\"uploads\\/homeopathProfile\\/certifications\\/1641974679-resource.PNG\"]', 'dsfsdafds', '1', '2022-01-12 07:04:39', '2022-01-12 07:04:39', 'sdadsdsasda', 'uploads/documents/form.pdf', NULL, '15', '[\"uploads\\/homeopathProfile\\/aprovalDocument\\/1641974679-1641970486-Medfully-Blog-Revisions-and-Feedback.pdf\",\"uploads\\/homeopathProfile\\/aprovalDocument\\/1641974679-1641968744-PSHCD_83_Adv.pdf\",\"uploads\\/homeopathProfile\\/aprovalDocument\\/1641974679-service.PNG\"]', 'ichera Lahore street 34 house no 4');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_resources`
--

CREATE TABLE `homeopath_resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` text NOT NULL,
  `attachment` text,
  `type` enum('active','inactive','other') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homeopath_resources`
--

INSERT INTO `homeopath_resources` (`id`, `user_id`, `title`, `description`, `image`, `attachment`, `type`, `created_at`, `updated_at`) VALUES
(1, 19, 'What is Lorem Ipsum?', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p><br>&nbsp;</p>', 'uploads/resources/1630653846-banner-35.jpg', NULL, 'active', '2021-09-03 02:24:06', '2021-09-03 02:24:06'),
(2, 6, 'hello', '<p>there there</p>', 'uploads/resources/1631098827-vlcsnap-2021-09-05-11h19m03s211.jpg', NULL, 'active', '2021-09-08 06:00:27', '2021-09-08 06:00:27'),
(4, 11, 'This is Lipsum', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'uploads/resources/1640943695-logo.png', 'uploads/resources/pdf/1640943726-Details.pdf', 'active', '2021-12-03 06:58:36', '2021-12-31 08:42:07'),
(5, 11, 'This is a new resource', '<p>This is a new resource description</p>', 'uploads/resources/1641878236-rims.jpg', NULL, 'active', '2022-01-11 04:17:16', '2022-01-11 04:17:16'),
(6, 11, 'Another resources', '<p>Another resources descriptionAnother resources descriptionAnother resources descriptionAnother resources descriptionAnother resources descriptionAnother resources descriptionAnother resources descriptionAnother resources descriptionAnother resources description</p>', '', NULL, 'active', '2022-01-11 04:20:08', '2022-01-11 04:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_services`
--

CREATE TABLE `homeopath_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `service_theme_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `duration` text NOT NULL,
  `thumbnail` text NOT NULL,
  `type` enum('new','featured','popular','old','other') NOT NULL DEFAULT 'new',
  `price` double(8,2) DEFAULT '0.00',
  `status` enum('active','inactive','pending','closed','paused','N/A') NOT NULL DEFAULT 'active',
  `meeting_handled_via` varchar(255) DEFAULT NULL,
  `meeting_channel` varchar(255) DEFAULT NULL,
  `meeting_channel_id` varchar(255) DEFAULT NULL,
  `adult_service_document` varchar(250) DEFAULT NULL,
  `child_service_document` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `homeopath_services`
--

INSERT INTO `homeopath_services` (`id`, `user_id`, `service_theme_id`, `title`, `duration`, `thumbnail`, `type`, `price`, `status`, `meeting_handled_via`, `meeting_channel`, `meeting_channel_id`, `adult_service_document`, `child_service_document`, `created_at`, `updated_at`) VALUES
(5, 11, 1, 'abc', '90', 'uploads/services/1638458753-18373-(1)-(1).jpg', 'featured', 5.00, 'active', 'Offline', NULL, NULL, NULL, NULL, '2021-12-02 14:25:53', '2021-12-02 14:25:53'),
(6, 11, 2, 'xyz', '30', 'uploads/services/1640582064-output_7CkMPo.gif', 'featured', 5.00, 'active', '[\"Online\"]', NULL, NULL, NULL, NULL, '2021-12-02 14:26:54', '2021-12-31 11:07:31'),
(7, 11, 2, 'abc testing', '30', 'uploads/services/1638561669-18373-(1).jpg', 'featured', 5.00, 'active', '[\"Offline\",\"Online\"]', NULL, NULL, 'uploads/documents/users//1641970486-Medfully-Blog-Revisions-and-Feedback.pdf', 'uploads/documents/users//1641970511-order.pdf', '2021-12-03 19:01:10', '2022-01-12 05:55:11'),
(8, 11, 1, 'kjkljlkjkljh', '60', 'uploads/services/1638627609-18373-(1)-(1).jpg', 'featured', 10.00, 'active', '[\"Offline\"]', NULL, NULL, 'uploads/documents/users//1641796700-Medfully-Blog-Revisions-and-Feedback.pdf', 'uploads/documents/users//1641796527-Details.pdf', '2021-12-04 13:20:09', '2022-01-10 11:43:24'),
(9, 11, 3, 'sddsdf', '30', 'uploads/services/1640584799-download-(10).jpg', 'featured', 5.00, 'active', '[\"Offline\",\"Online\"]', NULL, NULL, NULL, NULL, '2021-12-27 04:59:59', '2021-12-27 04:59:59'),
(10, 11, 3, 'vbfdfgfdg', '30', 'uploads/services/1640584874-screencapture-ihwg-test-contact-us-2021-12-15-11_58_22.png', 'featured', 5.00, 'active', '[\"Offline\",\"Online\"]', NULL, NULL, NULL, NULL, '2021-12-27 05:01:14', '2021-12-27 05:01:14'),
(11, 11, 3, 'Brand New Service', '30', '', 'featured', 5.00, 'active', '[\"Offline\",\"Online\"]', NULL, NULL, NULL, NULL, '2022-01-11 04:27:56', '2022-01-11 04:27:56');

-- --------------------------------------------------------

--
-- Table structure for table `homeopath_service_zoom_meetings`
--

CREATE TABLE `homeopath_service_zoom_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `time_slot` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `joing_url` text COLLATE utf8mb4_unicode_ci,
  `start_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `homeopath_service_zoom_meetings`
--

INSERT INTO `homeopath_service_zoom_meetings` (`id`, `service_id`, `time_slot`, `joing_url`, `start_url`, `created_at`, `updated_at`) VALUES
(1, 6, '09:45', 'https://us06web.zoom.us/j/86446515491?pwd=ZG1uUklFYU91ZExJcTRyc0lUb2d1Zz09', 'https://us06web.zoom.us/s/86446515491?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjJiOWVqdV90VExHYVU5UEJZZUFJOFEiLCJpc3MiOiJ3ZWIiLCJzdHkiOjEsIndjZCI6InVzMDYiLCJjbHQiOjAsIm1udW0iOiI4NjQ0NjUxNTQ5MSIsInN0ayI6IjI1WUd5bVVZTnl2MEtCZ2pGZldoajFPUUNYYkRiSUlsWDBHSVJYa2NxdTAuQUcuLU5XSnVWZlVrWlE2a3JRVjVZbWtzTWRfS2c1czBmRGxqcVk4VzNuaURwUGhpVm5MT3BfZlFkdW43ZDJaWVl1dW5GdTQtYm9WODRWSUtvT08uTVBNOGdleUFsZzhOWEdfSGtVeW55Zy41Y1BYQklpdjFIV0VXZEZGIiwiZXhwIjoxNjM4NTM5NTI1LCJpYXQiOjE2Mzg1MzIzMjUsImFpZCI6Illqc3hQQVNtUURTNS1iejhHVFRVcmciLCJjaWQiOiIifQ.zoH2CEhFBP6LHXgxbFvo-Xvl-GPxy9_lGiGyzniXrgY', '2021-12-03 10:30:13', '2021-12-03 10:52:04'),
(2, 5, '01:00', 'https://us06web.zoom.us/j/81518955084?pwd=KzgyNjRKeWQ1anA0K0lXWWhIQ2VTZz09', 'https://us06web.zoom.us/s/81518955084?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjJiOWVqdV90VExHYVU5UEJZZUFJOFEiLCJpc3MiOiJ3ZWIiLCJzdHkiOjEsIndjZCI6InVzMDYiLCJjbHQiOjAsIm1udW0iOiI4MTUxODk1NTA4NCIsInN0ayI6Ii1jWVdSc2hCVy0xM2JzNkJqZ19XMGNVdmdmOXBFSEhjRW9QRkZtSk8xZlUuQUcuQXc1bGhIRThJa3Q5NzY1ektHb2VDN3hKNmM2U0ZtUDBHeUFORlRmcE1fQy1JM3ZvX1FQUmpZN0dVSmZIaVlkT2hfSUItRGhfd0NZRUhRZEouZDJiaG83d0MyVlZrZE1KcXhjRGwwQS4wOVZ2amg3RDdESVNaWHROIiwiZXhwIjoxNjM4NTcwNzkwLCJpYXQiOjE2Mzg1NjM1OTAsImFpZCI6Illqc3hQQVNtUURTNS1iejhHVFRVcmciLCJjaWQiOiIifQ.tvNxlVjcg6hFVPrVdFSYntmwW739rA4wPqdsC4UAvRk', '2021-12-03 19:33:10', '2021-12-03 19:33:10'),
(3, 8, '01:00', 'https://us06web.zoom.us/j/85272512368?pwd=NkFId2E0RDRMNjlEbHJhakR5Kzkzdz09', 'https://us06web.zoom.us/s/85272512368?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjJiOWVqdV90VExHYVU5UEJZZUFJOFEiLCJpc3MiOiJ3ZWIiLCJzdHkiOjEsIndjZCI6InVzMDYiLCJjbHQiOjAsIm1udW0iOiI4NTI3MjUxMjM2OCIsInN0ayI6IjJEYlZrVmoxZWJscWx0cnYxaEV2WFBqdHRiS1hvNnZpWDBBd1Vldi1KaEUuQUcuNkZXTkNwOWcweGdPNlJNVjE1RnpRLXE2R3ZNNC1TaTB0Y0FFVE40Y0x5bFQ5QUpwMTktZTlKcjN1TE5zRkFJYWcwa0JDamJiR1IwVXFQUWkucVBTMERNcWx0VzlsR0NLN3dOYUpkQS5FYWpuSDdObXF5WXlLUjlWIiwiZXhwIjoxNjM5NTc1NTQ2LCJpYXQiOjE2Mzk1NjgzNDYsImFpZCI6Illqc3hQQVNtUURTNS1iejhHVFRVcmciLCJjaWQiOiIifQ.ewbw__oDiTEDAolUeKpVNZc96Vrdp_8n8_r0klbfBlg', '2021-12-15 10:39:07', '2021-12-15 10:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','pending','cancelled','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `name`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shahzad', 'shahzad@gmail.com', 'hello', 'hello there', 'closed', '2021-09-01 01:20:09', '2021-09-09 05:04:13');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"f5b34dca-08c3-415c-809a-7ede9895a980\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 11:08:56.161405\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641798536, 1641798534),
(2, 'default', '{\"uuid\":\"3d41c216-837b-445a-b729-fd87a195e911\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:55:\\\"Your booking has been confirmed for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 11:15:01.513838\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641798901, 1641798899),
(3, 'default', '{\"uuid\":\"1617e659-c14a-495c-a4ad-c6590568dc83\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:55:\\\"Your booking has been confirmed for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 11:16:23.496572\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641798983, 1641798981),
(4, 'default', '{\"uuid\":\"b88615e0-ceb5-4d07-87bf-38e8e6c8ee91\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:47:29.482711\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641818849, 1641818848),
(5, 'default', '{\"uuid\":\"dd3bacba-74b6-41f2-becc-9fddeed320fd\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:53:23.356419\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819203, 1641819201),
(6, 'default', '{\"uuid\":\"4b99093d-6311-4d32-a369-c81a5848cce1\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:53:57.924920\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819237, 1641819236),
(7, 'default', '{\"uuid\":\"68e8af45-0b7e-425d-ba62-87b601d8dd78\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:54:15.605027\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819255, 1641819253),
(8, 'default', '{\"uuid\":\"e9c703a4-e186-460e-b61f-ff22151fd976\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:54:30.500191\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819270, 1641819268),
(9, 'default', '{\"uuid\":\"31a80149-29e5-4666-8464-6b45664192ce\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:55:03.013149\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819303, 1641819301),
(10, 'default', '{\"uuid\":\"e282ccc0-e6a5-4e60-90fc-2a272276e1f6\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:55:25.490475\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819325, 1641819323),
(11, 'default', '{\"uuid\":\"65c2adfe-97cc-45c7-aa3f-27c67522fed7\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:56:31.696309\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819391, 1641819389),
(12, 'default', '{\"uuid\":\"4b971d4a-58b2-411d-abf7-02fb9eca22a7\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:58:16.469060\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819496, 1641819494),
(13, 'default', '{\"uuid\":\"ed22eba2-c4ca-4ffe-a8a3-00cb6af1f224\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:58:48.774108\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819528, 1641819526),
(14, 'default', '{\"uuid\":\"7e8be9d9-8530-4d01-9e77-73fedb0b9fec\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 16:59:21.674955\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819561, 1641819559),
(15, 'default', '{\"uuid\":\"5c568dc6-2b53-40c7-ba4f-d05ad839ad94\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:00:47.175605\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819647, 1641819645),
(16, 'default', '{\"uuid\":\"e8c77b35-c7b9-4713-bc4b-078ae4167188\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:01:27.896214\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819687, 1641819685),
(17, 'default', '{\"uuid\":\"16c9d9b2-290f-4cde-8f70-b2c4b36df4aa\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:02:21.733970\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819741, 1641819739),
(18, 'default', '{\"uuid\":\"0c53cbde-f491-4d97-bce5-e536c3d2803a\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:02:29.707625\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819749, 1641819747),
(19, 'default', '{\"uuid\":\"48c52e69-b2d5-41a9-90e8-6a61e55212e9\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:02:58.417561\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819778, 1641819776),
(20, 'default', '{\"uuid\":\"269febe1-7f25-466a-b998-a4a72e039dbf\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:03:56.345019\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641819836, 1641819834),
(21, 'default', '{\"uuid\":\"dfc33752-4113-4f4b-99c1-4fafdd40314f\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:06:48.325158\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641820008, 1641820006),
(22, 'default', '{\"uuid\":\"58b7ad06-06d7-413a-aca8-22b53275a559\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:07:53.076183\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641820073, 1641820071),
(23, 'default', '{\"uuid\":\"efc49545-3326-40ff-a65b-73cab87f3c7e\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:08:46.054222\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641820126, 1641820124),
(24, 'default', '{\"uuid\":\"720055e6-db77-4e76-8656-76d1c797c5e3\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:14:31.165957\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641820471, 1641820469),
(25, 'default', '{\"uuid\":\"3aea3bce-6509-4020-a14b-733c180fdd54\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-10 17:14:50.521263\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641820490, 1641820488),
(26, 'default', '{\"uuid\":\"da84499a-e1c4-4bbc-901d-dea9eb44d837\",\"displayName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":5,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\UserServiceBookedMailJob\",\"command\":\"O:33:\\\"App\\\\Jobs\\\\UserServiceBookedMailJob\\\":12:{s:7:\\\"\\u0000*\\u0000data\\\";a:4:{s:4:\\\"name\\\";s:4:\\\"CHWG\\\";s:5:\\\"email\\\";s:29:\\\"faisalhussainntu033@gmail.com\\\";s:8:\\\"app_name\\\";s:4:\\\"CHWG\\\";s:7:\\\"subject\\\";s:50:\\\"Your booking has been done for service appointment\\\";}s:5:\\\"tries\\\";i:5;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-01-12 10:55:53.201717\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:9:\\\"Etc\\/GMT-4\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1641970553, 1641970554);

-- --------------------------------------------------------

--
-- Table structure for table `location_texes`
--

CREATE TABLE `location_texes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_commission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_texes`
--

INSERT INTO `location_texes` (`id`, `location`, `service_commission`, `service_tax`, `service_discount`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', '1', '2', '3', '2021-10-11 16:13:08', '2021-10-11 16:27:03'),
(2, 'Lakeside Shopping Centre, West Thurrock, Grays, UK', '4', '5', '5', '2021-10-11 16:25:58', '2021-10-11 16:25:58'),
(3, 'La Rochelle, France', '5', '7', '4', '2021-10-11 16:27:19', '2021-10-12 11:48:13'),
(4, 'Dallas, TX, USA', '10', '11', '12', '2021-10-11 19:02:50', '2021-10-11 19:02:50'),
(5, 'Lahore, Pakistan', '13', '14', '14', '2021-10-11 19:03:17', '2021-10-11 19:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext,
  `ip` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `user_id`, `message`, `ip`, `file`, `created_at`, `updated_at`, `is_read`) VALUES
(1, 1, 6, 'hello there', '127.0.0.1', NULL, '2021-08-25 08:24:58', '2021-10-20 14:59:01', 1),
(2, 1, 6, 'how are you', '127.0.0.1', NULL, '2021-08-25 08:26:08', '2021-10-20 14:59:01', 1),
(3, 1, 10, 'good', '127.0.0.1', NULL, '2021-08-25 08:26:25', '2021-08-25 08:26:37', 1),
(4, 1, 6, 'to see you', '127.0.0.1', NULL, '2021-08-25 08:26:32', '2021-10-20 14:59:01', 1),
(5, 2, 5, 'hello there', '127.0.0.1', NULL, '2021-08-26 08:18:03', '2021-12-14 04:33:11', 1),
(6, 2, 5, 'how are you', '127.0.0.1', NULL, '2021-08-26 08:18:19', '2021-12-14 04:33:11', 1),
(7, 2, 5, 'yes', '127.0.0.1', NULL, '2021-08-26 08:18:38', '2021-12-14 04:33:11', 1),
(8, 2, 11, 'there', '127.0.0.1', NULL, '2021-08-26 08:18:48', '2021-08-26 08:18:52', 1),
(9, 1, 10, 'hewjks', '127.0.0.1', NULL, '2021-10-20 14:58:53', '2021-10-20 14:58:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_05_03_000001_create_customer_columns', 1),
(4, '2019_05_03_000002_create_subscriptions_table', 1),
(5, '2019_05_03_000003_create_subscription_items_table', 1),
(6, '2019_08_19_000000_create_failed_jobs_table', 1),
(7, '2021_03_11_050805_create_settings_table', 1),
(8, '2021_07_02_125052_create_profiles_table', 1),
(9, '2021_07_05_060940_create_jobs_table', 1),
(10, '2021_07_05_131622_create_forum_categories_table', 1),
(11, '2021_07_05_131623_create_forums_table', 1),
(12, '2021_07_05_132306_create_forum_comments_table', 1),
(13, '2021_07_05_132451_create_forum_reactions_table', 1),
(14, '2021_07_06_103739_create_articles_table', 1),
(15, '2021_07_06_123227_alter_profile_for_add_acheivement_column', 1),
(16, '2021_07_07_100523_create_permission_tables', 1),
(17, '2021_07_07_113731_create_blogs_table', 2),
(18, '2021_07_08_061319_create_shop_categories_table', 2),
(19, '2021_07_08_061330_create_shop_brands_table', 2),
(20, '2021_07_08_061340_create_shop_colors_table', 2),
(21, '2021_07_08_061350_create_shop_variants_table', 2),
(22, '2021_07_08_061351_create_shop_products_table', 3),
(23, '2021_07_09_101404_create_homeopath_categories_table', 3),
(24, '2021_07_09_101707_create_homeopath_libraries_table', 3),
(25, '2021_08_02_123214_create_social_posts_table', 3),
(26, '2021_08_02_130848_create_social_post_likes_table', 3),
(27, '2021_08_02_132849_add_field_in_social_posts_table', 3),
(28, '2021_08_03_075916_add_media_type_field_in_social_posts', 3),
(29, '2021_08_03_093006_create_social_post_comments_table', 3),
(30, '2021_08_03_111857_create_homeopath_profiles_table', 3),
(31, '2021_08_04_051334_create_service_themes_table', 3),
(32, '2021_08_04_064240_create_homeopath_services_table', 3),
(33, '2021_08_04_092357_alter_homeopath_services_for_add_type', 3),
(34, '2021_08_04_101404_create_homeopath_images_table', 3),
(35, '2021_08_04_130417_alter_homeopath_services_for_add_price', 3),
(36, '2021_08_06_082302_create_service_bookings_table', 3),
(37, '2021_08_11_063028_alter_service_bookings_for_add_status_completed', 3),
(38, '2021_08_11_065849_create_service_booking_prescriptions_table', 3),
(39, '2021_08_11_074600_alter_service_bookings_for_add_uuid', 3),
(40, '2021_08_11_103316_create_service_reviews_table', 3),
(41, '2021_08_11_130120_alter_homeopath_services_for_add_meeting_channel', 3),
(42, '2021_08_12_092341_create_homeopath_resources_table', 3),
(43, '2021_08_16_070833_alter_users_for_add_is_social_steps_completed', 3),
(45, '2021_08_16_101752_create_social_post_tags_table', 3),
(46, '2021_08_16_102725_create_followings_table', 3),
(47, '2021_08_17_063602_create_conversations_table', 3),
(48, '2021_08_17_063655_create_messages_table', 3),
(49, '2021_08_17_071119_create_user_social_profiles_table', 3),
(50, '2021_08_17_080647_add_is_read_filed_in_message_table', 3),
(51, '2021_08_20_102712_alter_posts_caption_for_text_data_type', 3),
(52, '2021_08_16_101605_create_user_social_groups_table', 4),
(53, '2021_08_24_065829_alter_social_posts_for_add_group_id', 5),
(54, '2021_08_24_101953_alter_social_posts_for_add_unique_id', 6),
(55, '2021_08_25_062257_create_events_table', 7),
(56, '2021_08_25_064202_create_event_timings_table', 7),
(57, '2021_08_25_060349_create_notifications_table', 8),
(58, '2021_08_25_085400_add_field_in_notifications_table', 8),
(59, '2021_08_26_093215_create_event_requests_table', 9),
(60, '2021_08_31_124057_create_donations_table', 10),
(61, '2021_09_01_060918_create_inquiries_table', 11),
(62, '2021_08_31_061211_create_cart_wish_lists_table', 12),
(63, '2021_09_02_060927_create_shop_orders_table', 13),
(64, '2021_09_02_061617_create_shop_order_products_table', 13),
(65, '2021_09_03_080755_create_homeopath_documents_table', 14),
(66, '2021_09_03_130141_create_report_users_table', 15),
(67, '2016_09_12_99999_create_visitlogs_table', 16),
(68, '2021_09_24_074304_add_column_in_social_posts_table_type_and_desc', 17),
(69, '2021_09_27_071927_create_zoom_meetings_table', 18),
(70, '2021_10_05_090534_alter_homeopath_documents_for_add_title', 19),
(71, '2021_10_05_105527_add_col_in_service_booking_s_table', 20),
(72, '2021_10_06_092956_alter_users_for_add_zoom_access_token', 20),
(73, '2021_10_06_113157_create_badges_table', 21),
(74, '2021_10_06_124839_alter_users_for_add_badge', 22),
(75, '2021_10_07_051958_create_ads_settings_table', 23),
(76, '2021_10_08_055829_alter_homeopathy_profiles_for_add_registration_number', 24),
(77, '2021_10_08_074444_create_badge_requests_table', 25),
(78, '2021_10_11_060209_create_location_texes_table', 26),
(79, '2021_10_18_123749_add_field_in_users', 27),
(80, '2021_10_21_090726_create_timetables_table', 28),
(81, '2021_10_21_090958_create_day_slots_table', 28),
(82, '2021_10_21_130702_alter_timetables_for_add_to_from', 28),
(83, '2021_10_28_102026_create_homeopath_holidays_table', 28),
(84, '2021_11_10_205017_create_f_a_q_s_table', 29),
(86, '2021_11_11_161159_add_field_in_homeopathdocument_table', 30),
(87, '2021_11_12_235814_add_field_in_homeopath_profile', 31),
(88, '2021_11_19_135528_create_news_letter_emails_table', 32),
(89, '2021_12_02_101318_add_field_in_homeopath_images_table', 33),
(90, '2021_12_02_110918_add_field_for_pdf_attachment_in_homeopath_resoureces_table', 34),
(91, '2021_11_15_105757_alter_homeopath_profiles_for_add_service_document', 35),
(92, '2021_12_02_125335_add_field_inprofile_homeopath', 36),
(93, '2021_12_02_193331_change_ttime_slot_field_of_services_booking', 37),
(94, '2021_12_03_143808_add_field_in_service_bookings_service_handel_via', 38),
(95, '2021_12_03_151724_create_homeopath_service_zoom_meetings_table', 39),
(96, '2021_12_07_091419_add_field_in_service_booking_table_of_homeopath_id', 40),
(97, '2021_12_07_091828_add_field_of_slug_in_users_table', 41),
(98, '2021_12_07_121039_change_about_col_varchar_to_text_in_user_social_profiles', 42),
(99, '2021_12_27_125418_add_field_in_homeopath_services', 43),
(100, '2021_12_28_120302_add_field_in_homeopath_profiles_with_name_service_document_inner', 44),
(101, '2021_12_29_101536_add_field_of_status_in_social_posts_table', 45),
(102, '2021_12_29_120914_create_user_social_albums_table', 46),
(103, '2021_12_29_121312_create_album_photos_table', 46),
(104, '2022_01_10_095535_add_filed_of_child_service_document_in_homeopath_services_table', 47),
(105, '2022_01_10_095708_add_filed_of_adult_service_document_in_homeopath_services_table', 47),
(106, '2022_01_10_110706_add_field_pay_later_method_in_service_bookind_table', 48),
(107, '2022_01_11_164227_add_field_address_etc_in_homeopath_profile_table', 49),
(108, '2022_01_11_165908_create_homeopath_badges_settings_table', 50);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_letter_emails`
--

CREATE TABLE `news_letter_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_letter_emails`
--

INSERT INTO `news_letter_emails` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'faisalhussainntu03@gmail.com', '2021-11-25 10:41:52', '2021-11-25 10:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `notification_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_text` text COLLATE utf8mb4_unicode_ci,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `sender_id`, `notification_from`, `notification_to`, `notification_text`, `is_read`, `type`, `count`, `created_at`, `updated_at`) VALUES
(1, 10, 6, 'Homeopath', 'Advocate', 'Homeopath Follow You', 1, 'followed', 1, '2021-08-25 08:24:10', '2021-08-25 08:28:17'),
(2, 10, 6, 'Homeopath', 'Advocate', 'New Message from Homeopath', 1, 'message', 3, '2021-08-25 08:25:00', '2021-08-25 08:28:09'),
(3, 6, 10, 'Advocate', 'Homeopath', 'New Message from Advocate', 0, 'message', 2, '2021-08-25 08:26:26', '2021-10-20 14:58:57'),
(4, 6, 10, 'Advocate', 'Homeopath', 'Advocate Follow You', 1, 'followed', 1, '2021-08-25 08:26:59', '2021-08-25 08:27:13'),
(5, 10, 6, 'Homeopath', 'Advocate', 'Homeopath UnFollow You', 0, 'unfollowed', 1, '2021-08-25 08:28:42', '2021-08-25 08:28:42'),
(6, 6, 10, 'Advocate', 'Homeopath', 'Advocate UnFollow You', 1, 'unfollowed', 1, '2021-08-25 08:29:06', '2021-08-25 08:29:18'),
(7, 10, 10, 'Advocate', 'Advocate', 'Advocate UnFollow You', 0, 'unfollowed', 1, '2021-08-26 07:05:52', '2021-08-26 07:06:13'),
(8, 10, 5, 'User', 'Advocate', 'User Follow You', 1, 'followed', 1, '2021-08-26 08:16:34', '2021-10-20 15:19:19'),
(9, 11, 5, 'User', 'Homeo', 'User Follow You', 0, 'followed', 1, '2021-08-26 08:17:42', '2021-08-26 08:17:42'),
(10, 11, 5, 'User', 'Homeo', 'New Message from User', 1, 'message', 2, '2021-08-26 08:18:05', '2021-08-26 08:18:31'),
(11, 11, 5, 'User', 'Homeo', 'New Message from User', 0, 'message', 1, '2021-08-26 08:18:41', '2021-08-26 08:18:41'),
(12, 5, 11, 'Homeo', 'User', 'New Message from Homeo', 0, 'message', 1, '2021-08-26 08:18:50', '2021-08-26 08:18:50'),
(13, 5, 6, 'Homeopath', 'User', 'Homeopath Follow You', 0, 'followed', 1, '2021-08-27 06:33:10', '2021-08-27 06:33:10'),
(14, 5, 5, 'User', 'User', 'User UnFollow You', 0, 'unfollowed', 1, '2021-08-27 06:33:51', '2021-08-27 06:34:23'),
(15, 11, 11, 'M faisal', 'M faisal', 'M faisal Follow You', 0, 'followed', 1, '2021-10-29 05:40:51', '2021-10-29 05:40:51'),
(16, 11, 12, 'homeo101', 'M faisal', 'homeo101 Follow You', 0, 'followed', 1, '2021-11-19 05:06:06', '2021-11-19 05:06:06'),
(17, 5, 11, 'M faisal', 'User', 'M faisal Follow You', 0, 'followed', 1, '2021-12-07 11:00:33', '2021-12-15 06:36:43'),
(18, 6, 10, 'Advocate', 'Homeopath', 'Advocate Follow You', 0, 'followed', 1, '2021-12-30 06:51:18', '2021-12-30 06:51:18'),
(19, 11, 10, 'Advocate', 'M faisal', 'Advocate Follow You', 0, 'followed', 1, '2021-12-30 06:54:13', '2021-12-30 06:54:13'),
(20, 5, 10, 'Advocate', 'User', 'Advocate Follow You', 0, 'followed', 1, '2021-12-31 05:01:52', '2021-12-31 05:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', 'web', '2021-08-24 01:05:19', '2021-08-24 01:05:19'),
(2, 'browse_roles', 'web', '2021-08-24 01:05:19', '2021-08-24 01:05:19'),
(3, 'browse_teams', 'web', '2021-08-24 01:05:19', '2021-08-24 01:05:19'),
(4, 'browse_settings', 'web', '2021-08-24 01:07:30', '2021-08-24 01:07:30'),
(5, 'browse_services', 'web', '2021-08-24 01:07:30', '2021-08-24 01:07:30'),
(6, 'browse_blogs', 'web', '2021-08-24 01:07:30', '2021-08-24 01:07:30'),
(7, 'browse_shop', 'web', '2021-08-24 01:07:30', '2021-08-24 01:07:30'),
(8, 'browse_finance', 'web', '2021-08-24 01:07:30', '2021-08-24 01:07:30'),
(9, 'homeopath_library', 'web', '2021-08-24 01:07:30', '2021-08-24 01:07:30'),
(10, 'browse_inquiries', 'web', '2021-09-09 05:02:48', '2021-09-09 05:02:48'),
(11, 'browse_reports', 'web', '2021-09-09 05:08:46', '2021-09-09 05:08:46'),
(12, 'browse_donations', 'web', '2021-09-09 07:18:53', '2021-09-09 07:18:53'),
(13, 'browse_members', 'web', '2021-10-06 23:40:48', '2021-10-06 23:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `address_line_1` text,
  `address_line_2` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `acheivement` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `store_name`, `address_line_1`, `address_line_2`, `city`, `state`, `country`, `zip_code`, `acheivement`, `created_at`, `updated_at`) VALUES
(1, 10, 'New Store', 'New Lane Street', 'Pak Arab Town', 'Lahore', 'Punjab', 'Pakistan', '12222', NULL, '2021-08-24 08:11:46', '2021-08-24 08:11:46'),
(2, 20, 'abc', 'abc', 'abc', 'Lahore', 'Punjab', 'Pakistan', '54000', NULL, '2021-09-03 01:45:12', '2021-09-03 01:45:12'),
(3, 25, 'ghjgdh', 'yugyhj', 'uygyhukhj', 'ghjkhj', 'jhkh', 'ghjh', '345678', NULL, '2021-10-29 04:21:08', '2021-10-29 04:21:08'),
(4, 26, 'fghjk', 'ffghjk', 'fghjkl', 'dfghjk', 'defgyuhj', 'dfcghjbnk', '2345678', NULL, '2021-10-29 04:22:53', '2021-10-29 04:22:53'),
(5, 27, 'sdfghjk', 'dfghjkl', 'dfghjkl', 'dfghj', 'dfghjk', 'dfghjk', '3456789', NULL, '2021-10-29 04:25:55', '2021-10-29 04:25:55'),
(6, 36, 'ghjgdh', 'sadsd', 'sadsadsda', 'sdasdasda', 'dsasdasda', 'sdasda', '15656', NULL, '2021-12-15 08:08:08', '2021-12-15 08:08:08'),
(7, 37, 'ghjgdh', 'dasfsd', 'dsffd', 'jhbdajsfbsd', 'defgyuhj', 'ghjh', '65456', NULL, '2021-12-15 08:49:18', '2021-12-15 08:49:18'),
(8, 38, 'ghjgdh', 'cvcxcv', 'dffdsfdsdfs', 'dfdfdfsdfs', 'dfsdfsfdsfds', '654654', '544454', NULL, '2021-12-15 09:48:12', '2021-12-15 09:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `report_users`
--

CREATE TABLE `report_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reported_by` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','pending','cancelled','closed','spammed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `report_users`
--

INSERT INTO `report_users` (`id`, `user_id`, `reported_by`, `type`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(4, 18, 13, 'ccccc', 'mmmmmmmmmmmmmmm', 'closed', '2021-09-16 11:27:12', '2021-09-09 06:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-08-24 01:05:19', '2021-08-24 01:05:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_bookings`
--

CREATE TABLE `service_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `homeopath_id` int(11) DEFAULT NULL,
  `homeopath_service_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `time_slot` longtext NOT NULL,
  `illness` varchar(255) DEFAULT NULL,
  `allergies` varchar(255) DEFAULT NULL,
  `concern` varchar(255) DEFAULT NULL,
  `price` double(8,2) DEFAULT '0.00',
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_method` enum('stripe','paypal','offline','pay-later','other') NOT NULL DEFAULT 'other',
  `status` enum('active','refund','inactive','pending','closed','paused','completed','cancelled','N/A') NOT NULL DEFAULT 'active',
  `email_alert` varchar(255) NOT NULL DEFAULT '0' COMMENT '0:no,1:send',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meeting_handel_via` varchar(255) DEFAULT NULL,
  `later_pay_method` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_bookings`
--

INSERT INTO `service_bookings` (`id`, `user_id`, `homeopath_id`, `homeopath_service_id`, `uuid`, `date`, `time_slot`, `illness`, `allergies`, `concern`, `price`, `transaction_id`, `payment_method`, `status`, `email_alert`, `created_at`, `updated_at`, `meeting_handel_via`, `later_pay_method`) VALUES
(1, 38, 11, 8, '151221033657', '2021-12-22', '[\"01:00\",\"01:01\",\"01:02\",\"01:03\",\"01:04\",\"01:05\",\"01:06\",\"01:07\",\"01:08\",\"01:09\",\"01:10\",\"01:11\",\"01:12\",\"01:13\",\"01:14\",\"01:15\",\"01:16\",\"01:17\",\"01:18\",\"01:19\",\"01:20\",\"01:21\",\"01:22\",\"01:23\",\"01:24\",\"01:25\",\"01:26\",\"01:27\",\"01:28\",\"01:29\",\"01:30\"]', NULL, NULL, NULL, 10.00, NULL, 'pay-later', 'active', '0', '2021-12-15 10:36:57', '2021-12-15 10:36:57', 'Online', NULL),
(2, 11, 11, 8, '271221100703', '2021-12-28', '[\"09:00\",\"09:01\",\"09:02\",\"09:03\",\"09:04\",\"09:05\",\"09:06\",\"09:07\",\"09:08\",\"09:09\",\"09:10\",\"09:11\",\"09:12\",\"09:13\",\"09:14\",\"09:15\",\"09:16\",\"09:17\",\"09:18\",\"09:19\",\"09:20\",\"09:21\",\"09:22\",\"09:23\",\"09:24\",\"09:25\",\"09:26\",\"09:27\",\"09:28\",\"09:29\",\"09:30\"]', NULL, NULL, NULL, 10.00, NULL, 'pay-later', 'active', '0', '2021-12-27 05:07:03', '2021-12-27 05:07:03', 'Offline', NULL),
(3, 11, 11, 8, '281221121428', '2021-12-28', '[\"12:20\",\"12:21\",\"12:22\",\"12:23\",\"12:24\",\"12:25\",\"12:26\",\"12:27\",\"12:28\",\"12:29\",\"12:30\",\"12:31\",\"12:32\",\"12:33\",\"12:34\",\"12:35\",\"12:36\",\"12:37\",\"12:38\",\"12:39\",\"12:40\",\"12:41\",\"12:42\",\"12:43\",\"12:44\",\"12:45\",\"12:46\",\"12:47\",\"12:48\",\"12:49\",\"12:50\"]', NULL, NULL, NULL, 10.00, NULL, 'pay-later', 'cancelled', '0', '2021-12-28 07:14:28', '2022-01-10 09:38:44', 'Offline', NULL),
(4, 11, 11, 8, '281221121630', '2021-12-28', '[\"12:20\",\"12:21\",\"12:22\",\"12:23\",\"12:24\",\"12:25\",\"12:26\",\"12:27\",\"12:28\",\"12:29\",\"12:30\",\"12:31\",\"12:32\",\"12:33\",\"12:34\",\"12:35\",\"12:36\",\"12:37\",\"12:38\",\"12:39\",\"12:40\",\"12:41\",\"12:42\",\"12:43\",\"12:44\",\"12:45\",\"12:46\",\"12:47\",\"12:48\",\"12:49\",\"12:50\"]', NULL, NULL, NULL, 10.00, NULL, 'pay-later', 'active', '0', '2021-12-28 07:16:30', '2021-12-28 07:16:30', 'Offline', NULL),
(5, 11, 11, 8, '281221121711', '2021-12-28', '[\"12:20\",\"12:21\",\"12:22\",\"12:23\",\"12:24\",\"12:25\",\"12:26\",\"12:27\",\"12:28\",\"12:29\",\"12:30\",\"12:31\",\"12:32\",\"12:33\",\"12:34\",\"12:35\",\"12:36\",\"12:37\",\"12:38\",\"12:39\",\"12:40\",\"12:41\",\"12:42\",\"12:43\",\"12:44\",\"12:45\",\"12:46\",\"12:47\",\"12:48\",\"12:49\",\"12:50\"]', NULL, NULL, NULL, 10.00, NULL, 'pay-later', 'active', '0', '2021-12-28 07:17:11', '2021-12-28 07:17:11', 'Offline', NULL),
(6, 11, 11, 8, '281221121730', '2021-12-28', '[\"12:20\",\"12:21\",\"12:22\",\"12:23\",\"12:24\",\"12:25\",\"12:26\",\"12:27\",\"12:28\",\"12:29\",\"12:30\",\"12:31\",\"12:32\",\"12:33\",\"12:34\",\"12:35\",\"12:36\",\"12:37\",\"12:38\",\"12:39\",\"12:40\",\"12:41\",\"12:42\",\"12:43\",\"12:44\",\"12:45\",\"12:46\",\"12:47\",\"12:48\",\"12:49\",\"12:50\"]', NULL, NULL, NULL, 10.00, NULL, 'pay-later', 'active', '0', '2021-12-28 07:17:30', '2021-12-28 07:17:30', 'Offline', NULL),
(7, 11, 11, 7, '100122110854', '2022-01-11', '[\"07:05\",\"07:06\",\"07:07\",\"07:08\",\"07:09\",\"07:10\",\"07:11\",\"07:12\",\"07:13\",\"07:14\",\"07:15\",\"07:16\",\"07:17\",\"07:18\",\"07:19\",\"07:20\",\"07:21\",\"07:22\",\"07:23\",\"07:24\",\"07:25\",\"07:26\",\"07:27\",\"07:28\",\"07:29\",\"07:30\",\"07:31\",\"07:32\",\"07:33\",\"07:34\",\"07:35\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'cancelled', '0', '2022-01-10 06:08:54', '2022-01-12 11:26:06', 'Online', 'Cheques'),
(8, 11, 11, 7, '100122111459', '2022-01-11', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, 'pi_3KGI5iJCeiSH2y6n1iUPs0Zx', 'stripe', 'cancelled', '0', '2022-01-10 06:14:59', '2022-01-10 09:25:04', 'Online', NULL),
(9, 11, 11, 7, '100122111621', '2022-01-11', '[\"07:40\",\"07:41\",\"07:42\",\"07:43\",\"07:44\",\"07:45\",\"07:46\",\"07:47\",\"07:48\",\"07:49\",\"07:50\",\"07:51\",\"07:52\",\"07:53\",\"07:54\",\"07:55\",\"07:56\",\"07:57\",\"07:58\",\"07:59\",\"08:00\",\"08:01\",\"08:02\",\"08:03\",\"08:04\",\"08:05\",\"08:06\",\"08:07\",\"08:08\",\"08:09\",\"08:10\"]', NULL, NULL, NULL, 5.00, '99J87561MU7390359', 'paypal', 'closed', '0', '2022-01-10 06:16:21', '2022-01-12 11:28:29', 'Offline', NULL),
(10, 11, 11, 10, '100122044727', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:47:27', '2022-01-10 11:47:27', 'Online', 'Visa'),
(11, 11, 11, 10, '100122045321', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:53:21', '2022-01-10 11:53:21', 'Online', 'Visa'),
(12, 11, 11, 10, '100122045355', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:53:55', '2022-01-10 11:53:55', 'Online', 'Visa'),
(13, 11, 11, 10, '100122045413', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:54:13', '2022-01-10 11:54:13', 'Online', 'Visa'),
(14, 11, 11, 10, '100122045428', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:54:28', '2022-01-10 11:54:28', 'Online', 'Visa'),
(15, 11, 11, 10, '100122045500', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:55:00', '2022-01-10 11:55:00', 'Online', 'Visa'),
(16, 11, 11, 10, '100122045523', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:55:23', '2022-01-10 11:55:23', 'Online', 'Visa'),
(17, 11, 11, 10, '100122045629', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:56:29', '2022-01-10 11:56:29', 'Online', 'Visa'),
(18, 11, 11, 10, '100122045814', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:58:14', '2022-01-10 11:58:14', 'Online', 'Visa'),
(19, 11, 11, 10, '100122045846', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:58:46', '2022-01-10 11:58:46', 'Online', 'Visa'),
(20, 11, 11, 10, '100122045919', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 11:59:19', '2022-01-10 11:59:19', 'Online', 'Visa'),
(21, 11, 11, 10, '100122050045', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 12:00:45', '2022-01-10 12:00:45', 'Online', 'Visa'),
(22, 11, 11, 10, '100122050125', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 12:01:25', '2022-01-10 12:01:25', 'Online', 'Visa'),
(23, 11, 11, 10, '100122050219', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 12:02:19', '2022-01-10 12:02:19', 'Online', 'Visa'),
(24, 11, 11, 10, '100122050227', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 12:02:27', '2022-01-10 12:02:27', 'Online', 'Visa'),
(25, 11, 11, 10, '100122050256', '2022-01-11', '[\"08:15\",\"08:16\",\"08:17\",\"08:18\",\"08:19\",\"08:20\",\"08:21\",\"08:22\",\"08:23\",\"08:24\",\"08:25\",\"08:26\",\"08:27\",\"08:28\",\"08:29\",\"08:30\",\"08:31\",\"08:32\",\"08:33\",\"08:34\",\"08:35\",\"08:36\",\"08:37\",\"08:38\",\"08:39\",\"08:40\",\"08:41\",\"08:42\",\"08:43\",\"08:44\",\"08:45\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 12:02:56', '2022-01-10 12:02:56', 'Online', 'Visa'),
(26, 11, 11, 7, '100122050354', '2022-01-18', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'cancelled', '0', '2022-01-10 12:03:54', '2022-01-12 11:45:00', 'Online', 'Visa'),
(27, 11, 11, 7, '100122050646', '2022-01-18', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'cancelled', '0', '2022-01-10 12:06:46', '2022-01-12 11:46:36', 'Online', 'Visa'),
(28, 11, 11, 7, '100122050750', '2022-01-18', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'cancelled', '0', '2022-01-10 12:07:50', '2022-01-12 06:37:50', 'Online', 'Visa'),
(29, 11, 11, 7, '100122050843', '2022-01-18', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'closed', '0', '2022-01-10 12:08:43', '2022-01-12 11:34:19', 'Online', 'Visa'),
(30, 11, 11, 7, '100122051429', '2022-01-18', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'cancelled', '0', '2022-01-10 12:14:29', '2022-01-12 11:48:44', 'Online', 'Visa'),
(31, 11, 11, 7, '100122051448', '2022-01-18', '[\"06:30\",\"06:31\",\"06:32\",\"06:33\",\"06:34\",\"06:35\",\"06:36\",\"06:37\",\"06:38\",\"06:39\",\"06:40\",\"06:41\",\"06:42\",\"06:43\",\"06:44\",\"06:45\",\"06:46\",\"06:47\",\"06:48\",\"06:49\",\"06:50\",\"06:51\",\"06:52\",\"06:53\",\"06:54\",\"06:55\",\"06:56\",\"06:57\",\"06:58\",\"06:59\",\"07:00\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'active', '0', '2022-01-10 12:14:48', '2022-01-10 12:14:48', 'Online', 'Visa'),
(33, 11, NULL, 11, '110122101339', '2022-01-11', '[\"10:10\",\"10:11\",\"10:12\",\"10:13\",\"10:14\",\"10:15\",\"10:16\",\"10:17\",\"10:18\",\"10:19\",\"10:20\",\"10:21\",\"10:22\",\"10:23\",\"10:24\",\"10:25\",\"10:26\",\"10:27\",\"10:28\",\"10:29\",\"10:30\",\"10:31\",\"10:32\",\"10:33\",\"10:34\",\"10:35\",\"10:36\",\"10:37\",\"10:38\",\"10:39\",\"10:40\"]', NULL, NULL, NULL, 5.00, NULL, 'other', 'active', '0', '2022-01-11 05:13:39', '2022-01-11 05:13:39', NULL, NULL),
(34, 22, NULL, 11, '110122103052', '2022-01-11', '[\"10:30\",\"10:31\",\"10:32\",\"10:33\",\"10:34\",\"10:35\",\"10:36\",\"10:37\",\"10:38\",\"10:39\",\"10:40\",\"10:41\",\"10:42\",\"10:43\",\"10:44\",\"10:45\",\"10:46\",\"10:47\",\"10:48\",\"10:49\",\"10:50\",\"10:51\",\"10:52\",\"10:53\",\"10:54\",\"10:55\",\"10:56\",\"10:57\",\"10:58\",\"10:59\",\"11:00\"]', NULL, NULL, NULL, 5.00, NULL, 'other', 'active', '0', '2022-01-11 05:30:52', '2022-01-11 05:30:52', NULL, NULL),
(35, 22, NULL, 11, '110122103134', '2022-01-11', '[\"22:05\",\"22:06\",\"22:07\",\"22:08\",\"22:09\",\"22:10\",\"22:11\",\"22:12\",\"22:13\",\"22:14\",\"22:15\",\"22:16\",\"22:17\",\"22:18\",\"22:19\",\"22:20\",\"22:21\",\"22:22\",\"22:23\",\"22:24\",\"22:25\",\"22:26\",\"22:27\",\"22:28\",\"22:29\",\"22:30\",\"22:31\",\"22:32\",\"22:33\",\"22:34\",\"22:35\"]', NULL, NULL, NULL, 5.00, NULL, 'other', 'active', '0', '2022-01-11 05:31:34', '2022-01-11 05:31:34', NULL, NULL),
(36, 11, 11, 7, '120122105550', '2022-01-12', '[\"12:05\",\"12:06\",\"12:07\",\"12:08\",\"12:09\",\"12:10\",\"12:11\",\"12:12\",\"12:13\",\"12:14\",\"12:15\",\"12:16\",\"12:17\",\"12:18\",\"12:19\",\"12:20\",\"12:21\",\"12:22\",\"12:23\",\"12:24\",\"12:25\",\"12:26\",\"12:27\",\"12:28\",\"12:29\",\"12:30\",\"12:31\",\"12:32\",\"12:33\",\"12:34\",\"12:35\"]', NULL, NULL, NULL, 5.00, NULL, 'pay-later', 'closed', '0', '2022-01-12 05:55:50', '2022-01-12 11:28:46', 'Online', 'Cash'),
(38, 23, 11, 7, '120122012509', '2022-01-12', '[\"15:20\",\"15:21\",\"15:22\",\"15:23\",\"15:24\",\"15:25\",\"15:26\",\"15:27\",\"15:28\",\"15:29\",\"15:30\",\"15:31\",\"15:32\",\"15:33\",\"15:34\",\"15:35\",\"15:36\",\"15:37\",\"15:38\",\"15:39\",\"15:40\",\"15:41\",\"15:42\",\"15:43\",\"15:44\",\"15:45\",\"15:46\",\"15:47\",\"15:48\",\"15:49\",\"15:50\"]', NULL, NULL, NULL, 5.00, NULL, 'other', 'cancelled', '0', '2022-01-12 08:25:09', '2022-01-12 10:13:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_booking_prescriptions`
--

CREATE TABLE `service_booking_prescriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_booking_id` bigint(20) UNSIGNED NOT NULL,
  `prescription` text NOT NULL,
  `attachement` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_reviews`
--

CREATE TABLE `service_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `homeopath_id` bigint(20) UNSIGNED NOT NULL,
  `homeopath_service_id` bigint(20) UNSIGNED NOT NULL,
  `feedback` text,
  `rate` enum('1','2','3','4','5') NOT NULL DEFAULT '5',
  `status` enum('pending','approved','cancelled','spam') NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_themes`
--

CREATE TABLE `service_themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_themes`
--

INSERT INTO `service_themes` (`id`, `title`, `color`, `cover`, `created_at`, `updated_at`) VALUES
(1, 'Red Theme', '#971717', 'uploads/services/1629785297-banner-18.jpg', '2021-08-24 01:08:17', '2021-11-15 04:04:52'),
(2, 'Green Theme', '#000000', 'uploads/services/1629785322-Amazon-Rainforest-Wallpaper---Wallpaper-High-Definition-High-Quality.jpg', '2021-08-24 01:08:42', '2021-08-24 01:08:42'),
(3, 'Xyz', '#e8c9c9', 'uploads/services/1638878056-1636088168-Screenshot_101.png', '2021-12-07 10:54:16', '2021-12-07 10:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'services_commission', '8', '2021-08-13 02:04:14', '2021-08-13 02:06:50'),
(2, 'services_tax', '2', '2021-08-13 02:06:50', '2021-08-13 02:27:28'),
(3, 'services_discount', '5', '2021-08-13 02:27:40', '2021-08-13 02:33:50'),
(4, 'banner_heading', 'Canadian Homeopathy Wellness Group', '2021-08-13 05:05:14', '2021-09-03 01:05:34'),
(5, 'banner_description', 'CHWG joins a Community for Homeopathy newest solution, homeopathic Anywhere, to help accelerate businesses in real-time. Reimagine sales and service with real-time data, built-in collaboration, and timely alerts.', '2021-08-13 05:05:15', '2021-09-03 01:05:34'),
(6, 'phone', '(647) 688 - 8769', '2021-08-13 05:05:15', '2021-08-13 05:05:15'),
(7, 'facebook', 'https://www.facebook.com/', '2021-08-13 05:05:15', '2021-08-13 05:05:15'),
(8, 'instagram', 'https://www.instagram.com/', '2021-08-13 05:05:15', '2021-08-13 05:05:15'),
(9, 'twitter', 'https://twitter.com/?lang=en', '2021-08-13 05:05:15', '2021-08-13 05:05:15'),
(10, 'linkedin', 'https://www.linkedin.com/', '2021-08-13 05:05:15', '2021-08-13 05:05:15'),
(11, 'dribble', 'https://dribbble.com/', '2021-08-13 05:05:15', '2021-08-13 05:05:15'),
(12, 'youtube', 'https://www.youtube.com/', '2021-08-13 05:05:16', '2021-08-13 05:05:16'),
(13, 'favicon', 'uploads/cms/logotop.png', '2021-08-13 05:05:16', '2021-08-13 05:05:16'),
(14, 'logo', 'uploads/cms/1621064519-h-40-logo.png', '2021-08-13 05:05:16', '2021-08-13 05:05:16'),
(15, 'copyright', '<b>Canadian Homeopathy Wellness Group</b>. All rights reserved.', '2021-08-13 05:10:26', '2021-09-03 01:05:34'),
(16, 'banner_image', 'uploads/cms/img.png', '2021-08-13 05:13:34', '2021-08-13 05:13:35'),
(17, 'homeopath_popup_description', 'Homeopathy is a \"treatment\" based on the use of highly diluted substances, which practitioners claim can cause the body to heal itself. A 2010 House of Commons Science and Technology Committee report on homeopathy said that homeopathic remedies perform no better than placebos (dummy treatments).', '2021-08-24 07:16:12', '2021-08-24 07:16:12'),
(18, 'secure_heading', 'Secure Non-cercare Real', '2021-09-08 08:15:08', '2021-09-08 08:15:19'),
(19, 'what_is_ch_for_adv_heading', 'What is CHWG for Advocates', '2021-09-08 23:21:06', '2021-09-08 23:21:06'),
(20, 'what_is_ch_for_adv_description', 'CHWG for Customer 360 is the easiest way for Salesforce customers to transform processes like Account Planning, Mutual Close Plans, and Case Swarms. Standardize, automate and embed real-time, collaborative documents inside Salesforce records.', '2021-09-08 23:21:06', '2021-09-08 23:21:06'),
(21, 'what_is_ch_for_adv_1st_word', 'Documents', '2021-09-08 23:21:06', '2021-09-08 23:21:06'),
(22, 'what_is_ch_for_adv_1st_title', 'that fuel a culture of action', '2021-09-08 23:21:06', '2021-09-08 23:21:06'),
(23, 'what_is_ch_for_adv_1st_summary', 'Quip documents unite your team’s work and communication, so you can get everything done in one place.', '2021-09-08 23:21:06', '2021-09-08 23:21:06'),
(24, 'what_is_ch_for_adv_2nd_word', 'Spreadsheets', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(25, 'what_is_ch_for_adv_2nd_title', 'that turn numbers into decisions', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(26, 'what_is_ch_for_adv_2nd_summary', 'Embed spreadsheets into documents to give data the context your team needs to make critical decisions.', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(27, 'what_is_ch_for_adv_3rd_word', 'Slides', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(28, 'what_is_ch_for_adv_3rd_title', 'that drive engagement & feedback', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(29, 'what_is_ch_for_adv_3rd_summary', 'Team-based slides that quickly and clearly get you to the right decision — with fewer, better meetings, and no messy file versions.', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(30, 'what_is_ch_for_adv_4th_word', 'Chat', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(31, 'what_is_ch_for_adv_4th_title', 'that breaks down information silos', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(32, 'what_is_ch_for_adv_4th_summary', 'Streamline your workflow with team chat built into every document and spreadsheet; plus team chat rooms and 1:1 messaging.', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(33, 'what_is_ch_for_adv_1st_thumbnail', 'uploads/cms/documents.png', '2021-09-08 23:21:07', '2021-09-08 23:21:07'),
(34, 'what_is_ch_for_adv_2nd_thumbnail', 'uploads/cms/abstraction_sheet.png', '2021-09-08 23:21:08', '2021-09-08 23:21:08'),
(35, 'what_is_ch_for_adv_3rd_thumbnail', 'uploads/cms/abstraction_slide.png', '2021-09-08 23:21:08', '2021-09-08 23:21:08'),
(36, 'what_is_ch_for_adv_4th_thumbnail', 'uploads/cms/abstraction_chat.png', '2021-09-08 23:21:08', '2021-09-08 23:21:08'),
(37, 'what_is_ch_for_homeo_heading', 'What is CHWG for Homeopaths', '2021-09-08 23:35:06', '2021-09-08 23:35:06'),
(38, 'what_is_ch_for_homeo_description', 'CHWG for Customer 360 is the easiest way for Salesforce customers to transform processes like Account Planning, Mutual Close Plans, and Case Swarms. Standardize, automate and embed real-time, collaborative documents inside Salesforce records.', '2021-09-08 23:35:06', '2021-09-08 23:35:06'),
(39, 'what_is_ch_for_homeo_1st_word', 'Documents', '2021-09-08 23:35:06', '2021-09-08 23:35:06'),
(40, 'what_is_ch_for_homeo_1st_title', 'that fuel a culture of action', '2021-09-08 23:35:06', '2021-09-08 23:35:06'),
(41, 'what_is_ch_for_homeo_1st_summary', 'Quip documents unite your team’s work and communication, so you can get everything done in one place.', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(42, 'what_is_ch_for_homeo_2nd_word', 'Spreadsheets', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(43, 'what_is_ch_for_homeo_2nd_title', 'that turn numbers into decisions', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(44, 'what_is_ch_for_homeo_2nd_summary', 'Embed spreadsheets into documents to give data the context your team needs to make critical decisions.', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(45, 'what_is_ch_for_homeo_3rd_word', 'Slides', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(46, 'what_is_ch_for_homeo_3rd_title', 'that drive engagement & feedback', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(47, 'what_is_ch_for_homeo_3rd_summary', 'Team-based slides that quickly and clearly get you to the right decision — with fewer, better meetings, and no messy file versions.', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(48, 'what_is_ch_for_homeo_4th_word', 'Chat', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(49, 'what_is_ch_for_homeo_4th_title', 'that breaks down information silos', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(50, 'what_is_ch_for_homeo_4th_summary', 'Streamline your workflow with team chat built into every document and spreadsheet; plus team chat rooms and 1:1 messaging.', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(51, 'what_is_ch_for_homeo_1st_thumbnail', 'uploads/cms/documents.png', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(52, 'what_is_ch_for_homeo_2nd_thumbnail', 'uploads/cms/abstraction_sheet.png', '2021-09-08 23:35:07', '2021-09-08 23:35:07'),
(53, 'what_is_ch_for_homeo_3rd_thumbnail', 'uploads/cms/abstraction_slide.png', '2021-09-08 23:35:08', '2021-09-08 23:35:08'),
(54, 'what_is_ch_for_homeo_4th_thumbnail', 'uploads/cms/abstraction_chat.png', '2021-09-08 23:35:08', '2021-09-08 23:35:08'),
(55, 'reopening_journey_heading', 'Reopening will be a journey. Work.com is your guide.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(56, 'reopening_journey_description', 'An all-new suite of apps, expertise, and services to manage this crisis today and thrive tomorrow.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(57, 'chwg_for_advocates', 'CHWG for Advocates', '2021-09-08 23:40:50', '2021-09-09 00:58:43'),
(58, 'chwg_for_homeopaths', 'CHWG for Homeopaths', '2021-09-08 23:40:50', '2021-09-09 00:58:43'),
(59, 'helpful_resource_1st_heading', 'Our Mission', '2021-09-08 23:40:50', '2021-09-08 23:52:37'),
(60, 'helpful_resource_1st_description', 'Learn how to keep momentum and continue collaborating in new ways.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(61, 'helpful_resource_2nd_description', 'Bringing the awareness of homeopathy for what it can truly offer to every single Canadian.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(62, 'helpful_resource_3rd_heading', 'Important Articles', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(63, 'helpful_resource_3rd_description', 'A dedicated resource page with solutions and content to help respond to the needs of your employees, customers, and community during this time.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(64, 'secure_description', 'CHWG is Salesforce\'s productivity platform that transforms the way enterprises work together, delivering modern collaboration securely and simply across any device.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(65, 'secure_1st_heading', 'Security', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(66, 'secure_1st_description', 'Trust is our #1 value. We work tirelessly to ensure all customers have the highest level of data protection, privacy, and control.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(67, 'secure_2nd_heading', 'Virtual Private Cloud', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(68, 'secure_2nd_description', 'Deploy to a single-tenant virtual private cluster that\'s managed as a service by Salesforce. You\'re in complete control of geography, networking setup, and more.', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(69, 'secure_3rd_heading', 'CHWG Shield', '2021-09-08 23:40:50', '2021-09-08 23:40:50'),
(70, 'secure_3rd_description', 'CHWG\'s advanced security features help enhance trust, transparency, compliance, and governance for the most security-conscious organizations.', '2021-09-08 23:40:51', '2021-09-08 23:40:51'),
(71, 'helpful_resource_2nd_heading', 'Awareness of Homeopathy', '2021-09-08 23:52:37', '2021-09-08 23:52:37'),
(72, 'secure_image', 'uploads/cms/box3bg.png', '2021-09-09 00:45:19', '2021-09-09 00:45:19'),
(73, 'helpful_resource_1st_thumbnail', 'uploads/cms/pimg1.jpg', '2021-09-09 00:52:15', '2021-09-09 00:52:15'),
(74, 'helpful_resource_2nd_thumbnail', 'uploads/cms/pimg2.jpg', '2021-09-09 00:52:15', '2021-09-09 00:52:15'),
(75, 'helpful_resource_3rd_thumbnail', 'uploads/cms/pimg3.jpg', '2021-09-09 00:52:15', '2021-09-09 00:52:15'),
(76, 'chwg_for_advocates_description', 'We are constructing a vast network for Canadian homeopaths and patients to connect through health', '2021-09-09 00:58:43', '2021-09-09 00:58:43'),
(77, 'chwg_for_advocates_icon', 'uploads/cms/advocates.png', '2021-09-09 00:59:12', '2021-09-09 00:59:12'),
(78, 'chwg_for_homeopaths_icon', 'uploads/cms/homeopathic.png', '2021-09-09 00:59:12', '2021-09-09 00:59:12'),
(79, 'terms_title', 'Terms and Conditions', '2021-09-09 01:26:35', '2021-09-09 01:26:35'),
(80, 'terms_description', 'Learn where we came from and what we are Innerself Homeopathy Wellness Group', '2021-09-09 01:26:35', '2021-09-09 01:26:35'),
(81, 'terms_body', '<p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\">Homeopathy means ‘same-suffering’ and is a system of medicine named 200 years ago by a German medical doctor who was tired of seeing the side-effects and long term damage of the human state through concentrated substances ingested as medicines.</p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\"></p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\">The substance that started his inquiry into the bad effects of concentrated substances on the human condition was Quinine. It was used for Malaria and could help for a limited time and not without long lasting damage. He went back to Chinchona Bark from the Rubiaceae family of plants (the same family as coffee) that was and is still used to make quinine. As he began chewing it, he realized that it could cause malaria like symptoms just by chewing it – as if the poison that can cure you of the problem, can also create the problem. So, he realized why using it would help – yet in large doses it poisoned. By creating minute amounts of the substances and preparing it in ways to induce a release of kinetic energy or resonance, this doctor was able to rediscover the fundamental laws of nature, one being that if something can kill you, chances are it can also cure you in the correct format and amount. That same cyanide in bamboo is what keeps the Panda alive and well. But it is not taken in concentrated doses, or in isolated doses, it is taken in the dose the Earth has synthesized. We too would remain healthy were we to live in nature as wild creatures.</p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\"></p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\">As civilized creatures, it is through dilution and specifically, through the homeopathic process of making our remedies, that we go back to being healthy. It is better over the long run to leave all healing up to the body using Earth’s processing of substances as our only guide. Homeopathy touches on a part of this process that reminds us to be careful of the chemical pure form of a single substance, and embrace the code in dilutions that no longer have the chemical form in it. Tea is a diluted form which is naturopathic, while, a homeopathic medicine is like a snowflake that has captured the code and when frozen can only make the original format of the code’s instruction.</p>', '2021-09-09 01:26:35', '2021-09-09 01:26:35'),
(82, 'terms_keywords', 'hello, there, yes', '2021-09-09 01:33:33', '2021-09-09 01:33:33'),
(83, 'pages_bottom_heading', 'Looking for more information? Join the CHWG Community.', '2021-09-09 01:36:52', '2021-09-09 01:37:52'),
(84, 'privacy_title', 'Privacy & Policy', '2021-09-09 01:50:54', '2021-09-09 01:50:54'),
(85, 'privacy_keywords', 'good, nature, beauty', '2021-09-09 01:50:54', '2021-09-09 01:50:54'),
(86, 'privacy_description', 'Learn where we came from and what we are Innerself Homeopathy Wellness Group', '2021-09-09 01:50:54', '2021-09-09 01:50:54'),
(87, 'privacy_body', '<p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\">Homeopathy means ‘same-suffering’ and is a system of medicine named 200 years ago by a German medical doctor who was tired of seeing the side-effects and long term damage of the human state through concentrated substances ingested as medicines.</p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\"></p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\">The substance that started his inquiry into the bad effects of concentrated substances on the human condition was Quinine. It was used for Malaria and could help for a limited time and not without long lasting damage. He went back to Chinchona Bark from the Rubiaceae family of plants (the same family as coffee) that was and is still used to make quinine. As he began chewing it, he realized that it could cause malaria like symptoms just by chewing it – as if the poison that can cure you of the problem, can also create the problem. So, he realized why using it would help – yet in large doses it poisoned. By creating minute amounts of the substances and preparing it in ways to induce a release of kinetic energy or resonance, this doctor was able to rediscover the fundamental laws of nature, one being that if something can kill you, chances are it can also cure you in the correct format and amount. That same cyanide in bamboo is what keeps the Panda alive and well. But it is not taken in concentrated doses, or in isolated doses, it is taken in the dose the Earth has synthesized. We too would remain healthy were we to live in nature as wild creatures.</p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\"></p><p style=\"color: rgb(77, 70, 65); font-family: Poppins, sans-serif; font-size: 18px; letter-spacing: normal;\">As civilized creatures, it is through dilution and specifically, through the homeopathic process of making our remedies, that we go back to being healthy. It is better over the long run to leave all healing up to the body using Earth’s processing of substances as our only guide. Homeopathy touches on a part of this process that reminds us to be careful of the chemical pure form of a single substance, and embrace the code in dilutions that no longer have the chemical form in it. Tea is a diluted form which is naturopathic, while, a homeopathic medicine is like a snowflake that has captured the code and when frozen can only make the original format of the code’s instruction.</p>', '2021-09-09 01:50:54', '2021-09-09 01:50:54'),
(88, 'homepage_title', 'Home', '2021-09-09 02:02:20', '2021-09-09 02:02:20'),
(89, 'homepage_description', 'CHWG joins a Community for Homeopathy newest solution, homeopathic Anywhere, to help accelerate businesses in real-time.', '2021-09-09 02:02:20', '2021-09-09 02:02:20'),
(90, 'homepage_keywords', 'homeo, chwg, medical', '2021-09-09 02:02:20', '2021-09-09 02:02:20'),
(91, 'mission_statemtnt_heading', 'To bring the awareness on Homeopathy for what it can truly bring to every single Canadian', '2021-09-09 02:31:48', '2021-09-09 02:31:48'),
(92, 'mission_stat_1st_heading', 'Connecting', '2021-09-09 02:31:48', '2021-09-09 02:31:48'),
(93, 'mission_stat_1st_description', 'Provide web solutions for homeopaths and their businesses while connecting users of Homeopathy with an appropriate health network.', '2021-09-09 02:31:48', '2021-09-09 02:31:48'),
(94, 'mission_stat_2nd_heading', 'Building', '2021-09-09 02:31:48', '2021-09-09 02:31:48'),
(95, 'mission_stat_2nd_description', 'Build programs that benefit our community; including further solutions for learning, experiencing, sharing and creating.', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(96, 'mission_stat_3rd_heading', 'Growing', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(97, 'mission_stat_3rd_description', 'Grow community reach and accessibility to the vast world of Homeopathy and its effective counterparts and affiliations.', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(98, 'mission_stat_4th_heading', 'Integrating', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(99, 'mission_stat_4th_description', 'Integrate successful community programs with existing bureaucratic Canadian systems.', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(100, 'mission_stat_5th_heading', 'Embettering', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(101, 'mission_stat_5th_description', 'Fund homeopathic centres for optimum accessibility to homeopathic services and practitioners.', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(102, 'mission_stat_6th_heading', 'Uniting', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(103, 'mission_stat_6th_description', 'Unite all systems of healthcare across Canada while keeping a patient-centred approach at the forefront.', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(104, 'vision_statemtnt_heading', '\"A Canada united on all healthcare fronts, that provides whole health services to Canadians\"', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(105, 'statement_users_count', '300', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(106, 'statement_users', 'Users of Homeopathy worldwide', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(107, 'statement_countries_count', '70', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(108, 'statement_countries', 'Using Homeopathy either alone or in combination with other medical systems', '2021-09-09 02:31:49', '2021-09-09 02:31:49'),
(109, 'mission_title', 'Our Mission', '2021-09-09 02:32:41', '2021-09-09 02:32:41'),
(110, 'mission_keywords', 'mission, ihwg', '2021-09-09 02:32:41', '2021-09-09 02:32:41'),
(111, 'mission_description', 'Learn where we came from and what we are about', '2021-09-09 02:32:41', '2021-09-09 02:32:41'),
(112, 'about_title', 'About us', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(113, 'about_keywords', 'about, chwg, medical', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(114, 'about_description', 'Learn where we came from and what we are Innerself Homeopathy Wellness Group', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(115, 'about_main_heading', '\"We are about providing solutions to a better, more connected future.\"', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(116, 'about_section_1st_heading', 'A solution for change', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(117, 'about_section_1st_desctiption', 'IHWG was born because of the shift that needs to be made to assist Homeopathy in Canada. As Canadians, we are aware of the enormous potential the country holds as a global leader. We believe that Canada can become a key facilitator in the shift to widen prospective health systems around the globe.', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(118, 'about_section_2nd_heading', 'Professionals sharing the same vision', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(119, 'about_section_2nd_desctiption', 'Our team of associates consist of field professionals who have both experience and passion. We are an international group of people and have living experiences from many different countries around the world - South Africa, Israel, Ukraine and Canada to name a few.', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(120, 'about_section_3rd_heading', 'Putting Homeopathy first', '2021-09-09 02:53:45', '2021-09-09 02:53:45'),
(121, 'about_section_3rd_desctiption', 'We understand that Homeopathy is not only a system of medicine, but a way of understanding true health. Because of this, Homeopathy is taking a leadership role as the driving force behind our ideas and implementations.', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(122, 'about_section_4th_heading', 'A big, and happy community', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(123, 'about_section_4th_desctiption', 'While there is publicly funded healthcare in Canada, there is lack of awareness towards the integration of reputable alternative healthcare into our medical systems. Together with our community, we are going to help.', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(124, 'about_bottom_section_heading', 'Work with us', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(125, 'about_bottom_section_description', 'We are welcoming associates who value what we are trying to achieve. Contact us if you would like to work with us be it partnership or service.', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(126, 'about_section_1st_thumbnail', 'uploads/cms/img5.webp', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(127, 'about_section_2nd_thumbnail', 'uploads/cms/img6.webp', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(128, 'about_section_3rd_thumbnail', 'uploads/cms/img7.webp', '2021-09-09 02:53:46', '2021-09-09 02:53:46'),
(129, 'about_section_4th_thumbnail', 'uploads/cms/img8.webp', '2021-09-09 02:53:47', '2021-09-09 02:53:47'),
(130, 'site_full_name', 'Canadian Homeopathy Wellness Group', '2021-09-09 02:57:10', '2021-09-09 02:57:10'),
(131, 'about_bottom_section_interested', 'Interested in working with us?', '2021-09-09 03:01:29', '2021-09-09 03:01:29'),
(132, 'advocates_title', 'IHWG for Advocates', '2021-09-09 04:42:47', '2021-09-09 04:42:47'),
(133, 'advocates_keywords', 'advocates, chwg, homeopaths', '2021-09-09 04:42:47', '2021-09-09 04:42:47'),
(134, 'advocates_description', 'Finally, a living, breathing directory that can provide a home for your clinic among a community that needs you.', '2021-09-09 04:42:47', '2021-09-09 04:42:47'),
(135, 'advocates_body_heading', 'A social platform that is built with Homeopathy at its forefront', '2021-09-09 04:42:47', '2021-09-09 04:42:47'),
(136, 'advocates_body_description', 'Finally, a community that is sheltered from scrutiny, censorship, and capitalistic agendas. Let IHWG be a health haven for you and your loved ones.', '2021-09-09 04:42:47', '2021-09-09 04:42:47'),
(137, 'advocates_banner_image', 'uploads/cms/ihwg-advocate.webp', '2021-09-09 04:42:47', '2021-09-09 04:46:37'),
(145, 'send_invitation_email', '{\"email_type\":\"send_invitation_email\",\"hello\":\"Hello,\",\"subject\":\"<b><u>Invitaion<\\/u><\\/b>\",\"first_part\":\"You have been invited by the\",\"second_part\":\"to join the IHWG Platform for homeopathy.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-09-23 02:21:19', '2021-10-14 17:43:47'),
(146, 'booking_confirmation_email', '{\"email_type\":\"booking_confirmation_email\",\"hello\":\"Hello Member,\",\"subject\":\"<b><u>Booking Confirmed<\\/u><\\/b>\",\"desc\":\"Welcome to  IHWG Platform. You have recently booked a service at our platform. Go to your Dashboard to check firther details about your booked appointment of service.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-09-23 02:58:33', '2021-10-14 17:38:22'),
(147, 'booking_completed_email', '{\"email_type\":\"booking_completed_email\",\"hello\":\"Hello,\",\"subject\":\"<div><br><\\/div><div><span style=\\\"color: rgb(44, 44, 44); font-size: 24.36px; letter-spacing: 0.14px; background-color: rgb(248, 248, 248);\\\">Booking Completed<\\/span><br><\\/div>\",\"first_part\":\"Welcome to IHWG Platform. Your Apoointment has been mark as completed. Click the Detail button below to check your appoitnment detail and prescription.\",\"second_part\":\"How was your experience with the pharmacy? Please rate us with your feedback. Its very important for future purposes. Click the Rate a Feedback button below to give rating.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-09-23 04:05:56', '2021-10-14 17:35:07'),
(148, 'register_advocate', '{\"email_type\":\"register_advocate\",\"hello\":\"Hello Advocacy Member,\",\"subject\":\"<p><b><u>Register Advocate<\\/u><\\/b><\\/p>\",\"desc\":\"Welcome to IHWG plateform. Your account at IHWG has been cteated. You can Login to your account with your correct credentials. Its free and always will be.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-09-23 04:16:09', '2021-10-13 20:19:52'),
(149, 'advocate_booking_email', '{\"email_type\":\"advocate_booking_email\",\"hello\":\"Hi ,\",\"subject\":\"<p><b><u>Booking Confirmation<\\/u><\\/b><\\/p>\",\"desc\":\"Welcome to IHWG Platform. You have recently booked a service at our platform. Go to your Dashboard to check firther details about your booked appointment of service.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-09-23 04:23:40', '2021-10-13 20:17:41'),
(150, 'verify_email', '{\"email_type\":\"verify_email\",\"hello\":\"Hello Member,\",\"subject\":\"<p><b><u>Verified<\\/u><\\/b><\\/p>\",\"desc\":\"Welcome to Platform. Your Profile has been Verified\",\"set_img\":null,\"image\":\"uploads\\/cms\\/1634130896-sig.jpeg\"}', '2021-09-23 04:46:06', '2021-10-13 20:14:56'),
(151, 'sub_admin_email', '{\"email_type\":\"sub_admin_email\",\"hello\":\"Hello Member,\",\"subject\":\"<b><u>Sub Admin<\\/u><\\/b>\",\"first_part\":\"Welcome to IHWG Platform. You have been assigned as a\",\"second_part\":\"of platform. Below are your details to get login to dashboard.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-09-23 05:13:38', '2021-10-13 20:06:03'),
(152, 'service_booking_alert', '{\"email_type\":\"service_booking_alert\",\"hello\":\"Hello,\",\"subject\":\"<p><b><u>Service Booking Alert<\\/u><\\/b><\\/p>\",\"first_part\":\"Dear\",\"second_part\":\"<p>Service is booked by you. This is an alert mail. There is no need of reply<\\/p>\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"uploads\\/cms\\/1634129794-sig.jpeg\"}', '2021-10-13 19:42:12', '2021-10-13 19:56:34'),
(153, 'zoom_meeting_email', '{\"email_type\":\"zoom_meeting_email\",\"hello\":\"Hello,\",\"subject\":\"<p><b><u>Zoom Meeting Link<\\/u><\\/b><\\/p>\",\"dear\":\"Dear\",\"first_part\":\"<p>Below is the link of zoom meeting.<\\/p>\",\"second_part\":\"Please click on it to join the meeting on required time.\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-10-13 20:26:05', '2021-10-13 20:26:05'),
(154, 'register_homeopath', '{\"email_type\":\"register_homeopath\",\"hello\":\"Hello,\",\"subject\":\"<p><span style=\\\"font-weight: bolder; letter-spacing: 0.14px;\\\"><u>Register Homeopath<\\/u><\\/span><br><\\/p>\",\"desc\":\"<span style=\\\"letter-spacing: 0.14px;\\\">Welcome to IHWG plateform. Your account at IHWG has been cteated. You can Login to your account with your correct credentials. Its free and always will be<\\/span>\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-10-14 17:33:58', '2021-10-14 17:34:13'),
(155, 'register_user', '{\"email_type\":\"register_user\",\"hello\":\"Hello,\",\"subject\":\"<span style=\\\"font-weight: bolder; letter-spacing: 0.14px;\\\"><u>Register User<\\/u><\\/span>\",\"desc\":\"<span style=\\\"letter-spacing: 0.14px;\\\">Welcome to IHWG plateform. Your account at IHWG has been cteated. You can Login to your account with your correct credentials. Its free and always will be.<\\/span>\",\"set_img\":null,\"team\":\"Thanks Team\",\"image\":\"\"}', '2021-10-14 17:40:42', '2021-10-14 17:40:42'),
(156, 'pdf', 'uploads/homeopath/documents/pdf/CHWG Update _16 (1).pdf', '2021-11-11 11:23:02', '2021-11-11 11:27:07'),
(157, 'helpful_resource_sub_heading', 'Explore our our helpful resources that will help you choosing a best medication as a homeopath.', '2021-12-06 10:41:21', '2021-12-06 10:43:12'),
(158, 'social-network-toast', 'Use the social platform to extend your business. Organize seminars, publish studies, and experience the community.', '2021-12-14 11:17:51', '2021-12-14 11:17:51'),
(159, 's', 'About us', '2021-12-14 11:17:51', '2021-12-14 11:17:51'),
(160, 'dashboard-toast', 'Your Dashboard is important, it contains important tools that help enhance your business.', '2021-12-14 11:32:45', '2021-12-14 11:32:45'),
(161, 'services-toast', 'Your clinic description is an important communication tool. Use it to leave a great impression of what makes your clinic unique.', '2021-12-14 11:43:23', '2021-12-15 05:26:34'),
(162, 'resources-toast', 'Your resource materials are important reading materials that can be accessed by your patients and profile visitors.', '2021-12-14 11:47:07', '2021-12-14 11:47:07'),
(163, 'get-more-badges-toast', 'Badges consist of specific honours and milestones you can acquire and/or achieve throughout your usage of the platform.', '2021-12-15 04:06:43', '2021-12-15 04:06:43'),
(164, 'calender-toast', 'Going on vacation? Need a week off? Use your calendar to set time periods you will be away.', '2021-12-15 04:13:10', '2021-12-15 04:13:10'),
(165, 'calendar-toast', 'Going on vacation? Need a week off? Use your calendar to set time periods you will be away.', '2021-12-15 04:14:47', '2021-12-15 04:14:47'),
(166, 'finance-toast', 'Check your financials on the finance tab. You have the ability to download your financial statements.', '2021-12-15 04:16:21', '2021-12-15 04:16:21'),
(167, 'zoom-toast', 'Plug-in your ZOOM Account to begin offering virtual services. Virtual services are a great way to provide flexibility to patients.', '2021-12-15 04:22:15', '2021-12-15 04:22:15'),
(168, 'register-homeopath-toast', 'Our platform only works with registered homeopaths. Make sure your registration is valid and in good standing.', '2021-12-15 04:56:22', '2021-12-15 04:56:22'),
(169, 'settings-toast', 'Remember to set your work hours in the settings tab. You can also use your calendar to edit your work schedule.', '2021-12-15 05:04:23', '2021-12-15 05:04:23'),
(170, 'themes-toast', 'Use themes to customize the banners your profile visitors see when booking your services.', '2021-12-15 05:15:56', '2021-12-15 05:15:56'),
(171, 'services-upload-avatar-toast', 'Customize the face of your service by uploading its avatar. Use images you already own or try copyright-free photography sites.', '2021-12-15 05:26:11', '2021-12-15 05:26:11'),
(172, 'client-description-toast', 'Your clinic description is an important communication tool. Use it to leave a great impression of what makes your clinic unique.', '2021-12-15 05:40:13', '2021-12-15 05:40:13'),
(173, 'feedback-toast', 'Have any concerns? Visit our feedback centre and let us know what we can improve. We always appreciate your feedback!', '2021-12-15 05:43:59', '2021-12-15 05:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `shop_brands`
--

CREATE TABLE `shop_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_brands`
--

INSERT INTO `shop_brands` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Lifebuoy', 'lifebuoy', '2021-08-27 07:40:59', '2021-08-27 07:40:59'),
(2, 'Uniliver', 'uniliver', '2021-08-27 07:41:08', '2021-08-27 07:41:08'),
(3, 'Certeza', 'certeza', '2021-09-02 00:22:32', '2021-09-02 00:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_categories`
--

INSERT INTO `shop_categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Hair', 'hair', '2021-08-27 07:40:29', '2021-08-27 07:40:29'),
(2, 'Soap', 'soap', '2021-08-27 07:40:36', '2021-08-27 07:40:36'),
(3, 'hair wex', 'hair-wex', '2021-08-27 07:40:44', '2021-08-27 07:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `shop_colors`
--

CREATE TABLE `shop_colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `color_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_colors`
--

INSERT INTO `shop_colors` (`id`, `title`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 'red', '#d60000', '2021-08-27 07:41:49', '2021-08-27 07:41:49'),
(2, 'blue', '#5900ff', '2021-08-27 07:42:00', '2021-08-27 07:42:00'),
(3, 'Green', '#027500', '2021-08-27 07:42:12', '2021-08-27 07:42:12');

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--

CREATE TABLE `shop_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','shipped','cancelled','completed','N/A') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_orders`
--

INSERT INTO `shop_orders` (`id`, `user_id`, `name`, `email`, `address_1`, `address_2`, `country`, `state`, `city`, `zip`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'john doe', 'user@gmail.com', 'Model Town', 'Street 3', 'Pakistan', 'Punjab', 'Lahore', '0234234', '34134234', 'shipped', '2021-09-02 02:12:03', '2021-09-10 03:26:46'),
(2, 5, NULL, 'user@gmail.com', 'Model Town', NULL, 'Pakistan', 'Punjab', 'Lahore', '123', '0900888', 'completed', '2021-09-02 02:15:39', '2022-08-30 15:15:50'),
(3, 5, NULL, 'user@gmail.com', 'Street 3', 'New Block of D Model', 'Pakistan', 'Punjab', 'Lahore', '123123', '090087642', 'completed', '2021-09-02 02:19:45', '2021-09-10 03:14:24'),
(4, 5, 'john doe', 'user@gmail.com', 'abc', 'def', 'Pakistan', 'Punjab', 'Ichra', '123123', '12312312312', 'cancelled', '2021-09-02 02:21:57', '2021-09-10 03:15:05'),
(5, 5, 'User', 'user@gmail.com', 'gyugyu', 'yugyugyu', 'uygy', 'yuggy', 'yugyu', '345678', '3456789', 'pending', '2021-10-11 19:33:21', '2021-10-11 19:33:21'),
(6, 11, 'M faisal', 'faisalhussainntu033@gmail.com', 'fsdsffdfdsfd', 'dfsdfsdfsdf', 'dsfddsffdsfds', 'dfsdfsdsffds', 'fdsdfsdfsfs', 'sdffdssdfdfs', '23456846854', 'pending', '2021-12-28 06:10:18', '2021-12-28 06:10:18'),
(7, 11, 'M faisal', 'faisalhussainntu033@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2021-12-28 06:31:57', '2021-12-28 06:31:57'),
(8, 11, 'M faisal', 'faisalhussainntu033@gmail.com', 'fsdsffdfdsfd', 'dfsdfsdfsdf', 'dfcghjbnk', 'jhkh', 'Shahkot', 'sdffdssdfdfs', '0308342432432', 'pending', '2021-12-28 11:54:11', '2021-12-28 11:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_products`
--

CREATE TABLE `shop_order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_order_id` bigint(20) UNSIGNED NOT NULL,
  `shop_product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_order_products`
--

INSERT INTO `shop_order_products` (`id`, `shop_order_id`, `shop_product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '1', '43', '2021-09-02 02:12:03', '2021-09-02 02:12:03'),
(2, 1, 1, '3', '35', '2021-09-02 02:12:03', '2021-09-02 02:12:03'),
(3, 1, 3, '5', '32', '2021-09-02 02:12:03', '2021-09-02 02:12:03'),
(4, 1, 2, '1', '32', '2021-09-02 02:12:03', '2021-09-02 02:12:03'),
(5, 2, 4, '1', '43', '2021-09-02 02:15:39', '2021-09-02 02:15:39'),
(6, 2, 3, '2', '32', '2021-09-02 02:15:39', '2021-09-02 02:15:39'),
(7, 3, 4, '2', '43', '2021-09-02 02:19:45', '2021-09-02 02:19:45'),
(8, 3, 3, '2', '32', '2021-09-02 02:19:45', '2021-09-02 02:19:45'),
(9, 3, 2, '2', '32', '2021-09-02 02:19:45', '2021-09-02 02:19:45'),
(10, 4, 4, '1', '43', '2021-09-02 02:21:57', '2021-09-02 02:21:57'),
(11, 5, 4, '1', '43', '2021-10-11 19:33:22', '2021-10-11 19:33:22'),
(12, 6, 4, '1', '43', '2021-12-28 06:10:19', '2021-12-28 06:10:19'),
(13, 6, 3, '1', '32', '2021-12-28 06:10:19', '2021-12-28 06:10:19'),
(14, 7, 5, '1', '25', '2021-12-28 06:31:57', '2021-12-28 06:31:57'),
(15, 8, 3, '1', '32', '2021-12-28 11:54:11', '2021-12-28 11:54:11'),
(16, 8, 4, '1', '43', '2021-12-28 11:54:11', '2021-12-28 11:54:11'),
(17, 8, 5, '1', '25', '2021-12-28 11:54:11', '2021-12-28 11:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shop_category_id` bigint(20) UNSIGNED NOT NULL,
  `shop_brand_id` bigint(20) UNSIGNED NOT NULL,
  `shop_color_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` double(8,2) DEFAULT '0.00',
  `thumbnail` varchar(255) NOT NULL DEFAULT 'uploads/products/default.png',
  `tags` text NOT NULL,
  `type` enum('Popular','New Arrival','Best Seller','Favorite','Discounted','Promoted','Top Rated','Other') NOT NULL DEFAULT 'Other',
  `status` enum('active','inactive','pending','In Stock','Out of Stock','N/A') NOT NULL DEFAULT 'active',
  `stock_quantity` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_products`
--

INSERT INTO `shop_products` (`id`, `shop_category_id`, `shop_brand_id`, `shop_color_id`, `shop_variant_id`, `title`, `slug`, `uuid`, `description`, `amount`, `thumbnail`, `tags`, `type`, `status`, `stock_quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 3, 'Lifebuoy Shampo', 'lifebuoy-shampo', '270821124313', 'Lifebuoy Shampo', 35.00, 'uploads/products/1630068193-banner-39.jpg', 'shampo, hair', 'Best Seller', 'active', 47, '2021-08-27 07:43:13', '2021-09-10 03:26:46'),
(2, 3, 2, 3, 3, 'New Soap of SM Factory', 'new-soap-of-sm-factory', '010921093349', 'New Soap of SM Factory', 32.00, 'uploads/products/1630488829-banner-28.jpg', 'new, arrival', 'New Arrival', 'active', 40, '2021-09-01 04:33:49', '2021-09-10 03:26:46'),
(3, 2, 3, 3, 3, 'Certeza Gl-110 Meter', 'certeza-gl-110-meter', '020921052331', 'Certeza Gl-110 Meter', 32.00, 'uploads/products/1630560374-banner-33.jpg', 'abc', 'Best Seller', 'active', 23, '2021-09-02 00:23:31', '2022-08-30 15:15:42'),
(4, 2, 3, 2, 2, 'Accu-Chek Active Glucose 50 Strips', 'accu-chek-active-glucose-50-strips', '020921052414', 'Accu-Chek Active Glucose 50 Strips', 43.00, 'uploads/products/1630560254-banner-37.jpg', 'xyz', 'New Arrival', 'active', 51, '2021-09-02 00:24:14', '2022-08-30 15:15:42'),
(5, 3, 3, 3, 3, 'new product', 'new-product', '281221112959', 'This is a new product and we are going to test', 25.00, 'uploads/products/1640676599-download-(13).jpg', 'new', 'New Arrival', 'active', 1000, '2021-12-28 06:29:59', '2021-12-28 06:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `shop_variants`
--

CREATE TABLE `shop_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shop_variants`
--

INSERT INTO `shop_variants` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, '10mg', '2021-08-27 07:41:28', '2021-08-27 07:41:28'),
(2, '20mg', '2021-08-27 07:41:34', '2021-08-27 07:41:34'),
(3, '30mg', '2021-08-27 07:41:39', '2021-08-27 07:41:39');

-- --------------------------------------------------------

--
-- Table structure for table `social_posts`
--

CREATE TABLE `social_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `caption` longtext,
  `media_type` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `desc` longtext,
  `post_type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_social_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'Public'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social_posts`
--

INSERT INTO `social_posts` (`id`, `uuid`, `caption`, `media_type`, `file`, `desc`, `post_type`, `created_at`, `updated_at`, `user_id`, `user_social_group_id`, `status`) VALUES
(1, NULL, 'Don\'t change anything to the above code, but we will insert the new config for our existing app in the new line. So, let\'s say I have a laravel project located in C:\\Users\\dendi\\codes\\simple-laravel-app. The configuration for the above project will be like this:', NULL, NULL, NULL, NULL, '2021-08-23 02:06:53', '2021-08-23 02:06:53', 5, NULL, 'Public'),
(2, NULL, 'Quibusdam autem iure quos qui et vero ullam enim nisi alias vel culpa nobis animi atque.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:02', '2021-08-23 04:09:02', 5, NULL, 'Public'),
(3, NULL, 'Molestias est nihil rem qui minima vero aut fuga ipsum voluptatem officiis sed ut rem voluptatum beatae quod.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:02', '2021-08-23 04:09:02', 5, NULL, 'Public'),
(4, NULL, 'Ut ut explicabo sunt illo explicabo qui fugiat minus velit.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:02', '2021-08-23 04:09:02', 5, NULL, 'Public'),
(5, NULL, 'Accusantium vitae et voluptas est amet totam quam nesciunt aut id.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:02', '2021-08-23 04:09:02', 5, NULL, 'Public'),
(6, NULL, 'Explicabo eos sint id et cupiditate consequatur iure cum at fugiat recusandae et eius sed voluptatem.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(7, NULL, 'Ut voluptas voluptatum harum quidem maiores excepturi eveniet distinctio occaecati esse voluptatem similique aut deleniti odio rerum quam.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(8, NULL, 'Delectus repudiandae est ab non cumque rerum sit quisquam quod.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(9, NULL, 'Dolores nisi amet porro accusamus deserunt vel autem blanditiis ut blanditiis sint sint perspiciatis et nihil qui quasi voluptas.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(10, NULL, 'Cumque eaque eaque et voluptate aut saepe tempora dolorem quia animi ea quis expedita ullam et architecto placeat culpa.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(11, NULL, 'Nihil modi ad voluptatum aperiam corporis et sunt nostrum minima tempora sed voluptatum voluptatum nesciunt similique quia quo.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(12, NULL, 'Ea doloremque in harum corrupti culpa incidunt porro beatae occaecati voluptatem voluptas soluta doloribus ad.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(13, NULL, 'Hic assumenda voluptatem in cumque beatae ea omnis enim et fugit est distinctio fuga aut laudantium quia veritatis neque.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(14, NULL, 'Temporibus blanditiis repellendus voluptatem et laudantium velit nihil reiciendis odit ea consequatur ratione.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(15, NULL, 'Porro corrupti neque quas cumque et aperiam sapiente in provident nisi.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(16, NULL, 'Sequi sit labore sed voluptas officia veritatis rerum autem est qui qui eos est et quia excepturi amet.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(17, NULL, 'Reprehenderit sit itaque quia ea quidem tenetur magnam ullam quia laborum aut ut nihil consequatur blanditiis sunt optio qui labore.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:03', '2021-08-23 04:09:03', 5, NULL, 'Public'),
(18, NULL, 'Repudiandae totam accusantium ut pariatur iure non qui est quae velit sit nemo velit ducimus.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:04', '2021-08-23 04:09:04', 5, NULL, 'Public'),
(19, NULL, 'Dolores maiores debitis sed deserunt culpa quibusdam maxime quos quae explicabo enim ut culpa sit error facilis et consequatur rerum.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:04', '2021-08-23 04:09:04', 5, NULL, 'Public'),
(20, NULL, 'Nemo ut reprehenderit vel quidem et corrupti modi quaerat et atque ipsa laudantium quae commodi.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:04', '2021-08-23 04:09:04', 5, NULL, 'Public'),
(21, NULL, 'Consequatur nihil maiores reiciendis aliquam quibusdam numquam odit sit laborum unde nisi.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:04', '2021-08-23 04:09:04', 5, NULL, 'Public'),
(22, NULL, 'At autem vel omnis harum asperiores quos blanditiis velit cumque sit.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:04', '2021-08-23 04:09:04', 5, NULL, 'Public'),
(23, NULL, 'Quia omnis quisquam tempora commodi ut quidem et aliquam dicta quibusdam animi porro architecto magnam veniam.', NULL, NULL, NULL, NULL, '2021-08-23 04:09:04', '2021-08-23 04:09:04', 5, NULL, 'Public'),
(25, NULL, 'My new bicycle\r\n#bicycle #new #purchase', 'photo', 'social_posts/file/1629720607-banner-16.jpg', NULL, NULL, '2021-08-23 07:10:07', '2021-08-23 07:10:07', 5, NULL, 'Public'),
(26, NULL, 'hello there how are uou \r\n#pakistan #nature #beauty', NULL, NULL, NULL, NULL, '2021-08-24 01:40:24', '2021-08-24 01:40:24', 5, NULL, 'Public'),
(29, NULL, 'new post from user', NULL, NULL, NULL, NULL, '2021-08-24 02:05:08', '2021-08-24 02:05:08', 5, NULL, 'Public'),
(30, NULL, 'lorem ipsim sit imit', NULL, NULL, NULL, NULL, '2021-08-24 02:05:40', '2021-08-24 02:05:40', 5, 3, 'Public'),
(33, '33', 'my new video', 'video', 'uploads/posts/User230821070213/1629797512-SampleVideo_1280x720_1mb.mp4', NULL, NULL, '2021-08-24 04:31:52', '2021-08-24 04:31:52', 5, NULL, 'Public'),
(34, '6124c845d520b', 'my new post is there', NULL, NULL, NULL, NULL, '2021-08-24 05:21:57', '2021-08-24 05:21:57', 5, NULL, 'Public'),
(35, '61262ce3928f3', 'hello there\r\n#lroem #ipsim', 'photo', 'uploads/posts/advocate1/1629897303-Amazon-Forest-wallpaper.jpg', NULL, NULL, '2021-08-25 06:43:31', '2021-08-25 08:15:03', 10, NULL, 'Public'),
(36, '61262d167f3ec', 'helllo', 'photo', 'uploads/posts/advocate1/1629891862-banner-2.jpg', NULL, NULL, '2021-08-25 06:44:22', '2021-08-25 08:09:49', 10, NULL, 'Public'),
(47, '61264437c2979', 'new post of car', 'photo', 'uploads/posts/advocate1/1629897783-202-2027896_jaguar-transparent-side-view-volvo-s60-side-view.png', NULL, NULL, '2021-08-25 08:23:03', '2021-08-25 08:23:03', 10, NULL, 'Public'),
(48, '612643d60470f', 'new post now\r\n#car #udpated #newCar #oper', 'photo', 'uploads/posts/advocate1/1629897755-495-4952480_black-audi-2019-buick-regal-black-hd-png.png', NULL, NULL, '2021-08-25 08:23:20', '2021-08-25 08:23:20', 10, NULL, 'Public'),
(49, '32', 'hello there how are you now a days updated', 'photo', NULL, NULL, NULL, '2021-08-25 08:32:05', '2021-08-25 08:32:05', 6, NULL, 'Public'),
(50, '31', 'My first and new post in homeo group tehere', 'photo', NULL, NULL, NULL, '2021-08-25 08:32:24', '2021-08-25 08:32:24', 6, NULL, 'Public'),
(51, '6126470982700', 'hello group memner updated', 'photo', 'uploads/posts/Homeopath230821070929/1629898532-Amazon-Forest-wallpaper.jpg', NULL, NULL, '2021-08-25 08:35:05', '2021-08-25 08:35:32', 6, 3, 'Public'),
(53, '6126476655d6d', 'thereee', NULL, NULL, NULL, NULL, '2021-08-25 08:36:38', '2021-08-25 08:36:38', 6, NULL, 'Public'),
(54, '61264a2c0afa9', 'nrewp post updated', 'photo', 'uploads/posts/Homeopath230821070929/1629899332-Amazon-Forest-wallpaper.jpg', NULL, NULL, '2021-08-25 08:48:28', '2021-08-25 08:48:52', 6, 3, 'Public'),
(55, '612794dfb775d', 'hello post new', 'video', 'uploads/posts/User230821070213/1629983967-SampleVideo_1280x720_1mb.mp4', NULL, NULL, '2021-08-26 08:19:27', '2021-08-26 08:19:27', 5, NULL, 'Public'),
(56, '614dc538b0f04', 'hello my new article', NULL, NULL, '<p>lorem ipsum sir&nbsp;<span style=\"letter-spacing: 0.14px; font-size: 1rem;\">lor<b>em ipsum sir</b></span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\"><b>lo</b>rem ipsum sir</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">lorem ipsum sir</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">lorem ipsum sir</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">lorem ipsum sir</span></p>', 'Articals', '2021-09-24 07:31:52', '2021-09-24 07:31:52', 6, NULL, 'Public'),
(57, '6166ad5e11bd7', 'this is resource title', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-13 16:56:46', '2021-10-13 16:56:46', 10, NULL, 'Public'),
(58, '6166ae0f9e58b', 'This is second Title of Resources', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-13 16:59:43', '2021-10-13 16:59:43', 10, NULL, 'Public'),
(59, '6166ae38684f9', 'Third Title of Resources', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-13 17:00:24', '2021-10-13 17:00:24', 10, NULL, 'Public'),
(60, '616faec3b33a2', 'NOTHING HAPPINING', 'photo', 'uploads/posts/Homeo260821011057/1634709187-download.jpg', NULL, 'News', '2021-10-20 12:53:07', '2021-10-20 12:53:07', 11, NULL, 'Public'),
(61, '616fddb7a1e3e', 'this is helping post', 'photo', 'uploads/posts/advocate1/1634721207-images.jpg', NULL, 'News', '2021-10-20 16:13:27', '2021-10-20 16:13:27', 10, NULL, 'Public'),
(62, '6170fc31bb71f', 'nothing else', 'photo', 'uploads/posts/homeo101270821111321/1634794545-WhatsApp-Image-2021-10-19-at-9.32.49-AM.jpeg', NULL, 'News', '2021-10-21 00:35:45', '2021-10-21 00:35:45', 12, NULL, 'Public'),
(63, '61711b79bdd35', 'This is a simple post', 'photo', 'uploads/posts/homeo102270821111436/1634802553-WhatsApp-Image-2021-10-19-at-9.32.49-AM.jpeg', NULL, 'News', '2021-10-21 02:49:13', '2021-10-21 02:49:13', 13, 3, 'Public'),
(64, '61711d7b8f70e', 'another', 'photo', 'uploads/posts/homeo102270821111436/1634803067-images.jpg', NULL, 'News', '2021-10-21 02:57:47', '2021-10-21 02:57:47', 13, NULL, 'Public'),
(65, '61711e5c3dbb4', 'this is another post is being edit again and gain', 'photo', 'uploads/posts/homeo102270821111436/1634803292-download.jpg', NULL, 'News', '2021-10-21 03:01:32', '2021-10-22 09:58:23', 13, 3, 'Public'),
(66, '61714ef042724', 'this is a post', 'photo', 'uploads/posts/homeo102270821111436/1634815728-images-(1).jpg', NULL, 'News', '2021-10-21 06:28:48', '2021-10-21 06:28:48', 13, 8, 'Public'),
(67, '61714f15bdb99', 'this is mot a edit post', 'photo', 'uploads/posts/homeo102270821111436/1634815765-download.jpg', NULL, 'News', '2021-10-21 06:29:25', '2021-10-21 06:29:25', 13, 8, 'Public'),
(68, '61791d4f15202', 'Here is a title', NULL, NULL, '<p><span style=\"letter-spacing: 0.14px;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">This is a description for resource.</span><br></p>', 'Resources', '2021-10-27 08:35:11', '2021-10-27 08:35:11', 10, NULL, 'Public'),
(69, '617ba2973eb79', 'What is lipsum', NULL, NULL, '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>', 'Resources', '2021-10-29 06:28:23', '2021-10-29 06:28:23', 11, NULL, 'Public'),
(70, '617ba2aceec87', 'what is lipsum?', NULL, 'uploads/posts/homeo102270821111436/1634803292-download.jpg', '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>', 'Resources', '2021-10-29 06:28:44', '2021-10-29 06:28:44', 11, NULL, 'Public'),
(71, '617bd9446d78b', 'Lipsum text', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-29 10:21:40', '2021-10-29 10:21:40', 10, NULL, 'Public'),
(72, '617bd953175d3', 'lipsum text', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-29 10:21:55', '2021-10-29 10:21:55', 10, NULL, 'Public'),
(73, '617bd969288bb', 'lipsum text', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-29 10:22:17', '2021-10-29 10:22:17', 10, NULL, 'Public'),
(74, '617bda37b045c', 'lipsum text 4', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</span><br></p>', 'Resources', '2021-10-29 10:25:43', '2021-10-29 10:25:43', 10, NULL, 'Public'),
(75, '618b5d3a0b336', 'Lipsum', 'photo', 'uploads/posts/ShanHomeo230821071332/1636523322-images-(7).jpg', NULL, 'News', '2021-11-10 04:48:42', '2021-11-10 04:48:42', 7, NULL, 'Public'),
(76, '618b5d6657296', 'we denounce with righteous', 'photo', 'uploads/posts/ShanHomeo230821071332/1636523366-download-(6).jpg', NULL, 'News', '2021-11-10 04:49:26', '2021-11-10 04:49:26', 7, NULL, 'Public'),
(77, '618b5d8582333', 'The wise man therefore always holds in these matters', 'photo', 'uploads/posts/ShanHomeo230821071332/1636523397-download-(5).jpg', NULL, 'News', '2021-11-10 04:49:57', '2021-11-10 04:49:57', 7, NULL, 'Public'),
(78, '618b5ddcb8f0c', 'The wise man therefore always holds in these matters', 'photo', 'uploads/posts/ShanHomeo230821071332/1636523484-images-(6).jpg', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment,</span><br></p>', 'Resources', '2021-11-10 04:51:24', '2021-11-10 04:51:24', 7, NULL, 'Public'),
(79, '618b5e0ee6a57', 'who are so beguiled and demoralized?', 'photo', 'uploads/posts/ShanHomeo230821071332/1636523534-download-(4).jpg', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment,</span><br></p>', 'Resources', '2021-11-10 04:52:14', '2021-11-10 04:52:14', 7, NULL, 'Public'),
(80, '618cbb9d3708d', 'here is a resource', NULL, 'uploads/posts/homeo102270821111436/1634803292-download.jpg', '<p><span style=\"letter-spacing: 0.14px;\">this is the description of a resourec</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">this is the description of a resourec</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">this is the description of a resourec</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">this is the description of a resourec</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">this is the description of a resourec</span><br></p>', 'Resources', '2021-11-11 05:43:41', '2021-11-11 05:43:41', 11, NULL, 'Public'),
(81, '618e59a97264c', 'my caption', 'photo', 'uploads/posts/Homeo260821011057/1636719017-download-(5).jpg', NULL, 'News', '2021-11-12 11:10:17', '2021-11-12 11:11:29', 11, NULL, 'Public'),
(82, '618e5a3cad117', 'hjewrjewhjr', 'photo', 'uploads/posts/Homeo260821011057/1636719164-images-(3).jpg', NULL, 'News', '2021-11-12 11:12:44', '2021-11-12 11:12:44', 11, NULL, 'Public'),
(83, '618e5aa8478f2', 'hjj', 'photo', 'uploads/posts/Homeo260821011057/1636719272-images-(5).jpg', '<p>hfjkfhrueriuigrehvfdjhv</p>', 'Resources', '2021-11-12 11:14:32', '2021-11-12 11:14:32', 11, NULL, 'Public'),
(84, '618e5ac25f833', 'jhgjhskjdf', 'photo', 'uploads/posts/Homeo260821011057/1636719298-images-(6).jpg', NULL, 'News', '2021-11-12 11:14:58', '2021-11-12 11:14:58', 11, NULL, 'Public'),
(85, '61aefd8f935d8', 'sdafdsadsadfasdf', 'photo', 'uploads/posts/homeopathslug071221095841/1638858127-tip2.PNG', NULL, 'News', '2021-12-07 05:22:07', '2021-12-07 05:22:07', 33, NULL, 'Public'),
(86, '61aefe1fed015', 'dsfdsafdsdfs', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</span><br></p>', 'Articals', '2021-12-07 05:24:31', '2021-12-07 05:24:31', 33, NULL, 'Public'),
(87, '61af124387c37', 'uyrtertye', 'photo', 'uploads/posts/homeopathslug071221095841/1638863427-screencapture-accounts-google-signin-v2-challenge-dp-2021-11-10-21_19_03.png', NULL, 'News', '2021-12-07 06:50:27', '2021-12-07 06:50:27', 33, NULL, 'Public'),
(88, '61af125879761', 'rtsyttys', 'photo', 'uploads/posts/homeopathslug071221095841/1638863448-tip4.PNG', NULL, 'News', '2021-12-07 06:50:48', '2021-12-07 06:50:48', 33, NULL, 'Public'),
(89, '61af134b80940', 'ertertre', 'photo', 'uploads/posts/homeopathslug071221095841/1638863691-download.png', NULL, 'News', '2021-12-07 06:54:51', '2021-12-07 06:54:51', 33, NULL, 'Public'),
(90, '61b9db20d4ba7', 'jhsdfgjsfgdbhjfdgsbh', NULL, NULL, NULL, 'News', '2021-12-15 11:10:08', '2021-12-15 11:10:08', 38, NULL, 'Public'),
(91, '61cbfb24942e8', 'gffdgfdg', 'photo', 'uploads/posts/Homeo260821011057/1640758052-logo.png', NULL, 'News', '2021-12-29 05:07:32', '2021-12-29 06:36:37', 11, NULL, 'Private'),
(92, '61cc06df57b2c', 'this is lipsum text', 'photo', 'uploads/posts/Homeo260821011057/1640761055-download-(13).jpg', NULL, 'News', '2021-12-29 05:57:35', '2021-12-30 06:16:49', 11, NULL, 'Private'),
(93, '61cd8298774bf', 'fddsdfdssfddfsdfs', NULL, NULL, 'fddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfsfddsdfdssfddfsdfs', 'Articals', '2021-12-30 08:57:44', '2021-12-30 08:58:45', 10, NULL, 'Public'),
(94, '61cd830195606', 'This is new one', NULL, NULL, 'dasadsdssdasdad', 'Articals', '2021-12-30 08:59:29', '2021-12-30 09:01:05', 10, NULL, 'Private'),
(95, '61cd83ddb42a9', 'What is! Why Article Rewriter?', NULL, NULL, '<h4 class=\"caption-paragraph\" style=\"font-family: Quicksand, sans-serif; letter-spacing: 0.14px;\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-size: 14px; color: rgb(51, 51, 51); font-family: Raleway, &quot;open sans&quot;, sans-serif; letter-spacing: normal; background-color: rgb(251, 251, 253);\">you are a blogger or content writer or SEO specialist, definitely looking for unique artistic content that focus your product or services as online identity. You know most of the Search engine looks unique content. To be in good state of the web world, you must have to ensure exorcism data in your site or blog, that attract your visitor to visit you regularly also it present acceptance to the search engine. As an online marketer you need content regular basis, but to write or create a brand new article concept and its composition is not an easy task!</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-size: 14px; color: rgb(51, 51, 51); font-family: Raleway, &quot;open sans&quot;, sans-serif; letter-spacing: normal; background-color: rgb(251, 251, 253);\">So, Millions of blogger, online marketer everybody wants to make his/her online presence up in the SE’s, but how! Its million dollar asking! Unique and quality content is the first priority to the marketer to be success in this web arena.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-size: 14px; color: rgb(51, 51, 51); font-family: Raleway, &quot;open sans&quot;, sans-serif; letter-spacing: normal; background-color: rgb(251, 251, 253);\">So what to do? Where you need fresh content always, your resolution is Article Rewriter or Paraphrasing Tool. It is also Article spinner tool that is free as well as easy to use. An article writer always thinks to generate something that has the quality and uniqueness as well as productive. The tool Article rewrite of seo wagon giving you the chance to meet your goal with less effort.</p></h4>', 'Articals', '2021-12-30 09:03:09', '2021-12-30 09:03:09', 44, NULL, 'Public'),
(96, '61cd864467531', 'This is a text that i am watch', NULL, NULL, '<h4 class=\"caption-paragraph\" style=\"font-family: Quicksand, sans-serif; letter-spacing: 0.14px;\">you are a blogger or content writer or SEO specialist, definitely looking for unique artistic content that focus your product or services as online identity. You know most of the Search engine looks unique content. To be in good state of the web world, you must have to ensure exorcism data in your site or blog, that attract your visitor to visit you regularly also it present acceptance to the search engine. As an online marketer you need content regular basis, but to write or create a brand new article concept and its composition is not an easy task!So, Millions of blogger, online marketer everybody wants to make his/her online presence up in the SE’s, but how! Its million dollar asking! Unique and quality content is the first priority to the marketer to be success in this web arena.So what to do? Where you need fresh content always, your resolution is Article Rewriter or Paraphrasing Tool. It is also Article spinner tool that is free as well as easy to use. An article writer always thinks to generate something that has the quality and uniqueness as well as productive. The tool Article rewrite of seo wagon giving you the chance to meet your goal with less effort.</h4>', 'Articals', '2021-12-30 09:13:24', '2021-12-30 09:15:04', 44, NULL, 'Private'),
(97, '61cda95c7fe9a', 'This is First Resource', NULL, NULL, '<p><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px; letter-spacing: normal;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo.&nbsp;</span><br></p>', 'Resources', '2021-12-30 11:43:08', '2021-12-30 11:43:08', 44, NULL, 'Public'),
(98, '61cda96f3ea25', 'This is 2nd one', NULL, NULL, '<p><span style=\"color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px; letter-spacing: normal;\">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo.&nbsp;</span><br></p>', 'Resources', '2021-12-30 11:43:27', '2021-12-30 11:43:27', 44, NULL, 'Public'),
(99, '61cda9925228f', 'Caption First', 'photo', 'uploads/posts/FaisalHussain161221085026/1640868242-rev-3.png', NULL, 'News', '2021-12-30 11:44:02', '2021-12-30 11:44:02', 44, NULL, 'Public'),
(100, '61cda9a3f2fbd', 'Caption 2nd', 'photo', 'uploads/posts/FaisalHussain161221085026/1640868259-download-(7).jpg', NULL, 'News', '2021-12-30 11:44:19', '2021-12-30 11:44:19', 44, NULL, 'Public'),
(101, '61ce9928e281f', '1', 'photo', 'uploads/posts/FaisalHussain161221085026/1640929576-medic_tutors.png', NULL, 'News', '2021-12-31 04:46:16', '2021-12-31 04:46:16', 44, NULL, 'Public'),
(102, '61ce9934d94b4', '2', 'photo', 'uploads/posts/FaisalHussain161221085026/1640929588-amining.png', NULL, 'News', '2021-12-31 04:46:28', '2021-12-31 04:46:28', 44, NULL, 'Public'),
(103, '61ce9951960d3', '3', 'photo', 'uploads/posts/FaisalHussain161221085026/1640929617-daily_thread.png', NULL, 'News', '2021-12-31 04:46:57', '2021-12-31 04:46:57', 44, NULL, 'Public'),
(104, '61ce995f16fd6', '4', 'photo', 'uploads/posts/FaisalHussain161221085026/1640929631-rev-3.png', NULL, 'News', '2021-12-31 04:47:11', '2021-12-31 04:47:11', 44, NULL, 'Public'),
(105, '61ce996cec0a6', '5', 'photo', 'uploads/posts/FaisalHussain161221085026/1640929644-6th.png', NULL, 'News', '2021-12-31 04:47:24', '2021-12-31 04:47:24', 44, NULL, 'Public'),
(106, '61ce99b24d2c2', 'Lorem Ipsum', NULL, NULL, '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">orem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; letter-spacing: normal; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br></p>', 'Articals', '2021-12-31 04:48:34', '2021-12-31 04:48:34', 44, NULL, 'Public'),
(107, '61ce99d8d0b7d', 'The End of Neoliberalism in Chile?', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Neutral Regular&quot;, Arial, Helvetica, sans-serif; font-size: 16px; letter-spacing: normal;\">In October 2019, the old Chile unexpectedly broke apart. An increase in the metro fare in Santiago sparked weeks of protests, led by high school students who called for riders to jump the turnstiles. As the protests escalated, the right-wing government of businessman Sebastián Piñera responded with disproportionate police force. Then, on October 18, in what would prove to be a fatal error, the government ordered the closure of all stations, leaving millions stranded in the streets. Within hours, the protests became massive. When night fell, barricades were erected in poor and middle-class neighborhoods. By the next morning, various metro stations on the outskirts of the capital were in flames. It was the violent beginning of what would soon be called the “Estallido Social”—the “Social Outburst”—or the “Chilean uprising” in English.</span><br></p>', 'Articals', '2021-12-31 04:49:12', '2021-12-31 04:49:12', 44, NULL, 'Public'),
(108, '61ce99fef14e6', 'Neoliberal Democracy', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Neutral Regular&quot;, Arial, Helvetica, sans-serif; font-size: 16px; letter-spacing: normal;\">Chile experienced relative calm for almost three decades after the transition to democracy. The first elected government in 1990, led by the Concertación de Partidos por la Democracia—the center-left coalition forged during the military dictatorship as a moderate opposition bloc—successfully displaced Augusto Pinochet and the military. After coming to power, many of the coalition’s economists, ideologues, and technocrats decided—whether out of conviction or fear—to maintain the central features of the economic order established under Pinochet. The history of this model is well-known: the so-called “Chicago Boys,” a group of neoclassical economists, convinced the dictatorship to reform the economy in favor of big business. Pinochet and the military implemented the rapid privatization of education, social security, and healthcare. By privatizing dozens of state businesses, they created a new</span><br></p>', 'Articals', '2021-12-31 04:49:50', '2021-12-31 04:49:50', 44, NULL, 'Public'),
(109, '61ce9a1ea57f7', 'The First Cracks', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Neutral Regular&quot;, Arial, Helvetica, sans-serif; font-size: 16px; letter-spacing: normal;\">While the parties of the left were divided, there were early signs of dissatisfaction with neoliberal democracy. Many younger people were disengaged from the political system. In the first decade of the twenty-first century, apathy turned into anger, especially among high school and university students in the privatized, class-segregated educational system. The Penguin Revolution (named after the colors of school uniforms) in 2006 was the first indication of a deeper disaffection. Hundreds of thousands marched in protest of school-related fees, and in favor of making a quality education available to all. The Concertación, then in its fourth consecutive term in office, still had the ability to defuse the conflict with minor reforms and a promise of future improvements.</span><br></p>', 'Articals', '2021-12-31 04:50:22', '2021-12-31 04:50:22', 44, NULL, 'Public'),
(110, '61ce9a4972b8a', 'The Constitutional Problem', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Neutral Regular&quot;, Arial, Helvetica, sans-serif; font-size: 16px; letter-spacing: normal;\">In the years leading up to the 2019 uprising, the goal of replacing the constitution began to circulate in popular movements. When the idea was first raised, however, during the student protests of 2011, it was mocked by the right and a good part of the Concertación. To its credit, Bachelet’s second government intended to begin a constituent process, but it lacked the political will to bring it to pass, and it fell apart alongside pension and education reforms. It was only as a result of the protests that the idea emerged as something possible and urgent.</span><br></p>', 'Resources', '2021-12-31 04:51:05', '2021-12-31 04:51:05', 44, NULL, 'Public'),
(111, '61ce9a5a9857d', 'The Left and the Constitutional Convention', NULL, NULL, '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Neutral Regular&quot;, Arial, Helvetica, sans-serif; font-size: 16px; letter-spacing: normal;\">How did the issue of constitutional transformation become so important? First, it has symbolic value, given that the constitution was a foundational project of the dictatorship and played an important role in the incomplete transition to democracy. But the constitution also presents serious problems for a functioning democracy, such as “organic laws” that regulate central aspects of the state and the economy and a Constitutional Tribunal made up of conservative judges, which blocks many of the reformist laws approved in Congress.</span><br></p>', 'Resources', '2021-12-31 04:51:22', '2021-12-31 04:51:22', 44, NULL, 'Public'),
(112, '61dd127e158bc', 'THis is new resource', 'photo', 'uploads/posts/Homeo260821011057/1641878142-5th.png', '<p><span style=\"letter-spacing: 0.14px;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><span style=\"letter-spacing: 0.14px; font-size: 1rem;\">Lipsum is a dummy text</span><br></p>', 'Resources', '2022-01-11 04:15:42', '2022-01-11 04:15:42', 11, NULL, 'Public');

-- --------------------------------------------------------

--
-- Table structure for table `social_post_comments`
--

CREATE TABLE `social_post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `social_post_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social_post_comments`
--

INSERT INTO `social_post_comments` (`id`, `user_id`, `social_post_id`, `parent_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 5, 23, NULL, 'hello there', '2021-08-23 06:19:07', '2021-08-23 06:19:07'),
(2, 5, 23, NULL, 'how are you', '2021-08-23 06:19:11', '2021-08-23 06:19:11'),
(3, 5, 23, NULL, 'fsafd', '2021-08-23 06:24:29', '2021-08-23 06:24:29'),
(4, 5, 23, NULL, 'fdsfasfdsf', '2021-08-23 06:24:36', '2021-08-23 06:24:36'),
(5, 5, 23, NULL, 'there are hou', '2021-08-23 06:25:19', '2021-08-23 06:25:19'),
(6, 5, 23, 5, 'therere', '2021-08-23 06:39:07', '2021-08-23 06:39:07'),
(7, 5, 23, 4, 'go', '2021-08-23 06:39:20', '2021-08-23 06:39:20'),
(8, 5, 23, 5, 'how are you', '2021-08-23 06:41:20', '2021-08-23 06:41:20'),
(9, 5, 23, 3, 'there there', '2021-08-23 06:41:28', '2021-08-23 06:41:28'),
(10, 5, 23, 8, '2345678', '2021-08-23 06:43:29', '2021-08-23 06:43:29'),
(11, 5, 23, 8, 'e4dr', '2021-08-23 06:43:45', '2021-08-23 06:43:45'),
(12, 5, 23, NULL, 'ytgy', '2021-08-23 06:44:01', '2021-08-23 06:44:01'),
(13, 5, 23, 1, 'jkjklklk', '2021-08-23 06:44:18', '2021-08-23 06:44:18'),
(14, 5, 23, 1, 'hkh hlkjh', '2021-08-23 06:44:31', '2021-08-23 06:44:31'),
(15, 5, 19, NULL, 'hello', '2021-08-23 06:58:38', '2021-08-23 06:58:38'),
(16, 5, 19, NULL, 'how r u', '2021-08-23 06:58:45', '2021-08-23 06:58:45'),
(17, 5, 19, 15, 'hi', '2021-08-23 06:58:49', '2021-08-23 06:58:49'),
(21, 5, 20, NULL, 'hello', '2021-08-23 07:02:23', '2021-08-23 07:02:23'),
(22, 5, 20, NULL, 'pak', '2021-08-23 07:02:27', '2021-08-23 07:02:27'),
(23, 5, 20, NULL, 'ywgqdfgd', '2021-08-23 07:02:41', '2021-08-23 07:02:41'),
(24, 5, 20, NULL, 'ok', '2021-08-23 07:02:47', '2021-08-23 07:02:47'),
(27, 5, 29, NULL, 'hello', '2021-08-24 04:08:11', '2021-08-24 04:08:11'),
(30, 5, 30, NULL, 'there', '2021-08-24 04:10:45', '2021-08-24 04:10:45'),
(31, 10, 54, NULL, 'kknjnjknjknmm,m,', '2021-10-20 17:09:56', '2021-10-20 17:09:56'),
(32, 10, 68, NULL, 'hello', '2021-10-27 08:36:43', '2021-10-27 08:36:43'),
(33, 10, 68, NULL, 'yes', '2021-10-27 08:36:49', '2021-10-27 08:36:49'),
(34, 10, 68, 33, 'hello here', '2021-10-27 11:43:26', '2021-10-27 11:43:26'),
(35, 10, 68, 33, 'hello', '2021-10-28 05:09:04', '2021-10-28 05:09:04'),
(48, 10, 61, 47, 'hjgsdhdsfhgdfs', '2021-11-09 11:57:34', '2021-11-09 11:57:34'),
(53, 10, 61, 50, 'hello g again', '2021-11-10 05:56:33', '2021-11-10 05:56:33'),
(56, 10, 61, 55, 'why not', '2021-11-10 05:57:01', '2021-11-10 05:57:01'),
(57, 10, 61, 55, 'hello', '2021-11-10 05:57:22', '2021-11-10 05:57:22'),
(58, 10, 61, 55, 'hello', '2021-11-10 05:57:26', '2021-11-10 05:57:26'),
(67, 11, 84, NULL, 'hello', '2021-11-19 05:04:47', '2021-11-19 05:04:47'),
(68, 12, 82, NULL, 'hello', '2021-11-19 05:06:36', '2021-11-19 05:06:36'),
(69, 12, 81, NULL, 'yes', '2021-11-19 05:06:43', '2021-11-19 05:06:43'),
(70, 12, 81, NULL, 'how r u?', '2021-11-19 05:06:48', '2021-11-19 05:06:48'),
(71, 12, 84, NULL, 'hello f', '2021-11-19 05:07:00', '2021-11-19 05:07:00'),
(72, 11, 84, NULL, 'hello yes', '2021-11-19 06:01:30', '2021-11-19 06:01:30'),
(77, 10, 61, NULL, 'i am here', '2021-11-24 08:59:51', '2021-11-24 08:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `social_post_likes`
--

CREATE TABLE `social_post_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `social_post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social_post_likes`
--

INSERT INTO `social_post_likes` (`id`, `user_id`, `social_post_id`, `created_at`, `updated_at`) VALUES
(2, '5', 23, '2021-08-24 00:52:22', '2021-08-24 00:52:22'),
(3, '5', 22, '2021-08-24 00:52:28', '2021-08-24 00:52:28'),
(4, '13', 65, '2021-10-21 05:47:40', '2021-10-21 05:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `social_post_tags`
--

CREATE TABLE `social_post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `social_post_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `status` enum('active','inactive','pending','closed','paused','N/A') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `social_post_tags`
--

INSERT INTO `social_post_tags` (`id`, `social_post_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 10, '#quigley', 'active', '2021-08-23 04:35:27', '2021-08-23 04:35:27'),
(2, 7, '#zboncak', 'active', '2021-08-23 04:35:27', '2021-08-23 04:35:27'),
(3, 15, '#ankunding', 'active', '2021-08-23 04:35:27', '2021-08-23 04:35:27'),
(4, 12, '#beahan', 'active', '2021-08-23 04:35:27', '2021-08-23 04:35:27'),
(5, 3, '#heaney', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(6, 1, '#rolfson', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(7, 11, '#hoeger', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(8, 5, '#tempora', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(9, 23, '#marvin', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(10, 14, '#rolfson', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(11, 11, '#macejkovic', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(12, 2, '#hammes', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(13, 23, '#stamm', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(14, 11, '#nemo', 'active', '2021-08-23 04:35:28', '2021-08-23 04:35:28'),
(16, 3, '#hermann', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(17, 17, '#wehner', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(18, 1, '#lindgren', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(19, 16, '#homeo', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(20, 7, '#dach', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(21, 17, '#eichmann', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(22, 2, '#homeopathic', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(23, 8, '#kovacek', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(24, 4, '#bailey', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(25, 22, '#emard', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(26, 12, '#tremblay', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(27, 5, '#schulist', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(28, 4, '#mosciski', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(29, 4, '#marquardt', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(30, 14, '#runte', 'active', '2021-08-23 04:35:29', '2021-08-23 04:35:29'),
(31, 10, '#denesik', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(32, 17, '#schneider', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(34, 5, '#quigley', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(35, 16, '#goldner', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(36, 12, '#sauer', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(37, 20, '#howell', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(39, 21, '#bashirian', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(40, 2, '#mante', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(41, 16, '#harvey', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(42, 14, '#rolfson', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(43, 13, '#schroeder', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(44, 23, '#schowalter', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(45, 18, '#schmeler', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(46, 1, '#kunze', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(47, 8, '#connelly', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(48, 13, '#cronin', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(49, 18, '#bauch', 'active', '2021-08-23 04:35:30', '2021-08-23 04:35:30'),
(50, 13, '#hodkiewicz', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(51, 9, '#cassin', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(52, 13, '#homeopathy', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(53, 19, '#kemmer', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(54, 23, '#murphy', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(55, 1, '#wyman', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(56, 18, '#stanton', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(57, 14, '#heidenreich', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(58, 10, '#kuhic', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(59, 8, '#heller', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(60, 14, '#casper', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(61, 7, '#kassulke', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(62, 21, '#gutkowski', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(63, 9, '#predovic', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(64, 12, '#schneider', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(65, 19, '#kerluke', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(66, 21, '#kautzer', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(67, 22, '#haag', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(68, 7, '#toy', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(69, 1, '#jones', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(70, 1, '#luettgen', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(71, 2, '#erdman', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(72, 5, '#greenholt', 'active', '2021-08-23 04:35:31', '2021-08-23 04:35:31'),
(73, 10, '#mclaughlin', 'active', '2021-08-23 04:35:32', '2021-08-23 04:35:32'),
(74, 15, '#kirlin', 'active', '2021-08-23 04:35:32', '2021-08-23 04:35:32'),
(76, 25, '#bicycle', 'active', '2021-08-23 07:10:08', '2021-08-23 07:10:08'),
(77, 25, '#new', 'active', '2021-08-23 07:10:08', '2021-08-23 07:10:08'),
(78, 25, '#purchase', 'active', '2021-08-23 07:10:08', '2021-08-23 07:10:08'),
(79, 26, '#pakistan', 'active', '2021-08-24 01:40:24', '2021-08-24 01:40:24'),
(80, 26, '#nature', 'active', '2021-08-24 01:40:24', '2021-08-24 01:40:24'),
(81, 26, '#beauty', 'active', '2021-08-24 01:40:24', '2021-08-24 01:40:24'),
(83, 35, '#lroem', 'active', '2021-08-25 08:15:03', '2021-08-25 08:15:03'),
(84, 35, '#ipsim', 'active', '2021-08-25 08:15:03', '2021-08-25 08:15:03'),
(102, 48, '#car', 'active', '2021-08-25 08:23:20', '2021-08-25 08:23:20'),
(103, 48, '#udpated', 'active', '2021-08-25 08:23:20', '2021-08-25 08:23:20'),
(104, 48, '#newCar', 'active', '2021-08-25 08:23:20', '2021-08-25 08:23:20'),
(105, 48, '#oper', 'active', '2021-08-25 08:23:20', '2021-08-25 08:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`id`, `user_id`, `day`, `is_closed`, `from`, `to`, `created_at`, `updated_at`) VALUES
(1, 11, 'Monday', 0, NULL, NULL, '2021-10-28 09:46:57', '2021-12-03 17:50:49'),
(2, 11, 'Tuesday', 0, NULL, NULL, '2021-10-28 09:47:15', '2021-12-27 07:14:19'),
(3, 11, 'Wednesday', 0, NULL, NULL, '2021-10-28 09:47:31', '2021-10-28 09:47:31'),
(4, 11, 'Thursday', 0, NULL, NULL, '2021-12-03 15:26:15', '2021-12-03 15:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` text,
  `user_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'uploads/users/default.png',
  `role` enum('admin','advocate','homeopath','user','other') NOT NULL DEFAULT 'advocate',
  `status` enum('active','inactive','pending','disabled','closed','on_hold') NOT NULL DEFAULT 'active',
  `is_socially_completed` tinyint(1) NOT NULL DEFAULT '0',
  `badge` varchar(255) NOT NULL DEFAULT '1',
  `zoom_access_token` text,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `zoom_email` varchar(255) DEFAULT NULL,
  `zip_code` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `slug`, `user_name`, `email`, `email_verified_at`, `password`, `phone`, `avatar`, `role`, `status`, `is_socially_completed`, `badge`, `zoom_access_token`, `remember_token`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `zoom_email`, `zip_code`) VALUES
(1, 'Admin', 'admin', 'Admin230821070213', 'info@deviotech.com', '2021-02-07 12:00:00', '$2y$10$xpQCJKXmXK7QYy6Zahf.2uIZA4nqyUBvW9Axmts185wPzmkaUwZ8e', NULL, 'uploads/users/default.png', 'admin', 'active', 0, '1', NULL, '96PYqq6Hv4bSUQ7JSxUMMyHhOpnvDTiI7cnPfAAz0ytVoPdUNB5nK5t0KU3Y', '2021-08-23 01:55:11', '2021-12-07 04:58:39', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Test Advocate', 'test-advocate', 'User23082107021', 'testadvocate1@gmail.com', '2021-02-07 12:00:00', '$2y$10$sxwicHXw4TNy/UKDJc/RVOpgpvCjJfBzgjtRLYSu0WjEGG.nI6d7u', NULL, 'uploads/users/default.png', 'advocate', 'active', 0, '1', NULL, NULL, '2021-08-23 01:55:11', '2021-12-07 04:58:39', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Test Homeopath', 'test-homeopath', 'User230821070212', 'testhomeopath1@gmail.com', '2021-02-07 12:00:00', '$2y$10$c3.F8Ie170hngWRdDdl7PerxPgRZNP59qEP5tRxfcpzgtN1qT5ifq', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-08-23 01:55:11', '2021-12-07 04:58:39', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Test User', 'test-user', 'User2308210702131', 'testuser1@gmail.com', '2021-02-07 12:00:00', '$2y$10$IckD9ofeuVdkOwQ6p5T4E.CDZxrpkNpG2PshUxciMZ3lBZX8eaMvm', NULL, 'uploads/users/default.png', 'user', 'active', 0, '1', NULL, NULL, '2021-08-23 01:55:11', '2021-12-07 04:58:39', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'User', 'user', 'User230821070213', 'user@gmail.com', '2021-12-14 09:34:35', '$2y$10$xpQCJKXmXK7QYy6Zahf.2uIZA4nqyUBvW9Axmts185wPzmkaUwZ8e', NULL, 'uploads/users/default.png', 'user', 'active', 1, '1', 'tl7Y5FrLSAqOFAZ6nfP_TQ', 'YZi52LECaAkMjPHLjItx28IdaYHEmJFUOhVd3BPum8Pp2iovPka6meWp0ncc', '2021-08-23 02:02:13', '2021-12-14 09:34:35', NULL, NULL, NULL, NULL, 'user@gmail.com', NULL),
(6, 'Homeopath', 'homeopath', 'Homeopath230821070929', 'hemeo@homeo.com', NULL, '$2y$10$1xi0bVd1OAtOOixi7mqZAOmj1VmYZOqXb5zul2J0zFSCUoYtkB3OC', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-08-23 02:09:29', '2021-12-07 04:58:39', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Shan Homeo', 'shan-homeo', 'ShanHomeo230821071332', 'shan@homeo.com', NULL, '$2y$10$tCgr4lfznmbufAYY5VrqjO670VFmCz0WVLzAoBRpbBLH3Eb24LrcK', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-08-23 02:13:32', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Test', 'test', 'Test240821043500', 'test@test.com', NULL, '$2y$10$kcA6OxiloMqai2G095s7oeadtMgFqId3bCMEWhBVo97lHNMbtcgeq', NULL, 'uploads/users/default.png', 'user', 'disabled', 1, '1', NULL, NULL, '2021-08-23 23:35:00', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'hello', 'hello', 'hello240821124006', 'hello@hello.com', NULL, '$2y$10$Zk0I3EcNhIh.2CbJAqfFl.lP5tXmUh4mkWKS0WITiREyA.vowPCtW', NULL, 'uploads/users/default.png', 'user', 'active', 0, '1', NULL, NULL, '2021-08-24 07:40:06', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Advocate', 'advocate', 'advocate1', 'advo@advo.com', '2021-12-14 09:31:26', '$2y$10$EQLnzYDgfE2ZZSKOHVPPSuQ3tJ3NPChXL2TwgxpU2c6vw0A1kO9Z2', '090079123', 'uploads/users/default.png', 'advocate', 'active', 1, '6', NULL, NULL, '2021-08-24 08:11:46', '2021-12-14 09:31:26', NULL, NULL, NULL, NULL, 'faisalhussainntu03@gmail.com', NULL),
(11, 'M faisal', 'm-faisal', 'Homeo260821011057', 'faisalhussainntu033@gmail.com', '2021-12-14 09:17:10', '$2y$10$TFPo5bYr1CCilShDs.iSn./vqkjBjeKvrKTWJn6nqypLqJ9Y5kJEC', '123456789', 'uploads/users/1636609379.jpg', 'homeopath', 'active', 1, '1', '2b9eju_tTLGaU9PBYeAI8Q', '3IGPPWxuICae5AdVZcbxjKoMioVPY62wiOdN7ntegiT6SgcgXy3Jy0ZtXkJV', '2021-08-26 08:10:57', '2021-12-28 04:10:53', NULL, NULL, NULL, NULL, 'faisalhussainntu03@gmail.com', NULL),
(12, 'homeo101', 'homeo101', 'homeo101270821111321', 'homeo101@gmail.com', NULL, '$2y$10$ipBLpmxhY.jKBxchgPBf3OAx4wJQscEvU1OWp0wwqE60Js1uBSRWi', NULL, 'uploads/users/default.png', 'user', 'active', 1, '1', NULL, NULL, '2021-08-27 06:13:22', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'homeo102', 'homeo102', 'homeo102270821111436', 'homeo102@gmail.com', NULL, '$2y$10$COam.4ECNgUHxutW9Cue6eoC192YR7ORMDtrio4BFlcSzucGTtQF2', NULL, 'uploads/users/default.png', 'user', 'active', 1, '1', NULL, NULL, '2021-08-27 06:14:36', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'homeo103', 'homeo103', 'homeo103270821111506', 'homeo103@gmail.com', NULL, '$2y$10$a2V9X1tPpH/FU6SoO230D.mIoqCUNpcT1kV2qRTGZA1XmRLwUUOPm', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-08-27 06:15:06', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'homeo104', 'homeo104', 'homeo104270821111614', 'homeo104@gmail.com', NULL, '$2y$10$XlpLkzxQP9BR/6m9ZO2ds.JE/sfnm8h6LfyWM.rxnT8SXIPzIzhxO', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-08-27 06:16:15', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'homeo105', 'homeo105', 'homeo105270821111649', 'homeo105@gmail.com', NULL, '$2y$10$cCXkusq9jVt68lPmxD3dhOgZIDgd7sHNd6h99BhhwJJ5seFMJjwDW', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-08-27 06:16:49', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'homeo106', 'homeo106', 'homeo106270821111724', 'homeo106@gmail.com', NULL, '$2y$10$mei57OrEGlW2OYiuPu54leP3snMoSbOM7ZrrBPKdT9Tr2MovxBBQu', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-08-27 06:17:24', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'developer', 'developer', 'developer090078601', 'dev@test.com', NULL, '$2y$10$J1vS/gEegxgTqPpmRFpclu9RRpz8seUjUbSxnkNanACJ0VQqhV1Ta', NULL, 'uploads/users/1630652347-selfie.jpg', 'user', 'disabled', 1, '1', NULL, NULL, '2021-09-03 01:11:34', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Homeopath', 'homeopath', 'Homeopath030921064037', 'dev@homeo.test', NULL, '$2y$10$XdIGsNbuulGjLDOPQGvYoO0P.XdkpnsJtIH0mj/BqPYGb/oVC132W', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-09-03 01:40:37', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Advocate', 'advocate', 'advocate', 'advo@dev.test', NULL, '$2y$10$yy3lF5mN/BO818shl2820enxoy1r3NPl/bfPVXItaO.yoPE5Tk1/G', '121', 'uploads/users/default.png', 'advocate', 'active', 1, '1', NULL, NULL, '2021-09-03 01:45:12', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'test', 'test', NULL, 'test@role.co', NULL, '$2y$10$0BGtz3BVzoKwGz4cSk.Ou.Mm8ONgA8pTK5zuK8SUIlQDdq4FGAHoi', NULL, 'uploads/users/default.png', 'admin', 'active', 0, '1', NULL, NULL, '2021-09-08 04:57:15', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Test Homeo', 'test-homeo', 'TestHomeo081021054437', 'testhomeo@test.test', NULL, '$2y$10$HCqeazdtp.EizdxwrDcyP.MhHQ12D/6jLjxTlR6AX0MzYVJMBYHee', '+1478963', 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-10-08 00:44:37', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'User', 'user', 'User081021055208', 'user@user.one', NULL, '$2y$10$wHcafTjUoztgDrAwczqdfefPcWPdxX1/EABW5M5mjNBSfNtMrnE0a', '+123456', 'uploads/users/default.png', 'user', 'active', 0, '1', NULL, NULL, '2021-10-08 00:52:09', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Homeo', 'homeo', 'Homeo081021055251', 'homeo@homeo.one', NULL, '$2y$10$kMAardNecbjN4uvdEAw38.WMLcCG7H8g/2G1lUHJaivIfpVRAKq8S', '+92587965', 'uploads/users/default.png', 'homeopath', 'active', 0, '4', NULL, NULL, '2021-10-08 00:52:51', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Dummy', 'dummy', 'Name', '5hassan-hassan-9g@domy.me', NULL, '$2y$10$qX/q2QstRyqsoLhJjrJ9keE2g.ufsbTsBjgrueXHe6QquPtGfoLUC', '12345678', 'uploads/users/default.png', 'advocate', 'active', 0, '1', NULL, NULL, '2021-10-29 04:21:07', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'Dummy', 'dummy', 'Advocate', 'hno_19@visieonl.com', NULL, '$2y$10$l5e4b9WVA4GYd8Rhgj8qeOkH9BPQi8Qbup8ICtbAiklFgM48gPuBO', '2345678', 'uploads/users/default.png', 'advocate', 'active', 0, '1', NULL, NULL, '2021-10-29 04:22:53', '2021-12-07 04:58:40', NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'Dummy', 'dummy', 'Advocate', 'edeenaw@ecallen.com', NULL, '$2y$10$ld2aIN7yFIgFcaqELy97j.PtgNadRSxHSMyIFzntkUzryOsEr5rx6', '3456789', 'uploads/users/default.png', 'advocate', 'active', 0, '1', NULL, NULL, '2021-10-29 04:25:55', '2021-12-07 04:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Dummy Homeopath', 'dummy-homeopath', 'DummyHomeopath091121022556', 'dummey@gmail.com', NULL, '$2y$10$EbkaSH/9CH7oQMJ6o6dPz.ht4zbiIWxonvw/lmNY4wNOlmPGiFY6e', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-11-09 09:25:57', '2021-12-07 04:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'Dummy homeopath', 'dummy-homeopath', 'Dummyhomeopath091121043057', 'dummeyhomeopath@gmail.com', NULL, '$2y$10$3vNtl6Uz2fT6/WCCoGSuO.yhQCHlRm30qYJSR20F21tPtcwvQuSZG', NULL, 'uploads/users/default.png', 'homeopath', 'disabled', 0, '1', NULL, NULL, '2021-11-09 11:30:57', '2021-12-07 04:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'abc homeopath', 'abc-homeopath', 'abchomeopath191121033000', 'abchomeopath@gmail.com', NULL, '$2y$10$1Lk4GKlL5d.W0a7KcDwINuWutfRXVoidZv/1c.14egOVR6mDNBqnu', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-11-19 10:30:01', '2021-12-07 04:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Dummy abc', 'dummy-abc', 'Dummyabc191121064759', 'dumy123@gmail.com', NULL, '$2y$10$mK8DUByIxH6TlESZ9uIQQuI65ZqtMqcLLG/bjvuq1TcQ7mVOfHMq.', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-11-19 13:47:59', '2021-12-07 04:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Dummy123', 'dummy123', 'Dummy123251121015115', 'dummy123@gmail.com', NULL, '$2y$10$ijDrV3oFZNSFOqXTTmF6R.fq.Oa/VCa1b05nnVpq9KFwwV1H8nWDK', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-11-25 08:51:15', '2021-12-07 04:58:41', NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'homeopath slug', 'homeopath-slug', 'homeopathslug071221095841', 'homeopathslug@gmail.com', '2021-12-16 03:59:07', '$2y$10$zhJ/kRmheFns0oPmCJku3e3UzhB4rUcjAuaWWkY9834etz6ggjJx.', NULL, 'uploads/users/default.png', 'homeopath', 'pending', 1, '1', NULL, NULL, '2021-12-07 04:58:41', '2021-12-16 03:59:07', NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'Dummy', 'dummy', 'Dummy151221094910', 'dummy121@gmail.com', NULL, '$2y$10$DGl.son7ZoRSep0YGMTlUeeFvv1.MqguzzNsI40CKZDskTGmlvUbi', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-12-15 04:49:11', '2021-12-15 04:49:11', NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'Dummy', 'dummy', 'Dummy151221110345', 'dummy122@gmail.com', '2021-12-15 06:09:46', '$2y$10$edc9HrdrsHsIAkQrafK7veEUiXlPiJgjmTG4vH2cnLaue.S11V.9G', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-12-15 06:03:46', '2021-12-15 06:09:46', NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'Dummy', 'dummy', 'dssad', 'admin2123212@admin.com', NULL, '$2y$10$AWu5q.CNrq59jCh1h7kRmefb6BgXmF4iAsD2VDTGAbQRXLYW0UAPS', '03087877047', 'uploads/users/default.png', 'advocate', 'active', 0, '1', NULL, NULL, '2021-12-15 08:08:08', '2021-12-15 08:08:08', NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Dummy', 'dummy', 'faisalhussainntu033@gmail.com', 'admin454343243@admin.com', NULL, '$2y$10$O9BhlIeaQHYgf7CLzs4Otu8b8rPICClE3nFWbtn0HadUwXiy2HaEq', '03087877047', 'uploads/users/default.png', 'advocate', 'active', 0, '1', NULL, NULL, '2021-12-15 08:49:18', '2021-12-15 08:49:18', NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Dummy', 'dummy', 'fgdsgfsddsg', 'faisalhussainntu024543@gmail.com', '2021-12-15 09:49:43', '$2y$10$/fKnGQzigrC1eFgGsVu/v.7d/41Nsp06UNnwX6qbX6F/Q2Ri7V17K', '12345678', 'uploads/users/default.png', 'advocate', 'active', 1, '1', NULL, NULL, '2021-12-15 09:48:12', '2021-12-15 11:09:44', NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Dummy', 'dummy', 'Dummy151221045241', 'faisalhussainntu0033@gmail.com', NULL, '$2y$10$cy43Clp71sq5hUrF9gf7T.Lkt8zzmEq7EmLNEhEV3tbW.dJoIdzP2', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-12-15 11:52:42', '2021-12-15 11:52:42', NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Dummy', 'dummy', 'Dummy151221045523', 'faisalhu1ssainntu033@gmail.com', '2021-12-16 03:57:28', '$2y$10$gGPdRnZY57tYAeAadl0Gwuoo/SQ.db3FVjLLV.GvfOuzfQ7t/kwKa', NULL, 'uploads/users/default.png', 'homeopath', 'pending', 0, '1', NULL, NULL, '2021-12-15 11:55:23', '2021-12-16 03:57:49', NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Dummy', 'dummy', 'Dummy151221045642', '1faisalhussainntu0033@gmail.com', '2021-12-15 11:59:03', '$2y$10$Dq9kCPsoNfq4I8NmddENnukkQ6pKQGI0IdN7wXl2xk4y.to6tsCWK', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-12-15 11:56:42', '2021-12-15 11:59:03', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Free wifi', 'free-wifi', 'Freewifi161221084248', 'tonerguy1@packiu.com', NULL, '$2y$10$jj51s6Op.XxBoT6yBAuFx.oCN27ktF6FAUct/jci3ebjjgXQ/vKUC', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-12-16 03:42:48', '2021-12-16 03:42:48', NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Faisal Hussain', 'faisal-hussain', 'FaisalHussain161221084517', 'magginito5916241@mrcaps.org', NULL, '$2y$10$/vWU2rUAsfd6up2hh8rfB.SsZc9/qb5GTmIKjl.m3XvxxiKIU2TMa', NULL, 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2021-12-16 03:45:18', '2021-12-16 03:45:18', NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Faisal Hussain', 'faisal-hussain', 'FaisalHussain161221085026', '8141959@tikaputri.art', '2021-12-16 03:51:01', '$2y$10$qMA2gACt7iyWM50Ap3xqgOTHt9WjFs5NZMdpUNLC7s5iTmrWtnZiu', NULL, 'uploads/users/default.png', 'homeopath', 'active', 1, '1', NULL, NULL, '2021-12-16 03:50:26', '2021-12-30 09:02:28', NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'clare', 'clare', 'clare070122034109', 'abchommeopath@gmail.com', NULL, '$2y$10$WVLZ1HnuIE4kJUPoG.lfs.YepCk9YXwLxdDXRb6tfopUpNlu8Fo4a', '0308342432432', 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2022-01-07 10:41:09', '2022-01-07 10:41:09', NULL, NULL, NULL, NULL, NULL, '54564654'),
(46, 'china', 'china', 'china070122034319', 'abchommmeopath@gmail.com', NULL, '$2y$10$WoXXNgSE/3BFK08ohAH.iORbxmwybPRQ2IQKYp2EnIw6eXg86bFqm', '12345678', 'uploads/users/default.png', 'user', 'active', 0, '1', NULL, NULL, '2022-01-07 10:43:19', '2022-01-07 10:43:19', NULL, NULL, NULL, NULL, NULL, '78'),
(47, 'clare', 'clare', 'clare070122034405', 'abchommmmeopath@gmail.com', NULL, '$2y$10$Bw/lkZxTzv9KBEgi45dIPe8lcKAtvXFy63QAyV5b2N43pqpY/PN1K', '84897489', 'uploads/users/default.png', 'user', 'active', 0, '1', NULL, NULL, '2022-01-07 10:44:06', '2022-01-07 10:44:06', NULL, NULL, NULL, NULL, NULL, '54564'),
(48, 'Australian Homeopath', 'australian-homeopath', 'AustralianHomeopath110122104134', 'australia@homeopath.com', '2022-01-11 05:43:02', '$2y$10$0LNZk1hlTz1lkM6xfNSS0OLZoi7M6dfD.iHM2ZBXFMxJ1iygtJXxm', '+55667788', 'uploads/users/default.png', 'homeopath', 'active', 0, '1', NULL, NULL, '2022-01-11 05:41:34', '2022-01-12 08:15:32', NULL, NULL, NULL, NULL, NULL, '54564');

-- --------------------------------------------------------

--
-- Table structure for table `user_social_albums`
--

CREATE TABLE `user_social_albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_social_albums`
--

INSERT INTO `user_social_albums` (`id`, `user_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(21, 11, 'Free wifi', NULL, '2021-12-29 09:29:25', '2021-12-29 09:29:25'),
(22, 11, 'Block', NULL, '2021-12-29 09:29:35', '2021-12-29 11:30:20'),
(23, 11, 'New York', NULL, '2021-12-29 09:29:46', '2021-12-29 11:30:31'),
(24, 10, 'waterford', NULL, '2021-12-30 07:47:00', '2021-12-30 07:47:00'),
(25, 10, 'Barca', NULL, '2021-12-30 07:47:16', '2021-12-30 07:47:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_social_groups`
--

CREATE TABLE `user_social_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `slug` text NOT NULL,
  `description` text NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'uploads/groups/default-group.png',
  `cover` varchar(255) NOT NULL DEFAULT 'uploads/groups/default-cover.png',
  `type` enum('public','private','protected','other') NOT NULL DEFAULT 'public',
  `status` enum('active','inactive','pending','closed','paused','N/A') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_social_groups`
--

INSERT INTO `user_social_groups` (`id`, `user_id`, `title`, `slug`, `description`, `avatar`, `cover`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Digital Marketing Agency', 'digital-marketing-agency-230821123741', 'This group is only for digital marketers', 'uploads/groups/1629722261-banner-32.jpg', 'uploads/groups/1629722261-banner-5.jpg', 'public', 'active', '2021-08-23 03:03:30', '2021-08-23 07:37:41'),
(2, 5, 'It Soft Solutions Limited', 'it-soft-solutions-limited-230821123646', 'It Soft Solutions is a new group for IT Experts Limited', 'uploads/groups/1629722200-banner-11.jpg', 'uploads/groups/1629722206-banner-7.jpg', 'public', 'active', '2021-08-23 03:04:32', '2021-08-23 07:36:46'),
(3, 5, 'Homeo Group', 'homeo-group-230821123836', 'Homeo Group is for homeopathic science', 'uploads/groups/1629722316-banner-22.jpg', 'uploads/groups/1629722316-banner-6.jpg', 'public', 'active', '2021-08-23 07:38:36', '2021-08-23 07:38:36'),
(4, 17, 'Laravel paginator', 'laravel-paginator-270821112322', 'Laravel paginator', 'uploads/groups/1630063402-banner-2.jpg', 'uploads/groups/1630063402-banner-7.jpg', 'public', 'active', '2021-08-27 06:23:22', '2021-08-27 06:23:22'),
(5, 17, 'Instant Pot Community', 'instant-pot-community-270821112843', 'Instant Pot Community', 'uploads/groups/1630063723-banner-22.jpg', 'uploads/groups/1630063723-banner-4.jpg', 'public', 'active', '2021-08-27 06:28:43', '2021-08-27 06:28:43'),
(6, 17, 'Motivational Quotes', 'motivational-quotes-270821112912', 'Motivational Quotes', 'uploads/groups/1630063752-banner-30.jpg', 'uploads/groups/1630063752-banner-11.jpg', 'public', 'active', '2021-08-27 06:29:12', '2021-08-27 06:29:12'),
(7, 17, 'Kersh Keepers Official Group', 'kersh-keepers-official-group-270821112933', 'Kersh Keepers Official Group', 'uploads/groups/1630063773-banner-23.jpg', 'uploads/groups/1630063773-banner-8.jpg', 'public', 'active', '2021-08-27 06:29:33', '2021-08-27 06:29:33'),
(8, 17, 'WWE MONDAY NIGHT RAW', 'wwe-monday-night-raw-270821112954', 'WWE MONDAY NIGHT RAW', 'uploads/groups/1630063794-banner-38.jpg', 'uploads/groups/1630063794-banner-14.jpg', 'public', 'active', '2021-08-27 06:29:54', '2021-08-27 06:29:54'),
(9, 17, 'Pantsuit Nation x Supermajority', 'pantsuit-nation-x-supermajority-270821113010', 'Pantsuit Nation x Supermajority', 'uploads/groups/1630063810-banner-33.jpg', 'uploads/groups/1630063810-banner-18.jpg', 'public', 'active', '2021-08-27 06:30:10', '2021-08-27 06:30:10'),
(10, 17, 'Maths Formulas', 'maths-formulas-270821113033', 'Maths Formulas', 'uploads/groups/1630063833-banner-21.jpg', 'uploads/groups/1630063833-banner-9.jpg', 'public', 'active', '2021-08-27 06:30:33', '2021-08-27 06:30:33'),
(11, 17, 'View from my window', 'view-from-my-window-270821113051', 'View from my window', 'uploads/groups/1630063851-banner-30.jpg', 'uploads/groups/1630063851-parallax-4.jpg', 'public', 'active', '2021-08-27 06:30:51', '2021-08-27 06:30:51'),
(12, 10, 'Advocate group', 'advocate-group-281021010958', 'abc', 'uploads/groups/1635412198-images-(1).jpg', 'uploads/groups/1635412198-download.jpg', 'public', 'active', '2021-10-28 08:09:58', '2021-10-28 08:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_social_profiles`
--

CREATE TABLE `user_social_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `about` longtext,
  `cover` varchar(255) NOT NULL DEFAULT 'uploads/users/social/default-cover.png',
  `website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_social_profiles`
--

INSERT INTO `user_social_profiles` (`id`, `user_id`, `location`, `latitude`, `longitude`, `caption`, `about`, `cover`, `website`, `created_at`, `updated_at`) VALUES
(1, 5, 'Las Vegas, NV, USA', '36.1699412', '-115.1398296', 'Homeopath Doctor House job from Dr. Hansman', 'Homeopath Doctor House job from Dr. Hansman a founder of Homeopathy', 'uploads/users/social/User230821070213/1629984318-banner-5.jpg', NULL, '2021-08-23 02:06:13', '2021-08-26 08:25:18'),
(2, 7, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-23 02:14:23', '2021-08-23 02:14:23'),
(3, 8, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-24 00:04:46', '2021-08-24 00:04:46'),
(4, 6, 'Lahore, Pakistan', '31.5203696', '74.35874729999999', 'Laravel Developer', 'Laravel Developer with Designing', 'uploads/users/social/1629789378-Amazon-Forest-wallpaper.jpg', 'www.google.com', '2021-08-24 02:11:08', '2021-08-24 02:16:18'),
(5, 10, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/1629980651-banner-6.jpg', NULL, '2021-08-25 06:42:14', '2021-08-26 07:24:11'),
(6, 11, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-26 08:12:21', '2021-08-26 08:12:21'),
(7, 12, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-27 06:13:58', '2021-08-27 06:13:58'),
(8, 13, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-27 06:14:46', '2021-08-27 06:14:46'),
(9, 14, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-27 06:15:16', '2021-08-27 06:15:16'),
(10, 15, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-27 06:16:27', '2021-08-27 06:16:27'),
(11, 16, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-27 06:17:04', '2021-08-27 06:17:04'),
(12, 17, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-08-27 06:20:50', '2021-08-27 06:20:50'),
(13, 20, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-09-03 01:51:21', '2021-09-03 01:51:21'),
(14, 18, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-09-03 01:59:09', '2021-09-03 01:59:09'),
(15, 33, 'fdsafdf, 26th Street, Taguig, Metro Manila, Philippines', '14.5479717', '121.0502573', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make', 'Lorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been theLorem Ipsum is simply dummy text of the printing and typesetting industr Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the', 'uploads/users/social/default-cover.png', 'https://www.google.com/', '2021-12-07 05:02:15', '2021-12-07 07:12:37'),
(16, 38, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-15 11:09:44', '2021-12-15 11:09:44'),
(17, 38, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-15 11:09:44', '2021-12-15 11:09:44'),
(18, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:25', '2021-12-30 09:02:25'),
(19, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:26', '2021-12-30 09:02:26'),
(20, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:26', '2021-12-30 09:02:26'),
(21, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:27', '2021-12-30 09:02:27'),
(22, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:27', '2021-12-30 09:02:27'),
(23, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:27', '2021-12-30 09:02:27'),
(24, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:27', '2021-12-30 09:02:27'),
(25, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:28', '2021-12-30 09:02:28'),
(26, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:28', '2021-12-30 09:02:28'),
(27, 44, NULL, NULL, NULL, NULL, NULL, 'uploads/users/social/default-cover.png', NULL, '2021-12-30 09:02:28', '2021-12-30 09:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `visitlogs`
--

CREATE TABLE `visitlogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `page_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitlogs`
--

INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-09-10 06:51:00', '2021-09-10 06:51:00'),
(2, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-09-10 06:51:47', '2021-09-10 06:51:47'),
(3, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'www.google.com', '2021-09-10 06:56:24', '2021-09-10 06:56:24'),
(4, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-10 06:57:19', '2021-09-10 06:57:19'),
(5, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-10 07:00:01', '2021-09-10 07:00:01'),
(6, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/about-us', '2021-09-10 07:00:05', '2021-09-10 07:00:05'),
(7, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/our-mission', '2021-09-10 07:00:59', '2021-09-10 07:00:59'),
(8, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-17 07:48:16', '2021-09-17 07:48:16'),
(9, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-17 07:49:04', '2021-09-17 07:49:04'),
(10, '127.0.0.1', 'Chrome (93.0.4577.63)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-17 07:55:15', '2021-09-17 07:55:15'),
(11, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:11:12', '2021-09-24 07:11:12'),
(12, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:21:21', '2021-09-24 07:21:21'),
(13, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:31:19', '2021-09-24 07:31:19'),
(14, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:31:54', '2021-09-24 07:31:54'),
(15, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:02', '2021-09-24 07:32:02'),
(16, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:09', '2021-09-24 07:32:09'),
(17, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:16', '2021-09-24 07:32:16'),
(18, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:21', '2021-09-24 07:32:21'),
(19, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:22', '2021-09-24 07:32:22'),
(20, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:26', '2021-09-24 07:32:26'),
(21, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:32:28', '2021-09-24 07:32:28'),
(22, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 07:42:19', '2021-09-24 07:42:19'),
(23, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/about-us', '2021-09-24 07:42:27', '2021-09-24 07:42:27'),
(24, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-24 08:36:03', '2021-09-24 08:36:03'),
(25, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-27 00:21:53', '2021-09-27 00:21:53'),
(26, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-27 00:24:00', '2021-09-27 00:24:00'),
(27, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-09-27 00:24:08', '2021-09-27 00:24:08'),
(28, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-09-27 00:24:20', '2021-09-27 00:24:20'),
(29, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:50:22', '2021-09-28 23:50:22'),
(30, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:56:21', '2021-09-28 23:56:21'),
(31, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:56:36', '2021-09-28 23:56:36'),
(32, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:56:43', '2021-09-28 23:56:43'),
(33, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:56:49', '2021-09-28 23:56:49'),
(34, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '4', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:57:38', '2021-09-28 23:57:38'),
(35, '127.0.0.1', 'Chrome (93.0.4577.82)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-09-28 23:57:42', '2021-09-28 23:57:42'),
(36, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:29:11', '2021-10-05 00:29:11'),
(37, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:30:47', '2021-10-05 00:30:47'),
(38, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:31:25', '2021-10-05 00:31:25'),
(39, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:31:49', '2021-10-05 00:31:49'),
(40, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:32:29', '2021-10-05 00:32:29'),
(41, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:32:42', '2021-10-05 00:32:42'),
(42, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:32:57', '2021-10-05 00:32:57'),
(43, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:34:47', '2021-10-05 00:34:47'),
(44, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:35:02', '2021-10-05 00:35:02'),
(45, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:35:26', '2021-10-05 00:35:26'),
(46, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:36:51', '2021-10-05 00:36:51'),
(47, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:37:54', '2021-10-05 00:37:54'),
(48, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:38:19', '2021-10-05 00:38:19'),
(49, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:38:48', '2021-10-05 00:38:48'),
(50, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:39:05', '2021-10-05 00:39:05'),
(51, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:39:30', '2021-10-05 00:39:30'),
(52, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:41:22', '2021-10-05 00:41:22'),
(53, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:41:33', '2021-10-05 00:41:33'),
(54, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:41:47', '2021-10-05 00:41:47'),
(55, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:42:17', '2021-10-05 00:42:17'),
(56, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:42:36', '2021-10-05 00:42:36'),
(57, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:43:19', '2021-10-05 00:43:19'),
(58, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 00:43:44', '2021-10-05 00:43:44'),
(59, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/advocates', '2021-10-05 00:44:29', '2021-10-05 00:44:29'),
(60, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/advocates', '2021-10-05 00:45:06', '2021-10-05 00:45:06'),
(61, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-05 00:45:09', '2021-10-05 00:45:09'),
(62, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-05 00:46:13', '2021-10-05 00:46:13'),
(63, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/advocates', '2021-10-05 00:46:58', '2021-10-05 00:46:58'),
(64, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/advocates', '2021-10-05 00:48:25', '2021-10-05 00:48:25'),
(65, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/advocates', '2021-10-05 00:48:40', '2021-10-05 00:48:40'),
(66, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 01:54:34', '2021-10-05 01:54:34'),
(67, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 02:09:56', '2021-10-05 02:09:56'),
(68, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 02:10:00', '2021-10-05 02:10:00'),
(69, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-05 02:18:45', '2021-10-05 02:18:45'),
(70, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 00:18:15', '2021-10-06 00:18:15'),
(71, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 01:22:17', '2021-10-06 01:22:17'),
(72, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/articles', '2021-10-06 01:22:22', '2021-10-06 01:22:22'),
(73, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 01:23:01', '2021-10-06 01:23:01'),
(74, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 02:40:28', '2021-10-06 02:40:28'),
(75, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 06:25:29', '2021-10-06 06:25:29'),
(76, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 06:25:40', '2021-10-06 06:25:40'),
(77, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 07:31:48', '2021-10-06 07:31:48'),
(78, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 07:31:51', '2021-10-06 07:31:51'),
(79, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 07:38:48', '2021-10-06 07:38:48'),
(80, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/ShanHomeo230821071332', '2021-10-06 07:39:13', '2021-10-06 07:39:13'),
(81, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:00:14', '2021-10-06 08:00:14'),
(82, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:00:32', '2021-10-06 08:00:32'),
(83, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:00:45', '2021-10-06 08:00:45'),
(84, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:01:26', '2021-10-06 08:01:26'),
(85, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:01:43', '2021-10-06 08:01:43'),
(86, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:01:59', '2021-10-06 08:01:59'),
(87, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:03:02', '2021-10-06 08:03:02'),
(88, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:03:39', '2021-10-06 08:03:39'),
(89, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:03:56', '2021-10-06 08:03:56'),
(90, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:04:06', '2021-10-06 08:04:06'),
(91, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:04:10', '2021-10-06 08:04:10'),
(92, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:04:14', '2021-10-06 08:04:14'),
(93, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:04:21', '2021-10-06 08:04:21'),
(94, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:04:34', '2021-10-06 08:04:34'),
(95, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:05:01', '2021-10-06 08:05:01'),
(96, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:05:28', '2021-10-06 08:05:28'),
(97, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:05:41', '2021-10-06 08:05:41'),
(98, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:05:45', '2021-10-06 08:05:45'),
(99, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:00', '2021-10-06 08:06:00'),
(100, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:03', '2021-10-06 08:06:03'),
(101, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:07', '2021-10-06 08:06:07'),
(102, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:10', '2021-10-06 08:06:10'),
(103, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:28', '2021-10-06 08:06:28'),
(104, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:36', '2021-10-06 08:06:36'),
(105, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:44', '2021-10-06 08:06:44'),
(106, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/Member/homeopath/Homeopath230821070929', '2021-10-06 08:06:48', '2021-10-06 08:06:48'),
(107, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/homeopath', '2021-10-06 08:07:37', '2021-10-06 08:07:37'),
(108, '127.0.0.1', 'Chrome (94.0.4606.61)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 08:12:52', '2021-10-06 08:12:52'),
(109, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:33:13', '2021-10-06 23:33:13'),
(110, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:49:51', '2021-10-06 23:49:51'),
(111, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:53:04', '2021-10-06 23:53:04'),
(112, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:53:15', '2021-10-06 23:53:15'),
(113, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:53:20', '2021-10-06 23:53:20'),
(114, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:53:36', '2021-10-06 23:53:36'),
(115, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:53:39', '2021-10-06 23:53:39'),
(116, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-06 23:53:45', '2021-10-06 23:53:45'),
(117, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-07 00:02:44', '2021-10-07 00:02:44'),
(118, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 00:37:38', '2021-10-08 00:37:38'),
(119, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 00:44:12', '2021-10-08 00:44:12'),
(120, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 00:52:34', '2021-10-08 00:52:34'),
(121, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 00:53:20', '2021-10-08 00:53:20'),
(122, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 01:12:24', '2021-10-08 01:12:24'),
(123, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 01:29:50', '2021-10-08 01:29:50'),
(124, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 01:52:50', '2021-10-08 01:52:50'),
(125, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/our-mission', '2021-10-08 01:52:53', '2021-10-08 01:52:53'),
(126, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '24', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test/about-us', '2021-10-08 01:52:57', '2021-10-08 01:52:57'),
(127, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 02:48:55', '2021-10-08 02:48:55'),
(128, '127.0.0.1', 'Chrome (94.0.4606.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'http://ihwg.test', '2021-10-08 05:02:27', '2021-10-08 05:02:27'),
(129, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:00:34', '2021-10-08 18:00:34'),
(130, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:22:31', '2021-10-08 18:22:31'),
(131, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:22:53', '2021-10-08 18:22:53'),
(132, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:23:11', '2021-10-08 18:23:11'),
(133, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:23:27', '2021-10-08 18:23:27'),
(134, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:23:38', '2021-10-08 18:23:38'),
(135, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-08 18:24:47', '2021-10-08 18:24:47'),
(136, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 11:36:16', '2021-10-11 11:36:16'),
(137, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 11:36:16', '2021-10-11 11:36:16'),
(138, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 11:57:47', '2021-10-11 11:57:47'),
(139, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 11:57:47', '2021-10-11 11:57:47'),
(140, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 12:15:46', '2021-10-11 12:15:46'),
(141, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 13:51:33', '2021-10-11 13:51:33'),
(142, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 14:43:27', '2021-10-11 14:43:27'),
(143, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:09:38', '2021-10-11 18:09:38'),
(144, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:09:45', '2021-10-11 18:09:45'),
(145, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:12:08', '2021-10-11 18:12:08'),
(146, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:13:06', '2021-10-11 18:13:06'),
(147, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:13:14', '2021-10-11 18:13:14'),
(148, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:13:35', '2021-10-11 18:13:35'),
(149, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:48:30', '2021-10-11 18:48:30'),
(150, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:48:34', '2021-10-11 18:48:34'),
(151, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:48:45', '2021-10-11 18:48:45'),
(152, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:48:58', '2021-10-11 18:48:58'),
(153, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:55:35', '2021-10-11 18:55:35'),
(154, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:55:41', '2021-10-11 18:55:41'),
(155, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 18:55:51', '2021-10-11 18:55:51'),
(156, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:00:08', '2021-10-11 19:00:08'),
(157, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:03:36', '2021-10-11 19:03:36'),
(158, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:03:39', '2021-10-11 19:03:39'),
(159, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:03:47', '2021-10-11 19:03:47'),
(160, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:04:27', '2021-10-11 19:04:27'),
(161, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:04:30', '2021-10-11 19:04:30'),
(162, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:04:38', '2021-10-11 19:04:38'),
(163, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:04:41', '2021-10-11 19:04:41'),
(164, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:04:48', '2021-10-11 19:04:48'),
(165, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:07:57', '2021-10-11 19:07:57'),
(166, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:08:06', '2021-10-11 19:08:06'),
(167, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:08:09', '2021-10-11 19:08:09'),
(168, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:08:16', '2021-10-11 19:08:16'),
(169, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:09:22', '2021-10-11 19:09:22'),
(170, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:09:51', '2021-10-11 19:09:51'),
(171, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:09:55', '2021-10-11 19:09:55'),
(172, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:10:02', '2021-10-11 19:10:02'),
(173, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:13:15', '2021-10-11 19:13:15'),
(174, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:13:18', '2021-10-11 19:13:18'),
(175, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:13:25', '2021-10-11 19:13:25'),
(176, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:14:25', '2021-10-11 19:14:25'),
(177, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:14:45', '2021-10-11 19:14:45'),
(178, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:14:48', '2021-10-11 19:14:48'),
(179, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '12', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:14:56', '2021-10-11 19:14:56'),
(180, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:17:36', '2021-10-11 19:17:36'),
(181, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:17:53', '2021-10-11 19:17:53'),
(182, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:17:56', '2021-10-11 19:17:56'),
(183, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:18:03', '2021-10-11 19:18:03'),
(184, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:31:10', '2021-10-11 19:31:10'),
(185, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:31:49', '2021-10-11 19:31:49'),
(186, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:31:59', '2021-10-11 19:31:59'),
(187, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:01', '2021-10-11 19:32:01'),
(188, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:01', '2021-10-11 19:32:01'),
(189, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:02', '2021-10-11 19:32:02'),
(190, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:05', '2021-10-11 19:32:05'),
(191, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:09', '2021-10-11 19:32:09'),
(192, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:17', '2021-10-11 19:32:17'),
(193, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:32:32', '2021-10-11 19:32:32'),
(194, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:33:20', '2021-10-11 19:33:20'),
(195, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:33:22', '2021-10-11 19:33:22'),
(196, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:33:34', '2021-10-11 19:33:34'),
(197, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:33:43', '2021-10-11 19:33:43'),
(198, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-11 19:37:56', '2021-10-11 19:37:56'),
(199, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:15:49', '2021-10-12 11:15:49'),
(200, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:15:49', '2021-10-12 11:15:49'),
(201, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:19:30', '2021-10-12 11:19:30'),
(202, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:23:05', '2021-10-12 11:23:05'),
(203, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:36:02', '2021-10-12 11:36:02'),
(204, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:38:49', '2021-10-12 11:38:49'),
(205, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 11:44:29', '2021-10-12 11:44:29'),
(206, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:08:22', '2021-10-12 13:08:22'),
(207, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:29:51', '2021-10-12 13:29:51'),
(208, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:30:23', '2021-10-12 13:30:23'),
(209, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:30:39', '2021-10-12 13:30:39'),
(210, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:32:08', '2021-10-12 13:32:08'),
(211, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:32:22', '2021-10-12 13:32:22'),
(212, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:32:52', '2021-10-12 13:32:52'),
(213, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:33:17', '2021-10-12 13:33:17'),
(214, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:34:26', '2021-10-12 13:34:26'),
(215, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 13:55:22', '2021-10-12 13:55:22'),
(216, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 14:09:21', '2021-10-12 14:09:21'),
(217, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 17:35:35', '2021-10-12 17:35:35'),
(218, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 17:35:35', '2021-10-12 17:35:35'),
(219, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 17:35:46', '2021-10-12 17:35:46'),
(220, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-12 17:35:51', '2021-10-12 17:35:51'),
(221, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 12:50:02', '2021-10-13 12:50:02'),
(222, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 12:50:02', '2021-10-13 12:50:02'),
(223, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:03:11', '2021-10-13 13:03:11'),
(224, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:08:39', '2021-10-13 13:08:39'),
(225, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:10:37', '2021-10-13 13:10:37'),
(226, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:10:44', '2021-10-13 13:10:44'),
(227, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:30:24', '2021-10-13 13:30:24'),
(228, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:31:09', '2021-10-13 13:31:09'),
(229, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 13:33:35', '2021-10-13 13:33:35'),
(230, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 14:17:07', '2021-10-13 14:17:07'),
(231, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 15:07:03', '2021-10-13 15:07:03'),
(232, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 15:07:07', '2021-10-13 15:07:07'),
(233, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 15:10:08', '2021-10-13 15:10:08'),
(234, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 15:10:16', '2021-10-13 15:10:16'),
(235, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 15:11:23', '2021-10-13 15:11:23'),
(236, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 15:55:13', '2021-10-13 15:55:13'),
(237, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 16:27:34', '2021-10-13 16:27:34'),
(238, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 16:28:24', '2021-10-13 16:28:24'),
(239, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 16:28:28', '2021-10-13 16:28:28'),
(240, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 17:06:02', '2021-10-13 17:06:02'),
(241, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '6', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 17:07:25', '2021-10-13 17:07:25'),
(242, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 17:07:50', '2021-10-13 17:07:50'),
(243, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 17:10:08', '2021-10-13 17:10:08'),
(244, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 17:10:27', '2021-10-13 17:10:27'),
(245, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 17:11:24', '2021-10-13 17:11:24'),
(246, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:27:51', '2021-10-13 19:27:51'),
(247, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:37:00', '2021-10-13 19:37:00'),
(248, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:37:33', '2021-10-13 19:37:33'),
(249, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:38:48', '2021-10-13 19:38:48'),
(250, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:39:41', '2021-10-13 19:39:41'),
(251, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:40:50', '2021-10-13 19:40:50'),
(252, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:42:14', '2021-10-13 19:42:14'),
(253, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:43:07', '2021-10-13 19:43:07'),
(254, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:44:59', '2021-10-13 19:44:59'),
(255, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:45:20', '2021-10-13 19:45:20'),
(256, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:45:30', '2021-10-13 19:45:30'),
(257, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:46:42', '2021-10-13 19:46:42'),
(258, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:47:02', '2021-10-13 19:47:02'),
(259, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:47:31', '2021-10-13 19:47:31'),
(260, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:48:02', '2021-10-13 19:48:02'),
(261, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:51:52', '2021-10-13 19:51:52'),
(262, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:53:48', '2021-10-13 19:53:48'),
(263, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:54:03', '2021-10-13 19:54:03'),
(264, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:54:52', '2021-10-13 19:54:52'),
(265, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:55:04', '2021-10-13 19:55:04'),
(266, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 19:55:08', '2021-10-13 19:55:08'),
(267, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 20:04:15', '2021-10-13 20:04:15'),
(268, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 20:05:35', '2021-10-13 20:05:35'),
(269, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 20:06:05', '2021-10-13 20:06:05'),
(270, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 20:12:51', '2021-10-13 20:12:51'),
(271, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 20:13:23', '2021-10-13 20:13:23'),
(272, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-13 20:16:54', '2021-10-13 20:16:54'),
(273, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-14 13:34:13', '2021-10-14 13:34:13'),
(274, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-14 17:28:41', '2021-10-14 17:28:41'),
(275, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-14 17:29:25', '2021-10-14 17:29:25'),
(276, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-14 18:36:57', '2021-10-14 18:36:57'),
(277, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-14 19:24:57', '2021-10-14 19:24:57'),
(278, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-14 20:27:11', '2021-10-14 20:27:11'),
(279, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 17:46:06', '2021-10-18 17:46:06'),
(280, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 17:46:06', '2021-10-18 17:46:06'),
(281, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 17:49:23', '2021-10-18 17:49:23');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(282, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 17:53:07', '2021-10-18 17:53:07'),
(283, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 17:54:30', '2021-10-18 17:54:30'),
(284, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 18:47:48', '2021-10-18 18:47:48'),
(285, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 18:47:48', '2021-10-18 18:47:48'),
(286, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 19:12:44', '2021-10-18 19:12:44'),
(287, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-18 19:13:15', '2021-10-18 19:13:15'),
(288, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 11:28:58', '2021-10-20 11:28:58'),
(289, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 11:28:58', '2021-10-20 11:28:58'),
(290, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 11:52:32', '2021-10-20 11:52:32'),
(291, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:15:12', '2021-10-20 12:15:12'),
(292, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:15:50', '2021-10-20 12:15:50'),
(293, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:18:11', '2021-10-20 12:18:11'),
(294, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:50:39', '2021-10-20 12:50:39'),
(295, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:50:39', '2021-10-20 12:50:39'),
(296, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:50:44', '2021-10-20 12:50:44'),
(297, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 12:51:04', '2021-10-20 12:51:04'),
(298, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 14:37:24', '2021-10-20 14:37:24'),
(299, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 14:39:41', '2021-10-20 14:39:41'),
(300, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 14:39:48', '2021-10-20 14:39:48'),
(301, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 14:39:57', '2021-10-20 14:39:57'),
(302, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 15:12:40', '2021-10-20 15:12:40'),
(303, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 15:12:50', '2021-10-20 15:12:50'),
(304, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 15:13:37', '2021-10-20 15:13:37'),
(305, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 15:14:56', '2021-10-20 15:14:56'),
(306, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 15:21:55', '2021-10-20 15:21:55'),
(307, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:12:07', '2021-10-20 16:12:07'),
(308, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:16:46', '2021-10-20 16:16:46'),
(309, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:17:28', '2021-10-20 16:17:28'),
(310, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:17:52', '2021-10-20 16:17:52'),
(311, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:18:31', '2021-10-20 16:18:31'),
(312, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:18:42', '2021-10-20 16:18:42'),
(313, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:18:55', '2021-10-20 16:18:55'),
(314, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:19:01', '2021-10-20 16:19:01'),
(315, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:19:54', '2021-10-20 16:19:54'),
(316, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:20:29', '2021-10-20 16:20:29'),
(317, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:22:56', '2021-10-20 16:22:56'),
(318, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:25:57', '2021-10-20 16:25:57'),
(319, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:26:56', '2021-10-20 16:26:56'),
(320, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:31:08', '2021-10-20 16:31:08'),
(321, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:31:30', '2021-10-20 16:31:30'),
(322, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:31:47', '2021-10-20 16:31:47'),
(323, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:31:59', '2021-10-20 16:31:59'),
(324, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:32:07', '2021-10-20 16:32:07'),
(325, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:32:42', '2021-10-20 16:32:42'),
(326, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:33:22', '2021-10-20 16:33:22'),
(327, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:34:31', '2021-10-20 16:34:31'),
(328, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:36:48', '2021-10-20 16:36:48'),
(329, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:36:52', '2021-10-20 16:36:52'),
(330, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:37:01', '2021-10-20 16:37:01'),
(331, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:37:55', '2021-10-20 16:37:55'),
(332, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:38:07', '2021-10-20 16:38:07'),
(333, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:38:21', '2021-10-20 16:38:21'),
(334, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 16:56:50', '2021-10-20 16:56:50'),
(335, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:11:30', '2021-10-20 17:11:30'),
(336, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:40:35', '2021-10-20 17:40:35'),
(337, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:40:47', '2021-10-20 17:40:47'),
(338, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:41:30', '2021-10-20 17:41:30'),
(339, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:41:49', '2021-10-20 17:41:49'),
(340, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:42:05', '2021-10-20 17:42:05'),
(341, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:42:26', '2021-10-20 17:42:26'),
(342, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:43:36', '2021-10-20 17:43:36'),
(343, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:44:29', '2021-10-20 17:44:29'),
(344, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:44:39', '2021-10-20 17:44:39'),
(345, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:44:51', '2021-10-20 17:44:51'),
(346, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:45:00', '2021-10-20 17:45:00'),
(347, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:45:37', '2021-10-20 17:45:37'),
(348, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:45:42', '2021-10-20 17:45:42'),
(349, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:51:25', '2021-10-20 17:51:25'),
(350, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:52:11', '2021-10-20 17:52:11'),
(351, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:53:09', '2021-10-20 17:53:09'),
(352, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:53:45', '2021-10-20 17:53:45'),
(353, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:54:46', '2021-10-20 17:54:46'),
(354, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 17:55:25', '2021-10-20 17:55:25'),
(355, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 18:31:55', '2021-10-20 18:31:55'),
(356, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 18:32:01', '2021-10-20 18:32:01'),
(357, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 18:32:23', '2021-10-20 18:32:23'),
(358, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 18:32:30', '2021-10-20 18:32:30'),
(359, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 18:52:58', '2021-10-20 18:52:58'),
(360, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 19:39:15', '2021-10-20 19:39:15'),
(361, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 22:00:40', '2021-10-20 22:00:40'),
(362, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 02:31:02', '2021-10-21 02:31:02'),
(363, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 02:31:02', '2021-10-21 02:31:02'),
(364, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 02:31:25', '2021-10-21 02:31:25'),
(365, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 02:33:05', '2021-10-21 02:33:05'),
(366, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 23:38:10', '2021-10-20 23:38:10'),
(367, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 23:38:10', '2021-10-20 23:38:10'),
(368, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 23:39:03', '2021-10-20 23:39:03'),
(369, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 23:39:09', '2021-10-20 23:39:09'),
(370, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-20 23:40:55', '2021-10-20 23:40:55'),
(371, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:36:20', '2021-10-21 00:36:20'),
(372, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:36:43', '2021-10-21 00:36:43'),
(373, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:37:17', '2021-10-21 00:37:17'),
(374, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:37:38', '2021-10-21 00:37:38'),
(375, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:37:50', '2021-10-21 00:37:50'),
(376, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:38:20', '2021-10-21 00:38:20'),
(377, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:39:04', '2021-10-21 00:39:04'),
(378, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:40:40', '2021-10-21 00:40:40'),
(379, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:41:27', '2021-10-21 00:41:27'),
(380, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:41:35', '2021-10-21 00:41:35'),
(381, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 00:41:43', '2021-10-21 00:41:43'),
(382, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 01:17:33', '2021-10-21 01:17:33'),
(383, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-21 09:35:23', '2021-10-21 09:35:23'),
(384, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 00:36:06', '2021-10-22 00:36:06'),
(385, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 00:36:30', '2021-10-22 00:36:30'),
(386, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 00:36:35', '2021-10-22 00:36:35'),
(387, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 04:43:52', '2021-10-22 04:43:52'),
(388, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 04:46:29', '2021-10-22 04:46:29'),
(389, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 04:46:35', '2021-10-22 04:46:35'),
(390, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 04:50:54', '2021-10-22 04:50:54'),
(391, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 04:53:31', '2021-10-22 04:53:31'),
(392, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 09:57:38', '2021-10-22 09:57:38'),
(393, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 09:58:37', '2021-10-22 09:58:37'),
(394, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 09:58:40', '2021-10-22 09:58:40'),
(395, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '13', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 09:58:48', '2021-10-22 09:58:48'),
(396, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 10:22:42', '2021-10-22 10:22:42'),
(397, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 10:28:09', '2021-10-22 10:28:09'),
(398, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 10:31:25', '2021-10-22 10:31:25'),
(399, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-22 11:02:12', '2021-10-22 11:02:12'),
(400, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:48:30', '2021-10-26 07:48:30'),
(401, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:49:59', '2021-10-26 07:49:59'),
(402, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:50:17', '2021-10-26 07:50:17'),
(403, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:51:35', '2021-10-26 07:51:35'),
(404, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:51:53', '2021-10-26 07:51:53'),
(405, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:52:21', '2021-10-26 07:52:21'),
(406, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:53:59', '2021-10-26 07:53:59'),
(407, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:54:28', '2021-10-26 07:54:28'),
(408, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:57:14', '2021-10-26 07:57:14'),
(409, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:57:59', '2021-10-26 07:57:59'),
(410, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:59:11', '2021-10-26 07:59:11'),
(411, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:59:30', '2021-10-26 07:59:30'),
(412, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:59:37', '2021-10-26 07:59:37'),
(413, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 07:59:59', '2021-10-26 07:59:59'),
(414, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:03:10', '2021-10-26 08:03:10'),
(415, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:03:37', '2021-10-26 08:03:37'),
(416, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:07:11', '2021-10-26 08:07:11'),
(417, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:08:26', '2021-10-26 08:08:26'),
(418, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:08:43', '2021-10-26 08:08:43'),
(419, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:08:57', '2021-10-26 08:08:57'),
(420, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:09:22', '2021-10-26 08:09:22'),
(421, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:09:57', '2021-10-26 08:09:57'),
(422, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:11:05', '2021-10-26 08:11:05'),
(423, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:16:57', '2021-10-26 08:16:57'),
(424, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-26 08:17:23', '2021-10-26 08:17:23'),
(425, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 05:53:18', '2021-10-27 05:53:18'),
(426, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 05:55:02', '2021-10-27 05:55:02'),
(427, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:04:05', '2021-10-27 06:04:05'),
(428, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:04:24', '2021-10-27 06:04:24'),
(429, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:04:37', '2021-10-27 06:04:37'),
(430, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:04:43', '2021-10-27 06:04:43'),
(431, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:04:50', '2021-10-27 06:04:50'),
(432, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:05:27', '2021-10-27 06:05:27'),
(433, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:05:54', '2021-10-27 06:05:54'),
(434, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:06:30', '2021-10-27 06:06:30'),
(435, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:06:53', '2021-10-27 06:06:53'),
(436, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:07:10', '2021-10-27 06:07:10'),
(437, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:17:00', '2021-10-27 06:17:00'),
(438, '127.0.0.1', 'Chrome (94.0.4606.81)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 06:48:30', '2021-10-27 06:48:30'),
(439, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-27 16:04:05', '2021-10-27 16:04:05'),
(440, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 03:30:46', '2021-10-28 03:30:46'),
(441, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 05:07:43', '2021-10-28 05:07:43'),
(442, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 05:10:37', '2021-10-28 05:10:37'),
(443, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 06:55:57', '2021-10-28 06:55:57'),
(444, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 06:57:02', '2021-10-28 06:57:02'),
(445, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 06:57:54', '2021-10-28 06:57:54'),
(446, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 06:59:14', '2021-10-28 06:59:14'),
(447, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:04:02', '2021-10-28 07:04:02'),
(448, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:05:55', '2021-10-28 07:05:55'),
(449, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:12:16', '2021-10-28 07:12:16'),
(450, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:12:57', '2021-10-28 07:12:57'),
(451, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:13:35', '2021-10-28 07:13:35'),
(452, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:14:12', '2021-10-28 07:14:12'),
(453, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:15:05', '2021-10-28 07:15:05'),
(454, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:16:58', '2021-10-28 07:16:58'),
(455, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:17:49', '2021-10-28 07:17:49'),
(456, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 07:18:09', '2021-10-28 07:18:09'),
(457, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 08:07:53', '2021-10-28 08:07:53'),
(458, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 08:08:01', '2021-10-28 08:08:01'),
(459, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 08:30:04', '2021-10-28 08:30:04'),
(460, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 08:31:12', '2021-10-28 08:31:12'),
(461, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:00:24', '2021-10-28 09:00:24'),
(462, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:00:28', '2021-10-28 09:00:28'),
(463, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:04:02', '2021-10-28 09:04:02'),
(464, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:05:59', '2021-10-28 09:05:59'),
(465, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:09:22', '2021-10-28 09:09:22'),
(466, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:11:13', '2021-10-28 09:11:13'),
(467, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:11:21', '2021-10-28 09:11:21'),
(468, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:11:33', '2021-10-28 09:11:33'),
(469, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:20:59', '2021-10-28 09:20:59'),
(470, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:21:02', '2021-10-28 09:21:02'),
(471, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:21:13', '2021-10-28 09:21:13'),
(472, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:43:49', '2021-10-28 09:43:49'),
(473, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:44:40', '2021-10-28 09:44:40'),
(474, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:45:25', '2021-10-28 09:45:25'),
(475, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:45:58', '2021-10-28 09:45:58'),
(476, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:47:41', '2021-10-28 09:47:41'),
(477, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:47:45', '2021-10-28 09:47:45'),
(478, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:47:59', '2021-10-28 09:47:59'),
(479, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 09:50:45', '2021-10-28 09:50:45'),
(480, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:25:11', '2021-10-28 10:25:11'),
(481, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:32:49', '2021-10-28 10:32:49'),
(482, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:32:57', '2021-10-28 10:32:57'),
(483, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:39:13', '2021-10-28 10:39:13'),
(484, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:39:21', '2021-10-28 10:39:21'),
(485, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:39:27', '2021-10-28 10:39:27'),
(486, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:39:37', '2021-10-28 10:39:37'),
(487, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:50:27', '2021-10-28 10:50:27'),
(488, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:50:31', '2021-10-28 10:50:31'),
(489, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 10:50:38', '2021-10-28 10:50:38'),
(490, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-28 11:08:50', '2021-10-28 11:08:50'),
(491, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 03:27:48', '2021-10-29 03:27:48'),
(492, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 03:27:48', '2021-10-29 03:27:48'),
(493, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 03:33:00', '2021-10-29 03:33:00'),
(494, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 04:20:28', '2021-10-29 04:20:28'),
(495, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 04:22:18', '2021-10-29 04:22:18'),
(496, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 04:25:02', '2021-10-29 04:25:02'),
(497, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 05:06:18', '2021-10-29 05:06:18'),
(498, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 05:39:53', '2021-10-29 05:39:53'),
(499, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 06:51:52', '2021-10-29 06:51:52'),
(500, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:05:53', '2021-10-29 07:05:53'),
(501, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:05:57', '2021-10-29 07:05:57'),
(502, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:06:05', '2021-10-29 07:06:05'),
(503, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:06:17', '2021-10-29 07:06:17'),
(504, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:06:33', '2021-10-29 07:06:33'),
(505, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:06:36', '2021-10-29 07:06:36'),
(506, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:06:42', '2021-10-29 07:06:42'),
(507, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:06:53', '2021-10-29 07:06:53'),
(508, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:07:20', '2021-10-29 07:07:20'),
(509, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:07:29', '2021-10-29 07:07:29'),
(510, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:07:43', '2021-10-29 07:07:43'),
(511, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:08:03', '2021-10-29 07:08:03'),
(512, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:08:11', '2021-10-29 07:08:11'),
(513, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:08:51', '2021-10-29 07:08:51'),
(514, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 07:08:55', '2021-10-29 07:08:55'),
(515, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 09:08:09', '2021-10-29 09:08:09'),
(516, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 09:33:09', '2021-10-29 09:33:09'),
(517, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 09:33:31', '2021-10-29 09:33:31'),
(518, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 09:34:49', '2021-10-29 09:34:49'),
(519, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 09:35:07', '2021-10-29 09:35:07'),
(520, '127.0.0.1', 'Chrome (95.0.4638.54)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-10-29 09:49:51', '2021-10-29 09:49:51'),
(521, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-01 03:42:35', '2021-11-01 03:42:35'),
(522, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-01 03:42:35', '2021-11-01 03:42:35'),
(523, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-01 03:44:31', '2021-11-01 03:44:31'),
(524, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-01 04:13:28', '2021-11-01 04:13:28'),
(525, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-02 04:00:15', '2021-11-02 04:00:15'),
(526, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-02 04:00:42', '2021-11-02 04:00:42'),
(527, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-02 04:01:02', '2021-11-02 04:01:02'),
(528, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-02 04:04:23', '2021-11-02 04:04:23'),
(529, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-02 04:42:21', '2021-11-02 04:42:21'),
(530, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-02 04:42:21', '2021-11-02 04:42:21'),
(531, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 06:51:42', '2021-11-09 06:51:42'),
(532, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 06:51:42', '2021-11-09 06:51:42'),
(533, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 07:01:02', '2021-11-09 07:01:02'),
(534, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 07:10:10', '2021-11-09 07:10:10'),
(535, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:34:27', '2021-11-09 08:34:27'),
(536, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:34:49', '2021-11-09 08:34:49'),
(537, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:37:04', '2021-11-09 08:37:04'),
(538, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:37:50', '2021-11-09 08:37:50'),
(539, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:45:42', '2021-11-09 08:45:42'),
(540, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:46:25', '2021-11-09 08:46:25'),
(541, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 08:57:30', '2021-11-09 08:57:30'),
(542, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:03:32', '2021-11-09 09:03:32'),
(543, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:04:06', '2021-11-09 09:04:06'),
(544, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:04:57', '2021-11-09 09:04:57'),
(545, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:05:27', '2021-11-09 09:05:27'),
(546, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:05:34', '2021-11-09 09:05:34'),
(547, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:05:53', '2021-11-09 09:05:53'),
(548, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:06:20', '2021-11-09 09:06:20'),
(549, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:06:30', '2021-11-09 09:06:30'),
(550, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:06:38', '2021-11-09 09:06:38'),
(551, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:06:55', '2021-11-09 09:06:55'),
(552, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:07:40', '2021-11-09 09:07:40'),
(553, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:07:44', '2021-11-09 09:07:44'),
(554, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:07:46', '2021-11-09 09:07:46'),
(555, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:07:50', '2021-11-09 09:07:50'),
(556, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:12:23', '2021-11-09 09:12:23'),
(557, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:13:56', '2021-11-09 09:13:56'),
(558, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:14:10', '2021-11-09 09:14:10'),
(559, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:14:19', '2021-11-09 09:14:19'),
(560, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:14:29', '2021-11-09 09:14:29'),
(561, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:15:04', '2021-11-09 09:15:04'),
(562, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:16:10', '2021-11-09 09:16:10'),
(563, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:25:30', '2021-11-09 09:25:30'),
(564, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 09:26:32', '2021-11-09 09:26:32'),
(565, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:01:08', '2021-11-09 11:01:08'),
(566, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:30:23', '2021-11-09 11:30:23'),
(567, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '29', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:31:17', '2021-11-09 11:31:17'),
(568, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '29', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:32:49', '2021-11-09 11:32:49'),
(569, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '29', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:35:05', '2021-11-09 11:35:05'),
(570, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '29', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:35:54', '2021-11-09 11:35:54'),
(571, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-09 11:35:59', '2021-11-09 11:35:59'),
(572, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 03:24:15', '2021-11-10 03:24:15'),
(573, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 03:24:15', '2021-11-10 03:24:15'),
(574, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 03:51:12', '2021-11-10 03:51:12'),
(575, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:09:37', '2021-11-10 04:09:37'),
(576, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:09:48', '2021-11-10 04:09:48');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(577, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:10:04', '2021-11-10 04:10:04'),
(578, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:12:24', '2021-11-10 04:12:24'),
(579, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:13:38', '2021-11-10 04:13:38'),
(580, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:13:52', '2021-11-10 04:13:52'),
(581, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:14:14', '2021-11-10 04:14:14'),
(582, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:15:34', '2021-11-10 04:15:34'),
(583, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:16:43', '2021-11-10 04:16:43'),
(584, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:17:56', '2021-11-10 04:17:56'),
(585, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:20:23', '2021-11-10 04:20:23'),
(586, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:20:44', '2021-11-10 04:20:44'),
(587, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:22:15', '2021-11-10 04:22:15'),
(588, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:22:31', '2021-11-10 04:22:31'),
(589, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:23:02', '2021-11-10 04:23:02'),
(590, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:23:09', '2021-11-10 04:23:09'),
(591, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:23:34', '2021-11-10 04:23:34'),
(592, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:23:48', '2021-11-10 04:23:48'),
(593, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:24:09', '2021-11-10 04:24:09'),
(594, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:24:39', '2021-11-10 04:24:39'),
(595, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:26:02', '2021-11-10 04:26:02'),
(596, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:26:38', '2021-11-10 04:26:38'),
(597, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:30:26', '2021-11-10 04:30:26'),
(598, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:38:49', '2021-11-10 04:38:49'),
(599, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:39:21', '2021-11-10 04:39:21'),
(600, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:41:29', '2021-11-10 04:41:29'),
(601, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:42:06', '2021-11-10 04:42:06'),
(602, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:42:28', '2021-11-10 04:42:28'),
(603, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:42:40', '2021-11-10 04:42:40'),
(604, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:42:47', '2021-11-10 04:42:47'),
(605, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:42:56', '2021-11-10 04:42:56'),
(606, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:50:17', '2021-11-10 04:50:17'),
(607, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:50:21', '2021-11-10 04:50:21'),
(608, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:50:29', '2021-11-10 04:50:29'),
(609, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:52:21', '2021-11-10 04:52:21'),
(610, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 04:52:28', '2021-11-10 04:52:28'),
(611, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:24:12', '2021-11-10 05:24:12'),
(612, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:24:40', '2021-11-10 05:24:40'),
(613, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:24:56', '2021-11-10 05:24:56'),
(614, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:25:06', '2021-11-10 05:25:06'),
(615, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:25:40', '2021-11-10 05:25:40'),
(616, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:25:51', '2021-11-10 05:25:51'),
(617, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:26:18', '2021-11-10 05:26:18'),
(618, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:26:47', '2021-11-10 05:26:47'),
(619, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:28:10', '2021-11-10 05:28:10'),
(620, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Android', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:28:34', '2021-11-10 05:28:34'),
(621, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:29:25', '2021-11-10 05:29:25'),
(622, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:30:14', '2021-11-10 05:30:14'),
(623, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:30:36', '2021-11-10 05:30:36'),
(624, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:32:22', '2021-11-10 05:32:22'),
(625, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 05:34:14', '2021-11-10 05:34:14'),
(626, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:25:29', '2021-11-10 06:25:29'),
(627, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:25:33', '2021-11-10 06:25:33'),
(628, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:25:46', '2021-11-10 06:25:46'),
(629, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:29:24', '2021-11-10 06:29:24'),
(630, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:30:58', '2021-11-10 06:30:58'),
(631, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:31:17', '2021-11-10 06:31:17'),
(632, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:32:09', '2021-11-10 06:32:09'),
(633, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:33:30', '2021-11-10 06:33:30'),
(634, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:34:01', '2021-11-10 06:34:01'),
(635, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:34:11', '2021-11-10 06:34:11'),
(636, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:34:22', '2021-11-10 06:34:22'),
(637, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:36:15', '2021-11-10 06:36:15'),
(638, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 06:36:34', '2021-11-10 06:36:34'),
(639, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '7', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:11:41', '2021-11-10 08:11:41'),
(640, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '7', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:11:47', '2021-11-10 08:11:47'),
(641, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '7', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:11:53', '2021-11-10 08:11:53'),
(642, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '7', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:14:26', '2021-11-10 08:14:26'),
(643, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:16:44', '2021-11-10 08:16:44'),
(644, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:24:10', '2021-11-10 08:24:10'),
(645, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 08:38:26', '2021-11-10 08:38:26'),
(646, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:06:17', '2021-11-10 14:06:17'),
(647, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:06:17', '2021-11-10 14:06:17'),
(648, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:09:57', '2021-11-10 14:09:57'),
(649, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:14:47', '2021-11-10 14:14:47'),
(650, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:16:56', '2021-11-10 14:16:56'),
(651, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:19:25', '2021-11-10 14:19:25'),
(652, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:24:47', '2021-11-10 14:24:47'),
(653, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:33:42', '2021-11-10 14:33:42'),
(654, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:34:13', '2021-11-10 14:34:13'),
(655, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:38:54', '2021-11-10 14:38:54'),
(656, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:42:10', '2021-11-10 14:42:10'),
(657, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:54:49', '2021-11-10 14:54:49'),
(658, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:55:03', '2021-11-10 14:55:03'),
(659, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:55:11', '2021-11-10 14:55:11'),
(660, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:58:35', '2021-11-10 14:58:35'),
(661, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 14:59:26', '2021-11-10 14:59:26'),
(662, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:00:43', '2021-11-10 15:00:43'),
(663, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:01:19', '2021-11-10 15:01:19'),
(664, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:01:40', '2021-11-10 15:01:40'),
(665, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:02:05', '2021-11-10 15:02:05'),
(666, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:02:28', '2021-11-10 15:02:28'),
(667, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:04:15', '2021-11-10 15:04:15'),
(668, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:05:36', '2021-11-10 15:05:36'),
(669, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:33', '2021-11-10 15:06:33'),
(670, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:55', '2021-11-10 15:06:55'),
(671, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:57', '2021-11-10 15:06:57'),
(672, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:57', '2021-11-10 15:06:57'),
(673, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:58', '2021-11-10 15:06:58'),
(674, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:59', '2021-11-10 15:06:59'),
(675, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:06:59', '2021-11-10 15:06:59'),
(676, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:07:00', '2021-11-10 15:07:00'),
(677, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:08:23', '2021-11-10 15:08:23'),
(678, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:10:32', '2021-11-10 15:10:32'),
(679, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:11:15', '2021-11-10 15:11:15'),
(680, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-10 15:11:41', '2021-11-10 15:11:41'),
(681, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 03:30:12', '2021-11-11 03:30:12'),
(682, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 03:30:12', '2021-11-11 03:30:12'),
(683, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 03:33:04', '2021-11-11 03:33:04'),
(684, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 04:44:11', '2021-11-11 04:44:11'),
(685, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 04:44:17', '2021-11-11 04:44:17'),
(686, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 04:44:27', '2021-11-11 04:44:27'),
(687, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 04:58:34', '2021-11-11 04:58:34'),
(688, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 04:59:38', '2021-11-11 04:59:38'),
(689, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:02:23', '2021-11-11 05:02:23'),
(690, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:03:10', '2021-11-11 05:03:10'),
(691, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:03:10', '2021-11-11 05:03:10'),
(692, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:05:23', '2021-11-11 05:05:23'),
(693, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:06:16', '2021-11-11 05:06:16'),
(694, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:06:37', '2021-11-11 05:06:37'),
(695, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:06:51', '2021-11-11 05:06:51'),
(696, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:07:33', '2021-11-11 05:07:33'),
(697, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:07:33', '2021-11-11 05:07:33'),
(698, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:07:33', '2021-11-11 05:07:33'),
(699, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:07:34', '2021-11-11 05:07:34'),
(700, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:08:20', '2021-11-11 05:08:20'),
(701, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:08:20', '2021-11-11 05:08:20'),
(702, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:08:20', '2021-11-11 05:08:20'),
(703, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:08:21', '2021-11-11 05:08:21'),
(704, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:08:59', '2021-11-11 05:08:59'),
(705, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:09:40', '2021-11-11 05:09:40'),
(706, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:10:16', '2021-11-11 05:10:16'),
(707, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:12:53', '2021-11-11 05:12:53'),
(708, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:14:08', '2021-11-11 05:14:08'),
(709, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:15:28', '2021-11-11 05:15:28'),
(710, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:16:58', '2021-11-11 05:16:58'),
(711, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:18:57', '2021-11-11 05:18:57'),
(712, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:19:00', '2021-11-11 05:19:00'),
(713, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:19:06', '2021-11-11 05:19:06'),
(714, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:19:14', '2021-11-11 05:19:14'),
(715, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:21:51', '2021-11-11 05:21:51'),
(716, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:22:47', '2021-11-11 05:22:47'),
(717, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:24:01', '2021-11-11 05:24:01'),
(718, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:24:39', '2021-11-11 05:24:39'),
(719, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:24:49', '2021-11-11 05:24:49'),
(720, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:30:19', '2021-11-11 05:30:19'),
(721, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:31:37', '2021-11-11 05:31:37'),
(722, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:38:54', '2021-11-11 05:38:54'),
(723, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:38:59', '2021-11-11 05:38:59'),
(724, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:39:07', '2021-11-11 05:39:07'),
(725, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:44:12', '2021-11-11 05:44:12'),
(726, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:45:15', '2021-11-11 05:45:15'),
(727, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:49:56', '2021-11-11 05:49:56'),
(728, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:50:06', '2021-11-11 05:50:06'),
(729, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:50:12', '2021-11-11 05:50:12'),
(730, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:51:00', '2021-11-11 05:51:00'),
(731, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:51:05', '2021-11-11 05:51:05'),
(732, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 05:51:21', '2021-11-11 05:51:21'),
(733, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 06:16:17', '2021-11-11 06:16:17'),
(734, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 06:57:05', '2021-11-11 06:57:05'),
(735, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 06:58:17', '2021-11-11 06:58:17'),
(736, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 06:58:22', '2021-11-11 06:58:22'),
(737, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 06:58:34', '2021-11-11 06:58:34'),
(738, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:15:38', '2021-11-11 07:15:38'),
(739, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:16:03', '2021-11-11 07:16:03'),
(740, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:16:49', '2021-11-11 07:16:49'),
(741, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:16:49', '2021-11-11 07:16:49'),
(742, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:18:31', '2021-11-11 07:18:31'),
(743, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:19:19', '2021-11-11 07:19:19'),
(744, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:20:33', '2021-11-11 07:20:33'),
(745, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:21:36', '2021-11-11 07:21:36'),
(746, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:21:43', '2021-11-11 07:21:43'),
(747, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:23:04', '2021-11-11 07:23:04'),
(748, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:23:49', '2021-11-11 07:23:49'),
(749, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:24:10', '2021-11-11 07:24:10'),
(750, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 07:25:11', '2021-11-11 07:25:11'),
(751, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:12:38', '2021-11-11 08:12:38'),
(752, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:21:13', '2021-11-11 08:21:13'),
(753, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:22:43', '2021-11-11 08:22:43'),
(754, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:25:39', '2021-11-11 08:25:39'),
(755, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:26:29', '2021-11-11 08:26:29'),
(756, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:26:55', '2021-11-11 08:26:55'),
(757, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:28:40', '2021-11-11 08:28:40'),
(758, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:28:48', '2021-11-11 08:28:48'),
(759, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:43:22', '2021-11-11 08:43:22'),
(760, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:43:34', '2021-11-11 08:43:34'),
(761, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:44:27', '2021-11-11 08:44:27'),
(762, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:47:08', '2021-11-11 08:47:08'),
(763, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:49:55', '2021-11-11 08:49:55'),
(764, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:52:29', '2021-11-11 08:52:29'),
(765, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:54:27', '2021-11-11 08:54:27'),
(766, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 08:57:14', '2021-11-11 08:57:14'),
(767, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:01:19', '2021-11-11 09:01:19'),
(768, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:08:47', '2021-11-11 09:08:47'),
(769, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:10:05', '2021-11-11 09:10:05'),
(770, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:14:09', '2021-11-11 09:14:09'),
(771, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:15:40', '2021-11-11 09:15:40'),
(772, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:16:59', '2021-11-11 09:16:59'),
(773, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:18:10', '2021-11-11 09:18:10'),
(774, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:19:55', '2021-11-11 09:19:55'),
(775, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:20:41', '2021-11-11 09:20:41'),
(776, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:21:21', '2021-11-11 09:21:21'),
(777, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:27:41', '2021-11-11 09:27:41'),
(778, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:34:55', '2021-11-11 09:34:55'),
(779, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:34:57', '2021-11-11 09:34:57'),
(780, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:35:04', '2021-11-11 09:35:04'),
(781, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 09:47:38', '2021-11-11 09:47:38'),
(782, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:00:55', '2021-11-11 10:00:55'),
(783, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:01:09', '2021-11-11 10:01:09'),
(784, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:01:26', '2021-11-11 10:01:26'),
(785, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:01:43', '2021-11-11 10:01:43'),
(786, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:01:51', '2021-11-11 10:01:51'),
(787, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:43:11', '2021-11-11 10:43:11'),
(788, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:45:14', '2021-11-11 10:45:14'),
(789, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:46:03', '2021-11-11 10:46:03'),
(790, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:46:37', '2021-11-11 10:46:37'),
(791, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:47:17', '2021-11-11 10:47:17'),
(792, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:47:20', '2021-11-11 10:47:20'),
(793, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:47:33', '2021-11-11 10:47:33'),
(794, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:48:44', '2021-11-11 10:48:44'),
(795, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:50:17', '2021-11-11 10:50:17'),
(796, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 10:51:42', '2021-11-11 10:51:42'),
(797, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:38:14', '2021-11-11 11:38:14'),
(798, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:39:30', '2021-11-11 11:39:30'),
(799, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:39:34', '2021-11-11 11:39:34'),
(800, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:39:43', '2021-11-11 11:39:43'),
(801, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:42:14', '2021-11-11 11:42:14'),
(802, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:42:45', '2021-11-11 11:42:45'),
(803, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:42:54', '2021-11-11 11:42:54'),
(804, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:43:15', '2021-11-11 11:43:15'),
(805, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:46:20', '2021-11-11 11:46:20'),
(806, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:46:42', '2021-11-11 11:46:42'),
(807, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:48:24', '2021-11-11 11:48:24'),
(808, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-11 11:49:12', '2021-11-11 11:49:12'),
(809, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 03:27:00', '2021-11-12 03:27:00'),
(810, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 03:27:00', '2021-11-12 03:27:00'),
(811, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:06:52', '2021-11-12 04:06:52'),
(812, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:06:58', '2021-11-12 04:06:58'),
(813, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:07:23', '2021-11-12 04:07:23'),
(814, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:14:56', '2021-11-12 04:14:56'),
(815, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:05', '2021-11-12 04:15:05'),
(816, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:32', '2021-11-12 04:15:32'),
(817, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:35', '2021-11-12 04:15:35'),
(818, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:35', '2021-11-12 04:15:35'),
(819, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:35', '2021-11-12 04:15:35'),
(820, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:36', '2021-11-12 04:15:36'),
(821, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:38', '2021-11-12 04:15:38'),
(822, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:39', '2021-11-12 04:15:39'),
(823, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:15:40', '2021-11-12 04:15:40'),
(824, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:16:28', '2021-11-12 04:16:28'),
(825, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:16:56', '2021-11-12 04:16:56'),
(826, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:18:11', '2021-11-12 04:18:11'),
(827, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:18:16', '2021-11-12 04:18:16'),
(828, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:18:26', '2021-11-12 04:18:26'),
(829, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:18:32', '2021-11-12 04:18:32'),
(830, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:18:40', '2021-11-12 04:18:40'),
(831, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:18:44', '2021-11-12 04:18:44'),
(832, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:20:20', '2021-11-12 04:20:20'),
(833, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:20:20', '2021-11-12 04:20:20'),
(834, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:20:20', '2021-11-12 04:20:20'),
(835, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:20:21', '2021-11-12 04:20:21'),
(836, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:20:26', '2021-11-12 04:20:26'),
(837, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:20:49', '2021-11-12 04:20:49'),
(838, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:02', '2021-11-12 04:21:02'),
(839, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:04', '2021-11-12 04:21:04'),
(840, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:05', '2021-11-12 04:21:05'),
(841, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:05', '2021-11-12 04:21:05'),
(842, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:10', '2021-11-12 04:21:10'),
(843, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:11', '2021-11-12 04:21:11'),
(844, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:27', '2021-11-12 04:21:27'),
(845, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:41', '2021-11-12 04:21:41'),
(846, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:49', '2021-11-12 04:21:49'),
(847, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:51', '2021-11-12 04:21:51'),
(848, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:21:51', '2021-11-12 04:21:51'),
(849, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:22:33', '2021-11-12 04:22:33'),
(850, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:24:59', '2021-11-12 04:24:59'),
(851, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:25:33', '2021-11-12 04:25:33'),
(852, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:26:21', '2021-11-12 04:26:21'),
(853, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:27:51', '2021-11-12 04:27:51'),
(854, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:30:30', '2021-11-12 04:30:30'),
(855, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:32:07', '2021-11-12 04:32:07'),
(856, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:34:10', '2021-11-12 04:34:10'),
(857, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:35:44', '2021-11-12 04:35:44'),
(858, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:37:04', '2021-11-12 04:37:04'),
(859, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:39:29', '2021-11-12 04:39:29'),
(860, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:40:56', '2021-11-12 04:40:56'),
(861, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:41:44', '2021-11-12 04:41:44'),
(862, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:42:02', '2021-11-12 04:42:02'),
(863, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:42:36', '2021-11-12 04:42:36'),
(864, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:42:42', '2021-11-12 04:42:42'),
(865, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:44:18', '2021-11-12 04:44:18'),
(866, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:44:57', '2021-11-12 04:44:57'),
(867, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:45:05', '2021-11-12 04:45:05'),
(868, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:45:07', '2021-11-12 04:45:07'),
(869, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:46:14', '2021-11-12 04:46:14'),
(870, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:49:30', '2021-11-12 04:49:30'),
(871, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:50:31', '2021-11-12 04:50:31'),
(872, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:52:37', '2021-11-12 04:52:37');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(873, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:56:11', '2021-11-12 04:56:11'),
(874, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:56:24', '2021-11-12 04:56:24'),
(875, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:57:10', '2021-11-12 04:57:10'),
(876, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:59:03', '2021-11-12 04:59:03'),
(877, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 04:59:59', '2021-11-12 04:59:59'),
(878, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:02:20', '2021-11-12 05:02:20'),
(879, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:05:27', '2021-11-12 05:05:27'),
(880, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:05:33', '2021-11-12 05:05:33'),
(881, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:06:40', '2021-11-12 05:06:40'),
(882, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:07:03', '2021-11-12 05:07:03'),
(883, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:07:38', '2021-11-12 05:07:38'),
(884, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:08:25', '2021-11-12 05:08:25'),
(885, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:09:54', '2021-11-12 05:09:54'),
(886, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:10:55', '2021-11-12 05:10:55'),
(887, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:11:49', '2021-11-12 05:11:49'),
(888, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:12:35', '2021-11-12 05:12:35'),
(889, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:12:47', '2021-11-12 05:12:47'),
(890, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:13:42', '2021-11-12 05:13:42'),
(891, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:15:40', '2021-11-12 05:15:40'),
(892, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:16:26', '2021-11-12 05:16:26'),
(893, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:18:16', '2021-11-12 05:18:16'),
(894, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:19:32', '2021-11-12 05:19:32'),
(895, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:19:59', '2021-11-12 05:19:59'),
(896, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:20:55', '2021-11-12 05:20:55'),
(897, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:22:51', '2021-11-12 05:22:51'),
(898, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:23:28', '2021-11-12 05:23:28'),
(899, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:24:22', '2021-11-12 05:24:22'),
(900, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:26:31', '2021-11-12 05:26:31'),
(901, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:27:05', '2021-11-12 05:27:05'),
(902, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:27:29', '2021-11-12 05:27:29'),
(903, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:30:05', '2021-11-12 05:30:05'),
(904, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:31:36', '2021-11-12 05:31:36'),
(905, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:32:12', '2021-11-12 05:32:12'),
(906, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:38:05', '2021-11-12 05:38:05'),
(907, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:38:19', '2021-11-12 05:38:19'),
(908, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:38:19', '2021-11-12 05:38:19'),
(909, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:38:50', '2021-11-12 05:38:50'),
(910, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:38:57', '2021-11-12 05:38:57'),
(911, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:38:57', '2021-11-12 05:38:57'),
(912, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:39:26', '2021-11-12 05:39:26'),
(913, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:40:05', '2021-11-12 05:40:05'),
(914, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:41:07', '2021-11-12 05:41:07'),
(915, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:41:21', '2021-11-12 05:41:21'),
(916, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:42:51', '2021-11-12 05:42:51'),
(917, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:43:14', '2021-11-12 05:43:14'),
(918, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:45:48', '2021-11-12 05:45:48'),
(919, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:47:06', '2021-11-12 05:47:06'),
(920, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:47:28', '2021-11-12 05:47:28'),
(921, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 05:56:53', '2021-11-12 05:56:53'),
(922, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:00:22', '2021-11-12 06:00:22'),
(923, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:03:04', '2021-11-12 06:03:04'),
(924, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:05:13', '2021-11-12 06:05:13'),
(925, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:08:29', '2021-11-12 06:08:29'),
(926, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:09:13', '2021-11-12 06:09:13'),
(927, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:11:09', '2021-11-12 06:11:09'),
(928, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:12:02', '2021-11-12 06:12:02'),
(929, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:12:22', '2021-11-12 06:12:22'),
(930, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:13:01', '2021-11-12 06:13:01'),
(931, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:14:45', '2021-11-12 06:14:45'),
(932, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:16:11', '2021-11-12 06:16:11'),
(933, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:17:26', '2021-11-12 06:17:26'),
(934, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:26:07', '2021-11-12 06:26:07'),
(935, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:36:51', '2021-11-12 06:36:51'),
(936, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:37:52', '2021-11-12 06:37:52'),
(937, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:39:12', '2021-11-12 06:39:12'),
(938, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:39:42', '2021-11-12 06:39:42'),
(939, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:39:48', '2021-11-12 06:39:48'),
(940, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:39:54', '2021-11-12 06:39:54'),
(941, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:40:08', '2021-11-12 06:40:08'),
(942, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:40:12', '2021-11-12 06:40:12'),
(943, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:40:17', '2021-11-12 06:40:17'),
(944, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:43:23', '2021-11-12 06:43:23'),
(945, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:47:35', '2021-11-12 06:47:35'),
(946, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:47:48', '2021-11-12 06:47:48'),
(947, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:48:27', '2021-11-12 06:48:27'),
(948, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:56:25', '2021-11-12 06:56:25'),
(949, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 06:59:21', '2021-11-12 06:59:21'),
(950, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:02:02', '2021-11-12 07:02:02'),
(951, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:02:05', '2021-11-12 07:02:05'),
(952, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:02:13', '2021-11-12 07:02:13'),
(953, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:02:56', '2021-11-12 07:02:56'),
(954, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:02:59', '2021-11-12 07:02:59'),
(955, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:03:52', '2021-11-12 07:03:52'),
(956, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:04:35', '2021-11-12 07:04:35'),
(957, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:05:17', '2021-11-12 07:05:17'),
(958, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:07:00', '2021-11-12 07:07:00'),
(959, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:07:21', '2021-11-12 07:07:21'),
(960, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:09:02', '2021-11-12 07:09:02'),
(961, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:13:12', '2021-11-12 07:13:12'),
(962, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:13:53', '2021-11-12 07:13:53'),
(963, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:15:40', '2021-11-12 07:15:40'),
(964, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:50:51', '2021-11-12 07:50:51'),
(965, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:53:01', '2021-11-12 07:53:01'),
(966, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:57:45', '2021-11-12 07:57:45'),
(967, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:58:24', '2021-11-12 07:58:24'),
(968, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 07:59:39', '2021-11-12 07:59:39'),
(969, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:02:06', '2021-11-12 08:02:06'),
(970, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:04:26', '2021-11-12 08:04:26'),
(971, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:05:25', '2021-11-12 08:05:25'),
(972, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:06:24', '2021-11-12 08:06:24'),
(973, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:08:02', '2021-11-12 08:08:02'),
(974, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:12:16', '2021-11-12 08:12:16'),
(975, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:38:33', '2021-11-12 08:38:33'),
(976, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:45:08', '2021-11-12 08:45:08'),
(977, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:46:01', '2021-11-12 08:46:01'),
(978, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 08:55:39', '2021-11-12 08:55:39'),
(979, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:05:04', '2021-11-12 09:05:04'),
(980, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:12:08', '2021-11-12 09:12:08'),
(981, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:12:44', '2021-11-12 09:12:44'),
(982, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:13:37', '2021-11-12 09:13:37'),
(983, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:21:04', '2021-11-12 09:21:04'),
(984, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:21:53', '2021-11-12 09:21:53'),
(985, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:23:52', '2021-11-12 09:23:52'),
(986, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:32:17', '2021-11-12 09:32:17'),
(987, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:34:53', '2021-11-12 09:34:53'),
(988, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:36:24', '2021-11-12 09:36:24'),
(989, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:39:10', '2021-11-12 09:39:10'),
(990, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:43:41', '2021-11-12 09:43:41'),
(991, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:47:20', '2021-11-12 09:47:20'),
(992, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:48:09', '2021-11-12 09:48:09'),
(993, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:50:33', '2021-11-12 09:50:33'),
(994, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:53:31', '2021-11-12 09:53:31'),
(995, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:53:36', '2021-11-12 09:53:36'),
(996, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 09:53:43', '2021-11-12 09:53:43'),
(997, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:02:31', '2021-11-12 10:02:31'),
(998, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:03:40', '2021-11-12 10:03:40'),
(999, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:04:54', '2021-11-12 10:04:54'),
(1000, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:06:30', '2021-11-12 10:06:30'),
(1001, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:07:52', '2021-11-12 10:07:52'),
(1002, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:12:03', '2021-11-12 10:12:03'),
(1003, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:12:39', '2021-11-12 10:12:39'),
(1004, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:13:19', '2021-11-12 10:13:19'),
(1005, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:20:44', '2021-11-12 10:20:44'),
(1006, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:23:43', '2021-11-12 10:23:43'),
(1007, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:26:20', '2021-11-12 10:26:20'),
(1008, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:26:31', '2021-11-12 10:26:31'),
(1009, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:27:17', '2021-11-12 10:27:17'),
(1010, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:30:41', '2021-11-12 10:30:41'),
(1011, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:32:34', '2021-11-12 10:32:34'),
(1012, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:34:40', '2021-11-12 10:34:40'),
(1013, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:35:48', '2021-11-12 10:35:48'),
(1014, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:36:38', '2021-11-12 10:36:38'),
(1015, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:39:52', '2021-11-12 10:39:52'),
(1016, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:44:32', '2021-11-12 10:44:32'),
(1017, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:56:55', '2021-11-12 10:56:55'),
(1018, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:57:37', '2021-11-12 10:57:37'),
(1019, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:57:58', '2021-11-12 10:57:58'),
(1020, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:58:28', '2021-11-12 10:58:28'),
(1021, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:58:39', '2021-11-12 10:58:39'),
(1022, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:58:51', '2021-11-12 10:58:51'),
(1023, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:59:03', '2021-11-12 10:59:03'),
(1024, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 10:59:17', '2021-11-12 10:59:17'),
(1025, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:00:06', '2021-11-12 11:00:06'),
(1026, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:01:01', '2021-11-12 11:01:01'),
(1027, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:01:20', '2021-11-12 11:01:20'),
(1028, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:01:34', '2021-11-12 11:01:34'),
(1029, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:01:49', '2021-11-12 11:01:49'),
(1030, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:01:57', '2021-11-12 11:01:57'),
(1031, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:02:28', '2021-11-12 11:02:28'),
(1032, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:02:38', '2021-11-12 11:02:38'),
(1033, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:02:42', '2021-11-12 11:02:42'),
(1034, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:03:34', '2021-11-12 11:03:34'),
(1035, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:05:38', '2021-11-12 11:05:38'),
(1036, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:05:53', '2021-11-12 11:05:53'),
(1037, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:06:03', '2021-11-12 11:06:03'),
(1038, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:06:26', '2021-11-12 11:06:26'),
(1039, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:07:51', '2021-11-12 11:07:51'),
(1040, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:08:09', '2021-11-12 11:08:09'),
(1041, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:08:11', '2021-11-12 11:08:11'),
(1042, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:15:09', '2021-11-12 11:15:09'),
(1043, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:15:13', '2021-11-12 11:15:13'),
(1044, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:15:18', '2021-11-12 11:15:18'),
(1045, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:15:19', '2021-11-12 11:15:19'),
(1046, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:15:41', '2021-11-12 11:15:41'),
(1047, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:16:01', '2021-11-12 11:16:01'),
(1048, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:38:25', '2021-11-12 11:38:25'),
(1049, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:46:57', '2021-11-12 11:46:57'),
(1050, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:47:01', '2021-11-12 11:47:01'),
(1051, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 11:47:09', '2021-11-12 11:47:09'),
(1052, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 12:02:37', '2021-11-12 12:02:37'),
(1053, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 12:17:56', '2021-11-12 12:17:56'),
(1054, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 12:17:56', '2021-11-12 12:17:56'),
(1055, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 12:18:01', '2021-11-12 12:18:01'),
(1056, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 12:18:12', '2021-11-12 12:18:12'),
(1057, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 13:40:18', '2021-11-12 13:40:18'),
(1058, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 13:50:35', '2021-11-12 13:50:35'),
(1059, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 14:24:32', '2021-11-12 14:24:32'),
(1060, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 17:21:15', '2021-11-12 17:21:15'),
(1061, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 17:41:01', '2021-11-12 17:41:01'),
(1062, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 17:41:02', '2021-11-12 17:41:02'),
(1063, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 17:41:12', '2021-11-12 17:41:12'),
(1064, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 17:41:15', '2021-11-12 17:41:15'),
(1065, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:34:08', '2021-11-12 18:34:08'),
(1066, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:35:44', '2021-11-12 18:35:44'),
(1067, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:35:53', '2021-11-12 18:35:53'),
(1068, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:36:00', '2021-11-12 18:36:00'),
(1069, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:37:50', '2021-11-12 18:37:50'),
(1070, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:38:20', '2021-11-12 18:38:20'),
(1071, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 18:39:08', '2021-11-12 18:39:08'),
(1072, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 19:04:49', '2021-11-12 19:04:49'),
(1073, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 19:04:52', '2021-11-12 19:04:52'),
(1074, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-12 19:05:01', '2021-11-12 19:05:01'),
(1075, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 03:34:00', '2021-11-15 03:34:00'),
(1076, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 03:34:00', '2021-11-15 03:34:00'),
(1077, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 03:34:51', '2021-11-15 03:34:51'),
(1078, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:05:51', '2021-11-15 04:05:51'),
(1079, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:43:15', '2021-11-15 04:43:15'),
(1080, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:43:19', '2021-11-15 04:43:19'),
(1081, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:43:26', '2021-11-15 04:43:26'),
(1082, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:43:46', '2021-11-15 04:43:46'),
(1083, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:44:18', '2021-11-15 04:44:18'),
(1084, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:44:23', '2021-11-15 04:44:23'),
(1085, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 04:44:28', '2021-11-15 04:44:28'),
(1086, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 05:44:34', '2021-11-15 05:44:34'),
(1087, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 05:44:34', '2021-11-15 05:44:34'),
(1088, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 06:34:10', '2021-11-15 06:34:10'),
(1089, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 06:34:16', '2021-11-15 06:34:16'),
(1090, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 06:34:23', '2021-11-15 06:34:23'),
(1091, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 08:06:13', '2021-11-15 08:06:13'),
(1092, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 08:06:13', '2021-11-15 08:06:13'),
(1093, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 08:06:20', '2021-11-15 08:06:20'),
(1094, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 08:06:25', '2021-11-15 08:06:25'),
(1095, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 08:08:20', '2021-11-15 08:08:20'),
(1096, '127.0.0.1', 'Chrome (95.0.4638.69)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-15 08:09:08', '2021-11-15 08:09:08'),
(1097, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-16 05:54:23', '2021-11-16 05:54:23'),
(1098, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-16 05:54:23', '2021-11-16 05:54:23'),
(1099, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-16 09:35:00', '2021-11-16 09:35:00'),
(1100, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-18 14:53:39', '2021-11-18 14:53:39'),
(1101, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-18 14:53:39', '2021-11-18 14:53:39'),
(1102, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-18 15:58:19', '2021-11-18 15:58:19'),
(1103, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 04:31:04', '2021-11-19 04:31:04'),
(1104, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 04:31:04', '2021-11-19 04:31:04'),
(1105, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 04:45:15', '2021-11-19 04:45:15'),
(1106, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 04:45:21', '2021-11-19 04:45:21'),
(1107, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 04:45:41', '2021-11-19 04:45:41'),
(1108, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 04:47:49', '2021-11-19 04:47:49'),
(1109, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 05:05:19', '2021-11-19 05:05:19'),
(1110, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 05:07:05', '2021-11-19 05:07:05'),
(1111, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 05:30:42', '2021-11-19 05:30:42'),
(1112, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:06:01', '2021-11-19 09:06:01'),
(1113, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:06:03', '2021-11-19 09:06:03'),
(1114, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:09:52', '2021-11-19 09:09:52'),
(1115, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:11:03', '2021-11-19 09:11:03'),
(1116, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:11:14', '2021-11-19 09:11:14'),
(1117, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:12:09', '2021-11-19 09:12:09'),
(1118, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:12:23', '2021-11-19 09:12:23'),
(1119, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:13:36', '2021-11-19 09:13:36'),
(1120, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:15:56', '2021-11-19 09:15:56'),
(1121, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:16:10', '2021-11-19 09:16:10'),
(1122, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:17:39', '2021-11-19 09:17:39'),
(1123, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:18:08', '2021-11-19 09:18:08'),
(1124, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:18:45', '2021-11-19 09:18:45'),
(1125, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:18:57', '2021-11-19 09:18:57'),
(1126, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:19:47', '2021-11-19 09:19:47'),
(1127, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:20:06', '2021-11-19 09:20:06'),
(1128, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:20:25', '2021-11-19 09:20:25'),
(1129, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:20:43', '2021-11-19 09:20:43'),
(1130, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:21:43', '2021-11-19 09:21:43'),
(1131, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:21:56', '2021-11-19 09:21:56'),
(1132, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:23:27', '2021-11-19 09:23:27'),
(1133, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:23:37', '2021-11-19 09:23:37'),
(1134, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:23:57', '2021-11-19 09:23:57'),
(1135, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:24:05', '2021-11-19 09:24:05'),
(1136, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:26:10', '2021-11-19 09:26:10'),
(1137, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:26:33', '2021-11-19 09:26:33'),
(1138, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:26:40', '2021-11-19 09:26:40'),
(1139, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:26:52', '2021-11-19 09:26:52'),
(1140, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:27:03', '2021-11-19 09:27:03'),
(1141, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:28:32', '2021-11-19 09:28:32'),
(1142, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:28:40', '2021-11-19 09:28:40'),
(1143, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:29:01', '2021-11-19 09:29:01'),
(1144, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:43:05', '2021-11-19 09:43:05'),
(1145, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:54:53', '2021-11-19 09:54:53'),
(1146, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:57:50', '2021-11-19 09:57:50'),
(1147, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:57:53', '2021-11-19 09:57:53'),
(1148, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:57:59', '2021-11-19 09:57:59'),
(1149, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:58:14', '2021-11-19 09:58:14'),
(1150, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 09:59:41', '2021-11-19 09:59:41'),
(1151, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:01:14', '2021-11-19 10:01:14'),
(1152, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:01:47', '2021-11-19 10:01:47'),
(1153, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:02:37', '2021-11-19 10:02:37'),
(1154, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:03:09', '2021-11-19 10:03:09'),
(1155, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:04:55', '2021-11-19 10:04:55'),
(1156, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:29:38', '2021-11-19 10:29:38'),
(1157, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 10:40:06', '2021-11-19 10:40:06'),
(1158, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 11:38:51', '2021-11-19 11:38:51'),
(1159, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 11:59:20', '2021-11-19 11:59:20'),
(1160, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-19 13:47:19', '2021-11-19 13:47:19'),
(1161, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-24 04:14:37', '2021-11-24 04:14:37'),
(1162, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-24 04:18:32', '2021-11-24 04:18:32'),
(1163, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-24 07:04:05', '2021-11-24 07:04:05'),
(1164, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-24 07:05:56', '2021-11-24 07:05:56'),
(1165, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:18:43', '2021-11-25 08:18:43'),
(1166, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:18:43', '2021-11-25 08:18:43'),
(1167, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:46:54', '2021-11-25 08:46:54');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(1168, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:46:55', '2021-11-25 08:46:55'),
(1169, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:49:32', '2021-11-25 08:49:32'),
(1170, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:50:40', '2021-11-25 08:50:40'),
(1171, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:50:45', '2021-11-25 08:50:45'),
(1172, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 08:51:26', '2021-11-25 08:51:26'),
(1173, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:41:41', '2021-11-25 10:41:41'),
(1174, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:41:53', '2021-11-25 10:41:53'),
(1175, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:42:28', '2021-11-25 10:42:28'),
(1176, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:48:39', '2021-11-25 10:48:39'),
(1177, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:49:08', '2021-11-25 10:49:08'),
(1178, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:49:23', '2021-11-25 10:49:23'),
(1179, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:49:30', '2021-11-25 10:49:30'),
(1180, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:50:19', '2021-11-25 10:50:19'),
(1181, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:50:25', '2021-11-25 10:50:25'),
(1182, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:50:59', '2021-11-25 10:50:59'),
(1183, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:51:06', '2021-11-25 10:51:06'),
(1184, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:52:04', '2021-11-25 10:52:04'),
(1185, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:52:09', '2021-11-25 10:52:09'),
(1186, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:52:42', '2021-11-25 10:52:42'),
(1187, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:52:58', '2021-11-25 10:52:58'),
(1188, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:53:03', '2021-11-25 10:53:03'),
(1189, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:53:32', '2021-11-25 10:53:32'),
(1190, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:53:36', '2021-11-25 10:53:36'),
(1191, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:53:54', '2021-11-25 10:53:54'),
(1192, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-25 10:54:01', '2021-11-25 10:54:01'),
(1193, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '32', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-26 11:15:40', '2021-11-26 11:15:40'),
(1194, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '32', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-26 11:15:40', '2021-11-26 11:15:40'),
(1195, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-26 11:22:38', '2021-11-26 11:22:38'),
(1196, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 03:45:28', '2021-11-29 03:45:28'),
(1197, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 03:45:28', '2021-11-29 03:45:28'),
(1198, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:29:25', '2021-11-29 04:29:25'),
(1199, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:29:25', '2021-11-29 04:29:25'),
(1200, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:30:12', '2021-11-29 04:30:12'),
(1201, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:30:24', '2021-11-29 04:30:24'),
(1202, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:31:12', '2021-11-29 04:31:12'),
(1203, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:31:25', '2021-11-29 04:31:25'),
(1204, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:31:38', '2021-11-29 04:31:38'),
(1205, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:32:50', '2021-11-29 04:32:50'),
(1206, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:33:09', '2021-11-29 04:33:09'),
(1207, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:33:24', '2021-11-29 04:33:24'),
(1208, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:55:01', '2021-11-29 04:55:01'),
(1209, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:55:19', '2021-11-29 04:55:19'),
(1210, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:55:26', '2021-11-29 04:55:26'),
(1211, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 04:57:13', '2021-11-29 04:57:13'),
(1212, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:23:46', '2021-11-29 05:23:46'),
(1213, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:23:59', '2021-11-29 05:23:59'),
(1214, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:24:11', '2021-11-29 05:24:11'),
(1215, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:42:43', '2021-11-29 05:42:43'),
(1216, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:43:02', '2021-11-29 05:43:02'),
(1217, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:43:17', '2021-11-29 05:43:17'),
(1218, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:48:21', '2021-11-29 05:48:21'),
(1219, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:50:18', '2021-11-29 05:50:18'),
(1220, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 05:50:45', '2021-11-29 05:50:45'),
(1221, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 06:38:20', '2021-11-29 06:38:20'),
(1222, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 06:38:26', '2021-11-29 06:38:26'),
(1223, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-11-29 06:39:12', '2021-11-29 06:39:12'),
(1224, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:05:11', '2021-12-02 04:05:11'),
(1225, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:05:11', '2021-12-02 04:05:11'),
(1226, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:36:40', '2021-12-02 04:36:40'),
(1227, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:36:49', '2021-12-02 04:36:49'),
(1228, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:37:10', '2021-12-02 04:37:10'),
(1229, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:38:52', '2021-12-02 04:38:52'),
(1230, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 04:38:58', '2021-12-02 04:38:58'),
(1231, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:31:33', '2021-12-02 05:31:33'),
(1232, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:32:42', '2021-12-02 05:32:42'),
(1233, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:33:18', '2021-12-02 05:33:18'),
(1234, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:33:26', '2021-12-02 05:33:26'),
(1235, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:37:20', '2021-12-02 05:37:20'),
(1236, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:38:06', '2021-12-02 05:38:06'),
(1237, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:39:13', '2021-12-02 05:39:13'),
(1238, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 05:41:25', '2021-12-02 05:41:25'),
(1239, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:02:52', '2021-12-02 06:02:52'),
(1240, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:05:39', '2021-12-02 06:05:39'),
(1241, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:05:43', '2021-12-02 06:05:43'),
(1242, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:05:47', '2021-12-02 06:05:47'),
(1243, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:05:58', '2021-12-02 06:05:58'),
(1244, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:54:36', '2021-12-02 06:54:36'),
(1245, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:54:57', '2021-12-02 06:54:57'),
(1246, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:55:04', '2021-12-02 06:55:04'),
(1247, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:55:15', '2021-12-02 06:55:15'),
(1248, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 06:57:18', '2021-12-02 06:57:18'),
(1249, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:20:09', '2021-12-02 08:20:09'),
(1250, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:32:43', '2021-12-02 08:32:43'),
(1251, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:33:07', '2021-12-02 08:33:07'),
(1252, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:34:05', '2021-12-02 08:34:05'),
(1253, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:37:47', '2021-12-02 08:37:47'),
(1254, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:41:47', '2021-12-02 08:41:47'),
(1255, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:41:47', '2021-12-02 08:41:47'),
(1256, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:43:32', '2021-12-02 08:43:32'),
(1257, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:43:56', '2021-12-02 08:43:56'),
(1258, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:44:06', '2021-12-02 08:44:06'),
(1259, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:45:01', '2021-12-02 08:45:01'),
(1260, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:45:04', '2021-12-02 08:45:04'),
(1261, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:45:11', '2021-12-02 08:45:11'),
(1262, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:53:01', '2021-12-02 08:53:01'),
(1263, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:53:06', '2021-12-02 08:53:06'),
(1264, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:53:11', '2021-12-02 08:53:11'),
(1265, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 08:53:19', '2021-12-02 08:53:19'),
(1266, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:02:27', '2021-12-02 09:02:27'),
(1267, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:02:27', '2021-12-02 09:02:27'),
(1268, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:22:31', '2021-12-02 09:22:31'),
(1269, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:28:55', '2021-12-02 09:28:55'),
(1270, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:31:01', '2021-12-02 09:31:01'),
(1271, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:33:55', '2021-12-02 09:33:55'),
(1272, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:34:50', '2021-12-02 09:34:50'),
(1273, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:38:21', '2021-12-02 09:38:21'),
(1274, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:52:54', '2021-12-02 09:52:54'),
(1275, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:57:50', '2021-12-02 09:57:50'),
(1276, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:57:56', '2021-12-02 09:57:56'),
(1277, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:58:03', '2021-12-02 09:58:03'),
(1278, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:58:59', '2021-12-02 09:58:59'),
(1279, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:59:02', '2021-12-02 09:59:02'),
(1280, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 09:59:08', '2021-12-02 09:59:08'),
(1281, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:02:45', '2021-12-02 10:02:45'),
(1282, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:03:39', '2021-12-02 10:03:39'),
(1283, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:04:48', '2021-12-02 10:04:48'),
(1284, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:12:56', '2021-12-02 10:12:56'),
(1285, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:24:36', '2021-12-02 10:24:36'),
(1286, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:34:44', '2021-12-02 10:34:44'),
(1287, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:34:48', '2021-12-02 10:34:48'),
(1288, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:34:53', '2021-12-02 10:34:53'),
(1289, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:47:16', '2021-12-02 10:47:16'),
(1290, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 10:59:51', '2021-12-02 10:59:51'),
(1291, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:07:41', '2021-12-02 11:07:41'),
(1292, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:07:45', '2021-12-02 11:07:45'),
(1293, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:24:43', '2021-12-02 11:24:43'),
(1294, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:24:43', '2021-12-02 11:24:43'),
(1295, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:24:43', '2021-12-02 11:24:43'),
(1296, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:28:18', '2021-12-02 11:28:18'),
(1297, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:28:23', '2021-12-02 11:28:23'),
(1298, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 11:31:29', '2021-12-02 11:31:29'),
(1299, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:15:00', '2021-12-02 14:15:00'),
(1300, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:17:14', '2021-12-02 14:17:14'),
(1301, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:18:31', '2021-12-02 14:18:31'),
(1302, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:18:31', '2021-12-02 14:18:31'),
(1303, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:18:41', '2021-12-02 14:18:41'),
(1304, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:22:55', '2021-12-02 14:22:55'),
(1305, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:22:55', '2021-12-02 14:22:55'),
(1306, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:23:46', '2021-12-02 14:23:46'),
(1307, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:28:02', '2021-12-02 14:28:02'),
(1308, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:34:49', '2021-12-02 14:34:49'),
(1309, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:35:02', '2021-12-02 14:35:02'),
(1310, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 14:35:14', '2021-12-02 14:35:14'),
(1311, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:04:44', '2021-12-02 15:04:44'),
(1312, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:05:14', '2021-12-02 15:05:14'),
(1313, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:05:19', '2021-12-02 15:05:19'),
(1314, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:13:18', '2021-12-02 15:13:18'),
(1315, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:15:05', '2021-12-02 15:15:05'),
(1316, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:15:09', '2021-12-02 15:15:09'),
(1317, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:15:15', '2021-12-02 15:15:15'),
(1318, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:31:55', '2021-12-02 15:31:55'),
(1319, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-02 15:36:34', '2021-12-02 15:36:34'),
(1320, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:08:54', '2021-12-03 03:08:54'),
(1321, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:08:54', '2021-12-03 03:08:54'),
(1322, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:12:56', '2021-12-03 03:12:56'),
(1323, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:16:28', '2021-12-03 03:16:28'),
(1324, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:21:00', '2021-12-03 03:21:00'),
(1325, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:22:15', '2021-12-03 03:22:15'),
(1326, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:22:39', '2021-12-03 03:22:39'),
(1327, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:29:23', '2021-12-03 03:29:23'),
(1328, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:32:35', '2021-12-03 03:32:35'),
(1329, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:35:45', '2021-12-03 03:35:45'),
(1330, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:38:01', '2021-12-03 03:38:01'),
(1331, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:39:17', '2021-12-03 03:39:17'),
(1332, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:40:52', '2021-12-03 03:40:52'),
(1333, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:43:12', '2021-12-03 03:43:12'),
(1334, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:45:04', '2021-12-03 03:45:04'),
(1335, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:46:15', '2021-12-03 03:46:15'),
(1336, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:47:28', '2021-12-03 03:47:28'),
(1337, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:50:03', '2021-12-03 03:50:03'),
(1338, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:51:50', '2021-12-03 03:51:50'),
(1339, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:53:05', '2021-12-03 03:53:05'),
(1340, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:55:43', '2021-12-03 03:55:43'),
(1341, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:56:59', '2021-12-03 03:56:59'),
(1342, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:57:12', '2021-12-03 03:57:12'),
(1343, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 03:57:55', '2021-12-03 03:57:55'),
(1344, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 04:13:24', '2021-12-03 04:13:24'),
(1345, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 04:13:58', '2021-12-03 04:13:58'),
(1346, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 04:19:29', '2021-12-03 04:19:29'),
(1347, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 04:35:23', '2021-12-03 04:35:23'),
(1348, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 04:48:43', '2021-12-03 04:48:43'),
(1349, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:34:25', '2021-12-03 05:34:25'),
(1350, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:35:40', '2021-12-03 05:35:40'),
(1351, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:38:18', '2021-12-03 05:38:18'),
(1352, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:39:52', '2021-12-03 05:39:52'),
(1353, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:40:55', '2021-12-03 05:40:55'),
(1354, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:41:49', '2021-12-03 05:41:49'),
(1355, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 05:42:55', '2021-12-03 05:42:55'),
(1356, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:00:14', '2021-12-03 06:00:14'),
(1357, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:02:08', '2021-12-03 06:02:08'),
(1358, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:21:37', '2021-12-03 06:21:37'),
(1359, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:25:27', '2021-12-03 06:25:27'),
(1360, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:27:32', '2021-12-03 06:27:32'),
(1361, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:27:35', '2021-12-03 06:27:35'),
(1362, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:27:39', '2021-12-03 06:27:39'),
(1363, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:29:47', '2021-12-03 06:29:47'),
(1364, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:29:50', '2021-12-03 06:29:50'),
(1365, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:32:14', '2021-12-03 06:32:14'),
(1366, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:46:48', '2021-12-03 06:46:48'),
(1367, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:48:29', '2021-12-03 06:48:29'),
(1368, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 06:53:34', '2021-12-03 06:53:34'),
(1369, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:03:09', '2021-12-03 07:03:09'),
(1370, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:08:11', '2021-12-03 07:08:11'),
(1371, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:08:35', '2021-12-03 07:08:35'),
(1372, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:09:38', '2021-12-03 07:09:38'),
(1373, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:10:32', '2021-12-03 07:10:32'),
(1374, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:11:34', '2021-12-03 07:11:34'),
(1375, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:12:07', '2021-12-03 07:12:07'),
(1376, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:14:47', '2021-12-03 07:14:47'),
(1377, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 07:16:31', '2021-12-03 07:16:31'),
(1378, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:43:48', '2021-12-03 08:43:48'),
(1379, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:44:22', '2021-12-03 08:44:22'),
(1380, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:45:02', '2021-12-03 08:45:02'),
(1381, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:47:50', '2021-12-03 08:47:50'),
(1382, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:48:02', '2021-12-03 08:48:02'),
(1383, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:50:45', '2021-12-03 08:50:45'),
(1384, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:51:49', '2021-12-03 08:51:49'),
(1385, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:53:33', '2021-12-03 08:53:33'),
(1386, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:55:06', '2021-12-03 08:55:06'),
(1387, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:56:03', '2021-12-03 08:56:03'),
(1388, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:56:46', '2021-12-03 08:56:46'),
(1389, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:58:24', '2021-12-03 08:58:24'),
(1390, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:59:34', '2021-12-03 08:59:34'),
(1391, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 08:59:42', '2021-12-03 08:59:42'),
(1392, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:01:01', '2021-12-03 09:01:01'),
(1393, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:01:22', '2021-12-03 09:01:22'),
(1394, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:01:55', '2021-12-03 09:01:55'),
(1395, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:04:25', '2021-12-03 09:04:25'),
(1396, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:05:40', '2021-12-03 09:05:40'),
(1397, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:06:12', '2021-12-03 09:06:12'),
(1398, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:07:08', '2021-12-03 09:07:08'),
(1399, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:26:49', '2021-12-03 09:26:49'),
(1400, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:27:36', '2021-12-03 09:27:36'),
(1401, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:28:37', '2021-12-03 09:28:37'),
(1402, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:29:22', '2021-12-03 09:29:22'),
(1403, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:30:03', '2021-12-03 09:30:03'),
(1404, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:34:45', '2021-12-03 09:34:45'),
(1405, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:48:05', '2021-12-03 09:48:05'),
(1406, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:48:11', '2021-12-03 09:48:11'),
(1407, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:59:20', '2021-12-03 09:59:20'),
(1408, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:59:39', '2021-12-03 09:59:39'),
(1409, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 09:59:44', '2021-12-03 09:59:44'),
(1410, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 10:00:47', '2021-12-03 10:00:47'),
(1411, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 10:00:50', '2021-12-03 10:00:50'),
(1412, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 10:01:52', '2021-12-03 10:01:52'),
(1413, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 10:10:08', '2021-12-03 10:10:08'),
(1414, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:02:54', '2021-12-03 11:02:54'),
(1415, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:04:05', '2021-12-03 11:04:05'),
(1416, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:05:58', '2021-12-03 11:05:58'),
(1417, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:46:52', '2021-12-03 11:46:52'),
(1418, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:47:10', '2021-12-03 11:47:10'),
(1419, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:47:57', '2021-12-03 11:47:57'),
(1420, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:48:02', '2021-12-03 11:48:02'),
(1421, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 11:48:12', '2021-12-03 11:48:12'),
(1422, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 12:08:53', '2021-12-03 12:08:53'),
(1423, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 14:48:56', '2021-12-03 14:48:56'),
(1424, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 14:48:56', '2021-12-03 14:48:56'),
(1425, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 14:50:20', '2021-12-03 14:50:20'),
(1426, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 15:23:40', '2021-12-03 15:23:40'),
(1427, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 15:23:47', '2021-12-03 15:23:47'),
(1428, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 15:23:56', '2021-12-03 15:23:56'),
(1429, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:06:20', '2021-12-03 16:06:20'),
(1430, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:18:17', '2021-12-03 16:18:17'),
(1431, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:22:09', '2021-12-03 16:22:09'),
(1432, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:22:32', '2021-12-03 16:22:32'),
(1433, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:22:35', '2021-12-03 16:22:35'),
(1434, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:22:40', '2021-12-03 16:22:40'),
(1435, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:23:12', '2021-12-03 16:23:12'),
(1436, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:24:00', '2021-12-03 16:24:00'),
(1437, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 16:24:03', '2021-12-03 16:24:03'),
(1438, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:00:36', '2021-12-03 17:00:36'),
(1439, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:00:56', '2021-12-03 17:00:56'),
(1440, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:01:03', '2021-12-03 17:01:03'),
(1441, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:11:05', '2021-12-03 17:11:05'),
(1442, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:13:21', '2021-12-03 17:13:21'),
(1443, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:13:57', '2021-12-03 17:13:57'),
(1444, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '5', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:21:35', '2021-12-03 17:21:35'),
(1445, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:23:19', '2021-12-03 17:23:19'),
(1446, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:24:44', '2021-12-03 17:24:44'),
(1447, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:24:48', '2021-12-03 17:24:48'),
(1448, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:24:51', '2021-12-03 17:24:51'),
(1449, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:48:24', '2021-12-03 17:48:24'),
(1450, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:49:38', '2021-12-03 17:49:38'),
(1451, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:50:56', '2021-12-03 17:50:56'),
(1452, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 17:53:13', '2021-12-03 17:53:13'),
(1453, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 18:51:27', '2021-12-03 18:51:27'),
(1454, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 18:51:38', '2021-12-03 18:51:38'),
(1455, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 18:51:42', '2021-12-03 18:51:42'),
(1456, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 18:53:51', '2021-12-03 18:53:51'),
(1457, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 18:57:57', '2021-12-03 18:57:57'),
(1458, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 18:58:52', '2021-12-03 18:58:52'),
(1459, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:01:21', '2021-12-03 19:01:21'),
(1460, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:04:46', '2021-12-03 19:04:46'),
(1461, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:10:40', '2021-12-03 19:10:40'),
(1462, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:11:32', '2021-12-03 19:11:32');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(1463, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:15:06', '2021-12-03 19:15:06'),
(1464, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:22:45', '2021-12-03 19:22:45'),
(1465, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:23:56', '2021-12-03 19:23:56'),
(1466, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:28:37', '2021-12-03 19:28:37'),
(1467, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-03 19:29:48', '2021-12-03 19:29:48'),
(1468, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:02:11', '2021-12-04 13:02:11'),
(1469, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:02:43', '2021-12-04 13:02:43'),
(1470, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:21:24', '2021-12-04 13:21:24'),
(1471, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:21:31', '2021-12-04 13:21:31'),
(1472, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:21:36', '2021-12-04 13:21:36'),
(1473, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:22:25', '2021-12-04 13:22:25'),
(1474, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:23:52', '2021-12-04 13:23:52'),
(1475, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:25:11', '2021-12-04 13:25:11'),
(1476, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:28:04', '2021-12-04 13:28:04'),
(1477, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:54:23', '2021-12-04 13:54:23'),
(1478, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:54:23', '2021-12-04 13:54:23'),
(1479, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:54:42', '2021-12-04 13:54:42'),
(1480, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-04 13:54:47', '2021-12-04 13:54:47'),
(1481, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 03:29:51', '2021-12-06 03:29:51'),
(1482, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 03:29:51', '2021-12-06 03:29:51'),
(1483, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 03:30:24', '2021-12-06 03:30:24'),
(1484, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:05:30', '2021-12-06 10:05:30'),
(1485, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:05:30', '2021-12-06 10:05:30'),
(1486, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:20:20', '2021-12-06 10:20:20'),
(1487, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:35:25', '2021-12-06 10:35:25'),
(1488, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:36:28', '2021-12-06 10:36:28'),
(1489, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:42:17', '2021-12-06 10:42:17'),
(1490, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:42:41', '2021-12-06 10:42:41'),
(1491, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:43:15', '2021-12-06 10:43:15'),
(1492, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:49:29', '2021-12-06 10:49:29'),
(1493, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 10:53:33', '2021-12-06 10:53:33'),
(1494, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 11:14:39', '2021-12-06 11:14:39'),
(1495, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 11:14:43', '2021-12-06 11:14:43'),
(1496, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-06 11:15:23', '2021-12-06 11:15:23'),
(1497, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 03:15:34', '2021-12-07 03:15:34'),
(1498, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 03:15:34', '2021-12-07 03:15:34'),
(1499, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 03:47:59', '2021-12-07 03:47:59'),
(1500, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 04:25:46', '2021-12-07 04:25:46'),
(1501, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 04:26:05', '2021-12-07 04:26:05'),
(1502, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 04:26:13', '2021-12-07 04:26:13'),
(1503, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 04:26:28', '2021-12-07 04:26:28'),
(1504, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 04:57:43', '2021-12-07 04:57:43'),
(1505, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:46:08', '2021-12-07 10:46:08'),
(1506, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:46:18', '2021-12-07 10:46:18'),
(1507, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:46:25', '2021-12-07 10:46:25'),
(1508, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:50:34', '2021-12-07 10:50:34'),
(1509, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:50:37', '2021-12-07 10:50:37'),
(1510, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:50:40', '2021-12-07 10:50:40'),
(1511, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:51:46', '2021-12-07 10:51:46'),
(1512, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:54:58', '2021-12-07 10:54:58'),
(1513, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:55:31', '2021-12-07 10:55:31'),
(1514, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:55:35', '2021-12-07 10:55:35'),
(1515, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:56:15', '2021-12-07 10:56:15'),
(1516, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 10:56:57', '2021-12-07 10:56:57'),
(1517, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 11:02:31', '2021-12-07 11:02:31'),
(1518, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 11:02:34', '2021-12-07 11:02:34'),
(1519, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 11:02:37', '2021-12-07 11:02:37'),
(1520, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 11:02:44', '2021-12-07 11:02:44'),
(1521, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 11:04:22', '2021-12-07 11:04:22'),
(1522, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-07 11:05:13', '2021-12-07 11:05:13'),
(1523, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-08 08:15:15', '2021-12-08 08:15:15'),
(1524, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-08 08:17:51', '2021-12-08 08:17:51'),
(1525, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-08 08:18:18', '2021-12-08 08:18:18'),
(1526, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-09 08:20:45', '2021-12-09 08:20:45'),
(1527, '127.0.0.1', 'Chrome (96.0.4664.45)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-09 08:20:45', '2021-12-09 08:20:45'),
(1528, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 03:29:55', '2021-12-14 03:29:55'),
(1529, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 03:29:55', '2021-12-14 03:29:55'),
(1530, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 03:57:52', '2021-12-14 03:57:52'),
(1531, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 04:18:23', '2021-12-14 04:18:23'),
(1532, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 04:30:04', '2021-12-14 04:30:04'),
(1533, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 04:30:22', '2021-12-14 04:30:22'),
(1534, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 04:36:26', '2021-12-14 04:36:26'),
(1535, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 04:37:12', '2021-12-14 04:37:12'),
(1536, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 04:49:33', '2021-12-14 04:49:33'),
(1537, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:05:03', '2021-12-14 05:05:03'),
(1538, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:07:48', '2021-12-14 05:07:48'),
(1539, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:08:06', '2021-12-14 05:08:06'),
(1540, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:13:07', '2021-12-14 05:13:07'),
(1541, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:21:41', '2021-12-14 05:21:41'),
(1542, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:29:35', '2021-12-14 05:29:35'),
(1543, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:41:38', '2021-12-14 05:41:38'),
(1544, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:56:56', '2021-12-14 05:56:56'),
(1545, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 05:57:14', '2021-12-14 05:57:14'),
(1546, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '46', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 06:26:23', '2021-12-14 06:26:23'),
(1547, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 06:26:43', '2021-12-14 06:26:43'),
(1548, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 06:46:19', '2021-12-14 06:46:19'),
(1549, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 06:46:28', '2021-12-14 06:46:28'),
(1550, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 07:21:39', '2021-12-14 07:21:39'),
(1551, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 07:23:22', '2021-12-14 07:23:22'),
(1552, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 07:23:26', '2021-12-14 07:23:26'),
(1553, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:15:24', '2021-12-14 08:15:24'),
(1554, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:33:59', '2021-12-14 08:33:59'),
(1555, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:34:06', '2021-12-14 08:34:06'),
(1556, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:40:20', '2021-12-14 08:40:20'),
(1557, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:40:25', '2021-12-14 08:40:25'),
(1558, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:41:26', '2021-12-14 08:41:26'),
(1559, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:42:02', '2021-12-14 08:42:02'),
(1560, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:43:08', '2021-12-14 08:43:08'),
(1561, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:43:43', '2021-12-14 08:43:43'),
(1562, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 08:49:16', '2021-12-14 08:49:16'),
(1563, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:00:11', '2021-12-14 09:00:11'),
(1564, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:04:44', '2021-12-14 09:04:44'),
(1565, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:30:46', '2021-12-14 09:30:46'),
(1566, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:34:06', '2021-12-14 09:34:06'),
(1567, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:35:24', '2021-12-14 09:35:24'),
(1568, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:35:31', '2021-12-14 09:35:31'),
(1569, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:41:30', '2021-12-14 09:41:30'),
(1570, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:41:34', '2021-12-14 09:41:34'),
(1571, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:41:43', '2021-12-14 09:41:43'),
(1572, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 09:43:34', '2021-12-14 09:43:34'),
(1573, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:00:59', '2021-12-14 10:00:59'),
(1574, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:02:26', '2021-12-14 10:02:26'),
(1575, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:02:36', '2021-12-14 10:02:36'),
(1576, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:06:21', '2021-12-14 10:06:21'),
(1577, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:09:08', '2021-12-14 10:09:08'),
(1578, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:09:27', '2021-12-14 10:09:27'),
(1579, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:19:56', '2021-12-14 10:19:56'),
(1580, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:29:13', '2021-12-14 10:29:13'),
(1581, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:33:39', '2021-12-14 10:33:39'),
(1582, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:39:39', '2021-12-14 10:39:39'),
(1583, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:40:41', '2021-12-14 10:40:41'),
(1584, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:40:47', '2021-12-14 10:40:47'),
(1585, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:41:49', '2021-12-14 10:41:49'),
(1586, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:42:53', '2021-12-14 10:42:53'),
(1587, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:43:42', '2021-12-14 10:43:42'),
(1588, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:43:47', '2021-12-14 10:43:47'),
(1589, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:44:56', '2021-12-14 10:44:56'),
(1590, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:45:08', '2021-12-14 10:45:08'),
(1591, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:45:12', '2021-12-14 10:45:12'),
(1592, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:46:54', '2021-12-14 10:46:54'),
(1593, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:49:36', '2021-12-14 10:49:36'),
(1594, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:49:42', '2021-12-14 10:49:42'),
(1595, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:49:59', '2021-12-14 10:49:59'),
(1596, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:50:03', '2021-12-14 10:50:03'),
(1597, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:51:39', '2021-12-14 10:51:39'),
(1598, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:51:58', '2021-12-14 10:51:58'),
(1599, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:52:08', '2021-12-14 10:52:08'),
(1600, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:52:34', '2021-12-14 10:52:34'),
(1601, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:52:52', '2021-12-14 10:52:52'),
(1602, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:53:25', '2021-12-14 10:53:25'),
(1603, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:54:11', '2021-12-14 10:54:11'),
(1604, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:54:21', '2021-12-14 10:54:21'),
(1605, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:55:39', '2021-12-14 10:55:39'),
(1606, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:55:41', '2021-12-14 10:55:41'),
(1607, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:56:30', '2021-12-14 10:56:30'),
(1608, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:57:21', '2021-12-14 10:57:21'),
(1609, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:57:31', '2021-12-14 10:57:31'),
(1610, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:58:12', '2021-12-14 10:58:12'),
(1611, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 10:58:43', '2021-12-14 10:58:43'),
(1612, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 11:00:05', '2021-12-14 11:00:05'),
(1613, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 11:00:53', '2021-12-14 11:00:53'),
(1614, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 11:17:02', '2021-12-14 11:17:02'),
(1615, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 11:18:06', '2021-12-14 11:18:06'),
(1616, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 11:31:11', '2021-12-14 11:31:11'),
(1617, '127.0.0.1', 'Chrome (96.0.4664.93)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-14 11:32:31', '2021-12-14 11:32:31'),
(1618, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 03:43:00', '2021-12-15 03:43:00'),
(1619, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 03:43:00', '2021-12-15 03:43:00'),
(1620, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 03:55:57', '2021-12-15 03:55:57'),
(1621, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 04:48:21', '2021-12-15 04:48:21'),
(1622, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:01:48', '2021-12-15 05:01:48'),
(1623, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:29:33', '2021-12-15 05:29:33'),
(1624, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:31:08', '2021-12-15 05:31:08'),
(1625, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:32:26', '2021-12-15 05:32:26'),
(1626, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:33:27', '2021-12-15 05:33:27'),
(1627, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:33:37', '2021-12-15 05:33:37'),
(1628, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:48:13', '2021-12-15 05:48:13'),
(1629, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:48:47', '2021-12-15 05:48:47'),
(1630, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:49:01', '2021-12-15 05:49:01'),
(1631, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:49:19', '2021-12-15 05:49:19'),
(1632, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:49:25', '2021-12-15 05:49:25'),
(1633, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:51:05', '2021-12-15 05:51:05'),
(1634, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:51:37', '2021-12-15 05:51:37'),
(1635, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:52:06', '2021-12-15 05:52:06'),
(1636, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:52:34', '2021-12-15 05:52:34'),
(1637, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:52:56', '2021-12-15 05:52:56'),
(1638, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:57:57', '2021-12-15 05:57:57'),
(1639, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 05:58:19', '2021-12-15 05:58:19'),
(1640, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:02:12', '2021-12-15 06:02:12'),
(1641, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:09:13', '2021-12-15 06:09:13'),
(1642, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:09:24', '2021-12-15 06:09:24'),
(1643, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:11:38', '2021-12-15 06:11:38'),
(1644, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:12:09', '2021-12-15 06:12:09'),
(1645, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:12:28', '2021-12-15 06:12:28'),
(1646, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:12:44', '2021-12-15 06:12:44'),
(1647, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:12:48', '2021-12-15 06:12:48'),
(1648, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:13:25', '2021-12-15 06:13:25'),
(1649, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:14:00', '2021-12-15 06:14:00'),
(1650, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:14:26', '2021-12-15 06:14:26'),
(1651, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:14:32', '2021-12-15 06:14:32'),
(1652, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:14:38', '2021-12-15 06:14:38'),
(1653, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:14:49', '2021-12-15 06:14:49'),
(1654, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:15:06', '2021-12-15 06:15:06'),
(1655, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:15:15', '2021-12-15 06:15:15'),
(1656, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:15:28', '2021-12-15 06:15:28'),
(1657, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:15:51', '2021-12-15 06:15:51'),
(1658, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:16:22', '2021-12-15 06:16:22'),
(1659, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:17:12', '2021-12-15 06:17:12'),
(1660, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:17:26', '2021-12-15 06:17:26'),
(1661, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:17:37', '2021-12-15 06:17:37'),
(1662, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '35', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:18:29', '2021-12-15 06:18:29'),
(1663, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 06:29:42', '2021-12-15 06:29:42'),
(1664, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 07:10:31', '2021-12-15 07:10:31'),
(1665, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 07:11:10', '2021-12-15 07:11:10'),
(1666, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:10:06', '2021-12-15 08:10:06'),
(1667, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:10:55', '2021-12-15 08:10:55'),
(1668, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:13:45', '2021-12-15 08:13:45'),
(1669, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:14:10', '2021-12-15 08:14:10'),
(1670, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:14:32', '2021-12-15 08:14:32'),
(1671, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '36', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:32:19', '2021-12-15 08:32:19'),
(1672, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:32:24', '2021-12-15 08:32:24'),
(1673, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:44:11', '2021-12-15 08:44:11'),
(1674, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 08:51:18', '2021-12-15 08:51:18'),
(1675, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 09:45:15', '2021-12-15 09:45:15'),
(1676, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:12:34', '2021-12-15 10:12:34'),
(1677, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:30:07', '2021-12-15 10:30:07'),
(1678, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:30:21', '2021-12-15 10:30:21'),
(1679, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:30:30', '2021-12-15 10:30:30'),
(1680, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:34:09', '2021-12-15 10:34:09'),
(1681, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:43:52', '2021-12-15 10:43:52'),
(1682, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:43:54', '2021-12-15 10:43:54'),
(1683, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '38', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 10:43:59', '2021-12-15 10:43:59'),
(1684, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 11:52:17', '2021-12-15 11:52:17'),
(1685, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 11:55:14', '2021-12-15 11:55:14'),
(1686, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-15 11:56:24', '2021-12-15 11:56:24'),
(1687, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:42:25', '2021-12-16 03:42:25'),
(1688, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:45:01', '2021-12-16 03:45:01'),
(1689, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:50:03', '2021-12-16 03:50:03'),
(1690, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:56:11', '2021-12-16 03:56:11'),
(1691, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:56:53', '2021-12-16 03:56:53'),
(1692, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:58:18', '2021-12-16 03:58:18'),
(1693, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-16 03:58:46', '2021-12-16 03:58:46'),
(1694, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-17 06:47:42', '2021-12-17 06:47:42'),
(1695, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-17 06:47:42', '2021-12-17 06:47:42'),
(1696, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 04:49:20', '2021-12-20 04:49:20'),
(1697, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 04:49:20', '2021-12-20 04:49:20'),
(1698, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 04:53:33', '2021-12-20 04:53:33'),
(1699, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 05:00:20', '2021-12-20 05:00:20'),
(1700, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 09:41:11', '2021-12-20 09:41:11'),
(1701, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '33', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 09:41:11', '2021-12-20 09:41:11'),
(1702, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-20 09:43:21', '2021-12-20 09:43:21'),
(1703, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:00:09', '2021-12-24 09:00:09'),
(1704, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:00:09', '2021-12-24 09:00:09'),
(1705, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:11:41', '2021-12-24 09:11:41'),
(1706, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:15:33', '2021-12-24 09:15:33'),
(1707, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:15:46', '2021-12-24 09:15:46'),
(1708, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:16:12', '2021-12-24 09:16:12'),
(1709, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:16:23', '2021-12-24 09:16:23'),
(1710, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:16:38', '2021-12-24 09:16:38'),
(1711, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:16:56', '2021-12-24 09:16:56'),
(1712, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:21:28', '2021-12-24 09:21:28'),
(1713, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-24 09:21:48', '2021-12-24 09:21:48'),
(1714, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 03:48:27', '2021-12-27 03:48:27'),
(1715, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 03:55:24', '2021-12-27 03:55:24'),
(1716, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 04:00:18', '2021-12-27 04:00:18'),
(1717, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 04:20:15', '2021-12-27 04:20:15'),
(1718, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 04:20:22', '2021-12-27 04:20:22'),
(1719, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 04:20:28', '2021-12-27 04:20:28'),
(1720, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 04:23:59', '2021-12-27 04:23:59'),
(1721, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:19:03', '2021-12-27 05:19:03'),
(1722, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:19:29', '2021-12-27 05:19:29'),
(1723, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:20:39', '2021-12-27 05:20:39'),
(1724, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:48:16', '2021-12-27 05:48:16'),
(1725, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:50:28', '2021-12-27 05:50:28'),
(1726, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:53:30', '2021-12-27 05:53:30'),
(1727, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:54:52', '2021-12-27 05:54:52'),
(1728, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 05:58:44', '2021-12-27 05:58:44'),
(1729, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 06:00:33', '2021-12-27 06:00:33'),
(1730, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 06:54:06', '2021-12-27 06:54:06'),
(1731, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 07:10:33', '2021-12-27 07:10:33'),
(1732, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 07:44:39', '2021-12-27 07:44:39'),
(1733, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 07:44:39', '2021-12-27 07:44:39'),
(1734, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 07:44:51', '2021-12-27 07:44:51'),
(1735, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:00:12', '2021-12-27 08:00:12'),
(1736, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:06:35', '2021-12-27 08:06:35'),
(1737, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:46:13', '2021-12-27 08:46:13'),
(1738, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:46:23', '2021-12-27 08:46:23'),
(1739, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:46:34', '2021-12-27 08:46:34'),
(1740, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:46:37', '2021-12-27 08:46:37'),
(1741, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:47:36', '2021-12-27 08:47:36'),
(1742, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-27 08:49:02', '2021-12-27 08:49:02'),
(1743, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 03:45:07', '2021-12-28 03:45:07'),
(1744, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 03:47:17', '2021-12-28 03:47:17'),
(1745, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 03:47:25', '2021-12-28 03:47:25'),
(1746, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 03:48:06', '2021-12-28 03:48:06'),
(1747, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:09:09', '2021-12-28 04:09:09'),
(1748, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:34:41', '2021-12-28 04:34:41'),
(1749, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:37:48', '2021-12-28 04:37:48'),
(1750, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:43:12', '2021-12-28 04:43:12'),
(1751, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:43:47', '2021-12-28 04:43:47'),
(1752, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:43:55', '2021-12-28 04:43:55'),
(1753, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:44:03', '2021-12-28 04:44:03'),
(1754, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:50:43', '2021-12-28 04:50:43'),
(1755, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:50:55', '2021-12-28 04:50:55');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(1756, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:56:20', '2021-12-28 04:56:20'),
(1757, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:58:10', '2021-12-28 04:58:10'),
(1758, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 04:58:21', '2021-12-28 04:58:21'),
(1759, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:02:05', '2021-12-28 05:02:05'),
(1760, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:02:28', '2021-12-28 05:02:28'),
(1761, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:02:37', '2021-12-28 05:02:37'),
(1762, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:02:46', '2021-12-28 05:02:46'),
(1763, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:02:56', '2021-12-28 05:02:56'),
(1764, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:03:59', '2021-12-28 05:03:59'),
(1765, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:05:05', '2021-12-28 05:05:05'),
(1766, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:05:16', '2021-12-28 05:05:16'),
(1767, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:06:24', '2021-12-28 05:06:24'),
(1768, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:06:45', '2021-12-28 05:06:45'),
(1769, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:07:37', '2021-12-28 05:07:37'),
(1770, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:07:52', '2021-12-28 05:07:52'),
(1771, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:08:03', '2021-12-28 05:08:03'),
(1772, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:10:24', '2021-12-28 05:10:24'),
(1773, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:10:55', '2021-12-28 05:10:55'),
(1774, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:15:42', '2021-12-28 05:15:42'),
(1775, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:16:46', '2021-12-28 05:16:46'),
(1776, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:17:14', '2021-12-28 05:17:14'),
(1777, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:18:36', '2021-12-28 05:18:36'),
(1778, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:18:54', '2021-12-28 05:18:54'),
(1779, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:19:17', '2021-12-28 05:19:17'),
(1780, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:19:26', '2021-12-28 05:19:26'),
(1781, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:31:28', '2021-12-28 05:31:28'),
(1782, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:31:35', '2021-12-28 05:31:35'),
(1783, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:33:27', '2021-12-28 05:33:27'),
(1784, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:35:08', '2021-12-28 05:35:08'),
(1785, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:35:38', '2021-12-28 05:35:38'),
(1786, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:37:35', '2021-12-28 05:37:35'),
(1787, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:40:40', '2021-12-28 05:40:40'),
(1788, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:40:42', '2021-12-28 05:40:42'),
(1789, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:43:28', '2021-12-28 05:43:28'),
(1790, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:43:45', '2021-12-28 05:43:45'),
(1791, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:43:46', '2021-12-28 05:43:46'),
(1792, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:44:00', '2021-12-28 05:44:00'),
(1793, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:44:47', '2021-12-28 05:44:47'),
(1794, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:00', '2021-12-28 05:45:00'),
(1795, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:00', '2021-12-28 05:45:00'),
(1796, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:04', '2021-12-28 05:45:04'),
(1797, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:07', '2021-12-28 05:45:07'),
(1798, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:08', '2021-12-28 05:45:08'),
(1799, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:11', '2021-12-28 05:45:11'),
(1800, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:11', '2021-12-28 05:45:11'),
(1801, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:32', '2021-12-28 05:45:32'),
(1802, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:49', '2021-12-28 05:45:49'),
(1803, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:45:50', '2021-12-28 05:45:50'),
(1804, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:46:01', '2021-12-28 05:46:01'),
(1805, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:46:01', '2021-12-28 05:46:01'),
(1806, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:46:08', '2021-12-28 05:46:08'),
(1807, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:48:03', '2021-12-28 05:48:03'),
(1808, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:48:21', '2021-12-28 05:48:21'),
(1809, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:48:22', '2021-12-28 05:48:22'),
(1810, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:48:50', '2021-12-28 05:48:50'),
(1811, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:02', '2021-12-28 05:49:02'),
(1812, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:04', '2021-12-28 05:49:04'),
(1813, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:05', '2021-12-28 05:49:05'),
(1814, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:06', '2021-12-28 05:49:06'),
(1815, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:07', '2021-12-28 05:49:07'),
(1816, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:12', '2021-12-28 05:49:12'),
(1817, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:13', '2021-12-28 05:49:13'),
(1818, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:16', '2021-12-28 05:49:16'),
(1819, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:16', '2021-12-28 05:49:16'),
(1820, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:20', '2021-12-28 05:49:20'),
(1821, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:21', '2021-12-28 05:49:21'),
(1822, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:24', '2021-12-28 05:49:24'),
(1823, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:25', '2021-12-28 05:49:25'),
(1824, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:28', '2021-12-28 05:49:28'),
(1825, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:30', '2021-12-28 05:49:30'),
(1826, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:31', '2021-12-28 05:49:31'),
(1827, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:31', '2021-12-28 05:49:31'),
(1828, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:32', '2021-12-28 05:49:32'),
(1829, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:33', '2021-12-28 05:49:33'),
(1830, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:34', '2021-12-28 05:49:34'),
(1831, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:34', '2021-12-28 05:49:34'),
(1832, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:35', '2021-12-28 05:49:35'),
(1833, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 05:49:36', '2021-12-28 05:49:36'),
(1834, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:03:16', '2021-12-28 06:03:16'),
(1835, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:05:10', '2021-12-28 06:05:10'),
(1836, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:08:51', '2021-12-28 06:08:51'),
(1837, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:08:58', '2021-12-28 06:08:58'),
(1838, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:08:59', '2021-12-28 06:08:59'),
(1839, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:08:59', '2021-12-28 06:08:59'),
(1840, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:09:00', '2021-12-28 06:09:00'),
(1841, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:09:02', '2021-12-28 06:09:02'),
(1842, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:09:05', '2021-12-28 06:09:05'),
(1843, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:10:16', '2021-12-28 06:10:16'),
(1844, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:10:19', '2021-12-28 06:10:19'),
(1845, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:23:17', '2021-12-28 06:23:17'),
(1846, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:25:08', '2021-12-28 06:25:08'),
(1847, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:30:38', '2021-12-28 06:30:38'),
(1848, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:30:56', '2021-12-28 06:30:56'),
(1849, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:30:56', '2021-12-28 06:30:56'),
(1850, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:31:00', '2021-12-28 06:31:00'),
(1851, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:31:02', '2021-12-28 06:31:02'),
(1852, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:31:12', '2021-12-28 06:31:12'),
(1853, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:31:49', '2021-12-28 06:31:49'),
(1854, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:31:58', '2021-12-28 06:31:58'),
(1855, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:32:09', '2021-12-28 06:32:09'),
(1856, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:42:39', '2021-12-28 06:42:39'),
(1857, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:42:46', '2021-12-28 06:42:46'),
(1858, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:47:48', '2021-12-28 06:47:48'),
(1859, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:47:55', '2021-12-28 06:47:55'),
(1860, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:57:29', '2021-12-28 06:57:29'),
(1861, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 06:59:12', '2021-12-28 06:59:12'),
(1862, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:01:44', '2021-12-28 07:01:44'),
(1863, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:07:16', '2021-12-28 07:07:16'),
(1864, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:10:37', '2021-12-28 07:10:37'),
(1865, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:20:18', '2021-12-28 07:20:18'),
(1866, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:20:23', '2021-12-28 07:20:23'),
(1867, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:20:28', '2021-12-28 07:20:28'),
(1868, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:22:45', '2021-12-28 07:22:45'),
(1869, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:23:10', '2021-12-28 07:23:10'),
(1870, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:25:00', '2021-12-28 07:25:00'),
(1871, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:25:08', '2021-12-28 07:25:08'),
(1872, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:52:45', '2021-12-28 07:52:45'),
(1873, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:56:00', '2021-12-28 07:56:00'),
(1874, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 07:56:06', '2021-12-28 07:56:06'),
(1875, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:01:53', '2021-12-28 08:01:53'),
(1876, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:06:58', '2021-12-28 08:06:58'),
(1877, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:08:56', '2021-12-28 08:08:56'),
(1878, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:10:28', '2021-12-28 08:10:28'),
(1879, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:11:09', '2021-12-28 08:11:09'),
(1880, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:12:20', '2021-12-28 08:12:20'),
(1881, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:12:21', '2021-12-28 08:12:21'),
(1882, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:13:25', '2021-12-28 08:13:25'),
(1883, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:13:27', '2021-12-28 08:13:27'),
(1884, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:14:31', '2021-12-28 08:14:31'),
(1885, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 08:59:49', '2021-12-28 08:59:49'),
(1886, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:05:15', '2021-12-28 09:05:15'),
(1887, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:07:32', '2021-12-28 09:07:32'),
(1888, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:23:38', '2021-12-28 09:23:38'),
(1889, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:24:08', '2021-12-28 09:24:08'),
(1890, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:25:19', '2021-12-28 09:25:19'),
(1891, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:26:17', '2021-12-28 09:26:17'),
(1892, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '1', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:27:06', '2021-12-28 09:27:06'),
(1893, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:27:27', '2021-12-28 09:27:27'),
(1894, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:32:36', '2021-12-28 09:32:36'),
(1895, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 09:34:12', '2021-12-28 09:34:12'),
(1896, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:43:17', '2021-12-28 11:43:17'),
(1897, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:10', '2021-12-28 11:53:10'),
(1898, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:13', '2021-12-28 11:53:13'),
(1899, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:20', '2021-12-28 11:53:20'),
(1900, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:21', '2021-12-28 11:53:21'),
(1901, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:23', '2021-12-28 11:53:23'),
(1902, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:23', '2021-12-28 11:53:23'),
(1903, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:24', '2021-12-28 11:53:24'),
(1904, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:25', '2021-12-28 11:53:25'),
(1905, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:26', '2021-12-28 11:53:26'),
(1906, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:53:29', '2021-12-28 11:53:29'),
(1907, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:54:09', '2021-12-28 11:54:09'),
(1908, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-28 11:54:12', '2021-12-28 11:54:12'),
(1909, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 03:53:51', '2021-12-29 03:53:51'),
(1910, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:24:00', '2021-12-29 04:24:00'),
(1911, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:24:14', '2021-12-29 04:24:14'),
(1912, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:24:20', '2021-12-29 04:24:20'),
(1913, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:24:27', '2021-12-29 04:24:27'),
(1914, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:25:49', '2021-12-29 04:25:49'),
(1915, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:27:33', '2021-12-29 04:27:33'),
(1916, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:27:36', '2021-12-29 04:27:36'),
(1917, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:29:22', '2021-12-29 04:29:22'),
(1918, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:30:30', '2021-12-29 04:30:30'),
(1919, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:32:56', '2021-12-29 04:32:56'),
(1920, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:34:11', '2021-12-29 04:34:11'),
(1921, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:35:04', '2021-12-29 04:35:04'),
(1922, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:37:05', '2021-12-29 04:37:05'),
(1923, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:38:53', '2021-12-29 04:38:53'),
(1924, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:40:12', '2021-12-29 04:40:12'),
(1925, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:40:15', '2021-12-29 04:40:15'),
(1926, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:40:22', '2021-12-29 04:40:22'),
(1927, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:40:27', '2021-12-29 04:40:27'),
(1928, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:41:07', '2021-12-29 04:41:07'),
(1929, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:49:08', '2021-12-29 04:49:08'),
(1930, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:51:40', '2021-12-29 04:51:40'),
(1931, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:51:45', '2021-12-29 04:51:45'),
(1932, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:54:07', '2021-12-29 04:54:07'),
(1933, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:57:51', '2021-12-29 04:57:51'),
(1934, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:58:03', '2021-12-29 04:58:03'),
(1935, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:58:14', '2021-12-29 04:58:14'),
(1936, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:59:05', '2021-12-29 04:59:05'),
(1937, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:59:16', '2021-12-29 04:59:16'),
(1938, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 04:59:30', '2021-12-29 04:59:30'),
(1939, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 05:00:47', '2021-12-29 05:00:47'),
(1940, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 05:00:58', '2021-12-29 05:00:58'),
(1941, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 05:01:04', '2021-12-29 05:01:04'),
(1942, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 05:01:21', '2021-12-29 05:01:21'),
(1943, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 05:02:31', '2021-12-29 05:02:31'),
(1944, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 10:35:16', '2021-12-29 10:35:16'),
(1945, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 10:35:19', '2021-12-29 10:35:19'),
(1946, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 12:14:10', '2021-12-29 12:14:10'),
(1947, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-29 12:14:27', '2021-12-29 12:14:27'),
(1948, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 05:47:11', '2021-12-30 05:47:11'),
(1949, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 05:47:11', '2021-12-30 05:47:11'),
(1950, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 06:50:17', '2021-12-30 06:50:17'),
(1951, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 06:51:15', '2021-12-30 06:51:15'),
(1952, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 06:52:17', '2021-12-30 06:52:17'),
(1953, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 06:53:41', '2021-12-30 06:53:41'),
(1954, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 07:43:40', '2021-12-30 07:43:40'),
(1955, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 08:30:41', '2021-12-30 08:30:41'),
(1956, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 08:30:41', '2021-12-30 08:30:41'),
(1957, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 08:56:53', '2021-12-30 08:56:53'),
(1958, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 08:57:00', '2021-12-30 08:57:00'),
(1959, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:09:21', '2021-12-30 11:09:21'),
(1960, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:09:21', '2021-12-30 11:09:21'),
(1961, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:29:35', '2021-12-30 11:29:35'),
(1962, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:35:05', '2021-12-30 11:35:05'),
(1963, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:35:15', '2021-12-30 11:35:15'),
(1964, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:35:44', '2021-12-30 11:35:44'),
(1965, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:36:50', '2021-12-30 11:36:50'),
(1966, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:37:05', '2021-12-30 11:37:05'),
(1967, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:37:20', '2021-12-30 11:37:20'),
(1968, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '44', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:54:51', '2021-12-30 11:54:51'),
(1969, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:55:03', '2021-12-30 11:55:03'),
(1970, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:55:15', '2021-12-30 11:55:15'),
(1971, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 11:55:24', '2021-12-30 11:55:24'),
(1972, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 12:01:14', '2021-12-30 12:01:14'),
(1973, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 12:01:44', '2021-12-30 12:01:44'),
(1974, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 12:01:49', '2021-12-30 12:01:49'),
(1975, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 12:01:53', '2021-12-30 12:01:53'),
(1976, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-30 12:01:58', '2021-12-30 12:01:58'),
(1977, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 03:51:30', '2021-12-31 03:51:30'),
(1978, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 04:00:00', '2021-12-31 04:00:00'),
(1979, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 04:00:01', '2021-12-31 04:00:01'),
(1980, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 05:38:52', '2021-12-31 05:38:52'),
(1981, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 05:39:20', '2021-12-31 05:39:20'),
(1982, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 05:39:23', '2021-12-31 05:39:23'),
(1983, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 05:52:05', '2021-12-31 05:52:05'),
(1984, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 05:52:40', '2021-12-31 05:52:40'),
(1985, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:18:26', '2021-12-31 06:18:26'),
(1986, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:24:17', '2021-12-31 06:24:17'),
(1987, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:25:15', '2021-12-31 06:25:15'),
(1988, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:26:47', '2021-12-31 06:26:47'),
(1989, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:26:50', '2021-12-31 06:26:50'),
(1990, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:28:07', '2021-12-31 06:28:07'),
(1991, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:28:58', '2021-12-31 06:28:58'),
(1992, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:29:40', '2021-12-31 06:29:40'),
(1993, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:29:42', '2021-12-31 06:29:42'),
(1994, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:31:57', '2021-12-31 06:31:57'),
(1995, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:33:30', '2021-12-31 06:33:30'),
(1996, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:34:39', '2021-12-31 06:34:39'),
(1997, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:35:33', '2021-12-31 06:35:33'),
(1998, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:37:15', '2021-12-31 06:37:15'),
(1999, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:38:23', '2021-12-31 06:38:23'),
(2000, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:40:09', '2021-12-31 06:40:09'),
(2001, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:42:15', '2021-12-31 06:42:15'),
(2002, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:44:32', '2021-12-31 06:44:32'),
(2003, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:46:21', '2021-12-31 06:46:21'),
(2004, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:49:28', '2021-12-31 06:49:28'),
(2005, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 06:50:03', '2021-12-31 06:50:03'),
(2006, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:39:24', '2021-12-31 08:39:24'),
(2007, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:39:24', '2021-12-31 08:39:24'),
(2008, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:45:41', '2021-12-31 08:45:41'),
(2009, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:47:46', '2021-12-31 08:47:46'),
(2010, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:50:09', '2021-12-31 08:50:09'),
(2011, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:50:19', '2021-12-31 08:50:19'),
(2012, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:50:22', '2021-12-31 08:50:22'),
(2013, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:52:40', '2021-12-31 08:52:40'),
(2014, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:53:43', '2021-12-31 08:53:43'),
(2015, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:55:18', '2021-12-31 08:55:18'),
(2016, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:56:35', '2021-12-31 08:56:35'),
(2017, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:57:27', '2021-12-31 08:57:27'),
(2018, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:58:55', '2021-12-31 08:58:55'),
(2019, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 08:59:44', '2021-12-31 08:59:44'),
(2020, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:08:48', '2021-12-31 09:08:48'),
(2021, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:11:32', '2021-12-31 09:11:32'),
(2022, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:22:01', '2021-12-31 09:22:01'),
(2023, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:22:09', '2021-12-31 09:22:09'),
(2024, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:22:14', '2021-12-31 09:22:14'),
(2025, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:24:41', '2021-12-31 09:24:41'),
(2026, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:26:41', '2021-12-31 09:26:41'),
(2027, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:34:34', '2021-12-31 09:34:34'),
(2028, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:39:37', '2021-12-31 09:39:37'),
(2029, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:51:23', '2021-12-31 09:51:23'),
(2030, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 09:57:00', '2021-12-31 09:57:00'),
(2031, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 10:00:39', '2021-12-31 10:00:39'),
(2032, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2021-12-31 10:19:10', '2021-12-31 10:19:10'),
(2033, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:00:03', '2022-01-07 09:00:03'),
(2034, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:00:03', '2022-01-07 09:00:03'),
(2035, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:01:22', '2022-01-07 09:01:22'),
(2036, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:01:51', '2022-01-07 09:01:51'),
(2037, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:03:19', '2022-01-07 09:03:19'),
(2038, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:04:29', '2022-01-07 09:04:29'),
(2039, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:05:31', '2022-01-07 09:05:31'),
(2040, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:05:53', '2022-01-07 09:05:53'),
(2041, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:06:15', '2022-01-07 09:06:15'),
(2042, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:06:36', '2022-01-07 09:06:36'),
(2043, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:08:01', '2022-01-07 09:08:01'),
(2044, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:08:18', '2022-01-07 09:08:18'),
(2045, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:09:37', '2022-01-07 09:09:37'),
(2046, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:11:28', '2022-01-07 09:11:28'),
(2047, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:11:42', '2022-01-07 09:11:42'),
(2048, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:12:24', '2022-01-07 09:12:24');
INSERT INTO `visitlogs` (`id`, `ip`, `browser`, `os`, `user_id`, `user_name`, `country_code`, `country_name`, `region_name`, `city`, `zip_code`, `time_zone`, `latitude`, `longitude`, `is_banned`, `page_url`, `created_at`, `updated_at`) VALUES
(2049, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:27:55', '2022-01-07 09:27:55'),
(2050, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:28:17', '2022-01-07 09:28:17'),
(2051, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:36:41', '2022-01-07 09:36:41'),
(2052, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 09:37:05', '2022-01-07 09:37:05'),
(2053, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 10:26:29', '2022-01-07 10:26:29'),
(2054, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 10:28:11', '2022-01-07 10:28:11'),
(2055, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 10:41:29', '2022-01-07 10:41:29'),
(2056, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 10:43:30', '2022-01-07 10:43:30'),
(2057, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 10:44:28', '2022-01-07 10:44:28'),
(2058, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-07 10:55:05', '2022-01-07 10:55:05'),
(2059, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 04:04:01', '2022-01-10 04:04:01'),
(2060, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 04:22:45', '2022-01-10 04:22:45'),
(2061, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 04:22:49', '2022-01-10 04:22:49'),
(2062, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 04:22:58', '2022-01-10 04:22:58'),
(2063, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '10', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 04:27:44', '2022-01-10 04:27:44'),
(2064, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:04:58', '2022-01-10 05:04:58'),
(2065, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:37:44', '2022-01-10 05:37:44'),
(2066, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:38:11', '2022-01-10 05:38:11'),
(2067, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:40:17', '2022-01-10 05:40:17'),
(2068, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:42:03', '2022-01-10 05:42:03'),
(2069, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:42:07', '2022-01-10 05:42:07'),
(2070, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:45:25', '2022-01-10 05:45:25'),
(2071, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:46:08', '2022-01-10 05:46:08'),
(2072, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:47:17', '2022-01-10 05:47:17'),
(2073, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 05:59:28', '2022-01-10 05:59:28'),
(2074, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:14:07', '2022-01-10 06:14:07'),
(2075, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:14:14', '2022-01-10 06:14:14'),
(2076, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:15:16', '2022-01-10 06:15:16'),
(2077, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:15:18', '2022-01-10 06:15:18'),
(2078, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:18:48', '2022-01-10 06:18:48'),
(2079, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:20:27', '2022-01-10 06:20:27'),
(2080, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:26:07', '2022-01-10 06:26:07'),
(2081, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:30:15', '2022-01-10 06:30:15'),
(2082, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:30:19', '2022-01-10 06:30:19'),
(2083, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:31:53', '2022-01-10 06:31:53'),
(2084, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:33:59', '2022-01-10 06:33:59'),
(2085, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 06:37:16', '2022-01-10 06:37:16'),
(2086, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 07:43:55', '2022-01-10 07:43:55'),
(2087, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 07:44:02', '2022-01-10 07:44:02'),
(2088, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 09:41:07', '2022-01-10 09:41:07'),
(2089, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 09:41:35', '2022-01-10 09:41:35'),
(2090, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 09:43:18', '2022-01-10 09:43:18'),
(2091, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 09:45:36', '2022-01-10 09:45:36'),
(2092, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 09:46:06', '2022-01-10 09:46:06'),
(2093, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 09:46:18', '2022-01-10 09:46:18'),
(2094, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 10:47:55', '2022-01-10 10:47:55'),
(2095, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 10:49:57', '2022-01-10 10:49:57'),
(2096, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 10:55:33', '2022-01-10 10:55:33'),
(2097, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 11:00:08', '2022-01-10 11:00:08'),
(2098, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 11:22:23', '2022-01-10 11:22:23'),
(2099, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 12:03:18', '2022-01-10 12:03:18'),
(2100, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-10 12:03:22', '2022-01-10 12:03:22'),
(2101, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:02:17', '2022-01-11 04:02:17'),
(2102, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:02:17', '2022-01-11 04:02:17'),
(2103, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:10:38', '2022-01-11 04:10:38'),
(2104, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:11:32', '2022-01-11 04:11:32'),
(2105, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:11:54', '2022-01-11 04:11:54'),
(2106, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:13:57', '2022-01-11 04:13:57'),
(2107, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:14:01', '2022-01-11 04:14:01'),
(2108, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:14:06', '2022-01-11 04:14:06'),
(2109, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:15:51', '2022-01-11 04:15:51'),
(2110, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:15:59', '2022-01-11 04:15:59'),
(2111, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:17:38', '2022-01-11 04:17:38'),
(2112, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:20:16', '2022-01-11 04:20:16'),
(2113, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:20:17', '2022-01-11 04:20:17'),
(2114, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:21:47', '2022-01-11 04:21:47'),
(2115, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:21:49', '2022-01-11 04:21:49'),
(2116, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:22:33', '2022-01-11 04:22:33'),
(2117, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:22:35', '2022-01-11 04:22:35'),
(2118, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:24:04', '2022-01-11 04:24:04'),
(2119, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:24:06', '2022-01-11 04:24:06'),
(2120, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:27:59', '2022-01-11 04:27:59'),
(2121, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:29:28', '2022-01-11 04:29:28'),
(2122, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:36:07', '2022-01-11 04:36:07'),
(2123, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:37:13', '2022-01-11 04:37:13'),
(2124, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:37:17', '2022-01-11 04:37:17'),
(2125, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:38:11', '2022-01-11 04:38:11'),
(2126, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:38:13', '2022-01-11 04:38:13'),
(2127, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:39:34', '2022-01-11 04:39:34'),
(2128, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:39:38', '2022-01-11 04:39:38'),
(2129, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:40:43', '2022-01-11 04:40:43'),
(2130, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:40:45', '2022-01-11 04:40:45'),
(2131, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:42:16', '2022-01-11 04:42:16'),
(2132, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:42:17', '2022-01-11 04:42:17'),
(2133, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:43:53', '2022-01-11 04:43:53'),
(2134, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 04:43:55', '2022-01-11 04:43:55'),
(2135, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 05:39:58', '2022-01-11 05:39:58'),
(2136, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '48', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 07:45:48', '2022-01-11 07:45:48'),
(2137, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '48', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 09:27:07', '2022-01-11 09:27:07'),
(2138, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '48', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 10:50:42', '2022-01-11 10:50:42'),
(2139, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-11 11:54:21', '2022-01-11 11:54:21'),
(2140, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 03:18:38', '2022-01-12 03:18:38'),
(2141, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 03:18:38', '2022-01-12 03:18:38'),
(2142, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:16:20', '2022-01-12 04:16:20'),
(2143, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:16:47', '2022-01-12 04:16:47'),
(2144, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:16:54', '2022-01-12 04:16:54'),
(2145, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:17:53', '2022-01-12 04:17:53'),
(2146, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:25:06', '2022-01-12 04:25:06'),
(2147, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:25:10', '2022-01-12 04:25:10'),
(2148, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:27:29', '2022-01-12 04:27:29'),
(2149, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:28:03', '2022-01-12 04:28:03'),
(2150, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:28:05', '2022-01-12 04:28:05'),
(2151, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:29:21', '2022-01-12 04:29:21'),
(2152, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:29:25', '2022-01-12 04:29:25'),
(2153, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:29:54', '2022-01-12 04:29:54'),
(2154, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:29:57', '2022-01-12 04:29:57'),
(2155, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:30:29', '2022-01-12 04:30:29'),
(2156, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:30:31', '2022-01-12 04:30:31'),
(2157, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:30:43', '2022-01-12 04:30:43'),
(2158, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:30:45', '2022-01-12 04:30:45'),
(2159, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:34:59', '2022-01-12 04:34:59'),
(2160, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:35:01', '2022-01-12 04:35:01'),
(2161, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:37:03', '2022-01-12 04:37:03'),
(2162, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:38:05', '2022-01-12 04:38:05'),
(2163, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:41:34', '2022-01-12 04:41:34'),
(2164, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 04:42:48', '2022-01-12 04:42:48'),
(2165, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 05:23:03', '2022-01-12 05:23:03'),
(2166, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 05:51:22', '2022-01-12 05:51:22'),
(2167, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 05:51:49', '2022-01-12 05:51:49'),
(2168, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 05:54:39', '2022-01-12 05:54:39'),
(2169, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 05:56:06', '2022-01-12 05:56:06'),
(2170, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 06:42:36', '2022-01-12 06:42:36'),
(2171, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 07:03:47', '2022-01-12 07:03:47'),
(2172, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 08:15:55', '2022-01-12 08:15:55'),
(2173, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 09:06:19', '2022-01-12 09:06:19'),
(2174, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 09:31:39', '2022-01-12 09:31:39'),
(2175, '127.0.0.1', 'Chrome (96.0.4664.110)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 09:31:39', '2022-01-12 09:31:39'),
(2176, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 10:10:11', '2022-01-12 10:10:11'),
(2177, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 11:12:35', '2022-01-12 11:12:35'),
(2178, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 11:12:35', '2022-01-12 11:12:35'),
(2179, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 12:13:48', '2022-01-12 12:13:48'),
(2180, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 12:14:44', '2022-01-12 12:14:44'),
(2181, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 12:14:49', '2022-01-12 12:14:49'),
(2182, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-12 12:15:57', '2022-01-12 12:15:57'),
(2183, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 03:56:44', '2022-01-13 03:56:44'),
(2184, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 03:56:44', '2022-01-13 03:56:44'),
(2185, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:11:59', '2022-01-13 05:11:59'),
(2186, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:29:23', '2022-01-13 05:29:23'),
(2187, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:29:30', '2022-01-13 05:29:30'),
(2188, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:29:35', '2022-01-13 05:29:35'),
(2189, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:30:22', '2022-01-13 05:30:22'),
(2190, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:31:02', '2022-01-13 05:31:02'),
(2191, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:33:46', '2022-01-13 05:33:46'),
(2192, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:34:15', '2022-01-13 05:34:15'),
(2193, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:34:41', '2022-01-13 05:34:41'),
(2194, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:35:13', '2022-01-13 05:35:13'),
(2195, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:35:23', '2022-01-13 05:35:23'),
(2196, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:35:41', '2022-01-13 05:35:41'),
(2197, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:36:59', '2022-01-13 05:36:59'),
(2198, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:37:07', '2022-01-13 05:37:07'),
(2199, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:37:21', '2022-01-13 05:37:21'),
(2200, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:37:33', '2022-01-13 05:37:33'),
(2201, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:38:15', '2022-01-13 05:38:15'),
(2202, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:38:22', '2022-01-13 05:38:22'),
(2203, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:43:28', '2022-01-13 05:43:28'),
(2204, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:45:11', '2022-01-13 05:45:11'),
(2205, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 05:55:12', '2022-01-13 05:55:12'),
(2206, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-13 10:33:08', '2022-01-13 10:33:08'),
(2207, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-14 04:49:10', '2022-01-14 04:49:10'),
(2208, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-14 04:49:10', '2022-01-14 04:49:10'),
(2209, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-14 04:50:35', '2022-01-14 04:50:35'),
(2210, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-18 08:53:06', '2022-01-18 08:53:06'),
(2211, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-18 08:53:06', '2022-01-18 08:53:06'),
(2212, '127.0.0.1', 'Chrome (97.0.4692.71)', 'Windows', '11', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-18 08:53:21', '2022-01-18 08:53:21'),
(2213, '119.73.117.133', 'Chrome (97.0.4692.71)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-01-25 11:55:04', '2022-01-25 11:55:04'),
(2214, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-06-21 15:49:06', '2022-06-21 15:49:06'),
(2215, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-06-21 15:49:14', '2022-06-21 15:49:14'),
(2216, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-06-21 15:49:39', '2022-06-21 15:49:39'),
(2217, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-06-21 15:50:31', '2022-06-21 15:50:31'),
(2218, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-06-21 15:50:32', '2022-06-21 15:50:32'),
(2219, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-07-06 14:07:06', '2022-07-06 14:07:06'),
(2220, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-07-25 15:54:19', '2022-07-25 15:54:19'),
(2221, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-07-25 15:54:19', '2022-07-25 15:54:19'),
(2222, '127.0.0.1', 'Chrome (102.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-07-25 15:59:53', '2022-07-25 15:59:53'),
(2223, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 14:34:48', '2022-08-30 14:34:48'),
(2224, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 14:42:36', '2022-08-30 14:42:36'),
(2225, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 14:45:38', '2022-08-30 14:45:38'),
(2226, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 15:10:30', '2022-08-30 15:10:30'),
(2227, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 15:25:26', '2022-08-30 15:25:26'),
(2228, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 15:27:06', '2022-08-30 15:27:06'),
(2229, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 15:27:32', '2022-08-30 15:27:32'),
(2230, '127.0.0.1', 'Chrome (103.0.0.0)', 'Windows', '0', 'Guest', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2022-08-30 15:27:49', '2022-08-30 15:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `zoom_meetings`
--

CREATE TABLE `zoom_meetings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_timing_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `joining_url` longtext COLLATE utf8mb4_unicode_ci,
  `start_url` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zoom_meetings`
--

INSERT INTO `zoom_meetings` (`id`, `event_timing_id`, `event_id`, `joining_url`, `start_url`, `created_at`, `updated_at`) VALUES
(1, 28, 5, 'https://us06web.zoom.us/j/82954585920?pwd=ZW9hcXoyRTd0WTUvWG9oWVQwd211dz09', 'https://us06web.zoom.us/s/82954585920?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjB4bWVBNUEyVE5DY0h1NFEwV0cxdGciLCJpc3MiOiJ3ZWIiLCJzdHkiOjEwMCwid2NkIjoidXMwNiIsImNsdCI6MCwibW51bSI6IjgyOTU0NTg1OTIwIiwic3RrIjoiWUgtYmxCLTQ4MW9LNlRIQlhKSWVOZmo0czdtSnpKMnFlcTEtdGoxS0luZy5CZ1k0VFM5YUwzb3pWRlpxVkUxQ1MzTlFlVTl1VmtVNGEyTlZTRk5EYzJoelF6ZFRkMjlOYmtWeWNteFVZakp6ZDFnNWFsRjJjVTUzUFQxQU9XSTVaalppWW1JMU1EZG1aVFZqTjJKa1ptTTNZMk5sWTJGbE1EaGxOemd4TURZMU5UQTFNR0poWW1Rek5tRmxaRFl4WVRFNU1tUTVNamszTWpObU13QWdjMnhUY0VKRVZqRXdSRlZZUkRkcVVFODFMME0zUjJGa1MxcE1jRmxrYTFRQUJIVnpNRFlBQUFGOFZCdkJMQUFTZFFBQUFBIiwiZXhwIjoxNjMzNTA1ODc3LCJpYXQiOjE2MzM0OTg2NzcsImFpZCI6Illqc3hQQVNtUURTNS1iejhHVFRVcmciLCJjaWQiOiIifQ.FSDAR7kIPuorrGTylo7h98IdAg14EEqixatrNEF33as', '2021-10-06 00:37:56', '2021-10-06 00:37:56'),
(2, 30, 4, 'https://us06web.zoom.us/j/83901415607?pwd=enhHM2NNbGJvOFRrVnEzRXlqUFlhZz09', 'https://us06web.zoom.us/s/83901415607?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IjB4bWVBNUEyVE5DY0h1NFEwV0cxdGciLCJpc3MiOiJ3ZWIiLCJzdHkiOjEwMCwid2NkIjoidXMwNiIsImNsdCI6MCwibW51bSI6IjgzOTAxNDE1NjA3Iiwic3RrIjoiazJweTJjWG9RRTZaVTJyS2tpUXB3RG1yS1NJQng4Qk5LT1hIbVpfMWlicy5CZ1k0VFM5YUwzb3pWRlpxVkUxQ1MzTlFlVTl1VmtVNGEyTlZTRk5EYzJoelF6ZFRkMjlOYmtWeWNteFVZakp6ZDFnNWFsRjJjVTUzUFQxQU9XSTVaalppWW1JMU1EZG1aVFZqTjJKa1ptTTNZMk5sWTJGbE1EaGxOemd4TURZMU5UQTFNR0poWW1Rek5tRmxaRFl4WVRFNU1tUTVNamszTWpObU13QWdjMnhUY0VKRVZqRXdSRlZZUkRkcVVFODFMME0zUjJGa1MxcE1jRmxrYTFRQUJIVnpNRFlBQUFGOFZCNG9SQUFTZFFBQUFBIiwiZXhwIjoxNjMzNTA2MDM1LCJpYXQiOjE2MzM0OTg4MzUsImFpZCI6Illqc3hQQVNtUURTNS1iejhHVFRVcmciLCJjaWQiOiIifQ.6bb7b5iwAudpwFlN2ZPJVAeAdbkuDgVkltn-vfUhvkE', '2021-10-06 00:39:24', '2021-10-06 00:40:34'),
(3, 29, 4, 'https://us06web.zoom.us/j/85084580744?pwd=Uzl5SGdoNHBaSExYWUhxZ1BrRjhrdz09', 'https://us06web.zoom.us/s/85084580744?zak=eyJ0eXAiOiJKV1QiLCJzdiI6IjAwMDAwMSIsInptX3NrbSI6InptX28ybSIsImFsZyI6IkhTMjU2In0.eyJhdWQiOiJjbGllbnRzbSIsInVpZCI6IlZFMU9abHZtVDItQmFVakJnUzVTOWciLCJpc3MiOiJ3ZWIiLCJzdHkiOjEwMCwid2NkIjoidXMwNiIsImNsdCI6MCwibW51bSI6Ijg1MDg0NTgwNzQ0Iiwic3RrIjoiWWFUakxieGNKMEtaTndzblRnOGY5WEhHMnhPUk5jU0FKVzBjeWdEeHp2cy5CZ1lnVDNwelRtOU9jamxQUjBWTmNubGxUV1pJUjFGSFVVTkhiMk5hTVV0c1NISkFNekpsWXpjeFlUY3dPVFV5TVRBeU9XRTFPREU1TXpkaE1qRXpZamMxTnpZME1UbGxPRGxqT1dVeE1UWTNOMlUxTkdaaU5EWTVOelkwT0RobFlqSm1ZZ0FNY21Wc2NIaFhMMVZEWjBFOUFBUjFjekEyQUFBQmZGVWJNa2NBRW5VQUFBQSIsImV4cCI6MTYzMzUyMjYxOCwiaWF0IjoxNjMzNTE1NDE4LCJhaWQiOiJZanN4UEFTbVFEUzUtYno4R1RUVXJnIiwiY2lkIjoiIn0.ptqDgyMA3zRLmf2CE-ldtTC6C1zldEyJ8VoMxXenvfU', '2021-10-06 00:39:44', '2021-10-06 05:16:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_settings`
--
ALTER TABLE `ads_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `album_photos`
--
ALTER TABLE `album_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_photos_album_id_foreign` (`album_id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_user_id_foreign` (`user_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `badge_requests`
--
ALTER TABLE `badge_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `badge_requests_user_id_foreign` (`user_id`),
  ADD KEY `badge_requests_badge_id_foreign` (`badge_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cart_wish_lists`
--
ALTER TABLE `cart_wish_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_wish_lists_user_id_foreign` (`user_id`),
  ADD KEY `cart_wish_lists_shop_product_id_foreign` (`shop_product_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversations_sender_id_foreign` (`sender_id`),
  ADD KEY `conversations_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `day_slots`
--
ALTER TABLE `day_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day_slots_timetable_id_foreign` (`timetable_id`),
  ADD KEY `day_slots_user_id_foreign` (`user_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_user_id_foreign` (`user_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`);

--
-- Indexes for table `event_requests`
--
ALTER TABLE `event_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_requests_user_id_foreign` (`user_id`),
  ADD KEY `event_requests_event_timing_id_foreign` (`event_timing_id`);

--
-- Indexes for table `event_timings`
--
ALTER TABLE `event_timings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_timings_event_id_foreign` (`event_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `followings`
--
ALTER TABLE `followings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followings_user_id_foreign` (`user_id`),
  ADD KEY `followings_following_type_following_id_index` (`following_type`,`following_id`);

--
-- Indexes for table `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forums_user_id_foreign` (`user_id`),
  ADD KEY `forums_forum_category_id_foreign` (`forum_category_id`);

--
-- Indexes for table `forum_categories`
--
ALTER TABLE `forum_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_comments_user_id_foreign` (`user_id`),
  ADD KEY `forum_comments_forum_id_foreign` (`forum_id`);

--
-- Indexes for table `forum_reactions`
--
ALTER TABLE `forum_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forum_reactions_user_id_foreign` (`user_id`),
  ADD KEY `forum_reactions_forum_id_foreign` (`forum_id`);

--
-- Indexes for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeopath_badges_settings`
--
ALTER TABLE `homeopath_badges_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_badges_settings_homeopath_id_foreign` (`homeopath_id`);

--
-- Indexes for table `homeopath_categories`
--
ALTER TABLE `homeopath_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homeopath_documents`
--
ALTER TABLE `homeopath_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_documents_user_id_foreign` (`user_id`);

--
-- Indexes for table `homeopath_holidays`
--
ALTER TABLE `homeopath_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_holidays_user_id_foreign` (`user_id`);

--
-- Indexes for table `homeopath_images`
--
ALTER TABLE `homeopath_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_images_user_id_foreign` (`user_id`);

--
-- Indexes for table `homeopath_libraries`
--
ALTER TABLE `homeopath_libraries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_libraries_homeopath_category_id_foreign` (`homeopath_category_id`);

--
-- Indexes for table `homeopath_profiles`
--
ALTER TABLE `homeopath_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `homeopath_resources`
--
ALTER TABLE `homeopath_resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_resources_user_id_foreign` (`user_id`);

--
-- Indexes for table `homeopath_services`
--
ALTER TABLE `homeopath_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_services_user_id_foreign` (`user_id`),
  ADD KEY `homeopath_services_service_theme_id_foreign` (`service_theme_id`);

--
-- Indexes for table `homeopath_service_zoom_meetings`
--
ALTER TABLE `homeopath_service_zoom_meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `homeopath_service_zoom_meetings_service_id_foreign` (`service_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `location_texes`
--
ALTER TABLE `location_texes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `news_letter_emails`
--
ALTER TABLE `news_letter_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `report_users`
--
ALTER TABLE `report_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_users_user_id_foreign` (`user_id`),
  ADD KEY `report_users_reported_by_foreign` (`reported_by`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `service_bookings`
--
ALTER TABLE `service_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_bookings_user_id_foreign` (`user_id`),
  ADD KEY `service_bookings_homeopath_service_id_foreign` (`homeopath_service_id`);

--
-- Indexes for table `service_booking_prescriptions`
--
ALTER TABLE `service_booking_prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_booking_prescriptions_service_booking_id_foreign` (`service_booking_id`);

--
-- Indexes for table `service_reviews`
--
ALTER TABLE `service_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_reviews_user_id_foreign` (`user_id`),
  ADD KEY `service_reviews_homeopath_id_foreign` (`homeopath_id`),
  ADD KEY `service_reviews_homeopath_service_id_foreign` (`homeopath_service_id`);

--
-- Indexes for table `service_themes`
--
ALTER TABLE `service_themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_brands`
--
ALTER TABLE `shop_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_colors`
--
ALTER TABLE `shop_colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `shop_order_products`
--
ALTER TABLE `shop_order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_order_products_shop_order_id_foreign` (`shop_order_id`),
  ADD KEY `shop_order_products_shop_product_id_foreign` (`shop_product_id`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_products_shop_category_id_foreign` (`shop_category_id`),
  ADD KEY `shop_products_shop_brand_id_foreign` (`shop_brand_id`),
  ADD KEY `shop_products_shop_color_id_foreign` (`shop_color_id`),
  ADD KEY `shop_products_shop_variant_id_foreign` (`shop_variant_id`);

--
-- Indexes for table `shop_variants`
--
ALTER TABLE `shop_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_posts`
--
ALTER TABLE `social_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_posts_user_id_foreign` (`user_id`),
  ADD KEY `social_posts_user_social_group_id_foreign` (`user_social_group_id`);

--
-- Indexes for table `social_post_comments`
--
ALTER TABLE `social_post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_post_comments_user_id_foreign` (`user_id`),
  ADD KEY `social_post_comments_social_post_id_foreign` (`social_post_id`);

--
-- Indexes for table `social_post_likes`
--
ALTER TABLE `social_post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_post_likes_social_post_id_foreign` (`social_post_id`);

--
-- Indexes for table `social_post_tags`
--
ALTER TABLE `social_post_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_post_tags_social_post_id_foreign` (`social_post_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `timetables_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_social_albums`
--
ALTER TABLE `user_social_albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_social_albums_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_social_groups`
--
ALTER TABLE `user_social_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_social_groups_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_social_profiles`
--
ALTER TABLE `user_social_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_social_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `visitlogs`
--
ALTER TABLE `visitlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zoom_meetings_event_timing_id_foreign` (`event_timing_id`),
  ADD KEY `zoom_meetings_event_id_foreign` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_settings`
--
ALTER TABLE `ads_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `album_photos`
--
ALTER TABLE `album_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `badge_requests`
--
ALTER TABLE `badge_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_wish_lists`
--
ALTER TABLE `cart_wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `day_slots`
--
ALTER TABLE `day_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `event_requests`
--
ALTER TABLE `event_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `event_timings`
--
ALTER TABLE `event_timings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followings`
--
ALTER TABLE `followings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_categories`
--
ALTER TABLE `forum_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_comments`
--
ALTER TABLE `forum_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_reactions`
--
ALTER TABLE `forum_reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `homeopath_badges_settings`
--
ALTER TABLE `homeopath_badges_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `homeopath_categories`
--
ALTER TABLE `homeopath_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `homeopath_documents`
--
ALTER TABLE `homeopath_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `homeopath_holidays`
--
ALTER TABLE `homeopath_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `homeopath_images`
--
ALTER TABLE `homeopath_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `homeopath_libraries`
--
ALTER TABLE `homeopath_libraries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `homeopath_profiles`
--
ALTER TABLE `homeopath_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `homeopath_resources`
--
ALTER TABLE `homeopath_resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `homeopath_services`
--
ALTER TABLE `homeopath_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `homeopath_service_zoom_meetings`
--
ALTER TABLE `homeopath_service_zoom_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `location_texes`
--
ALTER TABLE `location_texes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `news_letter_emails`
--
ALTER TABLE `news_letter_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `report_users`
--
ALTER TABLE `report_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_bookings`
--
ALTER TABLE `service_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `service_booking_prescriptions`
--
ALTER TABLE `service_booking_prescriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_reviews`
--
ALTER TABLE `service_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_themes`
--
ALTER TABLE `service_themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `shop_brands`
--
ALTER TABLE `shop_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_colors`
--
ALTER TABLE `shop_colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shop_orders`
--
ALTER TABLE `shop_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shop_order_products`
--
ALTER TABLE `shop_order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shop_variants`
--
ALTER TABLE `shop_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_posts`
--
ALTER TABLE `social_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `social_post_comments`
--
ALTER TABLE `social_post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `social_post_likes`
--
ALTER TABLE `social_post_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social_post_tags`
--
ALTER TABLE `social_post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user_social_albums`
--
ALTER TABLE `user_social_albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_social_groups`
--
ALTER TABLE `user_social_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_social_profiles`
--
ALTER TABLE `user_social_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `visitlogs`
--
ALTER TABLE `visitlogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2231;

--
-- AUTO_INCREMENT for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album_photos`
--
ALTER TABLE `album_photos`
  ADD CONSTRAINT `album_photos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `user_social_albums` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `badge_requests`
--
ALTER TABLE `badge_requests`
  ADD CONSTRAINT `badge_requests_badge_id_foreign` FOREIGN KEY (`badge_id`) REFERENCES `badges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `badge_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_wish_lists`
--
ALTER TABLE `cart_wish_lists`
  ADD CONSTRAINT `cart_wish_lists_shop_product_id_foreign` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `day_slots`
--
ALTER TABLE `day_slots`
  ADD CONSTRAINT `day_slots_timetable_id_foreign` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `day_slots_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_requests`
--
ALTER TABLE `event_requests`
  ADD CONSTRAINT `event_requests_event_timing_id_foreign` FOREIGN KEY (`event_timing_id`) REFERENCES `event_timings` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_timings`
--
ALTER TABLE `event_timings`
  ADD CONSTRAINT `event_timings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followings`
--
ALTER TABLE `followings`
  ADD CONSTRAINT `followings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forums`
--
ALTER TABLE `forums`
  ADD CONSTRAINT `forums_forum_category_id_foreign` FOREIGN KEY (`forum_category_id`) REFERENCES `forum_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_comments`
--
ALTER TABLE `forum_comments`
  ADD CONSTRAINT `forum_comments_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forum_reactions`
--
ALTER TABLE `forum_reactions`
  ADD CONSTRAINT `forum_reactions_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forum_reactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_badges_settings`
--
ALTER TABLE `homeopath_badges_settings`
  ADD CONSTRAINT `homeopath_badges_settings_homeopath_id_foreign` FOREIGN KEY (`homeopath_id`) REFERENCES `homeopath_profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_documents`
--
ALTER TABLE `homeopath_documents`
  ADD CONSTRAINT `homeopath_documents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_holidays`
--
ALTER TABLE `homeopath_holidays`
  ADD CONSTRAINT `homeopath_holidays_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_images`
--
ALTER TABLE `homeopath_images`
  ADD CONSTRAINT `homeopath_images_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_libraries`
--
ALTER TABLE `homeopath_libraries`
  ADD CONSTRAINT `homeopath_libraries_homeopath_category_id_foreign` FOREIGN KEY (`homeopath_category_id`) REFERENCES `homeopath_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_profiles`
--
ALTER TABLE `homeopath_profiles`
  ADD CONSTRAINT `homeopath_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_resources`
--
ALTER TABLE `homeopath_resources`
  ADD CONSTRAINT `homeopath_resources_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_services`
--
ALTER TABLE `homeopath_services`
  ADD CONSTRAINT `homeopath_services_service_theme_id_foreign` FOREIGN KEY (`service_theme_id`) REFERENCES `service_themes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `homeopath_services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `homeopath_service_zoom_meetings`
--
ALTER TABLE `homeopath_service_zoom_meetings`
  ADD CONSTRAINT `homeopath_service_zoom_meetings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `homeopath_services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `report_users`
--
ALTER TABLE `report_users`
  ADD CONSTRAINT `report_users_reported_by_foreign` FOREIGN KEY (`reported_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_bookings`
--
ALTER TABLE `service_bookings`
  ADD CONSTRAINT `service_bookings_homeopath_service_id_foreign` FOREIGN KEY (`homeopath_service_id`) REFERENCES `homeopath_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_booking_prescriptions`
--
ALTER TABLE `service_booking_prescriptions`
  ADD CONSTRAINT `service_booking_prescriptions_service_booking_id_foreign` FOREIGN KEY (`service_booking_id`) REFERENCES `service_bookings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_reviews`
--
ALTER TABLE `service_reviews`
  ADD CONSTRAINT `service_reviews_homeopath_id_foreign` FOREIGN KEY (`homeopath_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_reviews_homeopath_service_id_foreign` FOREIGN KEY (`homeopath_service_id`) REFERENCES `homeopath_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD CONSTRAINT `shop_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_order_products`
--
ALTER TABLE `shop_order_products`
  ADD CONSTRAINT `shop_order_products_shop_order_id_foreign` FOREIGN KEY (`shop_order_id`) REFERENCES `shop_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_order_products_shop_product_id_foreign` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD CONSTRAINT `shop_products_shop_brand_id_foreign` FOREIGN KEY (`shop_brand_id`) REFERENCES `shop_brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_products_shop_category_id_foreign` FOREIGN KEY (`shop_category_id`) REFERENCES `shop_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_products_shop_color_id_foreign` FOREIGN KEY (`shop_color_id`) REFERENCES `shop_colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shop_products_shop_variant_id_foreign` FOREIGN KEY (`shop_variant_id`) REFERENCES `shop_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_posts`
--
ALTER TABLE `social_posts`
  ADD CONSTRAINT `social_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_posts_user_social_group_id_foreign` FOREIGN KEY (`user_social_group_id`) REFERENCES `user_social_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_post_comments`
--
ALTER TABLE `social_post_comments`
  ADD CONSTRAINT `social_post_comments_social_post_id_foreign` FOREIGN KEY (`social_post_id`) REFERENCES `social_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `social_post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_post_likes`
--
ALTER TABLE `social_post_likes`
  ADD CONSTRAINT `social_post_likes_social_post_id_foreign` FOREIGN KEY (`social_post_id`) REFERENCES `social_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_post_tags`
--
ALTER TABLE `social_post_tags`
  ADD CONSTRAINT `social_post_tags_social_post_id_foreign` FOREIGN KEY (`social_post_id`) REFERENCES `social_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetables`
--
ALTER TABLE `timetables`
  ADD CONSTRAINT `timetables_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_social_albums`
--
ALTER TABLE `user_social_albums`
  ADD CONSTRAINT `user_social_albums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_social_groups`
--
ALTER TABLE `user_social_groups`
  ADD CONSTRAINT `user_social_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_social_profiles`
--
ALTER TABLE `user_social_profiles`
  ADD CONSTRAINT `user_social_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zoom_meetings`
--
ALTER TABLE `zoom_meetings`
  ADD CONSTRAINT `zoom_meetings_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `zoom_meetings_event_timing_id_foreign` FOREIGN KEY (`event_timing_id`) REFERENCES `event_timings` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
