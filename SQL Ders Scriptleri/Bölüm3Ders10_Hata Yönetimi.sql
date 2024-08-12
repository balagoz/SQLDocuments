--- HATA YÖNETÝMÝ --- :
--TRY CATCH
--THROW
--RAISERROR


--TRY CATCH BAÞLANGIÇ ----

--Bir veya daha fazla iþlemden oluþan SQL bloðunda hata yönetimi(kontrolu) için kullanýlýr:
--TRY bölümünde yapmak istediðimiz iþlemleri sýralarýz,eðer hata varsa akýþ kontrolü CATCH bloðuna geçmektedir.
--SYNTAX:

	BEGIN TRY
		--SQL sORGULARI
	END TRY

	BEGIN CATCH
		--SQL sORGULARI
	END CATCH

--CATCH bloðu içerisinde hatanýn nedenine iliþkin bazý bilgiler elde edebiliriz.
/*

ERROR_LINE() returns the line number on which the exception occurred.
ERROR_MESSAGE() returns the complete text of the generated error message.
ERROR_PROCEDURE() returns the name of the stored procedure or trigger where the error occurred.
ERROR_NUMBER() returns the number of the error that occurred.
ERROR_SEVERITY() returns the severity level of the error that occurred.
ERROR_STATE() returns the state number of the error that occurred.

*/

--ÖRNEK :
BEGIN
    BEGIN TRY
        SELECT 10 /0
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;




--ÖRNEK:
--Deðiþkene veri atayarak da aynýsýný yapabiliriz.
BEGIN
    BEGIN TRY
        DECLARE @sayý INT = 100 / 0
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;



--ÖRNEK :Stored Procedure Oluþturalým:
CREATE PROC Bolme
(
    @a decimal,
    @b decimal,
    @c decimal output
) 
AS
BEGIN
    BEGIN TRY
        SET @c = @a / @b;
    END TRY
    BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;


--Deðiþkenlerimiz girip,sp'yi execute edelim:
DECLARE @r decimal;
EXEC Bolme 10, 2, @r output;
PRINT @r;

--Deðiþkenlerimiz girip,sp'yi execute edelim:
--Ýlgili örnek hata verir.
DECLARE @r decimal;
EXEC Bolme 0, 0, @r output;
PRINT @r;



--ÖRNEK :
--Hata vermeden çalýþýr.Çünkü Sayýya varchar veri tipi atadýk.
BEGIN
	BEGIN TRY
		DECLARE @Ýsim varchar(50)
		DECLARE @Maas varchar(50)
		SET @Ýsim = 'Onur'
		SET @Maas = 8000
		PRINT @Ýsim + ' ' + @Maas + ' ' + 'TL' + ' ' +'Kazanýyor'

	END TRY

	BEGIN CATCH
	SELECT
	         ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH
END;


--Hata verir.Çünkü Sayýya INT veri tipi atadýk.
BEGIN
	BEGIN TRY
		DECLARE @Ýsim varchar(50)
		DECLARE @Maas INT
		SET @Ýsim = 'Onur'
		SET @Maas = 8000
		PRINT @Ýsim + ' ' + @Maas + ' ' + 'TL' + ' ' +'Kazanýyor'

	END TRY

	BEGIN CATCH
	SELECT
	         ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH
	

END;



---TRY CATCH ROLLBACK ÖRNEÐÝ ----
CREATE TABLE SAYILAR
(
ID INT

);

INSERT INTO SAYILAR VALUES
(1),
(2),
(3),
(4),
(5);

--Orjinal Tablomuz :
SELECT * FROM SAYILAR

--AÞAÐIDAKÝNDE HATA YOK
BEGIN TRY

		BEGIN TRANSACTION
		INSERT INTO SAYILAR VALUES (24)
		COMMIT TRANSACTION
		PRINT 'HATASIZ SONUÇLANDI'


END TRY


BEGIN CATCH

		ROLLBACK
		PRINT 'HATA VAR'

END CATCH


--AÞAÐIDAKÝNDE HATA VAR
BEGIN TRY

		BEGIN TRANSACTION
		INSERT INTO SAYILAR VALUES ('Onur')
		COMMIT TRANSACTION
		PRINT 'HATASIZ SONUÇLANDI'


END TRY
BEGIN CATCH
		ROLLBACK
		PRINT 'HATA VAR'
