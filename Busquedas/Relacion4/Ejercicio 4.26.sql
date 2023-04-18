/*
26. Borrar de la tabla EMPLEADOS a los empleados 
cuyo salario (sin incluir la comisión) supere 
al salario medio de los empleados de su departamento.
*/

-- Creo la tabla temporal que necesito para comparar los datos de una misma tabla
CREATE TEMPORARY TABLE tmp (numde INT, media DECIMAL(7,2));

-- Inserto los datos que necesito de empleados a la tabla temporal para poder comparar
INSERT INTO tmp
SELECT numde, avg(salarem)
FROM empleados
GROUP BY numde;

-- Borro los datos usando la subquerie desde la tabla temporal
-- porque no se puede borrar una tabla con una subquerie de la misma tabla
DELETE FROM empleados
WHERE salarem >= (SELECT media
					FROM tmp
                    WHERE tmp.numde = empleados.numde);

-- Dropeo la tabla temporal que ya no voy a necesitar
DROP TEMPORARY TABLE tmp;