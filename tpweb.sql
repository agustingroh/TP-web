-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2021 at 03:05 PM
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
  `brand_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`id_brand`, `brand_name`) VALUES
(124, 'Acer'),
(130, 'Dell'),
(123, 'hp'),
(129, 'Logitech'),
(121, 'lonovo'),
(128, 'Philips'),
(127, 'Samsung');

-- --------------------------------------------------------

--
-- Table structure for table `Comment`
--

CREATE TABLE `Comment` (
  `id_comment` int(11) NOT NULL,
  `comment` varchar(1024) NOT NULL,
  `punctuation` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Comment`
--

INSERT INTO `Comment` (`id_comment`, `comment`, `punctuation`, `id_product`, `id_user`, `date`) VALUES
(45, 'Excelente producto', 5, 68, 1, '2021-11-20 11:50:56'),
(46, 'sa', 5, 62, 1, '2021-11-20 12:31:54'),
(47, 'test', 5, 62, 1, '2021-11-20 12:32:33'),
(48, 'hplaaa', 5, 62, 1, '2021-11-20 12:36:17'),
(49, 'test puntuacion 4', 4, 62, 1, '2021-11-20 12:43:29'),
(50, 'test bueno', 4, 62, 1, '2021-11-20 13:20:06'),
(51, 'test muy bueno', 4, 62, 1, '2021-11-20 13:20:16'),
(52, 'test regular', 2, 62, 1, '2021-11-20 13:20:28'),
(53, 'test excelente', 5, 62, 1, '2021-11-20 13:21:24'),
(54, 'test malo', 1, 62, 1, '2021-11-20 13:21:35'),
(55, 'test BUENO', 3, 62, 1, '2021-11-20 13:21:46'),
(56, 'test MUY BUENO', 4, 62, 1, '2021-11-20 13:21:57'),
(57, 'ewewe', 5, 63, 1, '2021-11-20 13:45:33'),
(58, 'aa', 5, 68, 1, '2021-11-20 13:50:41');

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
(60, 'mouse', 'n/a', 1500, 121),
(61, 'monitor 24\'\'', 'Un monitor a tu medida\r\nCon tu pantalla LED no solo ahorrás energía, ya que su consumo es bajo, sino que vas a ver colores nítidos y definidos en tus películas o series favoritas.', 28000, 127),
(62, 'monitor 18.5\"', 'El compromiso que define a Philips es brindar a sus usuarios nuevas y evolucionadas tecnologías. Es por ello que cuida los detalles de cada uno de sus productos para hacer la diferencia. Gozá de una experiencia única con este monitor que te ofrece gran calidad e innovación en uno solo.', 18000, 128),
(63, 'mouse', 'Adaptado a tus movimientos\r\nEl mouse de juego te ofrecerá la posibilidad de marcar la diferencia y sacar ventajas en tus partidas. Su conectividad y sensor suave ayudará a que te desplaces rápido por la pantalla.', 2500, 129),
(64, 'teclado gamer', 'La gran calidad  hp, y su precio económico lo vuelven un atractivo ideal para que te diviertas frente a la pantalla. Su ergonomía, su base antidelizante y su rápido tiempo de respuesta permite que tus juegos favoritos se sientan más cerca que nunca, al alcance de tus manos.', 4500, 123),
(65, 'teclado', ' Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Podrás mejorar tu experiencia de gaming, ya seas un aficionado o todo un experto y hacer que tus jugadas alcancen otro nivel.', 5000, 128),
(66, 'Notebook 15\"', 'Los equipos Dell se destacan por ofrecer soluciones reales para cada una de las necesidades. Ya sea para conectarte, entretenerte, trabajar o colaborar de manera online, podrás hacerlo de forma segura desde cualquier lugar y en cualquier momento.', 65000, 130),
(67, 'Notebook 15.6\"', 'Su pantalla LCD de 15.6\" y 1920x1080 px de resolución te brindará colores más vivos y definidos.', 90000, 124),
(68, 'Auriculares ', 'El formato perfecto para vos\r\nEl diseño over-ear brinda una comodidad insuperable gracias a sus suaves almohadillas. Al mismo tiempo, su sonido envolvente del más alto nivel se convierte en el protagonista de la escena.', 3000, 128);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `id_user` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`id_user`, `email`, `password`, `role`) VALUES
(1, 'agusgroh@gmail.com', '$2y$10$J96s6YeDU6J8BI8UiNSm5OymiEyS8aSZkbgP5n5nKYptknKkdNz0i', 1),
(2, 'arielarrillagagm@gmail.com', '$2y$10$BeMlSFjyaQu0YWwhmXViNe93Ko7.ps6gPPh2U3AB0f5Umhsl.eQC.', 1),
(3, 'user@gmail.com', '$2y$10$x2eBxzBGSG3xGKhmhhKHm.F8uDxuKss2O4IQZWYsglmz8BrxIDNee', 2),
(6, 'test@gmail.com', '$2y$10$aQ5d1ww2m/n22pIsiPijXeFwgbWYwZQOyQU/6Z4mMX6JEqca7y5dy', 2),
(44, 'admin@gmail.com', '$2y$10$F8aklP1cTFGHFcpb/rPINevy27SSqR6xrBUS4rrtoycpRMWaS0L26', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indexes for table `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `idProduct` (`id_product`) USING BTREE,
  ADD KEY `idUser` (`id_user`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `Product` (`id_brand`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Brand`
--
ALTER TABLE `Brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `Comment`
--
ALTER TABLE `Comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `Product` (`id_product`) ON DELETE CASCADE,
  ADD CONSTRAINT `Comment_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `Brand` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
