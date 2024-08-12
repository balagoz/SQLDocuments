--- ### ISNULL - COALESCE - NULL IF - CASE ile Null De�erler ### ---



--- ### IS NULL BA�LANGI� ### ---


--SYNTAX : ISNULL(�fade,De�er)
--�fade: Null de�erin test edildi�i yerdir.
--E�er ifade null ise,belirtti�imiz de�eri d�ner,null de�il ise ifadeyi d�ner.
--Sonu� setinde null de�er g�rmek istemezsek kullan�r�z.
--�rnek :
SELECT ISNULL(NULL,'Sakarya');--Sakarya D�ner.
SELECT ISNULL('Sakarya','Onur');--Sakarya D�ner.
SELECT ISNULL(NULL,100);--100 D�ner.
SELECT ISNULL(NULL,'2022-01-01'); --2022-01-01 D�ner.


--�RNEK :
select Title,FirstName,LastName from Person.Person
select ISNULL(Title,'�nvanYok') AS �nvan,FirstName,LastName from Person.Person



--�rnek :
SELECT FirstName,MiddleName,LastName FROM Person.Person
SELECT FirstName,ISNULL(MiddleName,'Orta �sim Yok'),LastName FROM Person.Person


--�RNEK :
SELECT * FROM Ornek.dbo.MINAGE

SELECT ISNULL(MinYas,0),ISNULL(MaxYas,99) FROM Ornek.dbo.MINAGE




--�RNEK :
SELECT * FROM Ornek.dbo.Ofis
--SELF - left jo�n yap�yoruz


SELECT 
A.Cal�sanAd�,
ISNULL(B.Cal�sanAd�,'Muduru Yok')
FROM 
Ornek.dbo.Ofis A
LEFT JOIN
Ornek.dbo.Ofis B
ON A.Mudur = B.Cal�sanID





--- ### IS NULL B�T�� ### ---





--- ### NULLIF BA�LANGI� ### ---

--Fonksyionun i�inde belritilen 2 ifade de e�itse null de�eri d�ner.
--E�itlik yoksa ilk ifadeyi d�ner.

--�rnek :

SELECT NULLIF(12,12); -- NULL D�ND�.
SELECT NULLIF('Onur','Sakarya'); -- Onur D�ND�.
SELECT NULLIF('2022-01-01','2022-01-01'); -- NULL D�ND�.
SELECT NULLIF(12,23); --12 d�ner.
SELECT NULLIF('2022-01-01','2022-12-01'); --'2022-01-01' d�ner.




--NULLIF'� case when ile yazal�m.
SELECT
NULLIF(12,13) AS 'NULLIF �E G�STER�M',
	CASE
		WHEN 12 = 13 THEN NULL
		ELSE 12 
	END AS 'CASE WHEN �E G�STER�M'




--De�i�ken Tan�mlatyarak :
DECLARE @A INT
DECLARE @B INT
SET @A = 20
SET @B = 20

SELECT NULLIF(@A,@B) AS Sonuc;



--De�i�ken Tan�mlatyarak Case When �le :

DECLARE @A INT
DECLARE @B INT
SET @A = 20
SET @B = 30

SELECT
 NULLIF(@A,@B) AS [NULLIF �LE G�STER�M],
 CASE
	WHEN @A=@B THEN NULL 
	ELSE @A END AS 'Case When �le G�sterim'



--- ### NULLIF B�T�� ### ---









--- ### CASE WHEN BA�LANGI� ### ---
--NULL de�erleri yok etmek i�inde kullan�labilir.




--CASE WHEN D��ER �RNEK :

SELECT
MinYas,
CASE 
	WHEN MinYas IS NULL THEN 0
	ELSE MinYas
END AS CASE_WHEN_MIN_YAS,
MaxYas,
CASE 
	WHEN MaxYas IS NULL THEN 100
	ELSE MaxYas
END AS CASE_WHEN_MAX_YAS

