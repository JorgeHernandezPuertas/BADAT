/*
27. Disminuir en la tabla EMPLEADOS un 5% el salario de los 
empleados que superan el 50% del salario máximo de su departamento.
*/

-- Creo la tabla temporal que necesito para comparar los datos de una misma tabla
CREATE TEMPORARY TABLE temp (numde INT, maximo DECIMAL(7,2));

-- Inserto los datos que necesito de empleados a la tabla temporal para poder comparar
INSERT INTO temp (numde, maximo)
SELECT numde, max(salarem)
FROM empleados
GROUP BY numde;

-- Actualizo los datos usando la subquerie desde la tabla temporal
-- porque no se puede actualizar una tabla con una subquerie de la misma tabla
UPDATE empleados
SET salarem = 0.95*salarem
WHERE salarem >= (SELECT 0.5*maximo
					FROM temp
                    WHERE empleados.numde = temp.numde);

-- Dropeo la tabla temporal que ya no voy a necesitar
DROP TEMPORARY TABLE temp;