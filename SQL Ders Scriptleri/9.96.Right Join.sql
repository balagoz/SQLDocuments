

select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler



-----RIGHT JOIN------
--�al��an Ad� ve departmant ad�n� getirin :
--INNER JOIN + SA�DAK� D��ERLER� G�B� DE D���NEB�L�R�Z.

select * from Ornek.dbo.OfisCal�san

select * from Ornek.dbo.Departmanlar

SELECT A.Ad,B.DepartmantAd� FROM 
Ornek.dbo.OfisCal�san A
RIGHT JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID





--RIGHT JOIN VE LEFT JOIN--
--Asl�nda nomralde hi� right join yapmam�za gerek yok. 
--A�a��daki left join ile de ayn� sonucu al�r�z.


SELECT B.Ad,A.DepartmantAd� FROM 
Ornek.dbo.Departmanlar A
LEFT JOIN
Ornek.dbo.OfisCal�san B
ON A.DeptID = B.DeptID



