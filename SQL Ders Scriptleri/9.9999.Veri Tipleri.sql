

---SQL'DE VER� T�PLER� :

--Numeric Veri Tipleri :


/*
1.B�T : 1 ,0 ve NULL de�erlerini al�rlar. ( 1 = Do�ru veya 0 = Yan�� )

Kad�n ,Erkek veya Evet, Hay�r gibi verileri tutar.



2.Tiny�nt : Tamsay� veri tipindeki en k���k veri tipidir.
0 -255 aras�ndaki de�erleri tutar.1 byte'l�k kyer kaplar.
Negatif say�lar� tutmaz.

3.Smallint : - 32.767 ile + 32.767 aras�ndaki verileri tutar.


4.int : 4 byte yer kaplar. -2.147.483.647 ile + 2.147.483.647

5. Bigint : 8 byte yer kaplar. -9 trilyon ile +9 Trilyon aras�ndaki verileri tutar.


6.Decimal : Ondal�kl� say� tutmak i�in, -10^38 ile + 10^38 aras�ndaki verileri tutar.


7-Money : -922 trilyon ile +922 trilyon aras�ndaki verileri tutar.


8- Float ve Real: Bize yakla�� de�erler verir. Keisn sonu�lar istenili�i durumlarda kullan�mamaml�.
Genellikle, bilimsel �al��malarda kullan�l�r.

*/



-- DATE TIME VER� T�PLER� :

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

Unicode karakterleri desteklemezler.1ile 8000 karakter aras�nda de�er alabilirler. 
(n) ile belirtilenden az karakter girilse bile giri� yap�lan boyut kadar yer kaplarlar. 
Sabit olan veri k�melerinde kullan�lmas� �nerilir.



2 : NCHAR	:	1-4000 Karakter tutar. 8000 bytes.
Unicode karakterleri desteklerler. Chardan farkl� olarak maksimum 4000 karaktere kadar de�er alabilirler.

3 :VARCHAR :	1-8000 Karakter tutar. 
Boyutu1 ile 8000 aras�nda de�i�ir. Maksimum 8000 karakter tutar. 
Chardan en �nemli farlk� verinin boyutu kadar yere kaplamas�d�r. 
Birbirinden farkl� uzunlukta veri giri�i yapaca��m�z zaman kullan�lmal�d�r.


4 :NVARCHAR :   1-4000 Karakter tutar.









*/





--Uygulamalar :

--Bit:
DECLARE @var bit 

SET @var = 1000

SELECT @VAR
--Hangi rakam� verirsek verelim, 1 gelir.

--Tinyint:

DECLARE @var tinyint 

SET @var = 10

SELECT @VAR

-- Burada 10 geldi. Zaten 0-255 aras� de�erleri tutar.

--Negatif versek,

DECLARE @var tinyint 

SET @var = -10

SELECT @VAR

--Bize ta�ma hatas� verir.


--int :

DECLARE @var int 

SET @var = -10

SELECT @VAR

--int'te b�yle bir durumla kar��la�may�z. Yani kendi s�n�rlar� i�inde negatif say�lar alabilir.


--- Ondal�kl� say�y� bile tamsay�ya �evirir.
DECLARE @var int 

SET @var = 100.550

SELECT @VAR



-- bigint :
--Ayn� durum bigint i�inde ge�erlidir.

DECLARE @var bigint 

SET @var = -10

SELECT @VAR


--Decimal :

DECLARE @var DECIMAL(5,2) 

SET @var = 100.55

SELECT @VAR



--Decimal di�er �rnek :
--3 tane ondal�kl� say� vermemize ra�men 2 tane g�sterir bize.

DECLARE @var DECIMAL(5,2) 

SET @var = 100.555

SELECT @VAR


--Money :
--Otomatik olarak ondal�kl� say�lar� koyar.

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
--�rne�in, a�a��da CHAR(100) dersek,
--100byte'l�k alan� girdi�imiz kelime ne olursa olsun,tutar.
--Onur'u yazm�� ama Onur'un yan�nda 96 kez de bo�luk b�rakm��.
                                                                         

DECLARE @var CHAR(100)

SET @var = 'Onur'

SELECT @VAR


--2 : VARCHAR :

--VARCHAR'da CHAR'daki gibi bir durumla kar�� kar��ya kalmy�z.

DECLARE @var VARCHAR(10)

SET @var = 'Onur'

SELECT @VAR



