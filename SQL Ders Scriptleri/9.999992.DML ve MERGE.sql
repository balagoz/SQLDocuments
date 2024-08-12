/*



1 - DQL :Select
2 - DDL :Create,Alter,Drop,Truncate
3 - DML :Insert,Update,Delete,Merge
4 - DCL :Grant,Revoke
5 - TCL :Transaction Kavram� ve Commit,Rollback,SavePoint

*/



--- DATA MANUPLATION LANGUAGE ----

--Tabloya kay�t ya da kay�tlar� eklemek i�in kullan�l�r.



--1:INSERT:
/*
3YOLU VARDIR:


1.YOL:

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

2.YOL:
--B�t�n kolon adlar�n� s�ras�yla koyacaksak a�a��dakini kullanabilirz :

INSERT INTO table_name
VALUES (value1, value2, value3, ...);


3.yol : T�m kolon adlar�n� de�il de sadece baz� kolon adlar�n�da kullanabiliriz :

INSERT INTO Customers (�lke, �ehir)
VALUES ('T�rkiye', '�stanbul');


*/


--�RNEKLER:


USE Deneme

CREATE TABLE tablodeneme
(
ID INT,
�S�M VARCHAR(50),
SOYAD VARCHAR(50),
Cinsiyet CHAR(1),
Adres VARCHAR(MAX),
Kimlik INT
);

SELECT * FROM Deneme.[dbo].[tablodeneme]

--1.YOL :


INSERT INTO [tablodeneme] (ID,�S�M,SOYAD,Cinsiyet,Adres,Kimlik)
values(1,'onur','okay','e','xxx',123)

--2.YOL :
INSERT INTO [tablodeneme] 
values(2,'murat','yyyy','e','xxx',321)

--3.YOL :
INSERT INTO [tablodeneme] (ID,�S�M,SOYAD)
values(3,'Cem','zzz');



--Birden fazla sat�r� ayn� anda ekleme:


--1.YOL:
INSERT INTO [tablodeneme] VALUES
(4,'CEM','dddd','e','xxx',321),
(5,'FATMA','eeee','K','xxx',321);

--2.YOL:
INSERT INTO [tablodeneme] VALUES (6,'CAN','FFFF','e','xxx',321);
INSERT INTO [tablodeneme] VALUES (7,'NAZLI','EEEE','K','xxx',321);


--E�ER TABLO YARATIRKEN DEFAULT BAZI DE�ERLER ATADIYSAM A�A��IDAK� �EK�LDE DEFAULYT VALUE ATAYAB�L�YORUM:

INSERT INTO [tablodeneme] (ID,�S�M,SOYAD,Cinsiyet,Adres,Kimlik)
DEFAULT VALUES;


--SUB SELECT �LE TABLOYA VER� EKLEME :---
/*

INSERT INTO table
(column1, column2, ... )
SELECT expression1, expression2, ...
FROM source_table
[WHERE conditions];


*/
--�lk ba�ta baz� kolonlar� silelim.

SELECT * FROM Deneme.[dbo].[tablodeneme]



ALTER TABLE [tablodeneme]
DROP COLUMN Cinsiyet;

ALTER TABLE [tablodeneme]
DROP COLUMN Soyad,Adres,Kimlik;

--��erideki verileri de silelim.
TRUNCATE TABLE Deneme.[dbo].[tablodeneme]

SELECT * FROM Deneme.[dbo].[tablodeneme]



--Select etmek i�in ba�ka bir tablo buluyorum:
select BusinessEntityID,FirstName from AdventureWorks2019.Person.Person


--Insert edelim

INSERT INTO [tablodeneme]--Sadece iki kolon ad�m�z oldu�u i�in kolon eklemedik
select BusinessEntityID,FirstName from AdventureWorks2019.Person.Person

SELECT * FROM [tablodeneme]


TRUNCATE TABLE [tablodeneme]


