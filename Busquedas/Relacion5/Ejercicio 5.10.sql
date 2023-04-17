/*
10. Obtén el número de productos de cada categoría, 
haz que el nombre de la categoría se muestre en mayúsculas.
*/

SELECT count(codproducto) as numProductos, upper(Nomcategoria) as categoria
FROM productos
	JOIN categorias
		ON productos.codcategoria = categorias.codcategoria
GROUP BY categoria;