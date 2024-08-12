/*
MANTIKSAL OPERAT�LER 
	AND
	OR
	NOT
	AND ve OR B�RL�KTE KULLANIMI
D��ER KAR�ILA�TIRMA OPERAT�LER�
	IN
	NOT IN
	LIKE
	NOT LIKE
	BETWEEN
	NOT BETWEEN
	IS NULL
	IS NOT NULL
*/

-- ### AND BA�LANGI� ###

--SYNTAX 
SELECT kolon_1, kolon_2, ...
FROM Tablo Ad�
WHERE �art_1 AND �art_2 AND �art_3 ...;

--�rnek :

SELECT * FROM Sales.CreditCard
WHERE CardType = 'SuperiorCard';

SELECT * FROM Sales.CreditCard
WHERE CardType = 'SuperiorCard' AND ExpMonth=8;



SELECT * FROM Person.Person
WHERE FirstName = 'Ken' AND LastName = 'Myer' AND MiddleName IS not null







SELECT * FROM Person.Person
WHERE FirstName = 'Ken' AND Title = 'Mr.' AND LastName='Myer';


SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE OrderQty = 550 and UnitPrice > 20 AND LineTotal < 15000;


-- ### AND B�T�� ###









-- ### NOT BA�LANGI� ###
--1 : SYNTAX :
SELECT Kolon1,Kolon2,Kolon3,...Kolon_n FROM Tablo Ad�
WHERE NOT �art;



--2 : �rnek :

SELECT * FROM Person.ContactType
where NOT Name = 'Accounting Manager';

--NOT ifadesi genellikle �ok kullan�lmaz. Onun yerine a�a��daki �ekilde kullan�l� genelde;
SELECT * FROM Person.ContactType
WHERE Name != 'Accounting Manager';


--3.�rnek :
SELECT * FROM Person.ContactType
where NOT Name = 'Accounting Manager' AND NOT Name = 'Assistant Sales Agent' AND NOT Name = 'Owner'

-- ### NOT B�T�� ###









-- ### OR BA�LANGI� ###

--:SYNTAX :
SELECT Kolon_1, Kolon_2, ...
FROM Tablo Ad�
WHERE �art_1 OR �art_2 OR �art_3 ...;

--2 :�rnek:

SELECT * FROM Sales.SalesPerson
WHERE TerritoryID = 2 OR TerritoryID = 4 OR TerritoryID = 5 OR TerritoryID = 8


SELECT * FROM Sales.SalesPerson
WHERE TerritoryID =2 or TerritoryID IS NULL


--NULL DE�ERLER� SAYMAK ���N :
SELECT COUNT(*) FROM Sales.SalesPerson
WHERE TerritoryID IS NULL;






SELECT * FROM Sales.SalesPerson
WHERE TerritoryID = 2 or Bonus = 0;


SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR FirstName = 'Rob';

SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR FirstName = 'Rob' OR FirstName = 'Terri' 


-- ### OR B�T�� ###






-- ### AND OR B�RL�KTE KULLANIM BA�LANGI� ###

--NOT :And'i ilk ba�ta de�erlendirir.
--A�a��daki �rnekte, Rob ve emailpromotion =0 olacak veya FirstName Ken olacak.

SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR (FirstName = 'Rob' AND EmailPromotion = 0)
ORDER BY FirstName




--A�a��daki �rnekte,isim Ken veya Rob olacak. Bu �art ile EmailPromotion 0 olacak.

SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR FirstName = 'Rob' AND EmailPromotion = 0
ORDER BY FirstName



SELECT * FROM HumanResources.Department
WHERE GroupName ='Research and Development' AND (Name='Engineering' OR Name='Tool Design');



SELECT * FROM Person.Address
WHERE (City = 'Memphis' AND AddressID = 29) OR City = 'Portland'; -- 96 SATIR


SELECT * FROM Person.Address
WHERE City = 'Portland'; --95 SATIR

SELECT * FROM Person.Address
WHERE (City = 'Memphis' AND AddressID = 29) -- 1 SATIR



