--- ### CASE WHEN - IIF -CHOOSE ### ---




--- ### CASE WHEN  BAÞLANGIÇ ### --- 



--2 þekilde case when yapabiliriz.
--1.TÜR:Single Case
--2.TÜR:Searched Case


--Searched Case Syntax :
--Genelde bunu kullanýrýz.
	CASE 
		WHEN Þart 1 THEN Sonuç 1
		WHEN Þart 2 THEN Sonuç 2
		........................
		ELSE Diðer Sonuç
	END AS Alias


--Simple Case Syntax :


	CASE Ýfade
		WHEN Deðer 1 THEN Sonuç 1
		WHEN Deðer 2 THEN Sonuç 2
		........................
		ELSE Diðer Sonuç
	END AS Alias



--Tüm koþullarý sýrasýyla tarayýp,ilk gerçekleþen sonucu bize veriyor.
--Eðer bir þart doðruysa iþlemini orada sonlandýrýyor ve sonucu getirir.
--Eðer hiç bir þart saðlanmýyorsa ELSE 'de yazdýðýmýz sonucu getirir.
--Eðer hiç bir þart saðlanmýyorsa ve ELSE 'de belirtmediysem NULL deðer döner.
--Case When 'de =,<,>,>=,<=,Between,Like,In,IS NULL, IS NOT NULL operatörlerini kullanabiliriz.



--Örnek :


SELECT
	CASE
		WHEN 1=2 THEN 'Eþit'
		WHEN 1>2 THEN 'Ýlk rakam ikinci rakamdan büyüktür'
		WHEN 1<2 THEN 'Ýkinci rakam ilk rakamdan büyüktür'
	ELSE 'Hata Vardýr' END AS Sonuç



--Örnek :


DECLARE @A INT = 2
DECLARE @B INT = 4

SELECT
	CASE
		WHEN @A=@B THEN 'Eþit'
		WHEN @A>@B THEN 'Ýlk rakam ikinci rakamdan büyüktür'
		WHEN @A<@B THEN 'Ýkinci rakam ilk rakamdan büyüktür'
	ELSE 'Hata Vardýr' 
	END AS Sonuç







--Örnek : 
SELECT * FROM Person.Person




--Örnek : 
SELECT 
Title,
Case 
	WHEN Title IS NULL THEN 'Boþ Deðer'
	ELSE Title END AS YeniTile
FROM Person.Person







--Örnek : 


Select 
Gender,
CASE 
	WHEN Gender ='M' THEN 'Erkek'
	WHEN Gender = 'F' THEN 'Kadýn'
END AS 'Türkçe Yazým'
FROM HumanResources.Employee






--Örnek :
SELECT * FROM Ornek.dbo.PuanDurumu


--NORMAL TABLOMUZ :


SELECT * FROM Ornek.dbo.PuanDurumu


SELECT
Takým,
SUM(Puan)
FROM Ornek.dbo.PuanDurumu
GROUP BY
Takým



--CASE WHEN ÝLE YAZALIM :
select Takým,Toplam,
CASE
	WHEN Toplam = 30 then '1.GRUP'
	WHEN Toplam = 60 then '2.GRUP'
	ELSE '3.GRUP'
END AS Sýnýflama
FROM
(SELECT
Takým,
SUM(Puan) as 'Toplam'
FROM Ornek.dbo.PuanDurumu
GROUP BY
Takým)A




--Örnek :



Select AVG(SickLeaveHours) from [HumanResources].[Employee]

Select 
BusinessEntityID,
Gender,
SickLeaveHours,
(Select AVG(SickLeaveHours) from [HumanResources].[Employee])AS "ORT.ÝÞE GELMEME SÜRESÝ",
CASE
	WHEN SickLeaveHours >(Select AVG(SickLeaveHours) from [HumanResources].[Employee]) THEN 'Çok fazla iþe gelmemiþ'
	WHEN SickLeaveHours <(Select AVG(SickLeaveHours) from [HumanResources].[Employee]) THEN 'Ortalamaya Göre Ýyi Gelmiþ'
	ELSE 'Eþit'
END AS 'Durum'
from [HumanResources].[Employee]





--Örnek :

