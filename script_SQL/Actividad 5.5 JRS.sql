-- Actividad 5.5 --

-- Primero confirmamos que no haya una tabla creada con el mismo nombre, y si la hay la borramos y creamos una nueva --

DROP TABLE IF exists tipo_datos_fecha;
CREATE TABLE IF NOT exists tipo_datos_fecha(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    fecha_nac DATE default current_timestamp,
    fecha_hora_nac DATE default current_timestamp,
    hora_llegada time default current_timestamp,
    hora_salida time,
    anno_nacimiento year,
    anno_fundacion year,
    fecha_hora_llegada datetime,
    fecha_hora_salida datetime,
    fecha_hora_actual datetime default current_timestamp,
    edad int,
    
    create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);
INSERT INTO tipo_datos_fecha (id, fecha_nac, fecha_hora_nac, hora_llegada, hora_salida, anno_nacimiento, anno_fundacion, fecha_hora_llegada, fecha_hora_salida, fecha_hora_actual, edad, create_at, update_at) VALUES
(
	null,
    '2002-07-06',
    '2002-07-06 21:49:34',
    '22:01:18',
    '22:34:40',
    02,
    08,
    '18-07-2008 17:45:32',
    '19-07-2008 10:21:56',
    default,
    19
);