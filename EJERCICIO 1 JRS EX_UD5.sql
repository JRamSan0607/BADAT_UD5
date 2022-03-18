-- Base de Datos Gescomercial --
-- Primero nos aseguramos de que no exista la Base de datos --

DROP DATABASE IF EXISTS gescomercial;
CREATE DATABASE IF NOT EXISTS gescomercial;

USE gescomercial;
	
DROP TABLE IF EXISTS categorias;
CREATE TABLE IF NOT EXISTS categorias(
	id id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    descripcion VARCHAR(100),
    imagen BOOLEAN
);

DROP TABLE IF EXISTS proveedores;
CREATE TABLE IF NOT EXISTS proveedores(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    contacto VARCHAR(30),
    titulo_contacto VARCHAR(20),
    direccion VARCHAR(50),
    ciudad VARCHAR(20),
    cod_postal CHAR(5),
    pais VARCHAR(20),
    telefono CHAR(12),
    web BOOLEAN,
    email VARCHAR(60) UNIQUE NOT NULL,
    cif CHAR(9) UNIQUE NOT NULL,
    descripcion VARCHAR(100),
    imagen BOOLEAN
);

DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    contacto VARCHAR(30),
    titulo_contacto VARCHAR(20),
    direccion VARCHAR(50),
    ciudad VARCHAR(20),
    cod_postal CHAR(5),
    pais VARCHAR(20),
    telefono CHAR(12),
    web BOOLEAN,
    email VARCHAR(60) UNIQUE NOT NULL,
    cif CHAR(9) UNIQUE NOT NULL,
    descripcion VARCHAR(100),
    imagen BOOLEAN
);

DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20),
    apellidos VARCHAR(30),
    fecha_nacimiento DATE,
    direccion VARCHAR(50),
    ciudad VARCHAR(20),
    cod_postal CHAR(5),
    pais VARCHAR(20),
    telefono CHAR(12) UNIQUE NOT NULL,
    foto BOOLEAN,
    email VARCHAR(60) UNIQUE NOT NULL,
    nif CHAR(9) UNIQUE NOT NULL,
    observaciones VARCHAR(100)
);

DROP TABLE IF EXISTS contratos;
CREATE TABLE IF NOT EXISTS contratos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_contrato CHAR(10),
    fecha_inicio DATE,
    fecha_fin DATE,
    sueldo_base INT(5),
    hora_entrada DATETIME,
    hora_salida DATETIME,
    horas_semanales DATETIME,
    precio_hora_extra INT(3),
    irpf DECIMAL(2,2),
    en_vigor BOOLEAN,
    puesto_laboral VARCHAR(20),
    empleado_id INT UNSIGNED,
    
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS productos;
CREATE TABLE IF NOT EXISTS productos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30),
    cantidad_unidad INT UNSIGNED,
    precio_unidad DECIMAL (10,2),
	stock BOOLEAN,
    unidades_vendidas INT UNSIGNED,
    stock_maximo INT,
    stock_minimo INT,
    activo BOOLEAN,
    codigo_producto CHAR(12) UNIQUE NOT NULL,
    ean13 CHAR(13) UNIQUE NOT NULL,
    proveedor_id INT NOT NULL,
    categoria_id INT NOT NULL,
    
    FOREIGN KEY(proveedor_id) REFERENCES proveedores(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(categoria_id) REFERENCES categorias(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
DROP TABLE IF EXISTS pedidos;
CREATE TABLE IF NOT EXISTS pedidos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	numero_pedido VARCHAR(10) UNIQUE NOT NULL,
    fecha_hora_pedido TIMESTAMP,
    fecha_hora_envio TIMESTAMP,
    fecha_hora_entrega TIMESTAMP,    
    estado_pedido VARCHAR(20),
    importe INT UNSIGNED,
    importe_iva INT UNSIGNED,
    importe_total INT UNSIGNED,
    empleado_id INT UNIQUE NOT NULL,
    cliente_id INT UNIQUE NOT NULL,
    
    FOREIGN KEY(empleado_id) REFERENCES empleados(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(cliente_id) REFERENCES clientes(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
    );
    
DROP TABLE IF EXISTS detalles_pedidos;
CREATE TABLE IF NOT EXISTS detalles_pedidos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	linea_pedido INT UNIQUE,
    precio DECIMAL(10,2),
    cantidad INT UNSIGNED,
    descuento DECIMAL (2,2),
    iva DECIMAL (2,2),
    importe_linea INT UNSIGNED,
    importe_total INT UNSIGNED,
    pedido_id INT UNIQUE NOT NULL,
    producto_id INT UNIQUE NOT NULL,
    
    FOREIGN KEY(pedido_id) REFERENCES pedidos(id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(producto_id) REFERENCES productos(id)
    ON DELETE RESTRICT ON UPDATE CASCADE
    );