DROP DATABASE IF EXISTS empleados_taller;
CREATE DATABASE IF NOT EXISTS empleados_taller;

USE empleados_taller;

DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS proyectos;
CREATE TABLE IF NOT EXISTS proyectos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    proyecto VARCHAR(30) NOT NULL,
    descripcion TEXT NOT NULL,
    presupuesto DECIMAL(10,2) UNSIGNED NOT NULL , 
	id_cliente INT UNSIGNED,
    id_empleado_jefe INT UNSIGNED,
    FOREIGN KEY(id_cliente) REFERENCES clientes(id)
    ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
	id_proyecto INT UNSIGNED,  
	id_empleado_sup INT UNSIGNED, 
    FOREIGN KEY(id_proyecto) REFERENCES proyectos(id)
    ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY(id_empleado_sup) REFERENCES empleados(id) 
    ON DELETE SET NULL ON UPDATE CASCADE
);

ALTER TABLE proyectos
ADD CONSTRAINT jefeproyecto FOREIGN KEY(id_empleado_jefe) REFERENCES empleados(id) 
ON DELETE SET NULL ON UPDATE CASCADE;


DROP TABLE IF EXISTS beneficiarios;
CREATE TABLE IF NOT EXISTS beneficiarios(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    fecha_nac DATE NOT NULL,
    id_empleado INT UNSIGNED,
    FOREIGN KEY(id_empleado) REFERENCES empleados(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);



DROP TABLE IF EXISTS telefonoClientes;
CREATE TABLE IF NOT EXISTS telefonoClientes(
	id_cliente INT UNSIGNED,
	telefono CHAR(12) UNIQUE,
    PRIMARY KEY(id_cliente,telefono),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS telefonoEmpleados;
CREATE TABLE IF NOT EXISTS telefonoEmpleados(
	id_empleado INT UNSIGNED, 
	telefono CHAR(12) UNIQUE,
    PRIMARY KEY(id_empleado,telefono),
	FOREIGN KEY(id_empleado) REFERENCES empleados(id) 
    ON DELETE CASCADE ON UPDATE CASCADE
    
);


DROP TABLE IF EXISTS proyectoEmpleados;
CREATE TABLE IF NOT EXISTS proyectoEmpleados(
	id_proyecto INT UNSIGNED ,
	id_empleado INT UNSIGNED ,
    horas TIME NOT NULL,
    f_inicio DATETIME NOT NULL,
    f_fin DATETIME NOT NULL,
    valoracion TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_proyecto,id_empleado),
	FOREIGN KEY(id_proyecto) REFERENCES proyectos(id) 
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(id_empleado) REFERENCES empleados(id) 
    ON DELETE RESTRICT ON UPDATE CASCADE
);