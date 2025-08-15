Create Database Libreria
Go
Use Libreria
GO
Create Table Libros(
    IDLibro bigint primary key not null,
    Titulo varchar(100) not null,
    Descripcion varchar(2048) null,
    Paginas smallint not null check (Paginas >= 1)
)
Go
Create Table Paises (
    IDPais varchar(3) not null primary key,
    Pais varchar(100) not null
)
Go
Create Table Ciudades(
    IDCiudad bigint primary key not null identity(1,1),
    IDPais varchar(3) not null foreign key references Paises(IDPais),
    Ciudad varchar(100) not null 
)