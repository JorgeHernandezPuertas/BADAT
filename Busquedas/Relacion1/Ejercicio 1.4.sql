/* Relación 1 ejercicio 4 */
SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
WHERE numhiem >= 1 AND numhiem <=3;