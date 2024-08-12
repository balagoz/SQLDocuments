--- HATA Y�NET�M� --- :
--TRY CATCH
--THROW
--RAISERROR


--TRY CATCH BA�LANGI� ----

--Bir veya daha fazla i�lemden olu�an SQL blo�unda hata y�netimi(kontrolu) i�in kullan�l�r:
--TRY b�l�m�nde yapmak istedi�imiz i�lemleri s�ralar�z,e�er hata varsa ak�� kontrol� CATCH blo�una ge�mektedir.
--SYNTAX:

	BEGIN TRY
		--SQL sORGULARI
	END TRY

	BEGIN CATCH
		--SQL sORGULARI
	END CATCH

--CATCH blo�u i�erisinde hatan�n nedenine ili�kin baz� bilgiler elde edebiliriz.
/*

ERROR_LINE() returns the line number on which the exception occurred.
ERROR_MESSAGE() returns the complete text of the generated error message.
ERROR_PROCEDURE() returns the name of the stored procedure or trigger where the error occurred.
ERROR_NUMBER() returns the number of the error that occurred.
ERROR_SEVERITY() returns the severity level of the error that occurred.
ERROR_STATE() returns the state number of the error that occurred.

*/

--�RNEK :
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




--�RNEK:
--De�i�kene veri atayarak da ayn�s�n� yapabiliriz.
BEGIN
    BEGIN TRY
        DECLARE @say� INT = 100 / 0
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



--�RNEK :Stored Procedure Olu�tural�m:
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


--De�i�kenlerimiz girip,sp'yi execute edelim:
DECLARE @r decimal;
EXEC Bolme 10, 2, @r output;
PRINT @r;

--De�i�kenlerimiz girip,sp'yi execute edelim:
--�lgili �rnek hata verir.
DECLARE @r decimal;
EXEC Bolme 0, 0, @r output;
PRINT @r;



--�RNEK :
--Hata vermeden �al���r.��nk� Say�ya varchar veri tipi atad�k.
BEGIN
	BEGIN TRY
		DECLARE @�sim varchar(50)
		DECLARE @Maas varchar(50)
		SET @�sim = 'Onur'
		SET @Maas = 8000
		PRINT @�sim + ' ' + @Maas + ' ' + 'TL' + ' ' +'Kazan�yor'

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


--Hata verir.��nk� Say�ya INT veri tipi atad�k.
BEGIN
	BEGIN TRY
		DECLARE @�sim varchar(50)
		DECLARE @Maas INT
		SET @�sim = 'Onur'
		SET @Maas = 8000
		PRINT @�sim + ' ' + @Maas + ' ' + 'TL' + ' ' +'Kazan�yor'

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



---TRY CATCH ROLLBACK �RNE�� ----
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

--A�A�IDAK�NDE HATA YOK
BEGIN TRY

		BEGIN TRANSACTION
		INSERT INTO SAYILAR VALUES (24)
		COMMIT TRANSACTION
		PRINT 'HATASIZ SONU�LANDI'


END TRY


BEGIN CATCH

		ROLLBACK
		PRINT 'HATA VAR'

END CATCH


--A�A�IDAK�NDE HATA VAR
BEGIN TRY

		BEGIN TRANSACTION
		INSERT INTO SAYILAR VALUES ('Onur')
		COMMIT TRANSACTION
		PRINT 'HATASIZ SONU�LANDI'


END TRY
BEGIN CATCH
		ROLLBACK
		PRINT 'HATA VAR'
END CATCH




--throw:

/*

SYNTAX : THROW [ error_number ,  message ,  state ];

THROW ile hata basmak asl�nda daha basittir. Bu yolla bas�lan hatalar�n hata numaras� da en az 50000 olmal�d�r.
��nk� 50000'den k���k mesajlar sistem mesajlar�d�r.
THROW taraf�ndan olu�turulan hatalar�n �nem seviyesi her zaman 16�d�r.Yani hi� bir �nem derecelendirmesi yapamay�z.
Noktal� virg�l ile sonland�rlmas� gerekmektedir.
Hata numaras�n�n sys.sysmessages�da tan�mlanmas�na gerek yoktur.Raiserror'da zorunludur.


*/
--�RNEK :
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
		PRINT 'HATASIZ SONU�LANDI'


END TRY


BEGIN CATCH

		ROLLBACK
		PRINT 'HATA VAR';
		THROW;

END CATCH

--1/0 'da Normal alaca��m�z Hata :
SELECT  1 /0

--D�z THROW kulland���m�z zaman orjinal hatam�z� al�yoruz.
--THROW �RNEK :
--Parametresiz kullan�rsak

BEGIN TRY
	DECLARE @say�1 INT = 10
	SELECT  @say�1 /0

END TRY
BEGIN CATCH
THROW;
END CATCH


--THROW �RNEK :
--THROW Parametreleriyle kulland���m�z zaman :
BEGIN TRY
	DECLARE @say�1 INT = 10
	SELECT  @say�1 /0

END TRY
BEGIN CATCH
THROW 50000,'0 ile b�lme i�lemi yapamay�z',1
END CATCH



/*

RAISERROR																		THROW
The message_id that you pass to RAISERROR must be defined in sys.messages view.	The error_number parameter does not have to be defined in the sys.messages view.
The message parameter can contain printf formatting styles such as %s and %d.	The message parameter does not accept printf style formatting. Use FORMATMESSAGE() function to substitute parameters.
The severity parameter indicates the severity of the exception.					The severity of the exception is always set to 16.

*/


--RAISERROR :

--SYNTAX : RAISERROR('Hata Mesaj�',ERROR_SEVERITY, ERROR_STATE)
--RAISERROR ifadesi hata f�rlatmada kullan�lan yap�lardan bir tanesidir.
--RAISERROR ifadesi, kendi hata mesajlar�n�z� olu�turman�za ve bu mesajlar�, 
--SQL Server Database Engine taraf�ndan olu�turulan bir sistem hatas� veya uyar� mesaj�yla ayn� format� 
--kullanarak uygulamaya geri d�nd�rmenize izin verir.
--Buna ek olarak RAISERROR,yaratca��m�z hata i�in message id,severity ve hata mesajlar�n�n durumunu belirtmemize
--m�sade eder.
--TRY CATCH yap�s� i�inde RAISERROR fonksiyonunu kullanabiliriz. Veya yazd���m�z SP yada Trigger hata vermeden
--bizim kendi kontrollerimiz i�in hata f�rlatmas�n� sa�layabiliriz. 
--�stedi�imiz durum SQL Hatas� olmay�p bizim koydu�umuz kontrol neticesinde bir mant�k hatas� olabilir.
--Raiserror ile kullan�c�ya bizim belirlerdi�imiz hata mesaj�da vermek m�mk�n olmaktad�r.
--�zetle SQ SERVER'�n hata f�rlatmas�n� beklemeden kendimiz sorgunun hata f�rlatmaas�n� istedi�imi zamanlarda kullanabiliriz.
--'Hata Mesaj�'>>> Bizim belirledi�imiz bir metin olmakla birlikte,Severity hatan�n �nemini veya ciddiyetini belirten
--0 ile 25 aras�nda olan bir tamsay�d�r.

/*	SEVERITY LEVEL:
	0�10 Informational messages
	11�18 Errors
    19�25 Fatal errors

	STATE:
	0 ile 255 aras�nda bir tamsay�d�r.
	�zel tan�ml� hata mesaj�m�z birden �ok yer i�in kullanm��sak bu rakam sayesinde
	hangi yerde hata oldu�unu ay�rt edebiliriz.Ancak �o�u zaman 1 kullan�l�r.
*/





