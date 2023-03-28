/* Relacion 3 ejercicio 2 */
DROP PROCEDURE IF EXISTS ejer3_2;
DELIMITER €€
CREATE PROCEDURE ejer3_2()
	BEGIN
		SELECT MIN(salarem) FROM empleados;
    END €€
DELIMITER ;
CALL ejer3_2();