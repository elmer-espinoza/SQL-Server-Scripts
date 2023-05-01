USE OSS

DROP TABLE dbo.ApiRest 

CREATE TABLE dbo.ApiRest (
id int primary key identity, 
Nombre varchar(50),
DNI varchar(10),
Edad smallint,
Telefono varchar(20),
Correo varchar(60),
Basico decimal(9,2),
Ingreso datetime, 
Activo bit
)

DELETE FROM ApiRest

DBCC CHECKIDENT ('ApiRest', RESEED, 1)

DECLARE @I AS INTEGER = 0
WHILE @I < 5
BEGIN 
   SET @I = @I + 1

   INSERT INTO ApiRest (Nombre, DNI, Edad, Telefono, Correo, Basico, Ingreso, Activo) VALUES
      ('ELMER ESPINOZA',   '12345678', 52, '987654321', 'elmer.espinoza@gmail.com',   4600.12, '2023-01-01', 1),
      ('DIANA CRUZ'      , '12345678', 25, '987654321', 'diana.cruz@gmail.com',       1200.25, '2023-01-11', 1),
      ('LADY CERVANTES',   '12345678', 25, '987654321', 'lady.cervantes@gmail.com',   1200.25, '2023-01-11', 1),
      ('MARICARMEN GOMEZ', '12345678', 25, '987654321', 'maricarmen.gomez@gmail.com', 1200.25, '2023-01-11', 1),
      ('MURIEL ELGUERA',   '12345678', 21, '987654321', 'muriel.elguera@gmail.com',   2200.70, '2023-02-01', 0),
      ('MADOTA SARAVIA',   '12345678', 22, '987654321', 'madota.saravia@gmail.com',   3200.35, '2023-02-21', 1),
      ('MYCHELLE TOVAR',   '12345678', 25, '987654321', 'mychelle.tovar@gmail.com',   1100.80, '2023-03-01', 0),
      ('MILAGROS JIMENEZ', '12345678', 24, '987654321', 'milagros.jimenez@gmail.com', 1300.86, '2023-03-10', 1)

END

UPDATE ApiRest SET 
DNI = CAST(CAST(RAND(CHECKSUM(NEWID()))*100000000 AS INTEGER) AS VARCHAR(8)), 
Edad = CAST(RAND(CHECKSUM(NEWID()))*50 AS INTEGER), 
Telefono = '998'+CAST(CAST(RAND(CHECKSUM(NEWID()))*10000000 AS INTEGER) AS VARCHAR(7)), 
Ingreso = DATEADD(d, CAST(RAND(CHECKSUM(NEWID()))*500 AS INTEGER)*-1, GETDATE()), 
Basico = CAST(RAND(CHECKSUM(NEWID()))*50000 AS DECIMAL)

SELECT * FROM ApiRest ORDER BY ID -- NOMBRE 



DROP TABLE dbo.ApiRestUser 

CREATE TABLE dbo.ApiRestUser (
Username varchar(20)  PRIMARY KEY,
Password  varchar(20),
EmailAddress varchar(50),
FirstName varchar(30),
LastName varchar(30),
Rol varchar(20)
)

DELETE ApiRestUser

INSERT INTO ApiRestUser (Username, Password, EmailAddress, FirstName, LastName, Rol) VALUES 
('ELMER',  'Pass123', 'elmer.espinoza@gmail.com',  'Elmer', 'Espinoza',  'Administrador'),
('DIANA',  'Pass456', 'diana.cruz@gmail.com',      'Diana', 'Cruz',      'Ventas'),
('LADY',   'Pass789', 'lady.cervantes@gmail.com',  'Lady',  'Cervantes', 'Logistica')

SELECT * FROM ApiRestUser



