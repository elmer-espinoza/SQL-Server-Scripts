/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [CODE], [NAME] FROM [Facturacion].[ELMER].[Test]

ALTER SCHEMA dbo TRANSFER ELMER.Test;  

SELECT [CODE], [NAME] FROM [Facturacion].[dbo].[Test]

ALTER SCHEMA ELMER TRANSFER dbo.Test;  

SELECT [CODE], [NAME] FROM [Facturacion].[ELMER].[Test] ORDER BY 1; 