create database Biblioteca
Collate Latin1_General_CI_AI
go
use Biblioteca
go 
create table Libros(
   IdLibro bigint primary key not null,
   Titulo varchar(100) not null,
   Descripcion varchar(2048) null,
   AñoPublicacion smallint null,
   Paginas smallint check (Paginas>=1)
)

---Insercion de un registro 
Insert into Libros (IdLibro,Titulo,Descripcion,AñoPublicacion,Paginas)
Values (1,'Sql :Restricciones','Como realizar restricciones en sql Server',2025,50)

---Insercion de varios registros 
Insert into Libros (IdLibro,Titulo,Descripcion,AñoPublicacion,Paginas)
Values(2, 'sql: Consultas de accion','Como realizar las consultas con ejemplos sql server',2025,100),
      (3,'sql: Consultas de seleccion','Ejemplos de sintaxis para realizar consultas de seleccion',2025,120);


--Modificacion de ningun registro
Update Libros set Titulo='Ejemplo de no modificacion' Where AñoPublicacion=2000;

--Modificacion de un registro
Update Libros set Titulo='Ejemplo de modificacion de un registro' Where IdLibro=1;

Update Libros set AñoPublicacion= 2024 Where IdLibro=1;

--Modificacion de un registro y varias columnas a la vez
Update Libros set Titulo ='Otro ejemplo de modificacion de un registro',Paginas=5 Where IdLibro=1;

--Modificacion de varios registros

Update Libros set Titulo ='Ejemplo de modificacion de varios registros' Where AñoPublicacion=2025;

--Modificacion de todos los registros (sin WHERE)
Update Libros set Titulo='Esto debe ser un error';

--Eliminacion de un registro 
Delete From Libros Where IdLibro=3;

--Eliminacion de varios registros 
Delete From Libros Where IdLibro>=1;