SELECT * FROM Person.Address
WHERE (City = 'Memphis' OR City = 'Portland') AND AddressLine2 IS NOT NULL; -- 2 SATIR


SELECT * FROM Person.Address
WHERE City = 'Memphis'

SELECT * FROM Person.Address
WHERE AddressLine2 IS NOT NULL -- 362 SATIR


SELECT * FROM A




(SELECT AddressID,City,StateProvinceID FROM Person.Address) A





SELECT * FROM 
(SELECT * FROM Person.Address
WHERE AddressLine2 IS NOT NULL)A
WHERE City = 'Memphis' OR City = 'Portland'-- 2 Sat�r



SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'S' AND Gender = 'M' OR Gender = 'F' --193 SATIR


SELECT * FROM HumanResources.Employee
WHERE MaritalStatus = 'S' AND Gender = 'M';--109 SATIR

SELECT * FROM HumanResources.Employee
WHERE Gender = 'F' --84 SATIR




SELECT * FROM HumanResources.Employee
WHERE (JobTitle ='Research and Development Manager')
OR (JobTitle ='Design Engineer' AND MaritalStatus= 'M' AND Gender = 'F')
OR (JobTitle ='Tool Designer' AND MaritalStatus= 'S' AND Gender = 'M')

-- ### AND OR B�RL�KTE KULLANIM B�T�� ###















-- ### IN BA�LANGI� ###

--SYNTAX :
SELECT Kolon FROM Tablo Ad�
WHERE SELECT Kolon_ad� IN (De�er1, De�er2, ...);
--VEYA
SELECT Kolon
FROM Tablo Ad�
WHERE Kolon_ad� IN (SELECT STATEMENT);



--2 : �rnekler:

SELECT * FROM HumanResources.Employee
WHERE JobTitle = ('Research and Development Engineer') 
OR JobTitle = ('Marketing Assistant') OR JobTitle = ('Marketing Manager')  -- 6 SATIR


SELECT * FROM HumanResources.Employee
where JobTitle IN ('Research and Development Engineer','Marketing Assistant','Marketing Manager');-- 6 SATIR


SELECT * FROM Person.CountryRegion
WHERE Name IN ('Angola','Albania','Australia')--3 SATIR

SELECT * FROM Person.CountryRegion
WHERE Name = 'Angola' OR Name = 'Albania'OR Name ='Australia'



SELECT * FROM Person.Address
WHERE StateProvinceID IN
(
select StateProvinceID from Person.StateProvince
WHERE Name In ('California','Hawaii')) --4564 SATIR


SELECT * FROM Person.Address
WHERE StateProvinceID IN (9,21)--4564 SATIR

SELECT * FROM Person.Address
WHERE StateProvinceID = 9 OR StateProvinceID = 21 --4564 SATIR

-- ### IN B�T�� ###









-- ### NOT IN BA�LANGI� ###

--SYNTAX :
SELECT Kolon FROM Tablo Ad�
WHERE SELECT Kolon_ad� NOT IN (De�er1, De�er2, ...);
--VEYA
SELECT Kolon
FROM Tablo Ad�
WHERE Kolon_ad� NOT IN (SELECT STATEMENT);

-- �RNEKLER:
SELECT * FROM Production.Product
WHERE SafetyStockLevel NOT IN (1000,800,500)



SELECT * FROM Production.Product
WHERE SafetyStockLevel NOT IN (1000,800,500)

SELECT * FROM Production.ProductSubcategory
WHERE Name NOT IN ('Mountain Bikes','Road Bikes','Touring Bikes','Handlebars','Handlebars')


SELECT PostalCode FROM Person.Address
WHERE StateProvinceID NOT IN

(
SELECT StateProvinceID FROM PERSON.StateProvince
WHERE Name IN ('Alaska','Iowa')
)--19.614 SATIR D�ND�

--VEYA

SELECT PostalCode FROM Person.Address
WHERE StateProvinceID NOT IN (2,22)--19.614 SATIR D�ND�.


-- ### NOT IN B�T�� ###







-- ### LIKE BA�LANGI� ###

--SYNTAX :
SELECT Kolon1, Kolon2, ...
FROM Tablo Ad�
WHERE Kolon LIKE pattern;

