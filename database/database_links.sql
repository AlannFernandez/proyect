-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2021 a las 23:11:43
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database_links`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nameClient` varchar(255) NOT NULL,
  `cp` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `locality` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `street` varchar(70) NOT NULL,
  `numberST` int(10) NOT NULL,
  `departament` int(11) NOT NULL,
  `street1` varchar(70) NOT NULL,
  `street2` varchar(70) NOT NULL,
  `extraReferences` text NOT NULL,
  `address` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `nameClient`, `cp`, `province`, `locality`, `district`, `street`, `numberST`, `departament`, `street1`, `street2`, `extraReferences`, `address`) VALUES
(1, 2, 'Alan Fernandez', 3342, 'Corrientes', 'Virasoro', '40 viviendas Manzana 82 Casa 13', 'Lisandro de la torre', 0, 0, 'Manuel Ocampo', 'Laguna Brava', 'Casa de 2 pisos color bordó, ventanas color gris claro', 'Casa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companys`
--

CREATE TABLE `companys` (
  `id` int(11) NOT NULL,
  `cuit` varchar(255) NOT NULL,
  `social_reason` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int(11) NOT NULL,
  `img_profile` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `companys`
--

INSERT INTO `companys` (`id`, `cuit`, `social_reason`, `email`, `password`, `active`, `img_profile`) VALUES
(1, '12212312', 'meraki', 'merakivirasoro@gmail.com', '$2a$10$yIDiYetNhao5R8o0xDd4netIeTDv3yJQy0z0oAfIzDJ7LvKMazJBm', 0, 0),
(3, '11111111111', 'empresa', 'empresa', '$2a$10$LVOAFNAis36g6Klw9yfICuP5UroXOrqSxpCJiaBYAA3xomOa9KjDy', 0, 0),
(4, '11111111111', 'asf', 'empresaFicticia', '$2a$10$9GqGZ9QMEcqWX.5ymfnVVuZ9/m8zqIQkdASVcr/PijEbDunTksVhu', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `price` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `field` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `links`
--

INSERT INTO `links` (`id`, `title`, `price`, `description`, `img`, `field`, `user_id`, `created_at`) VALUES
(37, 'Combo Mega 2', '250', 'Hamburguesa con gaseosa y papas fritas', 'bf90942c-e9ba-4dac-9dc5-688cbb17ef6b.jpg', 0, 2, '2021-08-08 18:44:11'),
(41, 'Huevo Frito', '50', 'huevo frito en aceite', '36e3192b-937d-4e68-9c32-bee1bcc03da1.jpg', 0, 1, '2021-08-13 14:01:27'),
(42, 'Combo Fernet ', '900', 'Fernet 750ml, coca cola 1.75 L y una bolsa de hielo de 1kg', '448a4078-d9e0-4454-b809-f8e4c3bc327f.png', 0, 2, '2021-08-13 18:57:17'),
(43, 'MIlanesa con papas fritas', '300', 'Milanesa de pollo con papas fritas al plato', '24cbbfde-815f-46c5-8530-d465ffb890b8.jpg', 1, 2, '2021-08-13 18:59:09'),
(44, 'Pizza mozarella', '400', 'Pizza casera de mozarella con tomates y aceitunas', '64c12ed8-0e64-4c38-9e5b-6d3da675ebe7.jpg', 1, 2, '2021-08-13 19:03:33'),
(45, 'Yogurt vainilla', '45', 'Yogurt La serenisima\r\nSabor vainilla', 'd11d1e96-e370-4491-b4f2-6e1a1b6c9aed.jpg', 2, 2, '2021-08-13 19:08:09'),
(46, 'Paracetamol', '100', 'Paracetamol 500g', '1d14f0a6-2ac2-42d3-88f0-911161f6c9ad.jpg', 3, 2, '2021-08-13 19:29:29'),
(47, 'Yerba mate Amanda', '395', 'Yerba mate Amanda 1kg', '772479ed-a993-4cb9-b4bc-e27a19b6c015.png', 2, 2, '2021-08-13 19:33:31'),
(49, 'Aceite de Oliva', '450', 'Aceite de oliva extra virgen 1L', '4c20f1f7-6c6e-44f4-889d-0b7bf2a35df5.png', 2, 2, '2021-08-13 19:43:29'),
(50, 'Helado familiar', '600', 'Helado familiar 3L \r\nsabor Chocolate, vainilla y dulce de leche ', 'b7b8ff5a-2abb-4363-8f5e-f40d04373dd9.jpg', 3, 2, '2021-08-13 20:32:19'),
(51, 'Fernet Branca 700 ml', '500', 'Fernet Branca 700 Ml', 'b3378719-0690-45d9-bdfc-0d05354f32d5.jpg', 3, 2, '2021-08-13 20:41:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('PpA3-mVo84GsYPHqBTI3bDHpCzqE4Qvs', 1632332086, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_rol` tinyint(1) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dni` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_rol`, `username`, `password`, `fullname`, `name`, `lastname`, `dni`, `email`, `telephone`) VALUES
(1, 2, 'Fernandez', '$2a$10$rq8yUxhW7JW4f6a/Ve9wn.EhyZQSXRs5Mj1l1KGHWZebXdwqd5OAG', 'Alan', '', '', '', '', ''),
(2, 1, 'admin', '$2a$10$x6MNmpm/UB2sISRSrSIuOORG2wrLC2NBfYqK7GXx.zhU3r4SEigWS', 'aaaa', 'admin', '', '', 'admin', ''),
(7, 0, 'user', '$2a$10$2DOuK2i1lcIzuEiauNst6eaabcYSlUwSwj56eajVPoVfVewrkFrLS', '', 'Alan Nahuel', 'Fernandez', '42741248', 'alanfernande8@gmail.com', '3756010203'),
(11, 0, '', '$2a$10$wjfmHH323oLng4fbqr0Am.MGD2KglxLuqSd0sNIqtEVPrBOLtxlay', '', 'Nahuel', 'Fernandez', '42741248', 'FernandezAlan@protonmail.com', ''),
(18, 1, '', '$2a$10$14Gp5H.HJ9/XkT6aKd3D2OdqA79u2plfS0bn.Zr0d5IvxFZFe2zpu', '', 'Nahuel', 'Fernandez', '1112', 'aaaaaaaaaaaaaaaaa', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_cart`
--

CREATE TABLE `users_cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_cart`
--

INSERT INTO `users_cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(26, '2', '43', '1'),
(27, '2', '43', '1'),
(30, '2', '44', '1'),
(31, '2', '44', '1'),
(32, '2', '44', '1'),
(33, '2', '44', '1'),
(34, '2', '44', '1'),
(35, '2', '43', '1'),
(36, '2', '44', '1'),
(37, '2', '44', '1'),
(38, '2', '44', '1'),
(39, '2', '43', '1'),
(40, '2', '44', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `companys`
--
ALTER TABLE `companys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_cart`
--
ALTER TABLE `users_cart`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `companys`
--
ALTER TABLE `companys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `users_cart`
--
ALTER TABLE `users_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
