use BDArchivos

--1) Por cada usuario listar el nombre, apellido y el nombre del tipo de usuario.

Select U.Nombre, U.Apellido, tipU.TipoUsuario from  Usuarios U
Inner Join TiposUsuario TipU on TipU.IDTipoUsuario=u.IDUsuario;

--2) Listar el ID, nombre, apellido y tipo de usuario de aquellos usuarios que sean del tipo 'Suscripción Free' o 'Suscripción Básica'

Select U.Nombre, U.Apellido, tipU.TipoUsuario from  Usuarios U
Inner Join TiposUsuario TipU on TipU.IDTipoUsuario=u.IDUsuario
where TipU.TipoUsuario='suscripcion free' or TipU.TipoUsuario='suscripcion basica'

--3) Listar los nombres de archivos, extensión, tamaño expresado en Megabytes y el nombre del tipo de archivo.
--NOTA: En la tabla Archivos el tamaño está expresado en Bytes.

select A.Nombre, A.Extension, ROUND(A.Tamaño / 1024.0 / 1024.0, 2) AS TamañoMB, TipA.TipoArchivo from Archivos A
Inner join TiposArchivos TipA on TipA.IDTipoArchivo=A.IDTipoArchivo

-- 4) Listar los nombres de archivos junto a la extensión con el siguiente formato 'NombreArchivo.extension'. 
--Por ejemplo, 'Actividad.pdf'.

--Sólo listar aquellos cuyo tipo de archivo contenga los términos 'ZIP', 'Word', 'Excel', 'Javascript' o 'GIF'

select A.Nombre +'.'+ A.Extension AS 'ArchivoExtension' from Archivos A 
Inner join TiposArchivos TipA on TipA.IDTipoArchivo=A.IDTipoArchivo
WHERE TipA.TipoArchivo LIKE '%ZIP%'  --comodin 
    OR TipA.TipoArchivo LIKE '%Word%'
    OR TipA.TipoArchivo LIKE '%Excel%'
    OR TipA.TipoArchivo LIKE '%Javascript%'
    OR TipA.TipoArchivo LIKE '%GIF%';

--5) Listar los nombres de archivos, su extensión, el tamaño en megabytes y la fecha de creación de aquellos archivos que le pertenezcan 
--al usuario dueño con nombre 'Michael' y apellido 'Williams'.

select A.Nombre, A.Extension,  ROUND(A.Tamaño / 1024.0 / 1024.0, 2) AS TamañoMB, A.FechaCreacion from Archivos A 
Inner join Usuarios U on U.IDUsuario=A.IDUsuarioDueño
where U.Nombre='Michael' and U.Apellido='Williams'