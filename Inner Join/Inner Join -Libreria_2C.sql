Use Libreria_2C


----------INNER JOIN------------

--Apellidos , Nombres , año de nacimiento y nombre del pais de cada autor

Select A.Apellidos, A.Nombres, A.AñoNacimiento, P.Pais from Autores A
Inner Join Paises P On P.IDPais= A.IDPais; --la union es por el id pais para mostrar el nombrePais

--Titulo del libro, Año de publicacion,cantidad de paginas y nombre de la categoria de cada libro  

Select L.Titulo, L.AñoPublicacion, L.paginas, C.categoria from Libros L
Inner Join Categorias C on  C.IDCategoria=L.IDCategoria; --coincida los IdCategoria

--Titulo del libro, Cantidad de paginas y apellido, nombrey pseudonimo de los autores 
Select L.Titulo , L.Paginas,A.Apellidos, A.Nombres, A.pseudonimo from  Autores A 
Inner Join AutoresLibro AL on A.IDAutor=AL.IDAutor
Inner join Libros L on L.IDLibro=AL.IDLibro;

--Nombre del Usuario, Nombre del pais , titulo del libro , fecha y hora de lectura
--Nombre del medio de lectura y duracion en minutos 

--Ordenado por nombre de usuario, titulo del libro y fecha y hora de lectura de manera ascendente

Select 
U.NombreUsuario,
P.Pais,
Li.Titulo,
Le.FechaHora,
M.Nombre As 'medioLectura',
Le.TiempoEnMinutos

from Usuarios U 
Inner Join Paises P on P.IDPais=U.IDPais
Inner join Lecturas Le on U.IDUsuario=Le.IDUsuario
Inner Join Libros Li On Li.IDLibro=Le.IDLibro
Inner Join Medios M on M.IDMedio=Le.IDMedio

ORDER BY
U.NombreUsuario ASC,
Li.Titulo ASC,
Le.FechaHora ASC
;