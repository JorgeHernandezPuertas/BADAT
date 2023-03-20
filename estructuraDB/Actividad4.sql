/*
tipoobras(pk(codtipobra), nombretipo, descrip)
artistas(pk(codartista), nombre, apellido1, apellido2)
estilos(pk(codestilo), nombreestilo, descrip)
empleados(pk(codempleado), nombre, apellido1, apellido2, sueldo)
salas(pk(codsala), nombresala)
seguridad(pk(codseguridad), codempleado*, codsala*, turno)
restauradores(pk(codrestaurador), codempleado*)
obras(pk(codobra), codtipoobra*, codartista*, codestilo*, codsala*, nombreobra, descrip)
restauraciones(pk(codobra*, codrestaurador*, fecinirest), fecfinrest, observaciones)
*/

CREATE DATABASE IF NOT EXISTS ACTIVIDAD4;
USE ACTIVIDAD4;
/*tipoobras(pk(codtipobra), nombretipo, descrip)*/
CREATE TABLE IF NOT EXISTS tipoobras
(
	codtipoobra INT UNSIGNED NOT NULL,
    nombretipo VARCHAR(60) NULL,
    descrip VARCHAR(200) NOT NULL,
    CONSTRAINT pk_tipoobras PRIMARY KEY (codtipoobra)
);
/*artistas(pk(codartista), nombre, apellido1, apellido2)*/
CREATE TABLE IF NOT EXISTS artistas
(
	codartista INT UNSIGNED NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60) NULL,
    CONSTRAINT pk_artistas PRIMARY KEY (codartista)
);
/*estilos(pk(codestilo), nombreestilo, descrip)*/
CREATE TABLE IF NOT EXISTS estilos
(
	codestilo INT UNSIGNED NOT NULL,
    nombreestilo VARCHAR(60) NOT NULL,
    descrip VARCHAR(200) NOT NULL,
    CONSTRAINT pk_estilos PRIMARY KEY (codestilo)
);
/*empleados(pk(codempleado), nombre, apellido1, apellido2, sueldo)*/
CREATE TABLE IF NOT EXISTS empleados
(
	codempleado INT UNSIGNED NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60) NULL,
    sueldo DECIMAL(6,2) NOT NULL,
    CONSTRAINT pk_empleados PRIMARY KEY (codempleado)
);
/*salas(pk(codsala), nombresala)*/
CREATE TABLE IF NOT EXISTS salas
(
	codsala INT UNSIGNED NOT NULL,
    nombresala VARCHAR(60) NOT NULL,
    CONSTRAINT pk_salas PRIMARY KEY (codsala)
);
/*seguridad(pk(codseguridad), codempleado*, codsala*, turno)*/
CREATE TABLE IF NOT EXISTS seguridad
(
	codseguridad INT UNSIGNED NOT NULL,
    codempleado INT UNSIGNED NOT NULL,
    codsala INT UNSIGNED NOT NULL,
    CONSTRAINT pk_seguridad PRIMARY KEY (codseguridad),
    CONSTRAINT fk_seguridad_empleados FOREIGN KEY (codempleado) REFERENCES empleados(codempleado)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_seguridad_salas FOREIGN KEY (codsala) REFERENCES salas(codsala)
		ON DELETE NO ACTION ON UPDATE CASCADE
);
/*restauradores(pk(codrestaurador), codempleado*)*/
CREATE TABLE IF NOT EXISTS restauradores
(
	codrestaurador INT UNSIGNED NOT NULL,
    codempleado INT UNSIGNED NOT NULL,
    CONSTRAINT pk_restauradores PRIMARY KEY (codrestaurador),
    CONSTRAINT fk_restauradores_empleados FOREIGN KEY (codrestaurador) REFERENCES empleados(codempleado)
		ON DELETE NO ACTION ON UPDATE CASCADE
);
/*obras(pk(codobra), codtipoobra*, codartista*, codestilo*, codsala*, nombreobra, descrip)*/
CREATE TABLE IF NOT EXISTS obras
(
	codobra INT UNSIGNED NOT NULL,
    codtipoobra INT UNSIGNED NOT NULL,
    codartista INT UNSIGNED NOT NULL,
    codestilo INT UNSIGNED NOT NULL,
    codsala INT UNSIGNED NOT NULL,
    nombreobra VARCHAR(60) NULL,
    descrip VARCHAR(200) NOT NULL,
    CONSTRAINT pk_obras PRIMARY KEY (codobra),
    CONSTRAINT fk_obras_tipoobras FOREIGN KEY (codtipoobra) REFERENCES tipoobras(codtipoobra)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_obras_artistas FOREIGN KEY (codartista) REFERENCES artistas(codartista)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_obras_estilos FOREIGN KEY (codestilo) REFERENCES estilos(codestilo)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_obras_salas FOREIGN KEY (codsala) REFERENCES salas(codsala)
		ON DELETE NO ACTION ON UPDATE CASCADE
);
/*restauraciones(pk(codobra*, codrestaurador*), fecinirest, fecfinrest, observaciones)*/
CREATE TABLE IF NOT EXISTS restauraciones
(
	codobra INT UNSIGNED NOT NULL,
    codrestaurador INT UNSIGNED NOT NULL,
    fecinirest DATE NOT NULL,
    fecfinrest DATE NULL,
    observaciones VARCHAR(200) NULL,
    CONSTRAINT pk_restauraciones PRIMARY KEY (codobra, codrestaurador, fecinirest),
    CONSTRAINT fk_restauraciones_restauradores FOREIGN KEY (codrestaurador) REFERENCES restauradores(codrestaurador)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_restauraciones_obras FOREIGN KEY (codobra) REFERENCES obras(codobra)
		ON DELETE NO ACTION ON UPDATE CASCADE
);