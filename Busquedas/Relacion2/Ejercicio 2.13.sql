/* Relacion 2 ejercicio 13 */
DROP PROCEDURE IF EXISTS ejer2_13;
DELIMITER €€
CREATE PROCEDURE ejer2_13(nombre VARCHAR(20), apellido VARCHAR(20))
	BEGIN
		SELECT empleados.extelem, nomce, concat_ws(" ", aux.nomem, aux.ape1em)
        FROM empleados 
			JOIN departamentos 
				ON empleados.numde = departamentos.numde
			JOIN centros 
				ON centros.numce = departamentos.numce
			JOIN dirigir
				ON departamentos.numde = dirigir.numdepto
			JOIN empleados as aux
				ON dirigir.numempdirec = aux.numem
		WHERE empleados.nomem = nombre AND empleados.ape1em = apellido;
    END €€
DELIMITER ;
CALL ejer2_13("Juan", "López");
/*SELECT empleados.extelem, nomce FROM empleados 
	JOIN departamentos 
		ON empleados.numde = departamentos.numde
	JOIN centros 
		ON centros.numce = departamentos.numce
WHERE nomem = "Antonio" AND ape1em = "López";
SELECT CONCAT_WS(" ", nomem, ape1em), nomde FROM departamentos
JOIN dirigir ON numde = numdepto
JOIN empleados ON numempdirec = numem;*/