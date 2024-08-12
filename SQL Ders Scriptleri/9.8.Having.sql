-- HAVING

--1 : 

--SYNTAX:
SELECT Kolon Listesi
FROM Tablo Adý
WHERE Þart
GROUP BY Kolon Listesi
HAVING Þart
ORDER BY Kolon Listesi



--HAVING EN ÇOK KULLANILAN ALANI:

--Aþaðýdaki gibi bir tablomuz olsun :
SELECT * FROM Ornek.dbo.Calýsanlar

SELECT Sehir,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir




--Gruplanmýþ tablomuz :

SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir,Cinsiyet
ORDER BY Sehir



--ÖRNEK:
SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir,Cinsiyet
HAVING Cinsiyet = 'E';

--ÖRNEK : Gruplanmýþ tablomuz :


SELECT Color,COUNT(ProductID) AS Adet FROM Production.Product
GROUP BY Color



SELECT Color,COUNT(ProductID) AS Adet FROM Production.Product
GROUP BY Color
HAVING Color = 'Black';



SELECT Color,COUNT(ProductID) AS Adet FROM Production.Product
GROUP BY Color
HAVING COUNT(ProductID) > 200;



-- Örnek :

SELECT * FROM HumanResources.Employee



--ÖRNEK : Gruplanmýþ tablomuz :

SELECT JobTitle,COUNT(BusinessEntityID) AS ADET FROM HumanResources.Employee
GROUP BY JobTitle
ORDER BY ADET DESC



--ÖRNEK : Having ile filtreleme Yaptýðýmýzda: 

SELECT JobTitle,COUNT(BusinessEntityID) AS ADET FROM HumanResources.Employee
GROUP BY JobTitle
HAVING COUNT(BusinessEntityID) >= 25
ORDER BY ADET DESC


