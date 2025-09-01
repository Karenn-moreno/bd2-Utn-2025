Use Clase02
go
--Cracion de tabla con foreign key posterior a la columna y primary key compuesta
Create Table PresupuestosAnualesAreas(
   IdArea smallint not null,
   Año smallint not null,
   Presupuesto money not null check (Presupuesto >=0),
   Foreign key (IdArea) references Areas (IdArea),
   Primary Key (IdArea,Año)
)
go 
Create table Proyectos(
 IdProyecto int not null primary key identity(1,1),
 Nombre varchar(255) not null,
)
go
Create table EmpleadosProyecto(
  IdEmpleado int not null foreign key references Empleados (IdEmpleado),
  IdProyecto int not null foreign key references Proyectos (IdProyecto),
  Primary Key (IdEmpleado,IdProyecto)
)