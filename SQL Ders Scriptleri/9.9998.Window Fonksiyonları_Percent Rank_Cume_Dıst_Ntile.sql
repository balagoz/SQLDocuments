--NTÝLE --- CUME_DIST --- PERCENT_RANK ---

---  ### Ntlie BAÞLANGIÇ ### ---
--Veriyi istediðimiZ bir rakama göre gruplara ayýrýr.
--Order by ifadesi zorunlu.
--Partition ifadesi opsiyonel.
--NTILE(2)'yi 10 satýr için uygularsam --- 5'er li 2 grup yapar.
--Eðer sayýlarýmýz tam olarak bölünmüyorsa o zaman farklý satýr sayýlarýnda gruplara sahip oluruz.
--NTILE(3)'yi 10 satýr için uygularsam --- 4 satýr bir grupta,3'er satýrda diðer gruplarda.
--SYNTAX: NTILE()OVER(ORDER BY Kolon1,Kolon2,...)
--NTILE()--Parantez içerisine tek bir argüman kabul eder.

--Örnek:

SELECT * FROM Ornek.dbo.SýralamaRank

SELECT
*,
NTILE(2)OVER(ORDER BY Maas) AS GRUP
FROM Ornek.dbo.SýralamaRank


--Örnek:
SELECT
*,
NTILE(3)OVER(ORDER BY Maas)AS GRUP
FROM Ornek.dbo.SýralamaRank


--Örnek:
SELECT
*,
NTILE(10)OVER(ORDER BY Maas)
FROM Ornek.dbo.SýralamaRank




--Örnek: Partýtýon By ile
SELECT
*,
NTILE(5)OVER(PARTITION BY Cinsiyet ORDER BY Maas)
FROM Ornek.dbo.SýralamaRank



SELECT
*,
NTILE(1)OVER(PARTITION BY Cinsiyet ORDER BY Maas)
FROM Ornek.dbo.SýralamaRank



SELECT
*,
NTILE(2)OVER(PARTITION BY Cinsiyet ORDER BY Maas)
FROM Ornek.dbo.SýralamaRank

--Case When ile Örnek

SELECT
AD,
CASE
	WHEN Grup = 1 then 'Yüksek Maas'
	ELSE 'Düþük Maas'
END AS Sýnýf
FROM

(
SELECT
*,
NTILE(2)OVER(ORDER BY Maas desc) AS Grup
FROM Ornek.dbo.SýralamaRank
)A

---  ### Ntie BÝTÝÞ ### ---


--- ### CUME_DIST BAÞLANGIÇ ### ---
--Bir deðerin grup içindeki Kümülatif daðýlýmýný bulur.Yani deðerin grupa göre görece pozisyonunu hesaplar.
--0 ile 1 arasýnda bir deðer üretir.
--Order By ifadesi Zorunludur.
--Partition By Opsiyonel.
--Formül : Mevcut Satýr / Toplam Satýr Sayýsý 

--Örnek :

--1.DURUM:
SELECT
*,
CUME_DIST()OVER(Order by Maas) AS [CUME_DIST],
(CUME_DIST()OVER(Order by Maas)*100) AS [CUME_DIST * 100]
FROM Ornek.dbo.SýralamaRank

--Datanýn yüzde 30'u nu temsil eden verileri göster
SELECT * FROM
(
SELECT
*,
CUME_DIST()OVER(Order by Maas)AS KUMDISTT ,
(CUME_DIST()OVER(Order by Maas)*100) AS KUMDIST
FROM Ornek.dbo.SýralamaRank
)A
WHERE A.KUMDIST<=30


--- ### CUME_DIST BÝTÝÞ ### ---



--- ### PERCENT_RANK BAÞLANGIÇ ### ---
--Bir ürünün diðerlerine göre yüde kaç daha pahalý olduðunu öðrenmek istersek kullanabileceðimiz bir fonksyiondur.
--Diðer bir kullanýmý ise,verilerin bize bir nevi sýralamasýný verir.
--En düþük deðer 0, en büyük deðer ise 1 deðerini alýr.
--FORMÜL :Mevcut Satýr - 1 / Toplam Satýr - 1
--Ýlk deðer 0,son deðer 100 deðerini alýr.
--SQL Server'da bir satýr grubu içindeki bir satýrýn göreli sýrasýný hesaplar.


--Örnek :

SELECT
*,
ROUND((PERCENT_RANK()OVER(Order by Maas)),1) AS [PERCENT_RANK]
FROM
Ornek.dbo.SýralamaRank

