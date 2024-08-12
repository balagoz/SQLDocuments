




/*
Kýsa Geçeceðiz...Detaylarýný kursun sonlarýnda iþleyeceðiz....



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













--- DATA MANUPLATION LANGUAGE ----

--1:INSERT:
/*
3YOLU VARDIR:


1.YOL:

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

2.YOL:
--Bütün kolon adlarýný sýrasuyla koyacaksak kullanabilirz aþaðýdakini:
INSERT INTO table_name
VALUES (value1, value2, value3, ...);


3.yol : Tüm kolon adlarýný deðil de sadece bazý kolon adlarýný koyacaksak:


*/

--ÖRNEKLER:

SELECT * FROM [dbo].[tablodeneme]

--1.YOL :
INSERT INTO [tablodeneme] (ID,ÝSÝM,SOYAD,Cinsiyet,Adres,Kimlik)
values(1,'onur','okay','e','xxx',123)

--2.YOL :
INSERT INTO [tablodeneme] 
values(2,'murat','yyyy','e','xxx',321)

--3.YOL :
INSERT INTO [tablodeneme] (ID,ÝSÝM,SOYAD)
values(3,'mehmet','zzz');

--Birden fazla satýr ayný anda ekleme:
--1.YOL:
INSERT INTO [tablodeneme] VALUES
(4,'CEM','dddd','e','xxx',321),
(5,'FATMA','eeee','K','xxx',321);

--2.YOL:
INSERT INTO [tablodeneme] VALUES (6,'CAN','FFFF','e','xxx',321);
INSERT INTO [tablodeneme] VALUES (7,'NAZLI','EEEE','K','xxx',321);

--EÐER TABLO YARATIRKEN DEFAULT BAZI DEÐERLER ATADIYSAM AÞAÐÜIDAKÝ ÞEKÝ,LDE DEFAULYT VALUE ATAYABÝLÝYORUM:
INSERT INTO [tablodeneme] (ID,ÝSÝM,SOYAD,Cinsiyet,Adres,Kimlik)
DEFAULT VALUES;

--SUB SELECT ÝLE TABLYA VERÝ EKLEME :---
/*
INSERT INTO table
(column1, column2, ... )
SELECT expression1, expression2, ...
FROM source_table
[WHERE conditions];

*/
select * from [tablodeneme]

ALTER TABLE [tablodeneme]
DROP COLUMN Cinsiyet;

ALTER TABLE [tablodeneme]
DROP COLUMN Soyad,Adres,Kimlik;

--Select etmek için baþka bir tablo buluyorum:
select BusinessEntityID,FirstName from AdventureWorks2019.Person.Person


--Insert edelim
INSERT INTO [tablodeneme]
select BusinessEntityID,FirstName from AdventureWorks2019.Person.Person

SELECT * FROM [tablodeneme]


--INSERT INTO SELECT:
--Baþka tablolardan data almak için baþka bir yolda INSERT INTO SELECT.

--Normal bir tabla yaratalým.Tüm verileri almak için :

CREATE TABLE AktarýlanTablo (
ADRESID INT,
Sehir varchar(max)
);


SELECT * FROM AktarýlanTablo

SELECT * FROM AdventureWorks2019.[Person].[Address]

INSERT INTO AktarýlanTablo (ADRESID,Sehir)
SELECT
AddressID,
City
FROM AdventureWorks2019.[Person].[Address]



--BAZI Verileri ALmak için :

SELECT * FROM AktarýlanTablo

SELECT * FROM AdventureWorks2019.[Person].[Address]

INSERT INTO AktarýlanTablo (ADRESID,Sehir)
SELECT
AddressID,
City
FROM AdventureWorks2019.[Person].[Address]
WHERE City = 'Bothell';











--2:UPDATE:
/*
--The UPDATE statement is used to modify the existing records in a table.

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

*/
--Tek bir satýrda Update:

UPDATE [tablodeneme]
SET ÝSÝM  = 'Sena'
WHERE ID = 1;


--Birden Fazla satýrda Update:

UPDATE [tablodeneme]
SET ÝSÝM  = 'Lale'
WHERE ÝSÝM = 'KÝM';

SELECT * FROM [tablodeneme]

--UYARI : Update ederken eðer where koþulunu kullanmazsak, tüm kayýtlar uPDATE EDÝLÝR.

UPDATE [tablodeneme]
SET ÝSÝM ='MERT';


-- Birden Fazla Kolonu UPDATE ETME:
--SYNTAX:
/*
UPDATE table
SET column1 = expression1,
    column2 = expression2,
    ...
[WHERE conditions];
*/

SELECT * FROM DENEMETABLOSU

CREATE TABLE DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);

INSERT INTO  DENEMETABLOSU VALUES
(1,'ONUR','OKAY'),
(2,'MURAT','SSS'),
(3,'AYÞE','DDD'),
(4,'FATMA','RRR'),
(5,'CEM','MMM');



UPDATE DENEMETABLOSU
SET ID = 8,
    AD = 'ALÝ'
WHERE SOYAD = 'OKAY';


--Bir tablo kullanarak Update ETMEK:

/*
UPDATE table1
SET column1 = (SELECT expression1
               FROM table2
               WHERE conditions)
[WHERE conditions];
*/

SELECT * FROM DENEMETABLOSU

UPDATE DENEMETABLOSU
SET AD =(
SELECT FirstName FROM AdventureWorks2019.Person.Person
where BusinessEntityID =1)
WHERE ID = 8;


--Bir tablo kullanarak Update ETMEK - JOIN:
/*

SYNTAX :
UPDATE table1
SET table1.column = table2.expression1
FROM table1
INNER JOIN table2
ON (table1.column1 = table2.column1)
[WHERE conditions];


*/

SELECT * FROM DENEMETABLOSU


(SELECT FirstName FROM AdventureWorks2019.Person.Person
where BusinessEntityID =8)

UPDATE DENEMETABLOSU
SET DENEMETABLOSU.AD =AdventureWorks2019.Person.Person.FirstName
FROM DENEMETABLOSU
INNER JOIN
AdventureWorks2019.Person.Person
ON DENEMETABLOSU.ID = AdventureWorks2019.Person.Person.BusinessEntityID
WHERE ID = 8;

---DELETE :
/*
--The DELETE statement is used to delete existing records in a table.
SYNTAX:
DELETE FROM table_name WHERE condition;

--Ayrýca FK kýsýtý tarafýndan referans gösterilen PK tablosunda verileri silmek istersekde DELETE kullanmak zorundayýz.
--TRUNCATE kullanamayýz.

--
*/

--TEK BÝR KOÞUL KULLANRAK:
SELECT * FROM DENEMETABLOSU

DELETE FROM DENEMETABLOSU
WHERE AD = 'Diane';

--iki KOÞUL KULLANRAK:
DELETE FROM DENEMETABLOSU
WHERE ID = 2 AND AD = 'Murat';

--Top ifadesi Kullanarak :
--This SQL Server DELETE example would delete the first 3 records from the employees table where the last_name is 'Johnson'. 
--If there are other records in the employees table that have a last_name value of 'Johnson', they will be unaffected by the DELETE statement.
DELETE TOP(1)
FROM DENEMETABLOSU
WHERE ID = 3;

--EXISTS Clause Kullanarak:
DELETE FROM DENEMETABLOSU
WHERE EXISTS
  ( SELECT *
    FROM AdventureWorks2019.Person.Person
    WHERE DENEMETABLOSU.ID = AdventureWorks2019.Person.Person.BusinessEntityID
    AND AdventureWorks2019.Person.Person.BusinessEntityID < 6 );


-- TÜM HERÞEYÝ DELETE ETMEKL ÝÇÝN :
--It is possible to delete all rows in a table without deleting the table. 
--This means that the table structure, attributes, and indexes will be intact:
--SYNTAX : DELETE FROM table_name;


SELECT * FROM DENEMETABLOSU

DELETE FROM DENEMETABLOSU



---MERGE ----

