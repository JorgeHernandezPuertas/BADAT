/* Relacion 2 Ejercicio 3 */
SELECT numem, empleados.numde, extelem, fecnaem, fecinem, salarem, comisem, numhiem, nomem, ape1em, ape2em, dniem, userem, passem, nomde FROM empleados
JOIN departamentos ON empleados.numde = departamentos.numde;