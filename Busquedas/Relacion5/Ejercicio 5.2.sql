/* 
2. Se ha diseñado un sistema para que los 
proveedores puedan acceder a ciertos datos, 
la contraseña que se les da es el teléfono 
de la empresa al revés. Se pide elaborar un 
procedimiento almacenado que dado un proveedor 
obtenga su contraseña y la muestre en los resultados.
*/

DROP PROCEDURE IF EXISTS ejer5_2;
DELIMITER €€
CREATE PROCEDURE ejer5_2(proveedor INT)
	BEGIN
		SELECT reverse(telefono)
        FROM proveedores
        WHERE codproveedor = proveedor;
    END €€
DELIMITER ;
CALL ejer5_2(1);