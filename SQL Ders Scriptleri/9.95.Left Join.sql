
select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler



--LEFT JOIN :


select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar

--Tüm çalýþanlarýn Adý ve departmant adlarý gelsin :

SELECT A.Ad,B.DepartmantAdý FROM
Ornek.dbo.OfisCalýsan A
LEFT JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID




