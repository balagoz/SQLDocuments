

---SQL'DE VERÝ TÝPLERÝ :

--Numeric Veri Tipleri :


/*
1.BÝT : 1 ,0 ve NULL deðerlerini alýrlar. ( 1 = Doðru veya 0 = Yanýþ )

Kadýn ,Erkek veya Evet, Hayýr gibi verileri tutar.



2.TinyÝnt : Tamsayý veri tipindeki en küçük veri tipidir.
0 -255 arasýndaki deðerleri tutar.1 byte'lýk kyer kaplar.
Negatif sayýlarý tutmaz.

3.Smallint : - 32.767 ile + 32.767 arasýndaki verileri tutar.


4.int : 4 byte yer kaplar. -2.147.483.647 ile + 2.147.483.647

5. Bigint : 8 byte yer kaplar. -9 trilyon ile +9 Trilyon arasýndaki verileri tutar.


6.Decimal : Ondalýklý sayý tutmak için, -10^38 ile + 10^38 arasýndaki verileri tutar.


7-Money : -922 trilyon ile +922 trilyon arasýndaki verileri tutar.


8- Float ve Real: Bize yaklaýþ deðerler verir. Keisn sonuçlar isteniliði durumlarda kullanýmamamlý.
Genellikle, bilimsel çalýþmalarda kullanýlýr.

*/



-- DATE TIME VERÝ TÝPLERÝ :

/*


1 : DATE : YYYY-MM-DD
2 : TIME :hh:mm:ss
3 : smalldatetime : YYYY-MM-DD hh:mm:ss
4 : datetime : YYYY-MM-DD hh:mm:ss [.nnn]
5 : datetime : YYYY-MM-DD hh:mm:ss [.nnnnnn]

*/


--Karakter Veri Tipleri :

/*


1 : CHAR	:	1-8000 Karakter tutar. 8000 bytes.

Unicode karakterleri desteklemezler.1ile 8000 karakter arasýnda deðer alabilirler. 
(n) ile belirtilenden az karakter girilse bile giriþ yapýlan boyut kadar yer kaplarlar. 
Sabit olan veri kümelerinde kullanýlmasý önerilir.



2 : NCHAR	:	1-4000 Karakter tutar. 8000 bytes.
Unicode karakterleri desteklerler. Chardan farklý olarak maksimum 4000 karaktere kadar deðer alabilirler.

3 :VARCHAR :	1-8000 Karakter tutar. 
Boyutu1 ile 8000 arasýnda deðiþir. Maksimum 8000 karakter tutar. 
Chardan en önemli farlký verinin boyutu kadar yere kaplamasýdýr. 
Birbirinden farklý uzunlukta veri giriþi yapacaðýmýz zaman kullanýlmalýdýr.


4 :NVARCHAR :   1-4000 Karakter tutar.









*/





--Uygulamalar :

--Bit:
DECLARE @var bit 

SET @var = 1000

SELECT @VAR
--Hangi rakamý verirsek verelim, 1 gelir.

--Tinyint:

DECLARE @var tinyint 

SET @var = 10

SELECT @VAR

-- Burada 10 geldi. Zaten 0-255 arasý deðerleri tutar.

--Negatif versek,

DECLARE @var tinyint 

SET @var = -10

SELECT @VAR

--Bize taþma hatasý verir.


--int :

DECLARE @var int 

SET @var = -10

SELECT @VAR

--int'te böyle bir durumla karþýlaþmayýz. Yani kendi sýnýrlarý içinde negatif sayýlar alabilir.


--- Ondalýklý sayýyý bile tamsayýya çevirir.
DECLARE @var int 

SET @var = 100.550

SELECT @VAR



-- bigint :
--Ayný durum bigint içinde geçerlidir.

DECLARE @var bigint 

SET @var = -10

SELECT @VAR


--Decimal :

DECLARE @var DECIMAL(5,2) 

SET @var = 100.55

SELECT @VAR



--Decimal diðer örnek :
--3 tane ondalýklý sayý vermemize raðmen 2 tane gösterir bize.

DECLARE @var DECIMAL(5,2) 

SET @var = 100.555

SELECT @VAR


--Money :
--Otomatik olarak ondalýklý sayýlarý koyar.

DECLARE @var money

SET @var = 1000

SELECT @VAR


--

--Tarih Veri Tipleri

SELECT GETDATE()


DECLARE @var time

SET @var = getdate()

SELECT @VAR




DECLARE @var datetime2

SET @var = getdate()

SELECT @VAR




DECLARE @var date

SET @var = getdate()

SELECT @VAR


--Karakter Veri Tipleri :

--1 : CHAR :
--Örneðin, aþaðýda CHAR(100) dersek,
--100byte'lýk alaný girdiðimiz kelime ne olursa olsun,tutar.
--Onur'u yazmýþ ama Onur'un yanýnda 96 kez de boþluk býrakmýþ.
                                                                         

DECLARE @var CHAR(100)

SET @var = 'Onur'

SELECT @VAR


--2 : VARCHAR :

--VARCHAR'da CHAR'daki gibi bir durumla karþý karþýya kalmyýz.

DECLARE @var VARCHAR(10)

SET @var = 'Onur'

SELECT @VAR



