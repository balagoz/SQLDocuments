--- ### DER�VED TABLE ### ----
--Asl�nda tabloya alias vermedir.
--T�retilmi� tablolar�dr.


--�rnek:

SELECT Name FROM 
(SELECT DepartmentID,Name FROM HumanResources.Department)A



--�rnek iki tablomuz olsun:
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


--derived table yarat�yoruz:
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


--�RNEK:

SELECT * FROM Ornek.[dbo].[S�ralamaRank]

--1.durum:
SELECT 
Cinsiyet,
SUM(Maas)
FROM Ornek.[dbo].[S�ralamaRank]
GROUP BY Cinsiyet

--Derived Tabla �le :
SELECT Cinsiyet,SUM(Maas) FROM

(
SELECT 
Cinsiyet,
Maas
FROM Ornek.[dbo].[S�ralamaRank]
)A

GROUP BY Cinsiyet;