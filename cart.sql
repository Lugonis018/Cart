-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2018 a las 06:44:36
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Andrés Aparcana', 'andres@andres.com', '2018-11-30 10:56:40', '2018-11-30 10:56:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `hash` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `total` float NOT NULL,
  `address_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `hash`, `total`, `address_id`, `paid`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '3b87a88e7dbe16eba9a3cec26476832baefa192db8ce40fd6524c72444fdec88', 2005, 1, 0, 1, '2018-11-30 11:22:15', '2018-11-30 11:22:15'),
(2, '65ba89956600b3e594805146d5e762d7bbed45e8c2615976a1ecb8c14a0dcf53', 2005, 1, 0, 1, '2018-11-30 11:29:47', '2018-11-30 11:29:47'),
(3, 'dfe4b455584c601a7713caded2dbc59c9d9ffe231f76f8ac9e573fdeade7601a', 2005, 1, 0, 1, '2018-11-30 11:30:41', '2018-11-30 11:30:41'),
(4, '1179641a81bd72f4ab925fb462827301cf0bb2dd2ae13d27b2a2d3ae00bf267f', 2005, 1, 0, 1, '2018-11-30 11:31:47', '2018-11-30 11:31:47'),
(5, '68696a1840c984f2139917c532ca952e9fd9fe2d5dc81da1ff6fe5d2e4973489', 2005, 1, 0, 1, '2018-11-30 11:38:22', '2018-11-30 11:38:22'),
(6, '3aea20d31dc72a9f8cdf6a11c83bfda8f33ba6491cd84ba92ffe40bfd4c4aef2', 2005, 1, 0, 1, '2018-11-30 11:38:59', '2018-11-30 11:38:59'),
(7, 'cd810e05bd53a40bafd14d3ad810d41439460fdfcaa64847f38116818b2e12b9', 2035.69, 2, 0, 1, '2018-11-30 11:42:52', '2018-11-30 11:42:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 6, 1, 2),
(2, 7, 1, 1),
(3, 7, 2, 10),
(4, 7, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `failed` tinyint(1) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` text COLLATE utf8_spanish2_ci,
  `price` float NOT NULL,
  `image` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `price`, `image`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'This is my first product', 'saaa', 'Hola ,¿ Qué tal ?', 1000, 'https://placeholdit.imgix.net/~text?txtsize=50&txt=Product%20image&w=800&h=500', 2, '2018-11-27 05:00:00', '2018-11-27 05:00:00'),
(2, '2do producto', 'lo que sea', 'Esto es una descripción rápida del segundo producto', 100, 'https://placeholdit.imgix.net/~text?txtsize=50&txt=Product%20image&w=800&h=500', 11, '2018-11-28 17:00:00', '2018-11-28 21:29:17'),
(3, '3er producto', 'No sé que es', 'Esto es una descripción rápida de lo que es el producto', 10.23, 'https://placeholdit.imgix.net/~text?txtsize=50&txt=Product%20image&w=800&h=500', 4, '2018-11-29 04:00:00', '2018-11-29 04:00:00'),
(4, '4to producto', 'Esto es lo que es', 'full text, no problem', 34.34, 'https://placeholdit.imgix.net/~text?txtsize=50&txt=Product%20image&w=800&h=500', 0, '2018-11-29 05:00:00', '2018-11-29 05:00:00'),
(5, '5to producto', '5producto', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac', 15.4, 'https://placeholdit.imgix.net/~text?txtsize=50&txt=Product%20image&w=800&h=500', 7, '2018-11-29 05:00:00', '2018-11-29 05:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
