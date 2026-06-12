-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2026 a las 07:28:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoleafy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_usuarios`, `comentario`, `fecha`) VALUES
(1, 13, 'Hola! me encanta esta pagina', '2026-04-25 11:27:30'),
(2, 13, 'que genial esta todo!', '2026-04-29 17:43:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_reacciones`
--

CREATE TABLE `comentarios_reacciones` (
  `id_reaccion` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_reportes`
--

CREATE TABLE `comentarios_reportes` (
  `id_reporte` int(11) NOT NULL,
  `id_comentario` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `motivo` varchar(100) NOT NULL,
  `detalle` text NOT NULL,
  `estado_reporte` enum('pendiente','revisado') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id_favorito` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_productos`
--

CREATE TABLE `imagenes_productos` (
  `id_imagen` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `url_imagen` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `imagenes_productos`
--

INSERT INTO `imagenes_productos` (`id_imagen`, `id_producto`, `url_imagen`) VALUES
(1, 1, '1773945724_31736034-shirt-children-s-wear-boy-on-background.jpg'),
(2, 2, '1773946195_images.jpg'),
(3, 3, '1773946638_14782220-children-s-t-shirt-isolated-on-white-background-clipping-paths-included.jpg'),
(4, 4, '1773946909_ec83daa5f8ce064436707cc4a1d5023f.jpg'),
(5, 5, '1777605490_31736034-shirt-children-s-wear-boy-on-background.jpg'),
(6, 6, '1780547154_WhatsApp Image 2026-06-03 at 4.46.06 PM.jpeg'),
(7, 7, '1780547344_WhatsApp Image 2026-06-03 at 4.46.06 PM (1).jpeg'),
(8, 8, '1780547394_WhatsApp Image 2026-06-03 at 4.46.07 PM.jpeg'),
(9, 9, '1780547449_WhatsApp Image 2026-06-03 at 4.46.07 PM (1).jpeg'),
(10, 10, '1780547566_WhatsApp Image 2026-06-03 at 4.46.08 PM.jpeg'),
(11, 11, '1780547642_WhatsApp Image 2026-06-03 at 4.46.08 PM (1).jpeg'),
(12, 12, '1780547968_WhatsApp Image 2026-06-03 at 4.46.09 PM.jpeg'),
(13, 13, '1780548095_WhatsApp Image 2026-06-03 at 4.46.09 PM (1).jpeg'),
(14, 14, '1780548175_WhatsApp Image 2026-06-03 at 5.04.11 PM.jpeg'),
(15, 15, '1780548286_WhatsApp Image 2026-06-03 at 5.04.10 PM.jpeg'),
(16, 16, '1780548360_WhatsApp Image 2026-06-03 at 4.46.10 PM.jpeg'),
(17, 17, '1780548471_WhatsApp Image 2026-06-03 at 5.04.10 PM (1).jpeg'),
(18, 18, '1780548554_WhatsApp Image 2026-06-03 at 4.46.08 PM (2).jpeg'),
(19, 19, '1780548671_WhatsApp Image 2026-06-03 at 5.04.10 PM (2).jpeg'),
(20, 20, '1780549330_WhatsApp Image 2026-06-04 at 12.00.42 AM.jpeg'),
(21, 21, '1780549397_WhatsApp Image 2026-06-04 at 12.00.42 AM (1).jpeg'),
(22, 22, '1780549457_WhatsApp Image 2026-06-04 at 12.00.42 AM (2).jpeg'),
(23, 23, '1780549539_WhatsApp Image 2026-06-04 at 12.00.42 AM (3).jpeg'),
(24, 24, '1780549605_WhatsApp Image 2026-06-04 at 12.00.43 AM.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocios`
--

CREATE TABLE `negocios` (
  `id_negocios` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_negocio` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `calificacion_promedio` decimal(3,1) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','aprobado','rechazado','suspendido') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `negocios`
--

INSERT INTO `negocios` (`id_negocios`, `id_usuario`, `nombre_negocio`, `descripcion`, `telefono`, `direccion`, `calificacion_promedio`, `fecha_creacion`, `estado`) VALUES
(3, 10, 'cocatou ', 'ropa usada', '123456', 'bogota', 0.0, '2026-02-19 23:36:31', 'aprobado'),
(5, 12, 'cocatou ', 'ropa usada', '32475632', 'bogota', 0.0, '2026-03-19 18:21:43', 'aprobado'),
(6, 16, 'SHOSHI', 'compra ropa de seugnda man', '12345678', 'cali', 0.0, '2026-05-06 18:06:48', 'pendiente'),
(7, 21, 'RoseVintage', 'Venta de ropa usada para damas,caballeros y niñas', '31467832', 'Cali', 0.0, '2026-06-03 22:06:43', 'aprobado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `id_negocios` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `estado_pedido` enum('pendiente','enviado','completado','cancelado') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `id_negocios` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `talla` varchar(20) DEFAULT NULL,
  `estado_producto` enum('disponible','vendido') NOT NULL DEFAULT 'disponible',
  `fecha_publicacion` datetime NOT NULL DEFAULT current_timestamp(),
  `categoria` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `id_negocios`, `nombre`, `descripcion`, `precio`, `talla`, `estado_producto`, `fecha_publicacion`, `categoria`) VALUES
(5, 5, 'camisa girs', 'Camisa gris con bolsillo en el pecho', 50.00, 'L', 'disponible', '2026-04-30 22:18:10', 'hombre'),
(6, 7, 'Camisa azul manga larga', 'Camisa de color azul celeste manga larga de hombre ', 30.00, 'L', 'disponible', '2026-06-03 23:25:54', 'hombre'),
(7, 7, 'Camisa manga corta', 'Camisa de color salmon de manga corta para hombre', 20.00, 'M', 'disponible', '2026-06-03 23:29:04', 'hombre'),
(8, 7, 'Camisa de cuadros', 'Camisa de cuadros para hombre', 10.00, 'L', 'disponible', '2026-06-03 23:29:54', 'hombre'),
(9, 7, 'Saco Blanco', 'Saco blanco de cuello', 15.00, 'L', 'disponible', '2026-06-03 23:30:49', 'hombre'),
(10, 7, 'Top negro', 'Camisa top negra con cierre atras', 17.00, 'S', 'disponible', '2026-06-03 23:32:46', 'mujer'),
(11, 7, 'Vestido verde', 'Vestido verde con maga corta brillante', 20.00, 'S', 'disponible', '2026-06-03 23:34:02', 'mujer'),
(12, 7, 'Camisa de cuadros azules', 'Camisa de cuadros vichy azules mangas abullonadas', 20.00, 'XS', 'disponible', '2026-06-03 23:39:28', 'nina'),
(13, 7, 'Jeans de hombre', 'Pantalon jeans de hombre', 15.00, 'M', 'disponible', '2026-06-03 23:41:35', 'hombre'),
(14, 7, 'Falda elegante', 'Falda negra elegante', 10.00, 'M', 'disponible', '2026-06-03 23:42:55', 'mujer'),
(15, 7, 'Chaqueta de jean', 'Chaqueta de jean corta sin mangas', 10.00, 'S', 'disponible', '2026-06-03 23:44:46', 'nina'),
(16, 7, 'Enterizo de jean', 'Enterizo de jean azul abotonado al frente', 9.98, 'XS', 'disponible', '2026-06-03 23:46:00', 'nina'),
(17, 7, 'Vestido Elegante', 'Vestido sin tirantes blanco con un patrón floral negro y detalles de encaje en el dobladillo.', 25.00, 'S', 'disponible', '2026-06-03 23:47:51', 'mujer'),
(18, 7, 'Camiseta manga corta', 'Esta camisa de manga corta de rayas verticales en tonos azul claro, blanco y café', 15.00, 'L', 'disponible', '2026-06-03 23:49:14', 'hombre'),
(19, 7, 'Sudadera gris con estampado de gato', 'Esta sudadera gris para niña con un estampado de cara de gato con flores rojas y un detalle de volantes en el dobladillo', 15.00, 'XS', 'disponible', '2026-06-03 23:51:11', 'nina'),
(20, 7, 'Chaqueta vaquera', 'Esta chaqueta vaquera azul presenta un clásico con lavado desgastado', 14.98, '16', 'disponible', '2026-06-04 00:02:10', 'nino'),
(21, 7, 'Camisa formal rosa para niño', 'Esta camisa rosa presenta un diseño de rayas y mangas largas', 10.00, '12', 'disponible', '2026-06-04 00:03:17', 'nino'),
(22, 7, 'Camisa blanca con estampado', 'Esta camiseta blanca de cuello redondo presenta un estampado gráfico que dice \"GOOD\" con la marca \"BTS EXCLUSIVE\" debajo.', 10.00, '12', 'disponible', '2026-06-04 00:04:17', 'nino'),
(23, 7, 'Pantalones para emabrazo', 'Estos jeans de maternidad con un panel de vientre completo para brindar comodidad y apoyo durante el embarazo', 20.00, '12', 'disponible', '2026-06-04 00:05:39', 'mujer'),
(24, 7, 'Pantalon para el embarazo', 'Estos jeans de maternidad tienen un panel elástico en la cintura para brindar soporte y comodidad durante el embarazo.', 20.00, '10', 'disponible', '2026-06-04 00:06:45', 'mujer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reseñas_negocios`
--

CREATE TABLE `reseñas_negocios` (
  `id_reseña` int(11) NOT NULL,
  `id_negocio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `tipo_usuario` enum('cliente','negocio','admin') NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` enum('activo','incactivo') NOT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombre`, `email`, `contraseña`, `tipo_usuario`, `fecha_registro`, `estado`, `foto_perfil`) VALUES
(1, 'maria antonia', 'sarahluciacastellanos@gmail.com', '$2y$10$7/6AruOR1FhyY9gHx62qluXsY/t0/i0jTWDqc.3oR7fErVK9teq9y', 'cliente', '2026-02-11 02:15:25', 'activo', NULL),
(2, 'maria antonia', 'sara@gmail.com', '$2y$10$9IabJEQnu/ShRAGiMinJC.KGu3axG2bOgUEcXS7Ix3vpdGdezDUDW', 'cliente', '2026-02-11 02:38:29', 'activo', NULL),
(3, '123', 'anto@gmail.com', '$2y$10$HJEjsOpx2Z/3veEaMKMMVurAUA7IVhOOPwG1KX2/GYJvvVZkgIEku', 'cliente', '2026-02-11 02:39:33', 'activo', NULL),
(4, 'antonini', 'antonini@gmail.com', '$2y$10$/E7I03u5XOd.TyP3r/dlM.3cOfAZs23xUGIC088bGzyMUTH4xpGjy', 'negocio', '2026-02-19 17:41:45', 'activo', NULL),
(5, 'cuenta', 'cuenta@gmail.com', '$2y$10$61q7CbmAULyI3tZ93TYYFuLFvde/GKEC/P4TWLxoNdUNJ6HAofFxi', 'negocio', '2026-02-19 17:59:38', 'activo', NULL),
(6, '333', '333@gmail.com', '$2y$10$1IT7cAtuU8pnASgpuMo8vumoDuLE.Xt9L8huy12VpnO89ckV22dd.', 'negocio', '2026-02-19 18:13:39', 'activo', NULL),
(7, 'antonini', 'lololololol@gmail.com', '$2y$10$heNYnwqYvK3sFZYu/JKyWevqqHLs88vY7wMqvZycU6jXf1IWXtuCK', 'cliente', '2026-02-19 18:25:55', 'activo', NULL),
(8, 'caca', 'caca@gmail.com', '$2y$10$jN5t/wEwUeFkLS62Tt9J4eGfm/EAL/6JfMDFuBNvadASoZNeY8.pa', 'negocio', '2026-02-19 18:26:47', 'activo', NULL),
(9, 'FAK', 'FAK@gmail.com', '$2y$10$8RjrQPn6Bw10LxTaFEFqEOQkwT0.ChEcchROD3TW0kksylNHTb8dC', 'negocio', '2026-02-19 18:33:37', 'activo', NULL),
(10, 'colu', 'colu@gmail.com', '$2y$10$Fo9TN5izW489ElbxEe55NOnGYvixz5GydL1ORuHQc02rpTzxU3b9a', 'negocio', '2026-02-19 18:36:31', 'activo', NULL),
(11, 'cucu', 'cucu@gmail.com', '$2y$10$vlK.3ox3CafBBlaPkHYu7OBidSY/4wI0M9V/QwMEWFz0ULA5gwzea', 'negocio', '2026-02-19 18:40:44', 'activo', NULL),
(12, 'dorian', 'fifi@test.com', '$2y$10$bI4TQ7/ohIfdrzxf3g5eZu9S7lmt/zmw/Sgr6Z5EwNsh2rqlMLbhO', 'negocio', '2026-03-19 13:21:43', 'activo', '../uploads/1773945283_1.jpeg'),
(16, 'Sofia', 'sofia@test.com', '$2y$10$wi10bknHAbQ693MEskFh9OJNbzUkFsEYIQp9DV0tiJ/HDk8fWQ4ue', 'negocio', '2026-05-06 13:06:48', 'activo', NULL),
(17, 'tonini ', 'tonini@test.com', '$2y$10$4jrLFU6Z7tRDH0nRtsDzAulH7K3AcP.AqEGqqhzfalUrisDJ1.s2O', 'cliente', '2026-05-06 17:10:50', 'activo', NULL),
(15, 'Maria Antonia', 'mariaantoniacastellanosgomez@gmail.com', '$2y$10$kevg8pmN92TMknEr5ffUKuWgucWRwqNsqFiGJhByHWsnOhJhotOOG', 'admin', '2026-04-29 19:18:56', 'activo', NULL),
(18, 'dorian', 'dorian@test.com', '$2y$10$sWvmOapTZ0HjYiD./DbVF.NK.grCm0ksedD2jkVWSai4Hj6upr1i2', 'cliente', '2026-05-24 20:42:25', 'activo', NULL),
(19, 'cocacola', 'cocacola@fifi.com', '$2y$10$.rkUyfErnAdaWRtHoqBxUODmsiFgvnXjEM7VH0NeyrdkDK0GpvFSq', 'cliente', '2026-05-25 18:25:22', 'activo', NULL),
(20, 'ANTONINI', 'oliwis@test.com', '$2y$10$TVDW6ERDGtJf48mHS56N7ee3foSwGVJb2/VZ1tEaMU2lScvKebrta', 'cliente', '2026-05-26 01:49:57', 'activo', NULL),
(21, 'Dora Lid Aguiar', 'doraaguiar@negocio.com', '$2y$10$gClI73cbqsJ0k//Vd9vtO.dVMrtaIof44kSf9Ohe88tlyEqvCL3PC', 'negocio', '2026-06-03 17:06:43', 'activo', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`);

--
-- Indices de la tabla `comentarios_reacciones`
--
ALTER TABLE `comentarios_reacciones`
  ADD PRIMARY KEY (`id_reaccion`);

--
-- Indices de la tabla `comentarios_reportes`
--
ALTER TABLE `comentarios_reportes`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id_favorito`),
  ADD KEY `id_usuario` (`id_usuarios`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `imagenes_productos`
--
ALTER TABLE `imagenes_productos`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `negocios`
--
ALTER TABLE `negocios`
  ADD PRIMARY KEY (`id_negocios`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `reseñas_negocios`
--
ALTER TABLE `reseñas_negocios`
  ADD PRIMARY KEY (`id_reseña`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comentarios_reacciones`
--
ALTER TABLE `comentarios_reacciones`
  MODIFY `id_reaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios_reportes`
--
ALTER TABLE `comentarios_reportes`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id_favorito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `imagenes_productos`
--
ALTER TABLE `imagenes_productos`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `negocios`
--
ALTER TABLE `negocios`
  MODIFY `id_negocios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `reseñas_negocios`
--
ALTER TABLE `reseñas_negocios`
  MODIFY `id_reseña` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
