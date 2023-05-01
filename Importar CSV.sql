SELECT * FROM Facturacion.dbo.CSVTest

/*
CREATE DATABASE TestData 
DROP DATABASE TestData

USE TestData

CREATE TABLE CSVTest
(ID INT,
FirstName VARCHAR(40),
LastName VARCHAR(40),
BirthDate SMALLDATETIME)

SELECT * FROM CSVTest

DELETE CSVTest

*/

/*
BULK INSERT Facturacion.dbo.CSVTest FROM 'D:\Applications\SQL64\CSVTest.txt' 
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
*/

--SELECT * FROM Facturacion.dbo.CSVTest