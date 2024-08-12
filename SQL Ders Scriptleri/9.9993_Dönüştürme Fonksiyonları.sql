--- ### DÖNÜÞTÜRME FONKSYÝONLARI BAÞLANGIÇ ### ---
--CAST
--CONVERT
--TRY CONVERT
--TRY CAST
--PARSE
--TRY PARSE

--AÞAÐIDAKÝLERDE KONTROL AMAÇLI
--ISNUMERIC
--ISDATE


--- ### DÖNÜÞTÜRME FONKSYÝONLARI BÝTÝÞ ### ---


--- ### CAST VE COVERT BAÞLANGIÇ ### ---

--SYNTAX :CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  
--SYNTAX :CAST ( expression AS data_type [ ( length ) ] )  

--Deðeri istediðimiz bir veri tipine çeviririz.
--CAST formatlamaya imkan vermezken CONVERT'te tarihleri formatlayabiliriz.
--CONVERT'TE Tarih formatýný deðiþtirmek için ilk önce metine çevirme iþlemi yapýlmasý gerekir.
--Eðer dönüþtürme baþarýz olursa hata alýrýz,hata alýnmazsa bize zaten veriyi verir.
--Siz iki ayrý veritipini birleþtirmeye çalýþýyorsanýz,SQL bunu iþlem sýrasýnda dönüþtürmeye çalýþýr.
--Buna Ýmplicit Conversion denir.
--Explicit conversion da ise açýkca dönüþümün belirtilmesi gerekmektedir.
--Bunuda cast ve convert ile yaparýz.


--Bu fonksiyonlar bazý veri tiplerini dönüþtürürken round eder bazýlarýný ise truncate eder.

--FROM DATA TYPE      TO DATA		TYPE
  -------------		------------ -----------
-- NUMERIC           NUMERIC		ROUND
-- NUMERIC           INT			RUNCATE
-- NUMERIC           MONEY			ROUND
-- MONEY			 INT			ROUND
-- MONEY             NUMERIC		ROUND
-- FLOAT             INT			TRUNCATE
-- FLOAT             NUMERIC		ROUND



--ÖRNEKLER:

SELECT
BusinessEntityID,
QuotaDate,
CAST(QuotaDate AS CHAR)AS CAST,
CONVERT(CHAR,QuotaDate)AS [CONVERT]
FROM [Sales].[SalesPersonQuotaHistory]


--Convertte style da verebiliyoruz.Cast'ta böyle bir özellik bulunmamaktadýr.
--Tarih veri tipi kullanýrken convert bu anlamda avantajlýdýr.
--Bunun haricinde cast ile de tüm iþlemlerimizi yapabiliriz.


--ÖRNEK
SELECT
BusinessEntityID,
QuotaDate,
CONVERT(CHAR,QuotaDate,0)AS [CONVERT],
CONVERT(CHAR,QuotaDate,1)AS [CONVERT],
CONVERT(CHAR,QuotaDate,4)AS [CONVERT],--yy verir.
CONVERT(CHAR,QuotaDate,104)AS [CONVERT],-- yyyy verir.
CONVERT(CHAR,QuotaDate,5)AS [CONVERT],--yy verir.
CONVERT(CHAR,QuotaDate,105)AS [CONVERT]-- yyyy verir.
FROM [Sales].[SalesPersonQuotaHistory]




--ÖRNEK
SELECT CAST(GETDATE() AS DATE)
SELECT CONVERT(DATE,GETDATE())
SELECT CONVERT(VARCHAR,GETDATE(),101)
SELECT CONVERT(VARCHAR,GETDATE(),104)
SELECT CONVERT(VARCHAR,GETDATE(),0)


--ÖRNEK
--Biz burada, BusinessEntityID ile FirstName kolonlarýný birleþtirmek istiyoruz.
--

SELECT * FROM Person.Person

--Aþaðýdaki bize hata verir.
--Örneðin, syed ismi, ile rakamý toplamaya çalýþýyor.
SELECT
BusinessEntityID,
FirstName,
BusinessEntityID + FirstName
FROM Person.Person--hata verdi