--D��ER �RNEK:
--Ba�ka tablolardan data almak i�in ba�ka bir yolda INSERT INTO SELECT kullanmakt�r.
--Normal bir tabla yaratal�m.T�m verileri almak i�in :

CREATE TABLE Aktar�lanTablo (
ADRESID INT,
Sehir varchar(max)
);



SELECT * FROM Aktar�lanTablo
SELECT * FROM AdventureWorks2019.[Person].[Address]

INSERT INTO Aktar�lanTablo (ADRESID,Sehir)
SELECT
AddressID,
City
FROM AdventureWorks2019.[Person].[Address]


DROP TABLE Aktar�lanTablo


--Sadece Baz� Verileri Almak i�in ana tabloda where ko�ulu kullanabiliriz:

SELECT * FROM Aktar�lanTablo

SELECT * FROM AdventureWorks2019.[Person].[Address]

INSERT INTO Aktar�lanTablo (ADRESID,Sehir)
SELECT
AddressID,
City
FROM AdventureWorks2019.[Person].[Address]
WHERE City = 'Bothell';









 

--2:UPDATE:
/*

Tablodaki kay�t ya da kay�tlar� g�ncellemek i�in kullan�l�r.


--The UPDATE statement is used to modify the existing records in a table.

UPDATE Tablo Ad�
SET Kolon1 = value1, Kolon2 = value2, ...
WHERE condition;

*/
--Tek bir sat�rda Update:
--�ncelikle tabloya veri insert edelim:

SELECT * FROM [dbo].[tablodeneme]

INSERT INTO [tablodeneme]
values
(1,'onur'),
(2,'murat'),
(3,'volkan'),
(4,'kemal'),
(5,'murat');



--�imdi Update Edelim :
UPDATE [tablodeneme]
SET �S�M  = 'Sena'
WHERE ID = 1;


SELECT * FROM [dbo].[tablodeneme]

--Birden Fazla sat�rda Update:

UPDATE [tablodeneme]
SET �S�M  = 'Lale'
WHERE �S�M = 'murat';

SELECT * FROM [tablodeneme]


--UYARI : Update ederken e�er where ko�ulunu kullanmazsak, t�m kay�tlar UPDATE edilir.


UPDATE [tablodeneme]
SET �S�M ='Onur';

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
(3,'AY�E','DDD'),
(4,'FATMA','RRR'),
(5,'CEM','MMM');



UPDATE DENEMETABLOSU
SET ID = 8,AD = 'AL�'
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

--Delete i�lemiyle Tablodan kay�rlar� silinir ancak kaplad��� alan kal�r.


--The DELETE statement is used to delete existing records in a table.

SYNTAX:
DELETE FROM table_name WHERE condition;

--Ayr�ca FK k�s�t� taraf�ndan referans g�sterilen PK tablosunda verileri silmek istersekde DELETE kullanmak zorunday�z.
--TRUNCATE kullanamay�z.

--
*/

--TEK B�R KO�UL KULLANRAK:
SELECT * FROM DENEMETABLOSU

DELETE FROM DENEMETABLOSU
WHERE AD = 'MURAT';

--iki KO�UL KULLANRAK:
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


-- T�M HER�EY� S�LMEK ETMEK ���N :

--Where ko�ulu kullanmazsak toblodaki t�m veriler silinir.
--Ancak tablo ve kolon yap�s� bozulmaz.

--It is possible to delete all rows in a table without deleting the table. 
--This means that the table structure, attributes, and indexes will be intact:

--SYNTAX : DELETE FROM table_name;


SELECT * FROM DENEMETABLOSU

DELETE FROM DENEMETABLOSU



---MERGE ----

--UPSERT i�lemi (ekleme veya g�ncelleme), ba�ka bir ifadeyle birle�tirme i�lemi yapar.
--Kaynak tablo ve hedef tablo diye 2 tablomuz olsun.
--Ve hedef tablosunu kaynak tabnlosunda verilere dayanarak update etmemiz gerekti�ini d���nelim.

