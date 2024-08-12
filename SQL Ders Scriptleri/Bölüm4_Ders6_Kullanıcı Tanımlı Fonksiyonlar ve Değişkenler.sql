--- ### KULLANICI TANIMLI FONKSÝYONLAR BAÞLANGIÇ ### ---

--1 :	Scaler Fonksiyonlar (Tek bir deðer döndüren fonksiyonlar)
--2 :	Inline Tablo Deðer Dönen Fonksiyonlar (Tablo þeklinde deðer dönen fonk.)
--3	:	MultiStatement Tablo Deðer Dönen Fonksiyonlar (Tablo þeklinde deðer dönen fonk.)

--- ### KULLANICI TANIMLI FONKSÝYONLAR BÝTÝÞ ### ---




--- ### VARIABLES BAÞLANGIÇ ### ---

--Variable Nedir?
--Belirli bir data tipinde bir deðer tutan objedir.
--Nerelerde Kullanýlýr:
	--Bir döngünün kaç kez gerçekleþtiðini saymak için bir döngü sayacý olarak.
	--While ifadesi gibi akýþ kontrolerinde test edilecek deðeri tutmak için
	--Stored Proc veya Fonk. tarafýndan döndürülen deðeri saklamak için.

--KONU 1 :Deðiþken Atama :
--Declare ifadesi
--@iþareti kullanýlýr.
--Veritipi belirlenir.
--Bir deðiþken yaratýldýðýnda veri tipi default olarak null'dur.
--1.yol:
DECLARE @yýl INT

--2.yol: AS ifadesini de kullanabiliriz.
DECLARE @yýl AS INT

--Birden fazla deðiþkeni atamak için :
DECLARE @yýl AS INT,@ay AS INT,....


--KONU 2 :Deðiþkene Veri Atama :
--SET ifadesi kullanýlýr.

DECLARE @yýl INT
SET @yýl = 2022
--VEYA
--ÖRNEK:
DECLARE @yýl INT = 2022
SELECT @yýl

--ÖRNEK:
DECLARE @yýl INT
SET @yýl = 2023
PRINT @yýl

--KONU 3 :Deðiþkeni Sorguda Kullanma :
--ÖRNEK :
DECLARE @yýl INT
SET @yýl = 2009

SELECT [BusinessEntityID],[FirstName],[ModifiedDate] FROM [Person].[Person]
WHERE YEar([ModifiedDate])=@yýl


--KONU 4 :SORGU SONUCUNU DEÐÝÞKENDE TUTMA :

--ÖRNEK:
DECLARE @Adet INT
SET @Adet = (SELECT COUNT([BusinessEntityID]) FROM HumanResources.Employee)
---Göstermek Ýçin Select veya PRINT Kullanýrýýz: SELECT @Adet veya PRINT Adet
SELECT @Adet
PRINT 'Çalýþan Adedi' + ' ' + CAST(@Adet AS VARCHAR(MAX))
--VEYA
PRINT @Adet



--KONU 5 :Deðiþkene Kolon Atama:
--ÖRNEK:
DECLARE @Cinsiyet VARCHAR(2)
DECLARE @ID INT

SELECT
@ID=[BusinessEntityID],
@Cinsiyet=[Gender]
FROM HumanResources.Employee
where [BusinessEntityID]=1

SELECT @ID,@Cinsiyet


SELECT * FROM HumanResources.Employee

--KONU 6 :Çýkan sonucu deðiþkene Toplama :
--ÖRNEK:
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

--Mantýðý:
PRINT CAST(295847284 AS VARCHAR) + ' ' + CAST(509647174 AS VARCHAR)


--KONU 7 :Stored.Prodc ile Dýþarýdan Deðiþken ATama :
create PROC DenemeProcccccc (@Cinsiyet VARCHAR(1))
AS
BEGIN
	

		SELECT
		NationalIDNumber
		FROM HumanResources.Employee
		where Gender=@Cinsiyet
		

END

EXEC DenemeProcccccc M


--KONU 8 :GENEL VARIABLE ÖRNEK :

--SORGU :
CREATE TABLE Film
(
FilmAdý Varchar(max),
FillmCýkýsTarihi DATE
);

CREATE TABLE Actor
(
ActorAdý Varchar(max),
ActorDT DATE
);

CREATE TABLE Yonetmen
(
YonetmenAdý Varchar(max),
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


--ÞÖYLE BÝR SORGUMUZ OLSUN

SELECT FilmAdý,FillmCýkýsTarihi,'Film' AS [Type] FROM Film
where FillmCýkýsTarihi <='1996.01.01'
UNION ALL
SELECT ActorAdý,ActorDT,'Aktor' AS [Type] FROM Actor
where ActorDT <='1996.01.01'
UNION ALL
SELECT YonetmenAdý,YonetmenDT,'Yonetmen' AS [Type] FROM Yonetmen
where YonetmenDT <='1996.01.01'

--Biz hep ayný tarihi kullandýk.Dolayýsýyla bunu deðiþken olarak kullanmka mantýklý.

--DEÐÝÞKEN YARATAMA:
DECLARE @Tarih DATETIME
--DEÐÝÞKENe VERÝ ATAMA:
SET @Tarih ='1996.01.01'
--Deðiþkeni Sorgu Ýçinde Kullanma:
SELECT FilmAdý,FillmCýkýsTarihi,'Film' AS [Type] FROM Film
where FillmCýkýsTarihi <=@Tarih
UNION ALL
SELECT ActorAdý,ActorDT,'Aktor' AS [Type] FROM Actor
where ActorDT <=@Tarih
UNION ALL
SELECT YonetmenAdý,YonetmenDT,'Yonetmen' AS [Type] FROM Yonetmen
where YonetmenDT <=@Tarih






--Sorgu Sonucunu Deðiþkende Tutma:
DECLARE @Cinsiyet1 as varchar(max)
DECLARE @Adet1 AS INT
SET @Cinsiyet1 ='M'
SET @Adet1 = (SELECT COUNT(*) FROM [HumanResources].[Employee] WHERE Gender=@Cinsiyet1)
SELECT @Adet1
--Deðiþkeni Kolona Atama:

--Burada set yok,direk kolona atama var.
DECLARE @Cinsiyet VARCHAR(2)
DECLARE @ID INT

SELECT
@ID=[BusinessEntityID],
@Cinsiyet=[Gender]
FROM HumanResources.Employee
where [BusinessEntityID]=3

SELECT @ID,@Cinsiyet

---### GLOBAL DEÐÝÞKENLER ### ---
--Bunlar hazýr sistem deðiþkenleridir.
--ÖRNEKLER:
select @@SERVERNAME
select @@VERSION
select @@ ROWCOUNT

SELECT * FROM HumanResources.Employee
select @@ROWCOUNT



--- ### VARIABLES BÝTÝÞ ### ---