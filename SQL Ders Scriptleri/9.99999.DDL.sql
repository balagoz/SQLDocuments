/*



1 - DQL :Select
2 - DDL :Create,Alter,Drop,Truncate
3 - DML :Insert,Update,Delete,Merge
4 - DCL :Grant,Revoke
5 - TCL :Transaction Kavram� ve Commit,Rollback,SavePoint

*/




------USE VE GO �FADELERE�N� ----

--GO :

--SQL ifadelerinin bir b�t�n halinde �al��malar�n� istiyorsak kullanmal�y�z.
--Go ifadesi genelde create,alter ifadelerinde kullan�rl�r.
--Go bir batch ayrac�d�r.
--GO ile sql ifadesini bir b�t�n olarak g�nderebilriz.


--A�a��daki gibi bir �rnek d���nelim : A�a��daki �rnek hata verir.��nk� GO ayrac� kullan�lmam��t�r.
--A�a��da 2 ayr� batch olmal�d�r.Bu y�zden GO �fadesini kullanmal�y�z.

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





--A�a��daki ifade kal�b�da GO kullan�lmadan hata verecektir.



ALTER TABLE tabload�
ADD clo2 �nt
Select col2 from tabload�


--�rnek :
--A�A�IDA HATA ALIRIZ..
ALTER TABLE DDLTABLO
ADD YAS INT
Select YAS from DDLTABLO

--Do�rusu :

ALTER TABLE DDLTABLO
ADD YAS INT
GO
Select YAS from DDLTABLO


--Veritaban� se�me men�den ve USE ifadesi kullanarak...




---- DATA def�n�ton language BA�LANGI�  -----

--Bu mavi ile yaz�l� olanlar SQL keywordleri.
--Bunlar� de�i�ken ad�,tablo,view,fonks ad� yapmamakta fayda var.
--Create,Alter,Drop,Truncate

--CREATE database �rnek :
--Herhangibirdatabase sa� t�k,new database ile de yaratabiliriz.

CREATE DATABASE Deneme;

--SYNTAX :CREATE DATABASE databasename;
CREATE DATABASE Deneme




--DROP database �rnek :
--Veya aray�zden yapabiliriz.
--Drop etti�imiz database'i kullan�yor olmamam�z laz�m.Ba�kas� kullnar�ken  silemem.
--SYNTAX :DROP DATABASE databasename;
--veya SYNTAX : DROP DATABASE [IF EXISTS] databasename1,databasename2,

DROP DATABASE Deneme;


--Rename a database:
	--Gene 3 yolu var : Gui ( Graphical User Interface )�zerinden(database sa�t�k rename), ve sorgu yazarak.Birde exex sp_renameDB 'Eski Ad','Yeni Ad'
	--SYNTAX :ALTER DATABASE Eski AD Modify Name Yeni AD:
	ALTER DATABASE Deneme Modify Name = Deneme1

	exec sp_renameDB 'Deneme1','Deneme'

	

--Create Table �rnek

--syntax:GEL��M�� SYNTAX
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

--1.Y�NTEM :
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

--2.Y�NTEM :

USE Deneme
CREATE TABLE Deneme.dbo.DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);



--DROP Table �rnek:
--SYNTAX :DROP TABLE table_name;
--Geni�letilmi� syntax: DROP TABLE [�f ex�sts][Database Name].[Schema Name]. table_name;
--2 tabloyu da ayn� anda silebiliriz. DROP TABLE table1,table2;
--PK ve FK ili�kisi olan 2 tablomuz olsun.Biz e�er PK tablosunu silmeye kalkarsak,
--��nk� SQL FK constarinti taraf�ndan referans g�sterilen bir tablyu silmemize izin vermez.
--Tablyu silebilmemiz i�in ilk �nce FK constrainti silmemiz veya FK tablosunun tamam�n� silememiz laz�m.


DROP TABLE DENEMETABLOSU;


--- CREATE SCHEMA :
--SQL'de baz� haz�r �emalar vard�r.dbo,guest,sys,INFORMATION_SCHEMA gibi.Burada SYS VE �nformato�n schema ahz�e sistem objectliri i�indir
--ve onlar� silemeyiz
--SYNTAX :CREATE SCHEMA schema_name

--�RNEK :
USE Deneme
go
CREATE SCHEMA Urunler;

--�emada tablo yaratmak :
--Ba�ka bir databasedeyken a�a��daki gibi Deneme veritaban�ndaki �r�nler �emas�nda tablo yaratabiliriz.

CREATE TABLE Deneme.Urunler.Sat�lanUrunler
(
    Urun_id INT PRIMARY KEY IDENTITY,
    Musteri_id INT NOT NULL,
	Musteri_Ad varchar(max)
);

SELECT * FROM Deneme.Urunler.Sat�lanUrunler




--SELECT INTO ile Tablo Yaratma :

--Tablo kopyalamak i�in kullan�rl�r genelde.
--
/*
--A���da marketing �emas�  alt�nda customers diye bir tablo yarat�l�r sonra da
-- sales.customers tablosundaki t�m verileri customers tabl�osuna aktar�r.

SELECT 
    *
INTO 
    marketing.customers
FROM 
    sales.customers;
*/

--�lk ba�ta Urunler diye bir �ema olu�turup ondan sonra a�a��dakini �al��t�rabiliriz.
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

