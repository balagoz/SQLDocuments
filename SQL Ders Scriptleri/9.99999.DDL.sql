/*



1 - DQL :Select
2 - DDL :Create,Alter,Drop,Truncate
3 - DML :Insert,Update,Delete,Merge
4 - DCL :Grant,Revoke
5 - TCL :Transaction Kavramý ve Commit,Rollback,SavePoint

*/




------USE VE GO ÝFADELEREÝNÝ ----

--GO :

--SQL ifadelerinin bir bütün halinde çalýþmalarýný istiyorsak kullanmalýyýz.
--Go ifadesi genelde create,alter ifadelerinde kullanýrlýr.
--Go bir batch ayracýdýr.
--GO ile sql ifadesini bir bütün olarak gönderebilriz.


--Aþaðýdaki gibi bir örnek düþünelim : Aþaðýdaki örnek hata verir.Çünkü GO ayracý kullanýlmamýþtýr.
--Aþaðýda 2 ayrý batch olmalýdýr.Bu yüzden GO Ýfadesini kullanmalýyýz.

CREATE DATABASE DDL
GO
USE DDL
GO
CREATE TABLE DDLTABLO
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);





--Aþaðýdaki ifade kalýbýda GO kullanýlmadan hata verecektir.



ALTER TABLE tabloadý
ADD clo2 ýnt
Select col2 from tabloadý


--Örnek :
--AÞAÐIDA HATA ALIRIZ..
ALTER TABLE DDLTABLO
ADD YAS INT
Select YAS from DDLTABLO

--Doðrusu :

ALTER TABLE DDLTABLO
ADD YAS INT
GO
Select YAS from DDLTABLO


--Veritabaný seçme menüden ve USE ifadesi kullanarak...




---- DATA defýnýton language BAÞLANGIÇ  -----

--Bu mavi ile yazýlý olanlar SQL keywordleri.
--Bunlarý deðiþken adý,tablo,view,fonks adý yapmamakta fayda var.
--Create,Alter,Drop,Truncate

--CREATE database örnek :
--Herhangibirdatabase sað týk,new database ile de yaratabiliriz.

CREATE DATABASE Deneme;

--SYNTAX :CREATE DATABASE databasename;
CREATE DATABASE Deneme




--DROP database örnek :
--Veya arayüzden yapabiliriz.
--Drop ettiðimiz database'i kullanýyor olmamamýz lazým.Baþkasý kullnarýken  silemem.
--SYNTAX :DROP DATABASE databasename;
--veya SYNTAX : DROP DATABASE [IF EXISTS] databasename1,databasename2,

DROP DATABASE Deneme;


--Rename a database:
	--Gene 3 yolu var : Gui ( Graphical User Interface )üzerinden(database saðtýk rename), ve sorgu yazarak.Birde exex sp_renameDB 'Eski Ad','Yeni Ad'
	--SYNTAX :ALTER DATABASE Eski AD Modify Name Yeni AD:
	ALTER DATABASE Deneme Modify Name = Deneme1

	exec sp_renameDB 'Deneme1','Deneme'

	

--Create Table örnek

--syntax:GELÝÞMÝÞ SYNTAX
/*
CREATE TABLE [database_name.][schema_name.]table_name 
(
    pk_column data_type PRIMARY KEY,
    column_1 data_type NOT NULL,
    column_2 data_type,
    ...,
    table_constraints
);

*/


/*
CREATE TABLE table_name 
(
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
*/

--1.YÖNTEM :
CREATE DATABASE Deneme
USE Deneme
CREATE TABLE DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);

SELECT * FROM DENEMETABLOSU
SELECT * FROM dbo.DENEMETABLOSU

--2.YÖNTEM :

USE Deneme
CREATE TABLE Deneme.dbo.DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);



--DROP Table örnek:
--SYNTAX :DROP TABLE table_name;
--Geniþletilmiþ syntax: DROP TABLE [ýf exýsts][Database Name].[Schema Name]. table_name;
--2 tabloyu da ayný anda silebiliriz. DROP TABLE table1,table2;
--PK ve FK iliþkisi olan 2 tablomuz olsun.Biz eðer PK tablosunu silmeye kalkarsak,
--çünkü SQL FK constarinti tarafýndan referans gösterilen bir tablyu silmemize izin vermez.
--Tablyu silebilmemiz için ilk önce FK constrainti silmemiz veya FK tablosunun tamamýný silememiz lazým.


DROP TABLE DENEMETABLOSU;


