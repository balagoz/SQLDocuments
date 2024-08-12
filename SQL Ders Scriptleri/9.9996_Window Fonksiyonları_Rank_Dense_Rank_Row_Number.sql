--- ### RANK - DENSE RANK - ROW NUMBER ### -# ---

--- ### RANK BA�LANGI� ### ---
--Order by ifadesinde belritilen s�tunu s�ralamam�z� sa�lar.
--Order By ifadesi zorunludur.
--Parttion by ifadesi zorunlu de�ildir.Ama kullanabilriz.
--Rank 1'den ba�lar.
--Parttion by ifadesini kullan�rsak,Parttion de�i�ti�inde tekrardan 1'den ba�lar.
--E�er s�ralamada beraberlik varsa,RANK fonk.de�er atlar.Veya her bir tekrarlanan de�er i�in 1 atlarda diyebiliriz.

--�RNEK 1,1,3,4,5

--SYNTAX : RANK()OVER(Order By Kolon1,kolon2...)

--�RNEK :

SELECT * FROM [HumanResources].[Employee]

--RANK �RNEK :
SELECT
[BusinessEntityID],
[Gender],
[SickLeaveHours],
RANK()OVER(ORDER BY [SickLeaveHours] DESC) AS RANK
FROM [HumanResources].[Employee]


--�RNEK :



select * from Ornek.dbo.S�ralamaRank

--�RNEK :
select
AD,
Cinsiyet,
Maas,
RANK()OVER(ORDER BY Maas DESC) AS RANK
from Ornek.dbo.S�ralamaRank


--PART�T�ON BY �LE:
select
AD,
Cinsiyet,
Maas,
RANK()OVER(PARTITION BY Cinsiyet ORDER BY Maas DESC) AS [RANK]
from Ornek.dbo.S�ralamaRank





--�RNEK :
----L�ste fiyat� en y�ksek olan 3 �r�n ID'yi renk baz�nda getirin :


SELECT * FROM Production.Product


--1.A�AMA:
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(ORDER BY ListPrice DESC) AS 'Genel S�ra',
RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Renk ��indeki S�ra'
FROM Production.Product
where Color IS NOT NULL

--2.A�AMA:
SELECT * FROM 
(
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS Renk_��indeki_S�ra
FROM Production.Product
where Color IS NOT NULL
)A
WHERE Renk_��indeki_S�ra < 4;


--- ### RANK B�T�� ### ---





--- ### DENSE RANK BA�LANGI� ### ---
--Order by ifadesinde belritilen s�tunu s�ralamam�z� sa�lar.
--Order By ifadesi zorunludur.
--Parttion by ifadesi zorunlu de�ildir.Ama kullanabilriz.
--Rank 1'DEN BA�LAR.
--Parttion by ifadesiN� kullan�rsak,Parttion de�i�ti�inde tekrardan 1'den ba�lar.
-- E�er s�ralamada beraberlik varsa,DENSE RANK fonk.de�er atlamaz.

--SYNTAX : DENSE_RANK()OVER(Order By Kolon1,kolon2...)



SELECT
[BusinessEntityID],
[Gender],
[SickLeaveHours],
RANK()OVER(ORDER BY [SickLeaveHours] DESC) AS [RANK],
DENSE_RANK()OVER(ORDER BY [SickLeaveHours] DESC) AS DENSE_RANK
FROM [HumanResources].[Employee]




--�RNEK :

select
AD,
Cinsiyet,
Maas,
RANK()OVER(ORDER BY Maas DESC) AS RANK,
DENSE_RANK()OVER(ORDER BY Maas DESC) AS DENSE_RANK
from Ornek.dbo.S�ralamaRank


--�RNEK : PARTITON BY:

select
AD,
Cinsiyet,
Maas,
RANK()OVER(PARTITION BY Cinsiyet ORDER BY Maas DESC) AS [RANK],
DENSE_RANK()OVER(PARTITION BY Cinsiyet ORDER BY Maas DESC) AS [DENSE_RANK]
from Ornek.dbo.S�ralamaRank



--�RNEK :
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Rank',
DENSE_RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Dense_Rank'
FROM Production.Product
where Color IS NOT NULL


--�RNEK :
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(ORDER BY ListPrice DESC)AS 'Genel_S�ra_Rank',
DENSE_RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Renk_��indeki__S�ra_Dense_Rank'
FROM Production.Product
where Color IS NOT NULL


--RANK VE DENSE RANK_Fonk nerede kullanabiliriz--
--Her iki fonksiyonuda n'inci b�y�k maa�� bulmak i�in kullanbiliriz.

--�RNEK :

--Common Table Exp.Olul�turarak yapal�m
--1.A�AMA :ANA TABLOM
SELECT 
Maas,
RANK()OVER (ORDER BY Maas DESC)
FROM Ornek.dbo.S�ralamaRank

