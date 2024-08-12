----- SQL Komutlar� ve Constraints B�l�m AL��t�rmas� ----------

--B�L�M 1: Create ,Alter - Drop Database :

--Gui �zerinden database yaratma.
--Query kullanarak database �retmek:
CREATE DATABASE DenemeVeri
--Rename a database:
	--Gene 3 yolu var : Gui �zerinden(database sa�t�k rename), ve sorgu yazarak.Birde exex sp_renameDB 'Eski Ad','Yeni Ad'
	--SYNTAX :ALTER DATABASE Eski AD Modify Name Yeni AD:
	ALTER DATABASE DenemeVeri Modify Name = Deneme1
	exec sp_renameDB 'Deneme1','DenemeVeri'

--Delete a database:
--Drop etti�imiz database'i kullan�yor olmamam�z laz�m.Ba�kas� kullan�rken bende silemem.
--2 yolu var: GU�---Sa�t�k delete
			DROP DATABASE Deneme


--B�L�M 2: Creatating And Working With Tables:
-- 2 Tane tablo yaratal�m : Pers onel ve Cinsiyet diye.VE pk VE fk atamalar�n� yapal�m.
--Tablolar 2 �ekilde yarat�labilir :GUI ve query.
--FK atamalar� 2 �ekilde yap�labilir : GUI ve Query.

--FK atamas� Sorgu ile :

Alter table ForeignKeyTable add constraint ForeignKeyTable_ForiegnKeyColumn_FK 
FOREIGN KEY (ForiegnKeyColumn) references PrimaryKeyTable (PrimaryKeyColumn)

--T�rk�esi
ALTER TABLE FKTablosu
ADD CONSTRAINT ConstraintAd�
FOREIGN KEY (FK kolonu) REFERENCES PKTablosu(PK Kolonu)
--------------------------


--�zetle;
--FK'lar database b�t�nl���n� sa�lamak i�indir.
--Bir tablodaki FK di�er tablodaki, PK'd�r.
--FK anahtar� FK kolonuna yanl�� veri girilmesini engeller.
--FK kolonuna girdi�imiz de�erler,PK kolonundaki verilerden biri olmal�.
--PK ise verilerin tekili olmas�n� sa�lar.Ayn� veriyri giremeyiz PK'da s�tununda.
--PK kolonunu TCKN gibi d���nebiliriz.Null de�erde alamazlar.

---�RNEK :
/*
	          Personel Tablosu                          
	-------------------------------------
	ID(PK)		AD		Email		��renimID (FK)--Biz buraya ��renim tablosundaki ID'de olmayan bir de�eri girmemeliyiz.
												  --�rne�in 10 girelim ancak 10'un di�er tablomuzda bir kar��l��� yok.
	1			AY�E    a@a.com		2
	2			FATMA   f@f.com     3
	3			KEMAL   k@k.com     1
	4			ONUR    o@o.com     NULL
	5			MURAT   m@m.com     2
	6			YEL�Z   y@y.com     NULL

		      ��renim Tablosu                        
	-------------------------------------
	ID(PK)		��renimDurumu
	1			�niversite
	2			Lise
	3			Bilinmiyor



*/

--TABLO YARATALIM:
--Personel Tablosunu GU� den yaratal�m. Databasein alt�nda Table sa�t�k new table.
--Ve Veri insert edelim. Verileride ED�T TOP 200 rows diyerek insert edelim.



--Personel
SELECT * FROM Personel

--Personel Tablosunu Sorguyla Yaratmak �stersek :
INSERT INTO [dbo].[Personel] VALUES
(1,'AY�E','a@a.com',2),
(2,'FATMA','f@f.com',3),
(3,'KEMAL','k@k.com',1),
(4,'ONUR','o@o.com',NULL),
(5,'MURAT','m@m.com',2),
(6,'YEL�Z','y@y.com',NULL);

--��renim tablosnuda sorguyla yaratatl�m.

--��renim Tablosu Yartama :

CREATE TABLE Ogrenim
(
ID INT NOT NULL PRIMARY KEY,
OgrenimDurumu VARCHAR(50) NOT NULL

);

INSERT INTO Ogrenim VALUES
(1,'�niversite'),
(2,'Lise'),
(3,'Bilinmiyor');


SELECT * FROM Personel
SELECT * FROM Ogrenim



