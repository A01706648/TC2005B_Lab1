BULK INSERT a01706648.dbo.[Entregan]
   FROM 'C:\Program Files\Microsoft SQL Server\ServerData\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )