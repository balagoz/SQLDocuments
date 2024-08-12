


-- ### WH�LE BA�LANGI� ### ---

--Tekrar gerektiren i�lemlerin kod yaz�m�n� minimize etmek i�in kullan�l�r.
--While d�g�s�nde �nceden belirlenmi� bir ko�ul bozulana kadar devam eder.
--Ko�ulun her kontrol�nden sonra d�ng� i�erisindeki i�lemler bir kez daha yap�l�r. 
--Ko�ul bozulduktan sonraki ilk kontrolde d�ng� terk edilir.
--Ko�ulun bozulmas�n� beklemeden de d�ng�y� k�rarak terk edebilmek m�mk�nd�r.
--While ifadesinden sonra mant�ksal test belirtilir.
--�rne�in While @Adet<10 ---- Bu ko�ul do�ruysa Begin end blo�una gireriz ve orada belirtilen i�lemler ger�ekle�ir.
--Birinci i�lem bitikten sonra ayn� d�ng� devam eder.Ayn� kontrol ikinci i�lem,���n�� i�lem ve di�erleri i�in yap�l�r.
--Taki d�ng� bozulana kadar.

--�RNEK : 1'den 10'a kadar say�lar� yazd�rmak istiyorum

DECLARE @say� INT
SET @say� = 1
WHILE @say� <= 10
	BEGIN
		PRINT @say�
		SET @say� = @say� + 1
	END


--A�IKLAMA
--1.durum:
DECLARE @say� INT 
SET @say� = 1
PRINT @say� -- 1  say�s�n� bu �ekilde yazd�rabilriiz.

--2.durum:
DECLARE @say�1 INT
DECLARE @say�2 INT
SET @say�1 = 1
SET @say�2 = 2

PRINT @say�1-- 1  say�s�n� bu �ekilde yazd�rabilriiz.
PRINT @say�2-- 2  say�s�n� bu �ekilde yazd�rabilriiz.


--3.DURUM:
--2 SAYI ���N 4 SATIR KOD YAZIM. 1'DEN 100'E KADAR �STEN�YORSA NE YAPACA�IZ? 

DECLARE @say� INT
SET @say� = 1
WHILE @say� <= 100
	BEGIN
		PRINT @say�
		SET @say� = @say� + 1
	END


--�RNEK : 10 DEFA ADIMIZI YAZDIRALIM :

DECLARE @SAYI INT
SET @SAYI = 1
WHILE @SAYI <= 10
	BEGIN
		PRINT CAST(@SAYI AS VARCHAR) + ' ' + 'Onur Okay'
		SET @SAYI = @SAYI + 1
	END

--�RNEK : TABLOYA VER� GR�MEK :

CREATE TABLE Dongu
(
ID INT IDENTITY,
AD VARCHAR(30)

);

SELECT * FROM Dongu


DECLARE @�sim INT
SET @�sim = 1
WHILE @�sim <= 5
	BEGIN
		INSERT INTO Dongu (AD) VALUES ('Onur')
		SET @�sim = @�sim + 1
	END


--�rnek
SELECT StateProvinceID FROM Person.StateProvince WHERE CountryRegionCode = 'FR'
ORDER BY StateProvinceID

(SELECT MIN(StateProvinceID)FROM Person.StateProvince WHERE CountryRegionCode = 'FR') --84
(SELECT MAX(StateProvinceID)FROM Person.StateProvince WHERE CountryRegionCode = 'FR') --181


select CountryRegionCode,COUNT(StateProvinceID) AS SehirAdet from Person.StateProvince
GROUP BY CountryRegionCode
ORDER BY SehirAdet DESC



DECLARE @SehirIDMIN INT
DECLARE @SehirIDMAX INT
DECLARE @Sonuc INT

SET @SehirIDMIN = (SELECT MIN(StateProvinceID)FROM Person.StateProvince WHERE CountryRegionCode = 'FR')
SET @SehirIDMAX = (SELECT MAX(StateProvinceID)FROM Person.StateProvince WHERE CountryRegionCode = 'FR')

WHILE @SehirIDMIN <= @SehirIDMAX
	BEGIN
		IF @SehirIDMIN IN (SELECT StateProvinceID FROM Person.StateProvince WHERE CountryRegionCode = 'FR')
			BEGIN
				PRINT @SehirIDMIN
			END
		SET @SehirIDMIN = @SehirIDMIN + 1
	END





-- ### WH�LE B�T�� ### ---