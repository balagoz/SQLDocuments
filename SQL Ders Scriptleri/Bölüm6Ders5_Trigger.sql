---- #### TRIGGER ####----
--Triggerlear özel stored proc'lardýr.
--DML veya DDL iþlemleri gerçekleþtiðinde tetiklenip çalýþacak olan SQL obljeleridir.
--SQL'de depolanan ve tetiklendiðinde çalýþan SQL sorgularýdýr.
--Temelde 2 çeþit trigger vardýr.
--DML,DDL




--- DML TRIGGERS

--INSERT,UPDATE,DELETE komututlarý için yazýlan triggerlardýr.



--2 çeþit olabilir bunlar : AFTER ve INSTEAD OF triggerlarý.
--

---Tabloya EKlenmiþ Basit BÝR DML Triggerý Yapalým :

--Trigger eklemeden önce hangi tabloya veya view'a trigger ý ekeleyeceðimize karar vermeliyiz.
--Tabloya trigger eklemenin birkaç yolu var.

--1.yol :tablyu bulup,expand edip,Trigger sað týk ve new trigger.
--2.yol :Query yazarak.

--SYNTAX :
CREATE TRIGGER TriggerAdý
ON Tablo adý
AFTER veya INSTEAD OF (Hangi olaylar için geçerli olsun)	--AFTER MI ,INSTEAD OF TRIGGER MI OLACAÐINA KARAR VERÝCEZ.AFTER TRÝGGER :Yaptýðýmýz iþlemlerden sonra olur.
AS															--INSTEAD OF TRIGGER : Yaptýðýmýz iþlemlerÝN YERÝNE OLUR.
BEGIN
	SQL SORGULARI
END

--ÖRNEK :

--Tablo yaratalým:
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

--ORJÝNAL TABLOMUZ :
SELECT * FROM TABLOTRIGGER


--TRIGGER YARATALIM:
CREATE TRIGGER TABLOTRIGGER_Trýgger
ON TABLOTRIGGER
AFTER INSERT,DELETE,UPDATE
AS
BEGIN
	PRINT'Tabloda bir iþlem yapýldý'
END;


--TRIGGERI TEST EDELÝM:

--Aþaðýdakilerin 3'ünede çalýþtýrdým ve 3 mesaj aldým.


--INSERT EDELÝM:

INSERT INTO TABLOTRIGGER VALUES
(7,'Ayþe',12000,'K');

--TRIGGER ÇALIÞTI

--TABLOMUZUN SON HALÝ:
--Görüldüðü gibi After Trigger'ý olduðu için eklediðim
--bilgi tabloda gözükmektedir.

SELECT * FROM TABLOTRIGGER

--UPDATE EDELÝM:
UPDATE TABLOTRIGGER
SET MAAS =100000
WHERE ID = 2;

--SÝLELÝM:

DELETE FROM TABLOTRIGGER
WHERE ID = 2


--TRIGGERI modýfy EDELÝM:
--1. YOL :Kodumuz elimizdeyse hemen sadece ALTER diyeceðiz.

ALTER TRIGGER TABLOTRIGGER_Trýgger
ON TABLOTRIGGER
AFTER INSERT,DELETE,UPDATE
AS
BEGIN
	PRINT'TABLOTRIGGER tablosunda bir iþlem yapýldý'
END;

--triggerý test edelim.
DELETE FROM TABLOTRIGGER
WHERE ID = 1

--2. YOL : OBJ.EXP'dan trigger modify.


--TRIGGERI SÝLME :
--1.YOL :OBJ.EXP'DAN trigger saðtýk delete.
--2.yol :

DROP TRIGGER TABLOTRIGGER_Trýgger



------INSTEAD OF TRIGGERLAR -----
--After yerine INSTEAD OF diyoruz sadece.

CREATE TRIGGER TABLOTRIGGER_Trýgger
ON TABLOTRIGGER
INSTEAD OF INSERT --Burada Triggerýmýzýn sadece INSERT komutu için çalýþmasýný istemiþiz.
AS
BEGIN
	--HATA VERSÝN ÝSTÝYORUM 
	RAISERROR('INSERT ÝÞLEMÝ YAPILAMAZ',16,1)
END;


SELECT * FROM TABLOTRIGGER

--INSERT EDELÝM:

INSERT INTO TABLOTRIGGER VALUES
(12,'Fatma',100000,'K');


--INSERTED AND DELETED TRIGGERS ---
--Örneðin tabloya veri insert ettiðimizde,sadece insert ettiðimiz 
--satýrýn karþýmýza çýkmasýný isteyebiliriz.
--Bu konuyla ilgili olarak inserted table ve deleted table 
--olarak 2 tabloya eriþimiz vardýr.
--Inserted tablolar veri insert etme ve update iþlemlerinde kullanýlýr.
--Deleted tablolar ise veri silme ve update iþlemlerinde kullanýlýr.


--ÖRNEK :

CREATE TRIGGER DenemeTrýgger
ON TABLOTRIGGER
AFTER INSERT
AS
BEGIN
	SELECT * FROM inserted--Bu inserted tablosu hazýr bir tablodur.