-- 2 Patternler:

--(%) 0 karakter,1 karakter veya sonzuz karakter anlam�na gelir.
--(_) ise tek bir karakteri temsil eder.



/*


WHERE CustomerName LIKE 'a%'		�lgili kolondaki "a" ile ba�layan t�m sat�rlar� getirir.
WHERE CustomerName LIKE '%a'		�lgili kolondaki "a" ile biten t�m sat�rlar� getirir.
WHERE CustomerName LIKE '%or%'		�lgili kolonda i�inde "or" olan t�m sat�rlar� getirir.
WHERE CustomerName LIKE '_r%'		�lgili kolondaki 2.karakteri "r" olan t�m sat�rlar� getirir.
WHERE CustomerName LIKE 'a_%'		�lgili kolondaki 1.karakteri "a" olan ve en az 2 karakterli t�m sat�rlar� getirir.
WHERE CustomerName LIKE 'a__%'		�lgili kolondaki 1.karakteri "a" olan ve en az 3 karakterli t�m sat�rlar� getirir.
WHERE ContactName LIKE 'a%o'		�lgili kolondaki "a" ile ba�layan ve o ile biten t�m sat�rlar� getirir.
WHERE ContactName LIKE 'a%o'		�lgili kolondaki "a" ile ba�layan ve o ile biten t�m sat�rlar� getirir.
WHERE ContactName LIKE '[YZ]%'		�lgili kolonda �lk harfi Y veya Z ile ba�layan t�m sat�rlar� getirir.
WHERE ContactName LIKE '[YZ]%'		�lgili kolonda �lk harfi Y veya Z ile ba�layan t�m sat�rlar� getirir.
WHERE ContactName LIKE '[A-C]%'		�lgili kolonda �lk harfi  A ile C aras�dan olan t�m harfler ile ba�layan t�m sat�rlar� getirir.
WHERE ContactName LIKE '[^A-C]%'	�lgili kolonda �lk harfi  A ile C ile ba�lamayan t�m sat�rlar� getirir.



*/




-- 3 �rnekler:



SELECT * FROM Person.Person
WHERE FirstName LIKE 'Ke%'



SELECT * FROM Person.Person
WHERE FirstName LIKE '%Ke'



SELECT * FROM Person.Person
WHERE FirstName LIKE '%Ken%'


SELECT * FROM Person.Person
WHERE FirstName LIKE '_e%'




SELECT * FROM Person.Person
WHERE FirstName LIKE 'Ke_in'


SELECT * FROM Person.Person
WHERE FirstName LIKE 'K__n'

SELECT * FROM Person.Person
WHERE FirstName LIKE 'K%m'

SELECT * FROM Person.Person
WHERE FirstName LIKE '__'


-- ### LIKE B�T�� ###




-- ### NOT LIKE BA�LANGI� ### 

--�RNEK:
SELECT * FROM Person.Person
WHERE FirstName NOT LIKE 'A%'
ORDER BY FirstName;

-- ### NOT LIKE B�T�� ### 





-- ### BETWEEN BA�LANGI� ###

-- SYNTAX:
SELECT Kolonlar(s)
FROM Tablo Ad�
WHERE Kolon Ad� BETWEEN De�er1 AND De�er2;

--The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

--The BETWEEN operator is inclusive: begin and end values are included. 


--2 �RNEKLER :

SELECT * FROM Person.Person
WHERE BusinessEntityID >=1 AND BusinessEntityID <=4;

SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 1 AND 4;


SELECT YEAR(ModifiedDate),ModifiedDate FROM Person.Person
WHERE YEAR(ModifiedDate) >=2013 and YEAR(ModifiedDate) <= 2014


SELECT ModifiedDate,YEAR(ModifiedDate) FROM Person.Person
WHERE YEAR(ModifiedDate) BETWEEN 2013 AND 2014;



