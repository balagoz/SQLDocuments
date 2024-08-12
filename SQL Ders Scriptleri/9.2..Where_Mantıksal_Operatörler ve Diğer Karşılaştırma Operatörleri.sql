/*
MANTIKSAL OPERATÖLER 
	AND
	OR
	NOT
	AND ve OR BÝRLÝKTE KULLANIMI
DÝÐER KARÞILAÞTIRMA OPERATÖLERÝ
	IN
	NOT IN
	LIKE
	NOT LIKE
	BETWEEN
	NOT BETWEEN
	IS NULL
	IS NOT NULL
*/

-- ### AND BAÞLANGIÇ ###

--SYNTAX 
SELECT kolon_1, kolon_2, ...
FROM Tablo Adý
WHERE Þart_1 AND Þart_2 AND Þart_3 ...;

--Örnek :

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


-- ### AND BÝTÝÞ ###









-- ### NOT BAÞLANGIÇ ###
--1 : SYNTAX :
SELECT Kolon1,Kolon2,Kolon3,...Kolon_n FROM Tablo Adý
WHERE NOT Þart;



--2 : Örnek :

SELECT * FROM Person.ContactType
where NOT Name = 'Accounting Manager';

--NOT ifadesi genellikle çok kullanýlmaz. Onun yerine aþaðýdaki þekilde kullanýlý genelde;
SELECT * FROM Person.ContactType
WHERE Name != 'Accounting Manager';


--3.örnek :
SELECT * FROM Person.ContactType
where NOT Name = 'Accounting Manager' AND NOT Name = 'Assistant Sales Agent' AND NOT Name = 'Owner'

-- ### NOT BÝTÝÞ ###









-- ### OR BAÞLANGIÇ ###

--:SYNTAX :
SELECT Kolon_1, Kolon_2, ...
FROM Tablo Adý
WHERE Þart_1 OR Þart_2 OR Þart_3 ...;

--2 :Örnek:

SELECT * FROM Sales.SalesPerson
WHERE TerritoryID = 2 OR TerritoryID = 4 OR TerritoryID = 5 OR TerritoryID = 8


SELECT * FROM Sales.SalesPerson
WHERE TerritoryID =2 or TerritoryID IS NULL


--NULL DEÐERLERÝ SAYMAK ÝÇÝN :
SELECT COUNT(*) FROM Sales.SalesPerson
WHERE TerritoryID IS NULL;






SELECT * FROM Sales.SalesPerson
WHERE TerritoryID = 2 or Bonus = 0;


SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR FirstName = 'Rob';

SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR FirstName = 'Rob' OR FirstName = 'Terri' 


-- ### OR BÝTÝÞ ###






-- ### AND OR BÝRLÝKTE KULLANIM BAÞLANGIÇ ###

--NOT :And'i ilk baþta deðerlendirir.
--Aþaðýdaki örnekte, Rob ve emailpromotion =0 olacak veya FirstName Ken olacak.

SELECT * FROM Person.Person
WHERE FirstName = 'Ken' OR (FirstName = 'Rob' AND EmailPromotion = 0)
ORDER BY FirstName




--Aþaðýdaki örnekte,isim Ken veya Rob olacak. Bu þart ile EmailPromotion 0 olacak.

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
WHERE City = 'Memphis' OR City = 'Portland'-- 2 Satýr



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

-- ### AND OR BÝRLÝKTE KULLANIM BÝTÝÞ ###















-- ### IN BAÞLANGIÇ ###

--SYNTAX :
SELECT Kolon FROM Tablo Adý
WHERE SELECT Kolon_adý IN (Deðer1, Deðer2, ...);
--VEYA
SELECT Kolon
FROM Tablo Adý
WHERE Kolon_adý IN (SELECT STATEMENT);



--2 : Örnekler:

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

-- ### IN BÝTÝÞ ###









-- ### NOT IN BAÞLANGIÇ ###

--SYNTAX :
SELECT Kolon FROM Tablo Adý
WHERE SELECT Kolon_adý NOT IN (Deðer1, Deðer2, ...);
--VEYA
SELECT Kolon
FROM Tablo Adý
WHERE Kolon_adý NOT IN (SELECT STATEMENT);

-- ÖRNEKLER:
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
)--19.614 SATIR DÖNDÜ

--VEYA

SELECT PostalCode FROM Person.Address
WHERE StateProvinceID NOT IN (2,22)--19.614 SATIR DÖNDÜ.


-- ### NOT IN BÝTÝÞ ###







-- ### LIKE BAÞLANGIÇ ###

--SYNTAX :
SELECT Kolon1, Kolon2, ...
FROM Tablo Adý
WHERE Kolon LIKE pattern;

-- 2 Patternler:

--(%) 0 karakter,1 karakter veya sonzuz karakter anlamýna gelir.
--(_) ise tek bir karakteri temsil eder.



