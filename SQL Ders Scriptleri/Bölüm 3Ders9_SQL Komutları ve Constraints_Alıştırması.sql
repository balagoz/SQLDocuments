----- SQL Komutlarý ve Constraints Bölüm ALýþtýrmasý ----------

--BÖLÜM 1: Create ,Alter - Drop Database :

--Gui üzerinden database yaratma.
--Query kullanarak database üretmek:
CREATE DATABASE DenemeVeri
--Rename a database:
	--Gene 3 yolu var : Gui üzerinden(database saðtýk rename), ve sorgu yazarak.Birde exex sp_renameDB 'Eski Ad','Yeni Ad'
	--SYNTAX :ALTER DATABASE Eski AD Modify Name Yeni AD:
	ALTER DATABASE DenemeVeri Modify Name = Deneme1
	exec sp_renameDB 'Deneme1','DenemeVeri'

--Delete a database:
--Drop ettiðimiz database'i kullanýyor olmamamýz lazým.Baþkasý kullanýrken bende silemem.
--2 yolu var: GUÝ---Saðtýk delete
			DROP DATABASE Deneme


--BÖLÜM 2: Creatating And Working With Tables:
-- 2 Tane tablo yaratalým : Pers onel ve Cinsiyet diye.VE pk VE fk atamalarýný yapalým.
--Tablolar 2 þekilde yaratýlabilir :GUI ve query.
--FK atamalarý 2 þekilde yapýlabilir : GUI ve Query.

--FK atamasý Sorgu ile :

Alter table ForeignKeyTable add constraint ForeignKeyTable_ForiegnKeyColumn_FK 
FOREIGN KEY (ForiegnKeyColumn) references PrimaryKeyTable (PrimaryKeyColumn)

--Türkçesi
ALTER TABLE FKTablosu
ADD CONSTRAINT ConstraintAdý
FOREIGN KEY (FK kolonu) REFERENCES PKTablosu(PK Kolonu)
--------------------------


--Özetle;
--FK'lar database bütünlüðünü saðlamak içindir.
--Bir tablodaki FK diðer tablodaki, PK'dýr.
--FK anahtarý FK kolonuna yanlýþ veri girilmesini engeller.
--FK kolonuna girdiðimiz deðerler,PK kolonundaki verilerden biri olmalý.
--PK ise verilerin tekili olmasýný saðlar.Ayný veriyri giremeyiz PK'da sütununda.
--PK kolonunu TCKN gibi düþünebiliriz.Null deðerde alamazlar.

---ÖRNEK :
/*
	          Personel Tablosu                          
	-------------------------------------
	ID(PK)		AD		Email		ÖðrenimID (FK)--Biz buraya Öðrenim tablosundaki ID'de olmayan bir deðeri girmemeliyiz.
												  --Örneðin 10 girelim ancak 10'un diðer tablomuzda bir karþýlýðý yok.
	1			AYÞE    a@a.com		2
	2			FATMA   f@f.com     3
	3			KEMAL   k@k.com     1
	4			ONUR    o@o.com     NULL
	5			MURAT   m@m.com     2
	6			YELÝZ   y@y.com     NULL

		      Öðrenim Tablosu                        
	-------------------------------------
	ID(PK)		ÖðrenimDurumu
	1			Üniversite
	2			Lise
	3			Bilinmiyor



*/

--TABLO YARATALIM:
--Personel Tablosunu GUÝ den yaratalým. Databasein altýnda Table saðtýk new table.
--Ve Veri insert edelim. Verileride EDÝT TOP 200 rows diyerek insert edelim.



--Personel
SELECT * FROM Personel

--Personel Tablosunu Sorguyla Yaratmak Ýstersek :
INSERT INTO [dbo].[Personel] VALUES
(1,'AYÞE','a@a.com',2),
(2,'FATMA','f@f.com',3),
(3,'KEMAL','k@k.com',1),
(4,'ONUR','o@o.com',NULL),
(5,'MURAT','m@m.com',2),
(6,'YELÝZ','y@y.com',NULL);

