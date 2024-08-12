---S�STEM FONKSY�ONLAR---

--Sistem Fonk nelerdir ?

--Server ve veritaban� konfigriasyonu hakk�nda bilgi verirler.
--SQL SERVER versiyonu,se�ilen dil ayarlar�,server ad� gibi bilgilere ula�abiliriz.
--Bu fonksiyonlardan baz�lar� Global De�i�ken olarak da adland�r�l�p @@ karakterleri ile ba�larlar.
--Di�erleri ise normal fonksiyonlar �eklinde �a�r�labilirler.

--1--@@DATEFIRST:
--Haftan�n ilk g�n� olarak hangi g�n kullan�ld���n� belirtir.
--SYNTAX: SELECT @@DATEFIRST

SELECT @@DATEFIRST
--Sistemde Haftan�n ilk g�n� pazard�r.
--�rne�in Pazartesi 1.g�nd�r.
--Haftan�n ilk g�n�z olarak Pazartesine ayarlamak i�in a�a��daki �ekilde komut yazabiliriz.
SET DATEFIRST 1
--Tekrar Pazar'a ayarlayal�m.
SET DATEFIRST 7

--2--@@LANGID:
--Small int tipinde d�ner.
--SQL SERVER'a kurulan ba�lant� i�in ge�erli olan dil bilgisini verir.

SELECT @@LANGID -- 0 d�nd�.0 ile ilgili bilgiyi a�a��dan alabiliriz.
SELECT * FROM sys.syslanguages


--3--@@LANGUAGE:
--Kurulan ba�lant� i�in kullan�lan dili verir.

SELECT @@LANGUAGE

--Dil ayarlar� ile ilgili bilgi session bazl� olup,session yani bna�lant� kapat�ld���nda eskisine geri d�nerler.

SET language  'turkish'
--Biz yeni bir sorgu ekran� a�arsak dil bilgisi eski hakline geri d�ner.

--Tekrar iniglizceye �evirelim.
SET language  'English'

--4--@@servername ve @@Version :

SELECT @@servername -- SQL kurulu PC'nin isim bilgisini verir.

SELECT @@Version -- SEL SERVER ve SSMS versiyon bilgisini verir.


--5--@@ROWCOUNT VE ROWCOUNT_BIG:
--@@ROWCOUNT: sorgu sonucunda d�nen sat�r say�s� bilgisini verir.INT tipinde veri d�ner.
--@@ROWCOUNT_BIG: Tek fark� d�n�� de�eridir. Sat�r say�s� INT s�n�rlar�n� a��yorsa bunu kullanmal�y�z.

SELECT * FROM HumanResources.Department
SELECT @@ROWCOUNT
SELECT ROWCOUNT_BIG()


--5--DB_NAME :
--�al��t���m�z veritaban� isim bilgisini verir.

SELECT DB_NAME()