SELECT 
BusinessEntityID,
SalesLastYear,
FORMAT(SalesLastYear,'###,###,###.##'),
FORMAT(SalesLastYear,'##,#','en'),
FORMAT(SalesLastYear,'##,#','tr'),
FORMAT(SalesLastYear,'##,#','us'),
FORMAT(SalesLastYear,'##,#','fr'),
ModifiedDate,
FORMAT(ModifiedDate,'d','tr'),
FORMAT(ModifiedDate,'D','tr'),
FORMAT(ModifiedDate,'MMM dd yyyy'),
FORMAT(ModifiedDate,'dd MMM yyyy'),
FORMAT(ModifiedDate,'dd/MMM/yyyy'),
FORMAT(ModifiedDate,'dd.MMM.yyyy') AS SonTarih
FROM Sales.SalesPerson
WHERE YEAR(ModifiedDate) BETWEEN 2000 AND 2014;


SELECT ModifiedDate,YEAR(ModifiedDate) FROM Person.Person
WHERE ModifiedDate BETWEEN ('2009-01-01') AND ('2009-01-31');

SELECT * FROM Person.Person
ORDER BY FirstName

SELECT * FROM Person.Person
where BusinessEntityID BETWEEN '1' and '2'

SELECT * FROM Person.Person
where BusinessEntityID BETWEEN 1 and 30 AND FirstName NOT LIKE '%Ken%';

SELECT * FROM Person.Person
where FirstName BETWEEN 'A.' AND 'Abigail';



-- ### BETWEEN B�T�� ###




-- ### NOT BETWEEN BA�LANGI� ###


--SYNTAX
SELECT Kolonlar(s)
FROM Tablo Ad�
WHERE Kolon Ad� NOT BETWEEN De�er1 AND De�er2;

-- �RNEKLER :

SELECT * FROM Person.Person
WHERE BusinessEntityID >=1 AND BusinessEntityID <=4;

SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 1 AND 4; -- 4 sat�r d�nd�.


SELECT * FROM Person.Person
WHERE BusinessEntityID NOT BETWEEN 1 AND 4;--19.968 SATIR

SELECT * FROM Person.Person
WHERE BusinessEntityID > 4;--19.968 SATIR



SELECT * FROM Person.Person
WHERE BusinessEntityID NOT BETWEEN 5 AND 10;--19.966 SATIR


SELECT * FROM Person.Person
WHERE BusinessEntityID < 5 OR BusinessEntityID > 10;--19.966 SATIR

-- ### NOT BETWEEN B�T�� ###







-- ### IS NULL BA�LANGI� ###

--SYNTAX :
SELECT Kolon1,Kolon2,...,Kolon_n FROM Tablo Ad�
WHERE Kolon Ad� IS NULL;

-- NULL DEMEK : 0 da de�il,bo�lukta de�il.Hi�bir de�er yok.
-- Null de�erleri kar��la�t�rma operat�rleriyle bulmam�z m�mk�n de�il.(=)
-- IS NULL VE IS NOT NULL'u kullanmam�z gerekiyor.


--2 �RNEK :

SELECT * FROM Person.Person
WHERE Title IS NULL;

SELECT * FROM Person.Person
WHERE MiddleName IS NULL;

-- ### IS NULL B�T�� ###





-- ### IS NOT NULL BA�LANGI� ###

--SYNTAX :

SELECT Kolon1,Kolon2,...,Kolon_n FROM Tablo Ad�
WHERE Kolon Ad� IS NOT NULL;


--�RNEK :
SELECT * FROM Person.Person
WHERE Title IS NOT NULL;--1009 SATIR

SELECT * FROM Person.Person
WHERE Title IS NULL; --18.963 SATIR

SELECT * FROM Person.Person -- 19.972 Sat�r d�ner.

SELECT 1009+18963 -- 19.972 SATIR D�ner.


SELECT COUNT(Title)FROM Person.Person -- 1009 SATIR -- NULL OLMAYANLARI D�NER.

SELECT COUNT(*) FROM Person.Person -- 18.963 Sat�r D�ner.
WHERE Title IS  NULL;


SELECT COUNT(*)FROM Person.Person -- 19.972 SATIR -- NULL + NULL OLMAYAN DE�ERLER�N HEPS�N� D�NER.

SELECT 1009 + 18963; -- 19972

-- ### IS NOT NULL B�T�� ###