-- INNER JOIN --



select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler




--INNER JOIN--




--Çalýþan Adý ve departmant adýný getirin :
select * from Ornek.dbo.OfisCalýsan --D1,D2,D10
select * from Ornek.dbo.Departmanlar --D1,D2,D3,D4

SELECT A.Ad,B.DepartmantAdý FROM
Ornek.dbo.OfisCalýsan A 
INNER JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID

----------------------


--INNER JOIN ESKÝ YAZIM--

SELECT A.Ad,B.DepartmantAdý FROM Ornek.dbo.OfisCalýsan A,Ornek.dbo.Departmanlar B
WHERE A.DeptID = B.DeptID













