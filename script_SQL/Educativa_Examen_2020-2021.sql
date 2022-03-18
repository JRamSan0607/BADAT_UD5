
CREATE DATA BASE educativa;

USE educativa;

DROP table if exists etapas;
CREATE TABLE IF NOT EXISTS etapas(
	id int unsigned auto_increment primary key,
    nombre VARCHAR(20) not null,
    descripcion VARCHAR(100) not null,
    obligatoria boolean default 0,
    edad_inicio tinyint unsigned,
    edad_fin tinyint unsigned
);

DROP table if exists centros;
CREATE TABLE IF NOT EXISTS centros(
	id int unsigned auto_increment primary key,
    nombre VARCHAR(30),
    nivel enum CHECK (nivel IN ('Primaria','Secundaria','Bachillerato','Fp')),
    direccion VARCHAR(50) not null,
    poblacion VARCHAR(20) not null,
    provincia VARCHAR(20) not null,
    region VARCHAR(20) not null,
    codido CHAR(8) not null unique,
    fecha_inicio DATE not null
);

DROP table if exists centros_etapas;
CREATE TABLE IF NOT EXISTS centros_etapas(
    centro_id int unsigned,
    etapa_id int unsigned,
    
    foreign key(centro_id) references centros(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key(etapa_id) references etapas(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    primary key(centro_id, etapa_id)
    -- Si tenemos más de una clave primaria debemos demostrarla de este modo que tenemos arriba --
);

DROP table if exists departamentos;
CREATE TABLE IF NOT EXISTS departamentos(
	id int unsigned auto_increment primary key,
    nombre VARCHAR(20) NOT NULL,
    nivel TINYINT UNSIGNED CHECK(nivel between 1 and 6),
    descripcion VARCHAR(100) NOT NULL,
    etapa_id INT UNSIGNED,
    centro_id INT UNSIGNED,
    
    foreign key(etapa_id) references etapas(id)
    ON DELETE set null ON UPDATE CASCADE,
    foreign key(centro_id) references centros(id)
    ON DELETE set null ON UPDATE CASCADE,    
);

DROP table if exists profesores;
CREATE TABLE IF NOT EXISTS profesores(
	nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(40) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
	nrp CHAR(16) UNIQUE NOT NULL,
    direccion VARCHAR(50) not null,
    email VARCHAR(60) unique not null,
    telefono CHAR(12),
    tipo_destino ENUM('interino', 'provisional', 'comision de servicios', 'definitivo', 'concursillo'),
    centro_id INT UNSIGNED,
	departamento_id INT UNSIGNED,
    
    foreign key(centro_id) references centros(id)
    ON DELETE set null ON UPDATE CASCADE,
    foreign key(departamento_id) references departamentos(id)
    ON DELETE set null ON UPDATE CASCADE, 
);

DROP table if exists profesores;
CREATE TABLE IF NOT EXISTS profesores(
	id
	nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(40) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
	nrp CHAR(16) UNIQUE NOT NULL,
    direccion VARCHAR(50) not null,
    email VARCHAR(60) unique not null,
    telefono CHAR(12),
    tipo_destino ENUM('interino', 'provisional', 'comision de servicios', 'definitivo', 'concursillo'),
    centro_id INT UNSIGNED,
	departamento_id INT UNSIGNED,
    
    foreign key(centro_id) references centros(id)
    ON DELETE set null ON UPDATE CASCADE,
    foreign key(departamento_id) references departamentos(id)
    ON DELETE set null ON UPDATE CASCADE, 
);