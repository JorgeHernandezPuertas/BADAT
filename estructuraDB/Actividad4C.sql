/* Los empleados pertenecen a un departamento */

-- Creo la nueva tabla para departamentos
CREATE TABLE IF NOT EXISTS deptos
(
	coddepto INT UNSIGNED,
    nombre VARCHAR(60),
    descripcion VARCHAR(200),
    CONSTRAINT pk_deptos PRIMARY KEY (coddepto)
);

-- Modifico la tabla empleados para relacionarla con la de departamentos
ALTER TABLE empleados
	ADD COLUMN coddepto INT UNSIGNED,
    ADD CONSTRAINT fk_empleados_deptos FOREIGN KEY (coddepto) REFERENCES deptos(coddepto);