SELECT
[BusinessEntityID],
[JobTitle],
CASE
	WHEN [JobTitle] LIKE '%Chief%' THEN 'Yüzde 50 zam yap'
	WHEN [JobTitle] LIKE '%President%' THEN 'Yüzde 100 zam yap'
	WHEN [JobTitle] LIKE '%Engineer%' THEN 'Yüzde 30 zam yap'
	WHEN [JobTitle] LIKE '%Designer%' THEN 'Yüzde 20 zam yap'
	ELSE 'Yüzde 10 zam yap'
END AS Durum
FROM [HumanResources].[Employee]


--Örnek :
SELECT
[BusinessEntityID],
[JobTitle],
[BirthDate],
[MaritalStatus],
[Gender],
[SickLeaveHours],
CASE
	WHEN [JobTitle] LIKE '%Executive%' OR [JobTitle] LIKE '%President%' THEN 'Üst Yönetim'
	WHEN YEAR([BirthDate])< 1975 THEN 'Orta Yaþ'
	WHEN [MaritalStatus] = 'M' THEN 'Evli'
	WHEN [Gender] = 'M' THEN 'Erkek'
	WHEN [SickLeaveHours] > 60 THEN 'Ýþe Çok Gelmemiþ'
	ELSE'Diðer'
END AS Sonuc
FROM [HumanResources].[Employee]



-- Örnek : Bir Stored Proc Yaratalým.


CREATE PROC Deneme
(@Price INT)
AS
BEGIN
	SELECT 
		CASE
			WHEN @Price > (Select AVG(ListPrice) FROM [Production].[Product]) THEN 'Ort.Üstü Fiyat'
			WHEN @Price < (Select AVG(ListPrice) FROM [Production].[Product]) THEN 'Ort.Altý Fiyat'
			ELSE 'Hata'
		END AS [Sonuç]

END;

EXEC Deneme 439






--Örnek : Her iki þartýda saðlarsa ne olur ?
--Ýlk gerçekleþen yerde durur.

DECLARE @A INT = 50

SELECT
	CASE 
		WHEN @A < 60 THEN '1 saatin altýnda'
		WHEN @A < 90 THEN '1.5 saatin altýnda'
		WHEN @A > 120 THEN '2 Saatin Üzerinde'
		ELSE 'Hata'
	END AS 'Saat'

--Hiçbir Þarta uymazsa Ne olur ? Else ifadesi çalýþýr.
DECLARE @A INT = 117

SELECT
	CASE 
		WHEN @A < 60 THEN '1 saatin altýnda'
		WHEN @A < 90 THEN '1.5 saatin altýnda'
		WHEN @A > 120 THEN '2 Saatin Üzerinde'
		ELSE 'Hata'
	END AS 'Saat'





--Örnek : Searched Case Örneði ve Simple Case

SELECT
Gender,
	CASE Gender
		WHEN 'M' THEN 'Erkek'
		WHEN 'F' THEN 'Kadýn'
		ELSE 'Hata'
	END AS Durum
FROM [HumanResources].[Employee]

--Eski Yöntemle Yazým
SELECT
Gender,
case
	when Gender = 'M' THEN 'Erkek'
	when Gender = 'F' THEN 'Kadýn'
	ELSE 'Hata'
END AS Durum
FROM [HumanResources].[Employee]




--Örnek : 

SELECT 
[BusinessEntityID],
[BirthDate],
CASE 
	WHEN	YEAR([BirthDate]) < 1975 THEN 'ORTA YAÞ'
	WHEN	YEAR([BirthDate]) BETWEEN 1975 AND 2000 THEN 'GENÇ'
	WHEN	YEAR([BirthDate])> 2000 THEN 'ÇOK GENÇ'
	ELSE	'HATA'
END AS YASDURUMU
FROM [HumanResources].[Employee]





--ÖRNEK : PÝVOT YAPMA :

SELECT * FROM Ornek.dbo.Banka

--group by:
SELECT MusteriID,Urun,SUM(Tutar) FROM Ornek.dbo.Banka
group by MusteriID,Urun



