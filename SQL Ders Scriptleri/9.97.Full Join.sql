
---FULL JOIN ----


--FULL JOIN : Tüm tablomuz geliyor gibi de düşünebiliriz.
-- INNER JOIN + LEFT JOIN + RIGHT JOIN
--TÜM KESİŞENLER + SOLDAKİ TABLODAN KESİŞMEYENLER + SAĞDAKİ TABLODAN KESİŞMEYENLER



select * from Ornek.dbo.OfisCalısan
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler


SELECT A.Ad,B.DepartmantAdı FROM
Ornek.dbo.OfisCalısan A
FULL JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID

