--- CREATE SCHEMA :
--SQL'de bazý hazýr þemalar vardýr.dbo,guest,sys,INFORMATION_SCHEMA gibi.Burada SYS VE ýnformatoýn schema ahzýe sistem objectliri içindir
--ve onlarý silemeyiz
--SYNTAX :CREATE SCHEMA schema_name

--ÖRNEK :
USE Deneme
go
CREATE SCHEMA Urunler;

--þemada tablo yaratmak :
--Baþka bir databasedeyken aþaðýdaki gibi Deneme veritabanýndaki Ürünler þemasýnda tablo yaratabiliriz.

CREATE TABLE Deneme.Urunler.SatýlanUrunler
(
    Urun_id INT PRIMARY KEY IDENTITY,
    Musteri_id INT NOT NULL,
	Musteri_Ad varchar(max)
);

SELECT * FROM Deneme.Urunler.SatýlanUrunler




--SELECT INTO ile Tablo Yaratma :

--Tablo kopyalamak için kullanýrlýr genelde.
--
/*
--Aþðýda marketing þemasý  altýnda customers diye bir tablo yaratýlýr sonra da
-- sales.customers tablosundaki tüm verileri customers tablþosuna aktarýr.

SELECT 
    *
INTO 
    marketing.customers
FROM 
    sales.customers;
*/

--Ýlk baþta Urunler diye bir þema oluþturup ondan sonra aþaðýdakini çalýþtýrabiliriz.
Use Deneme
select
*
INTO
Deneme.Urunler.Urunler
FROM
AdventureWorks2019.Production.Product


SELECT * FROM Deneme.Urunler.Urunler



SELECT * FROM AdventureWorks2019.Production.Product





---ALTER SCHEMA -----0

--
/*
SYNTAX:
	ALTER SCHEMA target_schema_name   
    TRANSFER [ entity_type :: ] securable_name;
*/

--UrunlerTABLOSUNU þemaya aldýk.NORMALDE ÞEMADA DEÐÝLDÝ.
--Dikkat edilmesi gereken nokta þu : Mevcutta eski tablo adýna göre bazý þeyler yaptýysak,
--referans edilen bir þey varsa yeni tablo adýna göre manuel olarak düzeltmemiz gerekiyor.
--if you move a table that is referenced in a stored procedure, 
--you must modify the stored procedure to reflect the new schema name.

--Ýlk baþta þema olmadan Deneme veritabanýnda bir tablo yaratýyoruz.
USE Deneme
CREATE TABLE Deneme.dbo.DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);

--Daha sonrada þema olmadan yarattýðýmýz bu tabloyu Urunler þemasýna alacaðýz.

ALTER SCHEMA Urunler
TRANSFER OBJECT::[dbo].[DENEMETABLOSU]; 


---DROP SCHEMA :
--SYNTAX : DROP SCHEMA [IF EXISTS] schema_name;
--use the IF EXISTS option to conditionally remove the schema only if the schema exists. 
--Attempting to drop a nonexisting schema without the IF EXISTS option will result in an error.

--Silmek istediðimiz þemada mevcutta tablo varsa bize error verecek.Dolayýsyla ilk baþta tablonun drop edilmesi
--sonra þemanýn drop edilmesi gerekmetedir.

DROP SCHEMA Urunler


--Menüden Tablo oluþturma :
--Tables>>New>>Table>> Sütunlarý oluþturduktan sora,saveliyoruz, tabloya isim veriyoruz ve kapatýyoruz.
--Tablo yaratýrken pk ve auto increment verelim.ve Menüden yarattýðýmýz tablonun üzerine gelip,"Edit TOP 200 rows"dan
--tablomuza veri girelim.
--Tabloya sað týklayýp,DESIGN kýsmýndan veri tiplerini vs deðiþtirebiliriz.

SELECT * FROM dbo.Menütablo


--Menüden tablomuza veri girileceðini gördük.Þimdide sorgu yazarak tablomuza veri girelim.
--Ýlk önce tablodaki verileri silmemiz lazým TRUNCATE ifadesi ile.

TRUNCATE TABLE dbo.Menütablo


INSERT INTO dbo.Menütablo
VALUES
('Onur','Okay','E'),
('Fatma','Demir','K');

DROP TABLE dbo.Menütablo

---- ALTER TABLE ----
--Alter ifadesi,Veritabaný nesnelerinin yapýsýný deðiþtirmek için kullanýlýr.


--1: ALTER TABLE - ADD Column
/*

SYNTAX :ALTER TABLE table_name
		ADD column_name datatype;
		      veya
Birden çok kolon eklemek için:		

		ALTER TABLE table_name
		ADD column_1 column_definition,
		column_2 column_definition,
		...
		column_n column_definition;

*/

