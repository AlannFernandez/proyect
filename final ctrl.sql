-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2021 a las 19:59:22
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
-- Estructura de tabla para la tabla `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `price` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `field` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `links`
--

INSERT INTO `links` (`id`, `title`, `price`, `discount`, `description`, `category`, `img`, `field`, `user_id`, `created_at`) VALUES
(37, 'Combo Mega 2', '250', 5, 'Hamburguesa con gaseosa y papas fritas', 'Comida rapida', 'bf90942c-e9ba-4dac-9dc5-688cbb17ef6b.jpg', 0, 2, '2021-08-08 18:44:11'),
(41, 'Huevo Frito', '50', 5, 'huevo frito en aceite', 'Comida rapida', '36e3192b-937d-4e68-9c32-bee1bcc03da1.jpg', 1, 1, '2021-08-13 14:01:27'),
(42, 'Combo Fernet ', '900', 0, 'Fernet 750ml, coca cola 1.75 L y una bolsa de hielo de 1kg', 'bebidas', '448a4078-d9e0-4454-b809-f8e4c3bc327f.png', 0, 7, '2021-08-13 18:57:17'),
(43, 'MIlanesa con papas fritas', '300', 0, 'Milanesa de pollo con papas fritas al plato', 'Comida rapida', '24cbbfde-815f-46c5-8530-d465ffb890b8.jpg', 1, 2, '2021-08-13 18:59:09'),
(44, 'Pizza mozarella', '400', 0, 'Pizza casera de mozarella con tomates y aceitunas', 'Comida rapida', '64c12ed8-0e64-4c38-9e5b-6d3da675ebe7.jpg', 1, 2, '2021-08-13 19:03:33'),
(45, 'Yogurt vainilla', '45', 0, 'Yogurt La serenisima\r\nSabor vainilla', 'lacteos', 'd11d1e96-e370-4491-b4f2-6e1a1b6c9aed.jpg', 2, 2, '2021-08-13 19:08:09'),
(47, 'Yerba mate Amanda', '395', 0, 'Yerba mate Amanda 1kg', 'Yerbas', '772479ed-a993-4cb9-b4bc-e27a19b6c015.png', 2, 2, '2021-08-13 19:33:31'),
(50, 'Helado familiar', '600', 0, 'Helado familiar 3L \r\nsabor Chocolate, vainilla y dulce de leche ', 'Helados', 'b7b8ff5a-2abb-4363-8f5e-f40d04373dd9.jpg', 3, 23, '2021-08-13 20:32:19'),
(51, 'Fernet Branca 700 ml', '500', 15, 'Fernet Branca 700 Ml', 'bebidas', 'b3378719-0690-45d9-bdfc-0d05354f32d5.jpg', 3, 2, '2021-08-13 20:41:37'),
(55, 'Coca cola', '50', 0, 'coca cola lata 300 ml', 'gaseosas', '0fed2c56-be01-4854-9a39-31d1867cc02b.png', 0, 7, '2021-10-14 17:10:44');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

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