--Grafik olarak FK yaratal�m:
--Personel Tablosunda ��renim ID kolonunun FK olmas�n� istiyorum.
--Grefik olarak yapal�m.:Tablo sa� t�k design:Sonra ilgili kolonu se� sa� t�k relationships.
--Sonra tables and colum specifications.
--Burada pk tablosu fk tablosunu belriliyoruz.
--Sonra kolonlar� belirliyor�uz.
--�imdi Personel tablosunda ��renim ID'ye veri grimeye kalkarsak ��renim tablosunda olmayan bir �d �rne�in.Hata  al�r�z.

--Hata al�r�z.��nk� Personel tablosundaki ��renimID kolonuna ��renim tablosunda olmayan bir ID girmeye �al��t�k.


INSERT INTO Personel VALUES
(7,'Ali','b.b.com',5);

SELECT * FROM Personel


--Grafikten de�ilde sorguyla nas�l yazar�z?

--�lk �nce mevcut FK k�s�t�n� silelim.

ALTER TABLE Personel
DROP CONSTRAINT FK_Personel_Ogrenim;

--�imdi tekrar FK k�s�t� yaratal�m Personel tablosu i�in :
ALTER TABLE Personel
ADD CONSTRAINT FK_Ogren�mId_FK
FOREIGN KEY (��renimID) REFERENCES Ogrenim(ID);


SELECT * FROM [dbo].[Personel]
SELECT * FROM [dbo].[Ogrenim]




------------------------------------------



--B�L�M 3: Adding Default Constraint:
--Insert edelim Personel tablosuna SADECE 3 kolona,��renim �d'ye bir �ey girmeyelim.

SELECT * FROM [dbo].[Personel]

INSERT INTO [dbo].[Personel] (ID,AD,EMA�L) VALUES (7,'Melek','aa@aa.com')



--Burada ��renim �d'yi girmedi�im i�in NULL geldi.Ama ben ba�ka bir �ey gelsin istiyorum mesela:
--Mesela direk olarak ��renimID 3 gelsin.
--Bunu default constraint ile yapara�z.

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

--Defult ekleyrlim ��renimID kolonuna
--Altering an existing column to add a default constraint:
ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT DF_Personel_��renimID
DEFAULT 3 FOR [��renimID];

--��MD� ��renimID olmadan veri insert edelim:

INSERT INTO [dbo].[Personel] (ID,AD,EMA�L) VALUES (8,'Cem','cem@cem.com')

SELECT * FROM [dbo].[Personel]

--��MD� ��renimID DE G�REL�M, O ZAMAN girdi�im veri ile girecek:

INSERT INTO [dbo].[Personel] (ID,AD,EMA�L,��renimID) VALUES (9,'Hasan','ha@ha.com',1)

--��MD� ��renimID'YE NULL girelim:
--NUll de�er atrasak default �al��m�ayacak ve NULL g�z�kecek.


INSERT INTO [dbo].[Personel] (ID,AD,EMA�L,��renimID) VALUES (10,'Veli','v@v.com',NULL)

SELECT * FROM [dbo].[Personel]

--DROP EDEL�M:

ALTER TABLE [dbo].[Personel]
DROP CONSTRAINT DF_Personel_��renimID



--B�L�M 4: CASCADE:
SELECT * FROM [dbo].[Personel]
SELECT * FROM [dbo].[Ogrenim]


--Cascading Referenatial integrity ne demek ?
----------------------------------------------

--E�er bir kullan�c� FK'nin i�aret etti�i PK kolonunda bir silme i�lemi ger�ekl�ti�inde ne gibi i�lemler 
--yapabilece�imiz bize s�yler.
--�rne�in biz gidip Ogrenim tablsounda ID = 1'i silersek,
--Personel tablosundaki 3nolu id'nin ��REN�M ID'si'de 1. Peki bu durumda o kay�da ne olacak.
--B�yle olursa bu 3'nolu ID orphan record olur.
--Bu sat�r�n ��renim durumunu s�yleyemeyiz.
--Dolay�syla Cascading Referenatial integrity constraint bize bu gibi durumlarda hangi aksiyonlar� alabilece�imiz g�sterir.
--Default olarak i�lem hata verir (NO ACTION)ve DELETE VEYA UPDATE i�lemi rollback edilir.
--Bu ayarlar� FK'nin i�erisinde INSERT AND UPDATE specification i�erisinde ayarlayabiliriz.


--ALAB�LECE��M�Z AKS�YONLAR:
-----------------------------

