create database Clase01
go
use Clase01
go
Create Table Areas(
    IdArea smallint not null primary key,
	Nombre varchar (50) not null,
	Mail varchar (150) not null unique
	);
go
create Table Empleados(
   IdEmpleado int not null primary key,
   Apellidos varchar(100) not null,
   Nombres varchar(100) not null,
   Salario money not null check (Salario >0),
   FechaContratacion date not null,
   IdArea smallint null foreign key references Areas(IdArea)
   );