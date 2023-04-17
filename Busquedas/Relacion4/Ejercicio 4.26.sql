/*
26. Borrar de la tabla EMPLEADOS a los empleados 
cuyo salario (sin incluir la comisión) supere 
al salario medio de los empleados de su departamento.
*/

DELETE FROM empleados
WHERE salarem >= (SELECT avg(salarem)
					FROM empleados as e2
                    WHERE empleados.numde = e2.numde)