--NO ACTION :HATA VER�R VE DELETE UPDATE ��LEM� ROLLBACK ED�L�R.
--CASCADE: �LG�L� FK'LARDA S�L�N�R VEYA UPDATE ED�L�R.
--SET NULL : �LG�L� FK NULL OLUR.
--SET DEFAULT :E�ER NULL B�R DE�ER VERD�YSEK �LG�L� FK KOLONU NULL OLUR.

--�RNEK:

DELETE FROM [dbo].[Ogrenim]
WHERE ID =1;



--SET DEFAULT:
--DEFAULT YARATALIM:
--Yani e�er ��renim �d kolonu i�in veri girilzmese default olarak 3 olacak.
--
ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT DF_Personel_��renimID
DEFAULT 3 FOR [��renimID];
---�lgili FK'n�n i�inde INSERT AND UPDATE spec.i�erisinde,delete rule'a default diyebiliriz.

--�imdi Bir ID silelim ��renim tablsundan.

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





--B�L�M 5: ADDING A CHECK CONSTRAINT:
--KOlona girilecek de�erleri k�s�tlayabiliriz.

SELECT * FROM [dbo].[Ogrenim]

SELECT * FROM [dbo].[Personel]

/*

The general formula for adding check constraint in SQL Server:

ALTER TABLE { TABLE_NAME }
ADD CONSTRAINT { CONSTRAINT_NAME } CHECK ( BOOLEAN_EXPRESSION )

veya

ALTER TABLE Ki�iler
ADD CHECK (Age>=18);


*/


/*
To drop the CHECK constraint:
ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age
*/

--Ya� ad�nda Kolon ekleyelim Personel Tablosuna:
--GU�'den yapt�m.

--�rne�in ya�a �u anda -100 de�eri girebilirim.

SELECT * FROM [dbo].[Personel]
INSERT INTO [dbo].[Personel] VALUES (11,'Sema','ss@ss.com',2,-100)

--Bunu engellemek istiyorum:
--Ama ilk ba�ta -1oo olan sat�r� silelim.
DELETE FROM  [dbo].[Personel] WHERE ID = 11;
---Sorguyla a�a��daki gibi olu�turabiliriz.
ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT ch_yas CHECK (Ya�>=0 AND Ya�<=100)

--�imdi veri insert edelim. A�a��da hata almay�z:
INSERT INTO [dbo].[Personel] VALUES (11,'Sema','ss@ss.com',2,100)

--Ama a�a��dakinde hata al�r�z. ��nk� ya�� 101 girdik.
INSERT INTO [dbo].[Personel] VALUES (12,'Sema','ss@ss.com',2,101)

--Check constrsinti drop edelim :
ALTER TABLE Personel
DROP CONSTRAINT ch_yas;

--�imdi veri insert edelim.-1000 diyelim ya�a. Hata almay�z. ��nk� k�s�t� kald�rd�k.
INSERT INTO [dbo].[Personel] VALUES (15,'Sema','ss@ss.com',2,-1000)
SELECT * FROM [dbo].[Personel]

DELETE FROM Personel
WHERE ID = 15

--Ama ben gu� �zerinden yap�cam.
--Tablonun i�inde constraintte sa� t�k new constarint.
--Bize defult olarak check constriant geldi zaten oradan expression k�sm�na boolean exp'i yaz�cam.
--Orada YAS > 0 AND YAS <100 diyebilrizi. Yada direk sorguyla yapabiliriz.

ALTER TABLE [dbo].[Personel]
ADD CONSTRAINT ch_yas CHECK (YAS>0 AND YAS<100)



--��MD� ��NSERT ETMEYE �ALI�LAIM:
SELECT * FROM [dbo].[Personel]
INSERT INTO [dbo].[Personel] VALUES (17,'Sema','ss@ss.com',2,100)--ETMED�


SELECT * FROM [dbo].[Personel]
INSERT INTO [dbo].[Personel] VALUES (7,'Sema','ss@ss.com',2,0)--ETMED�

INSERT INTO [dbo].[Personel] VALUES (7,'Sema','ss@ss.com',2,10)--ETT�.


--NULL YAZARSAM NE OLUR:
INSERT INTO [dbo].[Personel] VALUES (18,'Sema','ss@ss.com',2,NULL)--ETT�.

--DROP EDEL�M
ALTER TABLE [dbo].[Personel]
DROP CONSTRAINT CK_Personel



