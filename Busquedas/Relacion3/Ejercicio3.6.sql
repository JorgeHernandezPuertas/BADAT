/* Relacion 3 ejercicio 6 */
DROP PROCEDURE IF EXISTS ejer3_6;
DELIMITER €€
CREATE PROCEDURE ejer3_6(nombreDepar VARCHAR(40))
	BEGIN
		SELECT SUM(salarem) as CosteSalarios, nomde
        FROM empleados
			JOIN departamentos ON empleados.numde = departamentos.numde
		WHERE nomde = nombreDepar
        GROUP BY nomde;
    END €€
DELIMITER ;
CALL ejer3_6("Organización");