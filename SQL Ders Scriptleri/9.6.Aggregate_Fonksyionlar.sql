/*
AGGREGATE FONSK�YONLAR
	SUM
	MIN
	MAX
	COUNT
	AVG
*/


/*

Genel �zellikleri :
Null de�eri dikkate almazlar.
Verileri �zetlemek veya pivotlamak i�in kullan�l�rlar.
Tek bir sat�r d�nerler.
Input = Birden �ok sat�r.
Output : Tek Sat�r.
Neden ihtya� var : ��nk� �st y�netim �zetlenmi� verileri g�rmek ister.Direk olarak sonu� g�r�lmek istenir.
�st y�netim Detay verilerle u�ra�mak istemez.
Genellikle Group By ifadesi ile birlikte kullan�l�rlar.
D�st�nct ifadesi ile de s�k kullan�l�rlar.

Genel Syntax :
SELECT Aggreagate Fonksiyon Ad�(Kolon Ad�)
FROM Tablo Ad�

*/

--Genel Syntax :
SELECT Aggreagate Fonksiyon Ad�(Kolon Ad�)
FROM Tablo Ad�


-- ### COUNT BA�LANGI� ###

--1 

--GENEL SYNTAX :
SELECT COUNT(Kolon Ad�)
FROM Tablo Ad�
WHERE �art;

--2: Hem numerik hem de numerik olmayan data i�in kullan�labilirler.

--3 �rnekler:


SELECT * FROM Ornek.dbo.TABLO

SELECT COUNT(*) FROM Ornek.dbo.TABLO -- 8 SATIR,NULL DAH�L.

SELECT COUNT(Say�) FROM Ornek.dbo.TABLO -- 6 SATIR,NULL DAH�L de�il.

SELECT COUNT(DISTINCT Say�) FROM Ornek.dbo.TABLO -- 5 SATIR,NULL DAH�L de�il.






--4 : Herhangibir kolonda �oklu ( dublicate ) de�er var m� ve NULL de�er varm�y� 
--��renmek i�inde COUNT fonksiyonunu kullanabiliriz:


--�RNEK :

SELECT * FROM Person.Person -- 19.972 SATIR.


SELECT COUNT(*),COUNT(FirstName),COUNT(DISTINCT FirstName) FROM Person.Person


--�RNEK :

SELECT COUNT(*),COUNT(BusinessEntityID),COUNT(DISTINCT BusinessEntityID) FROM Person.Person

--�RNEK :

SELECT COUNT(*),COUNT(PersonType),COUNT(DISTINCT PersonType) FROM Person.Person


select PersonType FROM Person.Person




-- 5

--�rnek :
--Ka� Tane Product Var ?
--�oklayan sat�r var m�, onu a�a��daki sorgudan ��renebiliriz.

SELECT COUNT(ProductID) AS TOPLAM_ADET,COUNT(DISTINCT ProductID) AS TOPLAM_TEK�L_ADET FROM Production.Product

--�RNEK:
--A�a��da tablo i�indeki tekil renklerimiz belirtilmi�tir (NUll de�erde dahil olma �zere).
--Renklerin �r�n adetlerini tek tek kontrol edip,ayn� zamanda NULL de�erlerinde ka� adet oldu�una bakaca��z
--Daha sonra genel COUNT i�lemi uygulayarak her bir renk i�in d�nen toplam �r�n adetlerinin toplam�yla,
--tek tek her bir �r�n i�in buldu�umuz adetlerinin k�yaslamas�n� yaparak,genel COUNT ifademizin do�ru oldu�unu 
--kan�tlayabiliriz.




--COLOR s�t�unu i�erisindeki Tekil (d�st�nct) renklerimiz:
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


-- ### COUNT B�T�� ###




-- ### SUM BA�LANGI� ###

--SYNTAX :
SELECT SUM(Kolon Ad�)
FROM Tablo Ad�
WHERE �art;

-- NOT : Nullar� dikkate al�nmaz.

--2 �RNEK

USE Ornek
GO
SELECT * FROM dbo.TABLO

SELECT SUM(say�) FROM Tablo--Null'u saymad�.

SELECT SUM(DISTINCT say�) FROM Tablo--Tekrarlanan 2'lerden tek olani b�rakt�.

-------------------------------------------------
select * from Sales.SalesPerson


--Gene her bir tekil territory ID'nin SalesYTD kolonu i�in ayr� ayr� toplam�n� al�p,
--Ana Toplamla e�it olup olmad���n� kontrol edece�iz.

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



select SUM(SalesYTD) from Sales.SalesPerson  -- Buradaki toplam� arada basamaklar oolmad��� i�in anlayam�yoru.
--O y�zden FORMAT fonk. kullan�yoruz.


--Formatlanm�� Hali :

select FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson -- 36.277.592

--Veya
select FORMAT(SUM(SalesYTD),'##,#.###','tr') from Sales.SalesPerson --36.277.591,903

--Veya Para Birimi sembol�de ekleyebiliriz. Burada metin birle�tirme i�lemi yap�yoruz.

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



---Yukar�daki �ekilde tek tek'te toplayabiliriz ancak �ok uzun s�rer ve zaman kayb�, dolay�s�yla,
--GROUP by ifades�ni kullanarak exceldeki gibi pivot i�lemi yap�yoruz.


SELECT TerritoryID,FORMAT(SUM(SalesYTD),'##,#','tr') from Sales.SalesPerson
GROUP BY TerritoryID;



