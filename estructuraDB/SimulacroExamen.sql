/*
tipoCasos(PK(idTipoCaso), desTipoCaso)
sujetos(PK(idSujeto), nombre, ape1, ape2, dni, dirPostal, email, telefono)
clientela(PK(idCliente), idSujeto*, estCivil)
abogados(PK(idAbogado), idSujeto*, numCol)
casos(PK(idCaso, idTipoCaso*), idCliente*, presupuesto, desc)
llevan(PK([idCaso, idTipoCaso]*, idAbogado*, fecinicio), numDias)
*/

CREATE DATABASE SIMULACRO;
USE SIMULACRO;

CREATE TABLE IF NOT EXISTS tipocasos
(
	idTipoCaso INT UNSIGNED NOT NULL,
	desTipoCaso VARCHAR(200) NOT NULL,
    CONSTRAINT pk_tipocasos PRIMARY KEY (idTipoCaso)
);

CREATE TABLE IF NOT EXISTS sujetos
(
	idSujeto INT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    ape1 VARCHAR(50) NOT NULL,
    ape2 VARCHAR(50) NULL,
    dni CHAR(9) NOT NULL,
    dirPostal VARCHAR(60) NOT NULL,
    email VARCHAR(60) UNIQUE NOT NULL,
    telefono CHAR(9),
    CONSTRAINT pk_sujetos PRIMARY KEY (idSujeto)
);

CREATE TABLE IF NOT EXISTS clientela
(
	idCliente INT UNSIGNED NOT NULL,
    idSujeto INT UNSIGNED NOT NULL,
    estCivil ENUM('S', 'C', 'D', 'V'),
    CONSTRAINT pk_clientela PRIMARY KEY (idCliente),
    CONSTRAINT fk_clientela_sujetos FOREIGN KEY (idSujeto) REFERENCES sujetos(idSujeto)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS abogados
(
	idAbogado INT UNSIGNED NOT NULL,
    idSujeto INT UNSIGNED NOT NULL,
    numCol CHAR(9) NOT NULL,
    CONSTRAINT pk_abogados PRIMARY KEY (idAbogado),
    CONSTRAINT fk_abogados_sujetos FOREIGN KEY (idSujeto) REFERENCES sujetos(idSujeto)
		ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS casos
(
	idCaso INT UNSIGNED NOT NULL,
    idTipoCaso INT UNSIGNED NOT NULL,
    
);