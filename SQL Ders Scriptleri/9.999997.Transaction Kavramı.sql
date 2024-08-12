---- TRANSACTION KAVRAMI ----

--Transaction veritaban� i�indeki verileri de�i�tiren sorgular veya komutlar b�t�n�d�r.
--INSERT ,DELETE VE UPDATE i�lemleri olunca transaction kavram�ndan bahesedebiliriz.
--INSERT ,DELETE VE UPDATE i�lemleri yap�l�nca SQL bunlar� transaction log'u olarak kaydeder.
--Diyelim ki 3 tane ayr� ayr� INSERT,UPDATE ve DELETE ifademiz var ve excete ettik hepsini.
--Art�k de�i�iklikleri geri alamay�z.Rollback edemeyiz.
--��te transaction ifadesyile bu durumu kontrol edebilriz.
--Biz BEGIN TRANSACTION dedi�imiz anda SQL art�k a�a��da olan i�lmeleri otomatik olarak kaydetmez.
--SQL sadece commited verileri okur.
--�rne�in art�k commit edeceksek de bunu belirtmemiz gerekmektedir.
--Transaction'lar Tek bir unit gibi alg�lan�rlar.
--Transaction i�indeki sorgular bir b�t�nd�r,ya hepsi ba�ar�l� olur ve �al���r yada �al��mazlar.
--E�er herhangi bir sorgu ba�ar�s�z olursa t�m transaction ba�ar�s�z olur.Ve modifiye olan data rollback olur.
--COMMIT etmek i�in,BEGIN TRAN alt�nda COMMIT diyebiliriz,COMMIT TRAN diyebilirz veya COMMIT TRANSACTION diyebilriz.
--BEGIN ve COMMIT transaction ifadeleri i�inde say�s�z i�lem yapabiliriz


--�RNEK :
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

SELECT * FROM Ornek.dbo.UrunlerDeneme


--ADET� DE���T�RMEK �ST�YORUM ID 1'deki:

--BEGIN TRAN �FADES� OLMADAN:
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 200 WHERE ID =1;

SELECT * FROM Ornek.dbo.UrunlerDeneme
--Bu update ifadesi herhangibir transaction'�n i�inde de�ildi,dolay�syla burda yapt���m�z de�i�iklikler,kal�c� olur.



--transaction i�inde:

BEGIN TRANSACTION
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 300 WHERE ID =1;

--Ayn� connection i�inde biz bunun 300 oldu�unu g�r�r�z ancak ba�ka bir query window a�al�m.
--ve SELECT * FROM Urunler �al��t�ral�m. Bize s�rekli olarak executing query der.
--Bunun nedeni transaction'� commit veya rollback etmememizdir.

--Ba�ka kullanc�l�ar bu uncommitted datay� g�remezler.�stersek bunu da de�i�tirebilirz tabi ki.
--Ancak genel olarak belli komutlar� girmedi�imiz zaman SQL ancak commited datay� okur.
--Dolay�s�yla yukar�da uncommited data var.
--Dolay�syla commit yapmam�z gerekmektedir.
--COMM�T EDEL�M sonra ba�ka bir query window da �al��t���n� g�rebiliriz.

--�fademiz �imdi kaydedilmi� oldu.Art�k geri d�nmek istersek en son commit edilen bu noktaya geri d�nebiliriz.

BEGIN TRANSACTION
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 250 WHERE ID =1
COMMIT TRAN



SELECT * FROM Ornek.dbo.UrunlerDeneme







--ROLLBACK EDEL�M:
BEGIN TRANSACTION
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 300 WHERE ID =1

ROLLBACK TRANSACTION --�LK COMM�TED HAL�NE D�NER.


--TRY CATCH �RNE�� -- HATA VERMEDEN KAYDED�LEN B�R TRY CATCH �RNE�� YARATALIM.
-- 2 tane tablomuz olsun..
--Burada istanbul ad� yanl�� yaz�lm�� olsun  ve biz bunu d�zeltmek istiyoruz.
--Bir tane sp yarata�l�m.

SELECT * FROM Ornek.dbo.Kisi
SELECT * FROM Ornek.dbo.Univeriste


CREATE PROC HATA
AS
BEGIN
	BEGIN TRY
			BEGIN TRANSACTION
				UPDATE Ornek.dbo.Kisi
				SET Sehir ='�stanbul' where ID =1

				UPDATE Ornek.dbo.Univeriste
				SET Sehir ='�stanbul' where ID =1
			COMMIT TRANSACTION
			PRINT '��lem sorunsuz kaydedildi'
	END TRY

	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT '��lem Kaydedilemedi'
	END CATCH

END;

exec HATA


----TRY CATCH �RNE�� -- BA�ARISIZ SONU� �RETEL�M.HATA VERS�N
--Burada sehir kolonun uzunlu�u varchar(50),biz burada,50 den daha b�y�k veri girece�iz.


ALTER PROC HATA
AS
BEGIN
	BEGIN TRY
			BEGIN TRANSACTION
				UPDATE Ornek.dbo.Kisi
				SET Sehir ='�stanbul1' where ID =1--�STANBUL1 YAPTIM

				UPDATE Ornek.dbo.Univeriste
				SET Sehir ='�stanbul �stanbul �stanbul �stanbul �stanbul �stanbul �stanbul �stanbul �stanbul' where ID =1--HATALI VER� G�RD�K BURADA.
			COMMIT TRANSACTION
			PRINT '��lem sorunsuz kaydedildi'
	END TRY

	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT '��lem Kaydedilemedi'
	END CATCH

END;

exec HATA


