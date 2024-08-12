

/*
1-SELECT
2-SELECT DISTINCT
3-SELECT COUNT DISTINCT
4-ARÝTMETÝK OPERATÖRLER (+,-,*,/)
*/







-- ### SELECT * FROM Tablo Adý Baþlangýç ### -- 


--1.YOL : * ifadesi ile tüm sütun ve satýrlarý getirmek.

	SELECT * FROM Person.Person;

--2.YOL : Tüm kolonlarý tek tek yazmak.

	SELECT kolon_1,kolon_2,....kolon_n FROM Tablo Adý Bitiþ

--ÖRNEK :



	SELECT BusinessEntityID,PersonType,FirstName FROM Person.Person;
	

-- ### SELECT * FROM Tablo Adý Bitiþ.###









-- ### SELECT kolon_1,kolon_2,....kolon_n FROM Tablo Adý Baþlangýç.### --

 --Örnek :
   SELECT BusinessEntityID,PersonType,FirstName FROM Person.Person;

-- ### SELECT kolon_1,kolon_2,....kolon_n FROM Tablo Adý Bitiþ.### ---







-- ÖNEMLÝ NOT :!!!!

--Tablo Seçmeden Önce hangi database'den tablo seçeceðimize karar vermemiz lazým.
--Seçmek istediðimiz tablo mevcutta içerisinde olduðumuz yani kullandýðýmýz veri tabanýnda deðilse,
--sonuç getirmyecektir.

SELECT * FROM AdventureWorks2019.HumanResources.Department

--1.YOL :
	USE AdventureWorks2019
	GO
	SELECT * FROM HumanResources.Employee

--2.YOL : Ya da direk yukarýdaki menüden "AdventureWorks2019" veri tabanýný seçebiliriz.

-- ### Tablo Seçmeden Önce hangi database'den tablo seçeceðimizi karar vermemiz lazým Bitiþ.###

SELECT * FROM AdventureWorks2019.HumanResources.Employee


-- ### Baþka Veritabanýndan Tablo Seçme Baþlangýç ### --
--Diyelimki þu anda "master" veri tabanýndayýz ve "AdventureWorks2019" veritabanýndan bir tablo seçmek istiyoruz.

SELECT * FROM AdventureWorks2019.Person.Person

SELECT * FROM AdventureWorks2019.HumanResources.Employee

-- ### Baþka Veritabanýndan Tablo Seçme Bitiþ ### --








-- ### SELECT DISTINCT Baþlangýç ###

--Syntax :Select DISTINCT kolon1,kolon2,...kolon_n FROM Tablo Adý

SELECT StateProvinceID FROM Person.Address


SELECT DISTINCT StateProvinceID FROM Person.Address
--veya paranteze de alabiliriz aþaðýdaki gibi

SELECT DISTINCT(StateProvinceID) FROM Person.Address


--ÖRNEK :
SELECT * FROM Ornek.dbo.TABLO

SELECT DISTINCT(Sayý) FROM Ornek.dbo.TABLO

-- ### SELECT DISTINCT Bitiþ ###





-- ### --SELECT DISTINCT BÝRDEN FAZLA KOLON SEÇME BAÞLANGIÇ ### --

--Syntax :Select DISTINCT kolon1,kolon2,...kolon_n FROM Tablo Adý

-- Çoklu distinct kullanýmýnda belirtilen kolonlardaki verileri bir bütün olarak ele alýr 
--ve diðer kayýrlarda benzersiz alanlarý bulmaya çalýþýr. Yani,
--iki alan (kolon) sanki tek bir alanmþ gibi deðelendirilmektedir.


--ÖRNEK :


SELECT StateProvinceID,City FROM Person.Address
ORDER BY StateProvinceID

SELECT DISTINCT City FROM Person.Address

SELECT DISTINCT StateProvinceID,City FROM Person.Address
order by StateProvinceID

--ÖRNEK :

SELECT * FROM Ornek.dbo.KurumsalCalýsanlar

SELECT DISTINCT Ulke FROM Ornek.dbo.KurumsalCalýsanlar

SELECT DISTINCT Ulke,Cinsiyet FROM Ornek.dbo.KurumsalCalýsanlar

-- ### SELECT DISTINCT BÝRDEN FAZLA KOLON SEÇME BÝTÝÞ ###





-- ### SELECT DISTINCT VE NULL BAÞLANGIÇ ###
/*
Distinct ifadesi null deðerlerede normal bir veriymiþ gibi davranýr.
Null deðerler olan bir kolona distinct uygularsak sadece bir null býrakýr,
diðer null deðerleri siler.
*/



SELECT title FROM Person.Person

SELECT DISTINCT title FROM Person.Person

-- ### SELECT DISTINCT VE NULL BÝTÝÞ ###





-- ### COUNT (DISTINCT) BAÞLANGIÇ ###
--SYNTAX : SELECT COUNT (DISTINCT kolon) FROM Tablo Adý
--returns the number of unique, non-null values.( Null olmayan tekil deðerleri döner. )

--1.DURUM :
SELECT DISTINCT title FROM Person.Person

SELECT COUNT(DISTINCT title) FROM Person.Person


--2.DURUM :
SELECT * FROM Ornek.dbo.Tablo



SELECT COUNT(*) FROM Ornek.dbo.Tablo;--8 ADET DÖNER,NULL DAHÝL  -- 1,2,2,3,NULL,NULL,4,5

SELECT COUNT(Sayý) FROM Ornek.dbo.Tablo;--6 ADET DÖNER,NULL HARÝÇ --1,2,2,3,4,5 

SELECT COUNT(DISTINCT Sayý) FROM Ornek.dbo.Tablo;--5 ADET DÖNER,NULL DEÐERLERÝ DÝKKATE ALMADI. --1,2,3,4,5


-- ### COUNT (DISTINCT) BÝTÝÞ ###






--- ### KOLONSUZ SELECT BAÞLANGIÇ ####

SELECT 'Onur'

SELECT 2

SELECT 'Onur' AS Ýsim 

--- ### KOLONSUZ SELECT BÝTÝÞ ####



--- ### ARÝTMETÝK OPERATÖRLER (+,-,*,/) BAÞLANGIÇ ###

SELECT 2 + 2; -- 4

SELECT 2 - 3; -- -1

SELECT 2 * 3; -- 6

SELECT 4 / 2; -- 2




--ÖRNEK :SORGU ÝÇÝNDE KULLANMA :

SELECT
ProductID,
Name,
ListPrice AS "ESKÝ FÝYAT",
'Yeni Zam Oraný %10', 
0.10 AS "ZAM ORANI",
ListPrice + (ListPrice * 0.10) AS "YENÝ FÝYAT"
FROM [Production].[Product]
WHERE ListPrice <>0

--!=0 da kullanabilirdik---


--- ### ARÝTMETÝK OPERATÖRLER (+,-,*,/) BÝTÝÞ ###

