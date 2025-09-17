use TrabajoPractico1
go
 /*Collate Latin1_General_CI_AI  al momento de create table*/ 

INSERT INTO TiposUsuario (TipoUsuario)
VALUES ('Suscripción Free'), ('Suscripción Básica'), ('Suscripción Plus'), ('SSuscripción Premium'), ('Suscripción Empresarial');

INSERT INTO Permisos (Nombre)
VALUES ('Lectura'), ('Comentario'), ('Escritura'), ('Adminitrador');

INSERT INTO TiposArchivos (TipoArchivo) 
VALUES 
('Documento PDF'), ('Imagen JPEG'), ('Imagen BMP'), ('Archivo ZIP'),
('Ejecutable EXE'), ('Documento Word'), ('Imagen BMP'), ('Hoja de Cálculo Excel'),
('Presentación PowerPoint'), ('Archivo de Texto TXT'),('Archivo HTML'),('Archivo CSS'),
('Archivo JavaScript'), ('Archivo XML'),('Archivo JSON'),('Archivo MP3'),
('Video MP4'), ('Archivo WAV'),('Imagen PNG'),('Archivo GIF'), ('Archivo GIF');

SELECT * FROM Archivos;

Update TiposUsuario set TipoUsuario='Suscripción Premium' where IdTipoUsuario=4; /*modificar*/

Insert into Usuarios (Nombre,Apellido,IdTipoUsuario)
Values ('Adrián','Clarck',1),
       ('María','González',2),
	   ('Carlos','López',3),
	   ('Ana','Martínez',4),
	   ('Luis','Fernández',5),
	   ('John','Smith',1),
	   ('Emily','Johnson',2),
	   ('Michael','Williams',3),
	   ('Jessica','Brown',4),
	   ('David','Jones',5);



-----Inesertar los datos

DELETE FROM ArchivosCompartidos;
DELETE FROM Archivos;
DBCC CHECKIDENT ('Archivos', RESEED, 0);


 Insert into Archivos (IdUsuarioDueno,Nombre,Extension,Descripcion,IdTipoArchivo,Tamano,FechaCreacion,FechaUltimaModificacion,Eliminado) /*IdArchivo es IDENTITY → no lo incluyo en el INSERT, SQL lo genera solo*/

Values (1, 'Informe Anual', 'pdf', 'Informe de resultados anuales', 1, 204800, '2021-03-15', '2021-03-16', 0),
(1, 'Foto de perfil', 'jpg', 'Imagen para perfil en la plataforma', 2, 51200, '2022-01-10', '2022-01-10', 0),
(1, 'Backup Sistema', 'zip', 'Copia de seguridad del sistema', 4, 104857600, '2023-05-01', '2023-05-01', 1),
(2, 'Presentación Proyecto', 'pptx', 'Presentación del proyecto final', 8, 307200, '2020-07-22', '2020-07-22', 0);



Insert into ArchivosCompartidos (IdArchivo,IdUsuario,IdPermiso,FechaCompartido) 
Values
(1, 6, 1, '2022-05-11'), -- Informe Anual con John Smith (Lectura)
(2, 7, 2, '2022-06-15'), -- Foto de perfil con Emily Johnson (Comentario)
(3, 8, 3, '2023-01-12'), -- Backup Sistema con Michael Williams (Escritura)
(4, 9, 1, '2020-08-01'); -- Presentación Proyecto con Jessica Brown (Lectura)


-- Renombrar columna IdUsuarioDueño → IdUsuarioDueno
EXEC sp_rename 'Archivos.IdUsuarioDueño', 'IdUsuarioDueno', 'COLUMN';
GO

-- Renombrar columna Tamaño → Tamano
EXEC sp_rename 'Archivos.Tamaño', 'Tamano', 'COLUMN';
GO

