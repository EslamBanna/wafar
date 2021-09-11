-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2021 at 10:50 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wafar2`
--

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `related_object` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 => money\r\n1 => precent',
  `value` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `related_object`, `service_id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 13, '2021-09-01 21:47:36', NULL),
(2, 1, 1, 1, 55, '2021-09-02 21:47:41', NULL),
(3, 1, 1, 1, 47, '2021-09-03 21:47:45', NULL),
(4, 2, 1, 0, 11, '2021-09-04 21:47:49', NULL),
(5, 2, 1, 1, 33, '2021-09-05 21:47:52', NULL),
(7, 1, 1, 0, 12, '2021-09-06 21:47:57', NULL),
(8, 1, 1, 1, 99, '2021-09-07 21:48:01', NULL),
(9, 3, 1, 0, 88, '2021-09-08 21:48:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resturant_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `icon` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `calorie` int(11) NOT NULL,
  `cookTime` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `resturant_id`, `categorie_id`, `name`, `photo`, `price`, `rate`, `icon`, `ingredients`, `calorie`, `cookTime`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'pizza with meat 1', 'asd.jog', 10, 0, '', '', 0, 0, '', NULL, NULL),
(2, 1, 1, 'pizza with chees1', 'asdfr.jpg', 20, 0, '', '', 0, 0, '', NULL, NULL),
(3, 1, 3, 'Canned Tuna1', 'ergsr.jpg', 30, 0, '', '', 0, 0, '', NULL, NULL),
(4, 1, 3, 'Salmon1', 'svsv.jpg', 40, 0, '', '', 0, 0, '', NULL, NULL),
(5, 1, 3, 'Tilapia1', 'dfvwsf.jpg', 50, 0, '', '', 0, 0, '', NULL, NULL),
(6, 1, 3, 'Alaska Pollock1', 'qwfwa.jpg', 60, 0, '', '', 0, 0, '', NULL, NULL),
(7, 2, 2, 'Steak, Spinach, and Mushroom', 'fwrfwe.jpg', 70, 0, '', '', 0, 0, '', NULL, NULL),
(8, 2, 2, 'Turkey and Pesto.', 'dvdsvsd.jpg', 80, 0, '', '', 0, 0, '', NULL, NULL),
(9, 2, 2, 'Spinach and Cheese.', 'wrgwrg.jpg', 90, 0, '', '', 0, 0, '', NULL, NULL),
(10, 2, 2, 'Turkey, Mushroom, and Swiss.', 'wefwf.jpg', 100, 0, '', '', 0, 0, '', NULL, NULL),
(11, 2, 2, 'Tomatoes, Pesto, and Mozzarella.', 'svsvs.jpg', 110, 0, '', '', 0, 0, '', NULL, NULL),
(12, 2, 2, 'Spinach Artichoke, Chicken, and Cheese.', 'wefwef.jpg', 111, 0, '', '', 0, 0, '', NULL, NULL),
(13, 2, 2, 'Chicken, Bacon, Avocado, and Cheese.', 'egveg.jpg', 112, 0, '', '', 0, 0, '', NULL, NULL),
(14, 2, 4, 'CHICKEN BREASTS', 'wefcw.jpg', 1111, 0, '', '', 0, 0, '', NULL, NULL),
(15, 2, 4, 'RABBIT', 'dfwsf.jpg', 222, 0, '', '', 0, 0, '', NULL, NULL),
(16, 2, 4, 'VENISON', 'wf.jpg', 55, 0, '', '', 0, 0, '', NULL, NULL),
(17, 2, 4, 'PHEASANT', 'sdfsf.jpg', 452, 0, '', '', 0, 0, '', NULL, NULL),
(18, 2, 4, 'OSTRICH', 'egerg.jpg', 44, 0, '', '', 0, 0, '', NULL, NULL),
(19, 2, 1, 'pizza with meat2', 'asd2.jog', 445, 0, '', '', 0, 0, '', NULL, NULL),
(21, 2, 3, 'Steak, Spinach, and Mushroom2', 'fwrfwe2.jpg', 33, 0, '', '', 0, 0, '', NULL, NULL),
(22, 2, 3, 'Spinach and Cheese.2', 'wrgwrg2.jpg', 77, 0, '', '', 0, 0, '', NULL, NULL),
(23, 2, 3, 'Tomatoes, Pesto, and Mozzarella.2', 'svsvs.jpg2', 777, 0, '', '', 0, 0, '', NULL, NULL),
(24, 2, 3, 'Chicken, Bacon, Avocado, and Cheese.2', 'egveg.jpg2', 33, 0, '', '', 0, 0, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `food_categories`
--

CREATE TABLE `food_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_categories`
--

INSERT INTO `food_categories` (`id`, `name`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'pizza', '123.jpg', NULL, NULL),
(2, 'crep', NULL, NULL, NULL),
(3, 'fesh', NULL, NULL, NULL),
(4, 'checken', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_04_223853_create_services_table', 1),
(6, '2021_09_04_224720_create_resturants_table', 1),
(7, '2021_09_05_111039_create_food_categories_table', 1),
(8, '2021_09_05_111205_create_resturant_categories_table', 1),
(9, '2021_09_05_111431_create_foods_table', 1),
(10, '2021_09_10_180700_create_discounts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resturants`
--

CREATE TABLE `resturants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resturants`
--

INSERT INTO `resturants` (`id`, `photo`, `name`, `rate`, `address`, `latitude`, `longitude`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'afwe.jpg', 'Mirazur1', 12, 'Menton, France', '23.45345', '50.4534', '012548853', NULL, NULL),
(2, 'gnfv.png', 'Noma2', 30, ' Copenhagen, Denmark.', '12.5652', '40.6351', '0168418614', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resturant_categories`
--

CREATE TABLE `resturant_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `resturant_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resturant_categories`
--

INSERT INTO `resturant_categories` (`id`, `resturant_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 2, 2, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 2, 1, NULL, NULL),
(6, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ar_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `en_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `ar_name`, `en_name`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'مطاعم', 'foods', 'asdf.jpg', '2021-09-05 11:19:57', '2021-09-05 11:19:57'),
(2, 'قهاوي', 'coffe', 'qweer.jpg', '2021-09-05 11:19:57', '2021-09-05 11:19:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferdLang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `isVerified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `phone`, `photo`, `address`, `latitude`, `longitude`, `preferdLang`, `isVerified`, `created_at`, `updated_at`) VALUES
('asdd235wfw', 'eslam@gmail.com', 'eslam elbanna2', '01210732005', 'VOQc3DRnRMXgSmdKuBFlDAqudowdA6PY6rbq50mt.jpg', 'tanta', '30.1224521', '29.12521', 'en', 1, '2021-09-05 11:22:48', '2021-09-07 20:51:42'),
('asdfg55', 'test@test.com', 'test', '351', '', NULL, NULL, NULL, 'en', 0, '2021-09-05 16:36:43', '2021-09-05 16:36:43'),
('asdfg552', 'test2@test.com', 'test', '351', 'TqSjFm0dn4f5iorXOiHmdyNYsbkr37LOoFl31AUV.jpg', NULL, NULL, NULL, 'en', 0, '2021-09-05 20:00:51', '2021-09-05 20:00:51'),
('asdfg5522', 'test22@test.com', 'test', '351', 'K9rYHWzLx1Xh6kERSEkGdERKWXk5kOV8udIlFmuK.jpg', NULL, NULL, NULL, 'en', 0, '2021-09-05 20:01:27', '2021-09-05 20:01:27'),
('ujmyujmgyj6351', 'esmail@gmail.com', 'esmail ali', '01234567891', 'hb1SHz7CxA0k2uTT8aeNmGBrq6sLnuoJPh1q97K4.jpg', 'alexandria', '22.4534534', '30.4534334', 'ar', 1, '2021-09-05 11:22:48', '2021-09-09 21:12:45'),
('zoom', 'zoom@test.com', 'zoom', '351', 'Nee8R6phb7yLSkn1idknHhJHl2ryGJakKtEFlr5V.jpg', NULL, NULL, NULL, 'en', 0, '2021-09-09 18:58:49', '2021-09-09 18:58:49'),
('zoom00', 'zoom@test.com00', 'zoom00', '351300', 'NfI5wt4niSvRlw1Xki9sc0YK34m2MirOBqGIeql8.jpg', NULL, NULL, NULL, 'en', 1, '2021-09-09 21:29:19', '2021-09-09 21:38:47'),
('zoom2', 'zoom@test.com2', 'zoom2', '3512', 'X6L9yWA342FnRUI0ow2DVYz9417KTOUQCX7tb0Nm.jpg', NULL, NULL, NULL, 'en', 0, '2021-09-09 19:01:19', '2021-09-09 19:01:19'),
('zoom3', 'zoom@test.com3', 'zoom3', '3513', '1mowMf9naBLaLN74mWYmldVZ3DgbXCkrHunMRtxo.jpg', NULL, NULL, NULL, 'en', 0, '2021-09-09 19:02:25', '2021-09-09 19:02:25'),
('zoom4', 'zoom@test.com4', 'zoom', '3513', '0SHaGPEE7VOw5sPHZjtlee0L8xoPUcTaZyd4IDbE.jpg', NULL, NULL, NULL, 'en', 0, '2021-09-09 19:04:29', '2021-09-09 19:04:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food_categories`
--
ALTER TABLE `food_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `resturants`
--
ALTER TABLE `resturants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resturant_categories`
--
ALTER TABLE `resturant_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `food_categories`
--
ALTER TABLE `food_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resturants`
--
ALTER TABLE `resturants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resturant_categories`
--
ALTER TABLE `resturant_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
