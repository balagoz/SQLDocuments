


-- ### WHÝLE BAÞLANGIÇ ### ---

--Tekrar gerektiren iþlemlerin kod yazýmýný minimize etmek için kullanýlýr.
--While dögüsünde önceden belirlenmiþ bir koþul bozulana kadar devam eder.
--Koþulun her kontrolünden sonra döngü içerisindeki iþlemler bir kez daha yapýlýr. 
--Koþul bozulduktan sonraki ilk kontrolde döngü terk edilir.
--Koþulun bozulmasýný beklemeden de döngüyü kýrarak terk edebilmek mümkündür.
--While ifadesinden sonra mantýksal test belirtilir.
--Örneðin While @Adet<10 ---- Bu koþul doðruysa Begin end bloðuna gireriz ve orada belirtilen iþlemler gerçekleþir.
--Birinci iþlem bitikten sonra ayný döngü devam eder.Ayný kontrol ikinci iþlem,üçünçü iþlem ve diðerleri için yapýlýr.
--Taki döngü bozulana kadar.

--ÖRNEK : 1'den 10'a kadar sayýlarý yazdýrmak istiyorum

DECLARE @sayý INT
SET @sayý = 1
WHILE @sayý <= 10
	BEGIN
		PRINT @sayý
		SET @sayý = @sayý + 1
	END


--AÇIKLAMA
--1.durum:
DECLARE @sayý INT 
SET @sayý = 1
PRINT @sayý -- 1  sayýsýný bu þekilde yazdýrabilriiz.

--2.durum:
DECLARE @sayý1 INT
DECLARE @sayý2 INT
SET @sayý1 = 1
SET @sayý2 = 2

PRINT @sayý1-- 1  sayýsýný bu þekilde yazdýrabilriiz.
PRINT @sayý2-- 2  sayýsýný bu þekilde yazdýrabilriiz.


--3.DURUM:
--2 SAYI ÝÇÝN 4 SATIR KOD YAZIM. 1'DEN 100'E KADAR ÝSTENÝYORSA NE YAPACAÐIZ? 

DECLARE @sayý INT
SET @sayý = 1
WHILE @sayý <= 100
	BEGIN
		PRINT @sayý
		SET @sayý = @sayý + 1
	END


--ÖRNEK : 10 DEFA ADIMIZI YAZDIRALIM :

DECLARE @SAYI INT
SET @SAYI = 1
WHILE @SAYI <= 10
	BEGIN
		PRINT CAST(@SAYI AS VARCHAR) + ' ' + 'Onur Okay'
		SET @SAYI = @SAYI + 1
	END

--ÖRNEK : TABLOYA VERÝ GRÝMEK :

CREATE TABLE Dongu
(
ID INT IDENTITY,
AD VARCHAR(30)

);

SELECT * FROM Dongu


DECLARE @Ýsim INT
SET @Ýsim = 1
WHILE @Ýsim <= 5
	BEGIN
		INSERT INTO Dongu (AD) VALUES ('Onur')
		SET @Ýsim = @Ýsim + 1
	END


--Örnek
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





-- ### WHÝLE BÝTÝÞ ### ---