---ORDER BY OFFSET FETCH---

-- ### ORDER BY BAÞLANGIÇ ###

/*

ORDER BY anahtar sözcüðü, verileri (metin veya sayý) artan ya da azalan düzende sýralamak için kullanýlan bir ifadedir.
ORDER BY komutu, kayýtlarý varsayýlan olarak artan sýrada sýralar (ASC). 
Kayýtlarý azalan sýrada sýralamak için DESC ifadesini kullanýr.Ve DESC diye belirtmemiz gereklidir.
Order By ifadesinde kolon adlarýný deðilde kolonlarýn sýrasýný da belirterek sýralama yapabiliriz.
Ancak Select yapýmýzdaki en ufak bir deðiþiklik kolon sýrasýný da etkileyebileceðinden bu yöntem kullanýlmamýlýdýr.


*/



--ORDER BY
--1 SYNTAX :
SELECT Kolon1, Kolon2, ...
FROM Tablo Adý
ORDER BY Kolon1, Kolon2, ... ASC|DESC;


--2 SYNTAX :
SELECT Kolon1, Kolon2, ...
FROM Tablo Adý
ORDER BY 1,2

---ÖRNEKLER:
SELECT * FROM Person.Person
order by FirstName

SELECT * FROM Person.Person
order by FirstName asc

SELECT * FROM Person.Person
order by FirstName DESC


SELECT FirstName,LastName FROM Person.Person
order by FirstName,LastName




SELECT FirstName,LastName FROM Person.Person
order by FirstName,LastName DESC



SELECT FirstName,LastName FROM Person.Person
order by FirstName DESC,LastName


SELECT FirstName,LastName FROM Person.Person
order by FirstName DESC,LastName DESC



-- SELECT LÝSTESÝNDE OLMADAN ORDER BY

SELECT BusinessEntityID FROM Person.Person
ORDER BY FirstName

SELECT BusinessEntityID FROM Person.Person
ORDER BY LastName



-- HERHANGÝBÝR ÝFADEYE GÖRE VEYA FONK.KOYARAK SIRLAMA YAPMA

SELECT * FROM Person.Person
ORDER BY LEN(firstname) DESC


SELECT FirstName,LEN(FirstName) FROM Person.Person
ORDER BY LEN(FirstName) DESC

-- KOLON SIRASINI VEREREK ORDER BY

SELECT FirstName,LastName FROM Person.Person
ORDER BY 1 

SELECT FirstName,LastName FROM Person.Person
ORDER BY 2

SELECT FirstName,LastName FROM Person.Person
ORDER BY 2 DESC



SELECT FirstName,LastName FROM Person.Person
ORDER BY 1,2 


-- ### ORDER BY BÝTÝÞ ###






--### OFFSET FETCH ###

--1 SYNTAX :

ORDER BY Kolonlar [ASC |DESC]
OFFSET Atlanacak Satýr Sayýsý {ROW | ROWS}
FETCH {FIRST | NEXT} Alýnmasýný Ýstediðimiz Satýr Sayýsý {ROW | ROWS} ONLY

--The OFFSET and FETCH clauses are the options of the ORDER BY clause. 
--They allow you to limit the number of rows to be returned by a query.

--Note that you must use the OFFSET and FETCH clauses with the ORDER BY clause. 
--Otherwise, you will get an error.

/*

OFFSET deyimi, sorgudan satýr döndürülmeye baþlamadan önce atlanacak satýr sayýsýný belirtir.
FETCH deyimi OFFSET deyimi iþlendikten sonra döndürülecek satýr sayýsýný belirtir.
FETCH deyimi isteðe baðlý iken OFFSET deyimi zorunludur. 
Ayrýca FETCH ile birlikte kullanabileceðimiz FIRST ve NEXT kelimeleri birbirlerinin yerine
kullanýlabilirler.



The OFFSET clause specifies the number of rows to skip before starting to return rows from the query. 
The offset_row_count can be a constant, variable, or parameter that is greater or equal to zero.
The FETCH clause specifies the number of rows to return after the OFFSET clause has been processed. 
The offset_row_count can a constant, variable or scalar that is greater or equal to one.
The OFFSET clause is mandatory while the FETCH clause is optional. 
Also, the FIRST and NEXT are synonyms respectively so you can use them interchangeably. 
Similarly, you can use the FIRST and NEXT interchangeably.

*/

-- ÖRNEK

SELECT BusinessEntityID,FirstName FROM Person.Person
ORDER BY BusinessEntityID


-- ÝLK 10 Satýrý atlayýp gerisinin hepsinin gelmesi için

SELECT BusinessEntityID,FirstName FROM Person.Person
ORDER BY BusinessEntityID
OFFSET 10 ROWS;


--ÝLK 10 Satýrý atla,sadece sonraki 10 satýr almak için FETCH kullanmak zorundayýz.

SELECT BusinessEntityID,FirstName FROM Person.Person
ORDER BY BusinessEntityID
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;




--ÖRNEK : en pahalý 10 ürünü getir.
--Bu durumda sadece sýralama yaptýk.
SELECT ProductID,ListPrice FROM Production.Product
ORDER BY ListPrice DESC

--OFFSET ve FETCH ile kullanýmý :
SELECT ProductID,ListPrice FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;



--VEYA
SELECT TOP 10 ProductID,ListPrice FROM Production.Product
ORDER BY ListPrice DESC






--STORED PROC SAYFALAMA ÖRNEÐÝ--

SELECT BusinessEntityID,NationalIDNumber FROM HumanResources.Employee
ORDER BY BusinessEntityID;


--@PageNumber : Sayfa Numarasý.
--@PageSize : Bir Sayfada kaç tane satýr olacak.


CREATE PROC spSayfalama
@PageNumber INT,
@PageSize INT
AS
BEGIN
	SELECT BusinessEntityID,NationalIDNumber FROM HumanResources.Employee
	ORDER BY BusinessEntityID
	OFFSET(@PageNumber-1)*@PageSize ROWS
	FETCH NEXT @PageSize ROWS ONLY
END

EXEC spSayfalama 1,10

EXEC spSayfalama 2,10

EXEC spSayfalama 3,10




