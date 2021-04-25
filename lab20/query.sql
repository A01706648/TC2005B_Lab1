set dateformat dmy;

SELECT m.Descripcion,e.Fecha FROM Materiales m, Entregan e 
WHERE m.Clave = e.Clave AND e.Fecha >= '01/01/00' AND e.Fecha <= '31/12/00'
ORDER BY e.Fecha DESC;

DECLARE @foo varchar (40);
DECLARE @bar varchar (40);
SET @foo = 'What result';
SET @bar = '??? '
SET @foo +=' do you get? ';
PRINT @foo + @bar;

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

SELECT Clave,RFC,Numero,Fecha,Cantidad
FROM Entregan
WHERE Numero Between 5000 and 5010;

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

--Equal
SELECT E.RFC,E.Cantidad, E.Fecha,E.Numero
FROM Entregan E, Proveedores P
WHERE E.Numero Between 5000 and 5010 
AND P.RazonSocial LIKE 'La%'
AND E.RFC = P.RFC

--IN QUERY
SELECT E.RFC,E.Cantidad, E.Fecha,E.Numero
FROM Entregan E
WHERE E.Numero Between 5000 and 5010
AND E.RFC IN (SELECT E.RFC FROM Entregan E, Proveedores P 
				WHERE P.RazonSocial LIKE 'La%' AND E.RFC = P.RFC);
                
--ANY QUERY
SELECT E.RFC,E.Cantidad, E.Fecha,E.Numero
FROM Entregan E
WHERE E.Numero Between 5000 and 5010
AND E.RFC = ANY (SELECT E.RFC FROM Entregan E, Proveedores P 
				WHERE P.RazonSocial LIKE 'La%' AND E.RFC = P.RFC);                   
                
--SOME QUERY
SELECT E.RFC,E.Cantidad, E.Fecha,E.Numero
FROM Entregan E
WHERE E.Numero Between 5000 and 5010
AND E.RFC = SOME (SELECT E.RFC FROM Entregan E, Proveedores P 
				WHERE P.RazonSocial LIKE 'La%' AND E.RFC = P.RFC);    

SELECT TOP 2 * FROM Proyectos;--Project PK is Clave, so the top 2 clave
SELECT TOP Numero FROM Proyectos;-- fail, since the Numero is not sorted               

-- Add the TaxPercentage column to the materials table with the instruction:
ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);
-- In order for the materials to have a tax, we will assign them dummy taxes based on their keys with the instruction:
UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;
 
 
--      The materials (key and description) delivered to the project "Mexico without you we are not complete."
--Los materiales (clave y descripci車n) entregados al proyecto "M谷xico sin ti no estamos completos".
SELECT m.descripcion, m.clave FROM (Entregan e INNER JOIN Materiales m ON e.clave=m.clave) INNER JOIN Proyectos p ON p.Numero=e.Numero
WHERE p.Denominacion LIKE 'Mexico sin ti no estamos completos'


--      The materials (key and description) that have been provided by the supplier "Acme tools".
--Los materiales (clave y descripci車n) que han sido proporcionados por el proveedor "Acme tools".
SELECT m.descripcion, m.clave FROM (Entregan e INNER JOIN Materiales m ON e.clave=m.clave) INNER JOIN Proveedores p ON p.RFC=e.RFC
WHERE p.RazonSocial='Acme tools'

--      The RFC of the suppliers that during 2000 delivered on average at least 300 materials.
--El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales
CREATE VIEW deliver_num (RFC, Cantidad) AS SELECT p.RFC, sum(e.Cantidad) FROM Proveedores p INNER JOIN Entregan e ON  p.RFC=e.RFC
WHERE e.Fecha BETWEEN '01/01/00' AND '31/12/00'
GROUP BY p.RFC;

SELECT * FROM deliver_num1
WHERE Cantidad >= 300;

SELECT p.RFC,AVG(e.Cantidad) FROM Proveedores p INNER JOIN Entregan e ON  p.RFC=e.RFC
WHERE e.Fecha BETWEEN '01/01/00' AND '31/12/00'
GROUP BY p.RFC
HAVING AVG(e.Cantidad)>=300

