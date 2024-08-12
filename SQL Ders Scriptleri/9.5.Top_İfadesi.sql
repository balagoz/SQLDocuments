-- TOP �FADES� --

--1 
--SYNTAX :
SELECT TOP say�|percent [WITH TIES] Kolon Ad�
FROM Tablo Ad�
WHERE �art;


SELECT TOP (expression) [PERCENT]
    [WITH TIES]
FROM 
    table_name
ORDER BY 
    column_name;

/*

Select ifadesi tek ba��na kullan�ld��� zaman t�m tablo �zerinde bulunan sat�rlar� ve s�tunlar� kar��m�za getirir. 
Ancak bazen y�zbinlerce sat�rl�k tablolarla kar��la�abiliriz.B�yle bir durumda bir tablodan b�t�n verileri �ekmek veritaban�n�
zorlayabailir ve kimi zaman uygulaman�n kitlenmesine neden olacakt�r. 
Bunun yerine SELECT TOP ile belirtilen kadar kay�t se�ilebilir.
Select Top ifadesi ile kay�t adedi veya gelecek kay�tlar�n y�zdesini belirleyebiliriz. 

The SELECT TOP clause is used to specify the number of records to return.
The SELECT TOP clause is useful on large tables with thousands of records. 
Returning a large number of records can impact performance.

MYSQL'de Limit
Oracle 'da ROWNUM
*/

--�RNEK :

--�LK HAL� :
SELECT Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC

-- TOP �LE KULLANIMI :
SELECT TOP 10 Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC

-- �LK 3 KAYIT GELS�N
SELECT TOP 3 * FROM Production.Product


-- L�STPR�CE EN Y�KSEK �LK 3 KAYIT GELS�N :
SELECT TOP 3 * FROM Production.Product
ORDER BY ListPrice DESC



--Y�ZDE KULLANIMI :

SELECT TOP 10 PERCENT * FROM Production.Product
ORDER BY ListPrice DESC



--�RNEK : Burada ORDER BY ile s�ralay�p manuel'de bakabiliriz.

SELECT ProductID,Name,ListPrice  FROM Production.Product
ORDER BY ListPrice DESC


--�RNEK
--En pahal� 10 �R�N
SELECT TOP 10 ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC



--�RNEK
SELECT TOP 1 PERCENT ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC




--WITH TIES �LE KULLANIM
--Burada beraberlik varsa onlar�da getiriyor.�rne�in sadece TOP 10 ile bakt���m�z zaman
--775'NOLU ProdcutID = 3374,99.
--Ancak WITH TIES �le kulland���m�zda, ayn� de�ere sahip 776,777,778 nolu �r�nlerde geliyor.


SELECT TOP 10 ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC


SELECT TOP 10 WITH TIES ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC




--�RNEK:
--D�Z TOP KULLANIMI :
SELECT TOP 1  ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC



--WITH TIES �LE KULLANIM
SELECT TOP 1 WITH TIES ProductID,Name,ListPrice FROM Production.Product
ORDER BY ListPrice DESC
