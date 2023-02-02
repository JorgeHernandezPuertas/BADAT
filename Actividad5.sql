/* Ejercicio de modificar la base de datos del museo (Actividad 4) */
USE ACTIVIDAD4;
-- 5.1
ALTER TABLE empleados
	ADD COLUMN jubilacion DATE NULL;
-- 5.5
CREATE TABLE IF NOT EXISTS obrasmasbuscadas
(
	codobra INT UNSIGNED,
	nombre VARCHAR(60),
    autor VARCHAR(60) NULL,
    CONSTRAINT pk_obrasmasbuscadas PRIMARY KEY (codobra)
);
-- 5.6
ALTER TABLE obrasmasbuscadas
	ADD COLUMN codestilo INT UNSIGNED,
    ADD COLUMN codtipoobra INT UNSIGNED,
    ADD COLUMN precioestimado DECIMAL(10,2) UNSIGNED NULL,
    ADD CONSTRAINT fk_obrasmasbuscadas_estilos FOREIGN KEY (codestilo) REFERENCES estilos(codestilo)
		ON DELETE NO ACTION ON UPDATE CASCADE,
    ADD CONSTRAINT fk_obrasmasbuscadas_tipoobras FOREIGN KEY (codtipoobra) REFERENCES tipoobras(codtipoobra)
		ON DELETE NO ACTION ON UPDATE CASCADE;
-- 5.7
ALTER TABLE obrasmasbuscadas
	DROP CONSTRAINT fk_obrasmasbuscadas_estilos,
    DROP CONSTRAINT fk_obrasmasbuscadas_tipoobras;
-- 5.8
DROP TABLE obrasmasbuscadas;
