

--COMMIT ORNEK:
--Veri grelim a�a��daki tabloya:

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

TRUNCATE TABLE Ornek.dbo.UrunlerDeneme


INSERT INTO Ornek.dbo.UrunlerDeneme VALUES
(3,'LAPTOP',2600,100),
(4,'ELMA',20,30),
(5,'ARMUT',15,30),
(6,'��LEK',18,30),
(7,'CETVEL',20,30);


BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 7
COMMIT TRANSACTION


/*
Commit etmeden sorguyu ba�ka bir query window a��p denersek sorgunun execute etti�i bilgisi d�ner s�rekli olarak.
Bunun nedeni i�lem tamamlanma��t�r.
Commit veya Rollback'e ihtiyac� vard�r.
Commit ettikten sonra ifademizin ba�ka bir sorgu pencersinde  �al��t���n� g�rece�iz.
*/



--ROLLBACK ORNEK:
--Ama rollback yap�tktan sonra 6 verisi tekrar tablomuza gelir.
BEGIN TRANSACTION
DELETE FROM Ornek.dbo.UrunlerDeneme
WHERE ID = 6
ROLLBACK TRANSACTION


--�u anda hem 6 hem de 7 yok
SELECT * FROM Ornek.dbo.UrunlerDeneme




--��MD� 6 VE 7 YOKKEN COMMIT EDEDL�M.

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
--Savepoint sayesinde t�m transaction'� rollback etmeden istedi�imiz bir noktaya kadar rollback edebiliriz.
--SYNTAX : SAVE TRANSACTION SAVEPOINT_NAME
--Rollback yapmak i�in  de : ROLLBACK TO SAVEPOINT_NAME

--�RNEK :
SELECT * FROM Ornek.dbo.NUMARALAR


--her silmeden �nce birer savepoint yarataca��z.
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

--ROLLBACK TRANSACTION DERSEM T�M TRANS.ROLLBACK EDER AMA B�Z BELL� B�R NOKTAYA ROLLBACK ETMEK �ST�YORUZ.
--SP2'ye geri d�nmek istiyoruz �rne�in: Bu durumda ROLLBACK Transaction SP2 komutuyla ilgili noktaya geri d�nebilriz.



---TRANSACTION �RNEKLER :

--INSERT,UPDATE VE DELETE G�B� TRANSACTIONlar� kontrol edebilmek i�in SQL'e bunu s�ylememiz gerekir.


--�rnek :


SELECT * FROM Ornek.dbo.NUMARALAR



--�RNEK :
--COMMIT TRANSACTION
BEGIN TRANSACTION

INSERT INTO Ornek.dbo.NUMARALAR VALUES (8)

COMMIT;




--�RNEK :
--ROLLBACK TRANSACTION
BEGIN TRANSACTION
INSERT INTO Ornek.dbo.NUMARALAR VALUES (9)
ROLLBACK;




--TRANSACTIONLARA �S�MDE VEREB�L�R�Z:

BEGIN TRANSACTION DENEMELERTRAN

INSERT INTO NUMARALAR VALUES (10)

COMMIT TRANSACTION DENEMELERTRAN;


SELECT * FROM [dbo].[NUMARALAR]