--UrunlerTABLOSUNU �emaya ald�k.NORMALDE �EMADA DE��LD�.
--Dikkat edilmesi gereken nokta �u : Mevcutta eski tablo ad�na g�re baz� �eyler yapt�ysak,
--referans edilen bir �ey varsa yeni tablo ad�na g�re manuel olarak d�zeltmemiz gerekiyor.
--if you move a table that is referenced in a stored procedure, 
--you must modify the stored procedure to reflect the new schema name.

--�lk ba�ta �ema olmadan Deneme veritaban�nda bir tablo yarat�yoruz.
USE Deneme
CREATE TABLE Deneme.dbo.DENEMETABLOSU
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50)
);

--Daha sonrada �ema olmadan yaratt���m�z bu tabloyu Urunler �emas�na alaca��z.

ALTER SCHEMA Urunler
TRANSFER OBJECT::[dbo].[DENEMETABLOSU]; 


---DROP SCHEMA :
--SYNTAX : DROP SCHEMA [IF EXISTS] schema_name;
--use the IF EXISTS option to conditionally remove the schema only if the schema exists. 
--Attempting to drop a nonexisting schema without the IF EXISTS option will result in an error.

--Silmek istedi�imiz �emada mevcutta tablo varsa bize error verecek.Dolay�syla ilk ba�ta tablonun drop edilmesi
--sonra �eman�n drop edilmesi gerekmetedir.

DROP SCHEMA Urunler


--Men�den Tablo olu�turma :
--Tables>>New>>Table>> S�tunlar� olu�turduktan sora,saveliyoruz, tabloya isim veriyoruz ve kapat�yoruz.
--Tablo yarat�rken pk ve auto increment verelim.ve Men�den yaratt���m�z tablonun �zerine gelip,"Edit TOP 200 rows"dan
--tablomuza veri girelim.
--Tabloya sa� t�klay�p,DESIGN k�sm�ndan veri tiplerini vs de�i�tirebiliriz.

SELECT * FROM dbo.Men�tablo


--Men�den tablomuza veri girilece�ini g�rd�k.�imdide sorgu yazarak tablomuza veri girelim.
--�lk �nce tablodaki verileri silmemiz laz�m TRUNCATE ifadesi ile.

TRUNCATE TABLE dbo.Men�tablo


INSERT INTO dbo.Men�tablo
VALUES
('Onur','Okay','E'),
('Fatma','Demir','K');

DROP TABLE dbo.Men�tablo

---- ALTER TABLE ----
--Alter ifadesi,Veritaban� nesnelerinin yap�s�n� de�i�tirmek i�in kullan�l�r.


--1: ALTER TABLE - ADD Column
/*

SYNTAX :ALTER TABLE table_name
		ADD column_name datatype;
		      veya
Birden �ok kolon eklemek i�in:		

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

Tablomuzdaki kolonda �rne�in chechk constraint varsa kolonu drop edemeyiz.
--�nce constrainti kald�rmam gerekiyor.
--Ayr�ca SQL, PK veya FK olan bir kolonu drop etmemize de m�sade etmez.


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


sp_rename 'DENEMETABLOSU.AD','�S�M','COLUMN';



--4: Rename table :
/*
sp_rename 'old_table_name', 'new_table_name';

*/

sp_rename 'DENEMETABLOSU','tablodeneme';

--Art�k DENEMETABLOSU'nun ad� tablodeneme oldu.

SELECT * FROM tablodeneme



---COMPUTED COLUMNS
--Tabloda di�er kolonlar� baz alarak hesaplama yapabilen veye di�er metinsel i�lemleri yapabilen kolonlarda
--olu�turabiliriz.

--�RNEK :
Use Deneme
CREATE TABLE COMPUTED
(
	Say�1 INT,
	Say�2 INT,
	Sonuc AS (Say�1 + Say�2)

);

SELECT * FROM COMPUTED

--Art�k burada Sonuc kolonuna elle bir de�er giremeyiz.

INSERT INTO COMPUTED values
(1,2);

select * from COMPUTED

DROP TABLE COMPUTED


--ALTER �LE COMPUTED CLOUMNS:
CREATE TABLE COMPUTEDMET�N
(
	AD VARCHAR(MAX),
	SOYAD VARCHAR(MAX)
);



INSERT INTO COMPUTEDMET�N values
('Onur','Okay');

SELECT * FROM COMPUTEDMET�N


ALTER TABLE COMPUTEDMET�N
ADD Birlesik_�sim AS (AD + ' ' + SOYAD)

SELECT * FROM COMPUTEDMET�N


---- TRUNCATE TABLE ----
--Truncate ifadesi de delete gibi rollback edilebilir.
--DROP TABLE t�m tabloyu siler.Veri ve yap�s�yla birlikte.
--Truncate ifadesi ise, sadece i�erideki datay� siler.Tablonun kendisini silmez.
--Where �art� olmadan ki DELETE ifadesi gibi �al���r.
--FK taraf�ndan referans g�sterilmi� bir tabloyu turncate edemeyiz.
--Tab�lyu truncate edersek, tablo i�in belirledi�imiz identity increment �zelli�i resetlenir.
--Ama bu durum DELETE ifadesinde olmaz.
--T�m tabloyu silmektense, truncate etmek daha kolayd�r.
--Delete verileri silerken sat�r sat�r siler ve bu da perfromans a��s�ndan zaman al�r.
--FK taraf�ndan referesns edilmi� bir tabloyu silmeye �al���rken truncate i kullanamay�z.Delete kullanabiliriz.


/*
The TRUNCATE TABLE command deletes the data inside a table, but not the table itself.
SYNTAX :TRUNCATE TABLE Categories;
*/

--Truncate etmeden �nde veri girelim.
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

---- DATA def�n�ton language B�T��  -----






