IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
DROP TABLE Materiales
CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave);  

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores
CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)

ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC);  

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE Proyectos
CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)

ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero);  

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan
CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)

ALTER TABLE entregan add constraint cfentreganclave1
foreign key (clave) references materiales(clave);
ALTER TABLE entregan add constraint cfentreganclave2
foreign key (RFC) references Proveedores(RFC);
ALTER TABLE entregan add constraint cfentreganclave3
foreign key (Numero) references Proyectos(Numero);

ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ;

BULK INSERT a01706648.dbo.[Materiales]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )    
      
BULK INSERT a01706648.dbo.[Proveedores]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )

SET DATEFORMAT dmy      

BULK INSERT a01706648.dbo.[Entregan]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )

BULK INSERT a01706648.dbo.[Proyectos]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )      
      
