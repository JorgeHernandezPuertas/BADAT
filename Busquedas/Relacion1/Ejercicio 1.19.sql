/* Relacion 1 Ejercicio 19 */
DROP PROCEDURE IF EXISTS ejer19;
DELIMITER €€
CREATE PROCEDURE ejer19(IN fechaIni DATE, IN fechaFin DATE)
	BEGIN
		SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
		WHERE fecinem <= fechaIni or fecinem >= fechaFin;
	END €€
DELIMITER ;