USE Deneme
CREATE TABLE DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);

SELECT * FROM DENEMETABLOSU


ALTER TABLE DENEMETABLOSU
ADD Cinsiyet VARCHAR(50);

SELECT * FROM DENEMETABLOSU


alter table DENEMETABLOSU
ADD Adres VARCHAR(50),
	Kimlik INT;

SELECT * FROM DENEMETABLOSU



--2: ALTER TABLE - DROP COLUMN
/*

SYNTAX :ALTER TABLE table_name
		DROP COLUMN column_name;

Tablomuzdaki kolonda örneðin chechk constraint varsa kolonu drop edemeyiz.
--Önce constrainti kaldýrmam gerekiyor.
--Ayrýca SQL, PK veya FK olan bir kolonu drop etmemize de müsade etmez.


*/

ALTER TABLE DENEMETABLOSU
DROP COLUMN Cinsiyet ;

SELECT * FROM DENEMETABLOSU


--3: ALTER TABLE - ALTER/MODIFY COLUMN
/*

SYNTAX :	ALTER TABLE table_name
			ALTER COLUMN column_name datatype;

To change the data type of a column in a table, use the following syntax:

*/

ALTER TABLE DENEMETABLOSU
ALTER COLUMN AD CHAR(10);


--4: RENAME A COLUMN:
/*

sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';

*/


SELECT * FROM DENEMETABLOSU


sp_rename 'DENEMETABLOSU.AD','ÝSÝM','COLUMN';



--4: Rename table :
/*
sp_rename 'old_table_name', 'new_table_name';

*/

sp_rename 'DENEMETABLOSU','tablodeneme';

--Artýk DENEMETABLOSU'nun adý tablodeneme oldu.

SELECT * FROM tablodeneme



---COMPUTED COLUMNS
--Tabloda diðer kolonlarý baz alarak hesaplama yapabilen veye diðer metinsel iþlemleri yapabilen kolonlarda
--oluþturabiliriz.

--ÖRNEK :
Use Deneme
CREATE TABLE COMPUTED
(
	Sayý1 INT,
	Sayý2 INT,
	Sonuc AS (Sayý1 + Sayý2)

);

SELECT * FROM COMPUTED

--Artýk burada Sonuc kolonuna elle bir deðer giremeyiz.

INSERT INTO COMPUTED values
(1,2);

select * from COMPUTED

DROP TABLE COMPUTED


--ALTER ÝLE COMPUTED CLOUMNS:
CREATE TABLE COMPUTEDMETÝN
(
	AD VARCHAR(MAX),
	SOYAD VARCHAR(MAX)
);



INSERT INTO COMPUTEDMETÝN values
('Onur','Okay');

SELECT * FROM COMPUTEDMETÝN


ALTER TABLE COMPUTEDMETÝN
ADD Birlesik_Ýsim AS (AD + ' ' + SOYAD)

SELECT * FROM COMPUTEDMETÝN


---- TRUNCATE TABLE ----
--Truncate ifadesi de delete gibi rollback edilebilir.
--DROP TABLE tüm tabloyu siler.Veri ve yapýsýyla birlikte.
--Truncate ifadesi ise, sadece içerideki datayý siler.Tablonun kendisini silmez.
--Where þartý olmadan ki DELETE ifadesi gibi çalýþýr.
--FK tarafýndan referans gösterilmiþ bir tabloyu turncate edemeyiz.
--Tabþlyu truncate edersek, tablo için belirlediðimiz identity increment özelliði resetlenir.
--Ama bu durum DELETE ifadesinde olmaz.
--Tüm tabloyu silmektense, truncate etmek daha kolaydýr.
--Delete verileri silerken satýr satýr siler ve bu da perfromans açýsýndan zaman alýr.
--FK tarafýndan referesns edilmiþ bir tabloyu silmeye çalýþýrken truncate i kullanamayýz.Delete kullanabiliriz.


/*
The TRUNCATE TABLE command deletes the data inside a table, but not the table itself.
SYNTAX :TRUNCATE TABLE Categories;
*/

--Truncate etmeden önde veri girelim.
Use Deneme
CREATE TABLE Tablodeneme
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50),
Cinsiyet char(1)
);


SELECT * FROM Tablodeneme

INSERT INTO Tablodeneme VALUES
(1,'Onur','Okay','E')

TRUNCATE TABLE tablodeneme

---- DATA defýnýton language BÝTÝÞ  -----






