--- ### CTE BA�LANGI� ### ---

--�zetle CTE'leri ge�ici bir result set olarak d���nebiliriz.
--SELECT,INSERT,UPDATE,DELETE ifadelerini referans olarak g�sterebilirler.
--SELECT,INSERT,UPDATE,DELETE ifadeleri CTE'sonra gelir.

--SYNTAX : WITH CTE_ADI (Kolon1,Kolon2...) AS (Sorgu)
--UYARI : CTE ile Select sorgusunun aras�nda ba�ka bir ifade yer almaml�d�r.

/*

WITH expression_name[(column_name [,...])]
AS
    (CTE_definition)
SQL_statement;

*/

--�RNEK 1 :

--�fade bir b�t�n olarak �al��t�r�lmal�d�r.



WITH HREMP AS
(
SELECT * FROM HumanResources.Employee
)
SELECT * FROM HREMP




--�RNEK 2 : -- Kolon Adlar�da verebiliriz.

WITH HREMP (ID,��TANIMI)AS
(
SELECT [BusinessEntityID],[JobTitle] FROM HumanResources.Employee
)
SELECT * FROM HREMP



--VEYA ORJ�NALLER�N� KULLANABL�R�Z :
WITH HREMP ([BusinessEntityID],[JobTitle])AS
(
SELECT [BusinessEntityID],[JobTitle] FROM HumanResources.Employee
)
SELECT * FROM HREMP






--�RNEK 3 :
--CTE'de i�lemde yapabiliriz.

WITH HRDENEME AS
(
SELECT Gender,COUNT(Gender)AS ADET FROM HumanResources.Employee
GROUP BY Gender
)

SELECT SUM (ADET) FROM HRDENEME



--�RNEK 3 :
--WHERE ko�ulu ile filtreleme de yapabiliriz.
WITH HRVICE AS
(
SELECT * FROM HumanResources.Employee
WHERE JobTitle LIKE '%Vice%'
)


SELECT * FROM HRVICE
WHERE[NationalIDNumber] LIKE '%7'


--�RNEK 4 :
--CTE'de i�lemde yapabiliriz.
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



--�RNEK 4 :
--WITH PROP ifadesinde ne kadar kolon say�s� belirtmi�sek ayn� kolon say�s�n� kullanmak zorunday�z Select �fadesinde
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




--�RNEK 4 : Normal Bir tablo ile CTE'Y� DE Joinleyebiliriz:

--Normal Tablomuz:
SELECT StateProvinceID,Name FROM Person.StateProvince

--CTE �fademiz:
WITH SEHIRADET AS
(
SELECT StateProvinceID,COUNT(City)AS SEH�RADET FROM Person.Address
GROUP BY StateProvinceID
)

SELECT A.StateProvinceID,A.SEH�RADET,B.Name FROM
SEHIRADET A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID



--�RNEK 5 : CTE ile Select sorgusunun aras�na ba�ka bir �ey gelmemeli. Hata al�r�z.

WITH SEHIRADET AS
(
SELECT StateProvinceID,COUNT(City)AS SEH�RADET FROM Person.Address
GROUP BY StateProvinceID
)

PRINT 'Onur'

SELECT A.StateProvinceID,A.SEH�RADET,B.Name FROM
SEHIRADET A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID



--�RNEK 6 : Birden �ok CTE yaratmak ve Union All �rne�i :

--TABLO 1:
SELECT StateProvinceID,COUNT(City)AS SEH�RADET FROM Person.Address
GROUP BY StateProvinceID

--TABLO 2:
SELECT StateProvinceID,Name FROM Person.StateProvince

--JOINL�YORUZ :


SELECT
A.StateProvinceID,
B.Name,
COUNT(A.City) AS SEH�RADET
FROM
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY A.StateProvinceID,B.Name
HAVING (A.StateProvinceID) BETWEEN 1 AND 100




--CTE YARATIYORUZ :

WITH B�RY�ZARASI AS
(
SELECT
A.StateProvinceID,
B.Name,
COUNT(A.City) AS SEH�RADET
FROM
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY A.StateProvinceID,B.Name
HAVING (A.StateProvinceID) BETWEEN 1 AND 100
),
Y�ZB�R�LEY�ZSEKSENB�RARASI AS
(
SELECT
A.StateProvinceID,
B.Name,
COUNT(A.City) AS SEH�RADET
FROM
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY A.StateProvinceID,B.Name
HAVING (A.StateProvinceID) BETWEEN 101 AND 181
)


SELECT * FROM B�RY�ZARASI
UNION
SELECT * FROM Y�ZB�R�LEY�ZSEKSENB�RARASI
ORDER BY StateProvinceID

