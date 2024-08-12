--- ### CURRENT- TIMESTAMP BA�LANGI� ###---
--SYNTAX :CURRENT_TIMESTAMP 
--Anl�k tarih ve saati verir.
--Sonuna parantez koymay�z.
--GETDATE() ile ayn� sonucu bizlere verir.

SELECT CURRENT_TIMESTAMP
SELECT GETDATE()


--- ### CURRENT- TIMESTAMP B�T�� ###---


--- ### DATEADD BA�LANGI� ###---
--SYNTAX:DATEADD (datepart , number , date )  
--Girilen tarihe,tarih ve zaman eklemizi sa�lar.
--�RNEK:
SELECT DATEADD(year,1,'2021/08/25')
SELECT DATEADD(YYYY,1,'2021/08/25')
SELECT DATEADD(yy,1,'2021/08/25')
SELECT DATEADD(QUARTER,2,'2021/08/25')
SELECT DATEADD(qq,1,'2021/08/25')
SELECT DATEADD(q,1,'2021/08/25')
SELECT DATEADD(day,5,'2021/08/25')
SELECT DATEADD(hour,5,'2021/08/25')
SELECT DATEADD(minute,5,'2021/08/25')
SELECT DATEADD(MONTH,4,'2021/08/25')
SELECT DATEADD(mm,4,'2021/08/25')
SELECT DATEADD(m,4,'2021/08/25')
SELECT FORMAT( DATEADD(m,4,'2021/08/25'), 'd', 'tr-Tr' )




--- ### DATEADD BA�LANGI� ###---



--- ### DATEDIFF BA�LANGI� ###---
--SYNTAX :DATEDIFF ( datepart , startdate , enddate ) 
--�ki tarih aras�ndaki fark� istedi�imiz ay,y�l ve g�n olarak g�rmemizi sa�lar.
--�RNELK :

SELECT DATEDIFF(year,'2021/08/25','2021/08/25')
SELECT DATEDIFF(yy,'2021/08/25','2021/08/25')
SELECT DATEDIFF(y,'2021/08/25','2021/08/25')
SELECT DATEDIFF(year,'2021/08/25','2030/08/25')
SELECT DATEDIFF(year,'2021/08/25','2121/08/25')
SELECT DATEDIFF(yy,'2021/08/25','2121/08/25')
SELECT DATEDIFF(month,'2021/08/25','2021/12/25')
SELECT DATEDIFF(day,'2021/08/25','2021/12/25')
SELECT DATEDIFF(dd,'2021/08/25','2021/12/25')
SELECT DATEDIFF(d,'2021/08/25','2021/12/25')
SELECT DATEDIFF(hour,'2021/08/25 08:00','2021/08/25 10:00')



--�RNEK :De�i�ken tan�mlayarak yapal�m:
DECLARE @TAR�H1 DATE
DECLARE @TAR�H2 DATE
SET @TAR�H1 =('2022/04/25')
SET @TAR�H2 =('2022/12/25')

SELECT @TAR�H1,@TAR�H2

SELECT DATEDIFF(M,@TAR�H1,@TAR�H2)


--- ### DATEDIFF B�T�� ###---



--- ### DATEFROMPARTS BA�LANGI� ###---

--SYNTAX :DATEFROMPARTS ( year, month, day )  
--Tarih yaratmak i�in kullanabiliriz
--YEAR 4 BASAMAKLI
--MONTH 1- 12
--DAY -- 1- 31
--�RNEK:
SELECT DATEFROMPARTS(2022,12,31)
SELECT DATEFROMPARTS(2022,12,NULL)

--- ### DATEFROMPARTS B�T�� ###---




--- ### DATENAME BA�LANGI� ###---
--SYNATAX:DATENAME ( datepart , date )  
--Tarihten sadece belli bir alan� se�mek i�in kullan�l�r.
--Biraz sonra g�rece�imiz DATEPART fonk.ile benzer.
--Tek fark DATENAME string olarak d�nerken,DATEPART ise int olarak d�n�yor.
--�RNEK :

SELECT DATENAME(year,GETDATE())
SELECT DATENAME(HH,GETDATE())
SELECT DATENAME(minute,GETDATE())
SELECT DATENAME(quarter,GETDATE())


SELECT DATENAME(year,GETDATE())+ '1' --20221-- ��nk� datename karakter
-- Ama DATEPART ile yaparsak sorun olmaz.
--��nk� DATEPART,INT olarak geri d�ner.
SELECT DATEPART(year,GETDATE()) + '1' --2023


--- ### DATENAME B�T�� ###---




--- ### DATEPART BA�LANGI� ###---
--SYNTAX :DATEPART ( datepart , date ) 
--INT olarak geri d�ner.
--DATENAME ile benzer.
--�RNEK :

