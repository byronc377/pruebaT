-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2024 a las 06:38:11
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appprueba`
--
CREATE DATABASE IF NOT EXISTS `appprueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `appprueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_loggin`
--

DROP TABLE IF EXISTS `log_loggin`;
CREATE TABLE `log_loggin` (
  `ID_LOG` int(11) NOT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `HOST` varchar(255) DEFAULT NULL,
  `FECHA_LOG` date DEFAULT sysdate()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `log_loggin`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc_clientes`
--

DROP TABLE IF EXISTS `oc_clientes`;
CREATE TABLE `oc_clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE_CLIENTE` text NOT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CREATED_AT` date DEFAULT current_timestamp(),
  `UPDATED_AT` date DEFAULT current_timestamp(),
  `USUARIO_CREADOR` int(11) DEFAULT NULL,
  `USUARIO_MODIFICADOR` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `oc_clientes`:
--

--
-- Volcado de datos para la tabla `oc_clientes`
--

INSERT INTO `oc_clientes` (`ID_CLIENTE`, `NOMBRE_CLIENTE`, `FECHA_NACIMIENTO`, `CREATED_AT`, `UPDATED_AT`, `USUARIO_CREADOR`, `USUARIO_MODIFICADOR`) VALUES
(1, 'cliente prueba', '2024-12-07', '2024-12-08', NULL, 1, NULL),
(2, 'cliente prueba   1', '2024-12-07', '1902-01-06', NULL, 1, NULL),
(3, 'cliente prueba 4', '2024-12-04', '2024-12-08', NULL, 1, NULL),
(4, 'cliente prueba 5', '2024-12-04', '2024-12-08', NULL, 1, NULL),
(5, 'cliente prueba 6', '2024-12-01', '2024-12-08', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc_detalle_cliente`
--

DROP TABLE IF EXISTS `oc_detalle_cliente`;
CREATE TABLE `oc_detalle_cliente` (
  `ID_DETALLE_CLIENTE` int(11) NOT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `ID_MUNICIPIO` int(11) DEFAULT NULL,
  `DUI` varchar(30) DEFAULT NULL,
  `DIRECCION` text DEFAULT NULL,
  `ESTADO_DETALLE` varchar(30) DEFAULT 'activo',
  `CREATED_AT` date DEFAULT current_timestamp(),
  `UPDATED_AT` date DEFAULT NULL,
  `USUARIO_MODIFICADOR` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `oc_detalle_cliente`:
--

--
-- Volcado de datos para la tabla `oc_detalle_cliente`
--

INSERT INTO `oc_detalle_cliente` (`ID_DETALLE_CLIENTE`, `ID_CLIENTE`, `ID_MUNICIPIO`, `DUI`, `DIRECCION`, `ESTADO_DETALLE`, `CREATED_AT`, `UPDATED_AT`, `USUARIO_MODIFICADOR`) VALUES
(1, 2, NULL, '0567853576', 'Avenida de prueba', 'inactivo', '2024-12-08', NULL, 1),
(2, 2, NULL, '0001111003', 'avenida de prueba 2', 'inactivo', '2024-12-08', NULL, 1),
(3, 2, NULL, '012457425', 'avenida de prueba 45BJB', 'inactivo', '2024-12-08', NULL, 1),
(4, 2, NULL, '010305030', 'avenida de prueba 56', 'activo', '2024-12-08', NULL, 1),
(5, 5, NULL, '5', 'avenida de prueba 4', 'activo', '2024-12-08', NULL, NULL),
(6, 5, NULL, '5', 'prueba 668', 'activo', '2024-12-08', NULL, NULL),
(7, 5, NULL, '076809786', 'prueba 669', 'activo', '2024-12-08', NULL, NULL),
(8, 1, NULL, '01003020', 'AVENIDA PRINCIAPLkjkjsd', 'activo', '2024-12-08', NULL, 1),
(9, 2, NULL, '0569709045', 'avenida princiapl', 'activo', '2024-12-08', NULL, NULL),
(10, 2, NULL, '000011101', 'Avenida de prueba', 'activo', '2024-12-08', NULL, NULL),
(11, 2, NULL, '00001110167', 'Avenida de prueba', 'activo', '2024-12-08', NULL, NULL),
(12, 1, NULL, '000304', 'avenida 2', 'activo', '2024-12-08', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc_detalle_log`
--

DROP TABLE IF EXISTS `oc_detalle_log`;
CREATE TABLE `oc_detalle_log` (
  `ID_DETALLE_LOG` int(11) NOT NULL,
  `ID_LOG_MODIFICACION` int(11) DEFAULT NULL,
  `PARAMETRO` text DEFAULT NULL,
  `VALOR_ANTERIOR` text DEFAULT NULL,
  `VALOR_NUEVO` text DEFAULT NULL,
  `CREATED_AT` date DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `oc_detalle_log`:
--

--
-- Volcado de datos para la tabla `oc_detalle_log`
--

INSERT INTO `oc_detalle_log` (`ID_DETALLE_LOG`, `ID_LOG_MODIFICACION`, `PARAMETRO`, `VALOR_ANTERIOR`, `VALOR_NUEVO`, `CREATED_AT`) VALUES
(1, 1, 'DUI', '01030503', '0103050305', NULL),
(2, 2, 'DUI', '056785357', '0567853578', NULL),
(3, 3, 'DUI', '0103050305', '010305030', NULL),
(4, 4, 'DIRECCION', 'avenida de prueba 5', 'avenida de prueba 56', NULL),
(5, 5, 'DUI', '0567853578', '056785357', NULL),
(6, 6, 'DIRECCION', 'Avenida de prueba', 'Avenida de pruebahhh', NULL),
(7, 7, 'DUI', '0124574257', '012457425', NULL),
(8, 8, 'DIRECCION', 'avenida de prueba 4', 'avenida de prueba 45', NULL),
(9, 9, 'DIRECCION', 'avenida de prueba 45', 'avenida de prueba 45BJB', NULL),
(10, 10, 'DUI', '010030204', '01003020', NULL),
(11, 11, 'DUI', '056785357', '0567853576', NULL),
(12, 12, 'DIRECCION', 'Avenida de pruebahhh', 'Avenida de prueba', NULL),
(13, 13, 'ESTADO', 'activo', 'inactivo', NULL),
(14, 14, 'ESTADO', 'activo', 'inactivo', NULL),
(15, 15, 'ESTADO', 'activo', 'inactivo', NULL),
(16, 16, 'ESTADO', 'inactivo', 'activo', NULL),
(17, 17, 'DIRECCION', 'AVENIDA PRINCIAPL', 'AVENIDA PRINCIAPLkjkjsd', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oc_log_modificacion`
--

DROP TABLE IF EXISTS `oc_log_modificacion`;
CREATE TABLE `oc_log_modificacion` (
  `ID_LOG_MODIFICACION` int(11) NOT NULL,
  `ID_DETALLE_CLIENTE` int(11) DEFAULT NULL,
  `CREATED_AT` date DEFAULT current_timestamp(),
  `USUARIO_CREATED` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `oc_log_modificacion`:
--

--
-- Volcado de datos para la tabla `oc_log_modificacion`
--

INSERT INTO `oc_log_modificacion` (`ID_LOG_MODIFICACION`, `ID_DETALLE_CLIENTE`, `CREATED_AT`, `USUARIO_CREATED`) VALUES
(1, 4, NULL, NULL),
(2, 1, NULL, NULL),
(3, 4, NULL, NULL),
(4, 4, NULL, NULL),
(5, 1, NULL, NULL),
(6, 1, NULL, NULL),
(7, 3, NULL, NULL),
(8, 3, NULL, NULL),
(9, 3, '2024-12-08', NULL),
(10, 8, '2024-12-08', NULL),
(11, 1, '2024-12-08', NULL),
(12, 1, '2024-12-08', NULL),
(13, 2, '2024-12-08', NULL),
(14, 3, '2024-12-08', NULL),
(15, 8, '2024-12-08', NULL),
(16, 8, '2024-12-08', NULL),
(17, 8, '2024-12-08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `ID_PERFIL` int(11) NOT NULL,
  `NOMBRE_PERFIL` varchar(255) DEFAULT NULL,
  `ESTADO_PERFIL` varchar(255) DEFAULT 'activo',
  `CREATED_AT` date DEFAULT sysdate()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `perfil`:
--

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`ID_PERFIL`, `NOMBRE_PERFIL`, `ESTADO_PERFIL`, `CREATED_AT`) VALUES
(1, 'ADMIN', 'activo', '2024-12-06'),
(2, 'BASICO', 'activo', '2024-12-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pg_permisos`
--

DROP TABLE IF EXISTS `pg_permisos`;
CREATE TABLE `pg_permisos` (
  `ID_PERMISO` int(11) NOT NULL,
  `NOMBRE_PERMISO` varchar(255) DEFAULT NULL,
  `RUTA_PERMISO` text DEFAULT NULL,
  `ESTADO_PERMISO` varchar(255) DEFAULT 'activo'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `pg_permisos`:
--

--
-- Volcado de datos para la tabla `pg_permisos`
--

INSERT INTO `pg_permisos` (`ID_PERMISO`, `NOMBRE_PERMISO`, `RUTA_PERMISO`, `ESTADO_PERMISO`) VALUES
(1, 'Home', '/Home', 'activo'),
(2, 'Perfil Cliente', '/PerfilPagina', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pg_permisos_perfil`
--

DROP TABLE IF EXISTS `pg_permisos_perfil`;
CREATE TABLE `pg_permisos_perfil` (
  `ID_PERMISO_PERFIL` int(11) NOT NULL,
  `ID_PERMISO` int(11) DEFAULT NULL,
  `ID_PERFIL` int(11) DEFAULT NULL,
  `CREATED_AT` date DEFAULT sysdate(),
  `USUARIO_CREATED` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `pg_permisos_perfil`:
--

--
-- Volcado de datos para la tabla `pg_permisos_perfil`
--

INSERT INTO `pg_permisos_perfil` (`ID_PERMISO_PERFIL`, `ID_PERMISO`, `ID_PERFIL`, `CREATED_AT`, `USUARIO_CREATED`) VALUES
(1, 1, 1, '2024-12-07', 1),
(2, 2, 1, '2024-12-07', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `CORREO` varchar(255) DEFAULT NULL,
  `PASSWORD` text NOT NULL,
  `STATUS_USUARIO` varchar(255) DEFAULT 'activo',
  `CREATED_AT` date DEFAULT current_timestamp(),
  `ID_PERFIL` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- RELACIONES PARA LA TABLA `usuarios`:
--

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `NOMBRE`, `CORREO`, `PASSWORD`, `STATUS_USUARIO`, `CREATED_AT`, `ID_PERFIL`) VALUES
(1, 'BCARRANZA', 'byronc3601@hotmail.com', '1111', 'activo', '2024-12-06', 1),
(2, 'admin', 'admin@admin.com', '1234', 'activo', '2024-12-08', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `log_loggin`
--
ALTER TABLE `log_loggin`
  ADD PRIMARY KEY (`ID_LOG`),
  ADD KEY `FK_USUARIO_LOG` (`ID_USUARIO`);

--
-- Indices de la tabla `oc_clientes`
--
ALTER TABLE `oc_clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `oc_detalle_cliente`
--
ALTER TABLE `oc_detalle_cliente`
  ADD PRIMARY KEY (`ID_DETALLE_CLIENTE`),
  ADD KEY `FK_ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `oc_detalle_log`
--
ALTER TABLE `oc_detalle_log`
  ADD PRIMARY KEY (`ID_DETALLE_LOG`),
  ADD KEY `FK_ID_LOG_MODIFICACION` (`ID_LOG_MODIFICACION`);

--
-- Indices de la tabla `oc_log_modificacion`
--
ALTER TABLE `oc_log_modificacion`
  ADD PRIMARY KEY (`ID_LOG_MODIFICACION`),
  ADD KEY `FK_ID_DETALLE_CLIENTE` (`ID_DETALLE_CLIENTE`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`ID_PERFIL`);

--
-- Indices de la tabla `pg_permisos`
--
ALTER TABLE `pg_permisos`
  ADD PRIMARY KEY (`ID_PERMISO`);

--
-- Indices de la tabla `pg_permisos_perfil`
--
ALTER TABLE `pg_permisos_perfil`
  ADD PRIMARY KEY (`ID_PERMISO_PERFIL`),
  ADD KEY `FK_ID_PERMISO` (`ID_PERMISO`),
  ADD KEY `FK_ID_PERFIL` (`ID_PERFIL`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `FK_USUARIO_PERFIL` (`ID_PERFIL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `log_loggin`
--
ALTER TABLE `log_loggin`
  MODIFY `ID_LOG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oc_clientes`
--
ALTER TABLE `oc_clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `oc_detalle_cliente`
--
ALTER TABLE `oc_detalle_cliente`
  MODIFY `ID_DETALLE_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `oc_detalle_log`
--
ALTER TABLE `oc_detalle_log`
  MODIFY `ID_DETALLE_LOG` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `oc_log_modificacion`
--
ALTER TABLE `oc_log_modificacion`
  MODIFY `ID_LOG_MODIFICACION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `ID_PERFIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pg_permisos`
--
ALTER TABLE `pg_permisos`
  MODIFY `ID_PERMISO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pg_permisos_perfil`
--
ALTER TABLE `pg_permisos_perfil`
  MODIFY `ID_PERMISO_PERFIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
