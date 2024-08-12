

/*
1-SELECT
2-SELECT DISTINCT
3-SELECT COUNT DISTINCT
4-AR�TMET�K OPERAT�RLER (+,-,*,/)
*/







-- ### SELECT * FROM Tablo Ad� Ba�lang�� ### -- 


--1.YOL : * ifadesi ile t�m s�tun ve sat�rlar� getirmek.

	SELECT * FROM Person.Person;

--2.YOL : T�m kolonlar� tek tek yazmak.

	SELECT kolon_1,kolon_2,....kolon_n FROM Tablo Ad� Biti�

--�RNEK :



	SELECT BusinessEntityID,PersonType,FirstName FROM Person.Person;
	

-- ### SELECT * FROM Tablo Ad� Biti�.###









-- ### SELECT kolon_1,kolon_2,....kolon_n FROM Tablo Ad� Ba�lang��.### --

 --�rnek :
   SELECT BusinessEntityID,PersonType,FirstName FROM Person.Person;

-- ### SELECT kolon_1,kolon_2,....kolon_n FROM Tablo Ad� Biti�.### ---







-- �NEML� NOT :!!!!

--Tablo Se�meden �nce hangi database'den tablo se�ece�imize karar vermemiz laz�m.
--Se�mek istedi�imiz tablo mevcutta i�erisinde oldu�umuz yani kulland���m�z veri taban�nda de�ilse,
--sonu� getirmyecektir.

SELECT * FROM AdventureWorks2019.HumanResources.Department

--1.YOL :
	USE AdventureWorks2019
	GO
	SELECT * FROM HumanResources.Employee

--2.YOL : Ya da direk yukar�daki men�den "AdventureWorks2019" veri taban�n� se�ebiliriz.

-- ### Tablo Se�meden �nce hangi database'den tablo se�ece�imizi karar vermemiz laz�m Biti�.###

SELECT * FROM AdventureWorks2019.HumanResources.Employee


-- ### Ba�ka Veritaban�ndan Tablo Se�me Ba�lang�� ### --
--Diyelimki �u anda "master" veri taban�nday�z ve "AdventureWorks2019" veritaban�ndan bir tablo se�mek istiyoruz.

SELECT * FROM AdventureWorks2019.Person.Person

SELECT * FROM AdventureWorks2019.HumanResources.Employee

-- ### Ba�ka Veritaban�ndan Tablo Se�me Biti� ### --








-- ### SELECT DISTINCT Ba�lang�� ###

--Syntax :Select DISTINCT kolon1,kolon2,...kolon_n FROM Tablo Ad�

SELECT StateProvinceID FROM Person.Address


SELECT DISTINCT StateProvinceID FROM Person.Address
--veya paranteze de alabiliriz a�a��daki gibi

SELECT DISTINCT(StateProvinceID) FROM Person.Address


--�RNEK :
SELECT * FROM Ornek.dbo.TABLO

SELECT DISTINCT(Say�) FROM Ornek.dbo.TABLO

-- ### SELECT DISTINCT Biti� ###





-- ### --SELECT DISTINCT B�RDEN FAZLA KOLON SE�ME BA�LANGI� ### --

--Syntax :Select DISTINCT kolon1,kolon2,...kolon_n FROM Tablo Ad�

-- �oklu distinct kullan�m�nda belirtilen kolonlardaki verileri bir b�t�n olarak ele al�r 
--ve di�er kay�rlarda benzersiz alanlar� bulmaya �al���r. Yani,
--iki alan (kolon) sanki tek bir alanm� gibi de�elendirilmektedir.


--�RNEK :


SELECT StateProvinceID,City FROM Person.Address
ORDER BY StateProvinceID

SELECT DISTINCT City FROM Person.Address

SELECT DISTINCT StateProvinceID,City FROM Person.Address
order by StateProvinceID

--�RNEK :

SELECT * FROM Ornek.dbo.KurumsalCal�sanlar

SELECT DISTINCT Ulke FROM Ornek.dbo.KurumsalCal�sanlar

SELECT DISTINCT Ulke,Cinsiyet FROM Ornek.dbo.KurumsalCal�sanlar

-- ### SELECT DISTINCT B�RDEN FAZLA KOLON SE�ME B�T�� ###





-- ### SELECT DISTINCT VE NULL BA�LANGI� ###
/*
Distinct ifadesi null de�erlerede normal bir veriymi� gibi davran�r.
Null de�erler olan bir kolona distinct uygularsak sadece bir null b�rak�r,
di�er null de�erleri siler.
*/



SELECT title FROM Person.Person

SELECT DISTINCT title FROM Person.Person

-- ### SELECT DISTINCT VE NULL B�T�� ###





-- ### COUNT (DISTINCT) BA�LANGI� ###
--SYNTAX : SELECT COUNT (DISTINCT kolon) FROM Tablo Ad�
--returns the number of unique, non-null values.( Null olmayan tekil de�erleri d�ner. )

--1.DURUM :
SELECT DISTINCT title FROM Person.Person

SELECT COUNT(DISTINCT title) FROM Person.Person


--2.DURUM :
SELECT * FROM Ornek.dbo.Tablo



SELECT COUNT(*) FROM Ornek.dbo.Tablo;--8 ADET D�NER,NULL DAH�L  -- 1,2,2,3,NULL,NULL,4,5

SELECT COUNT(Say�) FROM Ornek.dbo.Tablo;--6 ADET D�NER,NULL HAR�� --1,2,2,3,4,5 

SELECT COUNT(DISTINCT Say�) FROM Ornek.dbo.Tablo;--5 ADET D�NER,NULL DE�ERLER� D�KKATE ALMADI. --1,2,3,4,5


-- ### COUNT (DISTINCT) B�T�� ###






--- ### KOLONSUZ SELECT BA�LANGI� ####

SELECT 'Onur'

SELECT 2

SELECT 'Onur' AS �sim 

--- ### KOLONSUZ SELECT B�T�� ####



--- ### AR�TMET�K OPERAT�RLER (+,-,*,/) BA�LANGI� ###

SELECT 2 + 2; -- 4

SELECT 2 - 3; -- -1

SELECT 2 * 3; -- 6

SELECT 4 / 2; -- 2




--�RNEK :SORGU ���NDE KULLANMA :

SELECT
ProductID,
Name,
ListPrice AS "ESK� F�YAT",
'Yeni Zam Oran� %10', 
0.10 AS "ZAM ORANI",
ListPrice + (ListPrice * 0.10) AS "YEN� F�YAT"
FROM [Production].[Product]
WHERE ListPrice <>0

--!=0 da kullanabilirdik---


--- ### AR�TMET�K OPERAT�RLER (+,-,*,/) B�T�� ###

