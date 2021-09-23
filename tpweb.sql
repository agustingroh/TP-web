-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 23, 2021 at 08:16 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`id_brand`, `name`) VALUES
(1, 'genius'),
(2, 'hp'),
(3, 'logitech'),
(4, 'lenovo');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id_product` int(11) NOT NULL,
  `component` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `price` double NOT NULL,
  `id_brand` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id_product`, `component`, `description`, `price`, `id_brand`) VALUES
(3, 'mouse', 'n/a', 600, 2),
(10, 'mouse', ' ', 600, 4),
(11, 'teclado', ' ', 6000, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`id_brand`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `Product` (`id_brand`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `Brand` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
