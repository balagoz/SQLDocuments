--- ### SYNONYMS ### ---

--Bir baþka alias verme veya alternatif isim yaratma metodu Synonyms'lerdir.
--Herhangi bir veritabaný objesine (Tablo,View,Stored Proc,Kullanýcý Tanýmlý Fonk) synonym verebiliriz.


--SYNTAX : CREATE SYNONYM [Þema Adý].Synonym Adý FOR object;

--Normalde obje 'nun formatý bu þekildedir.
--[ServerName].[Database Adý].[ÞemaAdý].[TabloAdý]
--Yaratýlan Synonym'leri Veritabaný içindeki Synonymlerde görebiliriz.

--Örnek : Ayný Veritabanýndaki tabloya Synonym Vermek

Use AdventureWorks2019

CREATE SYNONYM DenemeFoto FOR [Production].[ProductProductPhoto]

--Þimdi [Production].[ProductProductPhoto] tablosundaki tüm veriler gelecektir.

SELECT * FROM [Production].[ProductProductPhoto]

select * from DenemeFoto

--DROP ETMEK ÝÇÝN :
DROP SYNONYM DenemeFoto



--SIFIRDAN BÝR DATABASE - ÞEMA - TABLO - SYNONYM YARATMA
--Þema yaratmadan tabloyu yaratamyýz þemanýn içinde.Þema ilk batch olmalý.
CREATE DATABASE DENEME1
GO
USE DENEME1
GO
CREATE SCHEMA Satýs
GO
create table Satýs.Kisi
(
KisiID INT,
KisiAdý VARCHAR(50)
);


CREATE SYNONYM SATISCILAR FOR Satýs.Kisi;

SELECT * FROM SATISCILAR

DROP SYNONYM SATISCILAR


---

--Þemada tablo yaratma ve þemasýz tablo yaratma :
--Hazýr bir þemamýz varken tablo yaratma : 
USE DENEME1
GO
CREATE SCHEMA Satýþlar


create table Satýþlar.Kisi
(
KisiID INT,
KisiAdý VARCHAR(50)
);

--Þemasýz Tablo Yartama:
USE DENEME1
GO
create table Kisiler
(
KisiID INT,
KisiAdý VARCHAR(50)
);

SELECT * FROM dbo.Kisiler



--SYNONYM DROP ETME :
DROP SYNONYM SATISCILAR



--BAÞKA DATABASEDEYKEN BAÞKA DATABASE'TE SYNONYM YARATMA :

--Ýlk Önce SYNONYM'Ý DROP edelim.


CREATE SYNONYM DENEMESÝNONÝM for DENEME1.Satýþlar.Kisi



select * from ornek

DROP SYNONYM ornek

drop table Satýs.Kisi



USE AdventureWorks2019
