
DROP DATABASE IF EXISTS restricciones_check;
CREATE DATABASE IF NOT EXISTS restricciones_check CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

use restricciones_check;
 


DROP TABLE IF EXISTS comparacion;
create table if not exists comparacion(
			id int unsigned auto_increment primary key,
            importe decimal(10,2) check(importe>400),
            saldo decimal(10,2) check(saldo>0),
            nombre varchar(40),
            apellidos varchar(40),
            n_beneficiarios tinyint unsigned check(n_beneficiarios>=5),
            n_asignaturas tinyint unsigned check(n_asignaturas<=5),
            beca  boolean,
            importe_beca decimal(10,2) check(importe_beca<2500) ,
			n_goles tinyint unsigned check(n_goles>20),
			anno_nacimiento year check(anno_nacimiento>1970),
			fec_nacimiento date check(fec_nacimiento<"2000/02/21"),
			hora_llegada time,
            check(hora_llegada>"12:00:00"),
            check(nombre IS NULL),
            check(apellidos is null)
);


insert into comparacion values
(
	null,
    500,
    2000,
    null,
    null,
    7,
    3,
    true,
    1200,
    34,
    1978,
    "1970/02/22",
    "13:20:00"
);

DROP TABLE IF EXISTS checkbetween;
create table if not exists checkbetween(
			id int unsigned auto_increment primary key,
            ngoles tinyint check(ngoles between 20 and 30),
            sueldo decimal(10,2) check(sueldo between 2000 and 3000),
            importe decimal
         
);


checkbetween(#id, ngoles, sueldo, importe, cantidad, valor, tipodescuento, precio)

Sueldo. Comprendido entre 2000 y 3000 €.
Importe. Comprendido entre 400 y 600 €.
Cantidad. Comprendida entre 5 y 20 artículos.
Valor. No comprendido entre 4 y 7.
TipoDescuento. Comprendido entre 5,25 y el 20,50 %
Precio. Comprendido entre 20 y 30 €.
3. Tabla chekin

chekin(#id, provincia, poblacion, cicloEstudio, valores, nacionalidad)

id- PK
Provincia. Ha de ser Cádiz, Málaga, Sevilla.
Población. Ha de ser Ubrique, Villamartín, Prado del Rey, Olvera
CicloEstudio. Ha de ser ESO, BACH, MEDIO, SUPERIOR, ADULTOS
Valores. Ha de ser 1, 2, 5, 8,9
Nacionalidad. Ha de ser España, Brasil, Portugal, Argentina, Italia
CodEmpleado. El 2º y 3º dígito han de ser AB
NRP. El número de registro personal de un funcionario ha de acabar en una Z
DNI. Los dos primeros dígitos han de ser 25.
