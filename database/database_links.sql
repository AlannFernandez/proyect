-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2021 a las 00:25:29
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
  `address` varchar(10) NOT NULL,
  `lng` varchar(100) NOT NULL,
  `lat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `nameClient`, `cp`, `province`, `locality`, `district`, `street`, `numberST`, `departament`, `street1`, `street2`, `extraReferences`, `address`, `lng`, `lat`) VALUES
(1, 2, 'Alan Fernandez', 3342, 'Corrientes', 'Virasoro', '40 viviendas Manzana 82 Casa 13', 'Lisandro de la torre', 0, 0, 'Manuel Ocampo', 'Laguna Brava', 'Casa de 2 pisos color bordó, ventanas color gris claro', 'Casa', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name_category` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name_category`) VALUES
(1, 2, 'pizzas'),
(2, 2, 'bebidas');

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
  `makes_delivery` int(11) NOT NULL,
  `price_delivery` int(11) NOT NULL,
  `sponsored` int(11) NOT NULL,
  `online_payments` int(11) NOT NULL,
  `img_profile` int(11) NOT NULL,
  `points` decimal(11,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `companys`
--

INSERT INTO `companys` (`id`, `cuit`, `social_reason`, `email`, `password`, `active`, `makes_delivery`, `price_delivery`, `sponsored`, `online_payments`, `img_profile`, `points`) VALUES
(2, '12212312', 'meraki', 'merakivirasoro@gmail.com', '$2a$10$yIDiYetNhao5R8o0xDd4netIeTDv3yJQy0z0oAfIzDJ7LvKMazJBm', 1, 1, 90, 1, 1, 0, '2'),
(3, '11111111111', 'heladeria', 'empresa', '$2a$10$LVOAFNAis36g6Klw9yfICuP5UroXOrqSxpCJiaBYAA3xomOa9KjDy', 0, 0, 0, 0, 1, 0, '0'),
(4, '11111111111', 'kiosco', 'empresaFicticia', '$2a$10$9GqGZ9QMEcqWX.5ymfnVVuZ9/m8zqIQkdASVcr/PijEbDunTksVhu', 1, 0, 0, 0, 1, 0, '0'),
(5, '11111111111', 'Empresa', 'email@test.com', '$2a$10$Sa8vbtJ6UPjCjPfjmtGFKO08t/kkGEnkFLyx4egu.cdQBfpH2tf.q', 1, 0, 0, 1, 0, 0, '0');

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
  `category` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `field` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `links`
--

INSERT INTO `links` (`id`, `title`, `price`, `discount`, `description`, `category`, `img`, `field`, `user_id`, `created_at`) VALUES
(37, 'Combo Mega 2', '250', 0, 'Hamburguesa con gaseosa y papas fritas', 0, 'bf90942c-e9ba-4dac-9dc5-688cbb17ef6b.jpg', 0, 2, '2021-08-08 18:44:11'),
(41, 'Huevo Frito', '50', 5, 'huevo frito en aceite', 0, '36e3192b-937d-4e68-9c32-bee1bcc03da1.jpg', 1, 1, '2021-08-13 14:01:27'),
(42, 'Combo Fernet ', '900', 0, 'Fernet 750ml, coca cola 1.75 L y una bolsa de hielo de 1kg', 2, '448a4078-d9e0-4454-b809-f8e4c3bc327f.png', 0, 2, '2021-08-13 18:57:17'),
(43, 'MIlanesa con papas fritas', '300', 0, 'Milanesa de pollo con papas fritas al plato', 0, '24cbbfde-815f-46c5-8530-d465ffb890b8.jpg', 1, 2, '2021-08-13 18:59:09'),
(44, 'Pizza mozarella', '400', 0, 'Pizza casera de mozarella con tomates y aceitunas', 1, '64c12ed8-0e64-4c38-9e5b-6d3da675ebe7.jpg', 1, 2, '2021-08-13 19:03:33'),
(45, 'Yogurt vainilla', '45', 0, 'Yogurt La serenisima\r\nSabor vainilla', 0, 'd11d1e96-e370-4491-b4f2-6e1a1b6c9aed.jpg', 2, 2, '2021-08-13 19:08:09'),
(46, 'Paracetamol', '100', 0, 'Paracetamol 500g', 0, '1d14f0a6-2ac2-42d3-88f0-911161f6c9ad.jpg', 3, 2, '2021-08-13 19:29:29'),
(47, 'Yerba mate Amanda', '395', 0, 'Yerba mate Amanda 1kg', 0, '772479ed-a993-4cb9-b4bc-e27a19b6c015.png', 2, 2, '2021-08-13 19:33:31'),
(49, 'Aceite de Oliva', '450', 0, 'Aceite de oliva extra virgen 1L', 0, '4c20f1f7-6c6e-44f4-889d-0b7bf2a35df5.png', 2, 2, '2021-08-13 19:43:29'),
(50, 'Helado familiar', '600', 0, 'Helado familiar 3L \r\nsabor Chocolate, vainilla y dulce de leche ', 0, 'b7b8ff5a-2abb-4363-8f5e-f40d04373dd9.jpg', 3, 2, '2021-08-13 20:32:19'),
(51, 'Fernet Branca 700 ml', '500', 0, 'Fernet Branca 700 Ml', 2, 'b3378719-0690-45d9-bdfc-0d05354f32d5.jpg', 3, 2, '2021-08-13 20:41:37'),
(55, 'Coca cola', '50', 0, 'coca cola lata 300 ml', 0, '0fed2c56-be01-4854-9a39-31d1867cc02b.png', 0, 7, '2021-10-14 17:10:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_cart` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `cart_id`, `total`) VALUES
(1, 1, 2, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
('-gPIDWsf3ZfCDIUyzSDhCGBlknkkNob9', 1635459632, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('-hDkXj_GDLdvMAna0EXGmUSBEjbgEUg0', 1635448376, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('0B6x7QRGOqOlxE8ca4w30wZPZYqfWrXD', 1635459617, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('0GvJmXUdyJN4AkjHlciq0j6YTiOff_Cn', 1635448518, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('0TTq3HZuNxmCJBbiQV3oehcUiQWlubBC', 1635447101, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1OGmhfKrnyFV-qqQuDaCzWDBzWC7Ybvj', 1635455511, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1sCC3EvKytubqlS-w4Ki9xtxJD3GjL1O', 1635453940, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('2F8IBGIdejgrGisC6V54vGQPO6hGyYFG', 1635442043, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('2JXamTeK6jq8Rn1zY2d03_p0DBKMDdOX', 1635456153, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3cgA075VHefu3csN6x-ImntsyDZ0I_oU', 1635446465, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3gbWwwPFG4EPzR93MBOGch-r5hNZYECi', 1635445960, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('4cHVKr7rjMlhtYM5wJWUyXkauYmAvliE', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('4nreS06Kf9Kk0f7L1ljKSuOKZjodzfiN', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('4ylr31iWaQjmyfnqD-SF5L6Mvu0P0a7R', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5RjFgE2actm1gmj6I18xb6gE3oYz0Q19', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5o5WoyNRuUfx_92jT6myGdh898LHmCU-', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5yNH1kxoFIIcM7jJm-JY7X2gDD3wWwn5', 1635445770, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('6I0CzvvzMDwhqlyCqpNEDuyZjm_ACl7Z', 1635453440, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('6ySA_zucvWylG2eSg2TCq3nwrNTboSwv', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('713kF5hxp3y64K2LxaLXM-FJBzzBzOk4', 1635442760, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('7V8FZ1ZUFV-a6c7o-0mOSBYFlYIRP4jd', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8DkAGo1jZv4lHn8apISKdiSb3J7piDay', 1635447856, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8KwHw6aRlEtqXfT5IzGznCFNyMJ89nG1', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('9E7X4plJCUwg83yf6-8JLIqsX19U4989', 1635443124, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('AT_0aXj7fXD5X1XK7e8b78eRI2ufW_u2', 1635455558, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('AiHKGACREfRJTXzpp0U_FgXhqPwUpoPh', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BOcmtVuk1s4T4UtnmYYE2rIq1tz_MuVj', 1635442792, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BYRTNhC-_F5Vtji4xqUcaUxmI0DT6nQV', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Bzz-wSL9fJd8rz5qbueUYG0lYN9vBMJw', 1635445774, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('C6QYr0HYgAP1rHZzLqRSue9Rd0JFdHRb', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CFQhbw3p75Ly5A8ifn2hmEhfeSf2izuo', 1635446569, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('C_WVqVeNDGVpS-cR7OX5S018gVq5xKrQ', 1635446216, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CuR2YVv0X8u1XDYMgUSh5aIfP72c6Rns', 1635441881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CvS6lp_k3eYfXqIPpBnCELC_xvZ1Vp1D', 1635445967, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('DQT-DoORz3iZOCrZAf3nyU_jAUrdNBd4', 1635444040, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('DYuHG-r2-QqovOY3zIggSFEHyB78bb3y', 1635443900, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Dic-h2n30dOcpkgtz0b9sj0Tt5WTtom2', 1635442368, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('EEowvKm78tSjBaFMdZO0QRv5le11K4nX', 1635442029, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ea1_QJh3uMzg6q3a0IAQXzcL4sBWki70', 1635455193, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ed3oBml0LjILEOHrUMentrJ8vWchDOfW', 1635444816, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('EtJS6_iu7V367WpfocE5icpYO9AtohG9', 1635454068, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ev8vFes0gwOwwYYTdioUxNg7o6Owzs0_', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('FFh96546EthtIGS1GH4vSY6MY2hQCcdz', 1635444795, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('FJyd2cMjQoUEQMReuLhciLtd0Pw4QfCX', 1635447880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('FopuxAHBJEwPNCjWuMfIm4rOx1jEqMYM', 1635443758, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Fw580LVtSdd9xTJhQzgULSn-eICwerwg', 1635442793, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('GG5SPGSiKjnFH0UkCstdMS5lHlc7OZAr', 1635453084, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('G_uyf7jQ4sWv_lJ93CtP6OPPlQDa8s9N', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HKKFtVl4_zyR1iqlGy4nciyzdT4wdonG', 1635445077, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HPdF7doNdxT1r-f313AfYcu0TDMUZSiH', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HeeuraBHpAPfUfF-0CPSRNb6doTEj_KO', 1635445806, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('IGjDH2JnRKmxUzsQvjRqzMue0UT8mbSe', 1635453084, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JA4WNX8OZXgTMZfNExJ391THbRGxA31e', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JIsXT7FCPj19JR5tiR2h22DmL3aw9IZJ', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JR2eMyR4aaQLsFEZnkxdZRtOhTILLdqk', 1635448210, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JccMoIGPTynVYVSsGbTqUm7SrxwUhXXo', 1635442411, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('L6weJD2qjD0wiLx-CIUql-PYTozDTI8U', 1635459541, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('LDCD_LMf79YtZrI-VzOaWkwxJkgRyNxb', 1635445815, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('LPawAwFBRjJFhoFP0UQv27fJShFogl4j', 1635456989, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('LhS_ZwONfgdxMNbHQkcBwHtVyqoEe9He', 1635456167, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Lhu365ZK3DlZk1ySj02ljpIxPoEVa4G8', 1635442029, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('M8zWXT_LkQukeuBAzPEZH22bfZoK2ySf', 1635442793, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('MPGp0YgBVQVVutT7uF3Uf6junsgo33l2', 1635453157, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('MYlsH1roIdVnHEkAU0_y2QLFOsy2L0gU', 1635441879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('N3GvXz_MGBltnFhKFFlWJdL_rbJX7oUa', 1635446875, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('NFME8bUBQjAD0Jmj9UWDOiqXidmm_F1p', 1635446188, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('NlD8F5rCieFgzCWFvwzrSjSmg6k4jyuK', 1635452737, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Nt5YNq9IS7nOensCrHNhLyIzyUQOhv-2', 1635448302, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('NvBbB78a1BlauSIOcwmVIX_zLv7ttEZR', 1635443899, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OtUKtOejb0AwsR901ZqCz3bTWaOAWBpM', 1635459172, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('P6R8nh17jZ1t0mGGjcpi_gnmu7eL_2M0', 1635447870, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('P6RmZ9z3CCIGWiQWUBVYoJ4Ttr2wKBg4', 1635442029, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('PlbtCM-7jBlem9GeqCBzF707xRormN7i', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('QYtr4b9wXzoZWqpH7_oOxGuq0lALY0J7', 1635448028, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Qk-kNybvmA43-aeeWS6MHyMnNIjJlQLu', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('QxF4koGSdNfYTxP1UiYH366mdPcUXtlz', 1635446218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('RCLtcVjaD_Cu53ZZ2WZgQW1YMtJgtneF', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('SJz4YkS2cOJsKZOTMCXPoQC_-rjmRYvB', 1635442694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Skg0SHs7Qs9H2glO0076DmFMvOqX-tcD', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('TFyfspDjZR7HoEjzmRkCyZovumzK5NoM', 1635446781, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('TaawGaRgaBu35W9VBGMYCZ9QQUp87FNy', 1635441881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Tk9xkbL9gAqvGb63qKkBLIt0IeBkn0p5', 1635448382, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Tt9KsxH2UHAqqVbeE9hOSpQouxXNkFPz', 1635442761, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('U3OsQYQCfhAMl293vZCx7gow0Ze0JQoX', 1635445770, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ud0vz4Cal1MwRpTRhsSgEMcsmUq5UGrU', 1635446878, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('UjcXf8pw4hhaXodE20O6WMq8e3LMBi8v', 1635445814, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('UkVT7w45xgj0E95zqthXeEwj2Up_Rh4c', 1635449692, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('UwqqU6jmDQsyvXTork0SYzYOFSw07wys', 1635443491, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('V0UP-lgd5QQ0Cz2o-6WEO_6UNzkWY2U6', 1635447141, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('VbVce1N-0j-c25Oyn-JPFem1k-2YHLJP', 1635459044, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('W15__i_4JjcTGbPcKZMeKoTg_AYWVI2Y', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('W2AAdxZxH1S0UPTvR_778jjJKT2UzWGC', 1635445815, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WYsqQvTDY7AzpfD3tSyd-ixAkHmZUO-n', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WdcYFYKPk36cydulz2gZoXkxCEbcuc0v', 1635447235, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WoZV9dbtgaWw_ThUsXUL2DNMvW_apkEN', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Wxom95SBXjEfRTOdyFWptCP2ivklOeSC', 1635443071, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('X6iJaIZFu-9hO28VhaCVo5FMPb1WaDEq', 1635442028, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('XIoFMlR3rvmHuUu-uF4QeFybn6jhwZdK', 1635446569, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('XVVbwy_rUHcnTgzMRIOlhufaLd6BnGoT', 1635456167, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Xb19MwB251ee2PsrRqSSkJ2to8dPw3GG', 1635447008, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('XlBab_BY8UbInFaFZSpsRknLSphu_8iw', 1635445063, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Xu3eDp5tolNbcd3I3nSdu_uo8alwvdAZ', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('YX4cyZWH2w7D1SRkEMZWlSCiKphQBTdl', 1635446778, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('YrJyy9KWaTaXT2C4uXqdX8bs39C-Ki3K', 1635445967, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Zs4Pu9jZTpwR4vRClawAb8W3mC-2zHtr', 1635443960, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_FYSr1vrwmDNaRtMUsQcQtfQgT8bbngH', 1635441879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_a6aUE9FBX5KzqwC2q8o2xu-c2yk8UPW', 1635453866, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_gSmtafPovRA_r5e7TYVOQgSbR7QCVrs', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_jEbWPSSCeZ57CBNFYU_KWRK7kEeCNRi', 1635445814, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('aKyFP4mArud_9Y4z-DUR1DcDkBjovY2p', 1635441879, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('aO5imcr_oiQNn7GDFwUgaOQqpgbM5z1R', 1635442760, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('b1aBdwznosdUQh_CzoRB8RP5c5wx4LUl', 1635453803, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('b1wPTbFtezzUV7UcKRkJ1T8CrhxL_vA4', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('b5-f1K79rtBh-YJ8CsgOmTrFcC_b8Vwg', 1635455753, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('b9wCl8knZgThYjdnqstTM59RUrUNugUO', 1635442792, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bBtYDAZkXmqi4_WV0Q0kMkkdBDOW-747', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bOG4N48q2-j9xkPUYWAP5Wq0vfKss3xI', 1635448357, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bfumCY0ES-CPXM0KIMw8dPJQrf9IaMkU', 1635448320, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bltP9AabZir3Yqua3hSoDgb36qr4eKsU', 1635444881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('c2_ETpjt_V73E5mcWbfNqgvuZT3Oi6iB', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('cOsn3SK1GLPCre8mKFuBBjvEmw0773bV', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dDrcx4ZtHlRGCBoxVjnWZ6nvXIARt2G4', 1635455105, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dJqdTh931jWU2nUrn1r3yM6xV6WvhNuG', 1635453866, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dasKnUNCvtUUYPMe2ZELqvGHSU06_2ET', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dr0n6TjiSWIwM6YzTdG0UY0zs_EyFLiL', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dt90UYUca9ML1bQanItz1qs-ph1JGx6k', 1635456354, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('eV-3f28hYkQJhhm7GV0ekm0XCwBTZLLo', 1635445081, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('eaVqmNs6YrIjkiijoW6Bsp-Oh58Sep12', 1635459641, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":2}}'),
('eje_z775U0l28_ZOUDp6MzpP3QRwsvgv', 1635443532, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('f45SFVUn_4OGCniyVFiLLpT5SsQRwWL6', 1635445808, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('f9sRllC2URyN6w0VWFbavYzyoYc0TmSq', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('fEOmHxSvovC4506Bj4M8O-55rdgK9FLC', 1635443056, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('fL4wALH0cwqZUVec3f7bDpFSWZBL0Xi_', 1635447181, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('fMfBJ8whCR56QuRuYFPP_AN6F8jLjXuB', 1635447509, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('gM4VJ5AunbNbEYxa_ZwKykojFeycAtAA', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('gXEPjTbKkq-X7f2nZYr3OrmgDHp1QQX9', 1635446425, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hDATWOtv3O8Rfde8C7Fs5eKDsWIzrn54', 1635448106, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('haKD4hMEe-8BtFuG2kTZ425zOhFwqUHb', 1635448283, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hjAmWnxDEf0lK5v2M0ttNOXXFD9yZRuE', 1635445064, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hrbwWgif14tASfNJPAiKiJEKV0qcO9D1', 1635448149, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hsWqwAJ5TfHNt3uklxhn2Rdju9-fwey-', 1635459053, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hzaMzoGg87K9tjs6QCMV-wxEr6h2CzBd', 1635441878, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('iNI1S6GARNSxVhpB0-BWWgkAWnA8TsZy', 1635446608, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('iOpy435IA4ARHpLkKM_xfOQGLfLb6a8k', 1635446425, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('is8KFU4-nlZcdHh-lM0wKb6OKlCOiptB', 1635444580, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('iwJ6SBSb4FlKwR1sazCrl35_YR-oagK0', 1635442760, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jHsDGVQBiCKVBOXN90X280p1nUIdExvE', 1635447873, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jJde3kIvtArjElFg3OjUPETiu2IAGECh', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jSPKjju8jywKfg_y__8ew3_Deb2HRdNM', 1635444582, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jSqDpxz9ARm_bXbWhxpBIxCz9TRRLHHh', 1635455135, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jYH02u3wypSmJ-61JbsQPIKyqUw1ric3', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jhejKQvKz_G58oynY7K39u-sFAt5DGp8', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jnMo0awfenEq84c9zmBEAPrPGvtqMhN2', 1635446608, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kMBjUHcLRbHFW28ga-zNzvo2N0ZLrg56', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kOGUABlUyH65r7Zl9_8lz_GU-A0gAI0T', 1635455654, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kh_sdBchZogpGzWglcMEiUjR7SflnpLh', 1635441881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kmAj7iqFqXkDH19ytnvuYnQkq-42nGh9', 1635441881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kvBgLr79INGJpZ9DxbyJRRXvX9lSohGL', 1635447103, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ky7phBwJxSaB9akgbuRPoIXPOPwMAxp_', 1635447936, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kyxHq9s8STs-aSFPKxBXenHv1ROB-Ux2', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lADL5GOrCnvAASkQuiTdTpuVukotHxdi', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lArKcskh1YZ_8rJSlt-8Njw_2f2oTGGu', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lKdwchfYxmVQmI38t33DExPpqEcWFMaD', 1635446192, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lYJdG8j2cb9B3ZNLPFZt0zOyyRY2_hO7', 1635445808, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lcXCO6CzvJ5LaDb58k9XO6ag_MLTbLIA', 1635442694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ls34B0KX3DrCCgxu8V0plU_raH1bEuwD', 1635446466, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('mFNd2xF5ZGMjjuaJiokr15zCNH0kEvGr', 1635459062, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('mijZcn6zmBfslp5WjED4Vdx1Qjd9tMjD', 1635442759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('my751jiZRghvG5HbbRCRtTLSp4R5ZI3O', 1635448294, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('nGOOgyh53r2cxhi_lnj4_3twg3wTINP3', 1635445794, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('nNnNEUB-sirZDcGQzRyAhbH1iWoi4Ahg', 1635445806, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('n_zOdCEJ4ZGThRM_VRiXs41OhmEOeayT', 1635448383, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('noq0Q5YZc7-Su8s_uZmLS1WuD56_pR3K', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('o07KnqSB01sNrL92eIehYxbmTNvOGL6M', 1635443796, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('o6jF6zRaL6URDMXG6DIl4z1ek-ewRe8i', 1635441881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('oQ0W53AUtrIwq5_t3IEv7wKCAFwXlWkM', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('oTEaoqqu6hmi9bPbqh0BMEEiWhbIY8m0', 1635443123, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ojgEp2F21aEnvv9VqJHLGyMyWnCes11R', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('p0WcWS6lG-LE5stL6hXxvuTj3r_MfMXY', 1635453654, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('p2owzbA9KanZfQJPB4vBpEcS-kWD_Ged', 1635445960, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('p80XjfA5HVBzTucNV4G9D5TGprKNkx20', 1635453802, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('pCLXNk2UCX4QiJDdc18RenzQNY5OtocP', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('pt_FkOMKmu0qKyiQa4dTbAkkIQCCEAX3', 1635443524, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qHKmAQRaqPhKqnsIDdtd3oGJt8QpWt1g', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qQt25MnmofZxO3i1SjTp2XbZCSmb5pTj', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qW1UA82E3_Cwn-MWWL_saUHYUMBqeSzt', 1635455753, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('rTXn1H7eHCu-O1Sd8C5SM9javm4SOown', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('rxRmCFLl6vLMUp1CSResF2wNDRvACZui', 1635443759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('s7ZjrtoiGCLpgkeaqYDh0ot7A3x74PqP', 1635459290, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('sBjjPHw_YHDqJ17Y0IazMVy1AD3qTzQl', 1635442759, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('sC3Ju0Omrd0noTANMOzScR-69f-8D7ZF', 1635444999, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('skhqONuPGaFv5xBFifuJgTGF1RMJOaL6', 1635444997, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('slIu-HzPQ7K5cyg7_570YYZu9KOvUtwg', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tHlTv-6TUYdIUNdctIDzuxpWor56Z0iq', 1635445770, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tMloyF5XYDYToa4X1NbmRnZSZoHdlywv', 1635443605, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tTpFHSb-oQMBGglHOlghebxT-UDg1Lra', 1635446191, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tlKWWwGAvXGg4KiFdWJ5RZhlcbPPJr2n', 1635445907, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('uQhWhTuJR1ITpnSuCfVjpGlng2Or0g_n', 1635453653, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('uwTtmpkI7U6cc2YALmW85MBEgGNjpQ3Z', 1635442029, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vE3P0qjHJ2rIUIBUDaqdCW-uYVE6LyPw', 1635445806, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vpnfEJYNutWhU4ADzr2gcG0d3kjRNhvq', 1635447456, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vpuBTYoN4z4fba9o_Eat5vD4374EoyxZ', 1635456164, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('w4TcVSHf6LB0MY4HdnYaof4uBm12Z3bh', 1635443588, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('wOn6gFPcgKDhUYV0JqRh5pT0ki9_R8bw', 1635441881, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('wqx26-A_aYSwtwwP-4OYq5z9gXH6bxnw', 1635446025, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('x1pdz39chTNwn3Ea4qWt0k9UZ-OIKvnQ', 1635443489, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('x3d3ldY4Kwp4xxyRMPDEFQrV6en4trCj', 1635442030, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xOBiiemPEsT2tu0J2HeFLi3XD7W7HlOo', 1635455752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xQdFHdYYLUIiPIyDfTTvRcHK3nFDtRKW', 1635457319, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xnCm5XM84up2vw90AfQQQ8U6dNH1B3gM', 1635446218, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xvcBIF-hNkmKvG6z77rFWwAXn7qNrGTA', 1635457192, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('yahmf1EzLGIpjIrcBhoCUy_XOkUJPNM8', 1635454071, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ydEXmgl_1QR1U9PK0j8BKcaa_6JhmTbq', 1635447953, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('yebjMXPlPM0lnQ37XKaNGrKNShAcLge4', 1635441880, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ykgWl496id-xwuVUeby5ap0ojpQveSQW', 1635455183, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ymNvkUfJ1TWmyDfmQT5lEWpir07oAXre', 1635442031, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('yxJ2EYh3194qNbd9tJFmpEefFT_UfoJ8', 1635446148, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('zqs7yxGGtc6S2FNAQaDz6s3ZxWdEJLkC', 1635446283, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

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
  `telephone` varchar(20) NOT NULL,
  `altphone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_rol`, `username`, `password`, `fullname`, `name`, `lastname`, `dni`, `email`, `telephone`, `altphone`) VALUES
(1, 0, 'Fernandez', '$2a$10$rq8yUxhW7JW4f6a/Ve9wn.EhyZQSXRs5Mj1l1KGHWZebXdwqd5OAG', 'Alan', '', '', '', 'tienda', '', ''),
(2, 1, 'admin', '$2a$10$x6MNmpm/UB2sISRSrSIuOORG2wrLC2NBfYqK7GXx.zhU3r4SEigWS', 'aaaa', 'admin', '', '', 'admin', '3756451433', ''),
(7, 0, 'user', '$2a$10$2DOuK2i1lcIzuEiauNst6eaabcYSlUwSwj56eajVPoVfVewrkFrLS', '', 'Alan Nahuel', 'Fernandez', '42741248', 'alanfernande8@gmail.com', '3756010203', ''),
(11, 0, '', '$2a$10$wjfmHH323oLng4fbqr0Am.MGD2KglxLuqSd0sNIqtEVPrBOLtxlay', '', 'Nahuel', 'Fernandez', '42741248', 'FernandezAlan@protonmail.com', '', ''),
(18, 1, '', '$2a$10$14Gp5H.HJ9/XkT6aKd3D2OdqA79u2plfS0bn.Zr0d5IvxFZFe2zpu', '', 'Nahuel', 'Fernandez', '1112', 'aaaaaaaaaaaaaaaaa', '', ''),
(19, 1, '', '$2a$10$JCVddgGtpxBTNZ7a3kUjHuimOrc8U44AnaJmXSWeIrOJ3G7eoELZ6', '', 'Juan', 'Perez', '12365478', 'juanitoPerez@gmail.com', '', '');

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
(72, '2', '41', '1'),
(73, '2', '43', '2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
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
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `companys`
--
ALTER TABLE `companys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `users_cart`
--
ALTER TABLE `users_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

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
