
---FULL JOIN ----


--FULL JOIN : T�m tablomuz geliyor gibi de d���nebiliriz.
-- INNER JOIN + LEFT JOIN + RIGHT JOIN
--T�M KES��ENLER + SOLDAK� TABLODAN KES��MEYENLER + SA�DAK� TABLODAN KES��MEYENLER



select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler


SELECT A.Ad,B.DepartmantAd� FROM
Ornek.dbo.OfisCal�san A
FULL JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID

















