/* Relacion 1 Ejercicio 11 */
/* a) */
DROP PROCEDURE IF EXISTS ejer11_a;
DELIMITER €€
CREATE PROCEDURE ejer11_a()
	DETERMINISTIC
    
    BEGIN
		SELECT numem, numde, extelem, fecnaem, fecinem, salarem, comisem, numhiem, nomem, ape1em, ape2em, dniem, userem, passem FROM empleados;
	END €€
DELIMITER ;
/* b) */
DROP PROCEDURE IF EXISTS ejer11_b;
DELIMITER €€
CREATE PROCEDURE ejer11_b()
	DETERMINISTIC
    BEGIN
		SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
		WHERE comisem IS NULL;
    END €€
DELIMITER ;