--Kaynak tablo ve hedef tablo diye 2 tablomuz olsun.
--Ve hedef tablosunu kaynak tabnlosunda verilere dayanarak update etmemiz gerek.
--3 tane durum var :
--1.DURUM:Kaynak tablosunda olup, hedef tablosunda olmayan veriler.
--Bu durumda kaynak tablosunda olan verileri gedef tablosuna insert etmemiz gerek.
--2.DURUM :Hedef tablosunda olup da kaynak tablosunda olmayan veriler var.
--BNu durmda hedef tablosundaki verileri silmemeiz gerek.
--3.durum: Birde kaynak tablosunda ve hedef tablosunda olan veriler var. Bu veriler birebir ayný olabiliceði gibi
--örneðinm sadece kolon adlarý da ayný olabilir ama aldýðý sayýsal deðerler farklý olabilir.
--Bu durumda kaynak tablosundan gelen verilerle hadef tablosunu update etmemiz lazým.
--Özetle;source da olup targetta olmayanlar insert
--Target ta olup source da olmayanlar delete(verilerimizi source tablosyula ayný olasýný istediðimiz için)
--Eþleþenler de var ise onlarýn da gerekiyorsa deðerleri update edilmeli.
--Böyle bir durumda insert,update ve delete 'i ayrý ayrý kullanabilirz ama uzun sürer.
--O yüzden MERGE ifadesi ni kullanambiliriz. Bu 3 iþlemide ayný anda yapabilirzi.
--HEDEF TABLOSU :DEÐÝÞÝKLÝK YAPIACALK TABLO
--KAYNAK TABLOSU :HEDEF TABLOYA AKTARLICAK VEYA UYGULANCAK VERÝ SETÝ.
--SYNATX:

MERGE HEDEF USING KAYNAK
ON merge_condition
WHEN MATCHED THEN 
update_statement
WHEN NOT MATCHED BY TARGET THEN 
insert_statement
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;








--ADIMLAR:
/*
1.ADIM : hedef ve kaynak tanbloalrýný belirle.
2.adým:merge_condition'ý belirle.Join deki gibi.
--Yani 2 tablodaki kolonlarýn nasýl eþleþtiðine bakmamýz lazým.Genellikle PK ve Unique key kolonlarý kullanýlýr.
--
*/
--ÖRNEK :



USE Deneme
GO
CREATE TABLE Kategori1 
(
    id INT PRIMARY KEY,
    KategoriAdý VARCHAR(255) NOT NULL,
    Tutar DECIMAL(10,2)
);

--Kategori tablus target table olsun.
INSERT INTO Kategori1(id, KategoriAdý, Tutar)
VALUES(1,'A',15000),
    (2,'B',25000),
    (3,'C',13000),
    (4,'D',10000);

--Kategori2 source table olsun.
CREATE TABLE Kategori2 (
    id INT PRIMARY KEY,
    KategoriAdý VARCHAR(255) NOT NULL,
    Tutar DECIMAL(10 , 2 )
);


INSERT INTO Kategori2(id, KategoriAdý, Tutar)
VALUES(1,'A',15000),
    (3,'C',13000),
    (4,'D',20000),
    (5,'E',10000),
    (6,'F',10000);



SELECT * FROM Kategori2 -- KAYNAK TABLO --1,3,4,5,6

SELECT * FROM Kategori1 --HEDEF TABLO --1,2,3,4 vardý ama mergeden sonra 2 yok.

--Hedef tabloyu,kaynak tablodaki verilerle güncelleyeceðiz.


MERGE Kategori1 t 
    USING Kategori2 s
ON (s.id = t.id)
WHEN MATCHED THEN 
UPDATE SET 
        t.KategoriAdý = s.KategoriAdý,
		t.Tutar = s.Tutar

WHEN NOT MATCHED BY TARGET THEN 
INSERT (id, KategoriAdý, Tutar) VALUES (s.id, s.KategoriAdý, s.Tutar)
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;



--BASÝT ÖRNEK :
CREATE TABLE Kaynak
(
ID INT,
AD VARCHAR(30)
);



CREATE TABLE HEDEF
(
ID INT,
AD VARCHAR(30)
);

INSERT INTO Kaynak VALUES
(1,'Onur'),
(2,'Cem');


INSERT INTO Hedef VALUES
(1,'Onur'),
(2,'Kemal');

SELECT * FROM Kaynak

SELECT * FROM Hedef


MERGE Hedef AS T
USING Kaynak AS S
ON T.ID = S.ID
WHEN MATCHED THEN
	UPDATE SET T.AD = S.AD
WHEN NOT MATCHED BY TARGET
THEN INSERT (ID, AD)
       VALUES (s.ID, s.AD)
WHEN NOT MATCHED BY SOURCE 
    THEN DELETE;



