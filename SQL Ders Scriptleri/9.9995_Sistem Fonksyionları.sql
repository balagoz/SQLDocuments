---SÝSTEM FONKSYÝONLAR---

--Sistem Fonk nelerdir ?

--Server ve veritabaný konfigriasyonu hakkýnda bilgi verirler.
--SQL SERVER versiyonu,seçilen dil ayarlarý,server adý gibi bilgilere ulaþabiliriz.
--Bu fonksiyonlardan bazýlarý Global Deðiþken olarak da adlandýrýlýp @@ karakterleri ile baþlarlar.
--Diðerleri ise normal fonksiyonlar þeklinde çaðrýlabilirler.

--1--@@DATEFIRST:
--Haftanýn ilk günü olarak hangi gün kullanýldýðýný belirtir.
--SYNTAX: SELECT @@DATEFIRST

SELECT @@DATEFIRST
--Sistemde Haftanýn ilk günü pazardýr.
--Örneðin Pazartesi 1.gündür.
--Haftanýn ilk günüz olarak Pazartesine ayarlamak için aþaðýdaki þekilde komut yazabiliriz.
SET DATEFIRST 1
--Tekrar Pazar'a ayarlayalým.
SET DATEFIRST 7

--2--@@LANGID:
--Small int tipinde döner.
--SQL SERVER'a kurulan baðlantý için geçerli olan dil bilgisini verir.

SELECT @@LANGID -- 0 döndü.0 ile ilgili bilgiyi aþaðýdan alabiliriz.
SELECT * FROM sys.syslanguages


--3--@@LANGUAGE:
--Kurulan baðlantý için kullanýlan dili verir.

SELECT @@LANGUAGE

--Dil ayarlarý ile ilgili bilgi session bazlý olup,session yani bnaðlantý kapatýldýðýnda eskisine geri dönerler.

SET language  'turkish'
--Biz yeni bir sorgu ekraný açarsak dil bilgisi eski hakline geri döner.

--Tekrar iniglizceye çevirelim.
SET language  'English'

--4--@@servername ve @@Version :

SELECT @@servername -- SQL kurulu PC'nin isim bilgisini verir.

SELECT @@Version -- SEL SERVER ve SSMS versiyon bilgisini verir.


--5--@@ROWCOUNT VE ROWCOUNT_BIG:
--@@ROWCOUNT: sorgu sonucunda dönen satýr sayýsý bilgisini verir.INT tipinde veri döner.
--@@ROWCOUNT_BIG: Tek farký dönüþ deðeridir. Satýr sayýsý INT sýnýrlarýný aþýyorsa bunu kullanmalýyýz.

SELECT * FROM HumanResources.Department
SELECT @@ROWCOUNT
SELECT ROWCOUNT_BIG()


--5--DB_NAME :
--Çalýþtýðýmýz veritabaný isim bilgisini verir.

SELECT DB_NAME()