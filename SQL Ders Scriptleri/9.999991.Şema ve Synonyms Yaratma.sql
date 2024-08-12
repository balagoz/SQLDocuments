--- ### SYNONYMS ### ---

--Bir ba�ka alias verme veya alternatif isim yaratma metodu Synonyms'lerdir.
--Herhangi bir veritaban� objesine (Tablo,View,Stored Proc,Kullan�c� Tan�ml� Fonk) synonym verebiliriz.


--SYNTAX : CREATE SYNONYM [�ema Ad�].Synonym Ad� FOR object;

--Normalde obje 'nun format� bu �ekildedir.
--[ServerName].[Database Ad�].[�emaAd�].[TabloAd�]
--Yarat�lan Synonym'leri Veritaban� i�indeki Synonymlerde g�rebiliriz.

--�rnek : Ayn� Veritaban�ndaki tabloya Synonym Vermek

Use AdventureWorks2019

CREATE SYNONYM DenemeFoto FOR [Production].[ProductProductPhoto]

--�imdi [Production].[ProductProductPhoto] tablosundaki t�m veriler gelecektir.

SELECT * FROM [Production].[ProductProductPhoto]

select * from DenemeFoto

--DROP ETMEK ���N :
DROP SYNONYM DenemeFoto



--SIFIRDAN B�R DATABASE - �EMA - TABLO - SYNONYM YARATMA
--�ema yaratmadan tabloyu yaratamy�z �eman�n i�inde.�ema ilk batch olmal�.
CREATE DATABASE DENEME1
GO
USE DENEME1
GO
CREATE SCHEMA Sat�s
GO
create table Sat�s.Kisi
(
KisiID INT,
KisiAd� VARCHAR(50)
);


CREATE SYNONYM SATISCILAR FOR Sat�s.Kisi;

SELECT * FROM SATISCILAR

DROP SYNONYM SATISCILAR


---

--�emada tablo yaratma ve �emas�z tablo yaratma :
--Haz�r bir �emam�z varken tablo yaratma : 
USE DENEME1
GO
CREATE SCHEMA Sat��lar


create table Sat��lar.Kisi
(
KisiID INT,
KisiAd� VARCHAR(50)
);

--�emas�z Tablo Yartama:
USE DENEME1
GO
create table Kisiler
(
KisiID INT,
KisiAd� VARCHAR(50)
);

SELECT * FROM dbo.Kisiler



--SYNONYM DROP ETME :
DROP SYNONYM SATISCILAR



--BA�KA DATABASEDEYKEN BA�KA DATABASE'TE SYNONYM YARATMA :

--�lk �nce SYNONYM'� DROP edelim.


CREATE SYNONYM DENEMES�NON�M for DENEME1.Sat��lar.Kisi



select * from ornek

DROP SYNONYM ornek

drop table Sat�s.Kisi



USE AdventureWorks2019
