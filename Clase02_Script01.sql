Create DataBase Clase02
go
Use Clase02
go
-- Otra forma de crear las tablas sin respetar el orden de las foreign keys
Create table Empleados(
  IdEmpleado int not null,
  Apellidos varchar(255) not null,
  Nombres varchar(255) not null,
  Salario money not null,
  FechaContratacion date not null,
  IdArea smallint null
)
go 
Create Table Areas(
 IdArea smallint not null,
 Nombre varchar (255) not null,
 Mail varchar (255) not null
)
go
--Modificar la estructura de una tabla que ya existe Restricciones
Alter Table Empleados
Add Constraint PK_Empleados Primary Key (IdEmpleado)
go
Alter Table Areas
Add Constraint PK_Areas Primary Key (IdArea)
go
Alter Table Empleados
Add Constraint CHK_SalarioPositivo Check (Salario>0)
go
Alter Table Empleados
Add Constraint FK_EmpleadosAreas Foreign Key (IdArea)--Hace referencia a una tabla, entonces la foreign key esta en empleados
References Areas(IdArea)

--Creacion de columna
Alter Table Areas
Add Telefono varchar (20) null 


--Modificacion de columna, los atributos
Alter Table Areas
Alter Column Telefono varchar(30) null