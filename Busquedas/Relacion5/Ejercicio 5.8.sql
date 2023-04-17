/*
8. En el nombre de los productos, sustituir “tarta” por “pastel”.
*/
/* Inserto el procuto que se llame tarta de queso para que haya alguno ->
INSERT INTO productos (codproducto, descripcion, codcategoria)
VALUES (500, "tarta de queso", 1);
*/

SELECT replace(descripcion, "tarta", "pastel")
FROM productos
WHERE descripcion LIKE "%tarta%";