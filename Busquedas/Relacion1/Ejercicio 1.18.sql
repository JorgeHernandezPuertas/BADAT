/* Relacion 1 ejercicio 18 */
DROP PROCEDURE IF EXISTS ejer18;
DELIMITER €€
CREATE PROCEDURE ejer18(IN fechaIni DATE, IN fechaFin DATE)
	BEGIN
		SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
		WHERE fecinem >= fechaIni AND fecinem <= fechaFin;
    END €€
DELIMITER ;