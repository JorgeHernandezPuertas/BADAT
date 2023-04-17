/*
9. Obtener la población del código postal de los proveedores 
(los primeros dos caracteres se refieren a la provincia y 
los tres últimos a la población).
*/

SELECT substr(codpostal, 3) as poblacion
FROM proveedores;