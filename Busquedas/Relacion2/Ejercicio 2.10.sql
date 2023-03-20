/* Relacion 2 ejercicio 10 */
SELECT CONCAT_WS(" ", nomem, ape1em, ape2em) FROM empleados 
JOIN dirigir ON empleados.numem = numempdirec
WHERE numdepto = 100;