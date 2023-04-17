/*
14. Obtén el 10 por ciento del precio de los productos 
redondeados a dos decimales.
*/

SELECT round(0.1*preciounidad, 2) as "10%"
FROM productos;