
--VER� TABANI YARATIYORUZ--
CREATE DATABASE Ornek
GO
USE Ornek
GO
--TABLO ADINDA B�R TABLO YARATIYORUZ--
CREATE TABLE TABLO
(
SAYI INT,
);

INSERT INTO TABLO VALUES 
(1),
(2),
(2),
(3),
(NULL),
(NULL),
(4),
(5);

--KurumsalCal�sanlar ADINDA B�R TABLO YARATIYORUZ--



CREATE TABLE KurumsalCal�sanlar
(
ID INT,
Ad varchar(30),
Cinsiyet varchar(30),
Maas INT,
Ulke varchar(50));

INSERT INTO KurumsalCal�sanlar VALUES
(1,'Onur','Erkek',3000,'T�rkiye'),
(2,'Murat','Erkek',4000,'Fransa'),
(3,'Kemal','Erkek',5000,'T�rkiye'),
(4,'Mehmet','Erkek',6000,'Rusya'),
(5,'Ezgi','Kad�n',7000,'Rusya'),
(6,'Ay�e','Kad�n',8000,'Estonya'),
(7,'Sema','Kad�n',9000,'T�rkiye'),
(8,'Buket','Kad�n',3000,'Amerika'),
(9,'Fatma','Kad�n',3000,'Fransa'),
(10,'Esin','Kad�n',3000,'Amerika'),
(11,'Onur','Erkek',5000,'T�rkiye'),
(12,'Onur','Erkek',5000,'Fransa'),
(13,'Onur','Erkek',5000,'Fransa'),
(14,'Onur','Erkek',5000,'Amerika'),
(15,'Mehmet','Erkek',5000,'Rusya');





--Average Adl� bir tablo olu�turuyoruz :

CREATE TABLE Average
(
Say� INT

);

INSERT INTO Average
VALUES
(1),
(2),
(3),
(4),
(5),
(NULL);


--�simDeneme Adl� bir tablo olu�turuyoruz :


CREATE TABLE �simDeneme
(
�sim VARCHAR(50)
);

INSERT INTO �simDeneme 
VALUES
('Onur'),
('Onur'),
('Onur'),
('Onur'),
('Onur');



--Grup Adl� Bir Tablo Olu�turuyoruz.

CREATE TABLE Grup
(
Tak�m VARCHAR(10),
Puan INT

);

INSERT INTO Grup VALUES
('A',10),
('A',20),
('B',30),
('C',40),
('C',50);



--Deneme Adl� Bir Tablo Olu�turuyoruz.

CREATE TABLE Deneme
(
Ad Varchar(50)
);

INSERT INTO Deneme
VALUES
('Onur'),
('Onur'),
('Onur'),
('Onur'),
('Ali'),
('Ali'),
('Ali'),
('Fatma'),
('Fatma'),
('Fatma');




--Cal�sanlar ad�nda TABLO yarat�yoruz :

CREATE TABLE Cal�sanlar
(
ID INT,
ADI VARCHAR(50),
Cinsiyet CHAR(1),
Maas INT,
Sehir VARCHAR(50)

);


INSERT INTO Cal�sanlar
VALUES
(1,'Onur','E',10000,'�stanbul'),
(2,'Ahmet','E',20000,'�zmir'),
(3,'H�seyin','E',30000,'Bursa'),
(4,'Murat','E',10000,'Canakkale'),
(5,'Kemal','E',30000,'�zmir'),
(6,'Ay�e','K',70000,'�stanbul'),
(7,'Fatma','K',80000,'Canakkale'),
(8,'Esin','K',90000,'Bursa'),
(9,'Mustafa','E',20000,'�zmir'),
(10,'Cemil','E',60000,'�stanbul');





--Elektronik adl� Tablomuzu Olu�tural�m:

CREATE TABLE Elektronik
(
Urun VARCHAR(50),
Sat�sTutar� INT

);

INSERT INTO Elektronik VALUES
('Iphone',500),
('Laptop',800),
('Ipad',200),
('Iphone',1000),
('Laptop',600);