--�leride g�rece�imiz "CUBE" group by ifadesinde Ana toplam�da verir.O y�zden yazd�k,yazmasak da olurdu:
SELECT TerritoryID ,FORMAT(SUM(SalesYTD),'##,#','tr') FROM Sales.SalesPerson
GROUP BY CUBE (TerritoryID)
--Veya ben NULL yazan yere "Ana Toplam" yazd�rmak istiyorum.
--Onun i�in TerritoryID'Y� Metin'e �eviriyorum ki "Ana Toplam" ifadesini oraya yazabileyim.
--ISNULL'u ise, bo� g�rd���n yere "AnaToplam"yaz demek i�in kullan�yoruz.


SELECT ISNULL(CAST(TerritoryID AS varchar),'AnaToplam'),FORMAT(SUM(SalesYTD),'##,#','tr') FROM Sales.SalesPerson
GROUP BY CUBE (TerritoryID)


 
-----------------------------------

--�rnek :

SELECT SalesLastYear,CommissionPct FROM Sales.SalesPerson


SELECT SUM(SalesLastYear*CommissionPct) FROM Sales.SalesPerson


-- ### SUM B�T�� ###





--### AVG BA�LANGI� ###

--The AVG() function ignoresNULL values.-- AVG. fonksyionuda Null de�erleri dikkate almaz.


--SYNTAX :
SELECT AVG(KolonAd�)
FROM Tablo Ad�
WHERE �art;


-- �RNEK

SELECT * FROM Ornek.dbo.Average

SELECT AVG(Say�) FROM Ornek.dbo.Average

--Bir say�y�y� ondal�kl� hale getirmek i�in a�a��daki yolu kullanabiliriz :

--INT TO DECIMAL �RNEK 1:

SELECT CAST(AVG(Say�) AS DECIMAL(4,2))  FROM Ornek.dbo.Average

--INT TO DECIMAL �RNEK 2:

SELECT CAST(15/14 AS DECIMAL(4,1))

--INT TO DECIMAL �RNEK 3:
--Integer bir say�y�, ondal�kl� bir say�yla �arpabiliriz.
SELECT AVG(Say�)* 1.0000 FROM Ornek.dbo.Average



--D��ER �RNEKLER :
SELECT AVG(Bonus) FROM Sales.SalesPerson--2859.4117

--Yukar�daki ayn� sonuca a�a��daki gibi de ula�abiliriz :
SELECT SUM(Bonus)/COUNT(Bonus) FROM Sales.SalesPerson--2859.4117



--A�a��daki �ekilde de ko�ul vererek de kullanabiliriz:

SELECT AVG(Bonus) FROM Sales.SalesPerson
WHERE ModifiedDate = '2011-05-24'




-- Veya �� sorguda kullanabiliriz :
--Ortalamdan b�y�k sat�� tutarlar�n� bulal�m :

SELECT * FROM Sales.SalesPerson
WHERE SalesYTD >
(SELECT AVG(SalesYTD) FROM Sales.SalesPerson)




--### AVG B�T�� ###






--### MAX BA�LANGI� ###

--SYNTAX : 
SELECT MAX(Kolon Ad�) From Tablo Ad�
Where �art


SELECT * FROM Ornek.dbo.TABLO

SELECT MAX(say�) FROM Ornek.dbo.TABLO--Null'u saymad�.




--�rnek
SELECT MAX(SalesYTD) FROM Sales.SalesPerson

select MAX(EndOfDayRate) from Sales.CurrencyRate
WHERE CurrencyRateDate =('2011-05-31')



--�� Sorguda Kullanbiliriz :


--�rnek 1:
-- �rne�in, a�a��da MAX. de�eri bulunan bir de�erin di�er bilgilerini getirmek i�in kullanabiliriz.


select * from Sales.CurrencyRate
where EndOfDayRate =

(
select MAX(EndOfDayRate) from Sales.CurrencyRate
WHERE CurrencyRateDate =('2011-05-31')
)

--Veya ayn� sonuca a�a��daki �ekilde de ula�abilriz :

select * from Sales.CurrencyRate
WHERE EndOfDayRate =634.60


--�rnek 2:
SELECT * FROM Sales.SalesOrderDetail
WHERE LineTotal=
(SELECT MAX(LineTotal) FROM Sales.SalesOrderDetail)


--### MAX B�T�� ###






--### M�N BA�LANGI� ###



--SYNTAX : 
SELECT MIN(Kolon Ad�) From Tablo Ad�
Where �art


SELECT * FROM Ornek.dbo.TABLO

SELECT MIN(say�) FROM Ornek.dbo.TABLO


--�RNEK
--�irketteki en ya�l� ki�inin bilgilerini bulal�m :
SELECT * FROM HumanResources.Employee
WHERE BirthDate =
(SELECT MIN(BirthDate) FROM HumanResources.Employee)

--274 NO'lu ID'yi kontrol edelim. Ger�ekten Do�um Tarihi Do�ru mu ?
SELECT * FROM HumanResources.Employee
WHERE BusinessEntityID = 274


-- �rnek :
SELECT MIN(ListPrice) FROM Production.ProductListPriceHistory




--### M�N B�T�� ###




-- #### SON �RNEK BA�LANGI� ####
--Hepsini ayn� anda da kullanabiliriz.


SELECT
COUNT(*),
MIN(ListPrice) AS MinumumFiyat,
MAX(ListPrice) AS MaksimumFiyat,
SUM(ListPrice) AS ToplamFiyat,
AVG(ListPrice) AS OrtFiyat
FROM Production.Product


-- #### SON �RNEK B�T�� ####
