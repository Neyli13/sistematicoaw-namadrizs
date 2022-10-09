USE AdventureWorks2019
GO

/*Diseñe un procedimiento almacenado (stored procedure) para ingresar un nuevo registro en la tabla Production. ProductCategory, puede omitir los parámetros que estime convenientes y hacer uso de los valores por defecto que la configuración de la tabla permita.*/
CREATE PROCEDURE INGRESAR_REGISTROS
@Name VARCHAR(100) , @ModifiedDate datetime
AS
INSERT INTO [Production].[ProductCategory]([Name],[ModifiedDate])
	VALUES(@Name, @ModifiedDate )
GO

EXEC INGRESAR_REGISTROS 'TECNOLOGIA', '9999-12-31'
GO

EXEC INGRESAR_REGISTROS 'ELECTRODOMESTICOS', '9998-12-31'
GO

EXEC INGRESAR_REGISTROS 'LIMPIEZA', '9995-12-31'
GO

EXEC INGRESAR_REGISTROS 'DECORACION', '9993-12-31'
GO

EXEC INGRESAR_REGISTROS 'CALZADO', '2022-12-31'
GO

SELECT * FROM [Production].[ProductCategory]
GO

/*Cree una función de usuario (user function) que muestre un listado de los empleados (HumanResources.Employee) con las siguientes columnas LoginID, JobTitle, BirthDate, HireDate. Además, deberá mostrar dos columnas adicionales en las que se muestre un cálculo de la Edad de la persona basado en BirthDate y la Antigüedad basado en HireDate.
*/

CREATE FUNCTION LISTA_CUMPLE ()
RETURNS TABLE
AS RETURN 

(
SELECT  LoginID, JobTitle, BirthDate, HireDate
	FROM HumanResources.Employee
)
GO

SELECT * FROM LISTA_CUMPLE ()
GO

/*Crear un nuevo rol llamado Vendedores, los miembros de este rol deberán poseer los permisos de lectura y escritura (actualización y borrado) sobre el schema Sales y permisos de lectura sobre las tablas Production. ProductCategory y Production.Product
*/

CREATE ROLE VENDEDORES AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA::SALES TO VENDEDORES
GO

GRANT UPDATE ON SCHEMA::SALES TO VENDEDORES
GO
GRANT DELETE ON SCHEMA::SALES TO VENDEDORES
GO
GRANT SELECT ON SCHEMA::PRODUCTION TO VENDEDORES
GO

/*Crear un usuario con las iniciales de tus dos nombres + tu primer apellido. Si tu nombre es Felix Ruben García tu login y usuario deberían ser frgarcia.
Hacer al usuario miembro del rol Vendedores*/

CREATE LOGIN HumanResourcesUser WITH PASSWORD = 'naruto'
GO
CREATE LOGIN NAMadriz WITH PASSWORD = 'naruto'
GO
CREATE USER HumanResourcesUser FOR LOGIN HumanResourcesUser WITH DEFAULT_SCHEMA = dbo;
GO

ALTER ROLE VENDEDORES ADD MEMBER NAMadriz
GO





