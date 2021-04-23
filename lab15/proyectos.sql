BULK INSERT a01706648.dbo.[Proyectos]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )