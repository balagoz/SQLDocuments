/*
AGGREGATE FONSKÝYONLAR
	SUM
	MIN
	MAX
	COUNT
	AVG
*/


/*

Genel Özellikleri :
Null deðeri dikkate almazlar.
Verileri Özetlemek veya pivotlamak için kullanýlýrlar.
Tek bir satýr dönerler.
Input = Birden Çok satýr.
Output : Tek Satýr.
Neden ihtyaç var : Çünkü üst yönetim özetlenmiþ verileri görmek ister.Direk olarak sonuç görülmek istenir.
Üst yönetim Detay verilerle uðraþmak istemez.
Genellikle Group By ifadesi ile birlikte kullanýlýrlar.
Dýstýnct ifadesi ile de sýk kullanýlýrlar.

Genel Syntax :
SELECT Aggreagate Fonksiyon Adý(Kolon Adý)
FROM Tablo Adý

*/

--Genel Syntax :
SELECT Aggreagate Fonksiyon Adý(Kolon Adý)
FROM Tablo Adý


-- ### COUNT BAÞLANGIÇ ###

--1 

--GENEL SYNTAX :
SELECT COUNT(Kolon Adý)
FROM Tablo Adý
WHERE þart;

--2: Hem numerik hem de numerik olmayan data için kullanýlabilirler.

--3 örnekler:


SELECT * FROM Ornek.dbo.TABLO

SELECT COUNT(*) FROM Ornek.dbo.TABLO -- 8 SATIR,NULL DAHÝL.

SELECT COUNT(Sayý) FROM Ornek.dbo.TABLO -- 6 SATIR,NULL DAHÝL deðil.

SELECT COUNT(DISTINCT Sayý) FROM Ornek.dbo.TABLO -- 5 SATIR,NULL DAHÝL deðil.






--4 : Herhangibir kolonda çoklu ( dublicate ) deðer var mý ve NULL deðer varmýyý 
--öðrenmek içinde COUNT fonksiyonunu kullanabiliriz:


--ÖRNEK :

SELECT * FROM Person.Person -- 19.972 SATIR.


SELECT COUNT(*),COUNT(FirstName),COUNT(DISTINCT FirstName) FROM Person.Person


--ÖRNEK :

SELECT COUNT(*),COUNT(BusinessEntityID),COUNT(DISTINCT BusinessEntityID) FROM Person.Person

--ÖRNEK :

SELECT COUNT(*),COUNT(PersonType),COUNT(DISTINCT PersonType) FROM Person.Person


select PersonType FROM Person.Person




-- 5

--Örnek :
--Kaç Tane Product Var ?
--Çoklayan satýr var mý, onu aþaðýdaki sorgudan öðrenebiliriz.

SELECT COUNT(ProductID) AS TOPLAM_ADET,COUNT(DISTINCT ProductID) AS TOPLAM_TEKÝL_ADET FROM Production.Product

--ÖRNEK:
--Aþaðýda tablo içindeki tekil renklerimiz belirtilmiþtir (NUll deðerde dahil olma üzere).
--Renklerin ürün adetlerini tek tek kontrol edip,ayný zamanda NULL deðerlerinde kaç adet olduðuna bakacaðýz
--Daha sonra genel COUNT iþlemi uygulayarak her bir renk için dönen toplam ürün adetlerinin toplamýyla,
--tek tek her bir ürün için bulduðumuz adetlerinin kýyaslamasýný yaparak,genel COUNT ifademizin doðru olduðunu 
--kanýtlayabiliriz.




--COLOR sütüunu içerisindeki Tekil (dýstýnct) renklerimiz:
NULL
Black
Blue
Grey
Multi
Red
Silver
Silver/Black
White
Yellow

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Black'; --93 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Blue'; --26 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Grey'; --1 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Multi';--8 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Red';-- 38 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Silver';--43 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Silver/Black';--7 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'White';-- 4 adet

SELECT COUNT(ProductID) FROM Production.Product
WHERE Color = 'Yellow';-- 36 adet

SELECT * FROM Production.Product
where Color IS NULL; -- 248 ADET

SELECT 93 +26 +1+8+38+43+7+4+36+248;-- 504 ADET

SELECT COUNT(*),COUNT(Color),COUNT(DISTINCT Color) FROM Production.Product

SELECT 256 + 248;--504 ADET


-- ### COUNT BÝTÝÞ ###




-- ### SUM BAÞLANGIÇ ###

--SYNTAX :
SELECT SUM(Kolon Adý)
FROM Tablo Adý
WHERE þart;

-- NOT : Nullarý dikkate alýnmaz.

--2 ÖRNEK

USE Ornek
GO
SELECT * FROM dbo.TABLO

SELECT SUM(sayý) FROM Tablo--Null'u saymadý.

SELECT SUM(DISTINCT sayý) FROM Tablo--Tekrarlanan 2'lerden tek olani býraktý.

-------------------------------------------------
select * from Sales.SalesPerson


--Gene her bir tekil territory ID'nin SalesYTD kolonu için ayrý ayrý toplamýný alýp,
--Ana Toplamla eþit olup olmadýðýný kontrol edeceðiz.

--Tekil TerritoryID'ler :
select DISTINCT(TerritoryID) from Sales.SalesPerson

NULL
1
2
3
4
5
6
7
8
9
10



select SUM(SalesYTD) from Sales.SalesPerson  -- Buradaki toplamý arada basamaklar oolmadýðý için anlayamýyoru.
--O yüzden FORMAT fonk. kullanýyoruz.


--Formatlanmýþ Hali :

select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson -- 36.277.592

--Veya
select FORMAT(SUM(SalesYTD),'##,#.###','tr') from Sales.SalesPerson --36.277.591,903

--Veya Para Birimi sembolüde ekleyebiliriz. Burada metin birleþtirme iþlemi yapýyoruz.

select FORMAT(SUM(SalesYTD),'##,#','tr') + ' TL' from Sales.SalesPerson --36.277.592 TL

--Veya

select FORMAT(SUM(SalesYTD),'C','tr')  from Sales.SalesPerson --?36.277.591,90

--Veya

select  'TL' + CAST(SUM(SalesYTD)) AS varchar (50)) from Sales.SalesPerson --36.277.592 TL





---Territory'lerin Tek Tek Toplamlar :---
select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =1;--4.502.152

select FORMAT(SUM(SalesYTD),'##,#','tr')  from Sales.SalesPerson
WHERE TerritoryID =2;--3.763.178

select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =3;--3.189.418



select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =4;--6.709.904


select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =5;--2.315.185


select FORMAT(SUM(SalesYTD),'##,#','tr')from Sales.SalesPerson
WHERE TerritoryID =6;--4.058.260



select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =7;--3.121.616



select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =8;--1.827.066



select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =9;--1.421.810



select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID =10;--4.116.871


select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
WHERE TerritoryID IS NULL;--1.252.127



---Yukarýdaki þekilde tek tek'te toplayabiliriz ancak çok uzun sürer ve zaman kaybý, dolayýsýyla,
--GROUP by ifadesþni kullanarak exceldeki gibi pivot iþlemi yapýyoruz.


SELECT TerritoryID,FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
GROUP BY TerritoryID;



--Ýleride göreceðimiz "CUBE" group by ifadesinde Ana toplamýda verir.O yüzden yazdýk,yazmasak da olurdu:
SELECT TerritoryID ,FORMAT(SUM(SalesYTD),'##,#','tr') FROM Sales.SalesPerson
GROUP BY CUBE (TerritoryID)
--Veya ben NULL yazan yere "Ana Toplam" yazdýrmak istiyorum.
--Onun için TerritoryID'YÝ Metin'e çeviriyorum ki "Ana Toplam" ifadesini oraya yazabileyim.
--ISNULL'u ise, boþ gördüðün yere "AnaToplam"yaz demek için kullanýyoruz.


SELECT ISNULL(CAST(TerritoryID AS varchar),'AnaToplam'),FORMAT(SUM(SalesYTD),'##,#','tr') FROM Sales.SalesPerson
GROUP BY CUBE (TerritoryID)


 
-----------------------------------

--Örnek :

SELECT SalesLastYear,CommissionPct FROM Sales.SalesPerson


SELECT SUM(SalesLastYear*CommissionPct) FROM Sales.SalesPerson


-- ### SUM BÝTÝÞ ###





--### AVG BAÞLANGIÇ ###

--The AVG() function ignoresNULL values.-- AVG. fonksyionuda Null deðerleri dikkate almaz.


--SYNTAX :
SELECT AVG(KolonAdý)
FROM Tablo Adý
WHERE þart;


-- ÖRNEK

SELECT * FROM Ornek.dbo.Average

SELECT AVG(Sayý) FROM Ornek.dbo.Average

--Bir sayýyýyý ondalýklý hale getirmek için aþaðýdaki yolu kullanabiliriz :

--INT TO DECIMAL ÖRNEK 1:

SELECT CAST(AVG(Sayý) AS DECIMAL(4,2))  FROM Ornek.dbo.Average

--INT TO DECIMAL ÖRNEK 2:

SELECT CAST(15/14 AS DECIMAL(4,1))

--INT TO DECIMAL ÖRNEK 3:
--Integer bir sayýyý, ondalýklý bir sayýyla çarpabiliriz.
SELECT AVG(Sayý)* 1.0000 FROM Ornek.dbo.Average



--DÝÐER ÖRNEKLER :
SELECT AVG(Bonus) FROM Sales.SalesPerson--2859.4117

--Yukarýdaki ayný sonuca aþaðýdaki gibi de ulaþabiliriz :
SELECT SUM(Bonus)/COUNT(Bonus) FROM Sales.SalesPerson--2859.4117



--Aþaðýdaki þekilde de koþul vererek de kullanabiliriz:

SELECT AVG(Bonus) FROM Sales.SalesPerson
WHERE ModifiedDate = '2011-05-24'




-- Veya Ýç sorguda kullanabiliriz :
--Ortalamdan büyük satýþ tutarlarýný bulalým :

SELECT * FROM Sales.SalesPerson
WHERE SalesYTD >
(SELECT AVG(SalesYTD) FROM Sales.SalesPerson)




--### AVG BÝTÝÞ ###






--### MAX BAÞLANGIÇ ###

--SYNTAX : 
SELECT MAX(Kolon Adý) From Tablo Adý
Where Þart


SELECT * FROM Ornek.dbo.TABLO

SELECT MAX(sayý) FROM Ornek.dbo.TABLO--Null'u saymadý.




--Örnek
SELECT MAX(SalesYTD) FROM Sales.SalesPerson

select MAX(EndOfDayRate) from Sales.CurrencyRate
WHERE CurrencyRateDate =('2011-05-31')



--Ýç Sorguda Kullanbiliriz :


--Örnek 1:
-- Örneðin, aþaðýda MAX. deðeri bulunan bir deðerin diðer bilgilerini getirmek için kullanabiliriz.


select * from Sales.CurrencyRate
where EndOfDayRate =

(
select MAX(EndOfDayRate) from Sales.CurrencyRate
WHERE CurrencyRateDate =('2011-05-31')
)

--Veya ayný sonuca aþaðýdaki þekilde de ulaþabilriz :

select * from Sales.CurrencyRate
WHERE EndOfDayRate =634.60


--Örnek 2:
SELECT * FROM Sales.SalesOrderDetail
WHERE LineTotal=
(SELECT MAX(LineTotal) FROM Sales.SalesOrderDetail)


--### MAX BÝTÝÞ ###






--### MÝN BAÞLANGIÇ ###



--SYNTAX : 
SELECT MIN(Kolon Adý) From Tablo Adý
Where Þart


SELECT * FROM Ornek.dbo.TABLO

SELECT MIN(sayý) FROM Ornek.dbo.TABLO


--ÖRNEK
--Þirketteki en yaþlý kiþinin bilgilerini bulalým :
SELECT * FROM HumanResources.Employee
WHERE BirthDate =
(SELECT MIN(BirthDate) FROM HumanResources.Employee)

--274 NO'lu ID'yi kontrol edelim. Gerçekten Doðum Tarihi Doðru mu ?
SELECT * FROM HumanResources.Employee
WHERE BusinessEntityID = 274


-- Örnek :
SELECT MIN(ListPrice) FROM Production.ProductListPriceHistory




--### MÝN BÝTÝÞ ###




-- #### SON ÖRNEK BAÞLANGIÇ ####
--Hepsini ayný anda da kullanabiliriz.


SELECT
COUNT(*),
MIN(ListPrice) AS MinumumFiyat,
MAX(ListPrice) AS MaksimumFiyat,
SUM(ListPrice) AS ToplamFiyat,
AVG(ListPrice) AS OrtFiyat
FROM Production.Product


-- #### SON ÖRNEK BÝTÝÞ ####
