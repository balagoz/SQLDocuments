/*



1 - DQL :Select
2 - DDL :Create,Alter,Drop,Truncate
3 - DML :Insert,Update,Delete,Merge
4 - DCL :Grant,Revoke
5 - TCL :Transaction Kavramý ve Commit,Rollback,SavePoint

*/



--- DATA MANUPLATION LANGUAGE ----

--Tabloya kayýt ya da kayýtlarý eklemek için kullanýlýr.



--1:INSERT:
/*
3YOLU VARDIR:


1.YOL:

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

2.YOL:
--Bütün kolon adlarýný sýrasýyla koyacaksak aþaðýdakini kullanabilirz :

INSERT INTO table_name
VALUES (value1, value2, value3, ...);


3.yol : Tüm kolon adlarýný deðil de sadece bazý kolon adlarýnýda kullanabiliriz :

INSERT INTO Customers (Ülke, Þehir)
VALUES ('Türkiye', 'Ýstanbul');


*/


--ÖRNEKLER:


USE Deneme

CREATE TABLE tablodeneme
(
ID INT,
ÝSÝM VARCHAR(50),
SOYAD VARCHAR(50),
Cinsiyet CHAR(1),
Adres VARCHAR(MAX),
Kimlik INT
);

SELECT * FROM Deneme.[dbo].[tablodeneme]

--1.YOL :


INSERT INTO [tablodeneme] (ID,ÝSÝM,SOYAD,Cinsiyet,Adres,Kimlik)
values(1,'onur','okay','e','xxx',123)

--2.YOL :
INSERT INTO [tablodeneme] 
values(2,'murat','yyyy','e','xxx',321)

--3.YOL :
INSERT INTO [tablodeneme] (ID,ÝSÝM,SOYAD)
values(3,'Cem','zzz');



--Birden fazla satýrý ayný anda ekleme:


--1.YOL:
INSERT INTO [tablodeneme] VALUES
(4,'CEM','dddd','e','xxx',321),
(5,'FATMA','eeee','K','xxx',321);

--2.YOL:
INSERT INTO [tablodeneme] VALUES (6,'CAN','FFFF','e','xxx',321);
INSERT INTO [tablodeneme] VALUES (7,'NAZLI','EEEE','K','xxx',321);


--EÐER TABLO YARATIRKEN DEFAULT BAZI DEÐERLER ATADIYSAM AÞAÐÜIDAKÝ ÞEKÝLDE DEFAULYT VALUE ATAYABÝLÝYORUM:

INSERT INTO [tablodeneme] (ID,ÝSÝM,SOYAD,Cinsiyet,Adres,Kimlik)
DEFAULT VALUES;


--SUB SELECT ÝLE TABLOYA VERÝ EKLEME :---
/*

INSERT INTO table
(column1, column2, ... )
SELECT expression1, expression2, ...
FROM source_table
[WHERE conditions];


*/
--Ýlk baþta bazý kolonlarý silelim.

SELECT * FROM Deneme.[dbo].[tablodeneme]



ALTER TABLE [tablodeneme]
DROP COLUMN Cinsiyet;

ALTER TABLE [tablodeneme]
DROP COLUMN Soyad,Adres,Kimlik;

--Ýçerideki verileri de silelim.
TRUNCATE TABLE Deneme.[dbo].[tablodeneme]

SELECT * FROM Deneme.[dbo].[tablodeneme]



--Select etmek için baþka bir tablo buluyorum:
select BusinessEntityID,FirstName from AdventureWorks2019.Person.Person


--Insert edelim

INSERT INTO [tablodeneme]--Sadece iki kolon adýmýz olduðu için kolon eklemedik
select BusinessEntityID,FirstName from AdventureWorks2019.Person.Person

SELECT * FROM [tablodeneme]


TRUNCATE TABLE [tablodeneme]


--DÝÐER ÖRNEK:
--Baþka tablolardan data almak için baþka bir yolda INSERT INTO SELECT kullanmaktýr.
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


DROP TABLE AktarýlanTablo


--Sadece Bazý Verileri Almak için ana tabloda where koþulu kullanabiliriz:

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

Tablodaki kayýt ya da kayýtlarý güncellemek için kullanýlýr.


--The UPDATE statement is used to modify the existing records in a table.

UPDATE Tablo Adý
SET Kolon1 = value1, Kolon2 = value2, ...
WHERE condition;

*/
--Tek bir satýrda Update:
--Öncelikle tabloya veri insert edelim:

SELECT * FROM [dbo].[tablodeneme]

INSERT INTO [tablodeneme]
values
(1,'onur'),
(2,'murat'),
(3,'volkan'),
(4,'kemal'),
(5,'murat');



--Þimdi Update Edelim :
UPDATE [tablodeneme]
SET ÝSÝM  = 'Sena'
WHERE ID = 1;


SELECT * FROM [dbo].[tablodeneme]

--Birden Fazla satýrda Update:

UPDATE [tablodeneme]
SET ÝSÝM  = 'Lale'
WHERE ÝSÝM = 'murat';

