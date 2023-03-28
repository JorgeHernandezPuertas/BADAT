/* Relacion 3 ejercicio 1 */
DROP PROCEDURE IF EXISTS ejer3_1;
DELIMITER €€
CREATE PROCEDURE ejer3_1()
	BEGIN
		SELECT MAX(salarem) as SalarioMaximo FROM empleados;
    END €€
DELIMITER ;
CALL ejer3_1();