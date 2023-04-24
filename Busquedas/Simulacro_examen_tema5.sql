-- Simulacro examen

/*
1. Queremos saber el importe de las ventas de artículos a 
cada uno de nuestros clientes (muestra el nombre). 
Queremos que cada cliente se muestre una sola vez y 
que aquellos a los que hayamos vendido más se muestren primero.
*/

SELECT concat_ws(" ", nomcli, ape1cli, ape2cli) as nombre, sum(precioventa) as gastado_total
FROM clientes
	JOIN ventas ON ventas.codcli = clientes.codcli
		JOIN detalleventa ON ventas.codventa = detalleventa.codventa
GROUP BY nombre
ORDER BY gastado_total;

/*
2. Muestra un listado de todos los artículos vendidos, 
queremos mostrar la descripción del artículo y 
entre paréntesis la descripción de la categoría 
a la que pertenecen y la fecha de la venta con el 
formato “march - 2016, 1 (tuesday)”. Haz que se 
muestren todos los artículos de la misma categoría juntos.
*/