/*


WHERE CustomerName LIKE 'a%'		Ýlgili kolondaki "a" ile baþlayan tüm satýrlarý getirir.
WHERE CustomerName LIKE '%a'		Ýlgili kolondaki "a" ile biten tüm satýrlarý getirir.
WHERE CustomerName LIKE '%or%'		Ýlgili kolonda içinde "or" olan tüm satýrlarý getirir.
WHERE CustomerName LIKE '_r%'		Ýlgili kolondaki 2.karakteri "r" olan tüm satýrlarý getirir.
WHERE CustomerName LIKE 'a_%'		Ýlgili kolondaki 1.karakteri "a" olan ve en az 2 karakterli tüm satýrlarý getirir.
WHERE CustomerName LIKE 'a__%'		Ýlgili kolondaki 1.karakteri "a" olan ve en az 3 karakterli tüm satýrlarý getirir.
WHERE ContactName LIKE 'a%o'		Ýlgili kolondaki "a" ile baþlayan ve o ile biten tüm satýrlarý getirir.
WHERE ContactName LIKE 'a%o'		Ýlgili kolondaki "a" ile baþlayan ve o ile biten tüm satýrlarý getirir.
WHERE ContactName LIKE '[YZ]%'		Ýlgili kolonda Ýlk harfi Y veya Z ile baþlayan tüm satýrlarý getirir.
WHERE ContactName LIKE '[YZ]%'		Ýlgili kolonda Ýlk harfi Y veya Z ile baþlayan tüm satýrlarý getirir.
WHERE ContactName LIKE '[A-C]%'		Ýlgili kolonda Ýlk harfi  A ile C arasýdan olan tüm harfler ile baþlayan tüm satýrlarý getirir.
WHERE ContactName LIKE '[^A-C]%'	Ýlgili kolonda Ýlk harfi  A ile C ile baþlamayan tüm satýrlarý getirir.



*/




-- 3 Örnekler:



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


-- ### LIKE BÝTÝÞ ###




-- ### NOT LIKE BAÞLANGIÇ ### 

--ÖRNEK:
SELECT * FROM Person.Person
WHERE FirstName NOT LIKE 'A%'
ORDER BY FirstName;

-- ### NOT LIKE BÝTÝÞ ### 





-- ### BETWEEN BAÞLANGIÇ ###

-- SYNTAX:
SELECT Kolonlar(s)
FROM Tablo Adý
WHERE Kolon Adý BETWEEN Deðer1 AND Deðer2;

--The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

--The BETWEEN operator is inclusive: begin and end values are included. 


--2 ÖRNEKLER :

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



-- ### BETWEEN BÝTÝÞ ###




-- ### NOT BETWEEN BAÞLANGIÇ ###


--SYNTAX
SELECT Kolonlar(s)
FROM Tablo Adý
WHERE Kolon Adý NOT BETWEEN Deðer1 AND Deðer2;

-- ÖRNEKLER :

SELECT * FROM Person.Person
WHERE BusinessEntityID >=1 AND BusinessEntityID <=4;

SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 1 AND 4; -- 4 satýr döndü.


SELECT * FROM Person.Person
WHERE BusinessEntityID NOT BETWEEN 1 AND 4;--19.968 SATIR

SELECT * FROM Person.Person
WHERE BusinessEntityID > 4;--19.968 SATIR



SELECT * FROM Person.Person
WHERE BusinessEntityID NOT BETWEEN 5 AND 10;--19.966 SATIR


SELECT * FROM Person.Person
WHERE BusinessEntityID < 5 OR BusinessEntityID > 10;--19.966 SATIR

-- ### NOT BETWEEN BÝTÝÞ ###







-- ### IS NULL BAÞLANGIÇ ###

--SYNTAX :
SELECT Kolon1,Kolon2,...,Kolon_n FROM Tablo Adý
WHERE Kolon Adý IS NULL;

-- NULL DEMEK : 0 da deðil,boþlukta deðil.Hiçbir deðer yok.
-- Null deðerleri karþýlaþtýrma operatörleriyle bulmamýz mümkün deðil.(=)
-- IS NULL VE IS NOT NULL'u kullanmamýz gerekiyor.


--2 ÖRNEK :

SELECT * FROM Person.Person
WHERE Title IS NULL;

SELECT * FROM Person.Person
WHERE MiddleName IS NULL;

-- ### IS NULL BÝTÝÞ ###





-- ### IS NOT NULL BAÞLANGIÇ ###

--SYNTAX :

SELECT Kolon1,Kolon2,...,Kolon_n FROM Tablo Adý
WHERE Kolon Adý IS NOT NULL;


--ÖRNEK :
SELECT * FROM Person.Person
WHERE Title IS NOT NULL;--1009 SATIR

SELECT * FROM Person.Person
WHERE Title IS NULL; --18.963 SATIR

SELECT * FROM Person.Person -- 19.972 Satýr döner.

SELECT 1009+18963 -- 19.972 SATIR Döner.


SELECT COUNT(Title)FROM Person.Person -- 1009 SATIR -- NULL OLMAYANLARI DÖNER.

SELECT COUNT(*) FROM Person.Person -- 18.963 Satýr Döner.
WHERE Title IS  NULL;


SELECT COUNT(*)FROM Person.Person -- 19.972 SATIR -- NULL + NULL OLMAYAN DEÐERLERÝN HEPSÝNÝ DÖNER.

SELECT 1009 + 18963; -- 19972

-- ### IS NOT NULL BÝTÝÞ ###