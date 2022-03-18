-- Actividad 5.14 Base de Datos Empleados-Taller --

-- Primero confirmamos que no hay ninguna tabla con este nombre --

DROP DATABASE IF EXISTS empleados_taller;
CREATE DATABASE IF NOT EXISTS empleados_taller;

use empleados_taller;

-- Creamos una tabla para cada categoría de la BDT --

drop table if exists clientes;
create table if not exists clientes(
	id int unsigned auto_increment primary key,
    nombre varchar(20) not null,
    dni char(9) unique not null
);

drop table if exists proyectos;
create table if not exists proyectos(
	id int unsigned auto_increment primary key,
    proyecto varchar(30) not null,
    descripcion text not null,
    presupuesto decimal(10,2) unsigned not null , 
	id_cliente int unsigned,
    id_empleado_jefe int unsigned,
    foreign key(id_cliente) references clientes(id)
    on delete set null on update cascade
);

drop table if exists empleados;
create table if not exists empleados(
	id int unsigned auto_increment primary key,
    nombre varchar(20) not null,
    dni char(9) unique not null,
	id_proyecto int unsigned,  
	id_empleado_sup int unsigned, 
    foreign key(id_proyecto) references proyectos(id)
    on delete set null on update cascade,
    foreign key(id_empleado_sup) references empleados(id) 
    on delete set null on update cascade
);

ALTER TABLE proyectos
ADD CONSTRAINT jefeproyecto foreign key(id_empleado_jefe) references empleados(id) on delete set null on update cascade;

drop table if exists beneficiarios;
create table if not exists beneficiarios(
	id int unsigned auto_increment primary key,
    nombre varchar(20) not null,
    fecha_nac date not null,
    id_empleado int unsigned,
    foreign key(id_empleado) references empleados(id) 
    on delete cascade on update cascade
);

drop table if exists telefonoClientes;
create table if not exists telefonoClientes(
	id_cliente int unsigned,
	telefono char(12) unique,
    primary key(id_cliente,telefono),
    foreign key(id_cliente) references clientes(id) on delete cascade on update cascade
);


drop table if exists telefonoEmpleados;
create table if not exists telefonoEmpleados(
	id_empleado int unsigned, 
	telefono char(12) unique,
    primary key(id_empleado,telefono),
	foreign key(id_empleado) references empleados(id) on delete cascade on update cascade
    
);

drop table if exists proyectoEmpleados;
create table if not exists proyectoEmpleados(
	id_proyecto int unsigned,
	id_empleado int unsigned,
    horas time not null,
    f_inicio datetime not null,
    f_fin datetime not null,
    valoracion tinyint unsigned not null,
    primary key(id_proyecto,id_empleado),
    foreign key(id_proyecto) references proyectos(id) 
    on delete set null on update cascade,
    foreign key(id_empleado) references empleados(id) 
    on delete set null on update cascade
);