SELECT * FROM Ornek.dbo.Kisi
SELECT * FROM Ornek.dbo.Univeriste



--------------------AC�D TEST ---------------------
--Transaction i�indeki sorgular AC�D TEST'i ge�melidir.

--ATOM�C:Transaction i�indeki ifadeler ya hep beraber ba�ar�l� veya ba�ar�s�z olurlar.
--Bir ifade ba�arl�l� olup di�eri ba�ar�s�z olamaz.

--CONSISTENY :Transaction i�lemi bitiminde veri b�t�nl��� devam etmelidir.

--ISOLATED : Ayn� anda ya da farkl� zamanlarda ger�ekle�en transactionlar�n birbirinden izole olmas� gereklidir.
--Yani birbirlerini etkilememelidirler.

--DURABLE: Ba�ar�s�z bir transaction durumunda veri �nceki haline geri d�nmelidir.

--------------------------------------------------

----TRANSACTION GENEL ORNEKLER - TCL �LE BREBARER :
--COMMIT : De�i�iklikleri savelemek i�in
--ROLLBACK :De�i�iklikleri geri almak i�in. Database de hen�z commit edilmemi� veya savelenmemi� i�lemleri geri almaya yarar.En son commit neresiyse oraya kadar gider.
--SAVEPOINT : Transactioni�inde rollback'e gitmek i�in noktalar ,duraklar yarat�r.
-- TCL komutlar� YALNIZCA INSERT,UPDATE VE DELETE �LE BERABER Kullan�lr�.
--Tablo yarat�rken veya silerken kull�lmaz ��nk� bu operasyonlar database'de otomatik olarak commit edilirler.
--

--COMM�T ORNEK:
--Veri girelim a�a��daki tabloya:
SELECT * FROM Ornek.dbo.UrunlerDeneme



INSERT INTO Ornek.dbo.UrunlerDeneme VALUES
(3,'LAPTOP',2600,100),
(4,'ELMA',20,30),
(5,'ARMUT',15,30),
(6,'��LEK',18,30),
(7,'CETVEL',20,30);


BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 7
--COMM�T YAZMADAN BA�LKA QUERY W�NDOW DA DENED�M GELMED� AMA COMMIT DED�KTEN SONRA �ALI�TIRDIM VE BA�KA SORGU WINDOWDA DA GELD�.
COMMIT TRANSACTION


--ROLLBACK ORNEK:
BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 6;


--�u anda hem 6 hem de 7 yok
SELECT * FROM Ornek.dbo.UrunlerDeneme


--Ama rollback yap�tktan sonra 6 geldi.
BEGIN TRANSACTION
DELETE FROM Urunler
WHERE ID = 6
ROLLBACK TRANSACTION



--��MD� 6 VE 7 YOKKEN COMMIT EDEDL�M.
SELECT * FROM Ornek.dbo.UrunlerDeneme


BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 6
COMMIT TRANSACTION


--��MD� 2-3 ADET �R�N DAHA ROLLBACK EDEL�M:
--ROLLBACK YAPINCA SON COMMIT'E KADAR G�TT�.
BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 3
ROLLBACK TRANSACTION



----SAVEPOINT:
-- SAVEPO�NT SAYSES�NDE T�M TRANSACT�ON'I ROLLBACK ETMEDEN �STED���M�Z B�R NOKTAYA ROLLBACK EDEB�L�R�Z.
--SYNTAX : SAVE TRANSACTION SAVEPOINT_NAME
--rollback yapmak i�in  de : ROLLBACK TO SAVEPOINT_NAME


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


SELECT * FROM Ornek.dbo.NUMARA



--her silmeden �nce birer savepoint yarataca��z.
--

BEGIN TRANSACTION
SAVE TRANSACTION SP1
DELETE FROM Ornek.dbo.NUMARA WHERE ID=1;
--ID 1 silindi.
SAVE TRANSACTION SP2
DELETE FROM Ornek.dbo.NUMARA WHERE ID=2;
--ID 2 silindi.
SAVE Transaction SP3 
DELETE FROM Ornek.dbo.NUMARA WHERE ID = 3 
--ID 3 silindi.


ROLLBACK Transaction SP2 

--SADECE ROLLBACK DERSEM EN ESK� HAL�NE GER� D�NER.
ROLLBACK
--ROLLBACK TRANSACTION DERSEM T�M TRANS.ROLLBACK EDER AMA BEN BELL� NOKTAYA ROLLBACK ETMEK �ST�YORUM.
--Yukar�daki ifadeyi �al��t�rd�m. Ama karar de�i�tirdim.VE SP2'ye geri d�nemk istiyorum:ROLLBACK Transaction SP2 





---TRANSACTION �RNEKLER :

--INSERT,UPDATE VE DELETE G�B� TRANSACTIONlar� kontrol edebilmek i�in SQL'e bunu s�ylememiz gerekir.
--

--�RNEK :

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

SELECT * FROM Ornek.dbo.Numaralar

--�RNEK :
--COMMIT TRANSACTION
BEGIN TRANSACTION

INSERT INTO Ornek.dbo.Numaralar VALUES (8)

COMMIT TRAN




--�RNEK :
--ROLLBACK TRANSACTION
BEGIN TRANSACTION
INSERT INTO Ornek.dbo.Numaralar VALUES (9)
ROLLBACK;




--TRANSACTIONLARA �S�MDE VEREB�L�R�Z:

BEGIN TRANSACTION DENEMELERTRAN

INSERT INTO Ornek.dbo.Numaralar VALUES (10)

COMMIT TRANSACTION DENEMELERTRAN;


SELECT * FROM Ornek.dbo.Numaralar