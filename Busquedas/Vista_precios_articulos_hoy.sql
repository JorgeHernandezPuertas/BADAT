/*
Para la bd promociones:
Prepara una vista que se llamará CATALOGOPRODUCTOS que
tenga la referencia del articulo, el codigo y nombre de categoria,
el nombre del articulo, (el precio base y el precio venta HOY)
*/
USE bdpromociones;
DROP VIEW IF EXISTS CATALOGOPRODUCTOS;
CREATE VIEW CATALOGOPRODUCTOS
(refArticulo, codArticulo, nomCategoria, nomArticulo, precioBase, precioVenta)
 AS
 SELECT 
 
 ;
 
 /*
 Para la bd de empresaclase:
 Prepara una vista que se llamará LISTINTELEFONICO en la que
 cada usuario podrá consultar la extensión telefónica de los
 empleados de SU DEPARTAMENTO
 PISTA ==> USAR FUNCION DE MYSQL USER()
 AL CREAR LA LISTA TENER EN CUENTA ESTO:
 [SQL SECURITY { DEFINER | INVOKER }]
 */
 use empresaclase;
 DROP VIEW IF EXISTS LISTINTELEFONICO;
 CREATE SQL SECURITY INVOKER
 
 
 