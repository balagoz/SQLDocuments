

--COMMIT ORNEK:
--Veri grelim aþaðýdaki tabloya:

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

TRUNCATE TABLE Ornek.dbo.UrunlerDeneme


INSERT INTO Ornek.dbo.UrunlerDeneme VALUES
(3,'LAPTOP',2600,100),
(4,'ELMA',20,30),
(5,'ARMUT',15,30),
(6,'ÇÝLEK',18,30),
(7,'CETVEL',20,30);


BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 7
COMMIT TRANSACTION


/*
Commit etmeden sorguyu baþka bir query window açýp denersek sorgunun execute ettiði bilgisi döner sürekli olarak.
Bunun nedeni iþlem tamamlanmaýþtýr.
Commit veya Rollback'e ihtiyacý vardýr.
Commit ettikten sonra ifademizin baþka bir sorgu pencersinde  çalýþtýðýný göreceðiz.
*/



--ROLLBACK ORNEK:
--Ama rollback yapýtktan sonra 6 verisi tekrar tablomuza gelir.
BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 6
ROLLBACK TRANSACTION


--Þu anda hem 6 hem de 7 yok
SELECT * FROM Ornek.dbo.UrunlerDeneme




--ÞÝMDÝ 6 VE 7 YOKKEN COMMIT EDEDLÝM.

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
--Savepoint sayesinde tüm transaction'ý rollback etmeden istediðimiz bir noktaya kadar rollback edebiliriz.
--SYNTAX : SAVE TRANSACTION SAVEPOINT_NAME
--Rollback yapmak için  de : ROLLBACK TO SAVEPOINT_NAME

--ÖRNEK :
SELECT * FROM Ornek.dbo.NUMARALAR


--her silmeden önce birer savepoint yaratacaðýz.
BEGIN TRANSACTION
SAVE TRANSACTION SP1
DELETE FROM Ornek.dbo.NUMARALAR WHERE ID=1;
--ID 1 silindi.
SAVE TRANSACTION SP2
DELETE FROM Ornek.dbo.NUMARALAR WHERE ID=2;
--ID 2 silindi.
SAVE Transaction SP3 
DELETE FROM Ornek.dbo.NUMARALAR WHERE ID = 3 
--ID 3 silindi.
ROLLBACK Transaction SP2 

--ROLLBACK TRANSACTION DERSEM TÜM TRANS.ROLLBACK EDER AMA BÝZ BELLÝ BÝR NOKTAYA ROLLBACK ETMEK ÝSTÝYORUZ.
--SP2'ye geri dönmek istiyoruz örneðin: Bu durumda ROLLBACK Transaction SP2 komutuyla ilgili noktaya geri dönebilriz.



---TRANSACTION ÖRNEKLER :

--INSERT,UPDATE VE DELETE GÝBÝ TRANSACTIONlarý kontrol edebilmek için SQL'e bunu söylememiz gerekir.


--Örnek :


SELECT * FROM Ornek.dbo.NUMARALAR



--ÖRNEK :
--COMMIT TRANSACTION
BEGIN TRANSACTION

INSERT INTO Ornek.dbo.NUMARALAR VALUES (8)

COMMIT;




--ÖRNEK :
--ROLLBACK TRANSACTION
BEGIN TRANSACTION
INSERT INTO Ornek.dbo.NUMARALAR VALUES (9)
ROLLBACK;




--TRANSACTIONLARA ÝSÝMDE VEREBÝLÝRÝZ:

BEGIN TRANSACTION DENEMELERTRAN

INSERT INTO NUMARALAR VALUES (10)

COMMIT TRANSACTION DENEMELERTRAN;


SELECT * FROM [dbo].[NUMARALAR]