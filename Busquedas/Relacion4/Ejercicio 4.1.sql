-- Relacion 4 ejercicio 1

DROP PROCEDURE IF EXISTS ejer4_1;
DELIMITER €€
CREATE PROCEDURE ejer4_1()
	BEGIN
		SELECT CONCAT_WS(" ", nomem, ape1em, ape2em) as nombre, salarem as sueldo
        FROM empleados
        WHERE numhiem >= 3
        ORDER BY nombre;
    END €€
DELIMITER ;
CALL ejer4_1();