/*


The RAISERROR statement allows you to generate your own error messages 
,and return these messages back to the application using the same format ,
as a system error or warning message generated by SQL Server Database Engine. 
In addition, the RAISERROR statement allows you to set a specific message id, 
level of severity, and state for the error messages.

severity
The severity level is an integer between 0 and 25, with each level representing the seriousness of the error.

0�10 Informational messages
11�18 Errors
19�25 Fatal errors



state
The state is an integer from 0 through 255. If you raise the same user-defined error at multiple locations, 
you can use a unique state number for each location to make it easier to find which section 
of the code is causing the errors. For most implementations, you can use 1.

*/

--�RNEK:
RAISERROR ('Say� s�f�ra b�l�nemez',16,6)
--�RNEK:
SELECT 1/0-- BU ��LEM B�ZE HATA VER�R.

--B�Z KEND� OLU�TURDU�UMUZ HATA MESAJINI ALMAK �ST�YORUZ.
--BUNUN ���N
--1.ADIM :sp_addmessage : BURYA HATA NUMARASI,SEVER�TY(GENELDE 16 OLUR) VE MESAJ YAZAB�L�R�Z.
EXEC sp_addmessage @msgnum = 50016,@severity=16,@msgtext='Say�lar� s�f�ra b�lemeyiz'

--Olu�turdu�umuz mesaj� drop etmek i�in :
EXEC sp_dropmessage  @msgnum = 50016


--2.ad�m :SELECT * FROM sys.messages'dan hatan�n olu�up olu�mad���n� anlayabilirim.
SELECT * FROM sys.messages

--�RNEK:
--�imdi olu�turdu�umuz hata mesaj�n� TRY CATCH yap�s� i�erisinde kullanabiliriz.
--Biz burada kendimiz hata mesaj�m�z� belirledik,SQL'den gelen hata gelmemi� oldu.
BEGIN TRY
	DECLARE @SAYI INT
	SET @SAYI = 1/0

END TRY

	
BEGIN CATCH
	RAISERROR(50016,16,1);
END CATCH

/*



*/
--�RNEK:
--Burada sp_addmessage prosed�r�n� kullanarak hatam�z� sysmesagges tablosuna eklemi� oluruz.
EXEC sp_addmessage 
    @msgnum = 50075, 
    @severity = 16, 
    @msgtext = 'Rastgele Bir Hata Mesaj�';

RAISERROR ( 50075,16,1)



--LEVEL=SEVER�TY


--RAISEERROR VS THROW---

--�RNEK :

--Hatam�z�n ol�up olu�mad���n� sys.messages'dan kontrol edebiliriz.
SELECT * FROM sys.messages  WHERE message_id = 50075

--THORW:
BEGIN TRY
		DECLARE @SAYI INT
		SET @SAYI = 1/0

END TRY
BEGIN CATCH
THROW;
END CATCH

--AYNISINI RA�SEEROR �LE YAZALIM:
--Orjinal hata numaras� gidiyor a�a��da

BEGIN TRY
		DECLARE @SAYI INT
		SET @SAYI = 1/0

END TRY
BEGIN CATCH

DECLARE @HataMesaj� nvarchar(1000)
DECLARE @HataSeviyesi INT
DECLARE @HataDurum INT

SELECT
 @HataMesaj�=ERROR_MESSAGE(),
 @HataSeviyesi=ERROR_SEVERITY(),
 @HataDurum = ERROR_STATE()

 RAISERROR(@HataMesaj�,@HataSeviyesi,@HataDurum)

END CATCH

--B�R D��ER FARK DA RA�SERROR �FADES�NDEN SONRA YAZILANLAR �ALI�IR AMA THROWDAN SONRAK�LER �ALI�MAZ.
BEGIN
	PRINT 'SELAM'
	RAISERROR('Merhaba',16,1)
	PRINT 'merhaba'
END


BEGIN
	PRINT '�al��t�';
	THROW 50000,'Deneme',1
	PRINT '�al��t�'
END