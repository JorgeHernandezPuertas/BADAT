/* Relacion 2 ejercicio 15 */
DROP PROCEDURE IF EXISTS ejer2_15;
DELIMITER €€
-- Busca el director en esa fecha
CREATE PROCEDURE ejer2_15(depar VARCHAR(60), fecha DATE)
	BEGIN
		 SELECT CONCAT_WS(" ", nomem, ape1em, ape2em) 
         FROM empleados
			JOIN dirigir ON empleados.numem = numempdirec 
				AND (fecinidir <= fecha 
                AND (fecfindir IS NULL OR fecfindir >= fecha))
			JOIN departamentos ON numdepto = departamentos.numde
				AND nomde = depar;
    END €€
DELIMITER ;
CALL ejer2_15("Personal", curdate());