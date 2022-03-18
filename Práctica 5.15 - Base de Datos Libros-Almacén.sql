DROP DATABASE IF EXISTS libros_almacen;
CREATE DATABASE IF NOT EXISTS libros_almacen;

USE libros_almacen;

DROP TABLE IF EXISTS libros;
CREATE TABLE IF NOT EXISTS libros(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(20) NOT NULL,
    autor varchar(20) NOT NULL,
    precio decimal(10,2) not null
);


DROP TABLE IF EXISTS educacion;
CREATE TABLE IF NOT EXISTS educacion(
	id_libro INT UNSIGNED primary key,
    curso VARCHAR(20) NOT NULL,
    asignatura varchar(20) NOT NULL,
    foreign key (id_libro) references libros(id) on delete cascade on update cascade
);


DROP TABLE IF EXISTS lectura;
CREATE TABLE IF NOT EXISTS lectura(
	id_libro INT UNSIGNED primary key,
    tipo VARCHAR(20) NOT NULL,
    genero varchar(20) NOT NULL,
    foreign key (id_libro) references libros(id) on delete cascade on update cascade
);


DROP TABLE IF EXISTS almacenes;
CREATE TABLE IF NOT EXISTS almacenes(
	id int unsigned auto_increment primary key,
    nombre varchar(20) not null,
    fecha date not null,
    id_provincia int unsigned
);


DROP TABLE IF EXISTS provincias;
CREATE TABLE IF NOT EXISTS provincias(
	id int unsigned auto_increment primary key,
    nombre varchar(20) not null,
    id_almacen int unsigned,
    foreign key (id_almacen) references almacenes(id) on delete set null on update cascade
);

alter table almacenes
add constraint id_almacenes foreign key (id_provincia) references provincias(id) on delete set null on update cascade;


-- POBLACIONES  

-- SOCIOS

-- PEDIDOS

-- LIBROSPEDIDOS

-- ALMACENESPEDIDOS
