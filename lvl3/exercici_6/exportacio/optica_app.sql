-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2021 a las 10:34:03
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
-- Base de datos: `optica_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_clients` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognom1` varchar(20) NOT NULL,
  `cognom2` varchar(20) DEFAULT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `client_recomanacio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_clients`, `nom`, `cognom1`, `cognom2`, `codi_postal`, `telefon`, `email`, `data_registre`, `client_recomanacio_id`) VALUES
(1, 'Jaume', 'Busquets', 'Alba', '08040', '+34697853240', 'email1@gmail.com', '2021-07-07 08:07:15', NULL),
(2, 'Pau', 'Piqué', 'Puyol', '08023', '+34697004052', 'email2@hotmail.com', '2021-07-07 08:08:35', 1),
(3, 'Peter', 'Parker', NULL, '08035', '+34692570005', 'email3@outlook.com', '2021-07-07 08:09:18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleats` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `cognom1` varchar(20) NOT NULL,
  `cognom2` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleats`, `nom`, `cognom1`, `cognom2`) VALUES
(1, 'Joan', 'Petit', 'Balla'),
(2, 'Helena', 'Pérez', 'Solsona'),
(3, 'Bruce', 'Wayne', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marques`
--

CREATE TABLE `marques` (
  `id_marca` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `proveidor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marques`
--

INSERT INTO `marques` (`id_marca`, `nom`, `proveidor_id`) VALUES
(1, 'Ray-Ban', 1),
(2, 'Oakley', 2),
(3, 'Dolce & Gabbana', 1),
(4, 'Michael Kors', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `NIF` varchar(9) NOT NULL,
  `carrer` varchar(200) NOT NULL,
  `numero` varchar(4) NOT NULL,
  `pis` varchar(10) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `ciutat` varchar(25) NOT NULL,
  `codi_postal` varchar(5) NOT NULL,
  `pais` varchar(25) NOT NULL,
  `telefon` varchar(12) NOT NULL,
  `fax` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id_proveidor`, `nom`, `NIF`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`) VALUES
(1, 'Proveïdor d\'ulleres 1', 'X01234567', 'Carrer Inventat I', '89', '1', '2a', 'Barcelona', '08028', 'España', '+34934782456', '+34939456874'),
(2, 'Proveïdor d\'ulleres 2', 'Y01234567', 'Carrer Inventat II', '89', NULL, NULL, 'Badalona', '08917', 'España', '+34933407800', '+34933715020'),
(3, 'Proveïdor d\'ulleres 3', 'Z01234567', 'Carrer Inventat III', '14', 'Àtic', '2', 'Cornellà de Llobregat', '08940', 'España', '+34936798845', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `graduacioL` decimal(3,2) NOT NULL,
  `graduacioR` decimal(3,2) NOT NULL,
  `muntura` enum('Flotant','Pasta','Metàl·lica','') NOT NULL DEFAULT 'Flotant',
  `color` varchar(10) NOT NULL,
  `color_vidreL` varchar(10) DEFAULT NULL,
  `color_vidreR` varchar(10) DEFAULT NULL,
  `preu` decimal(5,2) NOT NULL,
  `empleat_venda_id` int(11) NOT NULL,
  `client_compra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca_id`, `graduacioL`, `graduacioR`, `muntura`, `color`, `color_vidreL`, `color_vidreR`, `preu`, `empleat_venda_id`, `client_compra_id`) VALUES
(1, 4, '-0.25', '0.25', 'Flotant', 'Negre', NULL, NULL, '799.99', 3, 3),
(2, 1, '1.00', '0.30', 'Pasta', 'Negre', 'Negre', 'Negre', '399.99', 1, 2),
(3, 3, '0.00', '-0.80', 'Metàl·lica', 'Daurat', 'Marró', 'Marró', '499.99', 2, 1),
(4, 2, '3.00', '-0.20', 'Pasta', 'Blau', 'Vermell', 'Vermell', '299.99', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_clients`),
  ADD UNIQUE KEY `telefon` (`telefon`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `client_recomanacio_id` (`client_recomanacio_id`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleats`);

--
-- Indices de la tabla `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `nom` (`nom`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `NIF` (`NIF`),
  ADD UNIQUE KEY `telefon` (`telefon`),
  ADD UNIQUE KEY `fax` (`fax`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `marca_id` (`marca_id`),
  ADD KEY `empleat_venda_id` (`empleat_venda_id`),
  ADD KEY `client_compra_id` (`client_compra_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_clients` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleats` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marques`
--
ALTER TABLE `marques`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`client_recomanacio_id`) REFERENCES `clients` (`id_clients`);

--
-- Filtros para la tabla `marques`
--
ALTER TABLE `marques`
  ADD CONSTRAINT `marques_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id_proveidor`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marques` (`id_marca`),
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`empleat_venda_id`) REFERENCES `empleats` (`id_empleats`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`client_compra_id`) REFERENCES `clients` (`id_clients`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