--Kurumsal �al��anlar2 adl� Tablomuzu Olu�tural�m:

CREATE TABLE KurumsalCal�sanlar2
(
ID INT,
Ad varchar(30),
Cinsiyet varchar(30),
Maas INT,
Ulke varchar(50));

INSERT INTO KurumsalCal�sanlar2 VALUES
(1,'Onur','Erkek',3000,'T�rkiye'),
(2,'Murat','Erkek',4000,'Fransa'),
(3,'Kemal','Erkek',5000,'T�rkiye'),
(4,'Mehmet','Erkek',6000,'Rusya'),
(5,'Ezgi','Kad�n',7000,'Rusya'),
(6,'Ay�e','Kad�n',8000,'Estonya'),
(7,'Sema','Kad�n',9000,'T�rkiye'),
(8,'Buket','Kad�n',3000,'Amerika'),
(9,'Fatma','Kad�n',3000,'Fransa'),
(10,'Esin','Kad�n',3000,'Amerika');



--�RNEK : 2 TANE TABLO OLU�TURALIM :

CREATE TABLE Seh�r
(
SehirID INT,
UlkeID INT,
SehirAd� Varchar(30)
);

INSERT INTO Seh�r 
VALUES
(1,1,'�stanbul'),
(2,1,'�zmir'),
(3,2,'Berlin'),
(4,NULL,'New York');


CREATE TABLE Ulke
(

UlkeID INT,
UlkeAd� Varchar(30)

);

INSERT INTO Ulke VALUES
(1,'Turk�ye'),
(2,'Almanya'),
(4,'�ngiltere');




--2 TANE TABLO OLU�TURALIM :
CREATE TABLE Cal�san
(
ID INT,
Ad varchar(30),
Cinsiyet varchar(7),
Maas INT,
DepartmantID INT
);

CREATE TABLE Departmant
(
ID INT,
DepartmantAd� varchar(30),
Lokasyon varchar(30),
Mudur varchar(50)
);

INSERT INTO Cal�san VALUES
(1,'Onur','Erkek',10000,1),
(2,'Ahmet','Erkek',20000,3),
(3,'Ali','Erkek',30000,1),
(4,'Kemal','Erkek',40000,2),
(5,'Murat','Erkek',50000,2),
(6,'Ay�e','Kad�n',60000,1),
(7,'Esin','Kad�n',70000,3),
(8,'Fatma','Kad�n',80000,1),
(9,'Yasin','Erkek',900000,NULL),
(10,'Cem','Erkek',100000,NULL);


INSERT INTO Departmant VALUES
(1,'IT','Londra','Ryan'),
(2,'Bordro','�stanbul','Mert'),
(3,'IK','New York','Micheal'),
(4,'D�ger','Sydney','Ron');



--4 Tane tablo yaratal�m :
CREATE TABLE OfisCal�san
(
Cal�sanID VARCHAR(50),
Ad VARCHAR(50),
Maas INT,
DeptID VARCHAR(5),
ManagerID VARCHAR(5)
);


CREATE TABLE Departmanlar
(
DeptID VARCHAR(5),
DepartmantAd� VARCHAR(20)
);



CREATE TABLE Manager
(
ManagerID VARCHAR(5),
ManagerAd� VARCHAR(30),
DeptID VARCHAR(5)
);


CREATE TABLE Projeler
(
ProjeID VARCHAR(30),
ProjeAd� VARCHAR(30),
ProjedeCal�sanlar VARCHAR(50)
);



INSERT INTO OfisCal�san
VALUES
('C1','Onur',1500,'D1','M1'),
('C2','Fatma',1500,'D1','M1'),
('C3','Ay�e',5500,'D2','M2'),
('C4','Murat',2500,'D2','M2'),
('C5','Kemal',3500,'D10','M3'),
('C6','Mehmet',4500,'D10','M3');





INSERT INTO Manager
VALUES
('M1','Micheal','D3'),
('M2','James','D4'),
('M3','Fuat','D1'),
('M4','Cindy','D1');





