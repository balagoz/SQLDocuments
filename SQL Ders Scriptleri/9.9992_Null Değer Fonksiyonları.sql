--- ### ISNULL - COALESCE - NULL IF - CASE ile Null Deðerler ### ---



--- ### IS NULL BAÞLANGIÇ ### ---


--SYNTAX : ISNULL(Ýfade,Deðer)
--Ýfade: Null deðerin test edildiði yerdir.
--Eðer ifade null ise,belirttiðimiz deðeri döner,null deðil ise ifadeyi döner.
--Sonuç setinde null deðer görmek istemezsek kullanýrýz.
--Örnek :
SELECT ISNULL(NULL,'Sakarya');--Sakarya Döner.
SELECT ISNULL('Sakarya','Onur');--Sakarya Döner.
SELECT ISNULL(NULL,100);--100 Döner.
SELECT ISNULL(NULL,'2022-01-01'); --2022-01-01 Döner.


--ÖRNEK :
select Title,FirstName,LastName from Person.Person
select ISNULL(Title,'ÜnvanYok') AS Ünvan,FirstName,LastName from Person.Person



--Örnek :
SELECT FirstName,MiddleName,LastName FROM Person.Person
SELECT FirstName,ISNULL(MiddleName,'Orta Ýsim Yok'),LastName FROM Person.Person


--ÖRNEK :
SELECT * FROM Ornek.dbo.MINAGE

SELECT ISNULL(MinYas,0),ISNULL(MaxYas,99) FROM Ornek.dbo.MINAGE




--ÖRNEK :
SELECT * FROM Ornek.dbo.Ofis
--SELF - left joýn yapýyoruz


SELECT 
A.CalýsanAdý,
ISNULL(B.CalýsanAdý,'Muduru Yok')
FROM 
Ornek.dbo.Ofis A
LEFT JOIN
Ornek.dbo.Ofis B
ON A.Mudur = B.CalýsanID





--- ### IS NULL BÝTÝÞ ### ---





--- ### NULLIF BAÞLANGIÇ ### ---

--Fonksyionun içinde belritilen 2 ifade de eþitse null deðeri döner.
--Eþitlik yoksa ilk ifadeyi döner.

--Örnek :

SELECT NULLIF(12,12); -- NULL DÖNDÜ.
SELECT NULLIF('Onur','Sakarya'); -- Onur DÖNDÜ.
SELECT NULLIF('2022-01-01','2022-01-01'); -- NULL DÖNDÜ.
SELECT NULLIF(12,23); --12 döner.
SELECT NULLIF('2022-01-01','2022-12-01'); --'2022-01-01' döner.




--NULLIF'Ý case when ile yazalým.
SELECT
NULLIF(12,13) AS 'NULLIF ÝE GÖSTERÝM',
	CASE
		WHEN 12 = 13 THEN NULL
		ELSE 12 
	END AS 'CASE WHEN ÝE GÖSTERÝM'




--Deðiþken Tanýmlatyarak :
DECLARE @A INT
DECLARE @B INT
SET @A = 20
SET @B = 20

SELECT NULLIF(@A,@B) AS Sonuc;



--Deðiþken Tanýmlatyarak Case When Ýle :

DECLARE @A INT
DECLARE @B INT
SET @A = 20
SET @B = 30

SELECT
 NULLIF(@A,@B) AS [NULLIF ÝLE GÖSTERÝM],
 CASE
	WHEN @A=@B THEN NULL 
	ELSE @A END AS 'Case When Ýle Gösterim'



--- ### NULLIF BÝTÝÞ ### ---









--- ### CASE WHEN BAÞLANGIÇ ### ---
--NULL deðerleri yok etmek içinde kullanýlabilir.




--CASE WHEN DÝÐER ÖRNEK :

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




--SADECE ISNULL KULLANARAK YAPILIÞ :

SELECT 
A.CalýsanAdý,
ISNULL(B.CalýsanAdý,'Muduru Yok') AS Mudur
FROM 
Ornek.dbo.Ofis A
LEFT JOIN
Ornek.dbo.Ofis B
ON A.Mudur = B.CalýsanID


--CASE WHEN ÝLE GÖSTERÝM :

SELECT 
A.CalýsanAdý,
CASE 
	WHEN (B.CalýsanAdý) IS NULL then 'Muduru Yok'
	ELSE (B.CalýsanAdý)
	END AS 'Mudur -Case When Ýle Gösterim'
FROM 
Ornek.dbo.Ofis A
LEFT JOIN
Ornek.dbo.Ofis B
ON A.Mudur = B.CalýsanID



--- ### CASE WHEN BÝTÝÞ ### ---







--- ### COALESCE BAÞLANGIÇ ### ---

--Fonksiyon içinde belirtilen listede ilk null olmayan deðeri döner.
--Listeyi soldan saða doðru okuyacaðýz.
--Listede non null value bulana kadar aramasýný sürdürür.
-- syntax : coalesce (Deðer1,Deðer2,Deðer3,...Deðer_n);

--ÖRNEK :

SELECT COALESCE(NULL,NULL,NULL,NULL,'Onur','Kemal',NULL) -- Onur Döner.
SELECT COALESCE(NULL,1,NULL,NULL,'Onur','Kemal',NULL) -- 1 Döner.
SELECT COALESCE(120,NULL,NULL,NULL,'Onur','Kemal',NULL) -- 120 Döner.
SELECT COALESCE(NULL,0) -- 0 Döner.

--ÖRNEK :

SELECT * FROM Ornek.dbo.Ofis

SELECT
CalýsanID,
CalýsanAdý,
COALESCE(Mudur,0)
FROM Ornek.dbo.Ofis



-- COALESCE'de 2 parametre varsa,ISNULL gibi çalýþýr.
--ISNULL'dan farký 2'den fazla parametre almasýdýr.
SELECT ISNULL(NULL,'Ýstanbul');--Ýstanbul Döner.
SELECT COALESCE(NULL,'Ýstanbul');--Ýstanbul Döner
SELECT ISNULL('Ýstanbul','Onur');--Ýstanbul Döner.
SELECT COALESCE('Ýstanbul','Onur');--Ýstanbul Döner.
SELECT ISNULL(NULL,'2022-01-01'); --2022-01-01 Döner.
SELECT COALESCE(NULL,'2022-01-01'); --2022-01-01 Döner.




-- AÇIKLAYICI ÖRNEK :
SELECT Title,FirstName,MiddleName,LastName FROM Person.Person

SELECT 
Title,
FirstName,
MiddleName,
LastName,
COALESCE(Title,FirstName) COALESCE1,
COALESCE(Title,MiddleName,FirstName)COALESCE2
FROM Person.Person




--ÖRNEK :
SELECT 
Title,
COALESCE(Title,'Title Belirtilmemiþ')
FROM Person.Person



--ÖRNEK :

SELECT
Ad,
GobekAdý,
Soyadý,
COALESCE(Ad,GobekAdý,Soyadý) AS Nihai_Ýsim
FROM Ornek.dbo.Ýsim







--Yukarýdaki örneði Case ile de yazabiliriz:


SELECT
Ad,
GobekAdý,
Soyadý,
COALESCE(Ad,GobekAdý,Soyadý) AS Nihai_Ýsim,
CASE
	WHEN Ad IS NOT NULL THEN Ad
	WHEN GobekAdý IS NOT NULL THEN GobekAdý
	WHEN Soyadý IS NOT NULL THEN Soyadý
END AS "CASE WHEN ÝLE ÇÖZÜM"

FROM Ornek.dbo.Ýsim



--- ### COALESCE BÝTÝÞ ### ---
