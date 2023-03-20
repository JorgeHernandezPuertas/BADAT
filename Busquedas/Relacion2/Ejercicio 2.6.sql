/* Relacion 2 ejercicio 6 */
SELECT nomem FROM empleados JOIN dirigir ON numempdirec = numem
	JOIN departamentos ON dirigir.numdepto = departamentos.numde
WHERE nomde = "Personal" AND fecfindir IS NULL;