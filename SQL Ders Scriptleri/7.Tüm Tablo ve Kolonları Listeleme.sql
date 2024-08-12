--- ### T�M TABLO VE KOLONLARI L�STELEME ### ---

---T�m databaselerin listesi g�rmek i�in :
-- 1.yol : SELECT * FROM master.sys.databases
-- 2.yol : EXEC sp_databases;


SELECT * FROM master.sys.databases

EXEC sp_databases




---T�m �EMALARIN listesi g�rmek i�in :
SELECT * FROM sys.schemas

--KOLONLARIN DATATYPE'LARINA BAKMAK ���N:
--1:YOL sp_help

SELECT * FROM Person.Address

sp_help'[Person].[Address]'



--2.yol ise tablyu higlight et ve alt + f1 'e bas.
SELECT * FROM Person.Address



--3.Yol :
--En iyi se�enek.
--Hem tablolar var hem de kolonlar var.


--Diyelim ki "PHONE" ile ilgili bir kolon ar�yoruz. A�a��daki gibi arayabiliriz.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE'%PHONE%'


--Sadece Tablolar� g�rmek i�in :
--1.yol
SELECT * FROM sysobjects
WHERE xtype = 'U'

--U user Table
--IT Internal Table
--P Stored Proc
--PK PK Constraint
--S Sysytem Table
--V View


--2.yol
SELECT * FROM sys.tables


--Hem Tablolar� hemde Viewlar� g�rmek i�in :

SELECT * FROM INFORMATION_SCHEMA.TABLES


--T�m Tablolar� ve Kolonlar� Listelemek ��in :
SELECT * FROM sys.objects -- U'lar User Table.

--Kolonlar� G�rmek ��in
SELECT * FROM sys.columns