INSERT INTO Projeler
VALUES
('P1','SQL Projesi','C1'),
('P1','Excel Projesi','C2'),
('P1','PowerPoint Projesi','M3'),
('P2','Python Projesi','C1'),
('P2','Power BI Projesi','M4');

INSERT INTO Departmanlar VALUES
('D1','IT'),
('D2','HR'),
('D3','Finance'),
('D4','DBA');



CREATE TABLE ADRES
(
S�rketID INT,
S�rketAd� varchar(50),
Lokasyon varchar(50)
);

INSERT INTO ADRES VALUES(1,'XYZ.LTD','�stanbul');


--Urun adl� bir tablo yarat�yoruz :
CREATE TABLE Urun
(
Id INT,
UrunAd� Varchar(20)
);

INSERT INTO Urun VALUES
(1,'Kazak'),
(2,'Gomlek'),
(3,'Kot'),
(4,'Mont');


--Bedenler ad�nda bir tablo yarat�yoruz :
CREATE TABLE Bedenler
(
Beden VARCHAR(20)
);

INSERT INTO Bedenler VALUES
('S'),
('M'),
('L'),
('XL'),
('XXL');





--Tablolar�m�z� olu�tural�m:
CREATE TABLE Aile
(

AileUyeID VARCHAR(2),
Ad VARCHAR(30),
YAS INT,
ANNEBABA VARCHAR(30)
);

INSERT INTO Aile VALUES
('U1','Onur',5,'U5'),
('U2','Ay�e',11,'U5'),
('U3','Ali',13,'U5'),
('U4','Kemal',37,NULL),
('U5','Meryem',41,'U6'),
('U6','Murat',71,NULL),
('U7','Cem',7,'U4'),
('U8','Azra',9,'U4');




CREATE TABLE Sirket
(
Cal�sanID INT,
Ad varchar(30),
ManagerID INT
);

INSERT INTO Sirket VALUES
(1,'Onur',3),
(2,'Murat',1),
(3,'Tar�k',NULL),
(4,'Cem',1),
(5,'Mehmet',1);



--TABLO1 VE TABLO2 ad�nda 2 tablo olu�turuyoruz :
CREATE TABLE TABLO1
(
ID INT
);

CREATE TABLE TABLO2
(
ID INT
);


INSERT INTO TABLO1 VALUES
(1),
(2),
(3);

INSERT INTO TABLO2 VALUES
(2),
(3),
(4);


--TurkiyeMust VE Ing�ltereMust ad�nda 2 tablo olu�turuyoruz :

CREATE TABLE TurkiyeMust
(
ID INT,
AD VARCHAR(40),
Email VARCHAR(MAX)
);


CREATE TABLE Ing�ltereMust
(
ID INT,
AD VARCHAR(40),
Email VARCHAR(MAX)
);

INSERT INTO TurkiyeMust values
(1,'Onur','onur@onur.com'),
(2,'Murat','murat@murat.com');


INSERT INTO Ing�ltereMust values
(1,'Fatma','fatma@fatma.com'),
(2,'Murat','murat@murat.com');




-- �rnek : 2 tane tablo olu�tural�m.
CREATE TABLE TABLOA
(
ID INT,
AD VARCHAR(50),
Cinsiyet CHAR(1)
);
CREATE TABLE TABLOB
(
ID INT,
AD VARCHAR(50),
Cinsiyet CHAR(1)
);

INSERT INTO TABLOA VALUES
(1,'Onur','E'),
(2,'Murat','E'),
(3,'Kemal','E'),
(4,'Mehmet','E'),
(5,'Yasin','E');

INSERT INTO TABLOB VALUES
(4,'Mehmet','E'),
(5,'Yasin','E'),
(6,'Kemal','E'),
(7,'Mert','E'),
(8,'Cem','E');


--TABLO X VE TABLOY ADLI 2 TABLO OLU�TURUYORUZ :
CREATE TABLE TABLOX
(
ID INT
);

CREATE TABLE TABLOY
(
ID INT
);

INSERT INTO TABLOX VALUES
(1),
(2),
(3);


