/* Relacion 1 ejercicio 16 */
DROP PROCEDURE IF EXISTS ejer16;
DELIMITER €€
CREATE PROCEDURE ejer16(IN cantidad INT)
	BEGIN
		SELECT nomde FROM departamentos
		WHERE presude >= cantidad;
    END €€
DELIMITER ;