---- TRANSACTION KAVRAMI ----

--Transaction veritabaný içindeki verileri deðiþtiren sorgular veya komutlar bütünüdür.
--INSERT ,DELETE VE UPDATE iþlemleri olunca transaction kavramýndan bahesedebiliriz.
--INSERT ,DELETE VE UPDATE iþlemleri yapýlýnca SQL bunlarý transaction log'u olarak kaydeder.
--Diyelim ki 3 tane ayrý ayrý INSERT,UPDATE ve DELETE ifademiz var ve excete ettik hepsini.
--Artýk deðiþiklikleri geri alamayýz.Rollback edemeyiz.
--Ýþte transaction ifadesyile bu durumu kontrol edebilriz.
--Biz BEGIN TRANSACTION dediðimiz anda SQL artýk aþaðýda olan iþlmeleri otomatik olarak kaydetmez.
--SQL sadece commited verileri okur.
--Örneðin artýk commit edeceksek de bunu belirtmemiz gerekmektedir.
--Transaction'lar Tek bir unit gibi algýlanýrlar.
--Transaction içindeki sorgular bir bütündür,ya hepsi baþarýlý olur ve çalýþýr yada çalýþmazlar.
--Eðer herhangi bir sorgu baþarýsýz olursa tüm transaction baþarýsýz olur.Ve modifiye olan data rollback olur.
--COMMIT etmek için,BEGIN TRAN altýnda COMMIT diyebiliriz,COMMIT TRAN diyebilirz veya COMMIT TRANSACTION diyebilriz.
--BEGIN ve COMMIT transaction ifadeleri içinde sayýsýz iþlem yapabiliriz


--ÖRNEK :
CREATE TABLE UrunlerDeneme
(
ID INT,
NAME VARCHAR(50),
BirimFÝyat INT,
Adet INT
);

INSERT INTO UrunlerDeneme VALUES
(1,'LAPTOP',2300,100),
(2,'DESKTOP',2000,30);

SELECT * FROM Ornek.dbo.UrunlerDeneme


--ADETÝ DEÐÝÞTÝRMEK ÝSTÝYORUM ID 1'deki:

--BEGIN TRAN ÝFADESÝ OLMADAN:
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 200 WHERE ID =1;

SELECT * FROM Ornek.dbo.UrunlerDeneme
--Bu update ifadesi herhangibir transaction'ýn içinde deðildi,dolayýsyla burda yaptýðýmýz deðiþiklikler,kalýcý olur.



--transaction içinde:

BEGIN TRANSACTION
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 300 WHERE ID =1;

--Ayný connection içinde biz bunun 300 olduðunu görürüz ancak baþka bir query window açalým.
--ve SELECT * FROM Urunler çalýþtýralým. Bize sürekli olarak executing query der.
--Bunun nedeni transaction'ý commit veya rollback etmememizdir.

--Baþka kullancýlýar bu uncommitted datayý göremezler.Ýstersek bunu da deðiþtirebilirz tabi ki.
--Ancak genel olarak belli komutlarý girmediðimiz zaman SQL ancak commited datayý okur.
--Dolayýsýyla yukarýda uncommited data var.
--Dolayýsyla commit yapmamýz gerekmektedir.
--COMMÝT EDELÝM sonra baþka bir query window da çalýþtýðýný görebiliriz.

--Ýfademiz þimdi kaydedilmiþ oldu.Artýk geri dönmek istersek en son commit edilen bu noktaya geri dönebiliriz.

BEGIN TRANSACTION
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 250 WHERE ID =1
COMMIT TRAN



SELECT * FROM Ornek.dbo.UrunlerDeneme







--ROLLBACK EDELÝM:
BEGIN TRANSACTION
UPDATE Ornek.dbo.UrunlerDeneme
SET Adet= 300 WHERE ID =1

ROLLBACK TRANSACTION --ÝLK COMMÝTED HALÝNE DÖNER.


--TRY CATCH ÖRNEÐÝ -- HATA VERMEDEN KAYDEDÝLEN BÝR TRY CATCH ÖRNEÐÝ YARATALIM.
-- 2 tane tablomuz olsun..
--Burada istanbul adý yanlýþ yazýlmýþ olsun  ve biz bunu düzeltmek istiyoruz.
--Bir tane sp yarataýlým.

SELECT * FROM Ornek.dbo.Kisi
SELECT * FROM Ornek.dbo.Univeriste


CREATE PROC HATA
AS
BEGIN
	BEGIN TRY
			BEGIN TRANSACTION
				UPDATE Ornek.dbo.Kisi
				SET Sehir ='Ýstanbul' where ID =1

				UPDATE Ornek.dbo.Univeriste
				SET Sehir ='Ýstanbul' where ID =1
			COMMIT TRANSACTION
			PRINT 'Ýþlem sorunsuz kaydedildi'
	END TRY

	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'Ýþlem Kaydedilemedi'
	END CATCH

END;

exec HATA


----TRY CATCH ÖRNEÐÝ -- BAÞARISIZ SONUÇ ÜRETELÝM.HATA VERSÝN
--Burada sehir kolonun uzunluðu varchar(50),biz burada,50 den daha büyük veri gireceðiz.


ALTER PROC HATA
AS
BEGIN
	BEGIN TRY
			BEGIN TRANSACTION
				UPDATE Ornek.dbo.Kisi
				SET Sehir ='Ýstanbul1' where ID =1--ÝSTANBUL1 YAPTIM

				UPDATE Ornek.dbo.Univeriste
				SET Sehir ='Ýstanbul Ýstanbul Ýstanbul Ýstanbul Ýstanbul Ýstanbul Ýstanbul Ýstanbul Ýstanbul' where ID =1--HATALI VERÝ GÝRDÝK BURADA.
			COMMIT TRANSACTION
			PRINT 'Ýþlem sorunsuz kaydedildi'
	END TRY

	BEGIN CATCH
			ROLLBACK TRANSACTION
			PRINT 'Ýþlem Kaydedilemedi'
	END CATCH

