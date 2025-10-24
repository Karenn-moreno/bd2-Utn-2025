--variables

declare @Nombre VARCHAR(30)
declare @Edad INT
set @Nombre='Karen'
set @Edad='21'

--Ver en pantalla como mensaje
Print @Nombre
--ver en forma de tabla
Select @Nombre AS Nombre , @Edad AS EDAD 

---------------------------------------------------
Select * from Personas

DECLARE @Apellido VARCHAR (50)
DECLARE @Nombre VARCHAR (50)
DECLARE @Dni VARCHAR (10)

Select @Apellido =Apellido , @Nombre =Nombre, @Dni =@Dni
from Personas 
Where Sexo ='F'

Select @Apellido + ','+ @Nombre AS APELNOM, @Dni AS Id


declare @Orden BIT 
set @Orden =1
if @Orden = 1 BEGIN
 select *from Personas order By APELLIDO ASC
END 
ELSE BEGIN 
 select *from Personas order By APELLIDO ASC
end 
