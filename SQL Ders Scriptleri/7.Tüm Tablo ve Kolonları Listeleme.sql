--- ### TÜM TABLO VE KOLONLARI LÝSTELEME ### ---

---Tüm databaselerin listesi görmek için :
-- 1.yol : SELECT * FROM master.sys.databases
-- 2.yol : EXEC sp_databases;


SELECT * FROM master.sys.databases

EXEC sp_databases




---Tüm ÞEMALARIN listesi görmek için :
SELECT * FROM sys.schemas

--KOLONLARIN DATATYPE'LARINA BAKMAK ÝÇÝN:
--1:YOL sp_help

SELECT * FROM Person.Address

sp_help'[Person].[Address]'



--2.yol ise tablyu higlight et ve alt + f1 'e bas.
SELECT * FROM Person.Address



--3.Yol :
--En iyi seçenek.
--Hem tablolar var hem de kolonlar var.


--Diyelim ki "PHONE" ile ilgili bir kolon arýyoruz. Aþaðýdaki gibi arayabiliriz.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE'%PHONE%'


--Sadece Tablolarý görmek için :
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


--Hem Tablolarý hemde Viewlarý görmek için :

SELECT * FROM INFORMATION_SCHEMA.TABLES


--Tüm Tablolarý ve Kolonlarý Listelemek Ýçin :
SELECT * FROM sys.objects -- U'lar User Table.

--Kolonlarý Görmek Ýçin
SELECT * FROM sys.columns





