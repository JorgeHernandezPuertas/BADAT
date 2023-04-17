/* 
3. Obtener el mes previsto de entrega para 
los pedidos que no se han recibido aún y para 
una categoría determinada. 
*/

DROP PROCEDURE IF EXISTS ejer5_3;
DELIMITER €€
CREATE PROCEDURE ejer5_3(categoria INT)
	BEGIN
		SELECT IFNULL(MONTHNAME(fecentrega), "No tiene fecha de entrega")
        FROM pedidos 
			JOIN productos
				ON pedidos.codproducto = productos.codproducto 
                AND codcategoria = categoria
		WHERE fecentrega >= curdate() OR fecentrega IS NULL;
    END €€
DELIMITER ;
CALL ejer5_3(1);