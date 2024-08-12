--- TABLE VARIABLES ---
--De�i�ken i�erisnde tablo gibi birden fazla sat�r� tutmam�z� sa�lar.
--Temp.Table'lara benzerlik g�sterirler.
--Table variabllar�n veri tipi TABLE'd�r.Normal variable tan�mlarken veri tipini
--tan�mlad�ktan sonra dururduk ama burada tablo oldu�u i�in kolon adlar�n�da belirtmemiz gereklidir.
--Table Variable'lar� input ve out put parametre olarak kullanamay�z.
--Temp.Table'da # kullan�r�z.
--Table Var'da @ kullan�r�z.
--Temp.Tablo session bazl�d�r.Connection kapat�l�nca yok olurlar.Ve onlar� system database'lerde TEMPDB'de g�rmekteyiz.
--Temp table'da bir de�i�iklik yaparsak drop etmemiz laz�m ve tekrardan olu�turmam�z laz�m.
--Table Variable da bir de�i�iklik yapsak bile bir sorun ile kar��la�mamaktay�z.
--K���k datalarla table variable daha iyi �al���r. Ancak b�y�k datalarda temp.tables daha iyidir.

--Ama User defined fonk'da sonucu d�nd�rebilriz.

--temp tablolar� hat�rlayal�m:
--Temp Tablo Yaratt�k :
CREATE TABLE #DenemeTemp
(
ID INT,
ListeFiyat Money

);
--Temp Tablo veri girdik :
INSERT INTO #DenemeTemp
SELECT ProductID,ListPrice  FROM AdventureWorks2019.[Production].[Product]

--Sorgulad�k :
SELECT * FROM #DenemeTemp

--Benzerini yaratman�n ba�ka bir yolu daha var :Table Variables

--A�a��daki sorgular�n hepsini birlikte execute etmeliyiz.
--Table Variable olu�turma :
DECLARE @Tablo TABLE
(
UrunAd� varchar(max),
UrunID INT,
ListeFiyat� MONEY

);

--Table Variable Veri Girme :
INSERT INTO @Tablo
SELECT Name,ProductID,ListPrice  FROM AdventureWorks2019.[Production].[Product]

--Table Variable Veri Sorgulama:
SELECT * FROM @Tablo