INSERT INTO TABLOY VALUES
(2),
(3),
(4),
(2);





-- 2 tane tablo yaratal�m VE PK VE FK tan�mlamalar�n� da yapal�m.

CREATE TABLE DEPTTT
(
ID INT NOT NULL PRIMARY KEY,
DepartmanAd� VARCHAR(40)
);

INSERT INTO DEPTTT VALUES
(1,'IT'),
(2,'HR'),
(3,'FIN'),
(4,'MUH'),
(5,'SATIS');



CREATE TABLE EMPPP
(
ID INT NOT NULL PRIMARY KEY,
AD VARCHAR(30),
Cinsiyet CHAR(1),
Maas INT,
DepartmandID INT FOREIGN KEY REFERENCES DEPTTT(ID)
);
INSERT INTO EMPPP VALUES
(1,'Onur','E',5000,1),
(2,'Murat','E',2000,3),
(3,'Kemal','E',3000,2),
(4,'Asl�','E',4000,1),
(5,'Selin','E',7000,2);



--- SATISSS ADLI B�R TABLO OLU�TURUYORUZ :
CREATE TABLE SATISSS
(
Sat�sc� VARCHAR(30),
Sat�sYap�lanUlke VARCHAR(30),
Sat�sTutar� INT
);


INSERT INTO SATISSS VALUES
('Onur','TR',10000),
('Murat','FR',20000),
('Kemal','EN',130000),
('Murat','EN',20000),
('Kemal','TR',30000),
('Onur','FR',10000),
('Onur','TR',80000),
('Onur','TR',10000),
('Onur','EN',20000),
('Murat','FR',20000),
('Kemal','TR',10000),
('Murat','TR',20000),
('Kemal','EN',70000),
('Murat','FR',20000),
('Kemal','EN',80000);


--- CATEG ADLI B�R TABLO OLU�TURUYORUZ :
CREATE TABLE CATEG
(
KategoriAd� VARCHAR(50),
UrunAdedi INT
);

INSERT INTO CATEG VALUES
('Ayakkab�',50),
('Canta',30),
('Ayakkab�',50),
('Ayakkab�',30),
('Cuzdan',20),
('Gomlek',40),
('Ayakkab�',50),
('Cuzdan',50),
('Gomlek',50);


---SATIS1 isimli bir tablo olu�turuyoruz

CREATE TABLE SATIS1
(
Temsilci VARCHAR(30),
Ulke VARCHAR(30),
Tutar INT

);

INSERT INTO SATIS1 VALUES
('Onur','Turkiye',100),
('Onur','Ingiltere',200),
('Murat','Turkiye',300),
('Murat','Ingiltere',400);


--Urunler ve UrunlerSat�s adl� 2 tablo olu�turuyoruz :


CREATE TABLE Urunler
(

ID INT IDENTITY PRIMARY KEY,
UrunAd� varchar(40),
Ac�klama varchar(40)
);

CREATE TABLE UrunlerSat�s
(
ID INT,
UrunID INT FOREIGN KEY REFERENCES Urunler(ID),
BirimFiyat INT,
Sat�lanAdet INT
);

INSERT INTO Urunler VALUES
('TV','105 inc'),
('Telefon','Iphone'),
('Laptop','HP');

INSERT INTO UrunlerSat�s VALUES
(1,3,400,5),
(2,2,500,5),
(3,3,600,5),
(4,3,200,5);







--�rnek :
CREATE TABLE Tedarikci
(
ID INT,
TedarikciAd� VARCHAR(50)

);

CREATE TABLE UrunList
(
ID INT,
TedarikciID INT,
Kategori varchar(20),
UrunAd� varchar(20)
);


INSERT INTO Tedarikci VALUES
(1,'ABC'),
(2,'XYZ'),
(3,'ASD'),
(4,'ZXC');


