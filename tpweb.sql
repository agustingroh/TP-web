-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-11-2021 a las 02:50:44
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Brand`
--

CREATE TABLE `Brand` (
  `id_brand` int(11) NOT NULL,
  `brand_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Brand`
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
-- Estructura de tabla para la tabla `Comment`
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
-- Volcado de datos para la tabla `Comment`
--

INSERT INTO `Comment` (`id_comment`, `comment`, `punctuation`, `id_product`, `id_user`, `date`) VALUES
(45, 'Excelente producto', 5, 68, 1, '2021-11-20 11:50:56'),
(62, 'no funciona', 1, 68, 1, '2021-11-23 22:48:19'),
(63, 'llego en otro color', 3, 68, 1, '2021-11-23 22:48:44'),
(64, 'no era lo que esperaba pero cumple su funcion', 4, 68, 1, '2021-11-23 22:49:22'),
(65, 'caro para su calidad', 2, 68, 1, '2021-11-23 22:50:00'),
(66, 'me gusto mucho', 5, 62, 1, '2021-11-23 22:50:20'),
(67, 'se ve bien', 4, 62, 1, '2021-11-23 22:50:33'),
(68, 'llego dañado', 2, 61, 1, '2021-11-23 22:50:51'),
(69, 'buena relacion costo calidad', 3, 60, 1, '2021-11-23 22:51:26'),
(71, 'no funciona', 1, 62, 2, '2021-11-23 22:53:50'),
(72, 'se ve borroso', 2, 62, 2, '2021-11-23 22:54:15'),
(73, 'me encanto!', 5, 61, 2, '2021-11-23 22:54:30'),
(74, 'se ve bien', 3, 61, 2, '2021-11-23 22:54:42'),
(75, 'se ve bien', 3, 61, 2, '2021-11-23 22:54:43'),
(76, 'no sirve', 1, 60, 2, '2021-11-23 22:55:04'),
(77, 'se traba mucho', 2, 60, 2, '2021-11-23 22:55:16'),
(78, 'excelente mouse', 5, 63, 2, '2021-11-23 22:55:48'),
(79, 'muy caro', 2, 63, 2, '2021-11-23 22:56:07'),
(80, 'buena calidad', 3, 68, 48, '2021-11-23 22:57:08'),
(81, 'se ve increible', 4, 62, 48, '2021-11-23 22:57:50'),
(82, 'no sirve', 1, 63, 48, '2021-11-23 22:58:10'),
(90, 'muy buena calidad', 5, 67, 2, '2021-11-24 01:01:09'),
(91, 'no enciende', 1, 66, 2, '2021-11-24 01:01:22'),
(92, 'buena relacion precio calidad', 3, 64, 2, '2021-11-24 01:01:55'),
(93, 'recomiendo al 100%', 5, 65, 2, '2021-11-24 01:02:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Product`
--

