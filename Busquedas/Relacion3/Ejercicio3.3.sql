/* Relacion 3 ejercicio 3 */
DROP PROCEDURE IF EXISTS ejer3_3;
DELIMITER €€
CREATE PROCEDURE ejer3_3()
	BEGIN
		SELECT AVG(salarem) FROM empleados;
    END €€
DELIMITER ;
CALL ejer3_3();