--      The Total delivered for each material in the year 2000.
--El Total entregado por cada material en el a?o 2000.
SELECT sum(e.Cantidad) AS total_deliver FROM Proveedores p INNER JOIN Entregan e ON  p.RFC=e.RFC
WHERE e.Fecha BETWEEN '01/01/00' AND '31/12/00'

--      The Key to the best-selling material during 2001. (It is recommended to use an intermediate view for your solution)
--La Clave del material m芍s vendido durante el 2001. (se recomienda usar una vista intermedia para su soluci車n)
CREATE VIEW sell_total (RFC, Cantidad) AS SELECT p.RFC, sum(e.Cantidad) FROM Proveedores p INNER JOIN Entregan e ON  p.RFC=e.RFC
WHERE e.Fecha BETWEEN '01/01/01' AND '31/12/01'
GROUP BY p.RFC;

SELECT * FROM sell_total
WHERE Cantidad = (SELECT MAX(Cantidad) FROM sell_total)

--      Products that contain the pattern 'ub' in their name.
--Productos que contienen el patr車n 'ub' en su nombre.
SELECT * FROM materiales m
WHERE m.Descripcion LIKE '[^]%ub[^]%'

--      Denomination and sum of the total to be paid for all projects.
--Denominaci車n y suma del total a pagar para todos los proyectos.
SELECT p.Denominacion, sum(m.Costo * e.Cantidad) AS 'total_pay' FROM (Entregan e INNER JOIN Materiales m ON e.clave=m.clave) INNER JOIN Proyectos p ON p.Numero=e.Numero
GROUP BY p.Denominacion
ORDER BY total_pay

--      Name, RFC and Social Reason of the suppliers that supply materials to the Televisa in action project that are not supporting the Educando en Coahuila project (Only using views).
--Denominaci車n, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acci車n que no se encuentran apoyando al proyecto Educando en Coahuila (Solo usando vistas).
SELECT DISTINCT provider.RFC, provider.RazonSocial
FROM (proveedores provider INNER JOIN entregan e ON provider.RFC=e.RFC) INNER JOIN proyectos project ON e.Numero=project.Numero
WHERE project.Denominacion!='Educando en Coahuila'

--      Name, RFC and Social Reason of the providers that supply materials to the Televisa in action project that are not supporting the Educando project in Coahuila (Without using views, use not in, in or exists).
--Denominaci車n, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acci車n que no se encuentran apoyando al proyecto Educando en Coahuila (Sin usar vistas, utiliza not in, in o exists).
SELECT DISTINCT provider.RFC, provider.RazonSocial
FROM (proveedores provider INNER JOIN entregan e ON provider.RFC=e.RFC) INNER JOIN proyectos project ON e.Numero=project.Numero
WHERE project.Numero NOT IN (SELECT p.Numero FROM proyectos p WHERE p.Denominacion='Educando en Coahuila')

--      Cost of materials and Materials that are delivered to the Televisa en Acci車n project, whose suppliers also supply materials to the Educando project in Coahuila. 
--Costo de los materiales y los Materiales que son entregados al proyecto Televisa en acci車n cuyos proveedores tambi谷n suministran materiales al proyecto Educando en Coahuila.
SELECT SUM(e.Cantidad * m.Costo)
FROM ((Entregan e INNER JOIN Materiales m ON e.clave=m.clave) INNER JOIN Proyectos project ON project.Numero=e.Numero) INNER JOIN Proveedores provider ON provider.RFC=e.RFC
WHERE provider.RFC IN
((SELECT DISTINCT provider.RFC
FROM ((Entregan e INNER JOIN Materiales m ON e.clave=m.clave) INNER JOIN Proyectos project ON project.Numero=e.Numero) INNER JOIN Proveedores provider ON provider.RFC=e.RFC
WHERE project.Denominacion LIKE 'Televisa en acci[^]%')
INTERSECT
(SELECT DISTINCT provider.RFC
FROM ((Entregan e INNER JOIN Materiales m ON e.clave=m.clave) INNER JOIN Proyectos project ON project.Numero=e.Numero) INNER JOIN Proveedores provider ON provider.RFC=e.RFC
WHERE project.Denominacion='Educando en Coahuila'))
AND project.Denominacion LIKE 'Televisa en acci[^]%'