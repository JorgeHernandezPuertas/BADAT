/*
15. Muestra un listado de productos en que aparezca 
el nombre del producto y el código de producto y 
el de categoría repetidos (por ejemplo para la 
tarta de azucar se mostrará “623623”).
*/

SELECT descripcion as nombre, repeat(concat(codproducto, codcategoria), 2) as numeroRepetido
FROM productos;