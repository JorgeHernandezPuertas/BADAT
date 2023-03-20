/* Relacion 1 Ejercicio 10 */
SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
WHERE interval(fecinem, curdate()) >= 1 AND interval(fecinem, curdate()) <= 3;