-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2021 a las 16:31:58
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optics_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_marca` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `proveidor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_marca`, `nom`, `proveidor_id`) VALUES
(1, 'Ray-Ban', 1),
(2, 'Oakley', 2),
(3, 'Dolce & Gabbana', 1),
(4, 'Michael Kors', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname1` varchar(20) NOT NULL,
  `surname2` varchar(20) DEFAULT NULL,
  `zip_code` varchar(5) NOT NULL,
  `telephon` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_register` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_recommend_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `name`, `surname1`, `surname2`, `zip_code`, `telephon`, `email`, `date_register`, `client_recommend_id`) VALUES
(1, 'Jaume', 'Busquets', 'Alba', '08040', '+34697853240', 'email1@gmail.com', '2021-07-07 08:07:15', NULL),
(2, 'Pau', 'Piqué', 'Puyol', '08023', '+34697004052', 'email2@hotmail.com', '2021-07-07 08:08:35', 1),
(3, 'Peter', 'Parker', NULL, '08035', '+34692570005', 'email3@outlook.com', '2021-07-07 08:09:18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname1` varchar(20) NOT NULL,
  `surname2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`, `name`, `surname1`, `surname2`) VALUES
(1, 'Joan', 'Petit', 'Balla'),
(2, 'Helena', 'Pérez', 'Solsona'),
(3, 'Bruce', 'Wayne', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `graduationL` decimal(3,2) NOT NULL,
  `graduationR` decimal(3,2) NOT NULL,
  `frame` enum('Flotant','Pasta','Metàl·lica','') NOT NULL DEFAULT 'Flotant',
  `color` varchar(10) NOT NULL,
  `glass_colorL` varchar(10) DEFAULT NULL,
  `glass_colorR` varchar(10) DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `employee_sale_id` int(11) NOT NULL,
  `client_purchase_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `brand_id`, `graduationL`, `graduationR`, `frame`, `color`, `glass_colorL`, `glass_colorR`, `price`, `employee_sale_id`, `client_purchase_id`) VALUES
(1, 4, '-0.25', '0.25', 'Flotant', 'Negre', NULL, NULL, '799.99', 3, 3),
(2, 1, '1.00', '0.30', 'Pasta', 'Negre', 'Negre', 'Negre', '399.99', 1, 2),
(3, 3, '0.00', '-0.80', 'Metàl·lica', 'Daurat', 'Marró', 'Marró', '499.99', 2, 1),
(4, 2, '3.00', '-0.20', 'Pasta', 'Blau', 'Vermell', 'Vermell', '299.99', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `NIF` varchar(9) NOT NULL,
  `street` varchar(200) NOT NULL,
  `number` varchar(4) NOT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(5) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `country` varchar(25) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `fax` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `name`, `NIF`, `street`, `number`, `floor`, `door`, `city`, `zip_code`, `country`, `phone`, `fax`) VALUES
(1, 'Proveïdor d\'ulleres 1', 'X01234567', 'Carrer Inventat I', '89', '1', '2a', 'Barcelona', '08028', 'España', '+34934782456', '+34939456874'),
(2, 'Proveïdor d\'ulleres 2', 'Y01234567', 'Carrer Inventat II', '89', NULL, NULL, 'Badalona', '08917', 'España', '+34933407800', '+34933715020'),
(3, 'Proveïdor d\'ulleres 3', 'Z01234567', 'Carrer Inventat III', '14', 'Àtic', '2', 'Cornellà de Llobregat', '08940', 'España', '+34936798845', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `telefon` (`telephon`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `client_recomanacio_id` (`client_recommend_id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `marca_id` (`brand_id`),
  ADD KEY `empleat_venda_id` (`employee_sale_id`),
  ADD KEY `client_compra_id` (`client_purchase_id`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `NIF` (`NIF`),
  ADD UNIQUE KEY `telefon` (`phone`),
  ADD UNIQUE KEY `fax` (`fax`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `id_glasses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `supplier` (`id_supplier`);

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`client_recommend_id`) REFERENCES `client` (`id_client`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id_marca`),
  ADD CONSTRAINT `glasses_ibfk_2` FOREIGN KEY (`employee_sale_id`) REFERENCES `employee` (`id_employee`),
  ADD CONSTRAINT `glasses_ibfk_3` FOREIGN KEY (`client_purchase_id`) REFERENCES `client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
