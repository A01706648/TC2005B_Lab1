BULK INSERT a01706648.dbo.[Materiales]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )