use TrabajoPractico1
go
INSERT INTO TiposUsuario (TipoUsuario)
VALUES ('Suscripci�n Free'), ('Suscripci�n B�sica'), ('Suscripci�n Plus'), ('SSuscripci�n Premium'), ('Suscripci�n Empresarial');

INSERT INTO Permisos (Nombre)
VALUES ('Lectura'), ('Comentario'), ('Escritura'), ('Adminitrador');

INSERT INTO TiposArchivos (TipoArchivo) 
VALUES 
('Documento PDF'), ('Imagen JPEG'), ('Imagen BMP'), ('Archivo ZIP'),
('Ejecutable EXE'), ('Documento Word'), ('Imagen BMP'), ('Hoja de C�lculo Excel'),
('Presentaci�n PowerPoint'), ('Archivo de Texto TXT'),('Archivo HTML'),('Archivo CSS'),
('Archivo JavaScript'), ('Archivo XML'),('Archivo JSON'),('Archivo MP3'),
('Video MP4'), ('Archivo WAV'),('Imagen PNG'),('Archivo GIF'), ('Archivo GIF');

SELECT * FROM TiposUsuario;

update TiposUsuario set TipoUsuario='Suscripci�n Premium' where IdTipoUsuario=4;