--Case When Ýle Pivot:
SELECT * FROM Ornek.dbo.Banka
--1.Adým:
SELECT
MusteriID,
Urun,
Tutar,
CASE WHEN Urun = 'Mevduat' THEN Tutar ELSE NULL END AS Mevduat,
CASE WHEN Urun = 'Kredi' THEN Tutar ELSE NULL END AS Kredi,
CASE WHEN Urun = 'KMH' THEN Tutar ELSE NULL END AS KMH
FROM Ornek.dbo.Banka

--2.Adým'un ilk seçeneði:
SELECT 
MusteriID,
SUM(CASE WHEN Urun = 'Mevduat' THEN Tutar ELSE NULL END) AS Mevduat,
SUM(CASE WHEN Urun = 'Kredi' THEN Tutar ELSE NULL END) AS Kredi,
SUM(CASE WHEN Urun = 'KMH' THEN Tutar ELSE NULL END) AS KMH
FROM Ornek.dbo.Banka
GROUP BY MusteriID;

--2.Adým'un Ýkinci seçeneði:
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








--PÝVOT ÝLE AYNI SONUCA ULAÞALIM :
--AYNISI GELDÝ.

SELECT * FROM
(

SELECT MusteriID,Urun,Tutar FROM Ornek.dbo.Banka

)AS SOURCE

PIVOT
(
SUM(Tutar) FOR Urun IN([Mevduat],[Kredi],[KMH])


)AS PIVOTTABLO





--ÖRNEK
--CÝNSÝYETE GÖRE EVLÝ BEKAR DURUMU:

--GROUP BY ÝLE:
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
CASE WHEN [MaritalStatus] = 'M' THEN [Gender] ELSE NULL END AS EVLÝ
from [HumanResources].[Employee]

--2.ADIM:
select
[Gender],
COUNT(CASE WHEN [MaritalStatus] = 'S' THEN [Gender] ELSE NULL END) AS BEKAR,
COUNT(CASE WHEN [MaritalStatus] = 'M' THEN [Gender] ELSE NULL END) AS EVLÝ
from [HumanResources].[Employee]
GROUP BY [Gender]





-- ÖRNEK : MÜÞTERÝ AKTÝF VE PASÝF DURUMU
--Maðazalardaki aktif ve pasif müþteri sayýlarýmý görmek istiyorum.

SELECT * FROM Ornek.dbo.Aktfilik

--GROUP BY ÝLE:
SELECT
MagazaID,
Active,
COUNT(MüsteriID) as MüþteriAdet
FROM Ornek.dbo.Aktfilik
GROUP BY MagazaID,Active




--1.Adým:
SELECT
MüsteriID,
MagazaID,
Active,
CASE WHEN Active = 1 THEN MüsteriID ELSE NULL END AS Active,
CASE WHEN Active = 0 THEN MüsteriID ELSE NULL END Inactive
FROM Ornek.dbo.Aktfilik;





--2.Adým:COUNT ÝLE YAPIYORUZ -- AYNI SONUÇ GELECEKTÝR.
SELECT
MagazaID,
COUNT(CASE WHEN Active = 1 THEN MüsteriID ELSE NULL END)AS Active,
COUNT(CASE WHEN Active = 0 THEN MüsteriID ELSE NULL END)AS Inactive
FROM Ornek.dbo.Aktfilik
GROUP BY MagazaID



--2.durum:SUM ÝLE YAPIYORUZ -- AYNI SONUÇ GELECEKTÝR.
SELECT
MagazaID,
SUM(CASE WHEN Active = 1 THEN 1 ELSE NULL END)AS Active,
SUM(CASE WHEN Active = 0 THEN 1 ELSE NULL END)AS Inactive
FROM Ornek.dbo.Aktfilik
GROUP BY MagazaID



--- ### CASE WHEN  BÝTÝÞ ### ---












--- ### IIF BAÞLANGIÇ ### ----

--SYNTAX : IIF (Test Edilen Ýfade,Doðruysa Gelen Deðer,Yanlýþsa Gelen Deðer)
--Case'in kýsa versiyonu diyebiliriz.


--ÖRNEK :
SELECT IIF(100<500,'Doðru','Yanlýþ')

--ÖRNEK :
DECLARE @Ýsim VARCHAR(50)
SET @Ýsim = 'Onur'

select IIF(@Ýsim IN('Onur','Murat'),1,0);

--ÖRNEK :


