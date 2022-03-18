-- Actividad 5.3 --

-- Crear Base de Datos --
DROP DATABASE IF EXISTS tipos_datos;
USE tipos_datos;
-- Activo la Base de datos --
-- Creo la tabla tipos_datos_num --
CREATE TABLE IF NOT EXISTS tipos_datos
(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_camiseta TINYINT UNSIGNED,
    diferencia_goles TINYINT,
    goles_afavor TINYINT UNSIGNED,
    goles_encontra TINYINT UNSIGNED,
    num_habitantes MEDIUMINT UNSIGNED,
    humedad FLOAT(3,2),
    litros SMALLINT UNSIGNED,
    temperatura_maxima FLOAT(3,2),
    temperatura_minima FLOAT(3,2),
    velocidad_viento FLOAT(3,2),
    altura SMALLINT,
    precio FLOAT(3,2),
    sueldo FLOAT(3,2),
    seno FLOAT (3,3),
    coseno FLOAT (3,3),
    tangeno FLOAT(3,3)
    );

-- Insert DML --
INSERT INTO tipos_datos_num VALUES(
	NULL,
    17,
    -14,
    60,
    74,
    62984,
    0.345,
    27,
    16.7,
    1.3,
    33.6,
    112.79,
    2789.89,
    1159.29,
    0.999,
    0.467,
    0.365
    );
    



