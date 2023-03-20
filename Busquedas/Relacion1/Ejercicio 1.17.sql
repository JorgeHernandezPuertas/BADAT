/* Relacion 1 ejercicio 17 */
DROP PROCEDURE IF EXISTS ejer17;
DELIMITER €€
CREATE PROCEDURE ejer17(IN fecha DATE)
	BEGIN
		SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
		WHERE fecinem = fecha;
    END €€
DELIMITER ;