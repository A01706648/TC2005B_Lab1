INSERT INTO Materiales values(1000, 'xxx', 1000);
Delete from Materiales where Clave = 1000 and Costo = 1000;

--Add Constrain
ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave);
INSERT INTO Materiales values(1000, 'xxx', 1000);

--Check any constrain defined
sp_helpconstraint materiales;

--in case make mistake of add Constrain
ALTER TABLE tableName drop constraint ConstraintName;