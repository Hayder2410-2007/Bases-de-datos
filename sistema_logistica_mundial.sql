-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 04-11-2026 a las 17:32:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_logistica_mundial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes_hubs`
--

CREATE TABLE `almacenes_hubs` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `direccion` text NOT NULL,
  `capacidad_m3` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(150) DEFAULT NULL,
  `contacto_nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `direccion` text NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id` int(11) NOT NULL,
  `codigo_seguimiento` varchar(50) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `almacen_origen_id` int(11) NOT NULL,
  `almacen_destino_id` int(11) NOT NULL,
  `transportista_id` int(11) DEFAULT NULL,
  `peso_kg` decimal(10,2) NOT NULL,
  `volumen_m3` decimal(10,2) NOT NULL,
  `estado` enum('Registrado','En Tránsito','En Aduana','Entregado','Cancelado') DEFAULT 'Registrado',
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_estimada_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_seguimiento`
--

CREATE TABLE `historial_seguimiento` (
  `id` int(11) NOT NULL,
  `envio_id` int(11) NOT NULL,
  `ubicacion_actual` varchar(150) NOT NULL,
  `estado_checkpoint` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo_iso` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportistas`
--

CREATE TABLE `transportistas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_transporte` enum('Aéreo','Marítimo','Terrestre','Ferroviario') NOT NULL,
  `sitio_web` varchar(150) DEFAULT NULL,
  `telefono_soporte` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes_hubs`
--
ALTER TABLE `almacenes_hubs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudad_id` (`ciudad_id`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pais_id` (`pais_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_seguimiento` (`codigo_seguimiento`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `almacen_origen_id` (`almacen_origen_id`),
  ADD KEY `almacen_destino_id` (`almacen_destino_id`),
  ADD KEY `transportista_id` (`transportista_id`),
  ADD KEY `idx_codigo_seguimiento` (`codigo_seguimiento`);

--
-- Indices de la tabla `historial_seguimiento`
--
ALTER TABLE `historial_seguimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_envio_historial` (`envio_id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo_iso` (`codigo_iso`);

--
-- Indices de la tabla `transportistas`
--
ALTER TABLE `transportistas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes_hubs`
--
ALTER TABLE `almacenes_hubs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_seguimiento`
--
ALTER TABLE `historial_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transportistas`
--
ALTER TABLE `transportistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenes_hubs`
--
ALTER TABLE `almacenes_hubs`
  ADD CONSTRAINT `almacenes_hubs_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`almacen_origen_id`) REFERENCES `almacenes_hubs` (`id`),
  ADD CONSTRAINT `envios_ibfk_3` FOREIGN KEY (`almacen_destino_id`) REFERENCES `almacenes_hubs` (`id`),
  ADD CONSTRAINT `envios_ibfk_4` FOREIGN KEY (`transportista_id`) REFERENCES `transportistas` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `historial_seguimiento`
--
ALTER TABLE `historial_seguimiento`
  ADD CONSTRAINT `historial_seguimiento_ibfk_1` FOREIGN KEY (`envio_id`) REFERENCES `envios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
