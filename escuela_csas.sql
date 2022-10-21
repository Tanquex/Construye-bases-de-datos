-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 03:29:20
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
-- Base de datos: `escuela_csas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('111', 'Calculo Integral', 5, ''),
('112', 'Ingles V', 5, NULL),
('113', 'Fisica II', 4, NULL),
('114', 'Ciencia, Tecnologia, Sociedad ', 4, NULL),
('142', 'Construye BD', 6, NULL),
('143', 'Desarrolla aplicaciones web', 6, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Administracion de re', 'Mixto', NULL),
('Contabilidad', 'Mixto', NULL),
('Electricidad', 'Matutino', NULL),
('Logistica', 'Vespertino', NULL),
('Mecanica', 'Matutino', NULL),
('Programacion', 'Mixto', 'Ricardo Mendez Rojas'),
('Soporte y mantenimie', 'Mixto', 'Silvestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `edad` varchar(2) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `domicilio` varchar(40) NOT NULL,
  `nombre_grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `telefono`, `domicilio`, `nombre_grupo`) VALUES
('111111111111', 'Tania', 'Alvarez Anguiano', '17', '4811774420', 'soriana', '5PV'),
('20311050750479', 'Carlos Samael', 'Aguayo Santana', '17', '4181095552', 'Luis Antonio Portillo #5', '5PV'),
('66666666666666', 'Cynthia Janeth', 'Granados Estrada', '17', '4151388514', 'Rio Laja', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` float NOT NULL,
  `parcial` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`, `parcial`) VALUES
('20311050750479', '142', '2022-10-18', 5, 10, 1),
('20311050750479', '143', '2022-10-18', 5, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(3) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `tutor` varchar(30) DEFAULT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('1PV', 'Vespertino', NULL, NULL, 'Programacion'),
('3PV', 'Vespertino', NULL, NULL, 'Programacion'),
('5AM', 'Matutino', NULL, NULL, 'Administracion de re'),
('5AV', 'Vespertino', NULL, NULL, 'Administracion de re'),
('5CM', 'Matutino', NULL, NULL, 'Contabilidad'),
('5CV', 'Vespertino', NULL, NULL, 'Contabilidad'),
('5E', 'Matutino', NULL, NULL, 'Electricidad'),
('5LV', 'Vespertino', NULL, NULL, 'Logistica'),
('5M', 'Matutino', NULL, NULL, 'Mecanica'),
('5PM', 'Matutino', NULL, NULL, 'Programacion'),
('5PV', 'Vespertino', 'Dulce Alejandra', 'Silvia Carrillo Mastache', 'Programacion'),
('5SM', 'Matutino', NULL, NULL, 'Soporte y mantenimie'),
('5SV', 'Vespertino', NULL, NULL, 'Soporte y mantenimie');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `indice_grupo` (`nombre_grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`nombre_grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
