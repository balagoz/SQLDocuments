
select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler



--LEFT JOIN :


select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar

--T�m �al��anlar�n Ad� ve departmant adlar� gelsin :

SELECT A.Ad,B.DepartmantAd� FROM
Ornek.dbo.OfisCal�san A
LEFT JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID




