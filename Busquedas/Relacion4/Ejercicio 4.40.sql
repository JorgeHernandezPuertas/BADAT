/*
40. Para la base de datos de turismo rural, 
queremos obtener las casas disponibles para 
una zona y un rango de fecha dados.
*/

DROP PROCEDURE IF EXISTS ejer4_40;

DELIMITER €€
CREATE PROCEDURE ejer4_40(zona INT, fecIni DATE, fecFin DATE)
	BEGIN
		SELECT casas.codcasa as numero, nomcasa as casa
        FROM casas
		WHERE (codcasa NOT IN (SELECT codcasa
								FROM reservas
                                WHERE ((DATE_ADD(feciniestancia, INTERVAL numdiasestancia DAY) BETWEEN fecIni AND fecFin)
										OR (feciniestancia BETWEEN fecIni AND fecIni) OR (DATE_ADD(feciniestancia, INTERVAL numdiasestancia DAY) >= fecFin ) 
                                        AND fecanulacion IS NULL))
				AND codzona = zona;
    END €€
DELIMITER ;
CALL ejer4_40(1, "2012/03/22", "2012/03/25");
SELECT codcasa, feciniestancia, numdiasestancia
FROM reservas;