
-- WHERE VS HAVING--

/*
WHERE ifadesini select,insert,update ile de kullanabiliyoruz.
Ancak Having'i sadece Select ile kullanýyoruz.

Where Gruplama yapýlmadan filtreleme iþlemini yapar sonra filtrelenmiþ bu data seti üzerinden  
gruplama iþlemi yapýlýr.

Having'de gruplama iþlemi bittkten sonra filtreleme yapýlmaktadýr.

Aggregate fonksiyonlarý where ile kullanamýyoruz.

Aggregate fonksiyonlar Having ile kullanabiliyoruz.

Performans olarak HAVING where'den daha yavaþtýr. 

Performans açýsýndan Where Kullanmak daha mantýklýdýr.




*/
--Örnek : 


SELECT * FROM Ornek.dbo.Calýsanlar

--Önce basit bir gruplama iþlemi yapalým :
SELECT Cinsiyet,Sehir,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Cinsiyet,Sehir
ORDER BY Sehir




--AÞAÐIDAKÝLER AYNI SONUCU VERÝR.

--Örnekler:
--WHERE : Aþaðýda Ýlk Önce Erkekler filtrelenir sonra gruplama yapýlýr.

SELECT Cinsiyet,Sehir,SUM(Maas) FROM Ornek.dbo.Calýsanlar
WHERE Cinsiyet = 'E'
GROUP BY Cinsiyet,Sehir



--Ancak Aþaðýdaki durumda aggr.iþlemleri tüm satýrlar için yapýlýyor sonra Erkek'i filtreliyoruz.
--HAVING :
SELECT Cinsiyet,Sehir,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Cinsiyet,Sehir
HAVING Cinsiyet ='E'



-------------------------------



-- HAVING AGGR.FONK ÝLE KULLANIMI:

SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Calýsanlar
GROUP BY Sehir,Cinsiyet
HAVING SUM(Maas) > 60000 AND Cinsiyet = 'E';



------------------------------------


--ÖRNEK :

--Örnek Tablomuzu Oluþturalým:


SELECT * FROM Ornek.dbo.Elektronik


--1.Aþama : Ýlk Önce Group by ile gelen sonuçlara bakalým:

 SELECT Urun,SUM(SatýsTutarý) FROM Ornek.dbo.Elektronik
 GROUP BY Urun


--Toplam Satýþ Tutarý 1000 TL'yi aþan ürünleri bulun :

 SELECT Urun,SUM(SatýsTutarý) FROM Ornek.dbo.Elektronik
 GROUP BY Urun
 HAVING SUM(SatýsTutarý) > 1000



--Örneðin aþaðýdaki bir sorgu yazdýðýmýzda ayný sonucu verirler.--


SELECT Urun,SUM(SatýsTutarý) FROM Ornek.dbo.Elektronik
WHERE Urun IN ('Iphone','Laptop')
group by Urun


SELECT Urun,SUM(SatýsTutarý) FROM Ornek.dbo.Elektronik
group by Urun
HAVING Urun IN ('Iphone','Laptop');



---ÝKÝSÝ  BÝRLÝKTE DE KULLANILABÝLÝR--

SELECT * FROM Ornek.dbo.Elektronik

SELECT Urun,SUM(SatýsTutarý) FROM Ornek.dbo.Elektronik
WHERE Urun IN ('Iphone','Ipad')
group by Urun
HAVING SUM(SatýsTutarý) > 1000;




--- Aþaðýdaki sorguda Alýas kullanýmý hata verir.---


SELECT Urun,SUM(SatýsTutarý) AS Tutar  FROM Ornek.dbo.Elektronik
WHERE Urun in ('Iphone','Ipad')
GROUP BY Urun
HAVING Tutar > 1000


--DOÐRU KULLANIM AÞAÐIDAKÝ GÝBÝ OLACAKTIR :

SELECT Urun,SUM(SatýsTutarý) FROM Ornek.dbo.Elektronik
WHERE Urun IN ('Iphone','Ipad')
group by Urun
HAVING SUM(SatýsTutarý) > 1000;



---------------------------------------------------






------HAVIN AGGR.FONK.ÖRNEKLER------
--COUNT()
--1.HALÝ :
SELECT CountryRegionCode,COUNT(StateProvinceID) AS ADET FROM Person.StateProvince
GROUP BY CountryRegionCode

--2.HALÝ :
SELECT CountryRegionCode,count(StateProvinceID) FROM Person.StateProvince
GROUP BY CountryRegionCode
HAVING count(StateProvinceID) > 80
ORDER BY CountryRegionCode;




-- MIN VE MAX--

SELECT Color,MIN(SafetyStockLevel),MAX(SafetyStockLevel) FROM Production.Product
GROUP BY Color
HAVING MIN(SafetyStockLevel) < 500 AND MAX(SafetyStockLevel)>500;



--SUM



SELECT ProductID,SUM(Quantity) FROM Production.ProductInventory
GROUP BY ProductID
HAVING  SUM(Quantity)>1800;




--SUM

SELECT ProductID,SUM(Quantity) FROM Production.ProductInventory
GROUP BY ProductID
HAVING  SUM(Quantity)>(SELECT AVG(Quantity) FROM Production.ProductInventory)

--VEYA 

SELECT ProductID,SUM(Quantity) FROM Production.ProductInventory
GROUP BY ProductID
HAVING  SUM(Quantity)>314




--AVG


SELECT ProductID,AVG(Quantity) FROM Production.ProductInventory
GROUP BY ProductID
HAVING AVG(Quantity)>314


--AVG



SELECT COLOR,AVG(ListPrice) FROM Production.Product
GROUP BY COLOR
HAVING AVG (ListPrice) BETWEEN 500 AND 1000;




SELECT ProductID,MAX(ListPrice) FROM Production.Product
GROUP BY ProductID
HAVING MAX(ListPrice) > (SELECT AVG(ListPrice) FROM Production.Product)

--VEYA :

SELECT ProductID,MAX(ListPrice) FROM Production.Product
GROUP BY ProductID
HAVING MAX(ListPrice) > 438.6662



----------------------------------------



