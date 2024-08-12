--- ### DERÝVED TABLE ### ----
--Aslýnda tabloya alias vermedir.
--Türetilmiþ tablolarýdr.


--Örnek:

SELECT Name FROM 
(SELECT DepartmentID,Name FROM HumanResources.Department)A



--Örnek iki tablomuz olsun:
SELECT * FROM Person.AddressType
select * from [Person].[BusinessEntityAddress]

--JOINLIYORUZ:
SELECT
ISNULL(B.Name,'Toplam') as AdresTipi,
COUNT(A.BusinessEntityID)
FROM 
[Person].[BusinessEntityAddress] A
LEFT JOIN
Person.AddressType B
ON A.AddressTypeID = B.AddressTypeID
GROUP BY ROLLUP (B.Name)


--derived table yaratýyoruz:
SELECT * FROM 

(
SELECT
ISNULL(B.Name,'Toplam') as AdresTipi,
COUNT(A.BusinessEntityID) AS MusteriAdedi
FROM 
[Person].[BusinessEntityAddress] A
LEFT JOIN
Person.AddressType B
ON A.AddressTypeID = B.AddressTypeID
GROUP BY ROLLUP (B.Name)
)M
WHERE MusteriAdedi<800


--ÖRNEK:

SELECT * FROM Ornek.[dbo].[SýralamaRank]

--1.durum:
SELECT 
Cinsiyet,
SUM(Maas)
FROM Ornek.[dbo].[SýralamaRank]
GROUP BY Cinsiyet

--Derived Tabla Ýle :
SELECT Cinsiyet,SUM(Maas) FROM

(
SELECT 
Cinsiyet,
Maas
FROM Ornek.[dbo].[SýralamaRank]
)A

GROUP BY Cinsiyet;