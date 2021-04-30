--Check if there already exist procedure createmMterial
--if yes, remove the procedure
IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'creaMaterial' AND type = 'P')
    DROP PROCEDURE createsMaterial
GO--Send the Complete block to the Database

CREATE PROCEDURE creaMaterial
    @uclave NUMERIC (5,0),
    @udescription VARCHAR (50),
    @ucosto NUMERIC (8,2),
    @u tax NUMERIC (6.2)
ACE
    INSERT INTO Materials VALUES (@uclave, @udescripcion, @ucosto, @uimpuesto)
GO


--Call the procedure
EXECUTE creaMaterial 5000, 'Acme hammers', 250,15