/* Relacion 2 ejercicio 12 */
drop procedure if exists emp_depar;
DELIMITER €€
CREATE PROCEDURE emp_depar(numdepart INT)
	BEGIN
		SELECT nomde, numem, empleados.numde, extelem, fecnaem, salarem, comisem, 
			numhiem, nomem, ape1em, ape2em, dniem, userem, passem
		FROM empleados
			JOIN departamentos ON empleados.numde = departamentos.numde AND (departamentos.numde = numdepart);
    END €€
DELIMITER ;

CALL emp_depar(111);