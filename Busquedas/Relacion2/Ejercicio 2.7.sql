/* Relacion 2 ejercicio 7 */
SELECT nomde, presude FROM departamentos 
JOIN centros ON departamentos.numce = centros.numce
WHERE nomce = " SEDE CENTRAL";