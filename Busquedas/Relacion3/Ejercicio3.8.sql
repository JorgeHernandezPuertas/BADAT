/* Relacion 3 ejercicio 8 */

DROP PROCEDURE IF EXISTS ejer3_8;
DELIMITER €€
CREATE PROCEDURE ejer3_8()
	BEGIN
		SELECT MAX(salarem) as sal_max, MIN(salarem) as sal_min, AVG(salarem) as sal_medio, numde
        FROM empleados
        GROUP BY numde;
    END €€

DELIMITER ;
CALL ejer3_8();