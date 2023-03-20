/* Relacion 1 Ejercicio 13 */
/* a) */
DROP PROCEDURE IF EXISTS ejer13_a;
DELIMITER €€
CREATE PROCEDURE ejer13_a(IN numHijos int)
	BEGIN
		SELECT concat(nomem, " ",  ape1em, "", ifnull(ape2em, " ")) FROM empleados
		WHERE numhiem >= numHijos;
    END €€
DELIMITER ;

/* b) */
DROP PROCEDURE IF EXISTS ejer13_b;
DELIMITER €€
CREATE PROCEDURE ejer13_b(IN minNumHijos int, IN maxNumHijos int)
	BEGIN
		SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
		WHERE numhiem >= minNumHijos AND numhiem <= maxNumHijos;
    END €€
DELIMITER ;