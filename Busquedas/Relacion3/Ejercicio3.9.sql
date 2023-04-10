/* Relacion 3 ejercicio 9 */

DROP PROCEDURE IF EXISTS ejer3_9;
DELIMITER €€
CREATE PROCEDURE ejer3_9()
	BEGIN
		SELECT DISTINCT extelem FROM empleados;
    END €€

DELIMITER ;
CALL ejer3_9();