/* Relacion 2 ejercicio 8 */
SELECT nomce FROM centros
JOIN (SELECT centros.numce as numcentro, SUM(presude) as suma FROM centros 
		JOIN departamentos ON centros.numce = departamentos.numce
        GROUP BY numcentro) as aux ON centros.numce = numcentro
WHERE suma >= 100000 AND suma <= 150000;