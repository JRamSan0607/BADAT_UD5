-- Actividad 5.12
-- Descripcion: base de datos videoclub
-- Autor: Felix Gomez

DROP DATABASE IF exists videoclub;
Create database if not exists videoclub;

use videoclub;

drop table if exists actores;
create table if not exists actores(
	id INT unsigned auto_increment primary key,
    nombre varchar(20) not null,
    apellidos varchar(45) not null,
    nacionalidad varchar(20) not null,
    sexo enum('M','H','S'),
    fecha_nac date not null,
    num_peliculas tinyint unsigned not null
);
insert into actores values(
	null, 
    "felix",
    "gomez",
    "española",
    'H',
    "1999/04/27",
    23
),
(
	null, 
    "pepe",
    "ramirez",
    "española",
    'H',
    "2002/02/12",
    24
);




drop table if exists directores;
create table if not exists directores(
	id INT unsigned auto_increment primary key,
    nombre varchar(20) not null,
    apellidos varchar(45) not null,
    nacionalidad varchar(20) not null,
    fecha_nac date not null,
    num_peliculas tinyint unsigned not null
);
insert into directores values(
	null, 
    "felix",
    "gomez",
    "española",
    "1999/04/27",
    23
),
(
	null, 
    "pepe",
    "ramirez",
    "española",
    "2002/02/12",
    24
);



drop table if exists peliculas;
create table if not exists peliculas(
	id INT unsigned auto_increment primary key,
    titulo varchar(20) not null,
    nacionalidad varchar(20) not null,
    productora varchar(20) not null,
	presupuesto decimal(10,2) unsigned not null,
    fecha_estreno date not null ,
    anno_produccion year not null,
    valoracion tinyint not null, 
    premios tinyint unsigned not null,
    director_id int unsigned references directores (id) on delete restrict on update cascade,
    check(valoracion between 0 and 10)    
);

insert into peliculas values(
	null, 
    "batman",
    "española",
    "felixpeliculas",
	3454.34,
    2008/10/02,
    2006,
    8,
    4,
    1
),
(
	null, 
    "spiderman",
    "española",
    "felixpeliculas",
	3546.34,
    2018/10/02,
    2016,
    9,
    3,
    1
);


drop table if exists ejemplares;
create table if not exists ejemplares(
	id INT unsigned auto_increment primary key,
    pelicula_id int unsigned,
    codigo_ejemplar varchar(20) not null,
    formato varchar(20) not null,
    fecha_ejemplar date not null ,
    estado enum('Disponible','No Devuelta','Alquilada','Baja'),
    foreign key (pelicula_id) references peliculas (id) on delete restrict on update cascade
    
);
insert into ejemplares values(
	null, 
    2,
    "AB23",
    "DVD",
    "2008/10/02",
	"Disponible"
),
(
	null, 
    2,
    "AB22",
    "CD",
    "2018/10/02",
	"Disponible"
);


drop table if exists socios;
create table if not exists socios(
	id INT unsigned auto_increment primary key,
    nombre varchar(20) not null,
    direccion varchar(45) not null,
    poblacion varchar(40) not null,
    provincia varchar(30) not null,
    c_postal char(5) not null,
    telefono char(9) not null,
    email varchar(40) not null,
    socio_avalista_id int unsigned references socios(id) on delete restrict on update cascade
);
insert into socios values(
	null, 
    "felix",
    "C/Alta Nº2",
    "Bornos",
    "Cadiz",
	"11230",
    "645676958",
    "felimihmo@gmail.com",
    1
),
(
	null, 
    "pepe",
    "C/Alta Nº3",
    "bornos",
    "Cadiz",
	"11230",
    "648695032",
    "pepemihmo@gmail.com",
    1
);


drop table if exists participan;
create table if not exists participan(
	pelicula_id INT unsigned not null,
    actor_id int unsigned not null,
    fecha_inicio datetime not null,
    fecha_fin datetime not null,
    papel enum("principal","secundario","relleno"),
    premios tinyint unsigned not null,
    valoracion tinyint not null,
    check(valoracion between 0 and 10),
	primary key (pelicula_id,actor_id),
    foreign key (pelicula_id) references peliculas (id) on delete restrict on update cascade,
	foreign key (actor_id) references actores (id) on delete restrict on update cascade
);

insert into participan values(
	1, 
    2,
    "2003/07/23 12:00:00",
    "2004/02/02 11:00:00",
	"principal",
    3,
    7
),
(
	1, 
    1,
    "2003/07/23 12:00:00",
    "2004/02/02 11:00:00",
	"principal",
    0,
    8
);


drop table if exists alquila;
create table if not exists alquila(  
	id int unsigned auto_increment primary key,
	ejemplar_id INT unsigned not null unique,
    socio_id int unsigned not null unique,
    fecha_alquiler datetime not null,
    fecha_devolucion datetime not null,
    precio decimal(10,2) unsigned not null,
    observaciones text not null,    
    foreign key (ejemplar_id) references ejemplares (id) on delete restrict on update cascade,
	foreign key (socio_id) references socios (id) on delete restrict on update cascade
);
insert into alquila values(
	null, 
    2,
    1,
    "2003/07/23 12:00:00",
	"2003/07/26 11:00:00",
    21.34,
    "observaciones"
),
(
	null, 
    1,
    2,
    "2003/07/12 12:00:00",
	"2003/07/19 11:00:00",
    20.00,
    "observaciones"
);







