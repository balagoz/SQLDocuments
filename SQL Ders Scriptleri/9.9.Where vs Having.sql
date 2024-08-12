
-- WHERE VS HAVING--

/*
WHERE ifadesini select,insert,update ile de kullanabiliyoruz.
Ancak Having'i sadece Select ile kullan�yoruz.

Where Gruplama yap�lmadan filtreleme i�lemini yapar sonra filtrelenmi� bu data seti �zerinden  
gruplama i�lemi yap�l�r.

Having'de gruplama i�lemi bittkten sonra filtreleme yap�lmaktad�r.

Aggregate fonksiyonlar� where ile kullanam�yoruz.

Aggregate fonksiyonlar Having ile kullanabiliyoruz.

Performans olarak HAVING where'den daha yava�t�r. 

Performans a��s�ndan Where Kullanmak daha mant�kl�d�r.




*/
--�rnek : 


SELECT * FROM Ornek.dbo.Cal�sanlar

--�nce basit bir gruplama i�lemi yapal�m :
SELECT Cinsiyet,Sehir,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Cinsiyet,Sehir
ORDER BY Sehir




--A�A�IDAK�LER AYNI SONUCU VER�R.

--�rnekler:
--WHERE : A�a��da �lk �nce Erkekler filtrelenir sonra gruplama yap�l�r.

SELECT Cinsiyet,Sehir,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
WHERE Cinsiyet = 'E'
GROUP BY Cinsiyet,Sehir



--Ancak A�a��daki durumda aggr.i�lemleri t�m sat�rlar i�in yap�l�yor sonra Erkek'i filtreliyoruz.
--HAVING :
SELECT Cinsiyet,Sehir,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Cinsiyet,Sehir
HAVING Cinsiyet ='E'



-------------------------------



-- HAVING AGGR.FONK �LE KULLANIMI:

SELECT Sehir,Cinsiyet,SUM(Maas) FROM Ornek.dbo.Cal�sanlar
GROUP BY Sehir,Cinsiyet
HAVING SUM(Maas) > 60000 AND Cinsiyet = 'E';



------------------------------------


--�RNEK :

--�rnek Tablomuzu Olu�tural�m:


SELECT * FROM Ornek.dbo.Elektronik


--1.A�ama : �lk �nce Group by ile gelen sonu�lara bakal�m:

 SELECT Urun,SUM(Sat�sTutar�) FROM Ornek.dbo.Elektronik
 GROUP BY Urun


--Toplam Sat�� Tutar� 1000 TL'yi a�an �r�nleri bulun :

 SELECT Urun,SUM(Sat�sTutar�) FROM Ornek.dbo.Elektronik
 GROUP BY Urun
 HAVING SUM(Sat�sTutar�) > 1000



--�rne�in a�a��daki bir sorgu yazd���m�zda ayn� sonucu verirler.--


SELECT Urun,SUM(Sat�sTutar�) FROM Ornek.dbo.Elektronik
WHERE Urun IN ('Iphone','Laptop')
group by Urun


SELECT Urun,SUM(Sat�sTutar�) FROM Ornek.dbo.Elektronik
group by Urun
HAVING Urun IN ('Iphone','Laptop');



---�K�S�  B�RL�KTE DE KULLANILAB�L�R--

SELECT * FROM Ornek.dbo.Elektronik

SELECT Urun,SUM(Sat�sTutar�) FROM Ornek.dbo.Elektronik
WHERE Urun IN ('Iphone','Ipad')
group by Urun
HAVING SUM(Sat�sTutar�) > 1000;




--- A�a��daki sorguda Al�as kullan�m� hata verir.---


SELECT Urun,SUM(Sat�sTutar�) AS Tutar  FROM Ornek.dbo.Elektronik
WHERE Urun in ('Iphone','Ipad')
GROUP BY Urun
HAVING Tutar > 1000


--DO�RU KULLANIM A�A�IDAK� G�B� OLACAKTIR :

SELECT Urun,SUM(Sat�sTutar�) FROM Ornek.dbo.Elektronik
WHERE Urun IN ('Iphone','Ipad')
group by Urun
HAVING SUM(Sat�sTutar�) > 1000;



---------------------------------------------------






------HAVIN AGGR.FONK.�RNEKLER------
--COUNT()
--1.HAL� :
SELECT CountryRegionCode,COUNT(StateProvinceID) AS ADET FROM Person.StateProvince
GROUP BY CountryRegionCode

--2.HAL� :
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



