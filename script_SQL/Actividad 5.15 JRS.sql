-- Actividad 5.15 Base de Datos Libros|Almacén --

-- Primero confirmamos que no hay ninguna tabla con este nombre --

DROP DATABASE IF EXISTS libros_almacen;
CREATE DATABASE IF NOT EXISTS libros_almacen;
 
use libros_almacen;

-- Creamos una tabla para cada categoría de la BDT --

drop table if exists libros;
create table if not exists libros(
	id int unsigned auto_increment primary key,
    titulo varchar(20) not null,
    autor varchar(20) not null,
    precio decimal(10,2)
);
drop table if exists educacion;
create table if not exists educacion(
	id_libro int unsigned,
    curso varchar(5),
    asignatura varchar(20),
    foreign key(id_libro) references libros(id)
    on delete set null on update cascade
 );
 drop table if exists lectura;
 create table if not exists lectura(
	id_libro int unsigned,
    tipo varchar(10),
    genero varchar(20),
    foreign key(id_libro) references libros(id)
    on delete set null on update cascade
);
drop table if exists provincias;
create table if not exists provincias(
	id int unsigned auto_increment primary key,
    nombre varchar(20),
    id_almacen int unsigned
);

drop table if exists almacen;
create table if not exists almacen(
	id int unsigned auto_increment primary key,
    nombre varchar(30),
    fecha date not null,
    id_provincia int unsigned
);

alter table provincias 
add constraint id_almacenProvincias foreign key(id_almacen) references provincias(id);


 