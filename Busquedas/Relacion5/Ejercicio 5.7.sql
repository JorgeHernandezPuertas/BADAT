/*
7. Para los pedidos entregados el mismo mes 
que el actual, obtener cuantos días hace que se entregaron.
*/

SELECT datediff(fecentrega, curdate())
FROM pedidos
WHERE month(curdate()) = month(fecentrega)
	AND fecentrega <= curdate();