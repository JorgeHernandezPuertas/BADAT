-- Relacion 4 ejercicio 2

DROP PROCEDURE IF EXISTS ejer4_2;
DELIMITER €€
CREATE PROCEDURE ejer4_2()
	BEGIN
		SELECT comisem as comision, numde as departamento, CONCAT_WS(" ", nomem, ape1em, ape2em) as nombre
        FROM empleados
        WHERE salarem <= 190000
        ORDER BY numde, comisem DESC;
    END €€
DELIMITER ;
CALL ejer4_2();