END CATCH




--throw:

/*

SYNTAX : THROW [ error_number ,  message ,  state ];

THROW ile hata basmak aslýnda daha basittir. Bu yolla basýlan hatalarýn hata numarasý da en az 50000 olmalýdýr.
Çünkü 50000'den küçük mesajlar sistem mesajlarýdýr.
THROW tarafýndan oluþturulan hatalarýn önem seviyesi her zaman 16’dýr.Yani hiç bir önem derecelendirmesi yapamayýz.
Noktalý virgül ile sonlandýrlmasý gerekmektedir.
Hata numarasýnýn sys.sysmessages’da tanýmlanmasýna gerek yoktur.Raiserror'da zorunludur.


*/
--ÖRNEK :
THROW 50004,'HATA ALIYORUZ',1

/*
SYNTAX :
THROW [ error_number ,  
        message ,  
        state ];

*/

BEGIN TRY

		BEGIN TRANSACTION
		INSERT INTO SAYILAR VALUES ('Onur')
		COMMIT TRANSACTION
		PRINT 'HATASIZ SONUÇLANDI'


END TRY


BEGIN CATCH

		ROLLBACK
		PRINT 'HATA VAR';
		THROW;

END CATCH

--1/0 'da Normal alacaðýmýz Hata :
SELECT  1 /0

--Düz THROW kullandýðýmýz zaman orjinal hatamýzý alýyoruz.
--THROW ÖRNEK :
--Parametresiz kullanýrsak

BEGIN TRY
	DECLARE @sayý1 INT = 10
	SELECT  @sayý1 /0

END TRY
BEGIN CATCH
THROW;
END CATCH


--THROW ÖRNEK :
--THROW Parametreleriyle kullandýðýmýz zaman :
BEGIN TRY
	DECLARE @sayý1 INT = 10
	SELECT  @sayý1 /0

END TRY
BEGIN CATCH
THROW 50000,'0 ile bölme iþlemi yapamayýz',1
END CATCH



/*

RAISERROR																		THROW
The message_id that you pass to RAISERROR must be defined in sys.messages view.	The error_number parameter does not have to be defined in the sys.messages view.
The message parameter can contain printf formatting styles such as %s and %d.	The message parameter does not accept printf style formatting. Use FORMATMESSAGE() function to substitute parameters.
The severity parameter indicates the severity of the exception.					The severity of the exception is always set to 16.

*/


--RAISERROR :

--SYNTAX : RAISERROR('Hata Mesajý',ERROR_SEVERITY, ERROR_STATE)
--RAISERROR ifadesi hata fýrlatmada kullanýlan yapýlardan bir tanesidir.
--RAISERROR ifadesi, kendi hata mesajlarýnýzý oluþturmanýza ve bu mesajlarý, 
--SQL Server Database Engine tarafýndan oluþturulan bir sistem hatasý veya uyarý mesajýyla ayný formatý 
--kullanarak uygulamaya geri döndürmenize izin verir.
--Buna ek olarak RAISERROR,yaratcaðýmýz hata için message id,severity ve hata mesajlarýnýn durumunu belirtmemize
--müsade eder.
--TRY CATCH yapýsý içinde RAISERROR fonksiyonunu kullanabiliriz. Veya yazdýðýmýz SP yada Trigger hata vermeden
--bizim kendi kontrollerimiz için hata fýrlatmasýný saðlayabiliriz. 
--Ýstediðimiz durum SQL Hatasý olmayýp bizim koyduðumuz kontrol neticesinde bir mantýk hatasý olabilir.
--Raiserror ile kullanýcýya bizim belirlerdiðimiz hata mesajýda vermek mümkün olmaktadýr.
--Özetle SQ SERVER'ýn hata fýrlatmasýný beklemeden kendimiz sorgunun hata fýrlatmaasýný istediðimi zamanlarda kullanabiliriz.
--'Hata Mesajý'>>> Bizim belirlediðimiz bir metin olmakla birlikte,Severity hatanýn önemini veya ciddiyetini belirten
--0 ile 25 arasýnda olan bir tamsayýdýr.

