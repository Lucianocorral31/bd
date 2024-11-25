-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2024 a las 04:37:04
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
-- Base de datos: `trabajonelly`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(11) NOT NULL,
  `codart` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `rubro_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `punto_pedido` int(11) DEFAULT 0,
  `stock_seguridad` int(11) DEFAULT 0,
  `deposito_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`id`, `codart`, `descripcion`, `rubro_id`, `stock`, `punto_pedido`, `stock_seguridad`, `deposito_id`) VALUES
(1, 'A100', 'Cemento Portland', 2, 500, 50, 100, 1),
(2, 'A101', 'Pegamento Acrílico', 3, 1500, 100, 200, 2),
(3, 'A102', 'Cable Eléctrico', 4, 1200, 200, 300, 3),
(4, 'A103', 'Pintura Sintética', 5, 800, 80, 150, 1),
(5, 'A104', 'Caño de PVC', 1, 2000, 150, 300, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositos`
--

CREATE TABLE `depositos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `domicilio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depositos`
--

INSERT INTO `depositos` (`id`, `nombre`, `domicilio`) VALUES
(1, 'Deposito Central', 'Calle Central 1000'),
(2, 'Deposito Norte', 'Av. Norte 2000'),
(3, 'Deposito Sur', 'Calle Sur 3000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_compra`
--

CREATE TABLE `ordenes_compra` (
  `id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `bruto_total` float DEFAULT NULL,
  `neto_total` float DEFAULT NULL,
  `iva` float DEFAULT NULL,
  `cantidad_comprada` int(11) DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Pendiente',
  `condicion_pago` varchar(50) DEFAULT NULL,
  `pedido_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes_compra`
--

INSERT INTO `ordenes_compra` (`id`, `proveedor_id`, `fecha_compra`, `bruto_total`, `neto_total`, `iva`, `cantidad_comprada`, `precio_unitario`, `descripcion`, `estado`, `condicion_pago`, `pedido_id`) VALUES
(1, 1, '2024-09-01', 200000, 180000, 36000, 100, 1800, 'Caños para agua', 'Pendiente', 'Efectivo', 1),
(2, 2, '2024-08-15', 300000, 270000, 54000, 150, 2000, 'Cementos de alta resistencia', 'Completada', 'Crédito', 2),
(3, 3, '2024-07-05', 150000, 135000, 27000, 80, 1500, 'Pinturas industriales', 'Pendiente', 'Efectivo', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `sector_id` int(11) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `sector_id`, `fecha_emision`, `estado`) VALUES
(1, 1, '2024-08-10', 'Pendiente'),
(2, 2, '2024-07-01', 'Finalizado'),
(3, 3, '2024-05-20', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_detalle`
--

CREATE TABLE `pedidos_detalle` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `articulo_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos_detalle`
--

INSERT INTO `pedidos_detalle` (`id`, `pedido_id`, `articulo_id`, `cantidad`) VALUES
(1, 1, 1, 100),
(2, 2, 2, 150),
(3, 3, 4, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `CUIT` varchar(15) NOT NULL,
  `RAZSOC` varchar(100) NOT NULL,
  `DIRECC` varchar(255) DEFAULT NULL,
  `TELEF` varchar(20) DEFAULT NULL,
  `MAIL` varchar(100) DEFAULT NULL,
  `CREDITO` float DEFAULT NULL,
  `RANKING` int(11) DEFAULT NULL,
  `provincia` varchar(100) DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `rubro_id` int(11) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `CUIT`, `RAZSOC`, `DIRECC`, `TELEF`, `MAIL`, `CREDITO`, `RANKING`, `provincia`, `localidad`, `rubro_id`, `fecha_alta`) VALUES
(1, '20-12345678-9', 'Proveedor A', 'Calle Ficticia 123', '011-12345678', 'proveedorA@mail.com', 10000, 1, 'Tucumán', 'S.M. de Tucumán', 1, '2022-01-15'),
(2, '20-98765432-1', 'Proveedor B', 'Avenida Ejemplo 456', '011-87654321', 'proveedorB@mail.com', 15000, 2, 'Tucumán', 'S.M. de Tucumán', 2, '2021-07-20'),
(3, '20-56473829-2', 'Proveedor C', 'Calle Prueba 789', '011-56781234', 'proveedorC@mail.com', 20000, 3, 'Tucumán', 'Tafí Viejo', 3, '2023-03-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remitos`
--

CREATE TABLE `remitos` (
  `id` int(11) NOT NULL,
  `orden_compra_id` int(11) DEFAULT NULL,
  `nro_remito` varchar(50) DEFAULT NULL,
  `fecha_remito` date DEFAULT NULL,
  `codigo_articulo` varchar(50) DEFAULT NULL,
  `descripcion_articulo` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `unidad_compra` varchar(20) DEFAULT NULL,
  `deposito_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `remitos`
--

INSERT INTO `remitos` (`id`, `orden_compra_id`, `nro_remito`, `fecha_remito`, `codigo_articulo`, `descripcion_articulo`, `cantidad`, `unidad_compra`, `deposito_id`) VALUES
(1, 1, 'RM1001', '2024-09-02', 'A100', 'Cemento Portland', 100, 'Bultos', 1),
(2, 2, 'RM1002', '2024-08-16', 'A102', 'Cable Eléctrico', 150, 'Metros', 2),
(3, 3, 'RM1003', '2024-07-06', 'A104', 'Caño de PVC', 80, 'Unidades', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubros`
--

CREATE TABLE `rubros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rubros`
--

INSERT INTO `rubros` (`id`, `nombre`) VALUES
(1, 'Caños para agua'),
(2, 'Cementos'),
(4, 'Electricidad'),
(5, 'Herramientas'),
(3, 'Pegamentos'),
(6, 'Pinturas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sectores`
--

INSERT INTO `sectores` (`id`, `nombre`) VALUES
(1, 'Ventas'),
(2, 'Compras'),
(3, 'Logística'),
(4, 'Administración'),
(5, 'Producción');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codart` (`codart`),
  ADD KEY `rubro_id` (`rubro_id`),
  ADD KEY `deposito_id` (`deposito_id`);

--
-- Indices de la tabla `depositos`
--
ALTER TABLE `depositos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sector_id` (`sector_id`);

--
-- Indices de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `articulo_id` (`articulo_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CUIT` (`CUIT`),
  ADD KEY `rubro_id` (`rubro_id`);

--
-- Indices de la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_compra_id` (`orden_compra_id`),
  ADD KEY `deposito_id` (`deposito_id`);

--
-- Indices de la tabla `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `depositos`
--
ALTER TABLE `depositos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `remitos`
--
ALTER TABLE `remitos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rubros`
--
ALTER TABLE `rubros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`id`),
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`deposito_id`) REFERENCES `depositos` (`id`);

--
-- Filtros para la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD CONSTRAINT `ordenes_compra_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`),
  ADD CONSTRAINT `ordenes_compra_ibfk_2` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `sectores` (`id`);

--
-- Filtros para la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD CONSTRAINT `pedidos_detalle_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `pedidos_detalle_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`rubro_id`) REFERENCES `rubros` (`id`);

--
-- Filtros para la tabla `remitos`
--
ALTER TABLE `remitos`
  ADD CONSTRAINT `remitos_ibfk_1` FOREIGN KEY (`orden_compra_id`) REFERENCES `ordenes_compra` (`id`),
  ADD CONSTRAINT `remitos_ibfk_2` FOREIGN KEY (`deposito_id`) REFERENCES `depositos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
