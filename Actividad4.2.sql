USE ACTIVIDAD4;

-- Creo la tabla turnos para poder crear la relación N,M,P llamada vigilar (que tendrá su propia tabla de relación concatenada)
CREATE TABLE IF NOT EXISTS turnos
(
	codturno INT UNSIGNED,
    horainiturno TIME,
    horafinturno TIME,
    CONSTRAINT pk_turnos PRIMARY KEY (codturno)
);
-- Creo la tabla que sale de la relación concatenada vigilar
CREATE TABLE IF NOT EXISTS vigilar
(
    codsala INT UNSIGNED,
    codseguridad INT UNSIGNED,
    codturno INT UNSIGNED,
    fecini DATETIME,
    fecfin DATETIME,
    CONSTRAINT pk_vigilar PRIMARY KEY (codsala, codseguridad, codturno, fecini),
    CONSTRAINT fk_vigilar_salas FOREIGN KEY (codsala) REFERENCES salas(codsala),
	CONSTRAINT fk_vigilar_seguridad FOREIGN KEY (codseguridad) REFERENCES seguridad(codseguridad),
	CONSTRAINT fk_vigilar_turnos FOREIGN KEY (codturno) REFERENCES turnos(codturno)
);
-- Elimino la relación entre vigilantes y salas porque con la tabla anterior ya no me hace falta
ALTER TABLE seguridad 
	DROP CONSTRAINT fk_seguridad_salas,
	DROP COLUMN codsala;