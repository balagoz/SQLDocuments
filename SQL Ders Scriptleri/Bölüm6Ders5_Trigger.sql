---- #### TRIGGER ####----
--Triggerlear �zel stored proc'lard�r.
--DML veya DDL i�lemleri ger�ekle�ti�inde tetiklenip �al��acak olan SQL obljeleridir.
--SQL'de depolanan ve tetiklendi�inde �al��an SQL sorgular�d�r.
--Temelde 2 �e�it trigger vard�r.
--DML,DDL




--- DML TRIGGERS

--INSERT,UPDATE,DELETE komututlar� i�in yaz�lan triggerlard�r.



--2 �e�it olabilir bunlar : AFTER ve INSTEAD OF triggerlar�.
--

---Tabloya EKlenmi� Basit B�R DML Trigger� Yapal�m :

--Trigger eklemeden �nce hangi tabloya veya view'a trigger � ekeleyece�imize karar vermeliyiz.
--Tabloya trigger eklemenin birka� yolu var.

--1.yol :tablyu bulup,expand edip,Trigger sa� t�k ve new trigger.
--2.yol :Query yazarak.

--SYNTAX :
CREATE TRIGGER TriggerAd�
ON Tablo ad�
AFTER veya INSTEAD OF (Hangi olaylar i�in ge�erli olsun)	--AFTER MI ,INSTEAD OF TRIGGER MI OLACA�INA KARAR VER�CEZ.AFTER TR�GGER :Yapt���m�z i�lemlerden sonra olur.
AS															--INSTEAD OF TRIGGER : Yapt���m�z i�lemler�N YER�NE OLUR.
BEGIN
	SQL SORGULARI
END

--�RNEK :

--Tablo yaratal�m:
CREATE TABLE TABLOTRIGGER
(
ID INT,
AD VARCHAR(50),
MAAS INT,
Cinsiyet CHAR(1)

);

INSERT INTO TABLOTRIGGER VALUES
(1,'Onur',3500,'E'),
(2,'Murat',3500,'E'),
(3,'Kemal',6500,'E'),
(4,'Fatma',4500,'k'),
(5,'Can',7500,'E');

--ORJ�NAL TABLOMUZ :
SELECT * FROM TABLOTRIGGER


--TRIGGER YARATALIM:
CREATE TRIGGER TABLOTRIGGER_Tr�gger
ON TABLOTRIGGER
AFTER INSERT,DELETE,UPDATE
AS
BEGIN
	PRINT'Tabloda bir i�lem yap�ld�'
END;


--TRIGGERI TEST EDEL�M:

--A�a��dakilerin 3'�nede �al��t�rd�m ve 3 mesaj ald�m.


--INSERT EDEL�M:

INSERT INTO TABLOTRIGGER VALUES
(7,'Ay�e',12000,'K');

--TRIGGER �ALI�TI

--TABLOMUZUN SON HAL�:
--G�r�ld��� gibi After Trigger'� oldu�u i�in ekledi�im
--bilgi tabloda g�z�kmektedir.

SELECT * FROM TABLOTRIGGER

--UPDATE EDEL�M:
UPDATE TABLOTRIGGER
SET MAAS =100000
WHERE ID = 2;

--S�LEL�M:

DELETE FROM TABLOTRIGGER
WHERE ID = 2


--TRIGGERI mod�fy EDEL�M:
--1. YOL :Kodumuz elimizdeyse hemen sadece ALTER diyece�iz.

ALTER TRIGGER TABLOTRIGGER_Tr�gger
ON TABLOTRIGGER
AFTER INSERT,DELETE,UPDATE
AS
BEGIN
	PRINT'TABLOTRIGGER tablosunda bir i�lem yap�ld�'
END;

--trigger� test edelim.
DELETE FROM TABLOTRIGGER
WHERE ID = 1

--2. YOL : OBJ.EXP'dan trigger modify.


--TRIGGERI S�LME :
--1.YOL :OBJ.EXP'DAN trigger sa�t�k delete.
--2.yol :

DROP TRIGGER TABLOTRIGGER_Tr�gger



------INSTEAD OF TRIGGERLAR -----
--After yerine INSTEAD OF diyoruz sadece.

CREATE TRIGGER TABLOTRIGGER_Tr�gger
ON TABLOTRIGGER
INSTEAD OF INSERT --Burada Trigger�m�z�n sadece INSERT komutu i�in �al��mas�n� istemi�iz.
AS
BEGIN
	--HATA VERS�N �ST�YORUM 
	RAISERROR('INSERT ��LEM� YAPILAMAZ',16,1)
END;


SELECT * FROM TABLOTRIGGER

--INSERT EDEL�M:

INSERT INTO TABLOTRIGGER VALUES
(12,'Fatma',100000,'K');


--INSERTED AND DELETED TRIGGERS ---
--�rne�in tabloya veri insert etti�imizde,sadece insert etti�imiz 
--sat�r�n kar��m�za ��kmas�n� isteyebiliriz.
--Bu konuyla ilgili olarak inserted table ve deleted table 
--olarak 2 tabloya eri�imiz vard�r.
--Inserted tablolar veri insert etme ve update i�lemlerinde kullan�l�r.
--Deleted tablolar ise veri silme ve update i�lemlerinde kullan�l�r.


--�RNEK :

CREATE TRIGGER DenemeTr�gger
ON TABLOTRIGGER
AFTER INSERT
AS
BEGIN
	SELECT * FROM inserted--Bu inserted tablosu haz�r bir tablodur.
