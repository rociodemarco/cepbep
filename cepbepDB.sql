CREATE TABLE `trabajadores` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(20),
  `password` varchar(100),
  `dni` varchar(9),
  `rol` varchar(15),
  `tlf` int(9),
  `email` varchar(40)
);

CREATE TABLE `clientes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(20),
  `password` varchar(100),
  `direccion` varchar(20),
  `tlf` int(9),
  `email` varchar(40),
  `dni_cif` varchar(9)
);

CREATE TABLE `tipo_de_servicio` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(20),
  `precio` float
);

CREATE TABLE `inventario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom_objeto` varchar(50),
  `cantidad` int,
  `precio` float
);

CREATE TABLE `citas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_cliente` int,
  `id_trabajador` int,
  `fecha` datetime
);

CREATE TABLE `ventas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `id_trabajador` int,
  `id_cliente` int,
  `id_servicio` int,
  `id_det_vent` int,
  `precio_total` float,
  `fecha` timestamp
);

CREATE TABLE `detalle_venta` (
  `id_det_vent` int PRIMARY KEY AUTO_INCREMENT,
  `num_venta` int,
  `id_invent` int,
  `precio` float,
  `cantidad` int
);

ALTER TABLE `citas` ADD FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`);

ALTER TABLE `citas` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `ventas` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `ventas` ADD FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`);

ALTER TABLE `ventas` ADD FOREIGN KEY (`id_servicio`) REFERENCES `tipo_de_servicio` (`id`);

ALTER TABLE `ventas` ADD FOREIGN KEY (`id_det_vent`) REFERENCES `detalle_venta` (`id_det_vent`);

ALTER TABLE `inventario` ADD FOREIGN KEY (`id`) REFERENCES `detalle_venta` (`id_invent`);