--3 tane durumuz vard�r :

--1.DURUM:Kaynak tablosunda olup, hedef tablosunda olmayan veriler.
--Bu durumda kaynak tablosunda olan verileri hedef tablosuna insert etmemiz gerek.

--2.DURUM :Hedef tablosunda olup da kaynak tablosunda olmayan veriler var.
--Bu durmda hedef tablosundaki verileri silmemeiz gerek.

--3.durum: Birde kaynak tablosunda ve hedef tablosunda olan veriler var. Bu veriler birebir ayn� olabilice�i gibi
--�rne�in sadece kolon adlar� da ayn� olabilir ama ald��� say�sal de�erler farkl� olabilir.

--Bu durumda kaynak tablosundan gelen verilerle hadef tablosunu update etmemiz laz�m.
--�zetle;source da olup targetta olmayanlar insert
--Target ta olup source da olmayanlar delete(verilerimizi source tablosyula ayn� olmas�n� istedi�imiz i�in)
--E�le�enler de var ise onlar�n da gerekiyorsa de�erleri update edilmeli.
--B�yle bir durumda insert,update ve delete 'i ayr� ayr� kullanabilirz ama uzun s�rer.

--O y�zden MERGE ifadesi ni kullanambiliriz. Bu 3 i�lemide ayn� anda yapabiliriz.



--KAYNAK TABLOSU :HEDEF TABLOYA AKTARLICAK VEYA UYGULANCAK VER� SET�.
--HEDEF TABLOSU :DE����KL�K YAPIACALK TABLO.


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
1.ADIM : hedef ve kaynak tabloalr�n� belirle.
2.ad�m:merge_condition'� belirle.Join deki gibi.
Yani 2 tablodaki kolonlar�n nas�l e�le�ti�ine bakmam�z gerekmektedir.
Genellikle PK ve Unique key kolonlar� kullan�l�r.

--
*/
--�RNEK :



USE Deneme
GO

--2 TANE �RNEK TABLO YARATALIM :


--Kategori1 tablosu target table olsun.
CREATE TABLE Kategori1 
(
    id INT PRIMARY KEY,
    KategoriAd� VARCHAR(255) NOT NULL,
    Tutar DECIMAL(10,2)
);

--Kategori2 source table olsun.
CREATE TABLE Kategori2 (
    id INT PRIMARY KEY,
    KategoriAd� VARCHAR(255) NOT NULL,
    Tutar DECIMAL(10 , 2 )
);





INSERT INTO Kategori1(id, KategoriAd�, Tutar)
VALUES(1,'A',15000),
    (2,'B',25000),
    (3,'C',13000),
    (4,'D',10000);



INSERT INTO Kategori2(id, KategoriAd�, Tutar)
VALUES(1,'A',15000),
    (3,'C',13000),
    (4,'D',20000),
    (5,'E',10000),
    (6,'F',10000);



SELECT * FROM Kategori2 -- KAYNAK TABLO --1,3,4,5,6

SELECT * FROM Kategori1 --HEDEF TABLO --1,2,3,4 var ama mergeden sonra 2 olmayacak.

--Hedef tabloyu,kaynak tablodaki verilerle g�ncelleyece�iz.


MERGE Kategori1 t 
    USING Kategori2 s
ON (s.id = t.id)
WHEN MATCHED THEN 
UPDATE SET 
        t.KategoriAd� = s.KategoriAd�,
		t.Tutar = s.Tutar

WHEN NOT MATCHED BY TARGET THEN 
INSERT (id, KategoriAd�, Tutar) VALUES (s.id, s.KategoriAd�, s.Tutar)
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;

--MERGE ��lemi sonucunda Hedef Tablosu :

---------------------------------------------

--BAS�T �RNEK :

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



