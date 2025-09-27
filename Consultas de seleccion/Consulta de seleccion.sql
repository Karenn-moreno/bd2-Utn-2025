Use Libreria_2C 
GO
---LISTADO DE TODAS LAS COLUMNAS DE LA TABLA LIBROS
Select * from Autores;

--LISTADO TITULO, AÑO PUBLICACION
SELECT Titulo,AñoPublicacion from libros;

--lISTADO DE AÑOPUBLICACION DE LOS LOS LIBROS
Select AñoPublicacion From Libros;

-----------
--DISTINCT  Remueve datos duplicados
-----------
--lISTADO DE AÑOS DE PUBLICACION SIN REPETIR LOS LIBROS
Select Distinct AñoPublicacion From Libros;

--Listado de cantidad de paginas y años de publicacion sin repetir de los libros
Select distinct Libros.Paginas, Libros.AñoPublicacion from Libros;

----------
/* ALIAS  (reducir los nombres tablas columnas para abreviar)*/
----------
Select Distinct LIB.Titulo, LIB.Descripcion AS 'sinopsis' from Libros AS LIB;

-----------
/*ORDER BY (Ordenamiento del resultado a partir de uno o varios criterios)*/
-----------
--LISTADO DE LIBROS CON TITULO, CANTIDAD DE PAGINAS ,AÑO DE PUBLICACION ORDENADO DESCENDENTEMENTE POR TITULO

Select Titulo,Paginas,AñoPublicacion From Libros
Order By Titulo DESC; /*Z - A */

--ORDENADO ASCENDENTEMENTE POR AÑO DE PUBLICACION Y, SI HAY EMPATE, DESCENDENTEMENTE POR CANTIDAD DE PAGINAS 

Select Titulo,Paginas,AñoPublicacion From Libros
Order by AñoPublicacion ASC, Paginas DESC;

-------
/*TOP + Order By (Permite limitar la cantidad de registros que devolvera la consulta)*/
------

--OBTENER LOS 4 LIBROS CON TITULO MAS LARGO con empates ---Ranking
Select top 4 with Ties IdLibro,Titulo,Len(Titulo) AS 'LargoTitulo' from Libros
Order By LargoTitulo Desc;
--Order By Len(Titulo) DESC;
--Order By 3 DESC; -- 3 Es la tercer columna 

Select Distinct Top 4 len(Titulo) As 'LargoTitulo' From Libros Order By LargoTitulo Desc;

--------
/*WHERE Excluye filas del resultado de la seleccion a partir de uno o varias condiciones que deben cumplirse */
--------

--Obtener los libros cuya categoria sea 1,3 o 5 
Select *from Libros
Where IDCategoria=1 or IDCategoria=3 or IDCategoria=5; --no va AND ya que se tendria que cumplir todas las condiciones

--Operador IN
Select * from Libros 
Where IDCategoria IN (1,3,5); --equivalente más simple

--LISTAR LOS USUARIOS CUYO PAIS NO SEA "AR" ni "US"
Select *from Usuarios
Where IdPais != 'AR' AND IdPais!='US'; --ambas condidiciones se tienen que cumplir


Select *from Usuarios
Where not (IdPais = 'AR' OR IdPais='US');

--OPERADOR IN
Select *from Usuarios
Where IdPais Not in ('AR','US');

--MOSTRAR LOS LIBROS PUBLICADOS ENTRE 2000 Y 2010
Select *from Libros
Where AñoPublicacion >= 2000 and AñoPublicacion<=2010;

--BETWEEN 
Select *from Libros
Where AñoPublicacion BETWEEN 2000 and 2010;


--LAS LECTURAS QUE HAYAN SIDO LEIDAS ENTRE EL 2019 Y 2021 siendo DATE TIME 
Select *from Lecturas
where FechaHora >='01-01-2019' and FechaHora <='31-12-2021';

Select *from Lecturas
Where FechaHora BETWEEN '01-01-2019' and '31-12-2021';

Select *from Lecturas
Where Year(FechaHora) BETWEEN 2019 and 2021; /*casteo el año*/

--year, month y day son funciones que vuelven la parte indicada de una fecha
--DatePart es una funcion que devuelve la parte que le indiquemos como parametro

--Los autores que no tienen seudonimo (null)
Select *From Autores
Where Pseudonimo IS NULL;

--Los autores que no tienen apellido (Los que tienen apellido con null)
Select *from Autores 
Where Apellidos is null;

--Los autores que si tienen seudonimo 
Select *From Autores
Where Pseudonimo IS NOT NULL;

--los autores que tienen seudonimo y apellido y nombre
Select *from Autores
where Pseudonimo is not null and Apellidos is not null and Nombres Is not null;