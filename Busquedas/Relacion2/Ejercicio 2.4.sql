/* Relacion 2 ejercicio 4 */
SELECT extelem, nomce FROM empleados JOIN departamentos 
	ON empleados.numde = departamentos.numde
    JOIN centros ON departamentos.numce = centros.numce
WHERE nomem = "Juan" and ape1em = "López";