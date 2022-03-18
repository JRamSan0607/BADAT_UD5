--
-- Defincion de Tablas --
--
DROP DATABASE IF EXISTS talleres;
CREATE DATABASE IF NOT EXISTS talleres;

-- Uso de la Base de Datos Talleres --
USE talleres;

-- Tabla clientes --
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(35) NOT NULL,
    nif CHAR(9) UNIQUE NOT NULL
);

-- Tabla TeléfonoCliente --
DROP TABLE IF EXISTS telefonosClientes;
CREATE TABLE IF NOT EXISTS telefonosClientes(
	id_cliente INT UNSIGNED,
    telefono CHAR(9),
    PRIMARY KEY(id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id)
); 
-- Aun me falta por terminar de copiarlo --
    
	