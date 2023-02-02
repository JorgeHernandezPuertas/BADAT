#CREATE DATABASE BDCLASES;
#USE BDCLASES; Esta linea de código es para empezar a usar la BD que pongas a continuacion del USE.
CREATE  TABLE IF NOT EXISTS DEPTOS
/* UNSIGNED es para que no tengan signos los números (como un ABS), NOT NULL es que no permite NULL ese campo y 
DEFAULT es el valor por defecto que se le da al crearlo si no introduce el valor al almacenarlo */
(
	coddepto INT UNSIGNED NOT NULL,  #PRIMARY KEY
    nomdepto VARCHAR(30),
    CONSTRAINT pk_deptos PRIMARY KEY (coddepto)
);

CREATE  TABLE IF NOT EXISTS PROFESORADO
(
	coddepto INT UNSIGNED NOT NULL,  #PRIMARY KEY
    codprof INT UNSIGNED NOT NULL, #PRIMARY KEY
    nomprof VARCHAR(30) NOT NULL,
    ape1prof VARCHAR(30) NOT NULL,
    ape2prof VARCHAR(30) NULL,
    fecincorporacion DATE NULL,
    codpostal CHAR(5) NULL,
    telefono CHAR(9) NULL,
    CONSTRAINT pk_profesorado PRIMARY KEY (coddepto, codprof),
    CONSTRAINT fk_profesorado_deptos FOREIGN KEY (coddepto) REFERENCES DEPTOS(coddepto)
		ON DELETE NO ACTION ON UPDATE CASCADE # Cuando se borra no hacemos nada y cuando se actualiza CASCADE(mirar que es cascade)
);
CREATE TABLE IF NOT EXISTS ASIGNATURAS
	(
    codasigna INT UNSIGNED NOT NULL,
    nomasigna VARCHAR(30) NOT NULL,
    curso VARCHAR(20) NOT NULL,
    CONSTRAINT pk_asignaturas PRIMARY KEY (codasigna)
    );
CREATE TABLE IF NOT EXISTS IMPARTIR
	(
	codasigna INT UNSIGNED NOT NULL,
    coddepto INT UNSIGNED NOT NULL,
    codprof INT UNSIGNED NOT NULL,
    observa VARCHAR(100) NULL,
    CONSTRAINT pk_impartir PRIMARY KEY (codasigna, codprof, coddepto),
    CONSTRAINT fk_impartir_asignaturas FOREIGN KEY (codasigna) REFERENCES ASIGNATURAS(codasigna)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_impartir_profesorado FOREIGN KEY (coddepto, codprof) REFERENCES PROFESORADO(coddepto, codprof)
		ON DELETE NO ACTION ON UPDATE CASCADE
    );