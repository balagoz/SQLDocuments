


--- BEGIN END ve IF ELSE ---


--- ### BEGIN VE END BA�LANGI� ### ---

--BEGIN END, ifadeleri (sorgular) blo�u yaratmada kullan�l�r.
--Blok = Bir den fazla birlikte execute etmesi (�al��mas�) gereken SQL sorgular�d�r.
--Batch diye de bilinmektedir.
--E�er c�mleleri bir SQL sorgusu olarak d���neceksek,BEGIN VE END ifadesi paragraf yaratmam�z� sa�lar.
--Genellikle Stored Proc ve Fonksiyonlarda kullan�l�r ama �art de�ildir.Ancak kullan�lmas� daha iyi olur.
--Ancak IF ELSE ve WHILE ifadelerini kullan�rsak kullanmak zorunday�z.
--E�er birden fazla aksiyon yazmak istiyorsak t�m aksiyonlar� BEGIN ve END i�erisinde kullanmal�y�z.


--SYNTAX :
/*
BEGIN
	SQL Sorgular�
END
*/

--�rnek :

SELECT * FROM Production.Product
where ListPrice > 1000 --86 SATIR D�ND�


BEGIN
	SELECT ProductID FROM Production.Product
	where ListPrice > 1000;

	SELECT @@ROWCOUNT;
	
END

--�rnek :

DECLARE @Say� INT
SET @Say�= 12

BEGIN
	IF @Say� < 10
		PRINT 'Say� 10dan k���kt�r'
	ELSE
		PRINT 'Say� 10dan b�y�kt�r'
END


--�rnek :

	BEGIN
		DECLARE @A INT = 10
		DECLARE @B INT = 50
		SELECT @A + @B
		PRINT @A + @B
	END;


--�rnek :
SELECT AVG(ListPrice) FROM Production.Product

BEGIN
	DECLARE @OrtFiyat DECIMAL(10,2)
	SET @OrtFiyat = (SELECT AVG(ListPrice) FROM Production.Product)
	PRINT 'Ortalama Birim Fiyat� = ' + CAST(@OrtFiyat AS VARCHAR(50));

	IF @OrtFiyat < 500
	 PRINT '500''den K���k'
	ELSE
	 PRINT '500''den K���k';
	 
END


--�rnek : D��arda BEGIN ve END de�ilde,i�eride BEGIN ve END Kullan�m�

	DECLARE @OrtFiyat DECIMAL(10,2)
	SELECT @OrtFiyat = AVG(ListPrice) FROM Production.Product
	PRINT 'Ortalama Birim Fiyat� = ' + CAST(@OrtFiyat AS VARCHAR(50));

	IF @OrtFiyat < 500
		BEGIN
			PRINT '500''den K���k'
		END
	ELSE
		BEGIN
			PRINT '500''den K���k';
		END


--- ### BEGIN VE END BA�LANGI� ### ---





--- ### IF ELSE BA�LANGI� ### ---

--IF SYNTAX :
	IF �art(�fade)
		BEGIN
			Sorgu Blo�u
		END
--E�er �art(�fade) do�ruysa BEGIN VE End blo�u i�indeki ifade �al���r.
--Aksi halde Sorgu blo�u bypass edilir ve ve program�n kontrolu END ifadesinden sonraya ge�er.
--IF ELSE SYNTAX :
	IF �art(�fade)
			BEGIN
				�art(�fade)Do�ruysa
			END
	ELSE
			BEGIN
				�art(�fade)Yanl��sa
			END

--Bir �art�n sa�lan�p sa�lanmad���n� kontrol eder.�art�n sa�lan�p sa�lanmam�s�na g�re verilen komutlar� uygular
--Mant�ksal bir �art� kontrol eder.


--�RNEK :

--De�i�ken Tan�mlama :
DECLARE @Say� INT
--De�i�ken Veri Atama :
SET @Say� =12
--�ART KONTROL
IF @Say� < 11
	BEGIN
		PRINT CAST(@Say� AS VARCHAR) + ' ' + '11''den K���kt�r'
	END
ELSE
	BEGIN
		PRINT CAST(@Say� AS VARCHAR) + ' ' + '11''den B�y�kt�r'
	END




--�RNEK : Sadece IF

CREATE TABLE S�ralama
(
AD VARCHAR(50),
Cinsiyet VARCHAR(50),
Maas INT

);

INSERT INTO S�ralama VALUES
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

--�rnek :
SELECT * FROM S�ralama

DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM S�ralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 3
	PRINT 'Erkek Personel Say�s� 3''ten fazla'



--�RNEK : IF ELSE Kullan�m�


SELECT * FROM S�ralama

DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM S�ralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 10
	PRINT 'Erkek Personel Say�s� 10''ten fazla'
ELSE
	PRINT 'Erkek Personel Say�s� 10''ten k���k'


--�RNEK : BEGIN VE END KULLANIMI :
--�imdiye kadarki �rneklerimizde �art sa�lan�rsa 1 aksiyon olsun,
--�art sa�lanmazsa 1 aksiyon olsun diyorduk.
--E�er birden fazla aksiyon almak istiyorsak �art sa�lan�rsa veya sa�lanmazsa dikkat etmeliyiz.
--Yukar�daki �rne�e bir tane daha aksyion eklemek istiyorum:

--HATA VER�R A�A�IDAK� G�B� YAZARSAM:

DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM S�ralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 3
	PRINT 'D�KKAT !!!'
	PRINT 'Erkek Personel Say�s� 3''ten fazla'
ELSE
	PRINT 'Erkek Personel Say�s� 3''ten k���k'


--HATANIN ��Z�M� :
--E�er birden fazla aksiyon yazmak istiyorsak t�m aksiyonlar� BEGIN ve END i�erisinde kullanmal�y�z.


DECLARE @PersonelAdedi INT
SET @PersonelAdedi = (SELECT COUNT(*) FROM S�ralama WHERE Cinsiyet = 'E')
IF @PersonelAdedi > 3
	BEGIN
			PRINT 'B�LG� !!!'
			PRINT 'Erkek Personel Say�s� 3''ten fazla'
	END
ELSE
	BEGIN	
			PRINT 'B�LG� !!!'
			PRINT 'Erkek Personel Say�s� 3''ten k���k'

	END



--�RNEK : �� ��E IF KULLANIMI :

--Ayn� if ifadesinin i�inde birden fazla �art� kontrol etmek istiyorsak,i�i i�e �F kullan�r�z.�ngilizcede Nesting IF
--Statement denir.

SELECT * FROM HumanResources.Employee


DECLARE @ErkekSat�s INT
DECLARE @Kad�nSat�s INT
DECLARE @ToplamSat�s INT
SET @ErkekSat�s = (select COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '%Sale%' AND Gender ='M')
SET @Kad�nSat�s = (select COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '%Sale%' AND Gender ='F')
SET @ToplamSat�s= (select COUNT(*) FROM HumanResources.Employee WHERE JobTitle LIKE '%Sale%')
IF @ToplamSat�s < 30
	BEGIN
		PRINT 'Dikkat!!!'
		PRINT 'Sat����lar�m�z az'
		IF @Kad�nSat�s < 15
			BEGIN
				PRINT 'Kad�n Sat����lar�m�z�n say�s�n� artt�mal�y�z'
			END
		ELSE
			BEGIN
				PRINT 'Yeterli Kad�n sat����m�z var'
			END
	END

ELSE
	BEGIN
		PRINT 'Bilgi'
		PRINT 'Sat����lar�m�z Yeterli'

	END
		

--�RNEK : STORED PROC �RNE�� :

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

--RETURN ifadesi Proc'un �al��mas�n� durdurur.

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
			SELECT 'Yanl�� Renk Se�imi Yapt�n�z !'

END;

EXEC RenkSecim @Renk = 'Black'


--STORED PROC ELSE IF'L�


--IF - ELSEIF - ELSE �RNEK :





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
			SELECT 'Yanl�� Renk Se�imi Yapt�n�z !'

END;

EXEC RenkSecim2 @Renk = 'Black'

SELECT GETDATE()



--�RNEK : HAFTANIN G�N�
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
		PRINT 'Sal�'
	END
ELSE IF @Gun = 4
	BEGIN
		PRINT '�ar�amba'
	END
ELSE IF @Gun = 5
	BEGIN
		PRINT 'Per�embe'
	END
ELSE IF @Gun = 6
	BEGIN
		PRINT 'Cuma'
	END
ELSE  
	BEGIN
		PRINT 'Cumartesi'
	END


--�RNEK : IF EXISTS

IF EXISTS (SELECT * FROM S�ralama WHERE AD = 'Onur')
	BEGIN
		PRINT 'Kay�t Bulundu'
	END
ELSE
	BEGIN
		PRINT 'Kay�t Bulunamad�'
	END

--�RNEK : Else �f

--select * from Sales.SalesPerson

DECLARE @Sat�slar INT
SET @Sat�slar = (SELECT SUM(SalesYTD)FROM Sales.SalesPerson)

IF @Sat�slar > (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Sat�� Mikatr�m�z Ge�en y�l�n Ortalamas�ndan Y�ksek'
	END
ELSE IF @Sat�slar = (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Sat�� Mikatr�m�z Ge�en y�l�n Sat���yla Ayn�'
	END
ELSE  IF @Sat�slar < (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Sat�� Mikatr�m�z Ge�en y�l�n Sat���ndan K�t�'
	END


--D��ER �RNEK:

DECLARE @Sat�slar INT
SET @Sat�slar = 10000

IF @Sat�slar > (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Sat�� Mikatr�m�z Ge�en y�l�n Ortalamas�ndan Y�ksek'
	END
ELSE IF @Sat�slar = (SELECT AVG(SalesLastYear)FROM Sales.SalesPerson)
	BEGIN
		PRINT 'Sat�� Mikatr�m�z Ge�en y�l�n Sat���yla Ayn�'
	END
ELSE 
	BEGIN
		PRINT 'Sat�� Mikatr�m�z Ge�en y�l�n Sat���ndan K�t�'
	END