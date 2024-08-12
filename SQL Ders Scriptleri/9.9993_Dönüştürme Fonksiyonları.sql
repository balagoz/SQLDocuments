--- ### D�N��T�RME FONKSY�ONLARI BA�LANGI� ### ---
--CAST
--CONVERT
--TRY CONVERT
--TRY CAST
--PARSE
--TRY PARSE

--A�A�IDAK�LERDE KONTROL AMA�LI
--ISNUMERIC
--ISDATE


--- ### D�N��T�RME FONKSY�ONLARI B�T�� ### ---


--- ### CAST VE COVERT BA�LANGI� ### ---

--SYNTAX :CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  
--SYNTAX :CAST ( expression AS data_type [ ( length ) ] )  

--De�eri istedi�imiz bir veri tipine �eviririz.
--CAST formatlamaya imkan vermezken CONVERT'te tarihleri formatlayabiliriz.
--CONVERT'TE Tarih format�n� de�i�tirmek i�in ilk �nce metine �evirme i�lemi yap�lmas� gerekir.
--E�er d�n��t�rme ba�ar�z olursa hata al�r�z,hata al�nmazsa bize zaten veriyi verir.
--Siz iki ayr� veritipini birle�tirmeye �al���yorsan�z,SQL bunu i�lem s�ras�nda d�n��t�rmeye �al���r.
--Buna �mplicit Conversion denir.
--Explicit conversion da ise a��kca d�n���m�n belirtilmesi gerekmektedir.
--Bunuda cast ve convert ile yapar�z.


--Bu fonksiyonlar baz� veri tiplerini d�n��t�r�rken round eder baz�lar�n� ise truncate eder.

--FROM DATA TYPE      TO DATA		TYPE
  -------------		------------ -----------
-- NUMERIC           NUMERIC		ROUND
-- NUMERIC           INT			RUNCATE
-- NUMERIC           MONEY			ROUND
-- MONEY			 INT			ROUND
-- MONEY             NUMERIC		ROUND
-- FLOAT             INT			TRUNCATE
-- FLOAT             NUMERIC		ROUND



--�RNEKLER:

SELECT
BusinessEntityID,
QuotaDate,
CAST(QuotaDate AS CHAR)AS CAST,
CONVERT(CHAR,QuotaDate)AS [CONVERT]
FROM [Sales].[SalesPersonQuotaHistory]


--Convertte style da verebiliyoruz.Cast'ta b�yle bir �zellik bulunmamaktad�r.
--Tarih veri tipi kullan�rken convert bu anlamda avantajl�d�r.
--Bunun haricinde cast ile de t�m i�lemlerimizi yapabiliriz.


--�RNEK
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




--�RNEK
SELECT CAST(GETDATE() AS DATE)
SELECT CONVERT(DATE,GETDATE())
SELECT CONVERT(VARCHAR,GETDATE(),101)
SELECT CONVERT(VARCHAR,GETDATE(),104)
SELECT CONVERT(VARCHAR,GETDATE(),0)


--�RNEK
--Biz burada, BusinessEntityID ile FirstName kolonlar�n� birle�tirmek istiyoruz.
--

SELECT * FROM Person.Person

--A�a��daki bize hata verir.
--�rne�in, syed ismi, ile rakam� toplamaya �al���yor.
SELECT
BusinessEntityID,
FirstName,
BusinessEntityID + FirstName
FROM Person.Person--hata verdi



--BusinessEntityID kolonunu metne �evirelim. O zaman metin birle�tirme i�lemini yapabiliriz.
SELECT
BusinessEntityID,
FirstName,
CAST(BusinessEntityID AS Nvarchar)+ FirstName
FROM Person.Person

-- Hatta araya bo�lukta koyabiliriz.
SELECT
BusinessEntityID,
FirstName,
cast(BusinessEntityID as Nvarchar) + ' ' + FirstName
FROM Person.Person




--�RNEKLER:
--A�a��dada 1 ile Onur'U TOPLAMAYA �al���yor.

SELECT 1 + 'Onur'--HATA VERD�

--Say�s� metne �evirirsek, metin ile metin birle�tirme i�lemini yapabiliriz.
SELECT CAST(1 AS VARCHAR) + 'Onur'


--�RNEKLER:
SELECT 1 + '1'--HATA VERMED�,BUNU ��LEM� YAPARKEN D�N��T�RD�.Karakter 1'i say�ya d�n��t�rd�.--IMPLICIT CONVERSION
--Ayn�s�n� a�a��daki �ekilde de yapabiliriz.
SELECT 1 + CAST('1' AS INT) -- 2 --EXPLICIT CONVERSION



--�RNEKLER:
--dec�mal (5,2)>>> Buradaki 5 demek : Hem tam hem de ondal�kl� k�s�mdaki toplam olabilecek maximum say�.
--Yani toplamda 5 say�o olsun ama bunun 2 tanesi ondal�kl� olsun.
--�rne�in 555.11 gibi.
--�rne�in biz, 555.599 dersek, bu sefer, 555.60 olarak yuvarlayacak ve gene dec�mal (5,2) kural�na uymu� olacakt�k.

SELECT CAST(25.6234 AS INT)--25
SELECT CAST(25.6234 AS FLOAT)--25.6234
SELECT CAST(25.6234 AS DECIMAL(10,2))
SELECT CAST(25.6234 AS DECIMAL(10,1))
SELECT CAST(25.6234 AS DECIMAL(10,3))
SELECT CAST(25.6234 AS DECIMAL(10,4))
SELECT CAST(25.6234 AS varchar)
SELECT CAST(9.95 AS DEC(2,0))


