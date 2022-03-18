-- Ejemplos SELECT --

USE maratoon;
-- SELECT por defecto va con ALL para coger todas las opciones posibles --
-- SELECT con distinct es para solo coger las opciones 1 vez --
-- 1. De cuantas ciudades tengo corredore --
SELECT distinct ciudad FROM corredores;

-- Muestra todos los detalles de todos los corredores --
SELECT * FROM corredores;

-- 4. Muestra dos columnas en solo una, y nos permite cambiar el alias de la columna --
SELECT id,
	concat_ws(', ', Apellidos, Nombre) as nombre,
    ciudad,
    sexo,
    year(fechaNacimiento) as año,
    edad
FROM corredores;

-- 5. Muestra todos los registros de las tablas corredores y clubs (Consulta Multi-Tabla) --
SELECT * FROM corredores, clubs;

-- 6. Usar prefijos en la lista de columnas --
SELECT	corredores.id,
		corredores.nombre,
        corredores.apellido,
        corredores.edad,
        clubs.id as id_club,
        clubs.nombre as club
FROM corredores, clubs;

-- 8. Cláusula WHERE básica --
select * from corredores where ciudad='Ubrique';

-- 9. Corredores de más de 50 ordenados por edad de menor a mayor --
select * from corredores where edad > 50 order by edad;

-- 10. Corredores de más de 50 ordenador por edad de menor a mayor y que sean de Ubrique --
select * from corredores
where edad > 50 and ciudad ='Ubrique'
order by edad;

-- 11. Corredores de Ubrique y de Villamartin --
select * from corredores
where ciudad IN ('Ubrique', 'Villamartin')
order by apellidos, nombre;

-- 12. BETWEEN. Corredores entre 50 y 60 años, los de 60 no incluidos --
SELECT * FROM corredores where edad between 50 and 59;

-- 13. LIKE. Corredores que se apelliden García --
SELECT * from corredores WHERE apellidos LIKE '%García%';