--NT�LE --- CUME_DIST --- PERCENT_RANK ---

---  ### Ntlie BA�LANGI� ### ---
--Veriyi istedi�imiZ bir rakama g�re gruplara ay�r�r.
--Order by ifadesi zorunlu.
--Partition ifadesi opsiyonel.
--NTILE(2)'yi 10 sat�r i�in uygularsam --- 5'er li 2 grup yapar.
--E�er say�lar�m�z tam olarak b�l�nm�yorsa o zaman farkl� sat�r say�lar�nda gruplara sahip oluruz.
--NTILE(3)'yi 10 sat�r i�in uygularsam --- 4 sat�r bir grupta,3'er sat�rda di�er gruplarda.
--SYNTAX: NTILE()OVER(ORDER BY Kolon1,Kolon2,...)
--NTILE()--Parantez i�erisine tek bir arg�man kabul eder.

--�rnek:

SELECT * FROM Ornek.dbo.S�ralamaRank

SELECT
*,
NTILE(2)OVER(ORDER BY Maas) AS GRUP
FROM Ornek.dbo.S�ralamaRank


--�rnek:
SELECT
*,
NTILE(3)OVER(ORDER BY Maas)AS GRUP
FROM Ornek.dbo.S�ralamaRank


--�rnek:
SELECT
*,
NTILE(10)OVER(ORDER BY Maas)
FROM Ornek.dbo.S�ralamaRank




--�rnek: Part�t�on By ile
SELECT
*,
NTILE(5)OVER(PARTITION BY Cinsiyet ORDER BY Maas)
FROM Ornek.dbo.S�ralamaRank



SELECT
*,
NTILE(1)OVER(PARTITION BY Cinsiyet ORDER BY Maas)
FROM Ornek.dbo.S�ralamaRank



SELECT
*,
NTILE(2)OVER(PARTITION BY Cinsiyet ORDER BY Maas)
FROM Ornek.dbo.S�ralamaRank

--Case When ile �rnek

SELECT
AD,
CASE
	WHEN Grup = 1 then 'Y�ksek Maas'
	ELSE 'D���k Maas'
END AS S�n�f
FROM

(
SELECT
*,
NTILE(2)OVER(ORDER BY Maas desc) AS Grup
FROM Ornek.dbo.S�ralamaRank
)A

---  ### Ntie B�T�� ### ---


--- ### CUME_DIST BA�LANGI� ### ---
--Bir de�erin grup i�indeki K�m�latif da��l�m�n� bulur.Yani de�erin grupa g�re g�rece pozisyonunu hesaplar.
--0 ile 1 aras�nda bir de�er �retir.
--Order By ifadesi Zorunludur.
--Partition By Opsiyonel.
--Form�l : Mevcut Sat�r / Toplam Sat�r Say�s� 

--�rnek :

--1.DURUM:
SELECT
*,
CUME_DIST()OVER(Order by Maas) AS [CUME_DIST],
(CUME_DIST()OVER(Order by Maas)*100) AS [CUME_DIST * 100]
FROM Ornek.dbo.S�ralamaRank

--Datan�n y�zde 30'u nu temsil eden verileri g�ster
SELECT * FROM
(
SELECT
*,
CUME_DIST()OVER(Order by Maas)AS KUMDISTT ,
(CUME_DIST()OVER(Order by Maas)*100) AS KUMDIST
FROM Ornek.dbo.S�ralamaRank
)A
WHERE A.KUMDIST<=30


--- ### CUME_DIST B�T�� ### ---



--- ### PERCENT_RANK BA�LANGI� ### ---
--Bir �r�n�n di�erlerine g�re y�de ka� daha pahal� oldu�unu ��renmek istersek kullanabilece�imiz bir fonksyiondur.
--Di�er bir kullan�m� ise,verilerin bize bir nevi s�ralamas�n� verir.
--En d���k de�er 0, en b�y�k de�er ise 1 de�erini al�r.
--FORM�L :Mevcut Sat�r - 1 / Toplam Sat�r - 1
--�lk de�er 0,son de�er 100 de�erini al�r.
--SQL Server'da bir sat�r grubu i�indeki bir sat�r�n g�reli s�ras�n� hesaplar.


--�rnek :

SELECT
*,
ROUND((PERCENT_RANK()OVER(Order by Maas)),1) AS [PERCENT_RANK]
FROM
Ornek.dbo.S�ralamaRank

