
--Todos los usuarios indicando Apellido, Nombre.
SELECT Apellido, Nombre from Usuarios;

/*Todos los usuarios indicando Apellido y Nombre con el formato: [Apellido], [Nombre] 
(ordenados por Apellido en forma descendente). */

SELECT Apellido+','+ Nombre AS usuario from Usuarios --concateno en una sola columna AS nombro Usuario
order by Apellido DESC;

--Los usuarios cuyo IDTipoUsuario sea 5 (indicando Nombre, Apellido)

SELECT Apellido+','+ Nombre AS usuario from Usuarios 
where IDTipoUsuario =5;

/*El último usuario del listado en orden alfabético (ordenado por Apellido y luego por Nombre). 
Indicar IDUsuario, Apellido y Nombre.*/

SELECT TOP 1 IDUsuario, Apellido, Nombre
FROM Usuarios
order by Apellido DESC, Nombre DESC;

/*Los archivos cuyo año de creación haya sido 2021 (Indicar Nombre, Extensión y Fecha de creación).*/
select *from archivos;

select Nombre , Extension, FechaCreacion from Archivos 
where Year(FechaCreacion)=2021;

/*Todos los usuarios con el siguiente formato Apellido, Nombre en una nueva columna llamada ApellidoYNombre,
en orden alfabético.*/
select apellido+','+ nombre AS Apellidoynombre FROM Usuarios
order by Apellido, nombre ASC;

--Otra forma con CONCAT 
SELECT CONCAT(Apellido, ', ', Nombre) AS ApellidoYNombre
FROM Usuarios;

/*Todos los archivos, indicando el semestre en el cual se produjo su fecha de creación.
Indicar Nombre, Extensión, Fecha de Creación y la frase “Primer Semestre” o “Segundo Semestre” según corresponda.
*/
select *from archivos;

SELECT Nombre,Extension,FechaCreacion,
CASE 
    WHEN MONTH(FechaCreacion) <= 6 THEN 'Primer Semestre'
    ELSE 'Segundo Semestre'
    END AS Semestre
FROM Archivos;

/*Ídem al punto anterior, pero ordenarlo por semestre y fecha de creación*/
