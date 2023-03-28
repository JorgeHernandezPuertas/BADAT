/* Relacion 2 ejercicio 14 */
DROP PROCEDURE IF EXISTS ejer2_14;
DELIMITER €€
CREATE PROCEDURE ejer2_14(numeroCen INT)
	BEGIN
		SELECT CONCAT_WS(" ", nomem, ape1em, ape2em)
        FROM empleados
			JOIN departamentos ON empleados.numde = departamentos.numde
            JOIN centros ON departamentos.numce = centros.numce
		WHERE centros.numce = numeroCen;
    END €€
DELIMITER ;
CALL ejer2_14(10);