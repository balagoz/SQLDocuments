--- ### KULLANICI TANIMLI FONKS�YONLAR BA�LANGI� ### ---

--1 :	Scaler Fonksiyonlar (Tek bir de�er d�nd�ren fonksiyonlar)
--2 :	Inline Tablo De�er D�nen Fonksiyonlar (Tablo �eklinde de�er d�nen fonk.)
--3	:	MultiStatement Tablo De�er D�nen Fonksiyonlar (Tablo �eklinde de�er d�nen fonk.)

--- ### KULLANICI TANIMLI FONKS�YONLAR B�T�� ### ---




--- ### VARIABLES BA�LANGI� ### ---

--Variable Nedir?
--Belirli bir data tipinde bir de�er tutan objedir.
--Nerelerde Kullan�l�r:
	--Bir d�ng�n�n ka� kez ger�ekle�ti�ini saymak i�in bir d�ng� sayac� olarak.
	--While ifadesi gibi ak�� kontrolerinde test edilecek de�eri tutmak i�in
	--Stored Proc veya Fonk. taraf�ndan d�nd�r�len de�eri saklamak i�in.

--KONU 1 :De�i�ken Atama :
--Declare ifadesi
--@i�areti kullan�l�r.
--Veritipi belirlenir.
--Bir de�i�ken yarat�ld���nda veri tipi default olarak null'dur.
--1.yol:
DECLARE @y�l INT

--2.yol: AS ifadesini de kullanabiliriz.
DECLARE @y�l AS INT

--Birden fazla de�i�keni atamak i�in :
DECLARE @y�l AS INT,@ay AS INT,....


--KONU 2 :De�i�kene Veri Atama :
--SET ifadesi kullan�l�r.

DECLARE @y�l INT
SET @y�l = 2022
--VEYA
--�RNEK:
DECLARE @y�l INT = 2022
SELECT @y�l

--�RNEK:
DECLARE @y�l INT
SET @y�l = 2023
PRINT @y�l

--KONU 3 :De�i�keni Sorguda Kullanma :
--�RNEK :
DECLARE @y�l INT
SET @y�l = 2009

SELECT [BusinessEntityID],[FirstName],[ModifiedDate] FROM [Person].[Person]
WHERE YEar([ModifiedDate])=@y�l


--KONU 4 :SORGU SONUCUNU DE���KENDE TUTMA :

--�RNEK:
DECLARE @Adet INT
SET @Adet = (SELECT COUNT([BusinessEntityID]) FROM HumanResources.Employee)
---G�stermek ��in Select veya PRINT Kullan�r��z: SELECT @Adet veya PRINT Adet
SELECT @Adet
PRINT '�al��an Adedi' + ' ' + CAST(@Adet AS VARCHAR(MAX))
--VEYA
PRINT @Adet



--KONU 5 :De�i�kene Kolon Atama:
--�RNEK:
DECLARE @Cinsiyet VARCHAR(2)
DECLARE @ID INT

SELECT
@ID=[BusinessEntityID],
@Cinsiyet=[Gender]
FROM HumanResources.Employee
where [BusinessEntityID]=1

SELECT @ID,@Cinsiyet


SELECT * FROM HumanResources.Employee

--KONU 6 :��kan sonucu de�i�kene Toplama :
--�RNEK:
CREATE PROC DenemeProc (@Cinsiyet VARCHAR(1))
AS
BEGIN
	    DECLARE @product_list VARCHAR(MAX);

		SET @product_list = '';

		SELECT
		@product_list= @product_list + ' ' + NationalIDNumber
		FROM HumanResources.Employee
		where Gender=@Cinsiyet
		
		PRINT @product_list
END

EXEC DenemeProc M

SELECT * FROM HumanResources.Employee

--Mant���:
PRINT CAST(295847284 AS VARCHAR) + ' ' + CAST(509647174 AS VARCHAR)


--KONU 7 :Stored.Prodc ile D��ar�dan De�i�ken ATama :
create PROC DenemeProcccccc (@Cinsiyet VARCHAR(1))
AS
BEGIN
	

		SELECT
		NationalIDNumber
		FROM HumanResources.Employee
		where Gender=@Cinsiyet
		

END

EXEC DenemeProcccccc M


--KONU 8 :GENEL VARIABLE �RNEK :

--SORGU :
CREATE TABLE Film
(
FilmAd� Varchar(max),
FillmC�k�sTarihi DATE
);

CREATE TABLE Actor
(
ActorAd� Varchar(max),
ActorDT DATE
);

CREATE TABLE Yonetmen
(
YonetmenAd� Varchar(max),
YonetmenDT DATE
);


INSERT INTO Film VALUES 
('ABC','1998.01.01'),
('DEF','1997.01.01'),
('XYZ','1996.01.01');

INSERT INTO Actor VALUES 
('Onur','2000.01.01'),
('Murat','1999.01.01'),
('Fatma','1990.01.01');



INSERT INTO Yonetmen VALUES 
('Nuri','1950.01.01'),
('Bilge','1960.01.01'),
('Ceylan','1970.01.01');

SELECT * FROM Film
SELECT * FROM Actor
SELECT * FROM Yonetmen


--��YLE B�R SORGUMUZ OLSUN

SELECT FilmAd�,FillmC�k�sTarihi,'Film' AS [Type] FROM Film
where FillmC�k�sTarihi <='1996.01.01'
UNION ALL
SELECT ActorAd�,ActorDT,'Aktor' AS [Type] FROM Actor
where ActorDT <='1996.01.01'
UNION ALL
SELECT YonetmenAd�,YonetmenDT,'Yonetmen' AS [Type] FROM Yonetmen
where YonetmenDT <='1996.01.01'

--Biz hep ayn� tarihi kulland�k.Dolay�s�yla bunu de�i�ken olarak kullanmka mant�kl�.

--DE���KEN YARATAMA:
DECLARE @Tarih DATETIME
--DE���KENe VER� ATAMA:
SET @Tarih ='1996.01.01'
--De�i�keni Sorgu ��inde Kullanma:
SELECT FilmAd�,FillmC�k�sTarihi,'Film' AS [Type] FROM Film
where FillmC�k�sTarihi <=@Tarih
UNION ALL
SELECT ActorAd�,ActorDT,'Aktor' AS [Type] FROM Actor
where ActorDT <=@Tarih
UNION ALL
SELECT YonetmenAd�,YonetmenDT,'Yonetmen' AS [Type] FROM Yonetmen
where YonetmenDT <=@Tarih






--Sorgu Sonucunu De�i�kende Tutma:
DECLARE @Cinsiyet1 as varchar(max)
DECLARE @Adet1 AS INT
SET @Cinsiyet1 ='M'
SET @Adet1 = (SELECT COUNT(*) FROM [HumanResources].[Employee] WHERE Gender=@Cinsiyet1)
SELECT @Adet1
--De�i�keni Kolona Atama:

--Burada set yok,direk kolona atama var.
DECLARE @Cinsiyet VARCHAR(2)
DECLARE @ID INT

SELECT
@ID=[BusinessEntityID],
@Cinsiyet=[Gender]
FROM HumanResources.Employee
where [BusinessEntityID]=3

SELECT @ID,@Cinsiyet

---### GLOBAL DE���KENLER ### ---
--Bunlar haz�r sistem de�i�kenleridir.
--�RNEKLER:
select @@SERVERNAME
select @@VERSION
select @@ ROWCOUNT

SELECT * FROM HumanResources.Employee
select @@ROWCOUNT



--- ### VARIABLES B�T�� ### ---