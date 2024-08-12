--- ### CASE WHEN - IIF -CHOOSE ### ---




--- ### CASE WHEN  BA�LANGI� ### --- 



--2 �ekilde case when yapabiliriz.
--1.T�R:Single Case
--2.T�R:Searched Case


--Searched Case Syntax :
--Genelde bunu kullan�r�z.
	CASE 
		WHEN �art 1 THEN Sonu� 1
		WHEN �art 2 THEN Sonu� 2
		........................
		ELSE Di�er Sonu�
	END AS Alias


--Simple Case Syntax :


	CASE �fade
		WHEN De�er 1 THEN Sonu� 1
		WHEN De�er 2 THEN Sonu� 2
		........................
		ELSE Di�er Sonu�
	END AS Alias



--T�m ko�ullar� s�ras�yla taray�p,ilk ger�ekle�en sonucu bize veriyor.
--E�er bir �art do�ruysa i�lemini orada sonland�r�yor ve sonucu getirir.
--E�er hi� bir �art sa�lanm�yorsa ELSE 'de yazd���m�z sonucu getirir.
--E�er hi� bir �art sa�lanm�yorsa ve ELSE 'de belirtmediysem NULL de�er d�ner.
--Case When 'de =,<,>,>=,<=,Between,Like,In,IS NULL, IS NOT NULL operat�rlerini kullanabiliriz.



--�rnek :


SELECT
	CASE
		WHEN 1=2 THEN 'E�it'
		WHEN 1>2 THEN '�lk rakam ikinci rakamdan b�y�kt�r'
		WHEN 1<2 THEN '�kinci rakam ilk rakamdan b�y�kt�r'
	ELSE 'Hata Vard�r' END AS Sonu�



--�rnek :


DECLARE @A INT = 2
DECLARE @B INT = 4

SELECT
	CASE
		WHEN @A=@B THEN 'E�it'
		WHEN @A>@B THEN '�lk rakam ikinci rakamdan b�y�kt�r'
		WHEN @A<@B THEN '�kinci rakam ilk rakamdan b�y�kt�r'
	ELSE 'Hata Vard�r' 
	END AS Sonu�







--�rnek : 
SELECT * FROM Person.Person




--�rnek : 
SELECT 
Title,
Case 
	WHEN Title IS NULL THEN 'Bo� De�er'
	ELSE Title END AS YeniTile
FROM Person.Person







--�rnek : 


Select 
Gender,
CASE 
	WHEN Gender ='M' THEN 'Erkek'
	WHEN Gender = 'F' THEN 'Kad�n'
END AS 'T�rk�e Yaz�m'
FROM HumanResources.Employee






--�rnek :
SELECT * FROM Ornek.dbo.PuanDurumu


--NORMAL TABLOMUZ :


SELECT * FROM Ornek.dbo.PuanDurumu


SELECT
Tak�m,
SUM(Puan)
FROM Ornek.dbo.PuanDurumu
GROUP BY
Tak�m



--CASE WHEN �LE YAZALIM :
select Tak�m,Toplam,
CASE
	WHEN Toplam = 30 then '1.GRUP'
	WHEN Toplam = 60 then '2.GRUP'
	ELSE '3.GRUP'
END AS S�n�flama
FROM
(SELECT
Tak�m,
SUM(Puan) as 'Toplam'
FROM Ornek.dbo.PuanDurumu
GROUP BY
Tak�m)A




--�rnek :



Select AVG(SickLeaveHours) from [HumanResources].[Employee]

Select 
BusinessEntityID,
Gender,
SickLeaveHours,
(Select AVG(SickLeaveHours) from [HumanResources].[Employee])AS "ORT.��E GELMEME S�RES�",
CASE
	WHEN SickLeaveHours >(Select AVG(SickLeaveHours) from [HumanResources].[Employee]) THEN '�ok fazla i�e gelmemi�'
	WHEN SickLeaveHours <(Select AVG(SickLeaveHours) from [HumanResources].[Employee]) THEN 'Ortalamaya G�re �yi Gelmi�'
	ELSE 'E�it'
END AS 'Durum'
from [HumanResources].[Employee]





--�rnek :

SELECT
[BusinessEntityID],
[JobTitle],
CASE
	WHEN [JobTitle] LIKE '%Chief%' THEN 'Y�zde 50 zam yap'
	WHEN [JobTitle] LIKE '%President%' THEN 'Y�zde 100 zam yap'
	WHEN [JobTitle] LIKE '%Engineer%' THEN 'Y�zde 30 zam yap'
	WHEN [JobTitle] LIKE '%Designer%' THEN 'Y�zde 20 zam yap'
	ELSE 'Y�zde 10 zam yap'
