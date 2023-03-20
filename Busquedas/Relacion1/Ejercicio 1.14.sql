/* Relacion 1 Ejercicio 14 */
DROP PROCEDURE IF EXISTS ejer14;
DELIMITER €€
CREATE PROCEDURE ejer14(IN nombreCentro VARCHAR(60))
	BEGIN
		SELECT dirce WHERE nomce = nombreCentro;
    END €€
DELIMITER ;