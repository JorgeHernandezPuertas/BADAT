/* Relacion 3 ejercicio 11 */

DROP PROCEDURE IF EXISTS ejer3_11;
DELIMITER €€
CREATE PROCEDURE ejer3_11()
	BEGIN
		SELECT DISTINCT COUNT(extelem) as num_exs, numde
        FROM empleados
		GROUP BY numde;
    END €€
DELIMITER ;
CALL ejer3_11();