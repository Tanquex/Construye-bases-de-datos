-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 02:33:10
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `clave` varchar(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `docimilio` varchar(50) NOT NULL,
  `numero de proveedor` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`clave`, `nombre`, `curp`, `telefono`, `docimilio`, `numero de proveedor`) VALUES
('14785236996', 'Carlos Samael', 'SSC9HGTGNRD8', '1481095552', 'Luis Antonio', '1039');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `noProducto` varchar(11) NOT NULL,
  `marca` varchar(10) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `precio` varchar(11) NOT NULL,
  `stock` varchar(11) NOT NULL,
  `numero de empleado` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`noProducto`, `marca`, `modelo`, `precio`, `stock`, `numero de empleado`) VALUES
('1', 'lol', 'si', '12000', '10', '1039');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proovedor`
--

CREATE TABLE `proovedor` (
  `numero de empleado` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `codigo personal` varchar(10) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `empresa` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proovedor`
--

INSERT INTO `proovedor` (`numero de empleado`, `nombre`, `codigo personal`, `correo`, `empresa`) VALUES
('1039', 'sama', '5', 'sama@gmail.com', 'locotron'),
('1309', 'Roberto Matías serrano  Martín', 'WANRLTW338', 'loco666@gmail.com', 'TixTix');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`clave`),
  ADD KEY `proveedor-indexx` (`numero de proveedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`noProducto`),
  ADD KEY `index_proveedor` (`numero de empleado`);

--
-- Indices de la tabla `proovedor`
--
ALTER TABLE `proovedor`
  ADD PRIMARY KEY (`numero de empleado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `numero de empleado` FOREIGN KEY (`numero de proveedor`) REFERENCES `proovedor` (`numero de empleado`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `proveedor` FOREIGN KEY (`numero de empleado`) REFERENCES `proovedor` (`numero de empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
