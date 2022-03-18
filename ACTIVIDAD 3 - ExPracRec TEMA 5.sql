USE gescomercial;

ALTER TABLE Rondas
ADD COLUMN nivel INT UNSIGNED CHECK(nivel>32);

ALTER TABLE Categorias
CHANGE imagen foto VARCHAR(20);

ALTER TABLE Premios
ADD CONSTRAINT importe CHECK(importe>10000);

ALTER TABLE Jueces
ADD COLUMN fecha_nac DATE NOT NULL,
ADD COLUMN edad TINYINT NOT NULL,
ADD COLUMN pais VARCHAR(30) NOT NULL,
ADD COLUMN lugar_nac VARCHAR(30) NOT NULL;

ALTER TABLE Jugadores
ADD COLUMN direccion VARCHAR(30),
ADD COLUMN apellidos VARCHAR(30),
DROP COLUMN codigo;

ALTER TABLE Participantes
CHANGE id_jugador id_jugador INT UNSIGNED NOT NULL UNIQUE,
CHANGE id_categoria id_categoria INT UNSIGNED NOT NULL UNIQUE,
CHANGE id_jugador id_jugador INT UNSIGNED NOT NULL,
CHANGE id_categoria id_categoria INT UNSIGNED NOT NULL;

CREATE INDEX ind_jugadores ON campo(paises);
CREATE INDEX ind_jueces ON nombre(jueces);
CREATE INDEX ind_jugadores ON apellidos(jugadores);
CREATE INDEX ind_jugadores ON nombre(jugadores);