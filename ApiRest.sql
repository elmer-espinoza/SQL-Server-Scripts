
use Facturacion 

DROP TABLE ApiRest 

CREATE TABLE ApiRest (
id int primary key identity, 
Nombre varchar(50),
DNI varchar(10),
Edad smallint,
Telefono varchar(20),
Correo varchar(60),
Basico decimal(9,2),
Ingreso date, 
Activo bit
)

DELETE FROM ApiRest

DBCC CHECKIDENT ('ApiRest', RESEED, 0)


INSERT INTO ApiRest (Nombre, DNI, Edad, Telefono, Correo, Basico, Ingreso, Activo) VALUES
('ELMER ESPINOZA',   '12345678', 52, '987654321', 'elmer.espinoza@gmail.com',   4600.12, '2023-01-01', 1),
('MARICARMEN GOMEZ', '12345678', 25, '987654321', 'maricarmen.gomez@gmail.com', 1200.25, '2023-01-11', 1),
('MURIEL ELGUERA',   '12345678', 21, '987654321', 'muriel.elguera@gmail.com',   2200.70, '2023-02-01', 0),
('MADOTA SARAVIA',   '12345678', 22, '987654321', 'madota.saravia@gmail.com',   3200.35, '2023-02-21', 1),
('MYCHELLE TOVAR',   '12345678', 25, '987654321', 'mychelle.tovar@gmail.com',   1100.80, '2023-03-01', 0),
('MILAGROS JIMENEZ', '12345678', 24, '987654321', 'milagros.jimenez@gmail.com', 1300.86, '2023-03-10', 1)



SELECT * FROM ApiRest 


DROP PROCEDURE sp_apirest_crear 

DROP PROCEDURE sp_apirest_editar

DROP PROCEDURE sp_apirest_remover

DROP PROCEDURE sp_apirest_listar 

DROP PROCEDURE sp_apirest_leer



CREATE PROCEDURE sp_apirest_crear (
@Nombre varchar(50),
@DNI varchar(10),
@Edad smallint,
@Telefono varchar(20),
@Correo varchar(60),
@Basico decimal(9,2),
@Ingreso date, 
@Activo bit
)
as 
BEGIN
  INSERT INTO ApiRest (Nombre, DNI, Edad, Telefono, Correo, Basico, Ingreso, Activo) VALUES (@Nombre, @DNI, @Edad, @Telefono, @Correo, @Basico, @Ingreso, @Activo)
END


CREATE PROCEDURE sp_apirest_editar (
@Id int,
@Nombre varchar(50),
@DNI varchar(10),
@Edad smallint,
@Telefono varchar(20),
@Correo varchar(60),
@Basico decimal(9,2),
@Ingreso date, 
@Activo bit
)
as 
BEGIN
  UPDATE ApiRest SET Nombre = @Nombre, DNI = @DNI, Edad = @Edad, Telefono = @Telefono, Correo = @Correo, Basico = @Basico, Ingreso = @Ingreso, Activo = @Activo WHERE Id = @Id
END


CREATE PROCEDURE sp_apirest_remover (
@Id int
)
as 
BEGIN
  DELETE FROM ApiRest WHERE Id = @Id
END

CREATE PROCEDURE sp_apirest_listar (
@Filtro as Varchar(20)
)
AS
BEGIN
SELECT * FROM ApiRest WHERE Nombre LIKE '%'+@Filtro+'%'
END 

CREATE PROCEDURE sp_apirest_leer (
@Id as int
)
AS
BEGIN
SELECT * FROM ApiRest WHERE Id = @Id
END 



EXEC sp_apirest_listar ''
sp_apirest_listar 'Ma'

DBCC CHECKIDENT ('ApiRest', RESEED, 6)

sp_apirest_crear 'DUMMY',   '12345678', 19, '987654321', 'dummy@gmail.com',   4600.00, '2023-01-01', 1
SELECT * FROM ApiRest 
sp_apirest_editar 7, 'DUMMY DUMMY',   '12345678', 26, '987654321', 'dummy.dummy@gmail.com',   4600.00, '2023-01-01', 1
SELECT * FROM ApiRest 
sp_apirest_remover 7
SELECT * FROM ApiRest 
sp_apirest_leer 4


