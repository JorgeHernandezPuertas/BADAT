-- Relacion 4 ejercicio 4

DROP PROCEDURE IF EXISTS ejer4_4;
DELIMITER €€
CREATE PROCEDURE ejer4_4()
	BEGIN
		SELECT CONCAT_WS(" ", nomem, ape1em, ape2em) as nombre, numem as numero, extelem as extension
        FROM empleados
        WHERE numde = 121
        ORDER BY nombre;
    END €€
DELIMITER ;
CALL ejer4_4();