-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 18, 2025 at 09:21 AM
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
-- Database: `movieverse`
--

-- --------------------------------------------------------

--
-- Table structure for table `kritik`
--

CREATE TABLE `kritik` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `isi` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kritik`
--

INSERT INTO `kritik` (`id`, `user_id`, `isi`, `tanggal`) VALUES
(1, 5, 'asuu', '2025-07-12'),
(2, 7, 'awqq', '2025-07-12'),
(4, 5, 'hijhoihji', '2025-07-13'),
(5, 11, 'web sangat bagusss', '2025-07-13'),
(6, 10, 'wwww', '2025-07-14'),
(7, 12, 'wkwkkwk', '2025-07-14'),
(8, 12, 'wkwkw', '2025-07-14'),
(9, 5, 'awokkk', '2025-07-14'),
(10, 10, 'palll', '2025-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int NOT NULL,
  `isi` text NOT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id`, `isi`, `tanggal`) VALUES
(3, 'paldi ganteng', '2025-07-13 01:31:52'),
(4, 'film sedang gangguan', '2025-07-13 02:16:49'),
(5, 'web lagi gabutt', '2025-07-14 10:04:22'),
(6, 'Pesan notifikasi dari Postman', '2025-07-14 11:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(5, 'dapi', 'dhaviachmad12@gmail.com', '$2y$10$lx7UVxjZZGn4vltKU4j00e8Q9fLASm3wS6g01hV/Zcll9taUPhFu2', 'admin', '2025-07-12 15:01:18'),
(10, 'faldi', 'achmaddhavi802@gmail.com', '$2y$10$BkFEjgfKldTbSkmqTpEJz.UCparaOu3ze6NB18pupbPRB6hUN2bcu', 'user', '2025-07-13 03:08:23'),
(11, 'dhisti', 'dhistiamalia@gmail.com', '$2y$10$hk26wEybBpY3L024Z4CEJug.UfpubygaNrLV863COvSdfLEuD.Kfi', 'admin', '2025-07-13 14:39:36'),
(12, 'amay', 'amay@gmail.com', '$2y$10$FXIF.A58lalfWgYhFhbplOu0EUpciSds85tzdWEbpqMjy/2q4hqOm', 'user', '2025-07-14 04:31:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kritik`
--
ALTER TABLE `kritik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kritik`
--
ALTER TABLE `kritik`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
