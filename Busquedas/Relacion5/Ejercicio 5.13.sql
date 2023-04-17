/*
13. Lo mismo que en el ejercicio 2, pero ahora, 
además, sustituye el 4 y 5 número del resultado 
por las 2 últimas letras del nombre de la empresa.
*/

DROP PROCEDURE IF EXISTS ejer5_13;
DELIMITER €€
CREATE PROCEDURE ejer5_13(proveedor INT)
	BEGIN
		SELECT replace(reverse(telefono), substr(reverse(telefono) FROM 4 FOR 2), substr(nomempresa, -2))
        FROM proveedores
        WHERE codproveedor = proveedor;
    END €€
DELIMITER ;
CALL ejer5_13(5);