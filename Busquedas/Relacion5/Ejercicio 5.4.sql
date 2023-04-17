/*
4. Obtener un listado con todos los productos, 
ordenados por categoría, en el que se muestre 
solo las tres primeras letras de la categoría.
*/

SELECT productos.codcategoria, codproducto, substr(Nomcategoria FROM 1 FOR 3)
FROM categorias
	JOIN productos
		ON categorias.codcategoria = productos.codcategoria;