--Öðrenim tablosnuda sorguyla yaratatlým.

--Öðrenim Tablosu Yartama :

CREATE TABLE Ogrenim
(
ID INT NOT NULL PRIMARY KEY,
OgrenimDurumu VARCHAR(50) NOT NULL

);

INSERT INTO Ogrenim VALUES
(1,'Üniversite'),
(2,'Lise'),
(3,'Bilinmiyor');


SELECT * FROM Personel
SELECT * FROM Ogrenim



--Grafik olarak FK yaratalým:
--Personel Tablosunda Öðrenim ID kolonunun FK olmasýný istiyorum.
--Grefik olarak yapalým.:Tablo sað týk design:Sonra ilgili kolonu seç sað týk relationships.
--Sonra tables and colum specifications.
--Burada pk tablosu fk tablosunu belriliyoruz.
--Sonra kolonlarý belirliyorýuz.
--Þimdi Personel tablosunda Öðrenim ID'ye veri grimeye kalkarsak Öðrenim tablosunda olmayan bir ýd örneðin.Hata  alýrýz.

--Hata alýrýz.Çünkü Personel tablosundaki ÖðrenimID kolonuna Öðrenim tablosunda olmayan bir ID girmeye çalýþtýk.


INSERT INTO Personel VALUES
(7,'Ali','b.b.com',5);

SELECT * FROM Personel


--Grafikten deðilde sorguyla nasýl yazarýz?

--Ýlk önce mevcut FK kýsýtýný silelim.

ALTER TABLE Personel
DROP CONSTRAINT FK_Personel_Ogrenim;

--Þimdi tekrar FK kýsýtý yaratalým Personel tablosu için :
ALTER TABLE Personel
ADD CONSTRAINT FK_OgrenýmId_FK
FOREIGN KEY (ÖðrenimID) REFERENCES Ogrenim(ID);


SELECT * FROM [dbo].[Personel]
SELECT * FROM [dbo].[Ogrenim]




------------------------------------------



--BÖLÜM 3: Adding Default Constraint:
--Insert edelim Personel tablosuna SADECE 3 kolona,Öðrenim ýd'ye bir þey girmeyelim.

SELECT * FROM [dbo].[Personel]

INSERT INTO [dbo].[Personel] (ID,AD,EMAÝL) VALUES (7,'Melek','aa@aa.com')



--Burada öðrenim ýd'yi girmediðim için NULL geldi.Ama ben baþka bir þey gelsin istiyorum mesela:
--Mesela direk olarak ÖðrenimID 3 gelsin.
--Bunu default constraint ile yaparaýz.

/*
Altering an existing column to add a default constraint:
ALTER TABLE { TABLE_NAME }
ADD CONSTRAINT { CONSTRAINT_NAME }
DEFAULT { DEFAULT_VALUE } FOR { EXISTING_COLUMN_NAME }
*/



/*

Adding a new column, with default value, to an existing table:
ALTER TABLE { TABLE_NAME } 
ADD { COLUMN_NAME } { DATA_TYPE } { NULL | NOT NULL } 
CONSTRAINT { CONSTRAINT_NAME } DEFAULT { DEFAULT_VALUE }

*/



/*

To drop a constraint
ALTER TABLE { TABLE_NAME } 
DROP CONSTRAINT { CONSTRAINT_NAME }
*/

--Defult ekleyrlim ÖðrenimID kolonuna
--Altering an existing column to add a default constraint:
ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT DF_Personel_ÖðrenimID
DEFAULT 3 FOR [ÖðrenimID];

--ÞÝMDÝ ÖðrenimID olmadan veri insert edelim:

INSERT INTO [dbo].[Personel] (ID,AD,EMAÝL) VALUES (8,'Cem','cem@cem.com')

SELECT * FROM [dbo].[Personel]