/*	SEVERITY LEVEL:
	0–10 Informational messages
	11–18 Errors
    19–25 Fatal errors

	STATE:
	0 ile 255 arasýnda bir tamsayýdýr.
	Özel tanýmlý hata mesajýmýz birden çok yer için kullanmýþsak bu rakam sayesinde
	hangi yerde hata olduðunu ayýrt edebiliriz.Ancak çoðu zaman 1 kullanýlýr.
*/





/*


The RAISERROR statement allows you to generate your own error messages 
,and return these messages back to the application using the same format ,
as a system error or warning message generated by SQL Server Database Engine. 
In addition, the RAISERROR statement allows you to set a specific message id, 
level of severity, and state for the error messages.

severity
The severity level is an integer between 0 and 25, with each level representing the seriousness of the error.

0–10 Informational messages
11–18 Errors
19–25 Fatal errors



state
The state is an integer from 0 through 255. If you raise the same user-defined error at multiple locations, 
you can use a unique state number for each location to make it easier to find which section 
of the code is causing the errors. For most implementations, you can use 1.

*/

--ÖRNEK:
RAISERROR ('Sayý sýfýra bölünemez',16,6)
--ÖRNEK:
SELECT 1/0-- BU ÝÞLEM BÝZE HATA VERÝR.

--BÝZ KENDÝ OLUÞTURDUÐUMUZ HATA MESAJINI ALMAK ÝSTÝYORUZ.
--BUNUN ÝÇÝN
--1.ADIM :sp_addmessage : BURYA HATA NUMARASI,SEVERÝTY(GENELDE 16 OLUR) VE MESAJ YAZABÝLÝRÝZ.
EXEC sp_addmessage @msgnum = 50016,@severity=16,@msgtext='Sayýlarý sýfýra bölemeyiz'

--Oluþturduðumuz mesajý drop etmek için :
EXEC sp_dropmessage  @msgnum = 50016


--2.adým :SELECT * FROM sys.messages'dan hatanýn oluþup oluþmadýðýný anlayabilirim.
SELECT * FROM sys.messages

--ÖRNEK:
--Þimdi oluþturduðumuz hata mesajýný TRY CATCH yapýsý içerisinde kullanabiliriz.
--Biz burada kendimiz hata mesajýmýzý belirledik,SQL'den gelen hata gelmemiþ oldu.
BEGIN TRY
	DECLARE @SAYI INT
	SET @SAYI = 1/0

END TRY

	
BEGIN CATCH
	RAISERROR(50016,16,1);
END CATCH

/*



*/
--ÖRNEK:
--Burada sp_addmessage prosedürünü kullanarak hatamýzý sysmesagges tablosuna eklemiþ oluruz.
EXEC sp_addmessage 
    @msgnum = 50075, 
    @severity = 16, 
    @msgtext = 'Rastgele Bir Hata Mesajý';

RAISERROR ( 50075,16,1)



--LEVEL=SEVERÝTY


--RAISEERROR VS THROW---

--ÖRNEK :

--Hatamýzýn olþup oluþmadýðýný sys.messages'dan kontrol edebiliriz.
SELECT * FROM sys.messages  WHERE message_id = 50075

--THORW:
BEGIN TRY
		DECLARE @SAYI INT
		SET @SAYI = 1/0

END TRY
BEGIN CATCH
THROW;
END CATCH

--AYNISINI RAÝSEEROR ÝLE YAZALIM:
--Orjinal hata numarasý gidiyor aþaðýda

BEGIN TRY
		DECLARE @SAYI INT
		SET @SAYI = 1/0

END TRY
BEGIN CATCH

DECLARE @HataMesajý nvarchar(1000)
DECLARE @HataSeviyesi INT
DECLARE @HataDurum INT

SELECT
 @HataMesajý=ERROR_MESSAGE(),
 @HataSeviyesi=ERROR_SEVERITY(),
 @HataDurum = ERROR_STATE()

 RAISERROR(@HataMesajý,@HataSeviyesi,@HataDurum)

END CATCH

--BÝR DÝÐER FARK DA RAÝSERROR ÝFADESÝNDEN SONRA YAZILANLAR ÇALIÞIR AMA THROWDAN SONRAKÝLER ÇALIÞMAZ.
BEGIN
	PRINT 'SELAM'
	RAISERROR('Merhaba',16,1)
	PRINT 'merhaba'
END


BEGIN
	PRINT 'Çalýþtý';
	THROW 50000,'Deneme',1
	PRINT 'Çalýþtý'
END