END AS Durum
FROM [HumanResources].[Employee]


--�rnek :
SELECT
[BusinessEntityID],
[JobTitle],
[BirthDate],
[MaritalStatus],
[Gender],
[SickLeaveHours],
CASE
	WHEN [JobTitle] LIKE '%Executive%' OR [JobTitle] LIKE '%President%' THEN '�st Y�netim'
	WHEN YEAR([BirthDate])< 1975 THEN 'Orta Ya�'
	WHEN [MaritalStatus] = 'M' THEN 'Evli'
	WHEN [Gender] = 'M' THEN 'Erkek'
	WHEN [SickLeaveHours] > 60 THEN '��e �ok Gelmemi�'
	ELSE'Di�er'
END AS Sonuc
FROM [HumanResources].[Employee]



-- �rnek : Bir Stored Proc Yaratal�m.


CREATE PROC Deneme
(@Price INT)
AS
BEGIN
	SELECT 
		CASE
			WHEN @Price > (Select AVG(ListPrice) FROM [Production].[Product]) THEN 'Ort.�st� Fiyat'
			WHEN @Price < (Select AVG(ListPrice) FROM [Production].[Product]) THEN 'Ort.Alt� Fiyat'
			ELSE 'Hata'
		END AS [Sonu�]

END;

EXEC Deneme 439






--�rnek : Her iki �art�da sa�larsa ne olur ?
--�lk ger�ekle�en yerde durur.

DECLARE @A INT = 50

SELECT
	CASE 
		WHEN @A < 60 THEN '1 saatin alt�nda'
		WHEN @A < 90 THEN '1.5 saatin alt�nda'
		WHEN @A > 120 THEN '2 Saatin �zerinde'
		ELSE 'Hata'
	END AS 'Saat'

--Hi�bir �arta uymazsa Ne olur ? Else ifadesi �al���r.
DECLARE @A INT = 117

SELECT
	CASE 
		WHEN @A < 60 THEN '1 saatin alt�nda'
		WHEN @A < 90 THEN '1.5 saatin alt�nda'
		WHEN @A > 120 THEN '2 Saatin �zerinde'
		ELSE 'Hata'
	END AS 'Saat'





--�rnek : Searched Case �rne�i ve Simple Case

SELECT
Gender,
	CASE Gender
		WHEN 'M' THEN 'Erkek'
		WHEN 'F' THEN 'Kad�n'
		ELSE 'Hata'
	END AS Durum
FROM [HumanResources].[Employee]

--Eski Y�ntemle Yaz�m
SELECT
Gender,
case
	when Gender = 'M' THEN 'Erkek'
	when Gender = 'F' THEN 'Kad�n'
	ELSE 'Hata'
END AS Durum
FROM [HumanResources].[Employee]




--�rnek : 

SELECT 
[BusinessEntityID],
[BirthDate],
CASE 
	WHEN	YEAR([BirthDate]) < 1975 THEN 'ORTA YA�'
	WHEN	YEAR([BirthDate]) BETWEEN 1975 AND 2000 THEN 'GEN�'
	WHEN	YEAR([BirthDate])> 2000 THEN '�OK GEN�'
	ELSE	'HATA'
END AS YASDURUMU
FROM [HumanResources].[Employee]





--�RNEK : P�VOT YAPMA :

SELECT * FROM Ornek.dbo.Banka

--group by:
SELECT MusteriID,Urun,SUM(Tutar) FROM Ornek.dbo.Banka
group by MusteriID,Urun



--Case When �le Pivot:
SELECT * FROM Ornek.dbo.Banka
--1.Ad�m:
SELECT
MusteriID,
Urun,
Tutar,
CASE WHEN Urun = 'Mevduat' THEN Tutar ELSE NULL END AS Mevduat,
CASE WHEN Urun = 'Kredi' THEN Tutar ELSE NULL END AS Kredi,
CASE WHEN Urun = 'KMH' THEN Tutar ELSE NULL END AS KMH
FROM Ornek.dbo.Banka

--2.Ad�m'un ilk se�ene�i:
SELECT 
MusteriID,
SUM(CASE WHEN Urun = 'Mevduat' THEN Tutar ELSE NULL END) AS Mevduat,
SUM(CASE WHEN Urun = 'Kredi' THEN Tutar ELSE NULL END) AS Kredi,
SUM(CASE WHEN Urun = 'KMH' THEN Tutar ELSE NULL END) AS KMH
FROM Ornek.dbo.Banka
GROUP BY MusteriID;

