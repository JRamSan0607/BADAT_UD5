/*

articulos(#id, descripcion, referencia, precio_coste, precio_venta, descuento (%), imagen, categoria, stock, stock_min, stock_max)
3. Tabla registro_llegadas

registro(#id, fecha_hora_salida, fecha_hora_llegada, tiempo_realizado, id_corredor)

*/
use test;
drop table if exists alumnos;
create table if not exists alumnos(
	id int unsigned auto_increment primary key,
    nombre varchar(30),
    apellidos varchar(45) ,
    dni char(9),
    fecha_nac timestamp ,
    edad tinyint unsigned,
    poblacion mediumint unsigned,
    direccion varchar(50),
    cpostal char(5),
    provincia varchar(15),
    nacionalidad varchar(20),
    telefono char(9),
    email varchar(40)
);


drop table if exists articulos;
create table if not exists articulos(
	id,
    descripcion,
    referencia, 
    precio_coste, 
    precio_venta, 
    descuento (%), 
    imagen,
    categoria, 
    stock, 
    stock_min,
    stock_max
);