CREATE TABLE `Product` (
  `id_product` int(11) NOT NULL,
  `component` varchar(30) NOT NULL,
  `description` varchar(300) NOT NULL,
  `price` double NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Product`
--

INSERT INTO `Product` (`id_product`, `component`, `description`, `price`, `id_brand`, `filePath`) VALUES
(60, 'mouse', 'excelente mouse gamer ultra sensible', 1500, 121, 'public/uploads/619d8e0abacb70.79635568.jpg'),
(61, 'monitor 24\'\'', 'Un monitor a tu medida\r\nCon tu pantalla LED no solo ahorrás energía, ya que su consumo es bajo, sino que vas a ver colores nítidos y definidos en tus películas o series favoritas.', 28000, 127, 'public/uploads/619d8dc0476a62.72936049.jpg'),
(62, 'monitor 18.5', 'El compromiso que define a Philips es brindar a sus usuarios nuevas y evolucionadas tecnologías. Es por ello que cuida los detalles de cada uno de sus productos para hacer la diferencia. Gozá de una experiencia única con este monitor que te ofrece gran calidad e innovación en uno solo.', 18000, 128, 'public/uploads/619d8dafec7f74.31229313.jpg'),
(63, 'mouse', 'Adaptado a tus movimientos\r\nEl mouse de juego te ofrecerá la posibilidad de marcar la diferencia y sacar ventajas en tus partidas. Su conectividad y sensor suave ayudará a que te desplaces rápido por la pantalla.', 2500, 129, 'public/uploads/619d8de063fa19.17020818.jpg'),
(64, 'teclado gamer', 'La gran calidad  hp, y su precio económico lo vuelven un atractivo ideal para que te diviertas frente a la pantalla. Su ergonomía, su base antidelizante y su rápido tiempo de respuesta permite que tus juegos favoritos se sientan más cerca que nunca, al alcance de tus manos.', 4500, 123, 'public/uploads/619d8e58de8036.56950909.jpg'),
(65, 'teclado', ' Está diseñado especialmente para que puedas expresar tanto tus habilidades como tu estilo. Podrás mejorar tu experiencia de gaming, ya seas un aficionado o todo un experto y hacer que tus jugadas alcancen otro nivel.', 5000, 128, 'public/uploads/619d8e4496e5a0.08916299.jpg'),
(66, 'Notebook 15', 'Los equipos Dell se destacan por ofrecer soluciones reales para cada una de las necesidades. Ya sea para conectarte, entretenerte, trabajar o colaborar de manera online, podrás hacerlo de forma segura desde cualquier lugar y en cualquier momento.', 65000, 130, 'public/uploads/619d8e1f85d860.37273941.jpg'),
(67, 'Notebook 15.6', 'Su pantalla LCD de 15.6', 90000, 124, 'public/uploads/619d8e2e7f5853.29726395.jpg'),
(68, 'Auriculares ', 'El formato perfecto para vos\r\nEl diseño over-ear brinda una comodidad insuperable gracias a sus suaves almohadillas. Al mismo tiempo, su sonido envolvente del más alto nivel se convierte en el protagonista de la escena.', 3000, 128, 'public/uploads/619d8d96830794.23821683.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

CREATE TABLE `User` (
  `id_user` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `User`
--

INSERT INTO `User` (`id_user`, `email`, `password`, `role`) VALUES
(1, 'agusgroh@gmail.com', '$2y$10$J96s6YeDU6J8BI8UiNSm5OymiEyS8aSZkbgP5n5nKYptknKkdNz0i', 1),
(2, 'arielarrillagagm@gmail.com', '$2y$10$BeMlSFjyaQu0YWwhmXViNe93Ko7.ps6gPPh2U3AB0f5Umhsl.eQC.', 1),
(3, 'user@gmail.com', '$2y$10$x2eBxzBGSG3xGKhmhhKHm.F8uDxuKss2O4IQZWYsglmz8BrxIDNee', 2),
(6, 'test@gmail.com', '$2y$10$aQ5d1ww2m/n22pIsiPijXeFwgbWYwZQOyQU/6Z4mMX6JEqca7y5dy', 2),
(44, 'admin@gmail.com', '$2y$10$F8aklP1cTFGHFcpb/rPINevy27SSqR6xrBUS4rrtoycpRMWaS0L26', 1),
(48, 'usuario@usuario', '$2y$10$HQP7vc9aVbLPzdQgiNBZ..R8WCFvaVc2avCV75.3acooN5yCqA1W.', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indices de la tabla `Comment`
--
ALTER TABLE `Comment`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `idProduct` (`id_product`) USING BTREE,
  ADD KEY `idUser` (`id_user`);

--
-- Indices de la tabla `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `Product` (`id_brand`);

--
-- Indices de la tabla `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Brand`
--
ALTER TABLE `Brand`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `Comment`
--
ALTER TABLE `Comment`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `Product`
--
ALTER TABLE `Product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `User`
--
ALTER TABLE `User`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `Comment_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `Product` (`id_product`) ON DELETE CASCADE,
  ADD CONSTRAINT `Comment_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`id_brand`) REFERENCES `Brand` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
