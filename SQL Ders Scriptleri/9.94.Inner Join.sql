-- INNER JOIN --



select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler




--INNER JOIN--




--�al��an Ad� ve departmant ad�n� getirin :
select * from Ornek.dbo.OfisCal�san --D1,D2,D10
select * from Ornek.dbo.Departmanlar --D1,D2,D3,D4

SELECT A.Ad,B.DepartmantAd� FROM
Ornek.dbo.OfisCal�san A 
INNER JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID

----------------------


--INNER JOIN ESK� YAZIM--

SELECT A.Ad,B.DepartmantAd� FROM Ornek.dbo.OfisCal�san A,Ornek.dbo.Departmanlar B
WHERE A.DeptID = B.DeptID