SELECT 25.6234 + 'Onur'--HATA VERD�
SELECT CAST(25.6234 AS VARCHAR)--ARTIK STRING
SELECT CAST(25.6234 AS VARCHAR) + 'Onur'--STRING ile birle�tirdi -- 25.6234Onur



--�RNEKLER:
SELECT CAST('2022-08-25' AS datetime)--2022-08-25 00:00:00.000
--�RNEKLER:
SELECT CAST('2018' AS DATE)--2018-01-01


--�RNEKLER:
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
SELECT CONVERT(float,14.75)--truncate olmad�


--�rnek
select convert(varchar,15.6)
select convert(varchar,15.6) + 'Onur'

--- ### CAST CONVERT B�T�� ### ---


--- ### TRY CONVERT - TRY CAST BA�LANGI� ### ---

--SYNTAX :TRY_CAST ( expression AS data_type [ ( length ) ] ) 
--SYNTAX :TRY_CONVERT ( data_type [ ( length ) ], expression [, style ] )  
--�kisininde CAST & CONVERT'E tek fark� hata yerine NULL geri d�nmesidir.


--�RNEKLER:
SELECT CONVERT(INT,'ABC') --HATA

SELECT TRY_CONVERT(INT,'ABC')--NULL

SELECT TRY_CONVERT(INT,'99')--99




--�RNEK: CASE WHEN �LE
SELECT
	CASE
		WHEN TRY_CONVERT(INT,'ABC') IS NULL THEN '��lem Ba�ar�s�z'
		else '��lem Ba�ar�l�'
	end as Result



--�RNEK: ��f  �LE
SELECT IIF(TRY_CONVERT(INT,'ABC') IS NULL,'��lem Ba�ar�s�z','��lem Ba�ar�l�')



--�RNEK

SELECT * FROM Ornek.dbo.SAYIMETIN

--HATA ALIRIM
SELECT
AD,
CONVERT(INT,YAS)--��nk� yaz� ile olan otuzbe�'i say�ya �eviremiyor
FROM Ornek.dbo.SAYIMETIN


--HATA ALMAM
SELECT
AD,
TRY_CONVERT(INT,YAS)
FROM Ornek.dbo.SAYIMETIN






--- ### TRY CONVERT - TRY CAST B�T�� ### ---



--- ### PARSE - TRY PARSE BA�LANGI� ### 


--PARSE SYNTAX :PARSE ( string_value AS data_type [ USING culture ] ) 
--PARSE'TA ayn� i�lemleri yapar.Fark� sadece string'in d�n��t�rmelerini yapmas�d�r.
--String'i sadece date/time and numeric de�erlere d�n��t�r�r.
--Ayn� zamanda culture'da alabilir.
--�zetle, PARSE fonksiyonu input olarak, SQL Server taraf�ndan tarih, 
--saat veya say�sal de�er olarak alg�lanacak bi�imde olan bir string de�eri al�r 
--ve belirtilen veri t�r�nde bir de�er d�nd�r�r:
--�RNEKLER:

SELECT PARSE('2022/12/31' AS DATE USING 'en-EN') 
SELECT PARSE('12/31/2022' AS DATE USING 'en-EN') 
SELECT PARSE('2022-12-31 00:00:00.000' AS DATE USING 'tr-TR')
SELECT PARSE('2022-12-31 00:00:00.000' AS DATE USING 'fr-FR')
SELECT PARSE('12/16/2010' AS datetime2) AS Result; 




--TRY PARSE
--SYNRTAX :TRY_PARSE ( string_value AS data_type [ USING culture ] ) 
--Hata varsa NULL d�ner.
SELECT TRY_PARSE('Onur' AS datetime2 USING 'en-US') AS Result; -- NULL
SELECT TRY_PARSE('ABC' AS DEC) AS Result; -- NULL
SELECT PARSE('ABC' AS DEC) AS Result; -- HATA VER�R.





--�RNEK :
SELECT * FROM Ornek.dbo.SAYIMETIN

--A�A�IDA HATA ALRIIM
SELECT
ID,
AD,
PARSE(YAS AS INT)
FROM Ornek.dbo.SAYIMETIN

--A�A�IDA TRY PARSE KULLANDIM HATA ALMADIM.
SELECT
ID,
AD,
TRY_PARSE(YAS AS INT)
FROM Ornek.dbo.SAYIMETIN

--TRYCONVERT VE TRY PARSE fark� : 
--Try Parse sadece string ler i�in kullan�l�rken,
--TRY Convert t�m genel d�n��t�rme i�lemleri i�in kullan�labilir.


--- ### TRY PARSE B�T�� ### 





--- ### ISNUMERIC ###--
--SYNTAX :ISNUMERIC ( expression )  
--Girilen veri say�ysa bize 1 d�ner,de�ilse 0 d�ner.
--Asl�nda yapt��� �ey �u :Bir de�erin say�ya d�n��t�r�l�p d�n��t�relemeyece�ini bize s�yler.
--�RNEKR:

SELECT ISNUMERIC(12)

SELECT ISNUMERIC('12') -- BURADA STRING'I D�N��T�RD�.


SELECT ISNUMERIC('Onur')--0

SELECT ISNUMERIC('2022-08-23')--0

