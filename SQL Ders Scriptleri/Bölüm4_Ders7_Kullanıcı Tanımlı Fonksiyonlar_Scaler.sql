--- ### Scaler Fonksiyonlar ### ---
--Parametre alabilir veya almayabilirler ama her zaman tek (scaler) de�er d�nerler.
--D�nen de�er herhangi bir veri tipinde olabilir ancak text,ntext,image ve cursor olamazlar.
--Kodlar�m�z� k�saltmam�za neden olur.Mesela birden fazla sorguyu kullanarak yazd���m�z kar���k bir sorgumuz olsun.
--Her sorguya bu kar���k sorgu b�t�nlerini eklemektense fonk.yaratabiliriz.Ve onu kullanabiliriz.
--Fonksiyonunn textini g�rmek i�in >>>>> sp_helptext FONK.ADI
--Bug�ne kadar g�rd���m�z t�m fonksiyonlar haz�r scaler sistem fonksiyonlar�yd�.
--Biz de bunlar gibi kendi fonk.olu�turabiliriz.

--�RNEK
--Parametre ald�,i�lemini yapt� ve de�erini d�nd�.
--user def.function ile yapt���m�z� stoered proc arac�l���ylada yapabiliriz.
SELECT SQUARE(2);-- 4

--Ama fonksiyonlar�n paramtre almas� zorunlu de�il.
--�rne�in GETDATE() fonksiyonu parametre almaz.

SELECT GETDATE();

--Kullan�c� Tan�ml� Scaler Fonk.Nas�l Yarat�l�r ?
--SYNTAX :
CREATE FUNCTION FONKS�YON_ADI
(@Parametre1 datatype,@Parametre2 datatype,....)
RETURNS ReturnDatatype
AS
BEGIN
		Fonksyion G�vdesi veya SQL �fadeleri
		RETURN ReturnDatatype
END

--�RNEK :Net sat��lar� hesaplayan bir fonk.Yaratala�m.
--De�i�kenlerimiz de @Adet,@ListeFiyat�,@�ndirim Oran� olsun.
USE Ornekler
GO
CREATE FUNCTION NETSATIS
(@Adet INT,@ListeFiyat� DEC(10,2),@�ndirimOran� DEC(10,2))
RETURNS DEC(10,2)
AS
BEGIN
	RETURN @Adet*@ListeFiyat�*(1-@�ndirimOran�)

END;

--FONKS�YONU �A�IRMAK:

SELECT dbo.NETSATIS(1,100,0.1)

--GER�EK TABLODA KULLANALIM:
CREATE TABLE Sat�sDeneme 
(
SiparisID INT,
Adet INT,
ListeF�yat INT,
IndirimOran� DEC(10,2)

);

INSERT INTO Sat�sDeneme VALUES
(1,2,30,0.1),
(2,1,20,0.1),
(3,3,10,0.1),
(4,4,30,0.1),
(5,5,10,0.1),
(7,1,30,0.1),
(8,4,10,0.1);

SELECT * FROM Sat�sDeneme

SELECT
SiparisID,
Adet,
ListeF�yat,
IndirimOran�,
[dbo].[NETSATIS](Adet,ListeF�yat,IndirimOran�) AS HESAPLAMA
FROM Sat�sDeneme


--KANITLIYORUZ:
SELECT
*,
ListeF�yat*Adet,
(ListeF�yat*Adet)-(IndirimOran�*(ListeF�yat*Adet))
FROM Sat�sDeneme

--FONKS�YONU DE���T�RMEK:
--Ayn�s� ama sadece alter diyece�iz.

ALTER FUNCTION �EMA.ADI.FONKS�YON ADI
(@Parametre1 datatype,@Parametre2 datatype,....)
RETURNS ReturnDatatype
AS
BEGIN
		Fonksyion G�vdesi veya SQL �fadeleri
		RETURN ReturnDatatype
END


--FONKS�YONU DROP ETMEK:
DROP FUNCTION [schema_name.]function_name
--�RNEK:
DROP FUNCTION dbo.NETSATIS


--�RNEK:
USE AdventureWorks2019

--A�A�IDAK� G�B� B�R SORGUMUZ OLSUN:
SELECT
[BusinessEntityID],
[ModifiedDate],
DATENAME(DW,[ModifiedDate]) + ' ' +
DATENAME(D,[ModifiedDate]) + ' ' +
DATENAME(M,[ModifiedDate]) + ' ' +
DATENAME(YY,[ModifiedDate])
FROM
Person.Person

--Bu i�lemler hep tek tek yazmak zorunda m�y�z?
--Hay�r !!!
--Kendi Fonksiyonumuzu olu�turaca��z.

--fonkisyon olu�turma

CREATE FUNCTION TARIHDENEME
(@TamTarih DATETIME)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN	DATENAME(DW,@TamTarih) + ' ' +
			DATENAME(D,@TamTarih) + ' ' +
			DATENAME(M,@TamTarih) + ' ' +
			DATENAME(YY,@TamTarih)
END

--FONKS�YONU GER�EK B�R TABLODA �ALI�TIRALIM:
SELECT
[BusinessEntityID],
[ModifiedDate],
[dbo].[TARIHDENEME]([ModifiedDate])
FROM
Person.Person

--MODIFY ETME
--2 YOLU VAR.1.YOL:Obj.EXP da fonk bul ve sa� t�k modify.
--di�er yol ise ALTER FUNCTION



ALTER FUNCTION [dbo].[TARIHDENEME]
(@TamTarih DATETIME)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN	DATENAME(DAYOFYEAR,@TamTarih) + ' ' +
			DATENAME(D,@TamTarih) + ' ' +
			DATENAME(M,@TamTarih) + ' ' +
			DATENAME(YY,@TamTarih)


END


--�rnek : Basit �arpma i�lemi

CREATE FUNCTION CARPMA 
(@X INT,@Y INT)
RETURNS INT
AS
BEGIN
		RETURN @X * @Y
END

SELECT dbo.CARPMA(2,3)

--TABLODA KULLANALIM
CREATE TABLE CARPIMTABLOSU
(
SAYI1 INT,
SAYI2 INT);

INSERT INTO CARPIMTABLOSU VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10);




--Fonksiyonumuz kullanal�m :
SELECT
SAYI1,
SAYI2,
[dbo].[CARPMA](SAYI1,SAYI2) as  sonuc
FROM CARPIMTABLOSU

sp_helptext CARPMA

DROP FUNCTION CARPMA