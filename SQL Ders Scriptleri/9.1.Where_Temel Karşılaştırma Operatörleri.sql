
/*
WHERE

KAR�ILA�TIRMA OPERAT�RLER�
	=	E�ittir.
	>	B�y�kt�r.
	>=	B�y�k E�ittir.
	<	K���kt�r.
	<=	K���k E�ittir.
	<>	E�it De�ildir.
	!=	E�it De�ildir.
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



-- ### WHERE SYNTAX BA�LANGI� ###
/*
SYNTAX : 

SELECT Kolon_1,Kolon_2...Kolon_n FROM Tablo Ad�
WHERE �art

NOT : Sadece select ifadesiyle de�il,update ve delete ifadelerinde de kullan�l�r.

*/

-- ### WHERE SYNTAX B�T�� ###


-- ### WHERE �RNEKLER BA�LANGI� ###

	SELECT * FROM Person.Person
	WHERE FirstName = 'Ken';

	SELECT * FROM Person.Person
	WHERE Title = 'Mr.';




	--Null ifadelerin varl���n� kar��la�t�rma oprerat�rleriyle kontrol edemeyiz.
	--O y�zden kulland���m�z ayr� bir ifade vard�r : IS NULL

	--A�a��daki yanl�� bir kullan�md�r :
	
	SELECT * FROM Person.Person
	WHERE Title=Null

	--Do�ru Kullan�m A�a��daki Gibidir :
	SELECT * FROM Person.Person
	WHERE Title IS NULL -- 18.963 sat�r d�nd�.

	SELECT * FROM Person.Person
	WHERE Title IS NOT NULL --1.009 sat�r d�nd�.

	SELECT 18963 + 1009; -- 19.972 Sat�r D�nd�. Bu da zaten tablonun toplam sat�r say�s�na e�it.

	
	--NULL DE�ERLER� SAYMAK ���N :
	SELECT COUNT(*) FROM Sales.SalesPerson
	WHERE TerritoryID IS NULL;

	-----------------------------------------------------

	-- �RNEKLER DEVAM :
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


	--D�KKAT !!!!! : GROUP �fadesi bir keyword oldu�u i�in, keywrodlerin yaz�l���nd dikkat etmememiz laz�m.
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

-- ### WHERE �RNEKLER B�T�� ###