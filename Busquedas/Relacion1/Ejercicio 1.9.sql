/* Relacion 1 Ejercicio 9 */
SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
WHERE interval(fecinem, curdate()) >= 1;