--ÞÝMDÝ ÖðrenimID DE GÝRELÝM, O ZAMAN girdiðim veri ile girecek:

INSERT INTO [dbo].[Personel] (ID,AD,EMAÝL,ÖðrenimID) VALUES (9,'Hasan','ha@ha.com',1)

--ÞÝMDÝ ÖðrenimID'YE NULL girelim:
--NUll deðer atrasak default çalýþmöayacak ve NULL gözükecek.


INSERT INTO [dbo].[Personel] (ID,AD,EMAÝL,ÖðrenimID) VALUES (10,'Veli','v@v.com',NULL)

SELECT * FROM [dbo].[Personel]

--DROP EDELÝM:

ALTER TABLE [dbo].[Personel]
DROP CONSTRAINT DF_Personel_ÖðrenimID



--BÖLÜM 4: CASCADE:
SELECT * FROM [dbo].[Personel]
SELECT * FROM [dbo].[Ogrenim]


--Cascading Referenatial integrity ne demek ?
----------------------------------------------

--Eðer bir kullanýcý FK'nin iþaret ettiði PK kolonunda bir silme iþlemi gerçeklþtiðinde ne gibi iþlemler 
--yapabileceðimiz bize söyler.
--Örneðin biz gidip Ogrenim tablsounda ID = 1'i silersek,
--Personel tablosundaki 3nolu id'nin öÐRENÝM ID'si'de 1. Peki bu durumda o kayýda ne olacak.
--Böyle olursa bu 3'nolu ID orphan record olur.
--Bu satýrýn öðrenim durumunu söyleyemeyiz.
--Dolayýsyla Cascading Referenatial integrity constraint bize bu gibi durumlarda hangi aksiyonlarý alabileceðimiz gösterir.
--Default olarak iþlem hata verir (NO ACTION)ve DELETE VEYA UPDATE iþlemi rollback edilir.
--Bu ayarlarý FK'nin içerisinde INSERT AND UPDATE specification içerisinde ayarlayabiliriz.


--ALABÝLECEÐÝMÝZ AKSÝYONLAR:
-----------------------------

--NO ACTION :HATA VERÝR VE DELETE UPDATE ÝÞLEMÝ ROLLBACK EDÝLÝR.
--CASCADE: ÝLGÝLÝ FK'LARDA SÝLÝNÝR VEYA UPDATE EDÝLÝR.
--SET NULL : ÝLGÝLÝ FK NULL OLUR.
--SET DEFAULT :EÐER NULL BÝR DEÐER VERDÝYSEK ÝLGÝLÝ FK KOLONU NULL OLUR.

--ÖRNEK:

DELETE FROM [dbo].[Ogrenim]
WHERE ID =1;



--SET DEFAULT:
--DEFAULT YARATALIM:
--Yani eðer öðrenim ýd kolonu için veri girilzmese default olarak 3 olacak.
--
ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT DF_Personel_ÖðrenimID
DEFAULT 3 FOR [ÖðrenimID];
---Ýlgili FK'nýn içinde INSERT AND UPDATE spec.içerisinde,delete rule'a default diyebiliriz.

--þimdi Bir ID silelim Öðrenim tablsundan.

DELETE FROM [dbo].[Ogrenim]
WHERE ID =1;

select * from [dbo].[Ogrenim]
select * from [dbo].[Personel]


--NULL YAPALIM:
DELETE FROM [dbo].[Ogrenim]
WHERE ID =2;

--CASCADE YAPALIM:
DELETE FROM [dbo].[Ogrenim]
WHERE ID =3;





--BÖLÜM 5: ADDING A CHECK CONSTRAINT:
--KOlona girilecek deðerleri kýsýtlayabiliriz.

SELECT * FROM [dbo].[Ogrenim]

SELECT * FROM [dbo].[Personel]

/*

The general formula for adding check constraint in SQL Server:

ALTER TABLE { TABLE_NAME }
ADD CONSTRAINT { CONSTRAINT_NAME } CHECK ( BOOLEAN_EXPRESSION )

veya

ALTER TABLE Kiþiler
ADD CHECK (Age>=18);


*/


