-- Relacion 4 ejercicio 3

DROP PROCEDURE IF EXISTS ejer4_3;
DELIMITER €€
CREATE PROCEDURE ejer4_3()
	BEGIN
		SELECT nomde as nombre 
        FROM departamentos
        JOIN dirigir 
			ON numde = numdepto
		WHERE trim(lcase(tipodir)) = "f";
    END €€
DELIMITER ;
CALL ejer4_3();