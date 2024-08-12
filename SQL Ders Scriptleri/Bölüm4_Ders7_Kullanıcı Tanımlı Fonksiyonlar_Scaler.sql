--- ### Scaler Fonksiyonlar ### ---
--Parametre alabilir veya almayabilirler ama her zaman tek (scaler) deðer dönerler.
--Dönen deðer herhangi bir veri tipinde olabilir ancak text,ntext,image ve cursor olamazlar.
--Kodlarýmýzý kýsaltmamýza neden olur.Mesela birden fazla sorguyu kullanarak yazdýðýmýz karýþýk bir sorgumuz olsun.
--Her sorguya bu karýþýk sorgu bütünlerini eklemektense fonk.yaratabiliriz.Ve onu kullanabiliriz.
--Fonksiyonunn textini görmek için >>>>> sp_helptext FONK.ADI
--Bugüne kadar gördüðümüz tüm fonksiyonlar hazýr scaler sistem fonksiyonlarýydý.
--Biz de bunlar gibi kendi fonk.oluþturabiliriz.

--ÖRNEK
--Parametre aldý,iþlemini yaptý ve deðerini döndü.
--user def.function ile yaptýðýmýzý stoered proc aracýlýðýylada yapabiliriz.
SELECT SQUARE(2);-- 4

--Ama fonksiyonlarýn paramtre almasý zorunlu deðil.
--Örneðin GETDATE() fonksiyonu parametre almaz.

SELECT GETDATE();

--Kullanýcý Tanýmlý Scaler Fonk.Nasýl Yaratýlýr ?
--SYNTAX :
CREATE FUNCTION FONKSÝYON_ADI
(@Parametre1 datatype,@Parametre2 datatype,....)
RETURNS ReturnDatatype
AS
BEGIN
		Fonksyion Gövdesi veya SQL Ýfadeleri
		RETURN ReturnDatatype
END

--ÖRNEK :Net satýþlarý hesaplayan bir fonk.Yaratalaým.
--Deðiþkenlerimiz de @Adet,@ListeFiyatý,@Ýndirim Oraný olsun.
USE Ornekler
GO
CREATE FUNCTION NETSATIS
(@Adet INT,@ListeFiyatý DEC(10,2),@ÝndirimOraný DEC(10,2))
RETURNS DEC(10,2)
AS
BEGIN
	RETURN @Adet*@ListeFiyatý*(1-@ÝndirimOraný)

END;

--FONKSÝYONU ÇAÐIRMAK:

SELECT dbo.NETSATIS(1,100,0.1)

--GERÇEK TABLODA KULLANALIM:
CREATE TABLE SatýsDeneme 
(
SiparisID INT,
Adet INT,
ListeFÝyat INT,
IndirimOraný DEC(10,2)

);

INSERT INTO SatýsDeneme VALUES
(1,2,30,0.1),
(2,1,20,0.1),
(3,3,10,0.1),
(4,4,30,0.1),
(5,5,10,0.1),
(7,1,30,0.1),
(8,4,10,0.1);

SELECT * FROM SatýsDeneme

SELECT
SiparisID,
Adet,
ListeFÝyat,
IndirimOraný,
[dbo].[NETSATIS](Adet,ListeFÝyat,IndirimOraný) AS HESAPLAMA
FROM SatýsDeneme


--KANITLIYORUZ:
SELECT
*,
ListeFÝyat*Adet,
(ListeFÝyat*Adet)-(IndirimOraný*(ListeFÝyat*Adet))
FROM SatýsDeneme

--FONKSÝYONU DEÐÝÞTÝRMEK:
--Aynýsý ama sadece alter diyeceðiz.

ALTER FUNCTION ÞEMA.ADI.FONKSÝYON ADI
(@Parametre1 datatype,@Parametre2 datatype,....)
RETURNS ReturnDatatype
AS
BEGIN
		Fonksyion Gövdesi veya SQL Ýfadeleri
		RETURN ReturnDatatype
END


--FONKSÝYONU DROP ETMEK:
DROP FUNCTION [schema_name.]function_name
--ÖRNEK:
DROP FUNCTION dbo.NETSATIS


--ÖRNEK:
USE AdventureWorks2019

--AÞAÐIDAKÝ GÝBÝ BÝR SORGUMUZ OLSUN:
SELECT
[BusinessEntityID],
[ModifiedDate],
DATENAME(DW,[ModifiedDate]) + ' ' +
DATENAME(D,[ModifiedDate]) + ' ' +
DATENAME(M,[ModifiedDate]) + ' ' +
DATENAME(YY,[ModifiedDate])
FROM
Person.Person

--Bu iþlemler hep tek tek yazmak zorunda mýyýz?
--Hayýr !!!
--Kendi Fonksiyonumuzu oluþturacaðýz.

--fonkisyon oluþturma

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

--FONKSÝYONU GERÇEK BÝR TABLODA ÇALIÞTIRALIM:
SELECT
[BusinessEntityID],
[ModifiedDate],
[dbo].[TARIHDENEME]([ModifiedDate])
FROM
Person.Person

--MODIFY ETME
--2 YOLU VAR.1.YOL:Obj.EXP da fonk bul ve sað týk modify.
--diðer yol ise ALTER FUNCTION



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


--örnek : Basit Çarpma iþlemi

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




--Fonksiyonumuz kullanalým :
SELECT
SAYI1,
SAYI2,
[dbo].[CARPMA](SAYI1,SAYI2) as  sonuc
FROM CARPIMTABLOSU

sp_helptext CARPMA

DROP FUNCTION CARPMA