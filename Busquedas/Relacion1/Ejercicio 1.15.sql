/* Relacion 1 Ejercicio 15 */
DROP PROCEDURE IF EXISTS ejer15;
DELIMITER €€
CREATE PROCEDURE ejer15(IN cantidad INT)
	BEGIN
		SELECT nomde FROM departamentos
		WHERE presude > cantidad;
    END €€
DELIMITER ;