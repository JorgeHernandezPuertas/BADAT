/* Relacion 1 Ejercicio 12 */
DROP PROCEDURE IF EXISTS ejer12_a;
DELIMITER €€
CREATE PROCEDURE ejer12_a(IN nombre VARCHAR(20), IN apellido1 VARCHAR(20))
	DETERMINISTIC
    BEGIN
		SELECT extelem FROM empleados
		WHERE nomem = nombre AND ape1em = apellido1;
    END€€
DELIMITER ;