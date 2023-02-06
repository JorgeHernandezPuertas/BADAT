/*
ESQUEMA RELACIONAL:
CIUDADANOS(pk(idciudadano), nombre, ape1, ape2, nif, edad),
GRUPOS(PK(idgrupo), nombre, curso),
DEPTOS(pk(iddepto), descrip),
ASIGNATURAS(PK(idasignatura), nombre, descrip),
ALUMNOS(PK(idAlumno), idciudadano*, idgrupo*),
PROFESORES(PK(iddepto*, idprof), idciudadano*),
IMPARTEN(PK([iddepto, idprof]*, idgrupo*, idasignatura*, fecini), fecfin, observaciones)
*/
-- Creo la base de datos
CREATE DATABASE IF NOT EXISTS INSTITUTO;
USE INSTITUTO; -- Uso la base de datos creada
-- Creo las tablas por orden según el esquema relacional
-- CIUDADANOS(pk(idciudadano), nombre, ape1, ape2, nif, edad)
CREATE TABLE IF NOT EXISTS ciudadanos
(
	idciudadano INT UNSIGNED NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    ape1 VARCHAR(30) NOT NULL,
    ape2 VARCHAR(30) NULL,
    nif CHAR(9) NOT NULL,
    CONSTRAINT pk_ciudadanos PRIMARY KEY (idciudadano)
);
-- GRUPOS(PK(idgrupo), nombre, curso)
CREATE TABLE IF NOT EXISTS grupos
(
	idgrupo INT UNSIGNED NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    curso VARCHAR(30) NOT NULL,
    CONSTRAINT pk_grupos PRIMARY KEY (idgrupo)
);
-- DEPTOS(pk(iddepto), descrip)
CREATE TABLE IF NOT EXISTS deptos
(
	iddepto INT UNSIGNED NOT NULL,
    descrip VARCHAR(60) NOT NULL,
    CONSTRAINT pk_deptos PRIMARY KEY (iddepto)
);
-- ASIGNATURAS(PK(idasignatura), nombre, descrip)
CREATE TABLE IF NOT EXISTS asignaturas
(
	idasignatura INT UNSIGNED NOT NULL,
    nombre VARCHAR(60) NOT NULL,
    descrip VARCHAR(200) NOT NULL,
    CONSTRAINT pk_asignaturas PRIMARY KEY (idasignatura)
);
-- ALUMNOS(PK(idAlumno), idciudadano*, idgrupo*)
CREATE TABLE IF NOT EXISTS alumnos
(
	idalumno INT UNSIGNED NOT NULL,
    idciudadano INT UNSIGNED NOT NULL,
    idgrupo INT UNSIGNED NOT NULL,
    CONSTRAINT pk_alumnos PRIMARY KEY (idalumno),
    CONSTRAINT fk_alumnos_ciudadanos FOREIGN KEY (idciudadano) REFERENCES ciudadanos(idciudadano)
		ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_alumnos_grupos FOREIGN KEY (idgrupo) REFERENCES grupos(idgrupo)
		ON DELETE NO ACTION ON UPDATE CASCADE
);
-- PROFESORES(PK(iddepto*, idprof), idciudadano*)
CREATE TABLE IF NOT EXISTS profesores
(
	iddepto INT UNSIGNED NOT NULL,
    idprof INT UNSIGNED NOT NULL,
    idciudadano INT UNSIGNED NOT NULL,
    CONSTRAINT pk_profesores PRIMARY KEY (iddepto, idprof),
    CONSTRAINT fk_profesores_ciudadanos FOREIGN KEY (idciudadano) REFERENCES ciudadanos(idciudadano)
		ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_profesores_deptos FOREIGN KEY (iddepto) REFERENCES deptos(iddepto)
		ON DELETE NO ACTION ON UPDATE CASCADE
);
-- IMPARTEN(PK([iddepto, idprof]*, idgrupo*, idasignatura*, fecini), fecfin, observaciones)
CREATE TABLE IF NOT EXISTS imparten
(
	iddepto INT UNSIGNED NOT NULL,
    idprof INT UNSIGNED NOT NULL,
    idgrupo INT UNSIGNED NOT NULL,
    idasignatura INT UNSIGNED NOT NULL,
    fecini DATE NOT NULL,
    fecfin DATE NULL,
    observaciones VARCHAR(200) NULL,
    CONSTRAINT pk_imparten PRIMARY KEY (iddepto, idprof, idgrupo, idasignatura, fecini),
    CONSTRAINT fk_imparten_profesores FOREIGN KEY (iddepto, idprof) REFERENCES profesores(iddepto, idprof)
		ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_imparten_grupos FOREIGN KEY (idgrupo) REFERENCES grupos(idgrupo)
		ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_imparten_asignatura FOREIGN KEY (idasignatura) REFERENCES asignaturas(idasignatura)
		ON DELETE NO ACTION ON UPDATE CASCADE
);