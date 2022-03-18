-- Actividad 6.1 --
-- Dexcripción: Sentencias Básicas DML - Fútbol --
-- Fecha: 22/02/2022 --
-- Autor: José Ramírez Sánchez --

-- 1. INSERT --
INSERT INTO equipos VALUES
(NULL, 'Real Madrid', 'Santiago Bernabeu', '100000', '1901', 'Madrid'),
(NULL, 'Betis', 'Benito Villamarín', '60000', '1905', 'Sevilla');

INSERT INTO jugadores VALUES
(NULL, 'Marco Asensio', '1999/02/19', 5),
(NULL, 'Canalaes', '1995/02/19', 6);

INSERT INTO partidos VALUES
(NULL, 3, 4, '2022/12/31', '3', '1', 'Bonito juego'),
(NULL, 4, 5, '2022/02/14', '4', '2', 'El árbitro expulsó a 2 jugadores');

INSERT INTO goles VALUES
(NULL, 4, '00:04:30', 'De cabeza tras saque de córner', 4),
(NULL, 4, '00:20:48', 'De falta directa', 4);

-- 2. UPDATE (Actualizar registros) --
-- 2.1 Estadio de Villatrabuco pasa a llamarse Miraflores --
UPDATE equipos
SET estadio = 'Miraflores'
WHERE id = 1;

-- 2.2 El estadio de Valdeajos tiene ahora una capacidad de 30000 espectadores --
UPDATE equipos
SET aforo = '30000'
WHERE id = 4;

-- 2.3 Todos los estadios sufren una merma de capacidad de 100 espectadores (reservas federativas) --
UPDATE equipos
SET aforo = aforo - 100;

-- 2.4 El Athletic Formeñosa se funda 10 años más tarde --
UPDATE equipos
SET fundacion = fundacion + 10
WHERE id = 3;

-- 2.5 El jugador Diez Crespo ha fichado ahora por el Villatortas --
UPDATE jugadores 
SET equipo_id = 3
WHERE id = 4;

-- 2.6 El jugador Julianillo nació finalmente el 8/4/1976. --
UPDATE jugadores
SET fecha_nac = '8/4/1976'
WHERE id = 6;
-- 2.7 El partido entre el Villatrabuco y el Formeñosa quedó finalmente 3-1. --
UPDATE partidos
SET goles_casa = 3,
	goles_fuera = 1
WHERE id = 2;

-- 3. DELETE (Eliminar registros) --
-- 3.1 Eliminar el jugador más veterano de la liga --
DELETE FROM jugadores 
ORDER BY fecha_nac LIMIT 1;

-- 3.2 Eliminar todos los jugadores del Villatortas --
DELETE FROM jugadores
WHERE equipo_id = 2;

-- 3.3 Eliminar todos los jugadores que nacieron en 1970 --
DELETE FROM jugadores
WHERE year (fecha_nac) = 1970;

-- 3.4 Eliminar todos los goles marcados por el Valdeajos como local --
