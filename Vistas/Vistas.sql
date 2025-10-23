--Obtener un listado de alumnos que indique su apellido y nombre, edad, nombre de los cursos 
--que tomo , el anio en que lo hizo y la nota que obtuvo 
Create View VW_ListadoAlumnos AS
select A.Apellido , A.nombre, DATEDIFF(YEAR,0,GETDATE()-A.Fecha_Nacimiento) AS 'edad',
C.Nombre AS NombreCurso , AXC.Anio, AXC.Nota_Final --ambiguedad entre nombres 
From Alumnos As A
Inner join Alumnos_X_Curso AS AXC ON A.IdAlumno=AXC.IdAlumno
Inner Join Cursos AS C on C.IdCurso=AXC.IdCurso

---

select *from VW_ListadoAlumnos WHERE edad <=25

---SI QUIERO MODIFICAR UNA VISTA EXISTENTE

select *from VW_ListadoAlumnos

ALTER VIEW VW_ListadoAlumnos AS
select A.Apellido , A.nombre, DATEDIFF(YEAR,0,GETDATE()-A.Fecha_Nacimiento) AS 'edad',
C.Nombre AS NombreCurso , c.Presencial, AXC.Anio, AXC.Nota_Final --ambiguedad entre nombres 
From Alumnos As A
Inner join Alumnos_X_Curso AS AXC ON A.IdAlumno=AXC.IdAlumno
Inner Join Cursos AS C on C.IdCurso=AXC.IdCurso

select *from VW_ListadoAlumnos 

--ELIMINAR UNA VISTA DE LA BD
DROP VIEW VW_ListadoAlumnos
SELECT*FROM VW_ListadoAlumnos




CREATE VIEW VW_CURSOSXALUMNO AS 
Select A.IDAlumno, A.Apellido ,A.Nombre,
(Select Count (*)From Alumnos_X_Curso AS AXC Inner join Cursos AS C
ON AXC_IDcurso =C.IdCurso WHERE C.Presencial=1 AND AXC.IDAlumno=A.IdAlumno) AS CantP,
(Select Count (*)From Alumnos_X_Curso AS AXC Inner join Cursos AS C
ON AXC_IDcurso =C.IdCurso WHERE C.Presencial=0 AND AXC.IDAlumno=A.IdAlumno)AS CantD
From Alumnos AS A 

SELECT *FROM VW_CURSOSXALUMNO 
--obtener un listado de alumnos que hayan realizado al menos un curso a distancia 
select * from VW_CURSOSXALUMNO WHERE CantD>0
--obtener un listado de alumnos que hayan realizado mas cursos a
--distancia de presenciales pero que hayan realizado al menos un 
--curso presencial 
select * from VW_CURSOSXALUMNO where cantD >cantP and cantP>0