END;


INSERT INTO TABLOTRIGGER VALUES
(12,'Ay�e',12000,'K');

--------------------------------------

--DDL TRIGGERLARI :
--DDL triggerlar� : CREATE,ALTER,DROP
--Burada bu triggerlar�n sadece belirlenmi� database' mi 
--yoksa t�m servar i�in m� ge�erli olaca��n�da s�yleyebiliriz.


--Basit bir DDL Trigger Yaratmak :
--Trigger yaratmadan �nce tek bir veritaban�na m� yoksa 
--t�m server i�in mi ge�erli olaca��na karar vermemiz gerekmektedir.
--2 yolu vard�r.

--1.YOL :
--Obj.exp'den veya kod yazarak.
--E�er veritaban� i�in bir trigger yaratacaksak,
--se�ti�imiz veritaban�n�n i�erisinde  programbility kals�r� i�erisinde yer alan 
--sonra Database Triggers folder'� sa� t�k ve
--New Database trigger'� se�ebiliriz.

--2.YOL ise sorgu yazarak yaratabiliriz:

CREATE TRIGGER triggerad�
ON DATABASE
FOR CREATE TABLE
AS

BEGIN
	SQL_SORGULARI
END

--Peki server i�in bir trigger yazarsak nas�l yapaca��z?
--Soldaki men�de SERVER OBJECTS folder'� bulunmaktad�r.
--Burada da trigger folder'� var ancak burada sa� t�k yeni trigger diyememekteyiz.
--O y�zden sorgu ile yazmam�z gerekmektedir.

--�RNEK :
--B�Z KEND� �RNE��M�ZDE ORNEKLER VER�TABANI ���N TRIGGER YAZICAZ.VE CREATE TABLE olay� i�in yaz�caz.
--SYNTAX:

CREATE TRIGGER triggerad�
ON DATABASE
FOR CREATE TABLE
AS

BEGIN
	SQL_SORGULARI
END

--�RNEK:

CREATE TRIGGER YEN�TABLOYOK
ON DATABASE
FOR CREATE_TABLE ----Bu trigger sadece Ornekler veritaban�ndaki CREATE TABLE durumu i�in �al��acak.
AS
BEGIN
	PRINT 'Yeni tablo girmeyelim art�k '
	ROLLBACK
END

--Bu yaratt���m�z trigger'� veritaban� i�inde programbility i�indeki database triggerlar�n alt�nda g�rebiliriz.


--TEST EDEL�M TRIGGER'I :
CREATE TABLE DENEMETRIG
(
ID INT
);


--TRIGGER'I MODF�YE DEDL�M :

--CREATE YERN�E ALTER D�YECE��Z.

ALTER TRIGGER YEN�TABLOYOK
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	PRINT 'CREATE ALTER VE DROP ��LEMLER�N� YAPAMAYIZ '
	ROLLBACK
END

--TEST EDEL�M TRIGGER'I :

DROP TABLE TABLOTRIGGER


--TRIGGERI S�LME:

--2 Yolu bulunmaktad�r:
--1.YOL		:OBJ.EXP'TEN S�LMEK.
--2.YOL		:SORGU �LE:

DROP TRIGGER YEN�TABLOYOK ON DATABASE;


--DISABLING VE ENABLING TRIGGERS:
--Silmek yerine ge�ici olarak da disable edebiliriz.
--Gene 2 yolu bulunmaktad�r.
--1.yol:obj.exp'ten triggger� bulup ve sa� t�k ve disable'a t�klamak.
--2.yol : kod ile

DISABLE TRIGGER YEN�TABLOYOK ON DATABASE

--ENABLE ETMEK ���N :
ENABLE TRIGGER YEN�TABLOYOK ON DATABASE

--T�M TRIGGERLARI DISABLE ETMEK ���N :
DISABLE TRIGGER ALL ON DATABASE;
ENABLE TRIGGER ALL ON DATABASE;





--T�M SERVER ���N TRIGGER YAZALIM :
--�RNEK:
CREATE TRIGGER TUMSERVER
ON ALL SERVER
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	PRINT 'Bu serverda i�lem yap�lamaz'
END;

--Test edelim
use Ornek
GO
CREATE TABLE DENEMETABLOSU 
(
ID INT
);

--DROP edelim

DROP TRIGGER TUMSERVER ON ALL SERVER
--VEYA
DROP TRIGGER TUMSERVER ON DATABASE


--TRIGGERLARIN TET�KLENME SIRALMASINI DE���T�RMEK :

--( �stisna ) -SERVER bazl� triggerlar her zaman 
--database triggerlar�ndan �nce �al���rlar.
--�rne�in ayn� durum i�in birden fazla trigger da yaratabiliriz 
--ve bunlar�n s�ras�n� da de�i�tirebiliriz.

--�imdi 2 trigger yaratal�m:

--1.trigger:

CREATE TRIGGER IKI 
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	PRINT 'BU IKINCI TRGGER'
END;

--2.trigger:

CREATE TRIGGER BIR 
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
	PRINT 'BU BIRINCI TRGGER'
END;

--TEST EDEL�M:

CREATE TABLE TABLODENEMES�2
(
ID INT
);


--TRIGGER SIRASINI DE���T�RLEL�M :

EXEC sp_settriggerorder BIR,'First','create_table','DATABASE'





--

