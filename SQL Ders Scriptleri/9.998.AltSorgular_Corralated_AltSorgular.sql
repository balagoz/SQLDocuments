--- ### ALT SORGULAR BAÞLANGIÇ ### 


--Ýç içe geçmiþ sorgulardýr.
--Genellikle Select,From ve Where ifadeleri içinde kullanýlýr.
--Alt sorgular,tek bir deðer (Veya bazen Daha fazla) dönen tek bir select statement'týr.
--Select,update,insert,delete'in içerisinmde iç içe kullanabiliriz.
--Alt sorgularýn içinde alt sorgular da yazmamýz mümkündür.
--Toplamda 32 level'a kadar alt sorgu yazýlabilinir.
--Inner sorgular olarak da bilinir.
--Daima parantez içerisinde yer alýrlar.
--Ýç sorguda parantez ile yazýlan sorgudaki ,from'dan sonraki tablodaki sütunlarý dýþ sorguda kullanamayýz.



--ÖRNEK :
--Liste fiyatý en yüksek olan ürünle ilgili bilgileri getirdik :

SELECT * FROM Production.Product
WHERE ListPrice =
(SELECT MAX(ListPrice) FROM Production.Product)





--Örnek :
--Liste fiyatý ort.fiyatýn üzerinde olan ürünlerle ilgili bilgileri getirdik:


SELECT * FROM Production.Product
WHERE ListPrice >
(SELECT AVG(ListPrice) FROM Production.Product) -- 438.6662





--Hiç satmadýðýmýz ürünlerin ID ve Açýklamasýný getirin:

--2 TANE TABLOMUZ OLSUN :


SELECT * FROM Ornek.dbo.Urunler

SELECT * FROM Ornek.dbo.UrunlerSatýs


--Left joýn ile de ayný sonuca ulaþabilridik:

SELECT * FROM
Ornek.dbo.Urunler A
LEFT JOIN
Ornek.dbo.UrunlerSatýs B
ON A.ID =B.UrunID
WHERE B.UrunID IS NULL



--Hiç satmadýðýmýz ürünlerin ID ve Açýklamasýný getirin:
-- ALT SORGUYLA ÇÖZÜM :

select ID,UrunAdý,Acýklama FROM Ornek.dbo.Urunler
WHERE ID NOT IN (SELECT UrunID FROM Ornek.dbo.UrunlerSatýs)



--Örnek :
---Urun ADI ve toplam adedini getirin 


SELECT * FROM Ornek.dbo.Urunler -- Ürün Adý bu tabloda var.

SELECT * FROM Ornek.dbo.UrunlerSatýs 


--LEFT JOIN ÝLE YAZALIM


SELECT 
A.UrunAdý,
SUM(B.SatýlanAdet)
FROM Ornek.dbo.Urunler A
LEFT JOIN
Ornek.dbo.UrunlerSatýs B
ON A.ID = B.UrunID
GROUP BY A.UrunAdý;


-- ALT SORGUYLA YAZIM :
--Ýþte þimdi yazdýðýmýz alt sorgu kendi kendine çalýþamayan bir alt sorgu.Yani corralated alt sorgu.
--Çalýþmasý için dýþarýdaki sorguya ihtiyacý var.
--Dýþ sorgudan gelen her bir deðer için çalýþýr.


SELECT * FROM Ornek.dbo.Urunler -- Ürün Adý bu tabloda var.

SELECT * FROM Ornek.dbo.UrunlerSatýs 


SELECT
ID,
UrunAdý,
(SELECT SUM(SatýlanAdet) from Ornek.dbo.UrunlerSatýs WHERE UrunID = Ornek.dbo.Urunler.ID ) AS ADET
from
Ornek.dbo.Urunler








--Alt Sorgular Diðer Örnekler :

--Örnek 1:
--Max listprice dediðimde adýný veya diðer bilgileri göremiyorum.
--Ama alt sorgu þeklinde kullanýrsak MAX(listPrice)'e sahip ürünün bilgilerini görebiliriz. 

SELECT * FROM Production.Product
WHERE listPrice =(SELECT MAX(listPrice) FROM Production.Product)



--Örnek 2:
SELECT * FROM Production.Product
WHERE listPrice > (SELECT AVG(listPrice) FROM Production.Product)


--Örnek 3: select'içinde Subquery Kullanmak:


