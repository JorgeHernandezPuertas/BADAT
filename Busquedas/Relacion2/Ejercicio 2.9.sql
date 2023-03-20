/* Relacion 2 ejercicio 9 */
SELECT DISTINCT extelem FROM empleados 
JOIN departamentos ON empleados.numde = departamentos.numde
WHERE nomde = "Finanzas";