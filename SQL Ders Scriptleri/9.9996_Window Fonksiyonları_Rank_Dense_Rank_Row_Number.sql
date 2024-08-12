--- ### RANK - DENSE RANK - ROW NUMBER ### -# ---

--- ### RANK BAÞLANGIÇ ### ---
--Order by ifadesinde belritilen sütunu sýralamamýzý saðlar.
--Order By ifadesi zorunludur.
--Parttion by ifadesi zorunlu deðildir.Ama kullanabilriz.
--Rank 1'den baþlar.
--Parttion by ifadesini kullanýrsak,Parttion deðiþtiðinde tekrardan 1'den baþlar.
--Eðer sýralamada beraberlik varsa,RANK fonk.deðer atlar.Veya her bir tekrarlanan deðer için 1 atlarda diyebiliriz.

--ÖRNEK 1,1,3,4,5

--SYNTAX : RANK()OVER(Order By Kolon1,kolon2...)

--ÖRNEK :

SELECT * FROM [HumanResources].[Employee]

--RANK ÖRNEK :
SELECT
[BusinessEntityID],
[Gender],
[SickLeaveHours],
RANK()OVER(ORDER BY [SickLeaveHours] DESC) AS RANK
FROM [HumanResources].[Employee]


--ÖRNEK :



select * from Ornek.dbo.SýralamaRank

--ÖRNEK :
select
AD,
Cinsiyet,
Maas,
RANK()OVER(ORDER BY Maas DESC) AS RANK
from Ornek.dbo.SýralamaRank


--PARTÝTÝON BY ÝLE:
select
AD,
Cinsiyet,
Maas,
RANK()OVER(PARTITION BY Cinsiyet ORDER BY Maas DESC) AS [RANK]
from Ornek.dbo.SýralamaRank





--ÖRNEK :
----LÝste fiyatý en yüksek olan 3 ürün ID'yi renk bazýnda getirin :


SELECT * FROM Production.Product


--1.AÞAMA:
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(ORDER BY ListPrice DESC) AS 'Genel Sýra',
RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Renk Ýçindeki Sýra'
FROM Production.Product
where Color IS NOT NULL

--2.AÞAMA:
SELECT * FROM 
(
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS Renk_Ýçindeki_Sýra
FROM Production.Product
where Color IS NOT NULL
)A
WHERE Renk_Ýçindeki_Sýra < 4;


--- ### RANK BÝTÝÞ ### ---





--- ### DENSE RANK BAÞLANGIÇ ### ---
--Order by ifadesinde belritilen sütunu sýralamamýzý saðlar.
--Order By ifadesi zorunludur.
--Parttion by ifadesi zorunlu deðildir.Ama kullanabilriz.
--Rank 1'DEN BAÞLAR.
--Parttion by ifadesiNÝ kullanýrsak,Parttion deðiþtiðinde tekrardan 1'den baþlar.
-- Eðer sýralamada beraberlik varsa,DENSE RANK fonk.deðer atlamaz.

--SYNTAX : DENSE_RANK()OVER(Order By Kolon1,kolon2...)



SELECT
[BusinessEntityID],
[Gender],
[SickLeaveHours],
RANK()OVER(ORDER BY [SickLeaveHours] DESC) AS [RANK],
DENSE_RANK()OVER(ORDER BY [SickLeaveHours] DESC) AS DENSE_RANK
FROM [HumanResources].[Employee]




--ÖRNEK :

select
AD,
Cinsiyet,
Maas,
RANK()OVER(ORDER BY Maas DESC) AS RANK,
DENSE_RANK()OVER(ORDER BY Maas DESC) AS DENSE_RANK
from Ornek.dbo.SýralamaRank


--ÖRNEK : PARTITON BY:

select
AD,
Cinsiyet,
Maas,
RANK()OVER(PARTITION BY Cinsiyet ORDER BY Maas DESC) AS [RANK],
DENSE_RANK()OVER(PARTITION BY Cinsiyet ORDER BY Maas DESC) AS [DENSE_RANK]
from Ornek.dbo.SýralamaRank



--ÖRNEK :
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Rank',
DENSE_RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Dense_Rank'
FROM Production.Product
where Color IS NOT NULL


--ÖRNEK :
SELECT
ProductID,
Color,
ListPrice,
RANK()OVER(ORDER BY ListPrice DESC)AS 'Genel_Sýra_Rank',
DENSE_RANK()OVER(PARTITION BY Color ORDER BY ListPrice DESC)AS 'Renk_Ýçindeki__Sýra_Dense_Rank'
FROM Production.Product
where Color IS NOT NULL


