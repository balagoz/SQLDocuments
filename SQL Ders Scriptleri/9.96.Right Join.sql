

select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler



-----RIGHT JOIN------
--Çalýþan Adý ve departmant adýný getirin :
--INNER JOIN + SAÐDAKÝ DÝÐERLERÝ GÝBÝ DE DÜÞÜNEBÝLÝRÝZ.

select * from Ornek.dbo.OfisCalýsan

select * from Ornek.dbo.Departmanlar

SELECT A.Ad,B.DepartmantAdý FROM 
Ornek.dbo.OfisCalýsan A
RIGHT JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID





--RIGHT JOIN VE LEFT JOIN--
--Aslýnda nomralde hiç right join yapmamýza gerek yok. 
--Aþaðýdaki left join ile de ayný sonucu alýrýz.


SELECT B.Ad,A.DepartmantAdý FROM 
Ornek.dbo.Departmanlar A
LEFT JOIN
Ornek.dbo.OfisCalýsan B
ON A.DeptID = B.DeptID