INSERT INTO UrunList VALUES
(1,1,'Yiyecek','Ekmek'),
(2,1,'Elektronik','Telefon'),
(3,2,'Yiyecek','Elma'),
(4,3,'Elektronik','Laptop'),
(5,3,'Yiyecek','Et'),
(6,4,'Di�er','Kalem'),
(7,4,'Elektronik','Kulakl�k');



--DersVerenler ve Ogrenci adl� tablolar� olu�tural�m :
CREATE TABLE DersVerenler
(
AD VARCHAR(45),
YAS INT
);

CREATE TABLE Ogrenci
(
AD VARCHAR(45),
YAS INT
);

INSERT INTO DersVerenler VALUES
('Meltem',44),
('Ahmet',53),
('Mehmet',52),
('Sevgi',36),
('Ali',40);

INSERT INTO Ogrenci VALUES
('Hasan',21),
('Veli',22),
('Sezer',19),
('Fatma',38),
('Veli',58);




--�RNEK :
CREATE TABLE MINAGE(
MinYas INT,
MaxYas INT,
);

INSERT INTO MINAGE (MinYas,MaxYas) VALUES
(10,NULL),
(25,NULL),
(NULL,60);

--Ofis ad�nda bir tablo yarat�yoruz :

CREATE TABLE Ofis
(
Cal�sanID INT,
Cal�sanAd� VARCHAR(20),
Mudur INT
);

INSERT INTO Ofis (Cal�sanID,Cal�sanAd�,Mudur)
VALUES
(1,'Onur',3),
(2,'Murat',1),
(3,'Ay�e',NULL),
(4,'Fatma',1),
(5,'Kemal',1);


--�sim Ad�nda bir tablo olu�turuyoruz :

CREATE TABLE �sim
(
ID INT,
Ad varchar(50),
GobekAd� varchar(50),
Soyad� varchar(50)
);


INSERT INTO �sim (ID,Ad,GobekAd�,Soyad�)
values
(1,'Onur',NULL,NULL),
(2,NULL,'Murat','Sakman'),
(3,NULL,NULL,'Esin'),
(4,'Ay�e','Seda',NULL),
(5,'Fatma','Nur','Ye�il');





CREATE TABLE SAYIMETIN
(
ID INT IDENTITY,
AD VARCHAR(50),
YAS CHAR(28)
);


INSERT INTO SAYIMETIN VALUES
('Onur','35'),
('Murat','40'),
('Cem','otuzbes'),
('Selcuk','otuzalt�');


CREATE TABLE PuanDurumu
(
Tak�m varchar(10),
Puan INT

);

INSERT INTO PuanDurumu (Tak�m,Puan) 
VALUES 
('A',10),
('A',20),
('B',30),
('C',40),
('C',50);




-- BANKA ADINDA TABLO YARATIYORUZ :

CREATE TABLE Banka
(
MusteriID INT,
Urun varchar(30),
Tutar INT
);

SELECT * FROM Banka

INSERT INTO Banka VALUES
(1,'Mevduat',10000),
(2,'Kredi',20000),
(2,'Mevduat',10000),
(1,'Kredi',30000),
(2,'Mevduat',40000),
(3,'Kredi',50000),
(1,'Mevduat',10000),
(1,'Kredi',60000),
(3,'Mevduat',70000),
(3,'Kredi',90000),
(2,'Mevduat',10000),
(2,'Kredi',60000),
(2,'KMH',50000),
(1,'Mevduat',30000),
(1,'KMH',10000),
(2,'Mevduat',10000),
(3,'KMH',10000),
(3,'KMH',10000),
(1,'Mevduat',10000),
(1,'Mevduat',120000);


--AKT�FL�K ADINDA B�R TABLO OLU�TURUYORUZ :

CREATE TABLE Aktfilik
(
M�steriID INT,
MagazaID INT,
Active INT);

INSERT INTO Aktfilik VALUES
(1,1,1),
(2,1,1),
(3,2,1),
(4,1,0),
(5,2,1),
(6,1,0),
(7,2,1),
(8,2,0),
(9,2,1),
(10,1,0),
(11,2,1),
(12,1,0),
(13,1,1),
(14,1,1),
(15,1,1),
(16,1,1);





