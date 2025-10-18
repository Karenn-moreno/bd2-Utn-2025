Use Libreria_2C

--la cantidad de libros 
select COUNT(*) As CantidadLibros from Libros; --nos devuelve un valor

--la cantidad de autores que tienen apellido
select count(*) As AlternativaA from Autores Where Apellidos is not null;

select count (apellidos) AS AlternativaB from autores;

--La cantidad de usuarios distintos que leyeron el libro "It"
Select  count (Distinct U.IDUsuario) from Usuarios U
Inner join Lecturas Le on U.IDUsuario=Le.IDUsuario
Inner join Libros Li On Li.IDLibro=Le.IDLibro
Where Li.Titulo Like 'It';

--por nombre
Select  Distinct U.NombreUsuario from Usuarios U
Inner join Lecturas Le on U.IDUsuario=Le.IDUsuario
Inner join Libros Li On Li.IDLibro=Le.IDLibro
Where Li.Titulo Like 'It';


--La sumatoria total de minutos de lectura del año 2010 expresados en horas y minutos
--horas :55
--Mins :54
Select Sum(TiempoEnMinutos)/60 as Horas,
Sum (TiempoEnMinutos)%60 as Minutos
From Lecturas Where Year (FechaHora)=2010;


--El promedio de paginas de los libros de categoria 'terror'
select AVG(Li.Paginas*1.0) from Libros Li
inner join Categorias C on C.IDCategoria=Li.IDCategoria
Where C.Categoria like 'Terror';

--La cantidad de autores de nacionalidad estadounidense ('Estados Unidos') que hayan nacido
-- despues del año 1950
select count(A.IDAutor) From Autores A 
Inner join Paises P on P.IDPais=A.IDPais
where P.Pais = 'Estados Unidos' and A.AñoNacimiento>1950

--La duracion minima de una sesion individual de lectura

select min (TiempoEnMinutos) from Lecturas;