--- ### CURRENT- TIMESTAMP BAÞLANGIÇ ###---
--SYNTAX :CURRENT_TIMESTAMP 
--Anlýk tarih ve saati verir.
--Sonuna parantez koymayýz.
--GETDATE() ile ayný sonucu bizlere verir.

SELECT CURRENT_TIMESTAMP
SELECT GETDATE()


--- ### CURRENT- TIMESTAMP BÝTÝÞ ###---


--- ### DATEADD BAÞLANGIÇ ###---
--SYNTAX:DATEADD (datepart , number , date )  
--Girilen tarihe,tarih ve zaman eklemizi saðlar.
--ÖRNEK:
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




--- ### DATEADD BAÞLANGIÇ ###---



--- ### DATEDIFF BAÞLANGIÇ ###---
--SYNTAX :DATEDIFF ( datepart , startdate , enddate ) 
--Ýki tarih arasýndaki farký istediðimiz ay,yýl ve gün olarak görmemizi saðlar.
--ÖRNELK :

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



--ÖRNEK :Deðiþken tanýmlayarak yapalým:
DECLARE @TARÝH1 DATE
DECLARE @TARÝH2 DATE
SET @TARÝH1 =('2022/04/25')
SET @TARÝH2 =('2022/12/25')

SELECT @TARÝH1,@TARÝH2

SELECT DATEDIFF(M,@TARÝH1,@TARÝH2)


--- ### DATEDIFF BÝTÝÞ ###---



--- ### DATEFROMPARTS BAÞLANGIÇ ###---

--SYNTAX :DATEFROMPARTS ( year, month, day )  
--Tarih yaratmak için kullanabiliriz
--YEAR 4 BASAMAKLI
--MONTH 1- 12
--DAY -- 1- 31
--ÖRNEK:
SELECT DATEFROMPARTS(2022,12,31)
SELECT DATEFROMPARTS(2022,12,NULL)

--- ### DATEFROMPARTS BÝTÝÞ ###---




--- ### DATENAME BAÞLANGIÇ ###---
--SYNATAX:DATENAME ( datepart , date )  
--Tarihten sadece belli bir alaný seçmek için kullanýlýr.
--Biraz sonra göreceðimiz DATEPART fonk.ile benzer.
--Tek fark DATENAME string olarak dönerken,DATEPART ise int olarak dönüyor.
--ÖRNEK :

SELECT DATENAME(year,GETDATE())
SELECT DATENAME(HH,GETDATE())
SELECT DATENAME(minute,GETDATE())
SELECT DATENAME(quarter,GETDATE())


SELECT DATENAME(year,GETDATE())+ '1' --20221-- Çünkü datename karakter
-- Ama DATEPART ile yaparsak sorun olmaz.
--Çünkü DATEPART,INT olarak geri döner.
SELECT DATEPART(year,GETDATE()) + '1' --2023


--- ### DATENAME BÝTÝÞ ###---




--- ### DATEPART BAÞLANGIÇ ###---
--SYNTAX :DATEPART ( datepart , date ) 
--INT olarak geri döner.
--DATENAME ile benzer.
--ÖRNEK :

SELECT DATEPART(year,GETDATE())
SELECT DATEPART(YYYY,GETDATE())
SELECT DATEPART(week,GETDATE())

--ÖRNEK : DEÐÝÞKEN ÝLE YAPALIM:
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


--- ### DATEPART BÝTÝÞ ###---


--- ### DAy BAÞLANGIÇ ###---
--SYNTAX :DAY ( date )  
--Girilen tarihin gün sayýsýný bize verir. (1-31)
--INT döner.
--ÖRNEKLER :

SELECT DAY(GETDATE())
SELECT DAY('2021/09/12')--12



--- ### DAy BÝTÝÞ ###---


--- ### GETDATE BAÞLANGIÇ ###---
--SYNTAX :GETDATE()
--Veri Tabaný sistem tarihini söyler.
--ÖRNEK

SELECT GETDATE()


--- ### GETDATE BÝTÝÞ ###---


--- ### ISDATE BAÞLANGIÇ ###---
--SYNTAX :ISDATE ( expression )
--datetime value ÝSE 1 deðilse 0 döner.
--datetime2 value ise 0 döner.
--ÖRNEKLER :

SELECT ISDATE('2022')--1
SELECT ISDATE('ONUR')--0
SELECT ISDATE(123)--0
SELECT ISDATE('2022-06-15')--1
SELECT ISDATE('2022-15-15')--0

--- ### ISDATE BÝTÝÞ ###---



--- ### MONTH BAÞLANGIÇ ###---
--SYNTAX :MONTH ( date )
--Girilen tarihin ay'ýný bize verir.
--1 ile 12 arasýnda bir deðer döner.
--örnek:

SELECT MONTH(GETDATE())
SELECT MONTH('2022/12/01 10:09:23.456')--12

--- ### MONTH BÝTÝÞ ###---

--- ### YEAR BAÞLANGIÇ ###---
--SYNTAX :YEAR ( date )
--Girilen tarihin YILI'ýný bize verir.
--INT döner.
--ÖRNEKLER:

SELECT YEAR(GETDATE())
SELECT YEAR('2022/12/01 10:09:23.456')--2022

--- ### YEAR BÝTÝÞ ###---


--- ### SYSDATETIME BAÞLANGIÇ ###---
--SYNTAX :SYSDATETIME ( )
--SQL SERVER'IN zaman ve tarihini döenr.
--örnek:

SELECT SYSDATETIME()--2022-05-04 01:49:23.0587111
--AÞAÐIDA SYSDATETIME'I date'e döndürmüþ olduk.
SELECT CONVERT(DATE,SYSDATETIME())--2022-05-04

--- ### SYSDATETIME BÝTÝÞ ###---


--- ### datetýme2fromparts BAÞLANGIÇ ###---
--Syntax :DATETIME2FROMPARTS ( year, month, day, hour, minute, seconds, fractions, precision )  
--Datetime2 olarak bize giridiðimiz parametrelere göre tarih yapar.
--Herhangibir null null deðer alýrsa null döner.
--ÖRNEK:
SELECT DATETIME2FROMPARTS(2022,12,31,11,59,59,0,0)

--- ### datetýme2fromparts bitiþ ###---


--- ### EOMONTH BAÞLANGIÇ ###---
--SYNTAX :EOMONTH ( start_date [, month_to_add ] )
--Ayýn son gününü almak için kullanýrýz.
--ÖRNEKLER:

SELECT EOMONTH(GETDATE()) -- 2022-04-30
SELECT EOMONTH('2022-02-03') -- 2022-02-28
SELECT EOMONTH('2022-02-03',2)--2022-04-30


--ÖRNEK :DEÐÝÞKEN EKLEYEREK YAPALIM
DECLARE @date DATETIME = GETDATE();  
SELECT EOMONTH ( @date ) AS 'Bu ay';  
SELECT EOMONTH ( @date, 1 ) AS 'Gelecek Ay';  
SELECT EOMONTH ( @date, -1 ) AS 'Geçen Ay';  

--ÖRNEK :
SELECT DAY(EOMONTH('2022-02-03'))--28

--- ### EOMONTH bitiþ ###---


--- ### DATE CALCULATIONS BAÞLANGIÇ ### ---
--Formating the date:

SELECT
ModifiedDate,
CONVERT(CHAR(8),ModifiedDate),
CONVERT(CHAR(8),ModifiedDate,2),
CONVERT(CHAR(12),ModifiedDate,103),
DATENAME(DW,ModifiedDate)
FROM Person.Person


--- ### DATE CALCULATIONS BÝTÝÞ ### ---

