-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Temps de generació: 22-09-2016 a les 16:54:17
-- Versió del servidor: 10.1.13-MariaDB
-- Versió de PHP: 7.0.6

CREATE DATABASE IF NOT EXISTS `bd_dulcesdaw` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bd_dulcesdaw`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `bd_dulcesdaw`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `tbl_bombon`
--

CREATE TABLE `tbl_bombon` (
  `id_bombon` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_bombon` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_relleno` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_nuez` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `precio_bombon` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `tbl_cajas`
--

CREATE TABLE `tbl_cajas` (
  `id_caja` int(11) NOT NULL,
  `nombre_caja` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_caja` enum('pequeña','mediana','grande') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `tbl_cesta`
--

CREATE TABLE `tbl_cesta` (
  `id_cesta` int(11) NOT NULL,
  `nombre_cesta` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_cesta` enum('Regalo cliente preferente','Regalo Empresa','','') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `tbl_detalle_caja`
--

CREATE TABLE `tbl_detalle_caja` (
  `id_detalle_caja` int(11) NOT NULL,
  `id_bombon` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `cantidad_bombon` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `tbl_detalle_cesta`
--

CREATE TABLE `tbl_detalle_cesta` (
  `id_detalle_cesta` int(11) NOT NULL,
  `id_cesta` int(11) NOT NULL,
  `id_bombon` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_bombon` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexos per taules bolcades
--

--
-- Index de la taula `tbl_bombon`
--
ALTER TABLE `tbl_bombon`
  ADD PRIMARY KEY (`id_bombon`);

--
-- Index de la taula `tbl_cajas`
--
ALTER TABLE `tbl_cajas`
  ADD PRIMARY KEY (`id_caja`);

--
-- Index de la taula `tbl_cesta`
--
ALTER TABLE `tbl_cesta`
  ADD PRIMARY KEY (`id_cesta`);

--
-- Index de la taula `tbl_detalle_caja`
--
ALTER TABLE `tbl_detalle_caja`
  ADD PRIMARY KEY (`id_detalle_caja`);

--
-- Index de la taula `tbl_detalle_cesta`
--
ALTER TABLE `tbl_detalle_cesta`
  ADD PRIMARY KEY (`id_detalle_cesta`),
  ADD KEY `FK_cesta_bombon` (`id_cesta`),
  ADD KEY `FK_detalle_cesta_bombon` (`id_bombon`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `tbl_cajas`
--
ALTER TABLE `tbl_cajas`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `tbl_cesta`
--
ALTER TABLE `tbl_cesta`
  MODIFY `id_cesta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `tbl_detalle_caja`
--
ALTER TABLE `tbl_detalle_caja`
  MODIFY `id_detalle_caja` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `tbl_detalle_cesta`
--
ALTER TABLE `tbl_detalle_cesta`
  MODIFY `id_detalle_cesta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `tbl_detalle_cesta`
--
ALTER TABLE `tbl_detalle_cesta`
  ADD CONSTRAINT `FK_cesta_bombon` FOREIGN KEY (`id_cesta`) REFERENCES `tbl_cesta` (`id_cesta`),
  ADD CONSTRAINT `FK_detalle_cesta_bombon` FOREIGN KEY (`id_bombon`) REFERENCES `tbl_bombon` (`id_bombon`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