--B�L�M 6: IDENTITIY:
--�DENT�T�Y kolon olup olmad���n� kolon sa� t�k propertiees IdENT�TY False D�yor.
--Identitiy kolon de�ilse kendimiz veri vermek zorunday�z.
--Yeni tablo yaratal�m: Guiden orada idendity specification var. Oradan da yapabiliriz.

CREATE TABLE [IDENTITY]
(
ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);


SELECT * FROM [dbo].[IDENTITY]

INSERT INTO [dbo].[IDENTITY] (Name) values('Onur')

INSERT INTO [dbo].[IDENTITY] (Name) values('Kemal')

INSERT INTO [dbo].[IDENTITY] (Name) values('Murat')

--DELETE EDEL�M :
DELETE FROM [dbo].[IDENTITY] WHERE ID =1;

--��MD� YEN� �NSERT EDEL�M :
INSERT INTO [dbo].[IDENTITY] (Name) values('FATMNA')
--Tekrar 4'ten ba�lad�.

--�imdi burada bo�luk olu�tu yani 4 verdi. Ben tekrar 1'den ba�latmak istesem nas�l yap�cam:
--SET IDENTITY_INSERT [dbo].[IDENTITY] ON;

SET IDENTITY_INSERT [dbo].[IDENTITY] ON;
--�imdi a�a��daki �ekilde girebilirim.

INSERT INTO [dbo].[IDENTITY] (ID,Name) values(1,'Ezgi')
SELECT * FROM [dbo].[IDENTITY]

--�imdi kapatabilirm ve sonra veri insert etmeye devam edebilir.
SET IDENTITY_INSERT [dbo].[IDENTITY] OFF;

INSERT INTO [dbo].[IDENTITY] (Name) values('Lale')

SELECT * FROM [dbo].[IDENTITY]

--QUERY �LE OLU�TURMA :
Create Table tblPerson
(
PersonId int Identity(1,1) Primary Key,
Name nvarchar(20)
)


--E�ER T�M SATIRLARI S�LERSEK ,VE YEN� VER� G�RERSEK Tekrar gapli ba�lar:

SELECT * FROM [dbo].[IDENTITY]

DELETE FROM [dbo].[IDENTITY]

INSERT INTO [dbo].[IDENTITY] (Name) values('Lale')
--6'DAN BA�LAR

--TRUNCAT EDEL�M:--TRUNCATE EDERSEK 1'DEN BA�LAR.
TRUNCATE TABLE [dbo].[IDENTITY]
SELECT * FROM [dbo].[IDENTITY]

INSERT INTO [dbo].[IDENTITY] (Name) values('Lale')
INSERT INTO [dbo].[IDENTITY] (Name) values('VEL�')
INSERT INTO [dbo].[IDENTITY] (Name) values('AL�')


--B�L�M 7: UNIQUE KEY CONSTRAINT:

--Hem PK hem de unique constraint kolonlar�n unique olmas�n� sa�lar.
--Ama ba�ka kolonlar�da unique yapmak istiyorsak tabloda bir tane pk olaca��ndan dolay� 
--unique cons.kullanmal�y�z.
--UNIQUE KEY CONSTRAINT kolondaki de�erlerin unique olmas�n� sa�lar.
--Dublicate de�er olmaz art�k unique cons.tan�mlad���m�z kolon.
--Tabloda bir tek PK olabilir ama istedi�imiz kadar unique key olabilir.
--PK null de�erlere izin vermez ama unique key'in izin verdi�ini de unutmamak gereklidir.
--PK k�s�t�nda otomatik olarak UNIQE cons'da yarat�l�r.

--
/*

To add a unique constraint using SQL server management studio designer:
1. Right-click on the table and select Design
2. Right-click on the column, and select Indexes/Keys...
3. Click Add
4. For Columns, select the column name you want to be unique.
Ad�n� ver unique keyin
5. Is unique yes.
5. For Type, choose Unique Key.
6. Click Close, Save the table.


--KOLONU SE��N

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

--QUERY �LE :
TRUNCATE TABLE [dbo].[IDENTITY]

SELECT * FROM [dbo].[IDENTITY]

--�RNEK
Alter Table [dbo].[IDENTITY]
Add Constraint UQ_Ad Unique(Name)

INSERT INTO [dbo].[IDENTITY] VALUES 
('Onur'),
('Onur');--HATA VER�R.

--DROP EDEL�M :
Alter Table [dbo].[IDENTITY]
Drop COnstraint UQ_AD

INSERT INTO [dbo].[IDENTITY] VALUES 
('Onur'),
('Onur');--HATA VERMEZ ARTIK