--GROUP BY

--1 : 


--SYNTAX:
SELECT Kolon Adlar�
FROM Tablo Ad�
WHERE �art
GROUP BY Kolon Adlar�
ORDER BY Kolon Adlar�

/*
Aggregate fonk.kullan�yorsak ve en az bir adet s�tun bilgisi yazm��sak select ifadesine Group By
kullanmak zorunday�z.
*/



----SELECT ve FROM ifadeleri aras�nda sadece Kolon ad� belirtmi�sek , yani Agg.fonksiyon kullanmam��sak  DISTINCT gibi �al���r.

--�rnek :
SELECT * FROM Ornek.dbo.�simDeneme

--GROUP BY:Agg.Fonk.�le Kullan�lmad��� Zaman 
SELECT �sim FROM Ornek.dbo.�simDeneme
GROUP BY �sim


--DISTINCT:
SELECT DISTINCT(�sim) FROM Ornek.dbo.�simDeneme



--�rnek :


select * from Ornek.dbo.Grup

--Agg.fonksiyonlar� ile kullan�lmad��� zaman
select Tak�m from Ornek.dbo.Grup
GROUP BY Tak�m;



--S�tun belritmeden sadece toplam sonu� d�nd�r�ken sorun yok g�r�ld��� gibi
SELECT SUM(Puan) From Ornek.dbo.Grup;

--Group By kullanmad���m�z Zaman Hata Al�r�z :
SELECT Tak�m,SUM(Puan) From Ornek.dbo.Grup;


--Group By Kulland���m�z Zaman : Tak�mlar� gruplay�p yan�na her bir tak�m�n ald��� puan� yazd�.
--Excel'deki Pivot i�leminin ayn�s�n� yapt�.
SELECT Tak�m,SUM(Puan) AS 'Toplam Puan' From Ornek.dbo.Grup;
GROUP BY Tak�m;





--COUNT :
SELECT Tak�m,COUNT(Puan)  From Ornek.dbo.Grup
GROUP BY Tak�m;

--SUM :
SELECT Tak�m,SUM(Puan)  From Ornek.dbo.Grup
GROUP BY Tak�m;

--AVG :
SELECT Tak�m,AVG(Puan) From Ornek.dbo.Grup
GROUP BY Tak�m;

--MIN :
SELECT Tak�m,MIN(Puan) From Ornek.dbo.Grup
GROUP BY Tak�m;


--MAX :
SELECT Tak�m,MAX(Puan) From Ornek.dbo.Grup
GROUP BY Tak�m;

---

--�RNEK :

SELECT * FROM Ornek.dbo.Deneme

--�RNEK :
SELECT Ad FROM Ornek.dbo.Deneme
GROUP BY Ad;
--------------


---�RNEK :


---�RNEK :
SELECT COUNT(*) FROM HumanResources.Employee -- 290 SATIR

SELECT COUNT(*),COUNT(Gender),COUNT(DISTINCT(GENDER)) FROM HumanResources.Employee


SELECT COUNT(BusinessEntityID) FROM HumanResources.Employee
WHERE Gender = ('M')--206 SATIR

SELECT COUNT(BusinessEntityID) FROM HumanResources.Employee
WHERE Gender = ('F')--84 SATIR

SELECT 206 + 84 -- 290 SATIR


SELECT Gender,COUNT(BusinessEntityID)FROM HumanResources.Employee
GROUP BY Gender;


SELECT Gender,COUNT(BusinessEntityID) FROM HumanResources.Employee
GROUP BY Gender;


-----


Select City,COUNT(AddressID) from Person.Address
GROUP BY City
ORDER BY COUNT(AddressID) DESC


--�RNEK :
SELECT City,COUNT(City) AS Adet FROM Person.Address
GROUP BY City
ORDER BY Adet DESC

SELECT * FROM Person.Address
WHERE City = 'London';--434 sat�r





---�RNEK

Select FirstName,COUNT(BusinessEntityID) AS Say� from Person.Person
GROUP BY FirstName
ORDER BY Say� DESC;

SELECT * FROM Person.Person
WHERE FirstName =('Richard');










-- �RNEK

SELECT * FROM HumanResources.Employee;

SELECT MaritalStatus,SUM(VacationHours),SUM(SickLeaveHours) FROM HumanResources.Employee
GROUP BY MaritalStatus;



SELECT MaritalStatus,AVG(SickLeaveHours) FROM HumanResources.Employee
GROUP BY MaritalStatus;



SELECT Gender,Sum(SickLeaveHours) FROM HumanResources.Employee
GROUP BY Gender;



SELECT Color,COUNT(ProductID) FROM Production.Product
WHERE ListPrice BETWEEN 50 AND 100
GROUP BY Color;


SELECT Color,COUNT(ProductID) FROM Production.Product
GROUP BY Color;









---�RNEK

SELECT * FROM Sales.SalesPersonQuotaHistory

Select
BusinessEntityID,
Sum(SalesQuota)
from Sales.SalesPersonQuotaHistory
GROUP BY BusinessEntityID



--�RNEK :
Select
YEAR(QuotaDate),
Sum(SalesQuota)
from Sales.SalesPersonQuotaHistory
GROUP BY YEAR(QuotaDate)



Select
YEAR(QuotaDate),
AVG(SalesQuota)
from Sales.SalesPersonQuotaHistory
GROUP BY YEAR(QuotaDate)



--�RNEK:
SELECT
BusinessEntityID,
MIN(SalesQuota),
MAX(SalesQuota)
FROM Sales.SalesPersonQuotaHistory
GROUP BY BusinessEntityID

--Kan�tlayal�m :
SELECT * FROM Sales.SalesPersonQuotaHistory
WHERE BusinessEntityID = 274
ORDER BY SalesQuota

--------






-- ### GROUP BY GENEL �RNEK BA�LANGI�  ### --

SELECT * FROM Ornek.dbo.Cal�sanlar


SELECT Sehir,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir


SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir,Cinsiyet
ORDER BY Sehir,Cinsiyet



SELECT Sehir,Cinsiyet,SUM(Maas),COUNT(ID) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir,Cinsiyet
ORDER BY Sehir,Cinsiyet



SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
WHERE Cinsiyet ='E'
GROUP BY Sehir,Cinsiyet



SELECT Cinsiyet,MIN(Maas),MAX(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Cinsiyet


-------------



-- ### GROUP BY GENEL �RNEK Biti�  ### --













