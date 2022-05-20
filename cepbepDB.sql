CREATE TABLE `trabajadores` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `rol` varchar(255),
  `tlf` int(9)
);

CREATE TABLE `clientes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `direccion` varchar(255),
  `tlf` int(9)
);

CREATE TABLE `tipo_de_servicio` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(255),
  `precio` float
);

CREATE TABLE `inventario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nom_objeto` varchar(255),
  `cantidad` int
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
  `id_inventario` int,
  `precio` float
);

ALTER TABLE `citas` ADD FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id`);

ALTER TABLE `citas` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `ventas` ADD FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

ALTER TABLE `trabajadores` ADD FOREIGN KEY (`id`) REFERENCES `ventas` (`id_trabajador`);

ALTER TABLE `tipo_de_servicio` ADD FOREIGN KEY (`id`) REFERENCES `ventas` (`id_servicio`);

ALTER TABLE `inventario` ADD FOREIGN KEY (`id`) REFERENCES `ventas` (`id_inventario`);