--BusinessEntityID kolonunu metne çevirelim. O zaman metin birleþtirme iþlemini yapabiliriz.
SELECT
BusinessEntityID,
FirstName,
CAST(BusinessEntityID AS Nvarchar)+ FirstName
FROM Person.Person

-- Hatta araya boþlukta koyabiliriz.
SELECT
BusinessEntityID,
FirstName,
cast(BusinessEntityID as Nvarchar) + ' ' + FirstName
FROM Person.Person




--ÖRNEKLER:
--Aþaðýdada 1 ile Onur'U TOPLAMAYA çalýþýyor.

SELECT 1 + 'Onur'--HATA VERDÝ

--Sayýsý metne çevirirsek, metin ile metin birleþtirme iþlemini yapabiliriz.
SELECT CAST(1 AS VARCHAR) + 'Onur'


--ÖRNEKLER:
SELECT 1 + '1'--HATA VERMEDÝ,BUNU ÝÞLEMÝ YAPARKEN DÖNÜÞTÜRDÜ.Karakter 1'i sayýya dönüþtürdü.--IMPLICIT CONVERSION
--Aynýsýný aþaðýdaki þekilde de yapabiliriz.
SELECT 1 + CAST('1' AS INT) -- 2 --EXPLICIT CONVERSION



--ÖRNEKLER:
--decýmal (5,2)>>> Buradaki 5 demek : Hem tam hem de ondalýklý kýsýmdaki toplam olabilecek maximum sayý.
--Yani toplamda 5 sayýo olsun ama bunun 2 tanesi ondalýklý olsun.
--Örneðin 555.11 gibi.
--Örneðin biz, 555.599 dersek, bu sefer, 555.60 olarak yuvarlayacak ve gene decýmal (5,2) kuralýna uymuþ olacaktýk.

SELECT CAST(25.6234 AS INT)--25
SELECT CAST(25.6234 AS FLOAT)--25.6234
SELECT CAST(25.6234 AS DECIMAL(10,2))
SELECT CAST(25.6234 AS DECIMAL(10,1))
SELECT CAST(25.6234 AS DECIMAL(10,3))
SELECT CAST(25.6234 AS DECIMAL(10,4))
SELECT CAST(25.6234 AS varchar)
SELECT CAST(9.95 AS DEC(2,0))


SELECT 25.6234 + 'Onur'--HATA VERDÝ
SELECT CAST(25.6234 AS VARCHAR)--ARTIK STRING
SELECT CAST(25.6234 AS VARCHAR) + 'Onur'--STRING ile birleþtirdi -- 25.6234Onur



--ÖRNEKLER:
SELECT CAST('2022-08-25' AS datetime)--2022-08-25 00:00:00.000
--ÖRNEKLER:
SELECT CAST('2018' AS DATE)--2018-01-01


--ÖRNEKLER:
-- FROM DATA TYPE    TO DATA TYPE
  -------------		------------
-- NUMERIC           NUMERIC	ROUND
-- NUMERIC           INT		TRUNCATE
-- NUMERIC           MONEY		ROUND
-- MONEY			 INT		ROUND
-- MONEY             NUMERIC	ROUND
-- FLOAT             INT		TRUNCATE
-- FLOAT             NUMERIC	ROUND


SELECT CONVERT(int,14.75)--truncate
SELECT CONVERT(float,14.75)--truncate olmadý


--örnek
select convert(varchar,15.6)
select convert(varchar,15.6) + 'Onur'

--- ### CAST CONVERT BÝTÝÞ ### ---


--- ### TRY CONVERT - TRY CAST BAÞLANGIÇ ### ---

--SYNTAX :TRY_CAST ( expression AS data_type [ ( length ) ] ) 
--SYNTAX :TRY_CONVERT ( data_type [ ( length ) ], expression [, style ] )  
--Ýkisininde CAST & CONVERT'E tek farký hata yerine NULL geri dönmesidir.


--ÖRNEKLER:
SELECT CONVERT(INT,'ABC') --HATA

