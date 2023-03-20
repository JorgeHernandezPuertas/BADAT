/* Relación 1 ejercicio 5 */
SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em, "")) FROM empleados
WHERE comisem IS NULL;