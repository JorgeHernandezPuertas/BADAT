/* Relacion 3 ejercicio 7 */
DROP PROCEDURE IF EXISTS ejer3_7;
DELIMITER €€
CREATE PROCEDURE ejer3_7()
	BEGIN
		SELECT SUM(presude) as presu_total FROM departamentos;
    END €€
DELIMITER ;
CALL ejer3_7();