-- Ejemplo INNER JOIN --
SELECT 
	corredores.id,
    corredores.nombre,
	corredores.apellidos,
    corredores.edad,
    corredores.club_id,
    club.id id_club,
    clubs_nombre Club
FROM
	corredores INNER JOIN 
	clubs ON corredores.club_id = clubs.id;