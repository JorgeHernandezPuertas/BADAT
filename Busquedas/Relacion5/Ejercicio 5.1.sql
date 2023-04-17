-- 1. Obtener todos los productos 
-- que comiencen por una letra determinada.

DROP PROCEDURE IF EXISTS ejer5_1;
DELIMITER €€
CREATE PROCEDURE ejer5_1(letra char)
	BEGIN
		SELECT descripcion
        FROM productos
        WHERE descripcion LIKE CONCAT(lower(letra), "%");
    END €€
DELIMITER ;
CALL ejer5_1("t");