/*
To drop the CHECK constraint:
ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age
*/

--Yaþ adýnda Kolon ekleyelim Personel Tablosuna:
--GUÝ'den yaptým.

--Örneðin yaþa þu anda -100 deðeri girebilirim.

SELECT * FROM [dbo].[Personel]
INSERT INTO [dbo].[Personel] VALUES (11,'Sema','ss@ss.com',2,-100)

--Bunu engellemek istiyorum:
--Ama ilk baþta -1oo olan satýrý silelim.
DELETE FROM  [dbo].[Personel] WHERE ID = 11;
---Sorguyla aþaðýdaki gibi oluþturabiliriz.
ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT ch_yas CHECK (Yaþ>=0 AND Yaþ<=100)

--Þimdi veri insert edelim. Aþaðýda hata almayýz:
INSERT INTO [dbo].[Personel] VALUES (11,'Sema','ss@ss.com',2,100)

--Ama aþaðýdakinde hata alýrýz. Çünkü yaþý 101 girdik.
INSERT INTO [dbo].[Personel] VALUES (12,'Sema','ss@ss.com',2,101)

--Check constrsinti drop edelim :
ALTER TABLE Personel
DROP CONSTRAINT ch_yas;

--Þimdi veri insert edelim.-1000 diyelim yaþa. Hata almayýz. Çünkü kýsýtý kaldýrdýk.
INSERT INTO [dbo].[Personel] VALUES (15,'Sema','ss@ss.com',2,-1000)
SELECT * FROM [dbo].[Personel]

DELETE FROM Personel
WHERE ID = 15

--Ama ben guý üzerinden yapýcam.
--Tablonun içinde constraintte sað týk new constarint.
--Bize defult olarak check constriant geldi zaten oradan expression kýsmýna boolean exp'i yazýcam.
--Orada YAS > 0 AND YAS <100 diyebilrizi. Yada direk sorguyla yapabiliriz.

ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT ch_yas CHECK (YAS>0 AND YAS<100)



--ÞÝMDÝ ÝÞNSERT ETMEYE ÇALIÞLAIM:
SELECT * FROM [dbo].[Personel]
INSERT INTO [dbo].[Personel] VALUES (17,'Sema','ss@ss.com',2,100)--ETMEDÝ


SELECT * FROM [dbo].[Personel]
INSERT INTO [dbo].[Personel] VALUES (7,'Sema','ss@ss.com',2,0)--ETMEDÝ

INSERT INTO [dbo].[Personel] VALUES (7,'Sema','ss@ss.com',2,10)--ETTÝ.


--NULL YAZARSAM NE OLUR:
INSERT INTO [dbo].[Personel] VALUES (18,'Sema','ss@ss.com',2,NULL)--ETTÝ.

--DROP EDELÝM
ALTER TABLE [dbo].[Personel]
DROP CONSTRAINT CK_Personel



--BÖLÜM 6: IDENTITIY:
--ýDENTÝTÝY kolon olup olmadýðýný kolon sað týk propertiees IdENTÝTY False DÝyor.
--Identitiy kolon deðilse kendimiz veri vermek zorundayýz.
--Yeni tablo yaratalým: Guiden orada idendity specification var. Oradan da yapabiliriz.

CREATE TABLE [IDENTITY]
(
ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);


SELECT * FROM [dbo].[IDENTITY]

INSERT INTO [dbo].[IDENTITY] (Name) values('Onur')

INSERT INTO [dbo].[IDENTITY] (Name) values('Kemal')

INSERT INTO [dbo].[IDENTITY] (Name) values('Murat')

--DELETE EDELÝM :
DELETE FROM [dbo].[IDENTITY] WHERE ID =1;

--ÞÝMDÝ YENÝ ÝNSERT EDELÝM :
INSERT INTO [dbo].[IDENTITY] (Name) values('FATMNA')
--Tekrar 4'ten baþladý.

