--Consultas de accion : Insertar, modificar o eliminar
Use Clase02
go
--Inserta registros de uno a la vez
Insert into Areas (IdArea,Nombre,Mail)
Values (100, 'Sistemas', 'sistemas@gmail.com');

Insert into Areas (IdArea,Nombre,Mail)
Values (200, 'Recursos humanos', 'rrhh@gmail.com');

--Inserta registros de varios a la vez
Insert into Areas (IdArea,Nombre,Mail,Telefono)
Values 
(300, 'Contable', 'contable@gmail.com','1234'),
(400, 'Legales', 'legales@gmail.com','5678'),
(500, 'Tesoreria', 'tesoreria@gmail.com',null);


--UPDATE
/*Update Areas set Nombre='IT', Mail='it@mail.com' ; --Modifica en todas las columnas 
Delete From Areas; --borra toda la tabla con sus datos*/

--Update
Update Areas set Nombre='IT', Mail='it@mail.com' Where IdArea=100;

--Delete
Delete From Areas Where IdArea=400 or IdArea=500;