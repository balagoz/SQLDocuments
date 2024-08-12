-- TOP ÝFADESÝ --

--1 
--SYNTAX :
SELECT TOP sayý|percent [WITH TIES] Kolon Adý
FROM Tablo Adý
WHERE Þart;


SELECT TOP (expression) [PERCENT]
    [WITH TIES]
FROM 
    table_name
ORDER BY 
    column_name;

/*

Select ifadesi tek baþýna kullanýldýðý zaman tüm tablo üzerinde bulunan satýrlarý ve sütunlarý karþýmýza getirir. 
Ancak bazen yüzbinlerce satýrlýk tablolarla karþýlaþabiliriz.Böyle bir durumda bir tablodan bütün verileri çekmek veritabanýný
zorlayabailir ve kimi zaman uygulamanýn kitlenmesine neden olacaktýr. 
Bunun yerine SELECT TOP ile belirtilen kadar kayýt seçilebilir.
Select Top ifadesi ile kayýt adedi veya gelecek kayýtlarýn yüzdesini belirleyebiliriz. 

The SELECT TOP clause is used to specify the number of records to return.
The SELECT TOP clause is useful on large tables with thousands of records. 
Returning a large number of records can impact performance.

MYSQL'de Limit
Oracle 'da ROWNUM
*/

--ÖRNEK :

--ÝLK HALÝ :
SELECT Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC

-- TOP ÝLE KULLANIMI :
SELECT TOP 10 Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC

-- ÝLK 3 KAYIT GELSÝN
SELECT TOP 3 * FROM Production.Product


-- LÝSTPRÝCE EN YÜKSEK ÝLK 3 KAYIT GELSÝN :
SELECT TOP 3 * FROM Production.Product
ORDER BY ListPrice DESC



--YÜZDE KULLANIMI :

SELECT TOP 10 PERCENT * FROM Production.Product
ORDER BY ListPrice DESC



--ÖRNEK : Burada ORDER BY ile sýralayýp manuel'de bakabiliriz.

SELECT ProductID,Name,ListPrice  FROM Production.Product
ORDER BY ListPrice DESC


--ÖRNEK
--En pahalý 10 ÜRÜN
SELECT TOP 10 ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC



--ÖRNEK
SELECT TOP 1 PERCENT ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC




--WITH TIES ÝLE KULLANIM
--Burada beraberlik varsa onlarýda getiriyor.Örneðin sadece TOP 10 ile baktýðýmýz zaman
--775'NOLU ProdcutID = 3374,99.
--Ancak WITH TIES Ýle kullandýðýmýzda, ayný deðere sahip 776,777,778 nolu ürünlerde geliyor.


SELECT TOP 10 ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC


SELECT TOP 10 WITH TIES ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC




--ÖRNEK:
--DÜZ TOP KULLANIMI :
SELECT TOP 1  ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC



--WITH TIES ÝLE KULLANIM
SELECT TOP 1 WITH TIES ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC
