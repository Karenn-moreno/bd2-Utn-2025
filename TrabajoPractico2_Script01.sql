use TrabajoPractico1
go
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

SELECT * FROM TiposUsuario;

update TiposUsuario set TipoUsuario='Suscripción Premium' where IdTipoUsuario=4;
