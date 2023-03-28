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
		SELECT empleados.fecinem, aux.nomem into fecIngreso, nombreDir FROM empleados JOIN departamentos ON empleados.numde = departamentos.numde
        JOIN dirigir ON dirigir.numdepto = departamentos.numde JOIN empleados as aux ON aux.numem = dirigir.numempdirec AND (fecfindir IS NULL OR fecfindir >= curdate())
        WHERE empleados.numem = numero;
    END€€
DELIMITER ;
CALL fecIni_Dir(510, @fecha, @director);
SELECT @fecha, @director; 
/* Rutina que muestra el nombre de todos los empleados y el 
nombre del ultimo departamento que ha dirigido (si ha dirigido) */
DROP PROCEDURE IF EXISTS empleadosDirigir;
DELIMITER €€
CREATE PROCEDURE empleadosDirigir()
	BEGIN
		SELECT nomem, nomde 
        FROM empleados 
			LEFT JOIN dirigir ON empleados.numem = dirigir.numempdirec
				LEFT JOIN departamentos ON dirigir.numdepto = departamentos.numde 
					AND (fecfindir IS NULL OR fecfindir >= curdate());
	END €€
DELIMITER ;

CALL empleadosDirigir();