CREATE TABLE Cal�sanCinsiyet
(
ID INT,
Ad VARCHAR(30),
CinsiyetID INT
);

INSERT INTO Cal�sanCinsiyet VALUES
(1,'ONUR',1),
(2,'MERT',1),
(3,'CEM',1),
(4,'FATMA',2),
(5,'AY�E',2),
(6,'CEM',1);


--S�ralamaRank isimli bir tablo olu�turuyoruz---

CREATE TABLE S�ralamaRank
(
AD VARCHAR(50),
Cinsiyet VARCHAR(50),
Maas INT

);

INSERT INTO S�ralamaRank VALUES
('Onur','E',8000),
('Murat','E',8000),
('Ezgi','K',7000),
('Esin','K',600),
('Fatma','K',5000),
('Melis','K',5000),
('Yeliz','K',5000),
('Kemal','E',4000),
('Mert','E',3500),
('Cem','E',3000);





-- Veri ad�nda bir tablo olu�turuyoruz--
CREATE TABLE Veri
(
ID INT,
Ad varchar(30),
SoyAd varchar(30),
Cinsiyet char(1),
Maas INT
);


INSERT INTO Veri VALUES
(1,'Onur','Okay','E',10000),
(1,'Onur','Okay','E',10000),
(1,'Onur','Okay','E',10000),
(2,'Murat','Y�lmaz','E',20000),
(2,'Murat','Y�lmaz','E',20000),
(3,'Kemal','Sar�','E',50000),
(3,'Kemal','Sar�','E',50000),
(3,'Kemal','Sar�','E',50000);












CREATE TABLE Cal�sanlara
(
ID INT,
Ad varchar(50),
Maas int,
Cinsiyet varchar(50),
DeptID int
);

CREATE TABLE Dept
(

DeptID int,
DeptName varchar(50)
);

INSERT INTO Cal�sanlara VALUES
(1,'Onur',10000,'E',3),
(2,'Murat',20000,'E',2),
(3,'Mehmet',30000,'E',1),
(4,'Fatma',40000,'E',4),
(5,'Cem',50000,'E',1),
(6,'Yasin',60000,'E',3);


INSERT INTO Dept VALUES
(1,'IT'),
(2,'Bordro'),
(3,'HR'),
(4,'Muh');








CREATE TABLE URUNFIYAT
(
UrunID INT,
UrunAd� varchar(30),
BirimFiyat INT
);

CREATE TABLE ADETSATIS
(
UrunID INT,
ADET INT
);

INSERT INTO URUNFIYAT VALUES
(1,'Kitap',20),
(2,'Kalem',20),
(3,'Silgi',20),
(4,'Cetvel',20);

INSERT INTO ADETSATIS VALUES
(1,10),
(3,23),
(4,21),
(2,12),
(1,13),
(3,12),
(4,13),
(1,11),
(2,12),
(1,14);




--UrunlerDeneme ad�nda bir tablo olu�turuyoruz :
CREATE TABLE UrunlerDeneme
(
ID INT,
NAME VARCHAR(50),
BirimF�yat INT,
Adet INT
);

INSERT INTO UrunlerDeneme VALUES
(1,'LAPTOP',2300,100),
(2,'DESKTOP',2000,30);






--Kisi ve Univeriste isimli 2 tane tablo yarat�yoruz :
CREATE TABLE Kisi
(
ID INT,
AD VARCHAR(50),
Sehir VARCHAR(50)
);

CREATE TABLE Univeriste
(
ID INT,
AD VARCHAR(50),
Sehir VARCHAR(50),
Universite VARCHAR(50)
);

INSERT INTO Kisi VALUES 
(1,'ONUR','�SSTANBUL');
INSERT INTO Univeriste VALUES 
(1,'ONUR','�SSTANBUL','�STANBUL �N�VERS�TES�');






CREATE TABLE NUMARA
(
ID INT
);

INSERT INTO NUMARA VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);



CREATE TABLE NUMARALAR
(
ID INT
);

INSERT INTO NUMARALAR VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);