--2.A�AMA :WITH
WITH S�ra AS
(
SELECT 
Maas,
RANK()OVER(ORDER BY Maas DESC) AS S�ra
FROM Ornek.dbo.S�ralamaRank
)





--3.A�AMA :WITH
--A�a��da 1.inci y�ksek maa�� g�r�r�z.

WITH S�ra AS
(
SELECT 
Maas,
RANK()OVER(ORDER BY Maas DESC) AS S�ra
FROM Ornek.dbo.S�ralamaRank
)
select TOP 1 Maas FROM S�ra WHERE S�ra =1

--KANIT :

SELECT * FROM Ornek.dbo.S�ralamaRank ORDER BY MAAS DESC;





--A�a��da 2.inci y�ksek maa�� buluruz.Rank kullan�rsam bize bo� getirir.
--Dolay�s�yla Dense Rank kullan�ca��z.

--RANK
WITH S�ra AS
(
SELECT 
Maas,
RANK()OVER(ORDER BY Maas DESC) AS S�ra
FROM Ornek.dbo.S�ralamaRank
)
select TOP 1 Maas FROM S�ra WHERE S�ra =2


--DENSE_RANK Kulland���m�z zaman :
--A�a��da 2.inci y�ksek maa�� buluruz.
WITH S�ra AS
(
SELECT 
Maas,
DENSE_RANK()OVER(ORDER BY Maas DESC) AS S�ra
FROM Ornek.dbo.S�ralamaRank
)
select TOP 1 Maas FROM S�ra WHERE S�ra =2

--A�a��da 3.en y�ksek maa�� g�rmek istiyoruz.

WITH S�ra AS
(
SELECT 
Maas,
DENSE_RANK()OVER(ORDER BY Maas DESC) AS S�ra
FROM Ornek.dbo.S�ralamaRank
)
select TOP 1 Maas FROM S�ra WHERE S�ra =3


---### ROWNUMBER BA�LANGI� ###---
--1'den ba�layarak bize tekil veya benzersiz ard���k s�ra numaras� getirir.
--Order by zorunlu.
--Partition by opsiyonel.
--Partition de�i�ti�inde rownumber gene 1'den ba�lar.
--SYNTAX : ROW_NUMBER()OVER(ORDER BY kolon1,kolon2...)


--�RNEK :
SELECT *,ROW_NUMBER() OVER(ORDER BY AD) AS SIRA FROM Ornek.dbo.S�ralamaRank

--�RNEK : Partition BY ile
SELECT *,ROW_NUMBER() OVER(PARTITION BY Cinsiyet ORDER BY AD ASC) AS SIRA FROM Ornek.dbo.S�ralamaRank

--Genellikle Tekrarlayan verileri silmede kullan�l�yor:



--Genellikle Tekrarlayan verileri silmede kullan�l�yor:
--Orjinal Tablomuz :
SELECT * FROM Ornek.dbo.Veri

--SADECE CTE'N�N ��ER�S�NDEK� �FADEY� �ALI�TIRALIM :
--cte olu�tural�m:
--CTE'yi �al��t�r�nca tekrarlananlar siliniyor :
WITH Veriler AS
(
SELECT *,ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID)AS Rownumber FROM Ornek.dbo.Veri
)
DELETE FROM Veriler WHERE Rownumber >1;



--�RNEK
--SORU : Cinsiyet baz�nda i�e ilk giren ilk 2 personlleri getirin

--1.ADIM:
SELECT
[BusinessEntityID],
[JobTitle],
[Gender],
[HireDate],
ROW_NUMBER()over(PARTITION BY Gender Order By HireDate)
FROM [HumanResources].[Employee]


--2.ADIM:
SELECT * FROM 
(
SELECT
[BusinessEntityID],
[JobTitle],
[Gender],
[HireDate],
ROW_NUMBER()over(PARTITION BY Gender Order By HireDate) AS S�ra
FROM [HumanResources].[Employee]
)A
WHERE S�ra<3;



---### ROWNUMBER B�T�� ###---

--ROWNUMBER,RANK VE DENSE RANK FARKLILIKLARI--

--BENZERL�KLER :
	--1'den ba�layarak artan de�erde s�ra verirler.
	--Order by zorunlu
	--Partiton by opsiyonel.
	--Partiton by kulland�ysam,s�ra de�eri resetlenir ve 1'den tekrar ba�lar.

select
*,
ROW_NUMBER()over(ORDER BY Maas DESC) ROWNUMBER,
RANK()over(ORDER BY Maas DESC) RANK,
DENSE_RANK()over(ORDER BY Maas DESC)DENSERANK
from Ornek.dbo.S�ralamaRank

