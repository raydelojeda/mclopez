-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2014 a las 17:59:07
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ateneo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activo`
--

CREATE TABLE IF NOT EXISTS `activo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `codigo_barras` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `custodio` varchar(255) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin NOT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `fecha_depreciacion` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `identificacion_proveedor` varchar(20) COLLATE utf8_bin NOT NULL,
  `marca` varchar(255) COLLATE utf8_bin NOT NULL,
  `metrologia` varchar(20) COLLATE utf8_bin NOT NULL,
  `modelo` varchar(255) COLLATE utf8_bin NOT NULL,
  `motivo_baja` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `numero_serie` varchar(255) COLLATE utf8_bin NOT NULL,
  `observaciones_baja` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `proveedor` varchar(255) COLLATE utf8_bin NOT NULL,
  `subgrupo_id` bigint(20) NOT NULL,
  `tipo_depreciacion_id` bigint(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `cargo_custodio` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cargo_usuario` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `localizacion` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nick_usuario` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nombre_usuario` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FKAB2F7F10AF0C7F9E` (`subgrupo_id`) USING BTREE,
  KEY `FKAB2F7F106CF361C7` (`tipo_depreciacion_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admision`
--

CREATE TABLE IF NOT EXISTS `admision` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_admision` datetime NOT NULL,
  `numero_folio` int(11) DEFAULT NULL,
  `numero_matricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=5461 AUTO_INCREMENT=739 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_rubro_beca`
--

CREATE TABLE IF NOT EXISTS `asignacion_rubro_beca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beca_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `rubro_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK65DB401BAFE9C73D` (`rubro_id`) USING BTREE,
  KEY `FK65DB401BE541E200` (`estudiante_id`) USING BTREE,
  KEY `FK65DB401BA43C26B7` (`beca_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE IF NOT EXISTS `banco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE IF NOT EXISTS `barrio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `parroquia_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FKACC76025BC2AC4C3` (`parroquia_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beca`
--

CREATE TABLE IF NOT EXISTS `beca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `rubro_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK2E13E1AFE9C73D` (`rubro_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beca_por_ciento`
--

CREATE TABLE IF NOT EXISTS `beca_por_ciento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beca_id` bigint(20) NOT NULL,
  `periodo_academico_id` bigint(20) NOT NULL,
  `porciento` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKA6C350D4F749D463` (`periodo_academico_id`) USING BTREE,
  KEY `FKA6C350D4A43C26B7` (`beca_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=468 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclo`
--

CREATE TABLE IF NOT EXISTS `ciclo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `provincia_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FKAEEE1C58349D8FE3` (`provincia_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=682 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegio`
--

CREATE TABLE IF NOT EXISTS `colegio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comentador_id` bigint(20) NOT NULL,
  `contenido` longtext COLLATE utf8_bin NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK9E0DE7E1F5A29C30` (`comentador_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comportamiento`
--

CREATE TABLE IF NOT EXISTS `comportamiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grupo_clase_id` bigint(20) NOT NULL,
  `observaciones` longtext COLLATE utf8_bin NOT NULL,
  `tipo_comportamiento_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKFDD4205F9DAFDA0C` (`tipo_comportamiento_id`) USING BTREE,
  KEY `FKFDD4205F83AA832D` (`grupo_clase_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comportamiento_estudiante`
--

CREATE TABLE IF NOT EXISTS `comportamiento_estudiante` (
  `comportamiento_estudiantes_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  KEY `FK11B581B2E541E200` (`estudiante_id`) USING BTREE,
  KEY `FK11B581B2E0F317FE` (`comportamiento_estudiantes_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conducta`
--

CREATE TABLE IF NOT EXISTS `conducta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `evaluador_id` bigint(20) NOT NULL,
  `observaciones` longtext COLLATE utf8_bin NOT NULL,
  `paralelo_id` bigint(20) NOT NULL,
  `tipo_comportamiento_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKDD54FF9DDB7FF70D` (`evaluador_id`) USING BTREE,
  KEY `FKDD54FF9D9DAFDA0C` (`tipo_comportamiento_id`) USING BTREE,
  KEY `FKDD54FF9D21E65823` (`paralelo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conducta_estudiante`
--

CREATE TABLE IF NOT EXISTS `conducta_estudiante` (
  `conducta_estudiantes_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  KEY `FK1E494FB44C05D0BE` (`conducta_estudiantes_id`) USING BTREE,
  KEY `FK1E494FB4E541E200` (`estudiante_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_academico`
--

CREATE TABLE IF NOT EXISTS `configuracion_academico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `intervalo_minimo_tarea` int(11) DEFAULT NULL,
  `periodo_academico_activo_id` bigint(20) DEFAULT NULL,
  `parcial_activo_id` bigint(20) DEFAULT NULL,
  `quimestre_activo_id` bigint(20) DEFAULT NULL,
  `hora_limite_tarea` time DEFAULT NULL,
  `porcentaje_evaluacion_final_quimestral` float DEFAULT NULL,
  `tipo_control_evaluacion_final_quimestral_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKC162B4B0C9BBC0A2` (`periodo_academico_activo_id`) USING BTREE,
  KEY `FKC162B4B0EB9FE06` (`parcial_activo_id`) USING BTREE,
  KEY `FKC162B4B07161CD04` (`quimestre_activo_id`) USING BTREE,
  KEY `FKC162B4B0258046D` (`tipo_control_evaluacion_final_quimestral_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_admisiones`
--

CREATE TABLE IF NOT EXISTS `configuracion_admisiones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado_estudiante_inicial_id` bigint(20) DEFAULT NULL,
  `estado_estudiante_matriculado_id` bigint(20) DEFAULT NULL,
  `estado_estudiante_promovido_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKFDF3F07A261BB5C6` (`estado_estudiante_matriculado_id`) USING BTREE,
  KEY `FKFDF3F07AE980EDDA` (`estado_estudiante_inicial_id`) USING BTREE,
  KEY `FKFDF3F07A9C8962C2` (`estado_estudiante_promovido_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_pensiones`
--

CREATE TABLE IF NOT EXISTS `configuracion_pensiones` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero_factura` bigint(20) NOT NULL,
  `numero_recibo` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_recursos_humanos`
--

CREATE TABLE IF NOT EXISTS `configuracion_recursos_humanos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cargo_docente_id` bigint(20) DEFAULT NULL,
  `cargo_inspector_id` bigint(20) DEFAULT NULL,
  `cargo_psicologo_id` bigint(20) DEFAULT NULL,
  `cargo_tutor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK3A6E7414409C54` (`cargo_psicologo_id`) USING BTREE,
  KEY `FK3A6E7495A7365B` (`cargo_tutor_id`) USING BTREE,
  KEY `FK3A6E74265C257A` (`cargo_inspector_id`) USING BTREE,
  KEY `FK3A6E7478D4953F` (`cargo_docente_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_servicios_tecnicos`
--

CREATE TABLE IF NOT EXISTS `configuracion_servicios_tecnicos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_notificaciones` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `estado_solicitud_inicial_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKAA4175542541E77F` (`estado_solicitud_inicial_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control`
--

CREATE TABLE IF NOT EXISTS `control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grupo_clase_id` bigint(20) NOT NULL,
  `observaciones` longtext COLLATE utf8_bin NOT NULL,
  `tipo_control_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK38B7655D78AAE428` (`tipo_control_id`) USING BTREE,
  KEY `FK38B7655D83AA832D` (`grupo_clase_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_estudiante`
--

CREATE TABLE IF NOT EXISTS `control_estudiante` (
  `control_estudiantes_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  KEY `FKD21D1F4B09C99F2` (`control_estudiantes_id`) USING BTREE,
  KEY `FKD21D1F4E541E200` (`estudiante_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conversion_evaluacion`
--

CREATE TABLE IF NOT EXISTS `conversion_evaluacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `nota_cualitativa` varchar(2) COLLATE utf8_bin NOT NULL,
  `nota_cuantitativa` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_bancaria`
--

CREATE TABLE IF NOT EXISTS `cuenta_bancaria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `banco_id` bigint(20) NOT NULL,
  `numero_cuenta` varchar(255) COLLATE utf8_bin NOT NULL,
  `tipo_cuenta_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKFFDD875424FDC40C` (`tipo_cuenta_id`) USING BTREE,
  KEY `FKFFDD8754702AB7F1` (`banco_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=2048 AUTO_INCREMENT=599 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `seccion_academica_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK5AA009CAF7F3F76` (`seccion_academica_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1638 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `id` bigint(20) NOT NULL,
  `cargo_id` bigint(20) DEFAULT NULL,
  `codigo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `costo_hora` float DEFAULT NULL,
  `cuenta_bancaria_id` bigint(20) DEFAULT NULL,
  `fecha_baja` datetime DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `grupo_gastos_id` bigint(20) DEFAULT NULL,
  `motivo_baja_id` bigint(20) DEFAULT NULL,
  `observaciones_baja` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `seccion_id` bigint(20) DEFAULT NULL,
  `sistema_salario_id` bigint(20) DEFAULT NULL,
  `sueldo_normal` float DEFAULT NULL,
  `tipo_contrato_id` bigint(20) DEFAULT NULL,
  `titulo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK471E00CB10AC2F85` (`grupo_gastos_id`) USING BTREE,
  KEY `FK471E00CB8DF4F762` (`titulo_id`) USING BTREE,
  KEY `FK471E00CB7C8CFB9D` (`sistema_salario_id`) USING BTREE,
  KEY `FK471E00CB6B97154` (`cuenta_bancaria_id`) USING BTREE,
  KEY `FK471E00CB2F00094B` (`tipo_contrato_id`) USING BTREE,
  KEY `FK471E00CB8B1392F2` (`cargo_id`) USING BTREE,
  KEY `FK471E00CBB615EB2` (`seccion_id`) USING BTREE,
  KEY `FK471E00CBAA443A43` (`motivo_baja_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE IF NOT EXISTS `estado_civil` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_estudiante`
--

CREATE TABLE IF NOT EXISTS `estado_estudiante` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_factura`
--

CREATE TABLE IF NOT EXISTS `estado_factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_recibo`
--

CREATE TABLE IF NOT EXISTS `estado_recibo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_solicitud`
--

CREATE TABLE IF NOT EXISTS `estado_solicitud` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estructura_familiar`
--

CREATE TABLE IF NOT EXISTS `estructura_familiar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1820 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `id` bigint(20) NOT NULL,
  `admision_id` bigint(20) DEFAULT NULL,
  `codigo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `estado_id` bigint(20) DEFAULT NULL,
  `estructura_familiar_id` bigint(20) DEFAULT NULL,
  `madre_id` bigint(20) DEFAULT NULL,
  `nombre_emergencia` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nucleo_familiar_id` bigint(20) DEFAULT NULL,
  `padre_id` bigint(20) DEFAULT NULL,
  `paralelo_id` bigint(20) DEFAULT NULL,
  `parentesco_emergencia_id` bigint(20) DEFAULT NULL,
  `procedencia_id` bigint(20) DEFAULT NULL,
  `representacion_academica_id` bigint(20) DEFAULT NULL,
  `representacion_economica_id` bigint(20) DEFAULT NULL,
  `representacion_facturacion_id` bigint(20) DEFAULT NULL,
  `telefono_emergencia` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FKEB92EDD2E46672DB` (`nucleo_familiar_id`) USING BTREE,
  KEY `FKEB92EDD2434E7555` (`estado_id`) USING BTREE,
  KEY `FKEB92EDD249B13B12` (`estructura_familiar_id`) USING BTREE,
  KEY `FKEB92EDD2BBE67462` (`procedencia_id`) USING BTREE,
  KEY `FKEB92EDD27D5CBB4E` (`padre_id`) USING BTREE,
  KEY `FKEB92EDD2AB25916E` (`representacion_facturacion_id`) USING BTREE,
  KEY `FKEB92EDD2A5F93891` (`representacion_academica_id`) USING BTREE,
  KEY `FKEB92EDD245B934B1` (`madre_id`) USING BTREE,
  KEY `FKEB92EDD248BD75E6` (`admision_id`) USING BTREE,
  KEY `FKEB92EDD241826F51` (`representacion_economica_id`) USING BTREE,
  KEY `FKEB92EDD2242C2406` (`parentesco_emergencia_id`) USING BTREE,
  KEY `FKEB92EDD221E65823` (`paralelo_id`) USING BTREE,
  KEY `FKEB92EDD2ECF4ABF1` (`representacion_facturacion_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_representacion_academica`
--

CREATE TABLE IF NOT EXISTS `estudiante_representacion_academica` (
  `estudiante_representaciones_academicas_id` bigint(20) DEFAULT NULL,
  `representacion_academica_id` bigint(20) DEFAULT NULL,
  KEY `FKE966D8618BB17B3` (`estudiante_representaciones_academicas_id`) USING BTREE,
  KEY `FKE966D86A5F93891` (`representacion_academica_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `estudiante_id` bigint(20) NOT NULL,
  `nota` float DEFAULT NULL,
  `parcial_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK33244CEDE541E200` (`estudiante_id`) USING BTREE,
  KEY `FK33244CED2BBFAF71` (`parcial_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=159 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_comportamiento`
--

CREATE TABLE IF NOT EXISTS `evaluacion_comportamiento` (
  `id` bigint(20) NOT NULL,
  `comportamiento_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK188529F1DE4887E0` (`comportamiento_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_conducta`
--

CREATE TABLE IF NOT EXISTS `evaluacion_conducta` (
  `id` bigint(20) NOT NULL,
  `conducta_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKEDA91EAFBD3D33A0` (`conducta_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_control`
--

CREATE TABLE IF NOT EXISTS `evaluacion_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `control_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK28BA1C0BB3255CD4` (`control_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=146 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_tarea`
--

CREATE TABLE IF NOT EXISTS `evaluacion_tarea` (
  `id` bigint(20) NOT NULL,
  `tarea_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK438D012FAC4210D4` (`tarea_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `abonos` float NOT NULL,
  `costo_total` float NOT NULL,
  `estado_factura_id` bigint(20) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `numero_factura` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `numero_factura` (`numero_factura`) USING BTREE,
  KEY `FKBEEB4778E50BB2F0` (`estado_factura_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_otras_ventas`
--

CREATE TABLE IF NOT EXISTS `factura_otras_ventas` (
  `id` bigint(20) NOT NULL,
  `apellidos` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `identificacion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nombres` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `tipo_identificacion_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKDB762D2E3B19AEAC` (`tipo_identificacion_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_pension`
--

CREATE TABLE IF NOT EXISTS `factura_pension` (
  `id` bigint(20) NOT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  `mes_periodo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK82AF5187F5A15E55` (`mes_periodo_id`) USING BTREE,
  KEY `FK82AF5187E541E200` (`estudiante_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_rubro_valor`
--

CREATE TABLE IF NOT EXISTS `factura_rubro_valor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beca_porciento_id` bigint(20) DEFAULT NULL,
  `cantidad` smallint(6) NOT NULL,
  `factura_id` bigint(20) NOT NULL,
  `grabaiva` bit(1) NOT NULL,
  `rubro_valor_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK460D9D7A4294D765` (`beca_porciento_id`) USING BTREE,
  KEY `FK460D9D7A9118E453` (`rubro_valor_id`) USING BTREE,
  KEY `FK460D9D7ABDD4D728` (`factura_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_servicios`
--

CREATE TABLE IF NOT EXISTS `factura_servicios` (
  `id` bigint(20) NOT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK29A05656E541E200` (`estudiante_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE IF NOT EXISTS `familia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE IF NOT EXISTS `forma_pago` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=8192 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `familia_id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK5E10C69C2959F96` (`familia_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=682 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_clase`
--

CREATE TABLE IF NOT EXISTS `grupo_clase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `docente_id` bigint(20) NOT NULL,
  `materia_id` bigint(20) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK7E18661461BDBC3A` (`docente_id`) USING BTREE,
  KEY `FK7E186614F9A40E91` (`materia_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_clase_estudiante`
--

CREATE TABLE IF NOT EXISTS `grupo_clase_estudiante` (
  `grupo_clase_estudiantes_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  KEY `FKD11E08DDE541E200` (`estudiante_id`) USING BTREE,
  KEY `FKD11E08DD39942ACB` (`grupo_clase_estudiantes_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_gastos`
--

CREATE TABLE IF NOT EXISTS `grupo_gastos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1024 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `iva`
--

CREATE TABLE IF NOT EXISTS `iva` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_fin` datetime DEFAULT NULL,
  `fecha_inicio` datetime NOT NULL,
  `porciento` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `elemento` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `evento` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_elemento` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nuevo_valor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `propiedad` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ultima_modificacion` datetime NOT NULL,
  `uri` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `usuario` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `valor_anterior` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=431 AUTO_INCREMENT=16683 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activa` bit(1) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=8192 AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mes`
--

CREATE TABLE IF NOT EXISTS `mes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1365 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mes_periodo`
--

CREATE TABLE IF NOT EXISTS `mes_periodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mes_id` bigint(20) NOT NULL,
  `periodo_academico_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKC532846AC3333DB1` (`mes_id`) USING BTREE,
  KEY `FKC532846AF749D463` (`periodo_academico_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1365 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mes_periodo_rubro`
--

CREATE TABLE IF NOT EXISTS `mes_periodo_rubro` (
  `mes_periodo_rubros_id` bigint(20) DEFAULT NULL,
  `rubro_id` bigint(20) DEFAULT NULL,
  KEY `FKDE2D94E7AFE9C73D` (`rubro_id`) USING BTREE,
  KEY `FKDE2D94E716114313` (`mes_periodo_rubros_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_baja`
--

CREATE TABLE IF NOT EXISTS `motivo_baja` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_educacion`
--

CREATE TABLE IF NOT EXISTS `nivel_educacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nucleo_familiar`
--

CREATE TABLE IF NOT EXISTS `nucleo_familiar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apellidos_jefe` varchar(255) COLLATE utf8_bin NOT NULL,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `direccion` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nombres_jefe` varchar(255) COLLATE utf8_bin NOT NULL,
  `telefono_celular` varchar(255) COLLATE utf8_bin NOT NULL,
  `telefono_domicilio` varchar(255) COLLATE utf8_bin NOT NULL,
  `telefono_trabajo` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=5461 AUTO_INCREMENT=614 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nacionalidad` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=5461 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paralelo`
--

CREATE TABLE IF NOT EXISTS `paralelo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `periodo_academico_id` bigint(20) NOT NULL,
  `psicologo_id` bigint(20) DEFAULT NULL,
  `tutor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK45D2149CE9B5A096` (`tutor_id`) USING BTREE,
  KEY `FK45D2149C503890F1` (`curso_id`) USING BTREE,
  KEY `FK45D2149CC648500F` (`psicologo_id`) USING BTREE,
  KEY `FK45D2149CF749D463` (`periodo_academico_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1092 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcial`
--

CREATE TABLE IF NOT EXISTS `parcial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `quimestre_id` bigint(20) NOT NULL,
  `fecha_limite_evaluacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FKD0B50F3226390151` (`quimestre_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parentesco`
--

CREATE TABLE IF NOT EXISTS `parentesco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=2340 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parroquia`
--

CREATE TABLE IF NOT EXISTS `parroquia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad_id` bigint(20) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK91A2BDDAB58B4611` (`ciudad_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=606 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_academico`
--

CREATE TABLE IF NOT EXISTS `periodo_academico` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `barrio_direccion_id` bigint(20) DEFAULT NULL,
  `calle_direccion` varchar(255) COLLATE utf8_bin NOT NULL,
  `cantidad_hijos` int(11) NOT NULL,
  `ciudad_direccion_id` bigint(20) DEFAULT NULL,
  `ciudad_nacimiento_id` bigint(20) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `estado_civil_id` bigint(20) NOT NULL,
  `fallecido` bit(1) NOT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `foto` mediumblob,
  `genero_id` bigint(20) NOT NULL,
  `identificacion` varchar(20) COLLATE utf8_bin NOT NULL,
  `numero_direccion` varchar(20) COLLATE utf8_bin NOT NULL,
  `pais_direccion_id` bigint(20) DEFAULT NULL,
  `pais_nacimiento_id` bigint(20) DEFAULT NULL,
  `pais_nacionalidad_id` bigint(20) DEFAULT NULL,
  `parroquia_direccion_id` bigint(20) DEFAULT NULL,
  `primer_apellido` varchar(50) COLLATE utf8_bin NOT NULL,
  `primer_nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `provincia_direccion_id` bigint(20) DEFAULT NULL,
  `provincia_nacimiento_id` bigint(20) DEFAULT NULL,
  `segundo_apellido` varchar(50) COLLATE utf8_bin NOT NULL,
  `segundo_nombre` varchar(50) COLLATE utf8_bin NOT NULL,
  `telefono_celular` varchar(255) COLLATE utf8_bin NOT NULL,
  `telefono_domicilio` varchar(255) COLLATE utf8_bin NOT NULL,
  `tipo_identificacion_id` bigint(20) NOT NULL,
  `tipo_sangre_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKD78FCFAC3B8C3960` (`pais_direccion_id`) USING BTREE,
  KEY `FKD78FCFACC8FBD7E5` (`provincia_nacimiento_id`) USING BTREE,
  KEY `FKD78FCFAC5B4CD0A4` (`estado_civil_id`) USING BTREE,
  KEY `FKD78FCFAC1BE98C09` (`ciudad_nacimiento_id`) USING BTREE,
  KEY `FKD78FCFAC3B19AEAC` (`tipo_identificacion_id`) USING BTREE,
  KEY `FKD78FCFACE5336BF2` (`parroquia_direccion_id`) USING BTREE,
  KEY `FKD78FCFAC44F07C87` (`pais_nacionalidad_id`) USING BTREE,
  KEY `FKD78FCFAC8FF4B3FD` (`usuario_id`) USING BTREE,
  KEY `FKD78FCFAC889162C0` (`ciudad_direccion_id`) USING BTREE,
  KEY `FKD78FCFAC35F0AECC` (`tipo_sangre_id`) USING BTREE,
  KEY `FKD78FCFAC1F33BAD2` (`provincia_direccion_id`) USING BTREE,
  KEY `FKD78FCFACBDE5E18F` (`pais_nacimiento_id`) USING BTREE,
  KEY `FKD78FCFAC7B90B7E0` (`barrio_direccion_id`) USING BTREE,
  KEY `FKD78FCFAC2662DF43` (`genero_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=267150 AUTO_INCREMENT=2158 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE IF NOT EXISTS `provincia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `pais_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FKDF613BADBF73FCF1` (`pais_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=682 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quimestre`
--

CREATE TABLE IF NOT EXISTS `quimestre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `periodo_academico_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK5E5258F1F749D463` (`periodo_academico_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo_cobro`
--

CREATE TABLE IF NOT EXISTS `recibo_cobro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cuenta_bancaria_id` bigint(20) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin NOT NULL,
  `estado_recibo_id` bigint(20) NOT NULL,
  `factura_id` bigint(20) NOT NULL,
  `fecha_recibo` datetime NOT NULL,
  `forma_pago_id` bigint(20) NOT NULL,
  `numero_recibo` bigint(20) NOT NULL,
  `referencia` varchar(255) COLLATE utf8_bin NOT NULL,
  `valor_recibo` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKCF98BC9A3EC63C38` (`forma_pago_id`) USING BTREE,
  KEY `FKCF98BC9A6B97154` (`cuenta_bancaria_id`) USING BTREE,
  KEY `FKCF98BC9ACC89AD04` (`estado_recibo_id`) USING BTREE,
  KEY `FKCF98BC9ABDD4D728` (`factura_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representacion_academica`
--

CREATE TABLE IF NOT EXISTS `representacion_academica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentesco_id` bigint(20) NOT NULL,
  `representante_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKD7F89E7E1E28C6CE` (`representante_id`) USING BTREE,
  KEY `FKD7F89E7ECF7F5AFD` (`parentesco_id`) USING BTREE,
  KEY `FK6DC1F7B91E28C6CE` (`representante_id`) USING BTREE,
  KEY `FK6DC1F7B9CF7F5AFD` (`parentesco_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=2340 AUTO_INCREMENT=623 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representacion_economica`
--

CREATE TABLE IF NOT EXISTS `representacion_economica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cuenta_bancaria_id` bigint(20) NOT NULL,
  `titular` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKB508528B6B97154` (`cuenta_bancaria_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=591 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representacion_facturacion`
--

CREATE TABLE IF NOT EXISTS `representacion_facturacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8_bin NOT NULL,
  `identificacion` varchar(20) COLLATE utf8_bin NOT NULL,
  `titular` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=596 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representante`
--

CREATE TABLE IF NOT EXISTS `representante` (
  `id` bigint(20) NOT NULL,
  `cargo` varchar(255) COLLATE utf8_bin NOT NULL,
  `cuenta_bancaria_id` bigint(20) DEFAULT NULL,
  `direccion_laboral` varchar(255) COLLATE utf8_bin NOT NULL,
  `empresa` varchar(255) COLLATE utf8_bin NOT NULL,
  `extension_telefono_laboral` varchar(255) COLLATE utf8_bin NOT NULL,
  `nivel_educacion_id` bigint(20) NOT NULL,
  `sueldo` float DEFAULT NULL,
  `telefono_laboral` varchar(255) COLLATE utf8_bin NOT NULL,
  `titulo_id` bigint(20) DEFAULT NULL,
  `ex_estudiante` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKF6738A868DF4F762` (`titulo_id`) USING BTREE,
  KEY `FKF6738A866B97154` (`cuenta_bancaria_id`) USING BTREE,
  KEY `FKF6738A8616209498` (`nivel_educacion_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) COLLATE utf8_bin NOT NULL,
  `descripcion` longtext COLLATE utf8_bin,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nombre_rol` (`nombre_rol`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=1820 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

CREATE TABLE IF NOT EXISTS `rubro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro_valor`
--

CREATE TABLE IF NOT EXISTS `rubro_valor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `periodo_academico_id` bigint(20) NOT NULL,
  `rubro_id` bigint(20) NOT NULL,
  `valor` float NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK907D6BC1AFE9C73D` (`rubro_id`) USING BTREE,
  KEY `FK907D6BC1F749D463` (`periodo_academico_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=5461 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_academica`
--

CREATE TABLE IF NOT EXISTS `seccion_academica` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciclo_id` bigint(20) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `nota_insuficiencia` float NOT NULL,
  `numero_matricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK346A5FD1BB6CC671` (`ciclo_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistema_salario`
--

CREATE TABLE IF NOT EXISTS `sistema_salario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=8192 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE IF NOT EXISTS `solicitud` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` longtext COLLATE utf8_bin NOT NULL,
  `empleado_id` bigint(20) NOT NULL,
  `estado_solicitud_id` bigint(20) NOT NULL,
  `fecha_solicitud` datetime NOT NULL,
  `tipo_solicitud_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKAF52BEA4DAB052E1` (`empleado_id`) USING BTREE,
  KEY `FKAF52BEA4442B33F5` (`estado_solicitud_id`) USING BTREE,
  KEY `FKAF52BEA4CD11B8D9` (`tipo_solicitud_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subgrupo`
--

CREATE TABLE IF NOT EXISTS `subgrupo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE,
  KEY `FK847C36291393116` (`grupo_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=148 AUTO_INCREMENT=111 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE IF NOT EXISTS `tarea` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adjunto` mediumblob,
  `descripcion` longtext COLLATE utf8_bin NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `fecha_presentacion` datetime NOT NULL,
  `grupo_clase_id` bigint(20) NOT NULL,
  `refuerzo` bit(1) NOT NULL,
  `titulo` varchar(255) COLLATE utf8_bin NOT NULL,
  `nombre_adjunto` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK690770183AA832D` (`grupo_clase_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_comentario`
--

CREATE TABLE IF NOT EXISTS `tarea_comentario` (
  `tarea_comentarios_id` bigint(20) DEFAULT NULL,
  `comentario_id` bigint(20) DEFAULT NULL,
  KEY `FKB9ED0BDF69A3BE81` (`tarea_comentarios_id`) USING BTREE,
  KEY `FKB9ED0BDF8CAE73A0` (`comentario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_estudiante`
--

CREATE TABLE IF NOT EXISTS `tarea_estudiante` (
  `tarea_estudiantes_id` bigint(20) DEFAULT NULL,
  `estudiante_id` bigint(20) DEFAULT NULL,
  KEY `FK77211D0C06263F2` (`tarea_estudiantes_id`) USING BTREE,
  KEY `FK77211D0E541E200` (`estudiante_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comportamiento`
--

CREATE TABLE IF NOT EXISTS `tipo_comportamiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE IF NOT EXISTS `tipo_contrato` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=3276 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_control`
--

CREATE TABLE IF NOT EXISTS `tipo_control` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cuenta`
--

CREATE TABLE IF NOT EXISTS `tipo_cuenta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=8192 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_depreciacion`
--

CREATE TABLE IF NOT EXISTS `tipo_depreciacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=16384 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificacion`
--

CREATE TABLE IF NOT EXISTS `tipo_identificacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sangre`
--

CREATE TABLE IF NOT EXISTS `tipo_sangre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=2048 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solicitud`
--

CREATE TABLE IF NOT EXISTS `tipo_solicitud` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo`
--

CREATE TABLE IF NOT EXISTS `titulo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `codigo` (`codigo`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096 AUTO_INCREMENT=203 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contrasenna` varchar(255) COLLATE utf8_bin NOT NULL,
  `contrasenna_expirada` bit(1) NOT NULL,
  `cuenta_bloqueda` bit(1) NOT NULL,
  `cuenta_expirada` bit(1) NOT NULL,
  `habilitado` bit(1) NOT NULL,
  `nick` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nick` (`nick`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=218 AUTO_INCREMENT=79 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `rol_id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  PRIMARY KEY (`rol_id`,`usuario_id`) USING BTREE,
  KEY `FK3118953E27F31DDD` (`rol_id`) USING BTREE,
  KEY `FK3118953E8FF4B3FD` (`usuario_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AVG_ROW_LENGTH=4096;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activo`
--
ALTER TABLE `activo`
  ADD CONSTRAINT `FKAB2F7F106CF361C7` FOREIGN KEY (`tipo_depreciacion_id`) REFERENCES `tipo_depreciacion` (`id`),
  ADD CONSTRAINT `FKAB2F7F10AF0C7F9E` FOREIGN KEY (`subgrupo_id`) REFERENCES `subgrupo` (`id`);

--
-- Filtros para la tabla `asignacion_rubro_beca`
--
ALTER TABLE `asignacion_rubro_beca`
  ADD CONSTRAINT `FK65DB401BA43C26B7` FOREIGN KEY (`beca_id`) REFERENCES `beca` (`id`),
  ADD CONSTRAINT `FK65DB401BAFE9C73D` FOREIGN KEY (`rubro_id`) REFERENCES `rubro` (`id`),
  ADD CONSTRAINT `FK65DB401BE541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD CONSTRAINT `FKACC76025BC2AC4C3` FOREIGN KEY (`parroquia_id`) REFERENCES `parroquia` (`id`);

--
-- Filtros para la tabla `beca`
--
ALTER TABLE `beca`
  ADD CONSTRAINT `FK2E13E1AFE9C73D` FOREIGN KEY (`rubro_id`) REFERENCES `rubro` (`id`);

--
-- Filtros para la tabla `beca_por_ciento`
--
ALTER TABLE `beca_por_ciento`
  ADD CONSTRAINT `FKA6C350D4A43C26B7` FOREIGN KEY (`beca_id`) REFERENCES `beca` (`id`),
  ADD CONSTRAINT `FKA6C350D4F749D463` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodo_academico` (`id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `FKAEEE1C58349D8FE3` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK9E0DE7E1F5A29C30` FOREIGN KEY (`comentador_id`) REFERENCES `persona` (`id`);

--
-- Filtros para la tabla `comportamiento`
--
ALTER TABLE `comportamiento`
  ADD CONSTRAINT `FKFDD4205F83AA832D` FOREIGN KEY (`grupo_clase_id`) REFERENCES `grupo_clase` (`id`),
  ADD CONSTRAINT `FKFDD4205F9DAFDA0C` FOREIGN KEY (`tipo_comportamiento_id`) REFERENCES `tipo_comportamiento` (`id`);

--
-- Filtros para la tabla `comportamiento_estudiante`
--
ALTER TABLE `comportamiento_estudiante`
  ADD CONSTRAINT `FK11B581B2E0F317FE` FOREIGN KEY (`comportamiento_estudiantes_id`) REFERENCES `comportamiento` (`id`),
  ADD CONSTRAINT `FK11B581B2E541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `conducta`
--
ALTER TABLE `conducta`
  ADD CONSTRAINT `FKDD54FF9D21E65823` FOREIGN KEY (`paralelo_id`) REFERENCES `paralelo` (`id`),
  ADD CONSTRAINT `FKDD54FF9D9DAFDA0C` FOREIGN KEY (`tipo_comportamiento_id`) REFERENCES `tipo_comportamiento` (`id`),
  ADD CONSTRAINT `FKDD54FF9DDB7FF70D` FOREIGN KEY (`evaluador_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `conducta_estudiante`
--
ALTER TABLE `conducta_estudiante`
  ADD CONSTRAINT `FK1E494FB44C05D0BE` FOREIGN KEY (`conducta_estudiantes_id`) REFERENCES `conducta` (`id`),
  ADD CONSTRAINT `FK1E494FB4E541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `configuracion_academico`
--
ALTER TABLE `configuracion_academico`
  ADD CONSTRAINT `FKC162B4B0258046D` FOREIGN KEY (`tipo_control_evaluacion_final_quimestral_id`) REFERENCES `tipo_control` (`id`),
  ADD CONSTRAINT `FKC162B4B07161CD04` FOREIGN KEY (`quimestre_activo_id`) REFERENCES `quimestre` (`id`),
  ADD CONSTRAINT `FKC162B4B0C9BBC0A2` FOREIGN KEY (`periodo_academico_activo_id`) REFERENCES `periodo_academico` (`id`),
  ADD CONSTRAINT `FKC162B4B0EB9FE06` FOREIGN KEY (`parcial_activo_id`) REFERENCES `parcial` (`id`);

--
-- Filtros para la tabla `configuracion_admisiones`
--
ALTER TABLE `configuracion_admisiones`
  ADD CONSTRAINT `FKFDF3F07A261BB5C6` FOREIGN KEY (`estado_estudiante_matriculado_id`) REFERENCES `estado_estudiante` (`id`),
  ADD CONSTRAINT `FKFDF3F07A9C8962C2` FOREIGN KEY (`estado_estudiante_promovido_id`) REFERENCES `estado_estudiante` (`id`),
  ADD CONSTRAINT `FKFDF3F07AE980EDDA` FOREIGN KEY (`estado_estudiante_inicial_id`) REFERENCES `estado_estudiante` (`id`);

--
-- Filtros para la tabla `configuracion_recursos_humanos`
--
ALTER TABLE `configuracion_recursos_humanos`
  ADD CONSTRAINT `FK3A6E7414409C54` FOREIGN KEY (`cargo_psicologo_id`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `FK3A6E74265C257A` FOREIGN KEY (`cargo_inspector_id`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `FK3A6E7478D4953F` FOREIGN KEY (`cargo_docente_id`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `FK3A6E7495A7365B` FOREIGN KEY (`cargo_tutor_id`) REFERENCES `cargo` (`id`);

--
-- Filtros para la tabla `configuracion_servicios_tecnicos`
--
ALTER TABLE `configuracion_servicios_tecnicos`
  ADD CONSTRAINT `FKAA4175542541E77F` FOREIGN KEY (`estado_solicitud_inicial_id`) REFERENCES `estado_solicitud` (`id`);

--
-- Filtros para la tabla `control`
--
ALTER TABLE `control`
  ADD CONSTRAINT `FK38B7655D78AAE428` FOREIGN KEY (`tipo_control_id`) REFERENCES `tipo_control` (`id`),
  ADD CONSTRAINT `FK38B7655D83AA832D` FOREIGN KEY (`grupo_clase_id`) REFERENCES `grupo_clase` (`id`);

--
-- Filtros para la tabla `control_estudiante`
--
ALTER TABLE `control_estudiante`
  ADD CONSTRAINT `FKD21D1F4B09C99F2` FOREIGN KEY (`control_estudiantes_id`) REFERENCES `control` (`id`),
  ADD CONSTRAINT `FKD21D1F4E541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `cuenta_bancaria`
--
ALTER TABLE `cuenta_bancaria`
  ADD CONSTRAINT `FKFFDD875424FDC40C` FOREIGN KEY (`tipo_cuenta_id`) REFERENCES `tipo_cuenta` (`id`),
  ADD CONSTRAINT `FKFFDD8754702AB7F1` FOREIGN KEY (`banco_id`) REFERENCES `banco` (`id`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `FK5AA009CAF7F3F76` FOREIGN KEY (`seccion_academica_id`) REFERENCES `seccion_academica` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK471E00CB10AC2F85` FOREIGN KEY (`grupo_gastos_id`) REFERENCES `grupo_gastos` (`id`),
  ADD CONSTRAINT `FK471E00CB2F00094B` FOREIGN KEY (`tipo_contrato_id`) REFERENCES `tipo_contrato` (`id`),
  ADD CONSTRAINT `FK471E00CB6B97154` FOREIGN KEY (`cuenta_bancaria_id`) REFERENCES `cuenta_bancaria` (`id`),
  ADD CONSTRAINT `FK471E00CB7C8CFB9D` FOREIGN KEY (`sistema_salario_id`) REFERENCES `sistema_salario` (`id`),
  ADD CONSTRAINT `FK471E00CB8B1392F2` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  ADD CONSTRAINT `FK471E00CB8DF4F762` FOREIGN KEY (`titulo_id`) REFERENCES `titulo` (`id`),
  ADD CONSTRAINT `FK471E00CBAA443A43` FOREIGN KEY (`motivo_baja_id`) REFERENCES `motivo_baja` (`id`),
  ADD CONSTRAINT `FK471E00CBB615EB2` FOREIGN KEY (`seccion_id`) REFERENCES `seccion` (`id`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FKEB92EDD221E65823` FOREIGN KEY (`paralelo_id`) REFERENCES `paralelo` (`id`),
  ADD CONSTRAINT `FKEB92EDD2242C2406` FOREIGN KEY (`parentesco_emergencia_id`) REFERENCES `parentesco` (`id`),
  ADD CONSTRAINT `FKEB92EDD241826F51` FOREIGN KEY (`representacion_economica_id`) REFERENCES `representacion_economica` (`id`),
  ADD CONSTRAINT `FKEB92EDD2434E7555` FOREIGN KEY (`estado_id`) REFERENCES `estado_estudiante` (`id`),
  ADD CONSTRAINT `FKEB92EDD245B934B1` FOREIGN KEY (`madre_id`) REFERENCES `representante` (`id`),
  ADD CONSTRAINT `FKEB92EDD248BD75E6` FOREIGN KEY (`admision_id`) REFERENCES `admision` (`id`),
  ADD CONSTRAINT `FKEB92EDD249B13B12` FOREIGN KEY (`estructura_familiar_id`) REFERENCES `estructura_familiar` (`id`),
  ADD CONSTRAINT `FKEB92EDD27D5CBB4E` FOREIGN KEY (`padre_id`) REFERENCES `representante` (`id`),
  ADD CONSTRAINT `FKEB92EDD2A5F93891` FOREIGN KEY (`representacion_academica_id`) REFERENCES `representacion_academica` (`id`),
  ADD CONSTRAINT `FKEB92EDD2AB25916E` FOREIGN KEY (`representacion_facturacion_id`) REFERENCES `representacion_facturacion` (`id`),
  ADD CONSTRAINT `FKEB92EDD2BBE67462` FOREIGN KEY (`procedencia_id`) REFERENCES `colegio` (`id`),
  ADD CONSTRAINT `FKEB92EDD2E46672DB` FOREIGN KEY (`nucleo_familiar_id`) REFERENCES `nucleo_familiar` (`id`),
  ADD CONSTRAINT `FKEB92EDD2ECF4ABF1` FOREIGN KEY (`representacion_facturacion_id`) REFERENCES `representacion_facturacion` (`id`);

--
-- Filtros para la tabla `estudiante_representacion_academica`
--
ALTER TABLE `estudiante_representacion_academica`
  ADD CONSTRAINT `FKE966D8618BB17B3` FOREIGN KEY (`estudiante_representaciones_academicas_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `FKE966D86A5F93891` FOREIGN KEY (`representacion_academica_id`) REFERENCES `representacion_academica` (`id`);

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `FK33244CED2BBFAF71` FOREIGN KEY (`parcial_id`) REFERENCES `parcial` (`id`),
  ADD CONSTRAINT `FK33244CEDE541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `evaluacion_comportamiento`
--
ALTER TABLE `evaluacion_comportamiento`
  ADD CONSTRAINT `FK188529F1DE4887E0` FOREIGN KEY (`comportamiento_id`) REFERENCES `comportamiento` (`id`);

--
-- Filtros para la tabla `evaluacion_conducta`
--
ALTER TABLE `evaluacion_conducta`
  ADD CONSTRAINT `FKEDA91EAFBD3D33A0` FOREIGN KEY (`conducta_id`) REFERENCES `conducta` (`id`);

--
-- Filtros para la tabla `evaluacion_control`
--
ALTER TABLE `evaluacion_control`
  ADD CONSTRAINT `FK28BA1C0BB3255CD4` FOREIGN KEY (`control_id`) REFERENCES `control` (`id`);

--
-- Filtros para la tabla `evaluacion_tarea`
--
ALTER TABLE `evaluacion_tarea`
  ADD CONSTRAINT `FK438D012FAC4210D4` FOREIGN KEY (`tarea_id`) REFERENCES `tarea` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `FKBEEB4778E50BB2F0` FOREIGN KEY (`estado_factura_id`) REFERENCES `estado_factura` (`id`);

--
-- Filtros para la tabla `factura_otras_ventas`
--
ALTER TABLE `factura_otras_ventas`
  ADD CONSTRAINT `FKDB762D2E3B19AEAC` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`id`);

--
-- Filtros para la tabla `factura_pension`
--
ALTER TABLE `factura_pension`
  ADD CONSTRAINT `FK82AF5187E541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `FK82AF5187F5A15E55` FOREIGN KEY (`mes_periodo_id`) REFERENCES `mes_periodo` (`id`);

--
-- Filtros para la tabla `factura_rubro_valor`
--
ALTER TABLE `factura_rubro_valor`
  ADD CONSTRAINT `FK460D9D7A4294D765` FOREIGN KEY (`beca_porciento_id`) REFERENCES `beca_por_ciento` (`id`),
  ADD CONSTRAINT `FK460D9D7A9118E453` FOREIGN KEY (`rubro_valor_id`) REFERENCES `rubro_valor` (`id`),
  ADD CONSTRAINT `FK460D9D7ABDD4D728` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`);

--
-- Filtros para la tabla `factura_servicios`
--
ALTER TABLE `factura_servicios`
  ADD CONSTRAINT `FK29A05656E541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `FK5E10C69C2959F96` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`);

--
-- Filtros para la tabla `grupo_clase`
--
ALTER TABLE `grupo_clase`
  ADD CONSTRAINT `FK7E18661461BDBC3A` FOREIGN KEY (`docente_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK7E186614F9A40E91` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id`);

--
-- Filtros para la tabla `grupo_clase_estudiante`
--
ALTER TABLE `grupo_clase_estudiante`
  ADD CONSTRAINT `FKD11E08DD39942ACB` FOREIGN KEY (`grupo_clase_estudiantes_id`) REFERENCES `grupo_clase` (`id`),
  ADD CONSTRAINT `FKD11E08DDE541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `mes_periodo`
--
ALTER TABLE `mes_periodo`
  ADD CONSTRAINT `FKC532846AC3333DB1` FOREIGN KEY (`mes_id`) REFERENCES `mes` (`id`),
  ADD CONSTRAINT `FKC532846AF749D463` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodo_academico` (`id`);

--
-- Filtros para la tabla `mes_periodo_rubro`
--
ALTER TABLE `mes_periodo_rubro`
  ADD CONSTRAINT `FKDE2D94E716114313` FOREIGN KEY (`mes_periodo_rubros_id`) REFERENCES `mes_periodo` (`id`),
  ADD CONSTRAINT `FKDE2D94E7AFE9C73D` FOREIGN KEY (`rubro_id`) REFERENCES `rubro` (`id`);

--
-- Filtros para la tabla `paralelo`
--
ALTER TABLE `paralelo`
  ADD CONSTRAINT `FK45D2149C503890F1` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`),
  ADD CONSTRAINT `FK45D2149CC648500F` FOREIGN KEY (`psicologo_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK45D2149CE9B5A096` FOREIGN KEY (`tutor_id`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `FK45D2149CF749D463` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodo_academico` (`id`);

--
-- Filtros para la tabla `parcial`
--
ALTER TABLE `parcial`
  ADD CONSTRAINT `FKD0B50F3226390151` FOREIGN KEY (`quimestre_id`) REFERENCES `quimestre` (`id`);

--
-- Filtros para la tabla `parroquia`
--
ALTER TABLE `parroquia`
  ADD CONSTRAINT `FK91A2BDDAB58B4611` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FKD78FCFAC1BE98C09` FOREIGN KEY (`ciudad_nacimiento_id`) REFERENCES `ciudad` (`id`),
  ADD CONSTRAINT `FKD78FCFAC1F33BAD2` FOREIGN KEY (`provincia_direccion_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `FKD78FCFAC2662DF43` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `FKD78FCFAC35F0AECC` FOREIGN KEY (`tipo_sangre_id`) REFERENCES `tipo_sangre` (`id`),
  ADD CONSTRAINT `FKD78FCFAC3B19AEAC` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`id`),
  ADD CONSTRAINT `FKD78FCFAC3B8C3960` FOREIGN KEY (`pais_direccion_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `FKD78FCFAC44F07C87` FOREIGN KEY (`pais_nacionalidad_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `FKD78FCFAC5B4CD0A4` FOREIGN KEY (`estado_civil_id`) REFERENCES `estado_civil` (`id`),
  ADD CONSTRAINT `FKD78FCFAC7B90B7E0` FOREIGN KEY (`barrio_direccion_id`) REFERENCES `barrio` (`id`),
  ADD CONSTRAINT `FKD78FCFAC889162C0` FOREIGN KEY (`ciudad_direccion_id`) REFERENCES `ciudad` (`id`),
  ADD CONSTRAINT `FKD78FCFAC8FF4B3FD` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FKD78FCFACBDE5E18F` FOREIGN KEY (`pais_nacimiento_id`) REFERENCES `pais` (`id`),
  ADD CONSTRAINT `FKD78FCFACC8FBD7E5` FOREIGN KEY (`provincia_nacimiento_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `FKD78FCFACE5336BF2` FOREIGN KEY (`parroquia_direccion_id`) REFERENCES `parroquia` (`id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `FKDF613BADBF73FCF1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`);

--
-- Filtros para la tabla `quimestre`
--
ALTER TABLE `quimestre`
  ADD CONSTRAINT `FK5E5258F1F749D463` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodo_academico` (`id`);

--
-- Filtros para la tabla `recibo_cobro`
--
ALTER TABLE `recibo_cobro`
  ADD CONSTRAINT `FKCF98BC9A3EC63C38` FOREIGN KEY (`forma_pago_id`) REFERENCES `forma_pago` (`id`),
  ADD CONSTRAINT `FKCF98BC9A6B97154` FOREIGN KEY (`cuenta_bancaria_id`) REFERENCES `cuenta_bancaria` (`id`),
  ADD CONSTRAINT `FKCF98BC9ABDD4D728` FOREIGN KEY (`factura_id`) REFERENCES `factura` (`id`),
  ADD CONSTRAINT `FKCF98BC9ACC89AD04` FOREIGN KEY (`estado_recibo_id`) REFERENCES `estado_recibo` (`id`);

--
-- Filtros para la tabla `representacion_academica`
--
ALTER TABLE `representacion_academica`
  ADD CONSTRAINT `FK6DC1F7B91E28C6CE` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`),
  ADD CONSTRAINT `FK6DC1F7B9CF7F5AFD` FOREIGN KEY (`parentesco_id`) REFERENCES `parentesco` (`id`),
  ADD CONSTRAINT `FKD7F89E7E1E28C6CE` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`),
  ADD CONSTRAINT `FKD7F89E7ECF7F5AFD` FOREIGN KEY (`parentesco_id`) REFERENCES `parentesco` (`id`);

--
-- Filtros para la tabla `representacion_economica`
--
ALTER TABLE `representacion_economica`
  ADD CONSTRAINT `FKB508528B6B97154` FOREIGN KEY (`cuenta_bancaria_id`) REFERENCES `cuenta_bancaria` (`id`);

--
-- Filtros para la tabla `representante`
--
ALTER TABLE `representante`
  ADD CONSTRAINT `FKF6738A8616209498` FOREIGN KEY (`nivel_educacion_id`) REFERENCES `nivel_educacion` (`id`),
  ADD CONSTRAINT `FKF6738A866B97154` FOREIGN KEY (`cuenta_bancaria_id`) REFERENCES `cuenta_bancaria` (`id`),
  ADD CONSTRAINT `FKF6738A868DF4F762` FOREIGN KEY (`titulo_id`) REFERENCES `titulo` (`id`);

--
-- Filtros para la tabla `rubro_valor`
--
ALTER TABLE `rubro_valor`
  ADD CONSTRAINT `FK907D6BC1AFE9C73D` FOREIGN KEY (`rubro_id`) REFERENCES `rubro` (`id`),
  ADD CONSTRAINT `FK907D6BC1F749D463` FOREIGN KEY (`periodo_academico_id`) REFERENCES `periodo_academico` (`id`);

--
-- Filtros para la tabla `seccion_academica`
--
ALTER TABLE `seccion_academica`
  ADD CONSTRAINT `FK346A5FD1BB6CC671` FOREIGN KEY (`ciclo_id`) REFERENCES `ciclo` (`id`);

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `FKAF52BEA4442B33F5` FOREIGN KEY (`estado_solicitud_id`) REFERENCES `estado_solicitud` (`id`),
  ADD CONSTRAINT `FKAF52BEA4CD11B8D9` FOREIGN KEY (`tipo_solicitud_id`) REFERENCES `tipo_solicitud` (`id`),
  ADD CONSTRAINT `FKAF52BEA4DAB052E1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `subgrupo`
--
ALTER TABLE `subgrupo`
  ADD CONSTRAINT `FK847C36291393116` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`);

--
-- Filtros para la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD CONSTRAINT `FK690770183AA832D` FOREIGN KEY (`grupo_clase_id`) REFERENCES `grupo_clase` (`id`);

--
-- Filtros para la tabla `tarea_comentario`
--
ALTER TABLE `tarea_comentario`
  ADD CONSTRAINT `FKB9ED0BDF69A3BE81` FOREIGN KEY (`tarea_comentarios_id`) REFERENCES `tarea` (`id`),
  ADD CONSTRAINT `FKB9ED0BDF8CAE73A0` FOREIGN KEY (`comentario_id`) REFERENCES `comentario` (`id`);

--
-- Filtros para la tabla `tarea_estudiante`
--
ALTER TABLE `tarea_estudiante`
  ADD CONSTRAINT `FK77211D0C06263F2` FOREIGN KEY (`tarea_estudiantes_id`) REFERENCES `tarea` (`id`),
  ADD CONSTRAINT `FK77211D0E541E200` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Filtros para la tabla `usuario_rol`
--
ALTER TABLE `usuario_rol`
  ADD CONSTRAINT `FK3118953E27F31DDD` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `FK3118953E8FF4B3FD` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
