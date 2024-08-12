--GROUP BY

--1 : 


--SYNTAX:
SELECT Kolon Adlarý
FROM Tablo Adý
WHERE Þart
GROUP BY Kolon Adlarý
ORDER BY Kolon Adlarý

/*
Aggregate fonk.kullanýyorsak ve en az bir adet sütun bilgisi yazmýþsak select ifadesine Group By
kullanmak zorundayýz.
*/



----SELECT ve FROM ifadeleri arasýnda sadece Kolon adý belirtmiþsek , yani Agg.fonksiyon kullanmamýþsak  DISTINCT gibi çalýþýr.

--Örnek :
SELECT * FROM Ornek.dbo.ÝsimDeneme

--GROUP BY:Agg.Fonk.Ýle Kullanýlmadýðý Zaman 
SELECT Ýsim FROM Ornek.dbo.ÝsimDeneme
GROUP BY Ýsim


--DISTINCT:
SELECT DISTINCT(Ýsim) FROM Ornek.dbo.ÝsimDeneme



--Örnek :


select * from Ornek.dbo.Grup

--Agg.fonksiyonlarý ile kullanýlmadýðý zaman
select Takým from Ornek.dbo.Grup
GROUP BY Takým;



--Sütun belritmeden sadece toplam sonuç döndürüken sorun yok görüldüðü gibi
SELECT SUM(Puan) From Ornek.dbo.Grup;

--Group By kullanmadýðýmýz Zaman Hata Alýrýz :
SELECT Takým,SUM(Puan) From Ornek.dbo.Grup;


--Group By Kullandýðýmýz Zaman : Takýmlarý gruplayýp yanýna her bir takýmýn aldýðý puaný yazdý.
--Excel'deki Pivot iþleminin aynýsýný yaptý.
SELECT Takým,SUM(Puan) AS 'Toplam Puan' From Ornek.dbo.Grup;
GROUP BY Takým;





--COUNT :
SELECT Takým,COUNT(Puan)  From Ornek.dbo.Grup
GROUP BY Takým;

--SUM :
SELECT Takým,SUM(Puan)  From Ornek.dbo.Grup
GROUP BY Takým;

--AVG :
SELECT Takým,AVG(Puan) From Ornek.dbo.Grup
GROUP BY Takým;

--MIN :
SELECT Takým,MIN(Puan) From Ornek.dbo.Grup
GROUP BY Takým;


--MAX :
SELECT Takým,MAX(Puan) From Ornek.dbo.Grup
GROUP BY Takým;

---

--ÖRNEK :

SELECT * FROM Ornek.dbo.Deneme

--ÖRNEK :
SELECT Ad FROM Ornek.dbo.Deneme
GROUP BY Ad;
--------------


---ÖRNEK :


---ÖRNEK :
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


--ÖRNEK :
SELECT City,COUNT(City) AS Adet FROM Person.Address
GROUP BY City
ORDER BY Adet DESC

SELECT * FROM Person.Address
WHERE City = 'London';--434 satýr





---ÖRNEK

Select FirstName,COUNT(BusinessEntityID) AS Sayý from Person.Person
GROUP BY FirstName
ORDER BY Sayý DESC;

SELECT * FROM Person.Person
WHERE FirstName =('Richard');










-- ÖRNEK

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









---ÖRNEK

SELECT * FROM Sales.SalesPersonQuotaHistory

Select
BusinessEntityID,
Sum(SalesQuota)
from Sales.SalesPersonQuotaHistory
GROUP BY BusinessEntityID



--ÖRNEK :
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



--ÖRNEK:
SELECT
BusinessEntityID,
MIN(SalesQuota),
MAX(SalesQuota)
FROM Sales.SalesPersonQuotaHistory
GROUP BY BusinessEntityID

--Kanýtlayalým :
SELECT * FROM Sales.SalesPersonQuotaHistory
WHERE BusinessEntityID = 274
ORDER BY SalesQuota

--------






-- ### GROUP BY GENEL ÖRNEK BAÞLANGIÇ  ### --

SELECT * FROM Ornek.dbo.Calýsanlar


SELECT Sehir,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir


SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir,Cinsiyet
ORDER BY Sehir,Cinsiyet



SELECT Sehir,Cinsiyet,SUM(Maas),COUNT(ID) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir,Cinsiyet
ORDER BY Sehir,Cinsiyet



SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Calýsanlar
WHERE Cinsiyet ='E'
GROUP BY Sehir,Cinsiyet



SELECT Cinsiyet,MIN(Maas),MAX(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Cinsiyet


-------------



-- ### GROUP BY GENEL ÖRNEK Bitiþ  ### --













