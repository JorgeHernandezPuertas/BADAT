/*
5. Obtener el cuadrado y el cubo de los precios de los productos.
*/

SELECT preciounidad, pow(preciounidad, 2), pow(preciounidad, 3)
FROM productos;