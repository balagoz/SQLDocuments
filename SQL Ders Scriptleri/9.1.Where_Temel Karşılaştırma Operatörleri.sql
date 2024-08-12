
/*
WHERE

KARÞILAÞTIRMA OPERATÖRLERÝ
	=	Eþittir.
	>	Büyüktür.
	>=	Büyük Eþittir.
	<	Küçüktür.
	<=	Küçük Eþittir.
	<>	Eþit Deðildir.
	!=	Eþit Deðildir.
*/

/*
--SYNTAX SIRASI :
SELECT
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
ORDER BY
*/



-- ### WHERE SYNTAX BAÞLANGIÇ ###
/*
SYNTAX : 

SELECT Kolon_1,Kolon_2...Kolon_n FROM Tablo Adý
WHERE Þart

NOT : Sadece select ifadesiyle deðil,update ve delete ifadelerinde de kullanýlýr.

*/

-- ### WHERE SYNTAX BÝTÝÞ ###


-- ### WHERE ÖRNEKLER BAÞLANGIÇ ###

	SELECT * FROM Person.Person
	WHERE FirstName = 'Ken';

	SELECT * FROM Person.Person
	WHERE Title = 'Mr.';




	--Null ifadelerin varlýðýný karþýlaþtýrma opreratörleriyle kontrol edemeyiz.
	--O yüzden kullandýðýmýz ayrý bir ifade vardýr : IS NULL

	--Aþaðýdaki yanlýþ bir kullanýmdýr :
	
	SELECT * FROM Person.Person
	WHERE Title=Null

	--Doðru Kullaným Aþaðýdaki Gibidir :
	SELECT * FROM Person.Person
	WHERE Title IS NULL -- 18.963 satýr döndü.

	SELECT * FROM Person.Person
	WHERE Title IS NOT NULL --1.009 satýr döndü.

	SELECT 18963 + 1009; -- 19.972 Satýr Döndü. Bu da zaten tablonun toplam satýr sayýsýna eþit.

	
	--NULL DEÐERLERÝ SAYMAK ÝÇÝN :
	SELECT COUNT(*) FROM Sales.SalesPerson
	WHERE TerritoryID IS NULL;

	-----------------------------------------------------

	-- ÖRNEKLER DEVAM :
	SELECT * FROM Person.Person
	WHERE BusinessEntityID = 1;


	SELECT * FROM Production.Culture
	WHERE Name = 'Arabic';

	
	SELECT * FROM Sales.SalesPerson
	WHERE SalesYTD >1000000;


	SELECT SalesYTD,FORMAT(SalesYTD,'###,###,###.##') FROM Sales.SalesPerson
	WHERE SalesYTD >4000000
	ORDER BY SalesYTD DESC



	SELECT * FROM Sales.CreditCard
	WHERE CreditCardID > 1;


	
	SELECT * FROM Sales.CreditCard
	WHERE CreditCardID <>1;



	SELECT * FROM Sales.CreditCard
	WHERE CreditCardID !=1;


	SELECT * FROM Sales.CreditCard
	WHERE ExpYear < 2006;




	SELECT * FROM Sales.CreditCard
	WHERE ExpYear <= 2006;
	



	SELECT * FROM Sales.SalesTerritory
	WHERE Name <> 'Central';


	--DÝKKAT !!!!! : GROUP Ýfadesi bir keyword olduðu için, keywrodlerin yazýlýþýnd dikkat etmememiz lazým.
	SELECT * FROM Sales.SalesTerritory
	WHERE [Group] <> 'Europe';

	SELECT * FROM Sales.SalesTerritory
	WHERE [Group] != 'Europe';



	SELECT * FROM Sales.SalesTerritory
	WHERE TerritoryID >=1;

	SELECT * FROM Sales.SalesTerritory
	WHERE TerritoryID >=2;

	SELECT * FROM Sales.SalesTerritory
	WHERE TerritoryID <4;

	SELECT * FROM Sales.SalesTerritory
	WHERE TerritoryID <=4;

-- ### WHERE ÖRNEKLER BÝTÝÞ ###