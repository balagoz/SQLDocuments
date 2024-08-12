


--- BEGIN END ve IF ELSE ---


--- ### BEGIN VE END BAÞLANGIÇ ### ---

--BEGIN END, ifadeleri (sorgular) bloðu yaratmada kullanýlýr.
--Blok = Bir den fazla birlikte execute etmesi (çalýþmasý) gereken SQL sorgularýdýr.
--Batch diye de bilinmektedir.
--Eðer cümleleri bir SQL sorgusu olarak düþüneceksek,BEGIN VE END ifadesi paragraf yaratmamýzý saðlar.
--Genellikle Stored Proc ve Fonksiyonlarda kullanýlýr ama þart deðildir.Ancak kullanýlmasý daha iyi olur.
--Ancak IF ELSE ve WHILE ifadelerini kullanýrsak kullanmak zorundayýz.
--Eðer birden fazla aksiyon yazmak istiyorsak tüm aksiyonlarý BEGIN ve END içerisinde kullanmalýyýz.


--SYNTAX :
/*
BEGIN
	SQL Sorgularý
END
*/

--Örnek :

SELECT * FROM Production.Product
where ListPrice > 1000 --86 SATIR DÖNDÜ


BEGIN
	SELECT ProductID FROM Production.Product
	where ListPrice > 1000;

	SELECT @@ROWCOUNT;
	
END

--Örnek :

DECLARE @Sayý INT
SET @Sayý= 12

BEGIN
	IF @Sayý < 10
		PRINT 'Sayý 10dan küçüktür'
	ELSE
		PRINT 'Sayý 10dan büyüktür'
END


--Örnek :

	BEGIN
		DECLARE @A INT = 10
		DECLARE @B INT = 50
		SELECT @A + @B
		PRINT @A + @B
	END;


--Örnek :
SELECT AVG(ListPrice) FROM Production.Product

BEGIN
	DECLARE @OrtFiyat DECIMAL(10,2)
	SET @OrtFiyat = (SELECT AVG(ListPrice) FROM Production.Product)
	PRINT 'Ortalama Birim Fiyatý = ' + CAST(@OrtFiyat AS VARCHAR(50));

	IF @OrtFiyat < 500
	 PRINT '500''den Küçük'
	ELSE
	 PRINT '500''den Küçük';
	 
END


--Örnek : Dýþarda BEGIN ve END deðilde,içeride BEGIN ve END Kullanýmý

	DECLARE @OrtFiyat DECIMAL(10,2)
	SELECT @OrtFiyat = AVG(ListPrice) FROM Production.Product
	PRINT 'Ortalama Birim Fiyatý = ' + CAST(@OrtFiyat AS VARCHAR(50));

	IF @OrtFiyat < 500
		BEGIN
			PRINT '500''den Küçük'
		END
	ELSE
		BEGIN
			PRINT '500''den Küçük';
		END


--- ### BEGIN VE END BAÞLANGIÇ ### ---





--- ### IF ELSE BAÞLANGIÇ ### ---

--IF SYNTAX :
	IF Þart(Ýfade)
		BEGIN
			Sorgu Bloðu
		END
--Eðer Þart(Ýfade) doðruysa BEGIN VE End bloðu içindeki ifade çalýþýr.
--Aksi halde Sorgu bloðu bypass edilir ve ve programýn kontrolu END ifadesinden sonraya geçer.
--IF ELSE SYNTAX :
	IF Þart(Ýfade)
			BEGIN
				Þart(Ýfade)Doðruysa
			END
	ELSE
			BEGIN
				Þart(Ýfade)Yanlýþsa
			END

--Bir þartýn saðlanýp saðlanmadýðýný kontrol eder.Þartýn saðlanýp saðlanmamýsýna göre verilen komutlarý uygular
--Mantýksal bir þartý kontrol eder.


--ÖRNEK :

--Deðiþken Tanýmlama :
DECLARE @Sayý INT
--Deðiþken Veri Atama :
SET @Sayý =12
--ÞART KONTROL
IF @Sayý < 11
	BEGIN
		PRINT CAST(@Sayý AS VARCHAR) + ' ' + '11''den Küçüktür'
	END
ELSE
	BEGIN
		PRINT CAST(@Sayý AS VARCHAR) + ' ' + '11''den Büyüktür'
	END




--ÖRNEK : Sadece IF

CREATE TABLE Sýralama
(
AD VARCHAR(50),
Cinsiyet VARCHAR(50),
Maas INT

);

INSERT INTO Sýralama VALUES
('Onur','E',8000),
('Murat','E',8000),
('Ezgi','K',7000),
('Esin','K',600),
('Fatma','K',5000),
('Melis','K',5000),
('Yeliz','K',5000),
('Kemal','E',4000),
('Mert','E',3500),
('Cem','E',3000);

--Örnek :
SELECT * FROM Sýralama

DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM Sýralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 3
	PRINT 'Erkek Personel Sayýsý 3''ten fazla'



--ÖRNEK : IF ELSE Kullanýmý


SELECT * FROM Sýralama

DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM Sýralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 10
	PRINT 'Erkek Personel Sayýsý 10''ten fazla'
ELSE
	PRINT 'Erkek Personel Sayýsý 10''ten küçük'


--ÖRNEK : BEGIN VE END KULLANIMI :
--Þimdiye kadarki örneklerimizde þart saðlanýrsa 1 aksiyon olsun,
--þart saðlanmazsa 1 aksiyon olsun diyorduk.
--Eðer birden fazla aksiyon almak istiyorsak þart saðlanýrsa veya saðlanmazsa dikkat etmeliyiz.
--Yukarýdaki örneðe bir tane daha aksyion eklemek istiyorum:

--HATA VERÝR AÞAÐIDAKÝ GÝBÝ YAZARSAM:

DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM Sýralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 3
	PRINT 'DÝKKAT !!!'
	PRINT 'Erkek Personel Sayýsý 3''ten fazla'
ELSE
	PRINT 'Erkek Personel Sayýsý 3''ten küçük'


--HATANIN ÇÖZÜMÜ :
--Eðer birden fazla aksiyon yazmak istiyorsak tüm aksiyonlarý BEGIN ve END içerisinde kullanmalýyýz.


DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM Sýralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 3
	BEGIN
			PRINT 'BÝLGÝ !!!'
			PRINT 'Erkek Personel Sayýsý 3''ten fazla'
	END
ELSE
	BEGIN	
			PRINT 'BÝLGÝ !!!'
			PRINT 'Erkek Personel Sayýsý 3''ten küçük'

	END



--ÖRNEK : ÝÇ ÝÇE IF KULLANIMI :

--Ayný if ifadesinin içinde birden fazla þartý kontrol etmek istiyorsak,içi içe ÝF kullanýrýz.Ýngilizcede Nesting IF
--Statement denir.

SELECT * FROM HumanResources.Employee


DECLARE @ErkekSatýs INT
DECLARE @KadýnSatýs INT
DECLARE @ToplamSatýs INT
SET @ErkekSatýs = (select COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '%Sale%' AND Gender ='M')
SET @KadýnSatýs = (select COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '%Sale%' AND Gender ='F')
SET @ToplamSatýs= (select COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '%Sale%')
IF @ToplamSatýs < 30
	BEGIN
		PRINT 'Dikkat!!!'
		PRINT 'Satýþçýlarýmýz az'
		IF @KadýnSatýs < 15
			BEGIN
				PRINT 'Kadýn Satýþçýlarýmýzýn sayýsýný arttýmalýyýz'
			END
		ELSE
			BEGIN
				PRINT 'Yeterli Kadýn satýþçýmýz var'
			END
	END

ELSE
	BEGIN
		PRINT 'Bilgi'
		PRINT 'Satýþçýlarýmýz Yeterli'

	END
		

--ÖRNEK : STORED PROC ÖRNEÐÝ :

SELECT * FROM Production.Product
--DISTINCT COLOR'LAR
/*
Black
Blue
Grey
Multi
Red
Silver
Silver/Black
White
Yellow*/

--RETURN ifadesi Proc'un çalýþmasýný durdurur.

create PROC RenkSecim
(@Renk varchar(20))
AS
BEGIN
		IF @Renk = 'Black'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Blue'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Grey'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Multi'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Red'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Silver'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Silver/Black'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'White'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		IF @Renk = 'Yellow'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE
			SELECT 'Yanlýþ Renk Seçimi Yaptýnýz !'

END;

EXEC RenkSecim @Renk = 'Black'


--STORED PROC ELSE IF'LÝ


--IF - ELSEIF - ELSE ÖRNEK :





ALTER PROC RenkSecim2
(@Renk varchar(20))
AS
BEGIN
		IF @Renk = 'Black'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Blue'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Grey'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Multi'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Red'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Silver'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Silver/Black'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'White'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE IF @Renk = 'Yellow'
			BEGIN
				SELECT Name,Color FROM Production.Product Where Color = @Renk
				RETURN
			END

		ELSE
			SELECT 'Yanlýþ Renk Seçimi Yaptýnýz !'

END;

EXEC RenkSecim2 @Renk = 'Black'

SELECT GETDATE()



--ÖRNEK : HAFTANIN GÜNÜ
DECLARE @Gun INT
SET @Gun = (SELECT DATEPART(DW,GETDATE()))

IF @Gun = 1
	BEGIN
		PRINT 'Pazar'
	END
ELSE IF @Gun = 2
	BEGIN
		PRINT 'Pazartesi'
	END
ELSE IF @Gun = 3
	BEGIN
		PRINT 'Salý'
	END
ELSE IF @Gun = 4
	BEGIN
		PRINT 'Çarþamba'
	END
ELSE IF @Gun = 5
	BEGIN
		PRINT 'Perþembe'
	END
ELSE IF @Gun = 6
	BEGIN
		PRINT 'Cuma'
	END
ELSE  
	BEGIN
		PRINT 'Cumartesi'
	END


--ÖRNEK : IF EXISTS

IF EXISTS (SELECT * FROM Sýralama WHERE AD = 'Onur')
	BEGIN
		PRINT 'Kayýt Bulundu'
	END
ELSE
	BEGIN
		PRINT 'Kayýt Bulunamadý'
	END

--ÖRNEK : Else ýf

--select * from Sales.SalesPerson

DECLARE @Satýslar INT
SET @Satýslar = (SELECT SUM(SalesYTD)FROM Sales.SalesPerson)

IF @Satýslar > (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Satýþ Mikatrýmýz Geçen yýlýn Ortalamasýndan Yüksek'
	END
ELSE IF @Satýslar = (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Satýþ Mikatrýmýz Geçen yýlýn Satýþýyla Ayný'
	END
ELSE  IF @Satýslar < (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Satýþ Mikatrýmýz Geçen yýlýn Satýþýndan Kötü'
	END


--DÝÐER ÖRNEK:

DECLARE @Satýslar INT
SET @Satýslar = 10000

IF @Satýslar > (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Satýþ Mikatrýmýz Geçen yýlýn Ortalamasýndan Yüksek'
	END
ELSE IF @Satýslar = (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Satýþ Mikatrýmýz Geçen yýlýn Satýþýyla Ayný'
	END
ELSE 
	BEGIN
		PRINT 'Satýþ Mikatrýmýz Geçen yýlýn Satýþýndan Kötü'
	END