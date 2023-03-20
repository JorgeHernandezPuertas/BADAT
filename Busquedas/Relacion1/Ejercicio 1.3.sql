/* Relación 1 Ejercicio 3 */
SELECT concat(nomem, " ",  ape1em, "", ifnull(ape2em, " ")) FROM empleados
WHERE numhiem >= 1;