SELECT TRY_CONVERT(INT,'ABC')--NULL

SELECT TRY_CONVERT(INT,'99')--99




--ÖRNEK: CASE WHEN ÝLE
SELECT
	CASE
		WHEN TRY_CONVERT(INT,'ABC') IS NULL THEN 'Ýþlem Baþarýsýz'
		else 'Ýþlem Baþarýlý'
	end as Result



--ÖRNEK: ýýf  ÝLE
SELECT IIF(TRY_CONVERT(INT,'ABC') IS NULL,'Ýþlem Baþarýsýz','Ýþlem Baþarýlý')



--ÖRNEK

SELECT * FROM Ornek.dbo.SAYIMETIN

--HATA ALIRIM
SELECT
AD,
CONVERT(INT,YAS)--Çünkü yazý ile olan otuzbeþ'i sayýya çeviremiyor
FROM Ornek.dbo.SAYIMETIN


--HATA ALMAM
SELECT
AD,
TRY_CONVERT(INT,YAS)
FROM Ornek.dbo.SAYIMETIN






--- ### TRY CONVERT - TRY CAST BÝTÝÞ ### ---



--- ### PARSE - TRY PARSE BAÞLANGIÇ ### 


--PARSE SYNTAX :PARSE ( string_value AS data_type [ USING culture ] ) 
--PARSE'TA ayný iþlemleri yapar.Farký sadece string'in dönüþtürmelerini yapmasýdýr.
--String'i sadece date/time and numeric deðerlere dönüþtürür.
--Ayný zamanda culture'da alabilir.
--Özetle, PARSE fonksiyonu input olarak, SQL Server tarafýndan tarih, 
--saat veya sayýsal deðer olarak algýlanacak biçimde olan bir string deðeri alýr 
--ve belirtilen veri türünde bir deðer döndürür:
--ÖRNEKLER:

SELECT PARSE('2022/12/31' AS DATE USING 'en-EN') 
SELECT PARSE('12/31/2022' AS DATE USING 'en-EN') 
SELECT PARSE('2022-12-31 00:00:00.000' AS DATE USING 'tr-TR')
SELECT PARSE('2022-12-31 00:00:00.000' AS DATE USING 'fr-FR')
SELECT PARSE('12/16/2010' AS datetime2) AS Result; 




--TRY PARSE
--SYNRTAX :TRY_PARSE ( string_value AS data_type [ USING culture ] ) 
--Hata varsa NULL döner.
SELECT TRY_PARSE('Onur' AS datetime2 USING 'en-US') AS Result; -- NULL
SELECT TRY_PARSE('ABC' AS DEC) AS Result; -- NULL
SELECT PARSE('ABC' AS DEC) AS Result; -- HATA VERÝR.





--ÖRNEK :
SELECT * FROM Ornek.dbo.SAYIMETIN

--AÞAÐIDA HATA ALRIIM
SELECT
ID,
AD,
PARSE(YAS AS INT)
FROM Ornek.dbo.SAYIMETIN

--AÞAÐIDA TRY PARSE KULLANDIM HATA ALMADIM.
SELECT
ID,
AD,
TRY_PARSE(YAS AS INT)
FROM Ornek.dbo.SAYIMETIN

--TRYCONVERT VE TRY PARSE farký : 
--Try Parse sadece string ler için kullanýlýrken,
--TRY Convert tüm genel dönüþtürme iþlemleri için kullanýlabilir.


--- ### TRY PARSE BÝTÝÞ ### 





--- ### ISNUMERIC ###--
--SYNTAX :ISNUMERIC ( expression )  
--Girilen veri sayýysa bize 1 döner,deðilse 0 döner.
--Aslýnda yaptýðý þey þu :Bir deðerin sayýya dönüþtürülüp dönüþtürelemeyeceðini bize söyler.
--ÖRNEKR:

SELECT ISNUMERIC(12)

SELECT ISNUMERIC('12') -- BURADA STRING'I DÖNÜÞTÜRDÜ.


SELECT ISNUMERIC('Onur')--0

SELECT ISNUMERIC('2022-08-23')--0

