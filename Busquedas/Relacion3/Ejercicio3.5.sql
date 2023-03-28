/* Relacion 3 ejercicio 5 */
DROP PROCEDURE IF EXISTS ejer3_5;
DELIMITER €€
CREATE PROCEDURE ejer3_5(nombreDepar VARCHAR(40))
	BEGIN
		SELECT MAX(salarem) as SalarioMaximo, MIN(salarem) as SalarioMinimo, AVG(salarem) as SalarioMedio, nomde
        FROM empleados
			JOIN departamentos ON empleados.numde = departamentos.numde
		WHERE nomde = nombreDepar
        GROUP BY nomde;
    END €€
DELIMITER ;
CALL ejer3_5("Organización");