CREATE DATABASE IF NOT EXISTS ACTIVIDAD3;
USE ACTIVIDAD3; /* Pongo esto para asegurarme de que estoy usando esta base de datos siempre */

CREATE TABLE IF NOT EXISTS ventas
(
	codventa INT UNSIGNED NOT NULL,
    fecventa DATE NOT NULL,
    nombrecliente VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NULL,
    CONSTRAINT pk_ventas PRIMARY KEY (codventa)
);

CREATE TABLE IF NOT EXISTS categorias
(
	numcat INT UNSIGNED NOT NULL,
    nomcategor VARCHAR(60) NOT NULL,
    nombreproveedor VARCHAR(20) NOT NULL,
    apellido1 VARCHAR(20) NOT NULL,
    apellido2 VARCHAR(20) NULL,
    CONSTRAINT pk_categorias PRIMARY KEY (numcat)
);

CREATE TABLE IF NOT EXISTS productos
(
	codcat INT UNSIGNED NOT NULL,
    refprod INT UNSIGNED NOT NULL,
    descripc VARCHAR(60) NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    CONSTRAINT pk_productos PRIMARY KEY (codcat, refprod),
    CONSTRAINT fk_productos_categorias FOREIGN KEY (codcat) REFERENCES categorias(numcat)
		ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS linventas
(
	codcat INT UNSIGNED NOT NULL,
    refprod INT UNSIGNED NOT NULL,
    codventa INT UNSIGNED NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    CONSTRAINT pk_linventas PRIMARY KEY (codcat, refprod, codventa),
    CONSTRAINT fk_linventas_ventas FOREIGN KEY (codventa) REFERENCES ventas(codventa)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_linventas_productos FOREIGN KEY (codcat, refprod) REFERENCES productos(codcat, refprod)
		ON DELETE NO ACTION ON UPDATE CASCADE
);