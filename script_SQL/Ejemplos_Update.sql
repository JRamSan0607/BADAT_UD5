-- Ejemplos update --
-- Tabla clientes de bbdd talleres --

-- 1.Actualizar todos los registros con una fecha de nacimiento --
UPDATE clientes 
SET fech_nacimiento = '2000/10/12';

-- 2.Actualizar la edad de todos los clientes a aprtir de la fecha de nacimiento --
UPDATE clientes
SET edad = TIMESTAMPDIFF(year, fech_nacimiento, now());

-- 3.Cambiar el nombre de Carlos por Juan Carlos al cliente cuyo id =3 --
UPDATE clientes
SET nombre = 'Juan Carlos'
WHERE id = 3;

-- 4.Cambiar la fecha de nacimiento al 1970/12/10 de Conchi con id = 7 --
UPDATE clientes
SET fech_nacimiento = '1970/12/10'
WHERE id = 7;

-- 5.Crear la tabla artículos con id, descripción, precio, descuento --
CREATE TABLE IF NOT EXISTS Articulos(
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(150),
    precio DECIMAL(10,2),
    descuento FLOAT(3,2)
);

-- 6.Añadir 4 registros a la tabla artículos --
INSERT INTO ARTiculos valuES
(NULL, 'MOnitor LG 20"', '69.12', '0.04'),
(NULL, 'FUente de Alimentación 500W', '23.12', '0.01'),
(NULL, 'DISco Duro SSD 2 - 1TB', '200.00', '0.10'),
(NULL, 'WINdows Pre Instalaciíon', '20.00', '0.00');

-- 7.Subir un 1% de descuento a los 3 artículos con menor precio --
UPDATE articulos
SET descuento = + 0.01
ORDER BY descuento ASC LIMIT 3;

-- 8.Incrementar el precio del Monitor LG 20 en un 10% --
UPDATE articulos
SET precio = precio * 1.10
WHERE id = 1;

-- 9.Decrementa el precio del Disco Duro y de la Fuente de alimentación en un 15% --
UPDATE articulos
SET precio = precio * 0.85
WHERE id =3 or id = 2;
