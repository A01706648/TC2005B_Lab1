BULK INSERT a01706648.dbo.[Proveedores]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )