-- Practica 5.2 --
-- Descripción: Crear, modificar y eliminar BBDD --
-- Tema 5 - Lenguaje DDL --
-- Autor: José Ramírez Sánchez --
-- Fecha: 25/01/2022 --
-- Actividad 1 --
-- Descripción: Crear la base de datos ajedrez, usar siempre la cláusula IF  --
-- NOT EXISTS. Indicar el juego de caracteres y la colección establecida por defecto. --
CREATE DATABASE IF NOT EXISTS ajedrez;
-- CHARSET latin1
-- COLLECTION latin1_bin

-- Actividad 2
-- Descripción: Modificar la base de datos ajedrez para establecer el juego de caracteres inglés internacional así como la colección correspondiente.
ALTER DATABASE ajedrez
CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;

-- Actividad 3
-- Descripción: Eliminar la base de datos ajedrez
DROP DATABASE IF EXISTS ajedrez;

-- Actividad 4
-- Descripción:Crear la base de datos futbol, usar el juego de caracteres utf16 y la colección utf16_general_ci
CREATE DATABASE futbol; 

-- Actividad 5
-- Descripción: Modificar la base de datos futbol para cambiar al juego de caracteres UTF8MB4 y la colección 'utf8mb4_general_ci'
ALTER DATABASE futbol
CHARACTER SET UTF8MB4 COLLATE UTF8MB4_GENERAL_CI;

-- Actividad 6
-- Descripción: Eliminar definitivamente la base de datos futbol
DROP DATABASE IF EXISTS futbol; 




