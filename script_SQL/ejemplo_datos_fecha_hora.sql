USE TEST;

DROP TABLE IF exists tipo_datos_fecha_hora;
CREATE TABLE IF NOT exists tipo_datos_fecha_hora(
	id INT UNSIGNED auto_increment PRIMARY KEY,
    fecha_nac DATE default current_timestamp,
    registro datetime,
    hora time(6) default current_timestamp, -- //En time con los paréntesis y del 1 al 6 puedo contar de milésimas del segundo a millonésima\\ --
    ano_nac year,
    
    create_at timestamp default current_timestamp,
    update_at timestamp default current_timestamp
);

INSERT INTO tipo_datos_fecha_hora (id, fecha_nac, registro, hora, ano_nac) VALUES
(
	null,
    '1970-07-31',
    '1970-07-31 20:30:11',
    '21:45:12.2',
    72
);