--ÖRNEK :
DECLARE @Cinsiyet INT
SET @Cinsiyet = 1
SELECT IIF(@Cinsiyet = 1,'Erkek','Kadýn')

DECLARE @Cinsiyet INT
SET @Cinsiyet = 2
SELECT IIF(@Cinsiyet = 1,'Erkek','Kadýn')





--ÖRNEK :
--Ýsmi,CinsiyetID ve Cinsiyet ADI kolonlarýný görmek istiyorum.

SELECT * FROM Ornek.dbo.CalýsanCinsiyet

--CASE WHEN ÝLE EÇÖZÜM:



--Cinsiyet Adlarýný görmek istiyoruz :
SELECT
Ad,
CinsiyetID,
CASE
	WHEN CinsiyetID = 1 THEN 'Erkek'
	else 'KADIN'
	END AS CinsiyetAdý
FROM Ornek.dbo.CalýsanCinsiyet



--IFF ÝLE EÇÖZÜM:
SELECT
Ad,
CinsiyetID,
IIF(CinsiyetID = 1,'Erkek','Kadýn')
FROM Ornek.dbo.CalýsanCinsiyet





--ÖRNEK :
SELECT
[BusinessEntityID],
[JobTitle],
IIF(([JobTitle] LIKE '%Executive%' OR [JobTitle] LIKE '%President%' OR [JobTitle] LIKE '%Manager%'),'Üst Yönetim','Çalýþanlar')
FROM [HumanResources].[Employee]

--- ### IIF BÝTÝÞ ### ----




--- ### CHOOSE BAÞLANGIÇ ### ----

--Index içerisindeki belirtilen deðeri döner.
--Index pozisyonu 1'den baþlar.0'dan deðil.

--ÖRNEK :
SELECT CHOOSE(2,'Tr','En','Fr');--En

SELECT CHOOSE(1,'Tr','En','Fr');--Tr

SELECT CHOOSE(3,'Tr','En','Fr');--Fr

SELECT CHOOSE(0,'Tr','En','Fr');--NULL

--Örnek:

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
	WHEN 2 THEN 'ÞUBAT'
	WHEN 3 THEN 'MART'
	WHEN 4 THEN 'NÝSAN'
	WHEN 5 THEN 'MAYIS'
	WHEN 6 THEN 'HAZÝRAN'
	WHEN 7 THEN 'TEMMUZ'
	WHEN 8 THEN 'AÐUSTOS'
	WHEN 9 THEN 'EYLÜL'
	WHEN 10 THEN 'EKÝM'
	WHEN 11 THEN 'KASIM'
	WHEN 12 THEN 'ARALIK'
END AS SimpleCase,
CASE
	WHEN DATEPART(MM,[BirthDate]) = 1 THEN 'OCAK'
	WHEN DATEPART(MM,[BirthDate]) = 2 THEN 'ÞUBAT'
	WHEN DATEPART(MM,[BirthDate]) = 3 THEN 'MART'
	WHEN DATEPART(MM,[BirthDate]) = 4 THEN 'NÝSAN'
	WHEN DATEPART(MM,[BirthDate]) = 5 THEN 'MAYIS'
	WHEN DATEPART(MM,[BirthDate]) = 6 THEN 'HAZÝRAN'
	WHEN DATEPART(MM,[BirthDate]) = 7 THEN 'TEMMUZ'
	WHEN DATEPART(MM,[BirthDate]) = 8 THEN 'AÐUSTOS'
	WHEN DATEPART(MM,[BirthDate]) = 9 THEN 'EYLÜL'
	WHEN DATEPART(MM,[BirthDate]) = 10 THEN 'EKÝM'
	WHEN DATEPART(MM,[BirthDate]) = 11 THEN 'KASIM'
	WHEN DATEPART(MM,[BirthDate]) = 12 THEN 'ARALIK'
END AS SearchedCase,
CHOOSE
(DATEPART(MM,[BirthDate]),'OCAK','ÞUBAT','MART','NÝSAN','MAYIS','HAZÝRAN','TEMMUZ','AÐUSTOS','EYLÜL','EKÝM','KASIM','ARALIK') AS [CHOOSE ÝLE]
from [HumanResources].[Employee]

--- ### CHOOSE BÝTÝÞ ### ----
