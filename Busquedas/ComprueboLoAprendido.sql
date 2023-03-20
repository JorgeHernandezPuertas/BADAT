/* Rutina que dado un numero de departamento duelve 
el presupuesto del mismo */
DROP FUNCTION IF EXISTS presu_depar;
CREATE FUNCTION presu_depar(numero INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
	RETURN (SELECT presude FROM departamentos
    WHERE numde = numero);


/* Rutina que dado un numero de empleado devuelve 
su fecha de ingreso en la empresa y el nombre de su director */
DROP PROCEDURE IF EXISTS fecIni_Dir;
DELIMITER €€
CREATE PROCEDURE fecIni_Dir(numero INT, OUT fecIngreso DATE,
OUT nombreDir VARCHAR(20))
	BEGIN
		-- Fecha inicio empresa
		SELECT fecinem FROM empleados WHERE numem = numero;
        -- nombre del director
        SELECT aux.nomem FROM empleados JOIN dirigir ON numde = numdepto
        JOIN empleados as aux ON dirigir.numempdirec = aux.numem
        WHERE empleados.numem = numero AND fecfindir IS NULL;
    END€€
DELIMITER ;

/* Rutina que muestra el nombre de todos los empleados y el 
nombre del ultimo departamento que ha dirigido (si ha dirigido) */
DROP PROCEDURE IF EXISTS empleadosDirigir;
DELIMITER €€
CREATE PROCEDURE empleadosDirigir()
	BEGIN
		SELECT nomem, nomde FROM empleados LEFT JOIN dirigir ON empleados.numem = dirigir.numempdirec
        LEFT JOIN departamentos ON dirigir.numdepto = departamentos.numde AND fecfindir IS NULL;
	END €€
DELIMITER ;

CALL empleadosDirigir();