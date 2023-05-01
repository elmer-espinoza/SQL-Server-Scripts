--CREATE DATABASE Facturacion 
use Facturacion 

DROP TABLE Vendedor 

CREATE TABLE Vendedor (
Vendedor_id int primary key identity, 
Nombres varchar(50),
Apellidos varchar(50),
Telefono varchar(20),
Correo varchar(60)
)

DBCC CHECKIDENT ('Vendedor', RESEED, 0)

INSERT INTO Vendedor (Nombres, Apellidos, Telefono, Correo) VALUES
('ELMER','ESPINOZA',   '12345678', 'elmer.espinoza@gmail.com'),
('MARICARMEN','GOMEZ', '12345678', 'maricarmen.gomez@gmail.com'),
('MURIEL','ELGUERA',   '12345678', 'muriel.elguera@gmail.com'),
('MADOTA','SARAVIA',   '12345678', 'madota.saravia@gmail.com'),
('MYCHELLE','TOVAR',   '12345678', 'mychelle.tovar@gmail.com'),
('MILAGROS','JIMENEZ', '12345678', 'milagros.jimenez@gmail.com')

DELETE FROM Vendedor 

SELECT * FROM Vendedor

CREATE PROCEDURE sp_vendedor_crear (
@Nombres varchar(50),
@Apellidos varchar(50),
@Telefono varchar(20),
@Correo varchar(60)
)
as 
BEGIN
  INSERT INTO Vendedor (Nombres, Apellidos, Telefono, Correo) VALUES (@Nombres, @Apellidos, @Telefono, @Correo)
END


CREATE PROCEDURE sp_vendedor_editar (
@Vendedor_Id int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Telefono varchar(20),
@Correo varchar(60)
)
as 
BEGIN
  UPDATE Vendedor SET Nombres = @Nombres, Apellidos = @Apellidos, Telefono = @Telefono, Correo = @Correo WHERE Vendedor_Id = @Vendedor_Id
END


CREATE PROCEDURE sp_vendedor_remover (
@Vendedor_Id int
)
as 
BEGIN
  DELETE FROM Vendedor WHERE Vendedor_Id = @Vendedor_Id
END

CREATE PROCEDURE sp_vendedor_listar (
@Filtro as Varchar(20)
)
AS
BEGIN
SELECT * FROM Vendedor WHERE Nombres + ' '+ Apellidos LIKE '%'+@Filtro+'%'
END 

EXEC sp_vendedor_listar ''
sp_vendedor_listar 'Ma'

