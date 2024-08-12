
---FULL JOIN ----


--FULL JOIN : Tüm tablomuz geliyor gibi de düþünebiliriz.
-- INNER JOIN + LEFT JOIN + RIGHT JOIN
--TÜM KESÝÞENLER + SOLDAKÝ TABLODAN KESÝÞMEYENLER + SAÐDAKÝ TABLODAN KESÝÞMEYENLER



select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler


SELECT A.Ad,B.DepartmantAdý FROM
Ornek.dbo.OfisCalýsan A
FULL JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID

