FROM Ornek.dbo.MINAGE




--SADECE ISNULL KULLANARAK YAPILI� :

SELECT 
A.Cal�sanAd�,
ISNULL(B.Cal�sanAd�,'Muduru Yok') AS Mudur
FROM 
Ornek.dbo.Ofis A
LEFT JOIN
Ornek.dbo.Ofis B
ON A.Mudur = B.Cal�sanID


--CASE WHEN �LE G�STER�M :

SELECT 
A.Cal�sanAd�,
CASE 
	WHEN (B.Cal�sanAd�) IS NULL then 'Muduru Yok'
	ELSE (B.Cal�sanAd�)
	END AS 'Mudur -Case When �le G�sterim'
FROM 
Ornek.dbo.Ofis A
LEFT JOIN
Ornek.dbo.Ofis B
ON A.Mudur = B.Cal�sanID



--- ### CASE WHEN B�T�� ### ---







--- ### COALESCE BA�LANGI� ### ---

--Fonksiyon i�inde belirtilen listede ilk null olmayan de�eri d�ner.
--Listeyi soldan sa�a do�ru okuyaca��z.
--Listede non null value bulana kadar aramas�n� s�rd�r�r.
-- syntax : coalesce (De�er1,De�er2,De�er3,...De�er_n);

--�RNEK :

SELECT COALESCE(NULL,NULL,NULL,NULL,'Onur','Kemal',NULL) -- Onur D�ner.
SELECT COALESCE(NULL,1,NULL,NULL,'Onur','Kemal',NULL) -- 1 D�ner.
SELECT COALESCE(120,NULL,NULL,NULL,'Onur','Kemal',NULL) -- 120 D�ner.
SELECT COALESCE(NULL,0) -- 0 D�ner.

--�RNEK :

SELECT * FROM Ornek.dbo.Ofis

SELECT
Cal�sanID,
Cal�sanAd�,
COALESCE(Mudur,0)
FROM Ornek.dbo.Ofis



-- COALESCE'de 2 parametre varsa,ISNULL gibi �al���r.
--ISNULL'dan fark� 2'den fazla parametre almas�d�r.
SELECT ISNULL(NULL,'�stanbul');--�stanbul D�ner.
SELECT COALESCE(NULL,'�stanbul');--�stanbul D�ner
SELECT ISNULL('�stanbul','Onur');--�stanbul D�ner.
SELECT COALESCE('�stanbul','Onur');--�stanbul D�ner.
SELECT ISNULL(NULL,'2022-01-01'); --2022-01-01 D�ner.
SELECT COALESCE(NULL,'2022-01-01'); --2022-01-01 D�ner.




-- A�IKLAYICI �RNEK :
SELECT Title,FirstName,MiddleName,LastName FROM Person.Person

SELECT 
Title,
FirstName,
MiddleName,
LastName,
COALESCE(Title,FirstName) COALESCE1,
COALESCE(Title,MiddleName,FirstName)COALESCE2
FROM Person.Person




--�RNEK :
SELECT 
Title,
COALESCE(Title,'Title Belirtilmemi�')
FROM Person.Person



--�RNEK :

SELECT
Ad,
GobekAd�,
Soyad�,
COALESCE(Ad,GobekAd�,Soyad�) AS Nihai_�sim
FROM Ornek.dbo.�sim







--Yukar�daki �rne�i Case ile de yazabiliriz:


SELECT
Ad,
GobekAd�,
Soyad�,
COALESCE(Ad,GobekAd�,Soyad�) AS Nihai_�sim,
CASE
	WHEN Ad IS NOT NULL THEN Ad
	WHEN GobekAd� IS NOT NULL THEN GobekAd�
	WHEN Soyad� IS NOT NULL THEN Soyad�
END AS "CASE WHEN �LE ��Z�M"

FROM Ornek.dbo.�sim



--- ### COALESCE B�T�� ### ---
