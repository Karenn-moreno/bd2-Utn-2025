CREATE DATABASE TrabajoPractico1;
GO
USE TrabajoPractico1;
GO

CREATE TABLE TiposUsuario (
    IdTipoUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TipoUsuario VARCHAR(50) NOT NULL
);

CREATE TABLE Usuarios (
    IdUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    IdTipoUsuario INT NOT NULL FOREIGN KEY REFERENCES TiposUsuario(IdTipoUsuario)
);

CREATE TABLE Permisos (
    IdPermiso INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE TiposArchivos (
    IdTipoArchivo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TipoArchivo VARCHAR(100) NOT NULL
);

CREATE TABLE Archivos (
    IdArchivo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdUsuarioDueño INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
    Nombre VARCHAR(50) NOT NULL,
    Extension VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    IdTipoArchivo INT NOT NULL FOREIGN KEY REFERENCES TiposArchivos(IdTipoArchivo),
    Tamaño INT NOT NULL,
    FechaCreacion DATE NOT NULL,
    FechaUltimaModificacion DATE NOT NULL,
    Eliminado BIT NOT NULL
);

CREATE TABLE ArchivosCompartidos (
    IdArchivo INT NOT NULL FOREIGN KEY REFERENCES Archivos(IdArchivo),
    IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
    IdPermiso INT NOT NULL FOREIGN KEY REFERENCES Permisos(IdPermiso),
    FechaCompartido DATE NOT NULL,
    PRIMARY KEY (IdArchivo, IdUsuario, IdPermiso)
);