--RANK VE DENSE RANK_Fonk nerede kullanabiliriz--
--Her iki fonksiyonuda n'inci büyük maaþý bulmak için kullanbiliriz.

--ÖRNEK :

--Common Table Exp.Olulþturarak yapalým
--1.AÞAMA :ANA TABLOM
SELECT 
Maas,
RANK()OVER (ORDER BY Maas DESC)
FROM Ornek.dbo.SýralamaRank

--2.AÞAMA :WITH
WITH Sýra AS
(
SELECT 
Maas,
RANK()OVER(ORDER BY Maas DESC) AS Sýra
FROM Ornek.dbo.SýralamaRank
)





--3.AÞAMA :WITH
--Aþaðýda 1.inci yüksek maaþý görürüz.

WITH Sýra AS
(
SELECT 
Maas,
RANK()OVER(ORDER BY Maas DESC) AS Sýra
FROM Ornek.dbo.SýralamaRank
)
select TOP 1 Maas FROM Sýra WHERE Sýra =1

--KANIT :

SELECT * FROM Ornek.dbo.SýralamaRank ORDER BY MAAS DESC;





--Aþaðýda 2.inci yüksek maaþý buluruz.Rank kullanýrsam bize boþ getirir.
--Dolayýsýyla Dense Rank kullanýcaðýz.

--RANK
WITH Sýra AS
(
SELECT 
Maas,
RANK()OVER(ORDER BY Maas DESC) AS Sýra
FROM Ornek.dbo.SýralamaRank
)
select TOP 1 Maas FROM Sýra WHERE Sýra =2


--DENSE_RANK Kullandýðýmýz zaman :
--Aþaðýda 2.inci yüksek maaþý buluruz.
WITH Sýra AS
(
SELECT 
Maas,
DENSE_RANK()OVER(ORDER BY Maas DESC) AS Sýra
FROM Ornek.dbo.SýralamaRank
)
select TOP 1 Maas FROM Sýra WHERE Sýra =2

--Aþaðýda 3.en yüksek maaþý görmek istiyoruz.

WITH Sýra AS
(
SELECT 
Maas,
DENSE_RANK()OVER(ORDER BY Maas DESC) AS Sýra
FROM Ornek.dbo.SýralamaRank
)
select TOP 1 Maas FROM Sýra WHERE Sýra =3


---### ROWNUMBER BAÞLANGIÇ ###---
--1'den baþlayarak bize tekil veya benzersiz ardýþýk sýra numarasý getirir.
--Order by zorunlu.
--Partition by opsiyonel.
--Partition deðiþtiðinde rownumber gene 1'den baþlar.
--SYNTAX : ROW_NUMBER()OVER(ORDER BY kolon1,kolon2...)


--ÖRNEK :
SELECT *,ROW_NUMBER() OVER(ORDER BY AD) AS SIRA FROM Ornek.dbo.SýralamaRank

--ÖRNEK : Partition BY ile
SELECT *,ROW_NUMBER() OVER(PARTITION BY Cinsiyet ORDER BY AD ASC) AS SIRA FROM Ornek.dbo.SýralamaRank

--Genellikle Tekrarlayan verileri silmede kullanýlýyor:



--Genellikle Tekrarlayan verileri silmede kullanýlýyor:
--Orjinal Tablomuz :
SELECT * FROM Ornek.dbo.Veri

--SADECE CTE'NÝN ÝÇERÝSÝNDEKÝ ÝFADEYÝ ÇALIÞTIRALIM :
--cte oluþturalým:
--CTE'yi çalýþtýrýnca tekrarlananlar siliniyor :
WITH Veriler AS
(
SELECT *,ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID)AS Rownumber FROM Ornek.dbo.Veri
)
DELETE FROM Veriler WHERE Rownumber >1;



--ÖRNEK
--SORU : Cinsiyet bazýnda iþe ilk giren ilk 2 personlleri getirin

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
ROW_NUMBER()over(PARTITION BY Gender Order By HireDate) AS Sýra
FROM [HumanResources].[Employee]
)A
WHERE Sýra<3;



---### ROWNUMBER BÝTÝÞ ###---

--ROWNUMBER,RANK VE DENSE RANK FARKLILIKLARI--

--BENZERLÝKLER :
	--1'den baþlayarak artan deðerde sýra verirler.
	--Order by zorunlu
	--Partiton by opsiyonel.
	--Partiton by kullandýysam,sýra deðeri resetlenir ve 1'den tekrar baþlar.

select
*,
ROW_NUMBER()over(ORDER BY Maas DESC) ROWNUMBER,
RANK()over(ORDER BY Maas DESC) RANK,
DENSE_RANK()over(ORDER BY Maas DESC)DENSERANK
from Ornek.dbo.SýralamaRank