--2.Ad�m'un �kinci se�ene�i:
SELECT 
MusteriID,
SUM(Mevduat) AS Mevduat,
SUM(Kredi) AS Kredi ,
SUM(KMH) AS KMH
FROM


(SELECT
MusteriID,
Urun,
Tutar,
CASE WHEN Urun = 'Mevduat' THEN Tutar  END AS Mevduat,
CASE WHEN Urun = 'Kredi' THEN Tutar END AS Kredi,
CASE WHEN Urun = 'KMH' THEN Tutar  END AS KMH
FROM Ornek.dbo.Banka)A


GROUP BY MusteriID;




--Kontrol :

SELECT MusteriID,Urun,SUM(Tutar) FROM Ornek.dbo.Banka
WHERE MusteriID = 1
group by MusteriID,Urun








--P�VOT �LE AYNI SONUCA ULA�ALIM :
--AYNISI GELD�.

SELECT * FROM
(

SELECT MusteriID,Urun,Tutar FROM Ornek.dbo.Banka

)AS SOURCE

PIVOT
(
SUM(Tutar) FOR Urun IN([Mevduat],[Kredi],[KMH])


)AS PIVOTTABLO





--�RNEK
--C�NS�YETE G�RE EVL� BEKAR DURUMU:

--GROUP BY �LE:
SELECT
[Gender],
[MaritalStatus],
COUNT([BusinessEntityID])
FROM [HumanResources].[Employee]
GROUP BY [Gender],[MaritalStatus]

--1.ADIM:
select
[BusinessEntityID],
[Gender],
[MaritalStatus],
CASE WHEN [MaritalStatus] = 'S' THEN [Gender] ELSE NULL END AS BEKAR,
CASE WHEN [MaritalStatus] = 'M' THEN [Gender] ELSE NULL END AS EVL�
from [HumanResources].[Employee]

--2.ADIM:
select
[Gender],
COUNT(CASE WHEN [MaritalStatus] = 'S' THEN [Gender] ELSE NULL END) AS BEKAR,
COUNT(CASE WHEN [MaritalStatus] = 'M' THEN [Gender] ELSE NULL END) AS EVL�
from [HumanResources].[Employee]
GROUP BY [Gender]





-- �RNEK : M��TER� AKT�F VE PAS�F DURUMU
--Ma�azalardaki aktif ve pasif m��teri say�lar�m� g�rmek istiyorum.

SELECT * FROM Ornek.dbo.Aktfilik

--GROUP BY �LE:
SELECT
MagazaID,
Active,
COUNT(M�steriID) as M��teriAdet
FROM Ornek.dbo.Aktfilik
GROUP BY MagazaID,Active




--1.Ad�m:
SELECT
M�steriID,
MagazaID,
Active,
CASE WHEN Active = 1 THEN M�steriID ELSE NULL END AS Active,
CASE WHEN Active = 0 THEN M�steriID ELSE NULL END Inactive
FROM Ornek.dbo.Aktfilik;





--2.Ad�m:COUNT �LE YAPIYORUZ -- AYNI SONU� GELECEKT�R.
SELECT
MagazaID,
COUNT(CASE WHEN Active = 1 THEN M�steriID ELSE NULL END)AS Active,
COUNT(CASE WHEN Active = 0 THEN M�steriID ELSE NULL END)AS Inactive
FROM Ornek.dbo.Aktfilik
GROUP BY MagazaID



--2.durum:SUM �LE YAPIYORUZ -- AYNI SONU� GELECEKT�R.
SELECT
MagazaID,
SUM(CASE WHEN Active = 1 THEN 1 ELSE NULL END)AS Active,
SUM(CASE WHEN Active = 0 THEN 1 ELSE NULL END)AS Inactive
FROM Ornek.dbo.Aktfilik
GROUP BY MagazaID



--- ### CASE WHEN  B�T�� ### ---












--- ### IIF BA�LANGI� ### ----

--SYNTAX : IIF (Test Edilen �fade,Do�ruysa Gelen De�er,Yanl��sa Gelen De�er)
--Case'in k�sa versiyonu diyebiliriz.


--�RNEK :
SELECT IIF(100<500,'Do�ru','Yanl��')

--�RNEK :
DECLARE @�sim VARCHAR(50)
SET @�sim = 'Onur'