SELECT
ProductID,
ListPrice,
(Select AVG(ListPrice) FROM Production.Product) as "AVG FÝYAT"
FROM Production.Product







--ÖRNEK 5:--Birden fazla deðer dönen subquery'ler.
--Bu tip durumlarda IN kullanýrýz.

SELECT LocationID FROM Production.ProductInventory
WHERE ProductID IN

(SELECT ProductID FROM Production.ProductInventory
where Quantity > 400 )



--ÖRNEK 5:--Birden fazla deðer dönen subquery'ler.
--Bu tip durumlarda IN kullanýrýz.
SELECT * FROM Person.Address
WHERE StateProvinceID 
IN
(
SELECT StateProvinceID FROM Person.StateProvince
WHERE TerritoryID BETWEEN 1 AND 3
)



--ÝÇ ÝÇE 2 ÝÇ SORGU YAZALIM--
  
SELECT DISTINCT(YEAR(BirthDate)) FROM HumanResources.Employee
WHERE BirthDate IN
(SELECT BirthDate FROM HumanResources.Employee
WHERE BusinessEntityID IN
	(SELECT BusinessEntityID FROM HumanResources.Employee
	WHERE YEAR(HireDate) BETWEEN 2007 AND 2009))





-- FROM Clause içinde Kullanýlan :
SELECT AVG(PersonelAdet)FROM

(
SELECT Gender,Count(BusinessEntityID) AS PersonelAdet FROM HumanResources.Employee
GROUP BY Gender
)A



--- ### ALT SORGULAR BÝTÝÞ ### 









--- ### CORRALATED ALT SORGULAR BAÞLANGIÇ ###

--Subquery kendi kendine çalýþan bir subquery deðilse,bir baþka deyiþle
--çalýþmasý için dýþardaki sorguya ihtiyacý varsa buna denir.
--Dýþ sorgudan gelen her bir deðer için çalýþýr.




---Mesela aþaðýdaki altsorgu kendi kendine çalýþabiliyor.--


SELECT * FROM HumanResources.Employee
WHERE BusinessEntityID IN
(SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle LIKE ('Research%'))




--AÞþaðýdaki alt sorgu kendi kendine çalýþamýyor.
--Çalýþmasý için outer query'e ihtiyacý var,veriye oradan alýyor çünkü---


SELECT * FROM Ornek.dbo.Urunler -- Ürün Adý bu tabloda var.

SELECT * FROM Ornek.dbo.UrunlerSatýs 

SELECT
UrunAdý,
(SELECT SUM(SatýlanAdet) from Ornek.dbo.UrunlerSatýs  WHERE UrunID = Urunler.ID )
from
Ornek.dbo.Urunler



--Diðer Örnek :

SELECT * FROM Person.Address;

Select * from Person.StateProvince;



SELECT City FROM Person.Address
WHERE StateProvinceID IN

(
Select StateProvinceID from Person.StateProvince Where StateProvinceID =Person.Address.StateProvinceID
AND Person.Address.StateProvinceID BETWEEN 1 AND 5
)


--- ### CORRALATED ALT SORGULAR BÝTÝÞ ### 








--- ### DERÝVED TABLE ### ----
--Aslýnda tabloya alias vermedir.
--Türetilmiþ tablolarýdr.
--Örnek:

--Örnek iki tablomuz olsun:

select * from [Person].[BusinessEntityAddress]
SELECT * FROM Person.AddressType

--JOINLIYORUZ:

SELECT
ISNULL(B.Name,'Toplam') AS AdresTipi,
COUNT(A.BusinessEntityID) AS MüþteriAdedi
FROM
[Person].[BusinessEntityAddress] A
LEFT JOIN
Person.AddressType B
ON A.AddressTypeID = B.AddressTypeID
GROUP BY ROLLUP (B.Name)




--derived table yaratýyoruz:
--Türemiþ tablo ( derived tablo )'da sadece tablomuza isim veriyoruz ve yukarýya bir select ifadesi koyuyoruz.


SELECT * FROM 

(
SELECT
ISNULL(B.Name,'Toplam') AS AdresTipi,
COUNT(A.BusinessEntityID) AS MüþteriAdedi
FROM
[Person].[BusinessEntityAddress] A
LEFT JOIN
Person.AddressType B
ON A.AddressTypeID = B.AddressTypeID
GROUP BY ROLLUP (B.Name)

)M
WHERE MüþteriAdedi<800




