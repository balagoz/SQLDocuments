--- ### EXIST,ANY,ALL,(SOME) ### ---


--- ### EXITS - NOT EXISTS BAÞLANGIÇ  ### ---

--EXISTS ifadesi, Corrlated Subquery'leri yazarken sýklýkla kullandýðýmýz ifadelerden bir tanesidir.

--Örnek :



-- 2 TABLOMUZ OLSUN :



SELECT * FROM Ornek.DBO.Tedarikci

SELECT * FROM Ornek.DBO.UrunList




--SORU : Yiyecek kategorsine tedarik saðlayan tedarikçilerin adlarý:
--Hangi ID'im sonuç getiriyor hangi ID'im sonuç getirmiyor.
--Þöyle düþünebiliriz:
--Tedarikci tablosundaki ID = 1 örneðin,aþaðýdaki alt sorguda sonuç dönürüyor mu ? Evet.
--O zaman listelenir.Sonra ID = 2'ye bakýlýr.Sonra diðerlerine...

SELECT TedarikciAdý FROM Ornek.DBO.Tedarikci --Bu tablodaki1,2,3,4 no'lu tedarikçilerin hangileri aþaðýdaki sorguda var...?

WHERE EXISTS
(
SELECT * FROM Ornek.DBO.UrunList
WHERE Kategori = 'Yiyecek' and TedarikciID =Ornek.DBO.Tedarikci.ID
);



--2.YOL :

SELECT TedarikciAdý FROM Ornek.DBO.Tedarikci
WHERE ID IN
(SELECT TedarikciID FROM Ornek.DBO.UrunList WHERE Kategori = 'Yiyecek')




--Yiyecek kategorisinde tedarikçi olmayanýn ismi:

SELECT TedarikciAdý FROM Ornek.DBO.Tedarikci 

WHERE NOT EXISTS
(
SELECT * FROM Ornek.DBO.UrunList
WHERE Kategori = 'Yiyecek' and TedarikciID =Ornek.DBO.Tedarikci.ID
);





--ÖRNEK :

SELECT * FROM Person.PersonPhone

SELECT * FROM Person.PhoneNumberType


--ÖRNEK :
--Burada aslýnda Telefon Türü = Cell olan BusinessEntityID'leri bulmaya çalýþýyoruz.
-- Ya da baþka deyiþle, yukarýdaki sorgudan dönen BusinessEntityID'ler aþaðýdaki sorguda var mý?


SELECT BusinessEntityID FROM Person.PersonPhone A
WHERE EXISTS

(
SELECT * FROM Person.PhoneNumberType B
WHERE Name = 'Cell' AND PhoneNumberTypeID = A.PhoneNumberTypeID

)


--KANITLAYALIM :
SELECT * FROM Person.PersonPhone
WHERE PhoneNumberTypeID = 1

------------------------------------------------






--- ### ANY ve ALL BAÞLANGIÇ ### ---
--SOME = ANY.



--SORU : TÜM Öðretmendenlerden Büyük olan bir öðrenci var mý?

--2 TANE TABLOMUZ OLSUN :


SELECT * FROM Ornek.dbo.DersVerenler

SELECT * FROM Ornek.dbo.Ogrenci



---Çoklu sorgu döndüðü için ben aþaðýdaki þekilde ANY veya ALL olmadan çalýþtýramýyorm.
--Aþaðýsý hata verir.
SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > (SELECT YAS FROM Ornek.dbo.DersVerenler);

--Doðru kullanýmý aþaðýdaki gibi:
SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > ALL(SELECT YAS FROM Ornek.dbo.DersVerenler);



--SORU : Herhangibir Öðretmenden Büyük olan bir öðrenci var mý?
--SORU : Tüm Öðretmenlerden Büyük olan bir öðrenci var mý?

SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > ANY(SELECT YAS FROM Ornek.dbo.DersVerenler);



--- ### ANY ve ALL BÝTÝÞ ### ---




--SOME ifadesi de ayný sonucu dönecektir.
SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > SOME (SELECT YAS FROM Ornek.dbo.DersVerenler);

--ALL VE ANY ÝLE BERABER KULLANABÝLECEÐÝMÝZ OPERATÖRLER:
-- =, >, >=, <, <=, <>, !=



-- 136 satýr döndü
SELECT ProductID,Name,ListPrice,(SELECT AVG(ListPrice) FROM Production.Product) FROM Production.Product
WHERE ListPrice > ANY

(SELECT AVG(ListPrice) FROM Production.Product)


-- 368 satýr döndü
SELECT ProductID,Name,ListPrice,(SELECT AVG(ListPrice) FROM Production.Product) FROM Production.Product
WHERE ListPrice < ANY

(SELECT AVG(ListPrice) FROM Production.Product)


--504 Satýr döndü.
SELECT 136 + 368
SELECT COUNT(ProductID),COUNT( DISTINCT ProductID) FROM Production.Product
---------

SELECT BusinessEntityID,SalesLastYear,(SELECT AVG(SalesLastYear) FROM Sales.SalesPerson) FROM Sales.SalesPerson
WHERE SalesLastYear > ANY (SELECT AVG(SalesLastYear) FROM Sales.SalesPerson)

SELECT * FROM Sales.SalesPerson
WHERE BusinessEntityID= 275

















