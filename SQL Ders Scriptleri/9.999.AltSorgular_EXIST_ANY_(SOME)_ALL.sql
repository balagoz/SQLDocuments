--- ### EXIST,ANY,ALL,(SOME) ### ---


--- ### EXITS - NOT EXISTS BA�LANGI�  ### ---

--EXISTS ifadesi, Corrlated Subquery'leri yazarken s�kl�kla kulland���m�z ifadelerden bir tanesidir.

--�rnek :



-- 2 TABLOMUZ OLSUN :



SELECT * FROM Ornek.DBO.Tedarikci

SELECT * FROM Ornek.DBO.UrunList




--SORU : Yiyecek kategorsine tedarik sa�layan tedarik�ilerin adlar�:
--Hangi ID'im sonu� getiriyor hangi ID'im sonu� getirmiyor.
--��yle d���nebiliriz:
--Tedarikci tablosundaki ID = 1 �rne�in,a�a��daki alt sorguda sonu� d�n�r�yor mu ? Evet.
--O zaman listelenir.Sonra ID = 2'ye bak�l�r.Sonra di�erlerine...

SELECT TedarikciAd� FROM Ornek.DBO.Tedarikci --Bu tablodaki1,2,3,4 no'lu tedarik�ilerin hangileri a�a��daki sorguda var...?

WHERE EXISTS
(
SELECT * FROM Ornek.DBO.UrunList
WHERE Kategori = 'Yiyecek' and TedarikciID =Ornek.DBO.Tedarikci.ID
);



--2.YOL :

SELECT TedarikciAd� FROM Ornek.DBO.Tedarikci
WHERE ID IN
(SELECT TedarikciID FROM Ornek.DBO.UrunList WHERE Kategori = 'Yiyecek')




--Yiyecek kategorisinde tedarik�i olmayan�n ismi:

SELECT TedarikciAd� FROM Ornek.DBO.Tedarikci 

WHERE NOT EXISTS
(
SELECT * FROM Ornek.DBO.UrunList
WHERE Kategori = 'Yiyecek' and TedarikciID =Ornek.DBO.Tedarikci.ID
);





--�RNEK :

SELECT * FROM Person.PersonPhone

SELECT * FROM Person.PhoneNumberType


--�RNEK :
--Burada asl�nda Telefon T�r� = Cell olan BusinessEntityID'leri bulmaya �al���yoruz.
-- Ya da ba�ka deyi�le, yukar�daki sorgudan d�nen BusinessEntityID'ler a�a��daki sorguda var m�?


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






--- ### ANY ve ALL BA�LANGI� ### ---
--SOME = ANY.



--SORU : T�M ��retmendenlerden B�y�k olan bir ��renci var m�?

--2 TANE TABLOMUZ OLSUN :


SELECT * FROM Ornek.dbo.DersVerenler

SELECT * FROM Ornek.dbo.Ogrenci



---�oklu sorgu d�nd��� i�in ben a�a��daki �ekilde ANY veya ALL olmadan �al��t�ram�yorm.
--A�a��s� hata verir.
SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > (SELECT YAS FROM Ornek.dbo.DersVerenler);

--Do�ru kullan�m� a�a��daki gibi:
SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > ALL(SELECT YAS FROM Ornek.dbo.DersVerenler);



--SORU : Herhangibir ��retmenden B�y�k olan bir ��renci var m�?
--SORU : T�m ��retmenlerden B�y�k olan bir ��renci var m�?

SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > ANY(SELECT YAS FROM Ornek.dbo.DersVerenler);



--- ### ANY ve ALL B�T�� ### ---




--SOME ifadesi de ayn� sonucu d�necektir.
SELECT * FROM Ornek.dbo.Ogrenci
WHERE Yas > SOME (SELECT YAS FROM Ornek.dbo.DersVerenler);

--ALL VE ANY �LE BERABER KULLANAB�LECE��M�Z OPERAT�RLER:
-- =, >, >=, <, <=, <>, !=



-- 136 sat�r d�nd�
SELECT ProductID,Name,ListPrice,(SELECT AVG(ListPrice) FROM Production.Product) FROM Production.Product
WHERE ListPrice > ANY

(SELECT AVG(ListPrice) FROM Production.Product)


-- 368 sat�r d�nd�
SELECT ProductID,Name,ListPrice,(SELECT AVG(ListPrice) FROM Production.Product) FROM Production.Product
WHERE ListPrice < ANY

(SELECT AVG(ListPrice) FROM Production.Product)


--504 Sat�r d�nd�.
SELECT 136 + 368
SELECT COUNT(ProductID),COUNT( DISTINCT ProductID) FROM Production.Product
---------

SELECT BusinessEntityID,SalesLastYear,(SELECT AVG(SalesLastYear) FROM Sales.SalesPerson) FROM Sales.SalesPerson
WHERE SalesLastYear > ANY (SELECT AVG(SalesLastYear) FROM Sales.SalesPerson)

SELECT * FROM Sales.SalesPerson
WHERE BusinessEntityID= 275

















