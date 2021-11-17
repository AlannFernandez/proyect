-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2021 a las 22:45:41
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
  `name_category` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name_category`) VALUES
(1, 'pizzas'),
(2, 'bebidas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories_companies`
--

CREATE TABLE `categories_companies` (
  `id_category` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categories_companies`
--

INSERT INTO `categories_companies` (`id_category`, `id_company`, `id_producto`) VALUES
(1, 2, 0),
(2, 2, 0),
(1, 2, 0),
(2, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companys`
--

CREATE TABLE `companys` (
  `id` int(11) NOT NULL,
  `cuit` varchar(255) NOT NULL,
  `social_reason` varchar(255) NOT NULL,
  `category` varchar(250) NOT NULL,
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

INSERT INTO `companys` (`id`, `cuit`, `social_reason`, `category`, `email`, `password`, `active`, `makes_delivery`, `price_delivery`, `sponsored`, `online_payments`, `img_profile`, `points`) VALUES
(2, '12212312', 'mercado', 'mercado', 'merakivirasoro@gmail.com', '$2a$10$yIDiYetNhao5R8o0xDd4netIeTDv3yJQy0z0oAfIzDJ7LvKMazJBm', 1, 1, 90, 1, 1, 0, '2'),
(3, '11111111111', 'heladeria', 'bebida', 'empresa', '$2a$10$LVOAFNAis36g6Klw9yfICuP5UroXOrqSxpCJiaBYAA3xomOa9KjDy', 0, 0, 0, 0, 1, 0, '0'),
(4, '11111111111', 'Restaurante', 'restaurante', 'empresaFicticia', '$2a$10$9GqGZ9QMEcqWX.5ymfnVVuZ9/m8zqIQkdASVcr/PijEbDunTksVhu', 1, 0, 0, 0, 1, 0, '0'),
(5, '11111111111', 'Rest 1', 'restaurante', 'email@test.com', '$2a$10$Sa8vbtJ6UPjCjPfjmtGFKO08t/kkGEnkFLyx4egu.cdQBfpH2tf.q', 1, 0, 0, 1, 0, 0, '0'),
(6, '01020304', 'Farmacia', 'farmacia', 'farmacia@gmail.com', '1234', 1, 0, 0, 1, 0, 0, '4'),
(7, '777777', 'Bebidas', 'bebida', 'bebida', '1234', 1, 1, 90, 0, 1, 0, '3');

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
(37, 'Combo Mega 2', '250', 5, 'Hamburguesa con gaseosa y papas fritas', 0, 'bf90942c-e9ba-4dac-9dc5-688cbb17ef6b.jpg', 0, 2, '2021-08-08 18:44:11'),
(41, 'Huevo Frito', '50', 5, 'huevo frito en aceite', 0, '36e3192b-937d-4e68-9c32-bee1bcc03da1.jpg', 1, 1, '2021-08-13 14:01:27'),
(42, 'Combo Fernet ', '900', 0, 'Fernet 750ml, coca cola 1.75 L y una bolsa de hielo de 1kg', 2, '448a4078-d9e0-4454-b809-f8e4c3bc327f.png', 0, 2, '2021-08-13 18:57:17'),
(43, 'MIlanesa con papas fritas', '300', 0, 'Milanesa de pollo con papas fritas al plato', 0, '24cbbfde-815f-46c5-8530-d465ffb890b8.jpg', 1, 2, '2021-08-13 18:59:09'),
(44, 'Pizza mozarella', '400', 0, 'Pizza casera de mozarella con tomates y aceitunas', 1, '64c12ed8-0e64-4c38-9e5b-6d3da675ebe7.jpg', 1, 2, '2021-08-13 19:03:33'),
(45, 'Yogurt vainilla', '45', 0, 'Yogurt La serenisima\r\nSabor vainilla', 0, 'd11d1e96-e370-4491-b4f2-6e1a1b6c9aed.jpg', 2, 2, '2021-08-13 19:08:09'),
(46, 'Paracetamol', '100', 0, 'Paracetamol 500g', 0, '1d14f0a6-2ac2-42d3-88f0-911161f6c9ad.jpg', 3, 2, '2021-08-13 19:29:29'),
(47, 'Yerba mate Amanda', '395', 0, 'Yerba mate Amanda 1kg', 0, '772479ed-a993-4cb9-b4bc-e27a19b6c015.png', 2, 2, '2021-08-13 19:33:31'),
(49, 'Aceite de Oliva', '450', 0, 'Aceite de oliva extra virgen 1L', 0, '4c20f1f7-6c6e-44f4-889d-0b7bf2a35df5.png', 2, 2, '2021-08-13 19:43:29'),
(50, 'Helado familiar', '600', 0, 'Helado familiar 3L \r\nsabor Chocolate, vainilla y dulce de leche ', 0, 'b7b8ff5a-2abb-4363-8f5e-f40d04373dd9.jpg', 3, 2, '2021-08-13 20:32:19'),
(51, 'Fernet Branca 700 ml', '500', 15, 'Fernet Branca 700 Ml', 2, 'b3378719-0690-45d9-bdfc-0d05354f32d5.jpg', 3, 2, '2021-08-13 20:41:37'),
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
  `import` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `notes` varchar(120) NOT NULL,
  `method_payment` varchar(50) NOT NULL,
  `delivery_from` varchar(100) NOT NULL,
  `delivery_address` varchar(255) NOT NULL
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
('-365OXNuJv1mKRLye_nwwt3AejmDkm5i', 1636659848, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('-dPHLWQ6BJWzyIwuemefKfkUTz2y07Yj', 1636665971, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('-tTDF7QAUHJWldCh20CJ7TchzQyH5Nvd', 1636642384, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('0VLY98QR-KtShvleqwd5-pVqWgVJhG8Y', 1636657252, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('0n0f9wUeZA8QCQ0UZ6Pq9Ws1kKQy8-SZ', 1636654714, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('15243mWuYcBepn-9WwNJuKV52sg3l91-', 1636655050, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1ExBW0pSDEJfjjkFcyNwjf7WEYLxNfHx', 1636666083, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('1PZY8oXQNidARhSJN_994XExwNAmRC1g', 1636641516, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('2WdQWK9Dw_e_Zrg2wZPdZk3gOJumawom', 1636649386, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('2_aZaHZdgEKLbQMngKWl-_5eWqCy1eUJ', 1636653790, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}'),
('2bCj9GaWmEWX8S8NiV3yMyYryXfyUW4X', 1636641556, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('2t0gUQvhoVKZvCvL96wPTMEiQ-wO6LHk', 1636648846, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3AqDGhJRCaTyv20PgLFzsHqXXbnbZA2R', 1636656804, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3ScVOmkbVSItQWvJbZoLh1xMHN0vVXWP', 1636642596, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3WGQebFeWCNohgwP0iAN7wjOHnr2sA9l', 1636654335, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3Z1UNgI-LiZHaDi699d88Rf3h6HQ7JyF', 1636667045, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{}}'),
('3hV2Pgt7cAyH_pJf0Z-Tf3mGL-x4zsjp', 1636657588, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('3ocxbQAP5CL68YpwB8hvwbTiwn6nzTdk', 1636659845, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('4_HbcGkSibkLCw3wPMMBVMwHRSUP_i2z', 1636666107, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('4m63ehQj8qR5MWwxTX_2y0yqem9m6B98', 1636655929, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('4zRap1vquqwYEs5AAohsTGGVnmu_Iizl', 1636642981, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5-zcZtSQnKIRNYNS0OYarfAjVPPGMXin', 1636655662, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('51QmijjgLRJWq1cuWZxlpqvR9iVIxpzq', 1636660136, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('5a3arCXWmg0JTKZIoZlfpg0DXDwx-5_k', 1636659723, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('6hVajl2crNP06xwNmek67OXltqkllpJQ', 1636657639, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('6tv3mFvVUZ8NuJns8XTfYlR59gn4WZB6', 1636652572, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('6uGQZzfH_X-z1xGTGq9hXW1xAV1zYbnT', 1636643946, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('739kknTrW5JwR4zhh6RbOwO_hX3l4nUp', 1636648273, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('86f-TnGzujmEHmdMwmwaRkN43sHtYlLv', 1636659873, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('8R9Q4W_D_1ZeI-33VsstXwAnINNWvZg3', 1636665524, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('93PiRn7wK0SQVQg6fyjN-UHxObUZ4BGb', 1636659344, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('9NB4j64fChahmZ28dr-tjQx3pyOGA9dd', 1636663944, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('9zh5rxcLVN_tpqRUmEs3Ec84jpRXMzWL', 1636643693, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('B1uMtecUgCrPel8RKP4fPrkamuXReCio', 1636641977, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BDTSamf5x-G5CP1BOxE3TBI7RgyxCwoL', 1636653181, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BSSklL7_ozB-03lQknDGmkOrKO5iDy-T', 1636639527, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BT_qltcpslXVEfDeg3X4NBkgJ7TLl-sc', 1636655735, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BTa_NDBB47Y_UEYCm93hntk6ntWlLFhC', 1636658506, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('BdKIbqmtnoClPMqfpO1CfLQtT95d0auC', 1636666655, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CkRhMYjGu--UXsm2ihf-ddQ3CWi2rmuh', 1636642752, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CwI_OxN-9kOJXbqwjqunfuA02xPPAs5h', 1636649623, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('CzkRQkwOPnzWPZIdVNcfBeY7o9YVSeTJ', 1636658567, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('DZ2ucPSjmXWYjW6v7x5jnR2gRUQTNvfF', 1636663949, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('DgFa2dthqGedn3WSsmtCisNlTq11F8Ns', 1636640072, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('E1yCCvfJrnW03OxNI0AWiAwJ-KADa_6H', 1636652289, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ECqr4n8mlH_J-92T5J0b8GeR56pLMyI4', 1636656381, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('EEGsm45yFNCddwmDuNoql3XKYeexQLdz', 1636642509, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('EwJTRGzhmKD1NlbqLExlDc-Tzrmtnrs8', 1636657984, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ExI73efe5hSIjd2IKEuS_X9bSn4S9tog', 1636655382, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('GQkaFWxpyqGaFhcowu-szTYbt-TYV-0f', 1636659420, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Hk4M_EEv3oaJiaN7j0pjECJZJTWqbiQm', 1636659718, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('HvMadftorT2QPLhvEwnuTkrbqXp2FSH7', 1636652823, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('IkpumJfobf_CBdXswIy_f5gTHCcFHpKA', 1636649191, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('IomdNT53eJlHLAkyPalOsGpC9Bz94OBI', 1636652551, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('JTbosVET7ptcetZhifjV672iZ-XqGoX4', 1636642232, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('KMoZWlIECAF6BPp_7Vv_JCE0LrKrLkWh', 1636659770, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('KXTp_-YsgGCAsBjOEdDMUwvpkmyC4soY', 1636580653, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('KegnS23aP0QI3tMIl6jxL7QwYHkIlqeY', 1636655415, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('LCCheO0R8WLjWBaodTOBjg9ozJvayIAp', 1636638520, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Lcx5SUTyTYFwfRZkXl8KZ8NcLoS8dgG_', 1636659735, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Md03fCk7l0HDt2ceNzxC0zjiwOCHtYnQ', 1636648279, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('MqN7IkCOGl8oYAMcbm0-E5ih-W19CGeg', 1636580657, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":2}}'),
('N_LUQee9weKku2X2FAKbByudfyMpuIRC', 1636655571, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('NhnaY43QfP2w-Mz9mK8U5Lxvy60xI_Sm', 1636648239, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Nl-b8jvgdk4ckigRV6At7dx4KHix6Bxh', 1636641624, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('O3d81NqBo1oJZMgdB94vmq0eA15jLov9', 1636644018, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OGr6qsoYCFx3KJToQP9yifb9amh4yUBU', 1636652631, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OYbE2F4_qUy0MoSVn5hZqjVqEBpWFFgW', 1636640097, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OfOFHRSSxXF_KCjCGYby3YaW_gUt7jtL', 1636666839, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('OpLcEWMA_nnOkrwyfQNV1yP3nR0SZXFb', 1636647850, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ou3uD8RAhM0fkSa9kfSn21qQV26wXJFB', 1636652796, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('P2y8CUUvuf_FlHc4T367BDOPDjcaPtKl', 1636640043, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('PN37SgACJ5T2HoDFCeqO7vsfy6rRddmF', 1636660165, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}'),
('Pb9zesNSnU0JOrnjPoDLm-qXResMfvnV', 1636658458, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('QRxhgMjarWGFPm0J87pM2hE7ZFOSpbWO', 1636666247, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('R0I4-Wsw-SzMlKtskgWd_n35mEjuFDjO', 1636659755, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('RTYsnZx19gtJr1ZWGBkCzmX6LPZmA7j2', 1636666924, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Re12-Cr1uj3BcwrnZMitnmnEDndrRt5I', 1636665449, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('S4_IKqMcDPpE6uMLWPMbF9lXAS3UROII', 1636665309, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('S7GAgf8U6gO53e6GgPPiioySwAaxYt7L', 1636656992, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('SEbCPEN6lqAwZOUFoGKd8b0TCmq2OVnR', 1636654252, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('SI-KSwYx9P2xdfqHZEJyjVv2AstNWVzR', 1636647878, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('SvMP7jxdEJYyKI0CWdP8lu4MP87fronO', 1636649566, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('T43d8y-8wYZDufLcWG-hdHIgRSo7LD2V', 1636649125, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('T53IFEEjTYFFRxJn4cTNd8ggGgQKYZz-', 1636652678, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('TCJM5AptGE7cE8CZ8LYROWuHrKtq7LUj', 1636653819, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Tu3uViZCXCc-ryVJzunCLFHbvlkNAfyB', 1636666883, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('UQlwUdBixCyYm7b4mB3v2EJclPqOIufO', 1636656361, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('V-BRWq_Qihlmu9cNzSefzTfTj2kfUaaQ', 1636659910, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('V8UptcH-V_67g_6UhD6FHb0Hy9zvjmRg', 1636665134, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('VG-YeS1sHgqkAorThsQxHNhOpxflJdT0', 1636649286, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('VerASh3tVAu8Y4z5DHd3FcXf04lJJaxW', 1636643508, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('VtqIPTKZgYfQzmHS6AVwULPGqYHjeXnG', 1636652817, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WCEH21oR_I06-xN1-jImbiuF09cFOWDc', 1636666892, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WOrd_uGmeid3H6rLLg7LgbX67qvDorNL', 1636665155, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WrmzhMbxU0eIHrOz5WqH7WVBvlzPCaid', 1636660127, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('WslxL2pv2oXVYROjs0nF3EX3ZFBl9mnT', 1636659082, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ww_I91UmRM_7r6h-9brDWNO3VLxZ8o2c', 1636643847, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Wy7pm81geoLS-mNOudzfiihC_EFuv1Uo', 1636657303, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('XlLZ_6ycEuKRGCQtJw_6iQ9dFnTpsHwv', 1636665469, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('YaSD9D_dMZ3s4GTdKgivJVrd_5jJQ5Q9', 1636656339, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Ye0Ay0Q2p9rkKJWSi9TfqZs4C14cX3av', 1636652807, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('YixNXrzwd7751qfdh58m4xg7MVR9R65b', 1636648340, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Z1j8M9oU15peW-4E_f5kH93xYlOz24US', 1636666868, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZC4f1sELJyqocfCdi50NlRgazdb8L42K', 1636659433, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZFE1QdWY3MnPzUqfVo4NI_dkRDzZKMWs', 1636656289, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZjjfCLHBM1f21bhZr9M1ra8JjnCiWI0U', 1636659804, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZqQnP2MkqYQ7X3wOr2w4tEaSO6MQpIBf', 1636643865, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_F_s61rCnonXs34kQV29fElVVPU4JFZu', 1636666909, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_LABxaVwqvIdqXDFmlb48h0VhWGuqb_E', 1636648248, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('aPbU8gQGeMgO2d6i-RVlHHw15hywp5uj', 1636648230, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('a__zVDHL4CHESskFRcLKiaQx0kc-w4Hc', 1636657545, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('b1GPFBq21TrB-0CjwABGAUP_dVLFu1vx', 1636655785, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('bPz3krZCmslg0Fj-pvEFoY3lrB4_v9tP', 1636659867, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('cU9YGTmFHXqNiqczV-Ctn9wIAMvsUJxY', 1636659783, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ch6xSDnQMi56Ubpdu6soVFj-qmundorW', 1636654320, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('d0_OLotrJttyxEsZiiKcJQlfK4PtaKtN', 1636639511, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dAqnoFiiUbg4mFEFbSsgqhwBwflIRd-6', 1636659917, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('d_-LrQeMxUboWgvZyOj-ZpF-sIFeIzyu', 1636658843, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('daMMrs-pOAudqt9zDpGTdmG9xGdn_9A8', 1636658648, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('dzAHt7YVvLazhzz0WbrHw5w64kIYneRA', 1636658152, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('e7TMmdy4M-LKTPtEzb5czMbNHF3YKpRT', 1636652315, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('eHCLOsRHhjKoXs6RPR99ekDOIr4tsa1k', 1636648301, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('f90ce9QNivMTYw7GX7X-C4VXIguspSMI', 1636640805, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('fyTW0oHPj9sVwMSMLEKEXoJeyQ3ZoXnF', 1636656419, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('gjDIbnYJuSGQk8SNbJW_S7bxlSN-X3Jb', 1636656010, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('gnW3qXqZ6vK9UN9WlwSXLJN6ypGxeNrE', 1636665547, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hGQO4eSq2eGezhpY57kcuE5F8rAi7822', 1636644164, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('hpZUVozJfLE4ibTSBoeG66AShrzP1_SN', 1636656735, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ic8O3T2jP75PTOh-Nr6L65XBKmDiBCA6', 1636659902, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('j8gYneKuj4uoOjBNtQ_mShot1MbWPC5v', 1636643801, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jb2exwUfpYn4rE5u1t3J3Pv_z_LnYdGi', 1636647888, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kDHEPy9ufDmQZkok4sRv6AhP5Uq42Cfd', 1636666902, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kGKkZCkgk_0fDfnWgqBkQzQlVri48Irb', 1636655987, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kYzsVdajL7gZqKWeSNoYSBONwGSjNBVg', 1636644103, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('kxwUWHDPkrV957b8aDyP5kHphmGX8dux', 1636648972, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lDENnuLu6FmwrHG7kKD48Z_888nxC000', 1636580538, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lWbXsKiH_Yjt1mRc_ZgLLsKR71aLI8Nw', 1636649523, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('l_itMRcUugXG_j5d8ejVz2oVt2gGFKts', 1636666849, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('lk5giWdFhbaiP5ugw8wqeU5zfRYEaibd', 1636659890, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('m0w3dRbGsDaqseBFj1-gTNt6oXolNI3c', 1636653236, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('m_mkVZigRHdEvWniBHyup4faRb4RXMbS', 1636659548, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('myJ7dX1JNBdV-e5VE4j9F5ezK9GNdUC1', 1636643905, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('n6nc26suBx10juBodYvwY4pIeu4b6JRo', 1636654911, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('nHRayRrw8R-gNsTdGmXoOMWZTPC-k8ON', 1636665443, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('nlndWWEcGUZUz_y6S1MyprBKKhfieIR9', 1636666188, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('o9qyPYCZqaPxieivRaAqs0Pghxow1s3V', 1636653829, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('oAItLS7gfq4bAQwnE3EE_tAhG2UAMthg', 1636643438, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('pSh0nfbvcyUtofHIRhKZ0pIe3w65y9bb', 1636643370, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('pgl-TEIcp6pM6zHmKz2z259f9vc_Ista', 1636666831, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ptiOF97ZwTH801m2Eynio1GvJDTQ8DS1', 1636650634, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('q7dQnG8cT_jVD-2mrMi5f9SOem5-HetA', 1636658394, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qLi2Emt3KyIi5dQd-b1Te_VmW2nEGtkB', 1636648366, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('qdddHKXfuaH13O1HEsrFMYlMuJWSxCJW', 1636660134, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":7}}'),
('qomTosuLhlk6_2PakkK6n_qGrSfRIisq', 1636659710, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('rNGU9Blzw5MfHrK2mU-byjh_ksxAbLi2', 1636667000, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('rZRTrWkzX7wctbFGtDfz6NRaSiI_0qVW', 1636652701, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('rpBuJ6exuPGg0K7aVI8MCSsC6zbOsSHt', 1636653941, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('s0GzUGiQOGEzJ3iIQ5g0r5-uh6uhlnkZ', 1636665986, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('sa3-QPPVgafOFv5F8ju-FNrRWIT12o0p', 1636648603, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('sjrlfGuxCFLWOXAEbFdfoFenp8u8n075', 1636655402, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('stnL7MtAjMyCPLIaCUSz01OijwY96ep0', 1636665501, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tMMlfy8LzSylWe1kQ3Yk0NdsBteyirfL', 1636659470, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tjD2JqJsmbgh2AMIga6MrpuPhpCWrvi6', 1636642104, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('tnKMV2TcIcJEZkCKlx74-q8PY2_yasE0', 1636655391, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('v2n8W1Cn9z9u0xmv_69ENyJi9XJ9o8ZR', 1636665164, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vHZrXYAgQH8y_jIFv2wFvNWouKl2tAcU', 1636666780, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vJsFayrJx-aScCzc9CNbYFtw6X-uovDZ', 1636648260, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vKssWWc7IvNZb_qzYHDdO04PHL5Drkn3', 1636653807, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('vd_GVQCihii5tULnl_ajGvqh0xzGsHcP', 1636642310, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('wCBW6whDa_zQHllZU-KXBZanTUP9aCxw', 1636659854, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":2}}'),
('wjnUPvrDKHMznWJEKfJ1m_B3Fjo-uDZE', 1636659883, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('wnVPd3zUyu9mpxbW0OmAfeqOOEi--XKY', 1636656225, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('x9HXTsSLt1tCDUzTCxJA5f4D_39rtln9', 1636648294, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xNTj1-8qwYlCYkCuPXi6ZjkzKYRk5uFz', 1636659677, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('xo_r6az4hdD0bUIZPzJ2o9xBcYjjt1GG', 1636653921, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('yAR44YjqjxwcI5GtpmqKCO7Ql8kSrSd2', 1636659855, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ydktTWfLNzqpUdosqHcrLYH-AiAM2zZR', 1636665494, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('z3wEZXGQNpJayxit3SMsRs1K9Yl3ayFU', 1636642479, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('zSM-w1eF2kK7pytEg8GkFEyWJmSHdt0p', 1636644217, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

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
(2, 0, 'admin', '$2a$10$x6MNmpm/UB2sISRSrSIuOORG2wrLC2NBfYqK7GXx.zhU3r4SEigWS', 'aaaa', 'admin', '', '', 'admin', '3756451433', ''),
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
(104, '2', '42', '1'),
(106, '1', '42', '1');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

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
