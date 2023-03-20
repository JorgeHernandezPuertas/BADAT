CREATE DATABASE IF NOT EXISTS ACTIVIDAD1;
USE ACTIVIDAD1;
CREATE TABLE IF NOT EXISTS centros
(
	numcentro INT UNSIGNED NOT NULL,
    nomcentro VARCHAR(60) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    CONSTRAINT pk_centros PRIMARY KEY (numcentro)
);


CREATE TABLE IF NOT EXISTS deptos
(
	numcentro INT UNSIGNED NOT NULL,
    numdepto INT UNSIGNED NOT NULL,
    presupuesto DECIMAL(9,2) NOT NULL,
    nomdepto VARCHAR(60) NOT NULL,
    dep INT UNSIGNED NOT NULL,
    centrodepen INT UNSIGNED NULL,
    deptodepen INT UNSIGNED NULL,
    CONSTRAINT pk_deptos PRIMARY KEY (numcentro, numdepto),
	CONSTRAINT fk_deptos_centros FOREIGN KEY (numcentro) REFERENCES centros(numcentro)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_deptos_deptos FOREIGN KEY (centrodepen,deptodepen) REFERENCES deptos(numcentro,numdepto)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS empleados
(
	numempleado INT UNSIGNED NOT NULL,
    numcentro INT UNSIGNED NOT NULL,
    numdepto INT UNSIGNED NOT NULL,
    extelefon CHAR(9) NOT NULL,
    fecnacim DATE NOT NULL,
    fecingreso DATE NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    comision DECIMAL(2,2) NOT NULL,
    numhijos INT UNSIGNED NULL,
    nomemp VARCHAR(60) NOT NULL,
    CONSTRAINT pk_empleados PRIMARY KEY (numempleado),
	CONSTRAINT fk_empleados_deptos FOREIGN KEY (numcentro, numdepto) REFERENCES deptos(numcentro, numdepto)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS dir
(
	numempleado INT UNSIGNED NOT NULL, 
    numcentro INT UNSIGNED NOT NULL,
    numdepto INT UNSIGNED NOT NULL,
    fecinidir DATE NOT NULL,
    fecfindir DATE NOT NULL,
    CONSTRAINT pk_dir PRIMARY KEY (numempleado, numcentro, numdepto),
    CONSTRAINT fk_dir_deptos FOREIGN KEY (numcentro,numdepto) REFERENCES deptos(numcentro,numdepto)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_dir_empleados FOREIGN KEY (numempleado) REFERENCES empleados(numempleado)
);