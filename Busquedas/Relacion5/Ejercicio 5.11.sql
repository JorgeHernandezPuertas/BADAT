/*
11. Obtén un listado de productos por categoría y 
dentro de cada categoría del nombre de producto más corto al más largo.
*/

SELECT Nomcategoria as categoria, productos.descripcion as producto
FROM productos
	JOIN categorias
		ON productos.codcategoria = categorias.codcategoria
ORDER BY categoria, length(producto);