END;

exec HATA


SELECT * FROM Ornek.dbo.Kisi
SELECT * FROM Ornek.dbo.Univeriste



--------------------ACÝD TEST ---------------------
--Transaction içindeki sorgular ACÝD TEST'i geçmelidir.

--ATOMÝC:Transaction içindeki ifadeler ya hep beraber baþarýlý veya baþarýsýz olurlar.
--Bir ifade baþarlýlý olup diðeri baþarýsýz olamaz.

--CONSISTENY :Transaction iþlemi bitiminde veri bütünlüðü devam etmelidir.

--ISOLATED : Ayný anda ya da farklý zamanlarda gerçekleþen transactionlarýn birbirinden izole olmasý gereklidir.
--Yani birbirlerini etkilememelidirler.

--DURABLE: Baþarýsýz bir transaction durumunda veri önceki haline geri dönmelidir.

--------------------------------------------------

----TRANSACTION GENEL ORNEKLER - TCL ÝLE BREBARER :
--COMMIT : Deðiþiklikleri savelemek için
--ROLLBACK :Deðiþiklikleri geri almak için. Database de henüz commit edilmemiþ veya savelenmemiþ iþlemleri geri almaya yarar.En son commit neresiyse oraya kadar gider.
--SAVEPOINT : Transactioniçinde rollback'e gitmek için noktalar ,duraklar yaratýr.
-- TCL komutlarý YALNIZCA INSERT,UPDATE VE DELETE ÝLE BERABER Kullanýlrý.
--Tablo yaratýrken veya silerken kullýlmaz çünkü bu operasyonlar database'de otomatik olarak commit edilirler.
--

--COMMÞT ORNEK:
--Veri girelim aþaðýdaki tabloya:
SELECT * FROM Ornek.dbo.UrunlerDeneme



INSERT INTO Ornek.dbo.UrunlerDeneme VALUES
(3,'LAPTOP',2600,100),
(4,'ELMA',20,30),
(5,'ARMUT',15,30),
(6,'ÇÝLEK',18,30),
(7,'CETVEL',20,30);


BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 7
--COMMÝT YAZMADAN BAÞLKA QUERY WÝNDOW DA DENEDÝM GELMEDÝ AMA COMMIT DEDÝKTEN SONRA ÇALIÞTIRDIM VE BAÞKA SORGU WINDOWDA DA GELDÝ.
COMMIT TRANSACTION


--ROLLBACK ORNEK:
BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 6;


--Þu anda hem 6 hem de 7 yok
SELECT * FROM Ornek.dbo.UrunlerDeneme


--Ama rollback yapýtktan sonra 6 geldi.
BEGIN TRANSACTION
DELETE FROM Urunler
WHERE ID = 6
ROLLBACK TRANSACTION



--ÞÝMDÝ 6 VE 7 YOKKEN COMMIT EDEDLÝM.
SELECT * FROM Ornek.dbo.UrunlerDeneme


BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 6
COMMIT TRANSACTION


--ÞÝMDÝ 2-3 ADET ÜRÜN DAHA ROLLBACK EDELÝM:
--ROLLBACK YAPINCA SON COMMIT'E KADAR GÝTTÝ.
BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 3
ROLLBACK TRANSACTION



----SAVEPOINT:
-- SAVEPOÝNT SAYSESÝNDE TÜM TRANSACTÝON'I ROLLBACK ETMEDEN ÝSTEDÝÐÝMÝZ BÝR NOKTAYA ROLLBACK EDEBÝLÝRÝZ.
--SYNTAX : SAVE TRANSACTION SAVEPOINT_NAME
--rollback yapmak için  de : ROLLBACK TO SAVEPOINT_NAME


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



--her silmeden önce birer savepoint yaratacaðýz.
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

--SADECE ROLLBACK DERSEM EN ESKÝ HALÝNE GERÝ DÖNER.
ROLLBACK
--ROLLBACK TRANSACTION DERSEM TÜM TRANS.ROLLBACK EDER AMA BEN BELLÝ NOKTAYA ROLLBACK ETMEK ÝSTÝYORUM.
--Yukarýdaki ifadeyi çalýþtýrdým. Ama karar deðiþtirdim.VE SP2'ye geri dönemk istiyorum:ROLLBACK Transaction SP2 





---TRANSACTION ÖRNEKLER :

--INSERT,UPDATE VE DELETE GÝBÝ TRANSACTIONlarý kontrol edebilmek için SQL'e bunu söylememiz gerekir.
--

--ÖRNEK :

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

--ÖRNEK :
--COMMIT TRANSACTION
BEGIN TRANSACTION

INSERT INTO Ornek.dbo.Numaralar VALUES (8)

COMMIT TRAN




--ÖRNEK :
--ROLLBACK TRANSACTION
BEGIN TRANSACTION
INSERT INTO Ornek.dbo.Numaralar VALUES (9)
ROLLBACK;




--TRANSACTIONLARA ÝSÝMDE VEREBÝLÝRÝZ:

BEGIN TRANSACTION DENEMELERTRAN

INSERT INTO Ornek.dbo.Numaralar VALUES (10)

COMMIT TRANSACTION DENEMELERTRAN;


SELECT * FROM Ornek.dbo.Numaralar