END;


INSERT INTO TABLOTRIGGER VALUES
(12,'Ayþe',12000,'K');

--------------------------------------

--DDL TRIGGERLARI :
--DDL triggerlarý : CREATE,ALTER,DROP
--Burada bu triggerlarýn sadece belirlenmiþ database' mi 
--yoksa tüm servar için mý geçerli olacaðýnýda söyleyebiliriz.


--Basit bir DDL Trigger Yaratmak :
--Trigger yaratmadan önce tek bir veritabanýna mý yoksa 
--tüm server için mi geçerli olacaðýna karar vermemiz gerekmektedir.
--2 yolu vardýr.

--1.YOL :
--Obj.exp'den veya kod yazarak.
--Eðer veritabaný için bir trigger yaratacaksak,
--seçtiðimiz veritabanýnýn içerisinde  programbility kalsörü içerisinde yer alan 
--sonra Database Triggers folder'ý sað týk ve
--New Database trigger'ý seçebiliriz.

--2.YOL ise sorgu yazarak yaratabiliriz:

CREATE TRIGGER triggeradý
ON DATABASE
FOR CREATE TABLE
AS

BEGIN
	SQL_SORGULARI
END

--Peki server için bir trigger yazarsak nasýl yapacaðýz?
--Soldaki menüde SERVER OBJECTS folder'ý bulunmaktadýr.
--Burada da trigger folder'ý var ancak burada sað týk yeni trigger diyememekteyiz.
--O yüzden sorgu ile yazmamýz gerekmektedir.

--ÖRNEK :
--BÝZ KENDÝ ÖRNEÐÝMÝZDE ORNEKLER VERÝTABANI ÝÇÝN TRIGGER YAZICAZ.VE CREATE TABLE olayý için yazýcaz.
--SYNTAX:

CREATE TRIGGER triggeradý
ON DATABASE
FOR CREATE TABLE
AS

BEGIN
	SQL_SORGULARI
END

--ÖRNEK:

CREATE TRIGGER YENÝTABLOYOK
ON DATABASE
FOR CREATE_TABLE ----Bu trigger sadece Ornekler veritabanýndaki CREATE TABLE durumu için çalýþacak.
AS
BEGIN
	PRINT 'Yeni tablo girmeyelim artýk '
	ROLLBACK
END

--Bu yarattýðýmýz trigger'ý veritabaný içinde programbility içindeki database triggerlarýn altýnda görebiliriz.


--TEST EDELÝM TRIGGER'I :
CREATE TABLE DENEMETRIG
(
ID INT
);


--TRIGGER'I MODFÝYE DEDLÝM :

--CREATE YERNÝE ALTER DÝYECEÐÝZ.

ALTER TRIGGER YENÝTABLOYOK
ON DATABASE
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	PRINT 'CREATE ALTER VE DROP ÝÞLEMLERÝNÝ YAPAMAYIZ '
	ROLLBACK
END

--TEST EDELÝM TRIGGER'I :

DROP TABLE TABLOTRIGGER


--TRIGGERI SÝLME:

--2 Yolu bulunmaktadýr:
--1.YOL		:OBJ.EXP'TEN SÝLMEK.
--2.YOL		:SORGU ÝLE:

DROP TRIGGER YENÝTABLOYOK ON DATABASE;


--DISABLING VE ENABLING TRIGGERS:
--Silmek yerine geçici olarak da disable edebiliriz.
--Gene 2 yolu bulunmaktadýr.
--1.yol:obj.exp'ten trigggerý bulup ve sað týk ve disable'a týklamak.
--2.yol : kod ile

DISABLE TRIGGER YENÝTABLOYOK ON DATABASE

--ENABLE ETMEK ÝÇÝN :
ENABLE TRIGGER YENÝTABLOYOK ON DATABASE

--TÜM TRIGGERLARI DISABLE ETMEK ÝÇÝN :
DISABLE TRIGGER ALL ON DATABASE;
ENABLE TRIGGER ALL ON DATABASE;





--TÜM SERVER ÝÇÝN TRIGGER YAZALIM :
--ÖRNEK:
CREATE TRIGGER TUMSERVER
ON ALL SERVER
FOR CREATE_TABLE,ALTER_TABLE,DROP_TABLE
AS
BEGIN
	PRINT 'Bu serverda iþlem yapýlamaz'
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


--TRIGGERLARIN TETÝKLENME SIRALMASINI DEÐÝÞTÝRMEK :

--( Ýstisna ) -SERVER bazlý triggerlar her zaman 
--database triggerlarýndan önce çalýþýrlar.
--Örneðin ayný durum için birden fazla trigger da yaratabiliriz 
--ve bunlarýn sýrasýný da deðiþtirebiliriz.

--Þimdi 2 trigger yaratalým:

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

--TEST EDELÝM:

CREATE TABLE TABLODENEMESÝ2
(
ID INT
);


--TRIGGER SIRASINI DEÐÝÞTÝRLELÝM :

EXEC sp_settriggerorder BIR,'First','create_table','DATABASE'





--

