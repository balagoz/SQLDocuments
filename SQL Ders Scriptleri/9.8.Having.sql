-- HAVING

--1 : 

--SYNTAX:
SELECT Kolon Listesi
FROM Tablo Ad�
WHERE �art
GROUP BY Kolon Listesi
HAVING �art
ORDER BY Kolon Listesi



--HAVING EN �OK KULLANILAN ALANI:

--A�a��daki gibi bir tablomuz olsun :
SELECT * FROM Ornek.dbo.Cal�sanlar

SELECT Sehir,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir




--Gruplanm�� tablomuz :

SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir,Cinsiyet
ORDER BY Sehir



--�RNEK:
SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir,Cinsiyet
HAVING Cinsiyet = 'E';

--�RNEK : Gruplanm�� tablomuz :


SELECT Color,COUNT(ProductID) AS Adet FROM Production.Product
GROUP BY Color



SELECT Color,COUNT(ProductID) AS Adet FROM Production.Product
GROUP BY Color
HAVING Color = 'Black';



SELECT Color,COUNT(ProductID) AS Adet FROM Production.Product
GROUP BY Color
HAVING COUNT(ProductID) > 200;



-- �rnek :

SELECT * FROM HumanResources.Employee



--�RNEK : Gruplanm�� tablomuz :

SELECT JobTitle,COUNT(BusinessEntityID) AS ADET FROM HumanResources.Employee
GROUP BY JobTitle
ORDER BY ADET DESC



--�RNEK : Having ile filtreleme Yapt���m�zda: 

SELECT JobTitle,COUNT(BusinessEntityID) AS ADET FROM HumanResources.Employee
GROUP BY JobTitle
HAVING COUNT(BusinessEntityID) >= 25
ORDER BY ADET DESC


