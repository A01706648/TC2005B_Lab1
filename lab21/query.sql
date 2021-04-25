--  The sum of the quantities and total amount of all deliveries made during 97.
SELECT SUM(e.Cantidad)
FROM entregan e
WHERE e.fecha BETWEEN '01/01/97' AND '31/12/97'
--  For each supplier, obtain the supplier's business name, number of deliveries and total amount of deliveries made.
SELECT provider.RazonSocial, COUNT(*) AS 'deliver_num', SUM(e.Cantidad) AS 'total_amount'
FROM proveedores provider INNER JOIN entregan e ON provider.RFC=e.RFC
GROUP BY provider.RazonSocial
--  For each material, obtain the key and description of the material, the total quantity delivered, the minimum quantity delivered, the maximum quantity delivered, the total amount of deliveries of those materials in which the average quantity delivered is greater than 400.

--  For each supplier, indicate their company name and show the average quantity of each material delivered, detailing the key and description of the material, excluding those suppliers for whom the average quantity is less than 500.

--  Show in a single query the same data as in the previous query but for two groups of suppliers: those for whom the average quantity delivered is less than 370 and those for which the average quantity delivered is greater than 450.




--  Key and description of the materials that have never been delivered.

--  Company name of the suppliers that have made deliveries to both the 'Vamos M¨¦xico' project and the 'Quer¨¦taro Limpio' project.

--  Description of the materials that have never been delivered to the 'CIT Yucat¨¢n' project.

--  Company name and average quantity delivered of suppliers whose average quantity delivered is greater than the average quantity delivered by the supplier with RFC 'VAGO780901'.

--  RFC, company name of the suppliers that participated in the 'Infonavit Durango' project and whose total quantities delivered in 2000 were greater than the total quantities delivered in 2001.