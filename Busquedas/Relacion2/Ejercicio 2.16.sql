/* Relacion 2 ejercicio 16 */
DROP PROCEDURE IF EXISTS ejer2_16;
DELIMITER €€
CREATE PROCEDURE ejer2_16(centro VARCHAR(60))
	BEGIN
		SELECT nomde, presude FROM departamentos
			JOIN centros ON departamentos.numce = centros.numce
		WHERE nomce = centro;
    END €€
DELIMITER ;
CALL ejer2_16(" SEDE CENTRAL");