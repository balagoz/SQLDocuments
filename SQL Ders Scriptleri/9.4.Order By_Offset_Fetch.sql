---ORDER BY OFFSET FETCH---

-- ### ORDER BY BA�LANGI� ###

/*

ORDER BY anahtar s�zc���, verileri (metin veya say�) artan ya da azalan d�zende s�ralamak i�in kullan�lan bir ifadedir.
ORDER BY komutu, kay�tlar� varsay�lan olarak artan s�rada s�ralar (ASC). 
Kay�tlar� azalan s�rada s�ralamak i�in DESC ifadesini kullan�r.Ve DESC diye belirtmemiz gereklidir.
Order By ifadesinde kolon adlar�n� de�ilde kolonlar�n s�ras�n� da belirterek s�ralama yapabiliriz.
Ancak Select yap�m�zdaki en ufak bir de�i�iklik kolon s�ras�n� da etkileyebilece�inden bu y�ntem kullan�lmam�l�d�r.


*/



--ORDER BY
--1 SYNTAX :
SELECT Kolon1, Kolon2, ...
FROM Tablo Ad�
ORDER BY Kolon1, Kolon2, ... ASC|DESC;


--2 SYNTAX :
SELECT Kolon1, Kolon2, ...
FROM Tablo Ad�
ORDER BY 1,2

---�RNEKLER:
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



-- SELECT L�STES�NDE OLMADAN ORDER BY

SELECT BusinessEntityID FROM Person.Person
ORDER BY FirstName

SELECT BusinessEntityID FROM Person.Person
ORDER BY LastName



-- HERHANG�B�R �FADEYE G�RE VEYA FONK.KOYARAK SIRLAMA YAPMA

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


-- ### ORDER BY B�T�� ###






--### OFFSET FETCH ###

--1 SYNTAX :

ORDER BY Kolonlar [ASC |DESC]
OFFSET Atlanacak Sat�r Say�s� {ROW | ROWS}
FETCH {FIRST | NEXT} Al�nmas�n� �stedi�imiz Sat�r Say�s� {ROW | ROWS} ONLY

--The OFFSET and FETCH clauses are the options of the ORDER BY clause. 
--They allow you to limit the number of rows to be returned by a query.

--Note that you must use the OFFSET and FETCH clauses with the ORDER BY clause. 
--Otherwise, you will get an error.

/*

OFFSET deyimi, sorgudan sat�r d�nd�r�lmeye ba�lamadan �nce atlanacak sat�r say�s�n� belirtir.
FETCH deyimi OFFSET deyimi i�lendikten sonra d�nd�r�lecek sat�r say�s�n� belirtir.
FETCH deyimi iste�e ba�l� iken OFFSET deyimi zorunludur. 
Ayr�ca FETCH ile birlikte kullanabilece�imiz FIRST ve NEXT kelimeleri birbirlerinin yerine
kullan�labilirler.



The OFFSET clause specifies the number of rows to skip before starting to return rows from the query. 
The offset_row_count can be a constant, variable, or parameter that is greater or equal to zero.
The FETCH clause specifies the number of rows to return after the OFFSET clause has been processed. 
The offset_row_count can a constant, variable or scalar that is greater or equal to one.
The OFFSET clause is mandatory while the FETCH clause is optional. 
Also, the FIRST and NEXT are synonyms respectively so you can use them interchangeably. 
Similarly, you can use the FIRST and NEXT interchangeably.

*/

-- �RNEK

SELECT BusinessEntityID,FirstName FROM Person.Person
ORDER BY BusinessEntityID


-- �LK 10 Sat�r� atlay�p gerisinin hepsinin gelmesi i�in

SELECT BusinessEntityID,FirstName FROM Person.Person
ORDER BY BusinessEntityID
OFFSET 10 ROWS;


--�LK 10 Sat�r� atla,sadece sonraki 10 sat�r almak i�in FETCH kullanmak zorunday�z.

SELECT BusinessEntityID,FirstName FROM Person.Person
ORDER BY BusinessEntityID
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;




--�RNEK : en pahal� 10 �r�n� getir.
--Bu durumda sadece s�ralama yapt�k.
SELECT ProductID,ListPrice FROM Production.Product
ORDER BY ListPrice DESC

--OFFSET ve FETCH ile kullan�m� :
SELECT ProductID,ListPrice FROM Production.Product
ORDER BY ListPrice DESC
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;



--VEYA
SELECT TOP 10 ProductID,ListPrice FROM Production.Product
ORDER BY ListPrice DESC






--STORED PROC SAYFALAMA �RNE��--

SELECT BusinessEntityID,NationalIDNumber FROM HumanResources.Employee
ORDER BY BusinessEntityID;


--@PageNumber : Sayfa Numaras�.
--@PageSize : Bir Sayfada ka� tane sat�r olacak.


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




