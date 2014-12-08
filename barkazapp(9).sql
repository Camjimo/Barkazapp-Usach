-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-12-2014 a las 04:46:59
-- Versión del servidor: 5.5.40-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `barkazapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_materials`
--

CREATE TABLE IF NOT EXISTS `catalogo_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_material` int(11) NOT NULL,
  `precio_material` int(11) NOT NULL,
  `nuevo` int(11) NOT NULL DEFAULT '1',
  `material_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_catalogo_materials_on_material_id` (`material_id`),
  KEY `index_catalogo_materials_on_unidad_medida_id` (`unidad_medida_id`),
  KEY `index_catalogo_materials_on_proveedor_id` (`proveedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monto_total` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `monto_iva` int(11) DEFAULT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `tipo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_compras_on_proveedor_id` (`proveedor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE IF NOT EXISTS `detalle_compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_compra` int(11) NOT NULL,
  `precio_unidad_compra` int(11) NOT NULL,
  `total_compra` int(11) DEFAULT NULL,
  `fecha_vencimiento_lote` date NOT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `material_id` int(11) NOT NULL,
  `tipo_contenedor_id` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_detalle_compras_on_material_id` (`material_id`),
  KEY `index_detalle_compras_on_tipo_contenedor_id` (`tipo_contenedor_id`),
  KEY `index_detalle_compras_on_compra_id` (`compra_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Disparadores `detalle_compras`
--
DROP TRIGGER IF EXISTS `agregar_lote`;
DELIMITER //
CREATE TRIGGER `agregar_lote` AFTER UPDATE ON `detalle_compras`
 FOR EACH ROW begin
if new.nuevo=false then
   select cantidad,unidad_medida_id into @cantidad,@unidad_medida from equivalencia where new.tipo_contenedor_id=tipo_contenedor_id;
   select count(id) into @aux from lotes where new.material_id=material_id and en_uso=true;
   if @aux>0 then
      insert into lotes (stock_actual_bodega,stock_original,fecha_vencimiento,en_uso,material_id,precio_compra,unidad_medida_id) values (new.cantidad_compra*@cantidad,new.cantidad_compra*@cantidad,new.fecha_vencimiento_lote,0,new.material_id,new.total_compra,@unidad_medida);
   else
      insert into lotes (stock_actual_bodega,stock_original,fecha_vencimiento,en_uso,material_id,precio_compra,unidad_medida_id) values (new.cantidad_compra*@cantidad,new.cantidad_compra*@cantidad,new.fecha_vencimiento_lote,1,new.material_id,new.total_compra,@unidad_medida);
   end if;
end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `calcular_monto_compra`;
DELIMITER //
CREATE TRIGGER `calcular_monto_compra` AFTER INSERT ON `detalle_compras`
 FOR EACH ROW begin
select sum(total_compra) into @total from detalle_compras where compra_id=new.compra_id;
update compras set monto_total=@total where id=new.compra_id;
select tipo into @tipo from compras where id=new.compra_id;
if @tipo='Factura' then
update compras set monto_iva=@total*0.19;
end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `calcular_pmp`;
DELIMITER //
CREATE TRIGGER `calcular_pmp` BEFORE UPDATE ON `detalle_compras`
 FOR EACH ROW begin
	select sum(cantidad_compra),sum(cantidad_compra*total_compra) into @cantidad,@precio from detalle_compras where material_id=new.material_id and id!=new.id;
	set @pmp = (@precio+(new.cantidad_compra*new.total_compra))/(@cantidad+new.cantidad_compra);
	update materials set pmp=@pmp where id=new.material_id;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `calcular_total_compra`;
DELIMITER //
CREATE TRIGGER `calcular_total_compra` BEFORE INSERT ON `detalle_compras`
 FOR EACH ROW begin
set new.total_compra=new.cantidad_compra*new.precio_unidad_compra;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_venta` int(11) NOT NULL,
  `precio_venta` int(11) DEFAULT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `entregado` tinyint(1) NOT NULL DEFAULT '0',
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_detalle_pedidos_on_pedido_id` (`pedido_id`),
  KEY `index_detalle_pedidos_on_producto_id` (`producto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Disparadores `detalle_pedidos`
--
DROP TRIGGER IF EXISTS `buscar_precio`;
DELIMITER //
CREATE TRIGGER `buscar_precio` BEFORE INSERT ON `detalle_pedidos`
 FOR EACH ROW begin
select precio into @precio from productos where id = new.producto_id;
set new.precio_venta = @precio;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `calcular_monto_total`;
DELIMITER //
CREATE TRIGGER `calcular_monto_total` AFTER INSERT ON `detalle_pedidos`
 FOR EACH ROW begin
select sum(precio_venta*cantidad_venta) into @total from detalle_pedidos where pedido_id=new.pedido_id;
update pedidos set monto_total=@total where id=new.pedido_id;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `disminuir_stock`;
DELIMITER //
CREATE TRIGGER `disminuir_stock` AFTER UPDATE ON `detalle_pedidos`
 FOR EACH ROW begin
	declare done int default false;
	declare a varchar(10);
	declare b,c int;
	declare c1 cursor for select p.tipo,r.material_id,r.cantidad_compuesto from productos p,receta r where new.producto_id=p.id and new.producto_id=r.producto_id;
	declare continue handler for not found set done = true;
	open c1;
	read_loop: loop
		if new.entregado=true then
			fetch c1 into a,b,c;
			if done then
      			leave read_loop;
   			end if;
   			if a='Cocina' then
      			update lotes set stock_actual_cocina=stock_actual_cocina-(c*new.cantidad_venta) where material_id=b and en_uso=true;
   			else
      			update lotes set stock_actual_bar=stock_actual_bar-(c*new.cantidad_venta) where material_id=b and en_uso=true;
   			end if;
		else
			leave read_loop;
		end if;
	end loop;
	close c1;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equivalencia`
--

CREATE TABLE IF NOT EXISTS `equivalencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `tipo_contenedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_equivalencia_on_unidad_medida_id` (`unidad_medida_id`),
  KEY `index_equivalencia_on_tipo_contenedor_id` (`tipo_contenedor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Volcado de datos para la tabla `equivalencia`
--

INSERT INTO `equivalencia` (`id`, `cantidad`, `unidad_medida_id`, `tipo_contenedor_id`) VALUES
(1, 5, 5, 18),
(3, 150, 4, 37),
(4, 1000, 3, 19),
(5, 1, 5, 28),
(6, 1500, 11, 27),
(7, 1000, 3, 25),
(8, 600, 3, 26),
(9, 1000, 3, 29),
(10, 300, 3, 30),
(11, 30, 4, 31),
(12, 800, 3, 32),
(13, 1, 5, 33),
(14, 20, 4, 34),
(15, 20, 4, 35),
(16, 15000, 3, 36),
(17, 50, 4, 38),
(18, 20000, 3, 40),
(19, 24, 8, 48),
(20, 30, 1, 46),
(21, 30, 4, 39),
(22, 4000, 3, 41),
(23, 15000, 3, 43),
(24, 15000, 3, 42),
(25, 20, 1, 44),
(26, 27, 1, 47),
(27, 27, 1, 48),
(28, 5000, 3, 52),
(29, 5000, 3, 53),
(30, 5000, 3, 54),
(31, 180, 3, 55),
(32, 180, 3, 57),
(33, 180, 3, 58),
(34, 180, 3, 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedidos`
--

CREATE TABLE IF NOT EXISTS `estado_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `estado_pedidos`
--

INSERT INTO `estado_pedidos` (`id`, `nombre`) VALUES
(1, 'Pendiente'),
(2, 'Entregado'),
(3, 'Pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_costo_productos`
--

CREATE TABLE IF NOT EXISTS `historial_costo_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_historial_costo_productos_on_producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_precio_productos`
--

CREATE TABLE IF NOT EXISTS `historial_precio_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `precio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_historial_precio_productos_on_producto_id` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE IF NOT EXISTS `inventarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `tipo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_detalles`
--

CREATE TABLE IF NOT EXISTS `inventario_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stcok_local_material` int(11) NOT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `material_id` int(11) NOT NULL,
  `inventario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_inventario_detalles_on_material_id` (`material_id`),
  KEY `index_inventario_detalles_on_inventario_id` (`inventario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE IF NOT EXISTS `lotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_original` int(11) NOT NULL,
  `stock_actual_bodega` int(11) NOT NULL,
  `stock_actual_cocina` int(11) NOT NULL DEFAULT '0',
  `stock_actual_bar` int(11) NOT NULL DEFAULT '0',
  `precio_compra` int(11) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `en_uso` tinyint(1) NOT NULL DEFAULT '0',
  `material_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_lotes_on_material_id` (`material_id`),
  KEY `index_lotes_on_unidad_medida_id` (`unidad_medida_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Disparadores `lotes`
--
DROP TRIGGER IF EXISTS `editar_lotes`;
DELIMITER //
CREATE TRIGGER `editar_lotes` BEFORE UPDATE ON `lotes`
 FOR EACH ROW begin
   	if (new.stock_actual_cocina<=(old.stock_actual_bodega+old.stock_actual_cocina) and new.stock_actual_cocina>old.stock_actual_cocina) or (new.stock_actual_bar<=(old.stock_actual_bodega+old.stock_actual_bar) and new.stock_actual_bar>old.stock_actual_bar) then
      if new.stock_actual_cocina!=old.stock_actual_cocina then
         set new.stock_actual_bodega=new.stock_actual_bodega-(new.stock_actual_cocina-old.stock_actual_cocina);
      end if;
      if new.stock_actual_bar!=old.stock_actual_bar then
         set new.stock_actual_bodega=new.stock_actual_bodega-(new.stock_actual_bar-old.stock_actual_bar);
      end if;
   	elseif new.stock_actual_cocina>(old.stock_actual_bodega+old.stock_actual_cocina) or new.stock_actual_bar>(old.stock_actual_bodega+old.stock_actual_bar) then
      set new.stock_actual_cocina=old.stock_actual_cocina;
      set new.stock_actual_bar=old.stock_actual_bar;
   end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materials`
--

CREATE TABLE IF NOT EXISTS `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pmp` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `tipo_material_id` int(11) NOT NULL,
  `unidad_medida_id` int(11) NOT NULL,
  `unidad_medida2` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_materials_on_tipo_material_id` (`tipo_material_id`),
  KEY `index_materials_on_unidad_medida_id` (`unidad_medida_id`),
  KEY `FK_MATERIAL_SE_TRABAJ_UNIDAD_M` (`unidad_medida2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=322 ;

--
-- Volcado de datos para la tabla `materials`
--

INSERT INTO `materials` (`id`, `nombre`, `pmp`, `cantidad`, `tipo_material_id`, `unidad_medida_id`, `unidad_medida2`) VALUES
(245, 'arroz mexicano', NULL, NULL, 1, 3, 18),
(246, 'pure de frijol', NULL, NULL, 1, 3, 19),
(247, 'pure de maiz', NULL, NULL, 1, 3, 19),
(248, 'salsa agria', NULL, NULL, 2, 3, 19),
(249, 'salsa picante', NULL, NULL, 2, 3, 19),
(250, 'salsa de queso', NULL, NULL, 2, 3, 19),
(283, 'guacamole', NULL, NULL, 2, 3, 19),
(284, 'pimentón ensalada', NULL, NULL, 3, 3, 25),
(285, 'ensalada primavera hecha', NULL, NULL, 3, 3, 25),
(286, 'lechuga', NULL, NULL, 3, 3, 25),
(287, 'pimentón decoración', NULL, NULL, 4, 3, 25),
(288, 'cebolla pluma', NULL, NULL, 4, 3, 25),
(289, 'cebolla cuadro', NULL, NULL, 4, 3, 25),
(290, 'tarro de frutilla', NULL, NULL, 8, 3, 26),
(291, 'tarro de piña', NULL, NULL, 8, 3, 26),
(292, 'tarro de macedonia', NULL, NULL, 8, 3, 26),
(293, 'Stracciatella-lucuma-chocolate', NULL, NULL, 8, 3, 27),
(294, 'arroz ', NULL, NULL, 6, 3, 28),
(295, 'azúcar', NULL, NULL, 6, 3, 29),
(296, 'champiñón', NULL, NULL, 6, 3, 30),
(297, 'huevo', NULL, NULL, 6, 3, 31),
(298, 'nachos', NULL, NULL, 6, 3, 32),
(299, 'poroto negro', NULL, NULL, 6, 5, 33),
(300, 'tortillas chicas', NULL, NULL, 6, 4, 34),
(301, 'tortillas grandes', NULL, NULL, 6, 4, 35),
(302, 'cebolla ', NULL, NULL, 9, 3, 36),
(303, 'limón de pica', NULL, NULL, 9, 4, 37),
(304, 'limón', NULL, NULL, 9, 4, 38),
(305, 'naranja', NULL, NULL, 9, 4, 39),
(306, 'palta', NULL, NULL, 9, 4, 40),
(307, 'pimentón verde', NULL, NULL, 9, 4, 41),
(308, 'pimentón rojo', NULL, NULL, 9, 4, 41),
(309, 'tomate', NULL, NULL, 9, 4, 42),
(310, 'chirimoya', NULL, NULL, 10, 3, 43),
(311, 'jack daniels', NULL, NULL, 10, 1, 44),
(312, 'goma', NULL, NULL, 10, 1, 45),
(313, 'tequila la arenita', NULL, NULL, 10, 1, 46),
(314, 'triplesec', NULL, NULL, 10, 1, 47),
(315, 'bife pulpa', NULL, NULL, 11, 3, 52),
(316, 'bife lomo', NULL, NULL, 11, 3, 53),
(317, 'bife pollo', NULL, NULL, 11, 3, 54),
(318, 'porción pollo', NULL, NULL, 11, 3, 55),
(319, 'porción pulpa', NULL, NULL, 11, 3, 56),
(320, 'porción res', NULL, NULL, 11, 3, 57),
(321, 'porción camarón', NULL, NULL, 11, 3, 58);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE IF NOT EXISTS `mesas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ocupada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `ocupada`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `monto_total` int(11) DEFAULT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `mesa_id` int(11) NOT NULL,
  `estado_pedido_id` int(11) NOT NULL DEFAULT '1',
  `tipo_pago_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pedidos_on_mesa_id` (`mesa_id`),
  KEY `index_pedidos_on_estado_pedido_id` (`estado_pedido_id`),
  KEY `index_pedidos_on_tipo_pago_id` (`tipo_pago_id`),
  KEY `index_pedidos_on_usuario_id` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Disparadores `pedidos`
--
DROP TRIGGER IF EXISTS `desocupar_mesa`;
DELIMITER //
CREATE TRIGGER `desocupar_mesa` AFTER UPDATE ON `pedidos`
 FOR EACH ROW begin
if new.estado_pedido_id=3 then
update mesas set ocupada=false where id=old.mesa_id;
end if;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ocupar_mesa`;
DELIMITER //
CREATE TRIGGER `ocupar_mesa` AFTER INSERT ON `pedidos`
 FOR EACH ROW begin
update mesas set ocupada=true where id=new.mesa_id;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `actual` tinyint(1) NOT NULL DEFAULT '1',
  `costo` int(11) DEFAULT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `clasificacion` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Disparadores `productos`
--
DROP TRIGGER IF EXISTS `calcular_costo`;
DELIMITER //
CREATE TRIGGER `calcular_costo` BEFORE UPDATE ON `productos`
 FOR EACH ROW begin
	if new.nuevo=false then
		select sum(r.cantidad_compuesto*(m.pmp*(1/e.cantidad))) into @costo from equivalencia e, materials m, receta r where r.producto_id=1 and r.material_id=m.id and m.unidad_medida2=e.tipo_contenedor_id;
		set new.costo=@costo;
	end if;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE IF NOT EXISTS `proveedors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nuevo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `nombre`, `telefono`, `correo`, `nuevo`) VALUES
(1, 'Súper pollo', 2837401, '', 0),
(2, 'Carnes Santa Ana', 4719239, '', 0),
(3, 'Don Francis', 4728312, '', 0),
(4, 'Distribuidora El Cielo', 4864820, '', 0),
(5, 'Distribuidora Portugal', 9982813, '', 0),
(6, 'Líder', 7387819, '', 0),
(7, 'Santa Isabel', 4239099, '', 0),
(8, 'Vega central', 1328904, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE IF NOT EXISTS `receta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad_compuesto` int(11) NOT NULL,
  `nuevo` tinyint(1) NOT NULL DEFAULT '1',
  `material_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_receta_on_material_id` (`material_id`),
  KEY `index_receta_on_producto_id` (`producto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20140219221337'),
('20141128012036'),
('20141128012037'),
('20141128012039'),
('20141128012043'),
('20141128012045'),
('20141128012047'),
('20141128012049'),
('20141128012051'),
('20141128012052'),
('20141128012054'),
('20141128012058'),
('20141128012100'),
('20141128012102'),
('20141128012104'),
('20141128012105'),
('20141128012107'),
('20141128012109'),
('20141128012111'),
('20141128012113'),
('20141128012115'),
('20141128043334'),
('20141128135726'),
('20141206225805');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contenedors`
--

CREATE TABLE IF NOT EXISTS `tipo_contenedors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `asignado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=59 ;

--
-- Volcado de datos para la tabla `tipo_contenedors`
--

INSERT INTO `tipo_contenedors` (`id`, `nombre`, `asignado`) VALUES
(18, 'caja plástica arroz', 1),
(19, 'frasco ', 1),
(25, 'caja plástica', 1),
(26, 'tarro', 1),
(27, 'cassata', 1),
(28, 'bolsa arroz', 1),
(29, 'bolsa azúcar', 1),
(30, 'bandeja champiñón', 1),
(31, 'bandeja huevos', 1),
(32, 'bolsa nachos', 1),
(33, 'bolsa porotos', 1),
(34, 'bolsa tort. Chicas', 1),
(35, 'bolsa tort. Grandes', 1),
(36, 'caja cebolla', 1),
(37, 'caja lima', 1),
(38, 'caja limón', 1),
(39, 'caja naranja', 1),
(40, 'caja palta', 1),
(41, 'caja pimentón', 1),
(42, 'caja tomate', 1),
(43, 'caja chirimoya', 1),
(44, 'bot. Jack daniels', 1),
(45, 'botella', 1),
(46, 'bot. Tequila', 1),
(47, 'bot. Triplesec', 1),
(48, 'jaba', 1),
(52, 'bolsa pulpa', 1),
(53, 'bolsa lomo', 1),
(54, 'bolsa pollo', 1),
(55, 'bolsita pollo', 1),
(56, 'bolsita pulpa ', 1),
(57, 'bolsita res', 1),
(58, 'bolsita camarón', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_materials`
--

CREATE TABLE IF NOT EXISTS `tipo_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `tipo_materials`
--

INSERT INTO `tipo_materials` (`id`, `nombre`) VALUES
(1, 'comida'),
(2, 'salsa'),
(3, 'vegetal prepicado'),
(4, 'pre hechos'),
(6, 'mercaderia'),
(7, 'condimento'),
(8, 'mercaderia postre'),
(9, 'verdura'),
(10, 'barra'),
(11, 'carne');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pagos`
--

CREATE TABLE IF NOT EXISTS `tipo_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

CREATE TABLE IF NOT EXISTS `tipo_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medidas`
--

CREATE TABLE IF NOT EXISTS `unidad_medidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `simbolo` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `unidad_medidas`
--

INSERT INTO `unidad_medidas` (`id`, `nombre`, `simbolo`) VALUES
(1, 'onza', 'oz'),
(2, 'litro', 'lt'),
(3, 'gramo', 'gr'),
(4, 'unidad', 'u'),
(5, 'kilogramo', 'kg'),
(6, 'bolsa', 'bolsa'),
(7, 'caja', 'caja(s)'),
(8, 'botella', 'botella(s)'),
(9, 'bandeja', 'bandeja(s)'),
(10, 'tarro', 'tarro(s)'),
(11, 'mililitro', 'ml'),
(12, '#"!', '1sx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `name`, `address`, `country`, `created_at`, `updated_at`) VALUES
(1, 'yerko.pino@usach.cl', '$2a$10$IsHZM7Q2y9WYtVWdwtIAfO5xYTaZCtP.tVLkfFCKlHKWNw0oHgemW', NULL, NULL, NULL, 5, '2014-12-08 06:11:31', '2014-12-08 05:05:35', '186.36.162.190', '127.0.0.1', NULL, NULL, NULL, '2014-12-07 15:50:48', '2014-12-08 06:11:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pinpass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rut` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_usuarios_on_tipo_usuario_id` (`tipo_usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `pinpass`, `rut`, `estado`, `tipo_usuario_id`) VALUES
(1, 'Yerko', NULL, NULL, NULL, NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo_materials`
--
ALTER TABLE `catalogo_materials`
  ADD CONSTRAINT `FK_CATALOGO_TIENE_PROVEEDO` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedors` (`id`),
  ADD CONSTRAINT `FK_CATALOGO_ES_COMPUE_MATERIAL` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `FK_CATALOGO_SE_MIDE_C_UNIDAD_M` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK_COMPRA_SE_REALIZ_PROVEEDO` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedors` (`id`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `FK_DETALLE__VIENE_EN__TIPO_CON` FOREIGN KEY (`tipo_contenedor_id`) REFERENCES `tipo_contenedors` (`id`),
  ADD CONSTRAINT `FK_DETALLE__ES_COMPUE_MATERIAL` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `FK_DETALLE__SE_CONFOR_COMPRA` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`id`);

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `FK_DETALLE__TIENE_PEDIDO` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `FK_DETALLE__COMPUESTO_PRODUCTO` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `equivalencia`
--
ALTER TABLE `equivalencia`
  ADD CONSTRAINT `FK_EQUIVALE_TRANSFORM_UNIDAD_M` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`),
  ADD CONSTRAINT `FK_EQUIVALE_TIENE_UNA_TIPO_CON` FOREIGN KEY (`tipo_contenedor_id`) REFERENCES `tipo_contenedors` (`id`);

--
-- Filtros para la tabla `historial_costo_productos`
--
ALTER TABLE `historial_costo_productos`
  ADD CONSTRAINT `FK_HISTORIA_TIENE_ASO_PRODUCTO` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `historial_precio_productos`
--
ALTER TABLE `historial_precio_productos`
  ADD CONSTRAINT `FK_HISTORIA_COMPUESTO_PRODUCTO` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `inventario_detalles`
--
ALTER TABLE `inventario_detalles`
  ADD CONSTRAINT `FK_INVENTAR_SE_CONFOR_INVENTAR` FOREIGN KEY (`inventario_id`) REFERENCES `inventarios` (`id`),
  ADD CONSTRAINT `FK_INVENTAR_ES_COMPUE_MATERIAL` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `FK_LOTE_SE_MIDE_C_UNIDAD_M` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`),
  ADD CONSTRAINT `FK_LOTE_AGRUPADO__MATERIAL` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Filtros para la tabla `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `FK_MATERIAL_SE_TRABAJ_UNIDAD_M` FOREIGN KEY (`unidad_medida2`) REFERENCES `tipo_contenedors` (`id`),
  ADD CONSTRAINT `FK_MATERIAL_CLASIFICA_TIPO_MAT` FOREIGN KEY (`tipo_material_id`) REFERENCES `tipo_materials` (`id`),
  ADD CONSTRAINT `FK_MATERIAL_SE_MIDE_C_UNIDAD_M` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medidas` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `FK_PEDIDO_SE_CLASIF_ESTADO_P` FOREIGN KEY (`estado_pedido_id`) REFERENCES `estado_pedidos` (`id`),
  ADD CONSTRAINT `FK_PEDIDO_CANCELADO_TIPO_PAG` FOREIGN KEY (`tipo_pago_id`) REFERENCES `tipo_pagos` (`id`),
  ADD CONSTRAINT `FK_PEDIDO_REALIZA_MESA` FOREIGN KEY (`mesa_id`) REFERENCES `mesas` (`id`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `FK_RECETA_ES_COMPUE_MATERIAL` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `FK_RECETA_ESTA_HECH_PRODUCTO` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
