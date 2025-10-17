use Libreria_2C

--LEFT JOIN

--muestra igual la info aunque no haya , dato ausente-null

--Apellidos y nombres de los autores 
--Titulo del libro y año de publicacion del libro
--si hay autores sin libros asociados mostrarlos  
--igual en el listado 

Select A.Apellidos, A.Nombres, L.Titulo, L.AñoPublicacion from Autores A 
Left Join AutoresLibro AL on A.IDAutor=AL.IDAutor 
Left Join Libros L on L.IDLibro=AL.IDLibro

--Nombre de usuario, titulo de libro leido y fecha de lectura. ordenado por fecha de lectura
--si hay usuarios que no hayan registrado lecturas mostrarlos igual en el listado

select 
U.NombreUsuario,
Li.Titulo,
L.FechaHora
from Usuarios U
left join Lecturas L on U.IDUsuario=L.IDUsuario
left join Libros Li on Li.IDLibro=L.IDLibro
order by L.FechaHora ASC

--nombre de usuario y nombre de pais de aquellos usuarios que no hayan registrado lecturas
select 
U.NombreUsuario,
P.Pais
FROM Usuarios U
inner join Paises P on U.IDPais= P.IDPais --coincidan
left join Lecturas Le on U.IDUsuario=Le.IDUsuario
where Le.IDLectura is null; 

-- RIGHT JOIN -----

--Nombre de usuario, titulo del libro leido , fecha de lectura y medio de lectura.
--Añadir al listado cualquier medio de lectura que no haya sido utilizado

Select 
U.NombreUsuario,
Li.Titulo,
Le.FechaHora,
M.Nombre
from Usuarios U
Inner join Lecturas Le on U.IDUsuario =Le.IDUsuario --coincidan combinen 
Inner Join Libros Li On Li.IDLibro=LE.IDLibro
Right Join Medios M on M.IDMedio =Le.IDMedio;

--FULL JOIN---
-- todos los usuarios hayan leido libro o no
--medio de lectura hayan sido utilizado o no 
--nombres de los libros que no han sido leidos nunca 

Select 
U.NombreUsuario,
Li.Titulo,
Le.FechaHora,
M.Nombre
from Usuarios U
left join Lecturas Le on U.IDUsuario =Le.IDUsuario 
full Join Libros Li On Li.IDLibro=LE.IDLibro
full Join Medios M on M.IDMedio =Le.IDMedio;

--Todos los nombres de usuario que hayan leido un libro de la categoria 'salud'.
--No repetir el nombre de usuario

select Distinct U.NombreUsuario from Usuarios U
inner join Lecturas Le on U.IDUsuario=Le.IDUsuario
inner join Libros Li on Li.IDLibro=Le.IDLibro
inner join Categorias C on C.IDCategoria=Li.IDCategoria
where C.Categoria like 'Salud';

--Los apellidos , nombres y pseudonimos de los autores que hayan resgistrado 8 o mas como puntaje
--por al menos un usuario de su misma nacionalidad 

select Distinct --distinct saca repetidos
A.Apellidos,
A.Nombres,
A.Pseudonimo
from Autores A
inner join AutoresLibro AL on A.IDAutor=AL.IDAutor
Inner join Libros Li on Li.IDLibro= AL.IDLibro
Inner join Puntuaciones P on P.IDLibro=LI.IDLibro
Inner join Usuarios U on u.IDUsuario=p.IDLibro
where P.Puntaje >=8 and U.IDPais=A.IDPais