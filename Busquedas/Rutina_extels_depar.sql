-- Rutina que devuelve el número de extensiones telefónicas que utiliza un departamento dado
DROP FUNCTION IF EXISTS extenDepar;
DELIMITER €€
CREATE FUNCTION extenDepar(depar VARCHAR(40))
	RETURNS INT
	DETERMINISTIC
	BEGIN
		RETURN (
			SELECT COUNT(DISTINCT extelem)
			FROM empleados 
				JOIN departamentos ON empleados.numde = departamentos.numde
						AND nomde = depar
				);
	END €€
DELIMITER ;
SELECT extenDepar("DIRECCION GENERAL");