select IIF(@�sim IN('Onur','Murat'),1,0);

--�RNEK :


--�RNEK :
DECLARE @Cinsiyet INT
SET @Cinsiyet = 1
SELECT IIF(@Cinsiyet = 1,'Erkek','Kad�n')

DECLARE @Cinsiyet INT
SET @Cinsiyet = 2
SELECT IIF(@Cinsiyet = 1,'Erkek','Kad�n')





--�RNEK :
--�smi,CinsiyetID ve Cinsiyet ADI kolonlar�n� g�rmek istiyorum.

SELECT * FROM Ornek.dbo.Cal�sanCinsiyet

--CASE WHEN �LE E��Z�M:



--Cinsiyet Adlar�n� g�rmek istiyoruz :
SELECT
Ad,
CinsiyetID,
CASE
	WHEN CinsiyetID = 1 THEN 'Erkek'
	else 'KADIN'
	END AS CinsiyetAd�
FROM Ornek.dbo.Cal�sanCinsiyet



--IFF �LE E��Z�M:
SELECT
Ad,
CinsiyetID,
IIF(CinsiyetID = 1,'Erkek','Kad�n')
FROM Ornek.dbo.Cal�sanCinsiyet





--�RNEK :
SELECT
[BusinessEntityID],
[JobTitle],
IIF(([JobTitle] LIKE '%Executive%' OR [JobTitle] LIKE '%President%' OR [JobTitle] LIKE '%Manager%'),'�st Y�netim','�al��anlar')
FROM [HumanResources].[Employee]

--- ### IIF B�T�� ### ----




--- ### CHOOSE BA�LANGI� ### ----

--Index i�erisindeki belirtilen de�eri d�ner.
--Index pozisyonu 1'den ba�lar.0'dan de�il.

--�RNEK :
SELECT CHOOSE(2,'Tr','En','Fr');--En

SELECT CHOOSE(1,'Tr','En','Fr');--Tr

SELECT CHOOSE(3,'Tr','En','Fr');--Fr

SELECT CHOOSE(0,'Tr','En','Fr');--NULL

--�rnek:

select
[BusinessEntityID],
[BirthDate],
DATEPART(MM,[BirthDate])
from [HumanResources].[Employee]


select
[BusinessEntityID],
[BirthDate],
CASE DATEPART(MM,[BirthDate])
	WHEN 1 THEN 'OCAK'
	WHEN 2 THEN '�UBAT'
	WHEN 3 THEN 'MART'
	WHEN 4 THEN 'N�SAN'
	WHEN 5 THEN 'MAYIS'
	WHEN 6 THEN 'HAZ�RAN'
	WHEN 7 THEN 'TEMMUZ'
	WHEN 8 THEN 'A�USTOS'
	WHEN 9 THEN 'EYL�L'
	WHEN 10 THEN 'EK�M'
	WHEN 11 THEN 'KASIM'
	WHEN 12 THEN 'ARALIK'
END AS SimpleCase,
CASE
	WHEN DATEPART(MM,[BirthDate]) = 1 THEN 'OCAK'
	WHEN DATEPART(MM,[BirthDate]) = 2 THEN '�UBAT'
	WHEN DATEPART(MM,[BirthDate]) = 3 THEN 'MART'
	WHEN DATEPART(MM,[BirthDate]) = 4 THEN 'N�SAN'
	WHEN DATEPART(MM,[BirthDate]) = 5 THEN 'MAYIS'
	WHEN DATEPART(MM,[BirthDate]) = 6 THEN 'HAZ�RAN'
	WHEN DATEPART(MM,[BirthDate]) = 7 THEN 'TEMMUZ'
	WHEN DATEPART(MM,[BirthDate]) = 8 THEN 'A�USTOS'
	WHEN DATEPART(MM,[BirthDate]) = 9 THEN 'EYL�L'
	WHEN DATEPART(MM,[BirthDate]) = 10 THEN 'EK�M'
	WHEN DATEPART(MM,[BirthDate]) = 11 THEN 'KASIM'
	WHEN DATEPART(MM,[BirthDate]) = 12 THEN 'ARALIK'
END AS SearchedCase,
CHOOSE
(DATEPART(MM,[BirthDate]),'OCAK','�UBAT','MART','N�SAN','MAYIS','HAZ�RAN','TEMMUZ','A�USTOS','EYL�L','EK�M','KASIM','ARALIK') AS [CHOOSE �LE]
from [HumanResources].[Employee]

--- ### CHOOSE B�T�� ### ----
