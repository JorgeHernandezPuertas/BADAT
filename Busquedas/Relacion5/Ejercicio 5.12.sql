/*
12. Asegúrate de que los nombres de los productos
no tengan espacios en blanco al principio o al final de dicho nombre.
*/

SELECT trim(descripcion)
FROM productos;