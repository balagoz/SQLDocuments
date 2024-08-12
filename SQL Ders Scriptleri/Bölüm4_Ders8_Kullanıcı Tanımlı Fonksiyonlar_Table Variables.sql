--- TABLE VARIABLES ---
--Deðiþken içerisnde tablo gibi birden fazla satýrý tutmamýzý saðlar.
--Temp.Table'lara benzerlik gösterirler.
--Table variabllarýn veri tipi TABLE'dýr.Normal variable tanýmlarken veri tipini
--tanýmladýktan sonra dururduk ama burada tablo olduðu için kolon adlarýnýda belirtmemiz gereklidir.
--Table Variable'larý input ve out put parametre olarak kullanamayýz.
--Temp.Table'da # kullanýrýz.
--Table Var'da @ kullanýrýz.
--Temp.Tablo session bazlýdýr.Connection kapatýlýnca yok olurlar.Ve onlarý system database'lerde TEMPDB'de görmekteyiz.
--Temp table'da bir deðiþiklik yaparsak drop etmemiz lazým ve tekrardan oluþturmamýz lazým.
--Table Variable da bir deðiþiklik yapsak bile bir sorun ile karþýlaþmamaktayýz.
--Küçük datalarla table variable daha iyi çalýþýr. Ancak büyük datalarda temp.tables daha iyidir.

--Ama User defined fonk'da sonucu döndürebilriz.

--temp tablolarý hatýrlayalým:
--Temp Tablo Yarattýk :
CREATE TABLE #DenemeTemp
(
ID INT,
ListeFiyat Money

);
--Temp Tablo veri girdik :
INSERT INTO #DenemeTemp
SELECT ProductID,ListPrice  FROM AdventureWorks2019.[Production].[Product]

--Sorguladýk :
SELECT * FROM #DenemeTemp

--Benzerini yaratmanýn baþka bir yolu daha var :Table Variables

--Aþaðýdaki sorgularýn hepsini birlikte execute etmeliyiz.
--Table Variable oluþturma :
DECLARE @Tablo TABLE
(
UrunAdý varchar(max),
UrunID INT,
ListeFiyatý MONEY

);

--Table Variable Veri Girme :
INSERT INTO @Tablo
SELECT Name,ProductID,ListPrice  FROM AdventureWorks2019.[Production].[Product]

--Table Variable Veri Sorgulama:
SELECT * FROM @Tablo