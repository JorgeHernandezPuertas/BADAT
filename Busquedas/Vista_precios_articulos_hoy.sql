/*
Para la bd promociones:
Prepara una vista que se llamará CATALOGOPRODUCTOS que
tenga la referencia del articulo, el codigo y nombre de categoria,
el nombre del articulo, (el precio base y el precio venta HOY)
*/
USE bdpromociones;
DROP VIEW IF EXISTS catalogoprecios;
create view catalogoprecios
(referencia, descripcion, preciobase, precioHoy, categoria)
as
	select refart, nomart, preciobase, precioventa, codcaat
	from articulos
	where refarticulo not in
		(select catalogospromos.refarticulo
		from catalogospromos join promociones on catalogospromos.codpromo = promociones.codpromo	
		where curdate() between promociones.fecinipromo
			and date_add(promociones.fecinipromo, interval promociones.duracion day)
		)

union all /* se repiten */
-- union  /* no se repiten */

select articulos.desarticulo, catalogospromos.precioventa
from catalogospromos 
	join promociones 
		on catalogospromos.codpromo = promociones.codpromo	
where curdate() between promociones.fecinipromo
				and date_add(promociones.fecinipromo,
					interval promociones.duracion day);
 
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
drop user 'prueba'@'192.168.56.1';
create user 'prueba'@'192.168.56.1' identified by '1234';

grant all on *.* to 'prueba'@'192.168.56.1'; 
-- vemaos la función user() que devuelve el usuario conectado:
select user(),
	locate('@', user()),
	left(user(),locate('@', user())),
    locate('@', user())-1;
select left(user(),locate('@', user())-1);
select version();
-- POR TANTO:
CREATE 
	SQL SECURITY INVOKER -- SOLO NECESARIO EN VERSIONES ANTERIORES A MYSQL 8.0.19
	VIEW LISTIN
	(Nombre, extension)
AS
	select concat (ape1em, ifnull(concat(' ', ape2em),''), ', ', nomem), extelem
    from empleados
    where numde = (select numde
				   from empleados
                   where userem = left(user(),locate('@',user())-1 )
				  );

-- cuando ejecutemos la siguiente sentencia conectados con el usuario 'eva', veremos los empleados del depto. 121
-- cuando ejecutemos la siguiente sentencia conectados con el usuario 'prueba', veremos los empleados del depto. 110
select *
from LISTIN;
 
 
 