SELECT DATEPART(year,GETDATE())
SELECT DATEPART(YYYY,GETDATE())
SELECT DATEPART(week,GETDATE())

--�RNEK : DE���KEN �LE YAPALIM:
DECLARE @D DATETIME
SET @D = '2022-01-01 15:30:45'
SELECT
DATEPART(year,@D),
DATEPART(quarter,@D),
DATEPART(month,@D),
DATEPART(day,@D),
DATEPART(hour,@D),
DATEPART(minute,@D),
DATEPART(second,@D)


--- ### DATEPART B�T�� ###---


--- ### DAy BA�LANGI� ###---
--SYNTAX :DAY ( date )  
--Girilen tarihin g�n say�s�n� bize verir. (1-31)
--INT d�ner.
--�RNEKLER :

SELECT DAY(GETDATE())
SELECT DAY('2021/09/12')--12



--- ### DAy B�T�� ###---


--- ### GETDATE BA�LANGI� ###---
--SYNTAX :GETDATE()
--Veri Taban� sistem tarihini s�yler.
--�RNEK

SELECT GETDATE()


--- ### GETDATE B�T�� ###---


--- ### ISDATE BA�LANGI� ###---
--SYNTAX :ISDATE ( expression )
--datetime value �SE 1 de�ilse 0 d�ner.
--datetime2 value ise 0 d�ner.
--�RNEKLER :

SELECT ISDATE('2022')--1
SELECT ISDATE('ONUR')--0
SELECT ISDATE(123)--0
SELECT ISDATE('2022-06-15')--1
SELECT ISDATE('2022-15-15')--0

--- ### ISDATE B�T�� ###---



--- ### MONTH BA�LANGI� ###---
--SYNTAX :MONTH ( date )
--Girilen tarihin ay'�n� bize verir.
--1 ile 12 aras�nda bir de�er d�ner.
--�rnek:

SELECT MONTH(GETDATE())
SELECT MONTH('2022/12/01 10:09:23.456')--12

--- ### MONTH B�T�� ###---

--- ### YEAR BA�LANGI� ###---
--SYNTAX :YEAR ( date )
--Girilen tarihin YILI'�n� bize verir.
--INT d�ner.
--�RNEKLER:

SELECT YEAR(GETDATE())
SELECT YEAR('2022/12/01 10:09:23.456')--2022

--- ### YEAR B�T�� ###---


--- ### SYSDATETIME BA�LANGI� ###---
--SYNTAX :SYSDATETIME ( )
--SQL SERVER'IN zaman ve tarihini d�enr.
--�rnek:

SELECT SYSDATETIME()--2022-05-04 01:49:23.0587111
--A�A�IDA SYSDATETIME'I date'e d�nd�rm�� olduk.
SELECT CONVERT(DATE,SYSDATETIME())--2022-05-04

--- ### SYSDATETIME B�T�� ###---


--- ### datet�me2fromparts BA�LANGI� ###---
--Syntax :DATETIME2FROMPARTS ( year, month, day, hour, minute, seconds, fractions, precision )  
--Datetime2 olarak bize giridi�imiz parametrelere g�re tarih yapar.
--Herhangibir null null de�er al�rsa null d�ner.
--�RNEK:
SELECT DATETIME2FROMPARTS(2022,12,31,11,59,59,0,0)

--- ### datet�me2fromparts biti� ###---


--- ### EOMONTH BA�LANGI� ###---
--SYNTAX :EOMONTH ( start_date [, month_to_add ] )
--Ay�n son g�n�n� almak i�in kullan�r�z.
--�RNEKLER:

SELECT EOMONTH(GETDATE()) -- 2022-04-30
SELECT EOMONTH('2022-02-03') -- 2022-02-28
SELECT EOMONTH('2022-02-03',2)--2022-04-30


--�RNEK :DE���KEN EKLEYEREK YAPALIM
DECLARE @date DATETIME = GETDATE();  
SELECT EOMONTH ( @date ) AS 'Bu ay';  
SELECT EOMONTH ( @date, 1 ) AS 'Gelecek Ay';  
SELECT EOMONTH ( @date, -1 ) AS 'Ge�en Ay';  

--�RNEK :
SELECT DAY(EOMONTH('2022-02-03'))--28

--- ### EOMONTH biti� ###---


--- ### DATE CALCULATIONS BA�LANGI� ### ---
--Formating the date:

SELECT
ModifiedDate,
CONVERT(CHAR(8),ModifiedDate),
CONVERT(CHAR(8),ModifiedDate,2),
CONVERT(CHAR(12),ModifiedDate,103),
DATENAME(DW,ModifiedDate)
FROM Person.Person


--- ### DATE CALCULATIONS B�T�� ### ---

