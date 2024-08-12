--- ### CTE BAÞLANGIÇ ### ---

--Özetle CTE'leri geçici bir result set olarak düþünebiliriz.
--SELECT,INSERT,UPDATE,DELETE ifadelerini referans olarak gösterebilirler.
--SELECT,INSERT,UPDATE,DELETE ifadeleri CTE'sonra gelir.

--SYNTAX : WITH CTE_ADI (Kolon1,Kolon2...) AS (Sorgu)
--UYARI : CTE ile Select sorgusunun arasýnda baþka bir ifade yer almamlýdýr.

/*

WITH expression_name[(column_name [,...])]
AS
    (CTE_definition)
SQL_statement;

*/

--ÖRNEK 1 :

--Ýfade bir bütün olarak çalýþtýrýlmalýdýr.



WITH HREMP AS
(
SELECT * FROM HumanResources.Employee
)
SELECT * FROM HREMP




--ÖRNEK 2 : -- Kolon Adlarýda verebiliriz.

WITH HREMP (ID,ÝÞTANIMI)AS
(
SELECT [BusinessEntityID],[JobTitle] FROM HumanResources.Employee
)
SELECT * FROM HREMP



--VEYA ORJÝNALLERÝNÝ KULLANABLÝRÝZ :
WITH HREMP ([BusinessEntityID],[JobTitle])AS
(
SELECT [BusinessEntityID],[JobTitle] FROM HumanResources.Employee
)
SELECT * FROM HREMP






--ÖRNEK 3 :
--CTE'de iþlemde yapabiliriz.

WITH HRDENEME AS
(
SELECT Gender,COUNT(Gender)AS ADET FROM HumanResources.Employee
GROUP BY Gender
)

SELECT SUM (ADET) FROM HRDENEME



--ÖRNEK 3 :
--WHERE koþulu ile filtreleme de yapabiliriz.
WITH HRVICE AS
(
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Vice%'
)


SELECT * FROM HRVICE
WHERE[NationalIDNumber] LIKE '%7'


--ÖRNEK 4 :
--CTE'de iþlemde yapabiliriz.
WITH PRO AS
(
SELECT
Color,
SUM(ListPrice) AS Toplam
FROM Production.Product
where Color IS NOT NULL AND ListPrice >0
GROUP BY Color
)
SELECT AVG(Toplam) FROM PRO



--ÖRNEK 4 :
--WITH PROP ifadesinde ne kadar kolon sayýsý belirtmiþsek ayný kolon sayýsýný kullanmak zorundayýz Select Ýfadesinde
WITH PROP (Renk,ToplamAdet) AS
(
SELECT
Color,
SUM(ListPrice) AS Toplam
FROM Production.Product
where Color IS NOT NULL AND ListPrice >0
GROUP BY Color
)

select Renk,ToplamAdet FROM PROP



--Birden Fazla CTE yaratma ve Joinleme

WITH StateName AS
(
SELECT StateProvinceID,Name FROM Person.StateProvince
),
CityName AS
(
SELECT AddressID,StateProvinceID,City FROM Person.Address
)

SELECT A.*,B.Name FROM
CityName A
LEFT JOIN
StateName B
ON A.StateProvinceID=B.StateProvinceID




--ÖRNEK 4 : Normal Bir tablo ile CTE'YÝ DE Joinleyebiliriz:

--Normal Tablomuz:
SELECT StateProvinceID,Name FROM Person.StateProvince

--CTE Ýfademiz:
WITH SEHIRADET AS
(
SELECT StateProvinceID,COUNT(City)AS SEHÝRADET FROM Person.Address
GROUP BY StateProvinceID
)

SELECT A.StateProvinceID,A.SEHÝRADET,B.Name FROM
SEHIRADET A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID



--ÖRNEK 5 : CTE ile Select sorgusunun arasýna baþka bir þey gelmemeli. Hata alýrýz.

WITH SEHIRADET AS
(
SELECT StateProvinceID,COUNT(City)AS SEHÝRADET FROM Person.Address
GROUP BY StateProvinceID
)

PRINT 'Onur'

SELECT A.StateProvinceID,A.SEHÝRADET,B.Name FROM
SEHIRADET A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID



--ÖRNEK 6 : Birden Çok CTE yaratmak ve Union All Örneði :

--TABLO 1:
SELECT StateProvinceID,COUNT(City)AS SEHÝRADET FROM Person.Address
GROUP BY StateProvinceID

--TABLO 2:
SELECT StateProvinceID,Name FROM Person.StateProvince

--JOINLÝYORUZ :


SELECT
A.StateProvinceID,
B.Name,
COUNT(A.City) AS SEHÝRADET
FROM
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY A.StateProvinceID,B.Name
HAVING (A.StateProvinceID) BETWEEN 1 AND 100




--CTE YARATIYORUZ :

WITH BÝRYÜZARASI AS
(
SELECT
A.StateProvinceID,
B.Name,
COUNT(A.City) AS SEHÝRADET
FROM
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY A.StateProvinceID,B.Name
HAVING (A.StateProvinceID) BETWEEN 1 AND 100
),
YÜZBÝRÝLEYÜZSEKSENBÝRARASI AS
(
SELECT
A.StateProvinceID,
B.Name,
COUNT(A.City) AS SEHÝRADET
FROM
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY A.StateProvinceID,B.Name
HAVING (A.StateProvinceID) BETWEEN 101 AND 181
)


SELECT * FROM BÝRYÜZARASI
UNION
SELECT * FROM YÜZBÝRÝLEYÜZSEKSENBÝRARASI
ORDER BY StateProvinceID