SELECT * FROM [tablodeneme]


--UYARI : Update ederken eðer where koþulunu kullanmazsak, tüm kayýtlar UPDATE edilir.


UPDATE [tablodeneme]
SET ÝSÝM ='Onur';

SELECT * FROM [tablodeneme]


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
SET ID = 8,AD = 'ALÝ'
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
SET AD =
(
SELECT FirstName FROM AdventureWorks2019.Person.Person
where BusinessEntityID =1
)
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

--Delete iþlemiyle Tablodan kayýrlarý silinir ancak kapladýðý alan kalýr.


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
WHERE AD = 'MURAT';

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


-- TÜM HERÞEYÝ SÝLMEK ETMEK ÝÇÝN :

--Where koþulu kullanmazsak toblodaki tüm veriler silinir.
--Ancak tablo ve kolon yapýsý bozulmaz.

--It is possible to delete all rows in a table without deleting the table. 
--This means that the table structure, attributes, and indexes will be intact:

--SYNTAX : DELETE FROM table_name;


SELECT * FROM DENEMETABLOSU

DELETE FROM DENEMETABLOSU



---MERGE ----

--UPSERT iþlemi (ekleme veya güncelleme), baþka bir ifadeyle birleþtirme iþlemi yapar.
--Kaynak tablo ve hedef tablo diye 2 tablomuz olsun.
--Ve hedef tablosunu kaynak tabnlosunda verilere dayanarak update etmemiz gerektiðini düþünelim.

--3 tane durumuz vardýr :

--1.DURUM:Kaynak tablosunda olup, hedef tablosunda olmayan veriler.
--Bu durumda kaynak tablosunda olan verileri hedef tablosuna insert etmemiz gerek.

--2.DURUM :Hedef tablosunda olup da kaynak tablosunda olmayan veriler var.
--Bu durmda hedef tablosundaki verileri silmemeiz gerek.

--3.durum: Birde kaynak tablosunda ve hedef tablosunda olan veriler var. Bu veriler birebir ayný olabiliceði gibi
--örneðin sadece kolon adlarý da ayný olabilir ama aldýðý sayýsal deðerler farklý olabilir.

--Bu durumda kaynak tablosundan gelen verilerle hadef tablosunu update etmemiz lazým.
--Özetle;source da olup targetta olmayanlar insert
--Target ta olup source da olmayanlar delete(verilerimizi source tablosyula ayný olmasýný istediðimiz için)
--Eþleþenler de var ise onlarýn da gerekiyorsa deðerleri update edilmeli.
--Böyle bir durumda insert,update ve delete 'i ayrý ayrý kullanabilirz ama uzun sürer.

--O yüzden MERGE ifadesi ni kullanambiliriz. Bu 3 iþlemide ayný anda yapabiliriz.



--KAYNAK TABLOSU :HEDEF TABLOYA AKTARLICAK VEYA UYGULANCAK VERÝ SETÝ.
--HEDEF TABLOSU :DEÐÝÞÝKLÝK YAPIACALK TABLO.


--SYNATX:

MERGE HEDEF USING KAYNAK
ON merge_condition
WHEN MATCHED THEN 
update_statement
WHEN NOT MATCHED BY TARGET THEN 
insert_statement
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;








--ADIMLARIMIZ:
/*

ADIMLARIMIZ :
1.ADIM : hedef ve kaynak tabloalrýný belirle.
2.adým:merge_condition'ý belirle.Join deki gibi.
Yani 2 tablodaki kolonlarýn nasýl eþleþtiðine bakmamýz gerekmektedir.
Genellikle PK ve Unique key kolonlarý kullanýlýr.

--
*/
--ÖRNEK :



USE Deneme
GO

--2 TANE ÖRNEK TABLO YARATALIM :


--Kategori1 tablosu target table olsun.
CREATE TABLE Kategori1 
(
    id INT PRIMARY KEY,
    KategoriAdý VARCHAR(255) NOT NULL,
    Tutar DECIMAL(10,2)
);

--Kategori2 source table olsun.
CREATE TABLE Kategori2 (
    id INT PRIMARY KEY,
    KategoriAdý VARCHAR(255) NOT NULL,
    Tutar DECIMAL(10 , 2 )
);





INSERT INTO Kategori1(id, KategoriAdý, Tutar)
VALUES(1,'A',15000),
    (2,'B',25000),
    (3,'C',13000),
    (4,'D',10000);



INSERT INTO Kategori2(id, KategoriAdý, Tutar)
VALUES(1,'A',15000),
    (3,'C',13000),
    (4,'D',20000),
    (5,'E',10000),
    (6,'F',10000);



SELECT * FROM Kategori2 -- KAYNAK TABLO --1,3,4,5,6

SELECT * FROM Kategori1 --HEDEF TABLO --1,2,3,4 var ama mergeden sonra 2 olmayacak.

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

--MERGE Ýþlemi sonucunda Hedef Tablosu :

---------------------------------------------

--BASÝT ÖRNEK :

--2 TANE TABLO YARATALIM :

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



