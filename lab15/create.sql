
--Drop 4 tables
DROP TABLE Materiales;
DROP TABLE Proyectos;
DROP TABLE Proveedores;
DROP TABLE Entregan;

--sp_help Materiales

--check if table exist
--select * from sysobjects where xtype='U'

CREATE TABLE Materiales
(
  Clave numeric(5),
  Descripcion varchar(50),
  Costo numeric(8,2)
);

CREATE TABLE Proyectos
(
    Numero numeric(5),
    Denominacion varchar(100)
);

CREATE TABLE Proveedores
(
    RFC varchar(15),
    RazonSocial varchar(100)
);

CREATE TABLE Entregan
(
    Clave numeric(5),
    RFC varchar(15),
    Numero numeric(5),
    Fecha DATETIME,
    Cantidad numeric(5)
);

SET DATEFORMAT dmy