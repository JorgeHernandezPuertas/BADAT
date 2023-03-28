/* Relacion 3 ejercicio 4 */
DROP PROCEDURE IF EXISTS ejer3_4;
DELIMITER €€
CREATE PROCEDURE ejer3_4()
	BEGIN
		SELECT MAX(salarem) as SalarioMaximo, MIN(salarem) as SalarioMinimo, AVG(salarem) as SalarioMedio, nomde
        FROM empleados 
			JOIN departamentos ON empleados.numde = departamentos.numde
		WHERE nomde = "Organización";
    END €€
DELIMITER ;
CALL ejer3_4();