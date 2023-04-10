/* Relacion 3 ejercicio 10 */

DROP PROCEDURE IF EXISTS ejer3_10;
DELIMITER €€
CREATE PROCEDURE ejer3_10(numdepar INT)
	BEGIN
		SELECT DISTINCT COUNT(extelem) as num_exs
        FROM empleados
		WHERE numde = numdepar;
    END €€
DELIMITER ;
CALL ejer3_10(110);