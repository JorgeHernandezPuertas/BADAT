/* Relacion 2 ejercicio 5 */
SELECT concat(nomem, " ", ape1em, " ", ifnull(ape2em,"")) FROM empleados JOIN departamentos ON empleados.numde = departamentos.numde
WHERE nomde = "Personal" OR nomde = "Finanzas";