--Þimdi burada boþluk oluþtu yani 4 verdi. Ben tekrar 1'den baþlatmak istesem nasýl yapýcam:
--SET IDENTITY_INSERT [dbo].[IDENTITY] ON;

SET IDENTITY_INSERT [dbo].[IDENTITY] ON;
--þimdi aþaðýdaki þekilde girebilirim.

INSERT INTO [dbo].[IDENTITY] (ID,Name) values(1,'Ezgi')
SELECT * FROM [dbo].[IDENTITY]

--þimdi kapatabilirm ve sonra veri insert etmeye devam edebilir.
SET IDENTITY_INSERT [dbo].[IDENTITY] OFF;

INSERT INTO [dbo].[IDENTITY] (Name) values('Lale')

SELECT * FROM [dbo].[IDENTITY]

--QUERY ÝLE OLUÞTURMA :
Create Table tblPerson
(
PersonId int Identity(1,1) Primary Key,
Name nvarchar(20)
)


--EÐER TÜM SATIRLARI SÝLERSEK ,VE YENÝ VERÝ GÝRERSEK Tekrar gapli baþlar:

SELECT * FROM [dbo].[IDENTITY]

DELETE FROM [dbo].[IDENTITY]

INSERT INTO [dbo].[IDENTITY] (Name) values('Lale')
--6'DAN BAÞLAR

--TRUNCAT EDELÝM:--TRUNCATE EDERSEK 1'DEN BAÞLAR.
TRUNCATE TABLE [dbo].[IDENTITY]
SELECT * FROM [dbo].[IDENTITY]

INSERT INTO [dbo].[IDENTITY] (Name) values('Lale')
INSERT INTO [dbo].[IDENTITY] (Name) values('VELÝ')
INSERT INTO [dbo].[IDENTITY] (Name) values('ALÝ')


--BÖLÜM 7: UNIQUE KEY CONSTRAINT:

--Hem PK hem de unique constraint kolonlarýn unique olmasýný saðlar.
--Ama baþka kolonlarýda unique yapmak istiyorsak tabloda bir tane pk olacaðýndan dolayý 
--unique cons.kullanmalýyýz.
--UNIQUE KEY CONSTRAINT kolondaki deðerlerin unique olmasýný saðlar.
--Dublicate deðer olmaz artýk unique cons.tanýmladýðýmýz kolon.
--Tabloda bir tek PK olabilir ama istediðimiz kadar unique key olabilir.
--PK null deðerlere izin vermez ama unique key'in izin verdiðini de unutmamak gereklidir.
--PK kýsýtýnda otomatik olarak UNIQE cons'da yaratýlýr.

--
/*

To add a unique constraint using SQL server management studio designer:
1. Right-click on the table and select Design
2. Right-click on the column, and select Indexes/Keys...
3. Click Add
4. For Columns, select the column name you want to be unique.
Adýný ver unique keyin
5. Is unique yes.
5. For Type, choose Unique Key.
6. Click Close, Save the table.


--KOLONU SEÇÝN

*/



/*
To create the unique key using a query:
Alter Table Table_Name
Add Constraint Constraint_Name Unique(Column_Name)
*/


/*

Alter Table tblPerson
Drop COnstraint UQ_tblPerson_Email


*/

--QUERY ÝLE :
TRUNCATE TABLE [dbo].[IDENTITY]

SELECT * FROM [dbo].[IDENTITY]

--ÖRNEK
Alter Table [dbo].[IDENTITY]
Add Constraint UQ_Ad Unique(Name)

INSERT INTO [dbo].[IDENTITY] VALUES 
('Onur'),
('Onur');--HATA VERÝR.

--DROP EDELÝM :
Alter Table [dbo].[IDENTITY]
Drop COnstraint UQ_AD

INSERT INTO [dbo].[IDENTITY] VALUES 
('Onur'),
('Onur');--HATA VERMEZ ARTIK