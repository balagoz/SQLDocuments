--- ### STORED PROCEDURE ### ---

--Daha önceden hazýrladýðýmýz ve tekrar tekrar kullanabiliciðimiz hazýr SQL kodlarýdýr.
--Eðer tekrar tekrar yazdýðýmzý bir SQL sorgumuz varsa onu stored proc olarak saveleyip,çaðýrýp tekrar kullanabiliriz.
--Ayný zamanda parametrede gönderip çalýþtýrabiliriz.
--Bize hýz ve verimililik saðlar.
--SP'yi çalýþtýrýrken girdiðimiz parametrelerin sýrasý önemli.Çalýþtýrýrken sýralamaya dikkat etmeli.
--Dýþarýdan parametre alabilen tekli yada çokludeðer dönebilen ,içinde SQL sorgularýmýzý yazabildiðimiz programlama birimleridir.
--VERÝ TABANI SERVER'INDA SAKLANDIÐI ÝÇÝN ÇOK DAHA hýzlý çalýþýrlar.
--Hýz,güvenlik,performans,iþlem yükünü düþmesini...saðlar.
--Hazýr sistem sp'leri vardýr.
--Bunlar bize sqlserverdaki objelerler ilgili bilgi verirler.
--SP_HELP ADETBYGENDER(SP ÝLE ÝLGÝLÝ BÝLGÝ VERÝR.)
--SP_HELPTEXT ADETBYGENDER(SP NÝN TEXTÝNÝ VERÝR.)
--SP_HELPCONSTRAINT 'tblPersonel' ---constraintlerle ilgili bikgi verir.

--STORED PROCEDURES BASÝC :
--STORED PROCEDURES PARAMETRELER :
--STORED PROCEDURES OUTPUT Parametreleri ve Return Values :



-- ### STORED PROCEDURES BASÝC BAÞLANGIÇ ### :

--Aþaðýdaki gibi bir sorgumuz olsun:

SELECT
Color,
COUNT(*),
AVG(ListPrice)
FROM Production.Product
WHERE COLOR IS NOT NULL
group by ROLLUP (Color)


--Bunu tekrar tekrar kullanýyoruz.

--Stored Proc Yaratma :

CREATE PROC spColorProduct--Stored Proc.Adý
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by ROLLUP (Color)
END

EXEC spColorProduct

--ÖRNEK2 :
SELECT * FROM [Person].[Person]
WHERE  Title = 'Mr.'

CREATE PROC Person 
AS
BEGIN
	SELECT * FROM [Person].[Person]
	WHERE  Title = 'Mr.'
END;

EXEC Person

--Stored Proc Execute Etme :
--2 yolu vardýr.
--1.YOL : SP ismini mouse ile higlight edip execute etmek.
--2.YOL : EXEC veya EXECUTE sp_adý

EXEC spColorProduct


--Stored Proc Modify Etme :
--Herþey ayný kalýr.Sadece Create yerine Alter diyecceðiz.
ALTER PROC spColorProduct
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
END

EXECUTE spColorProduct

--Eðer sp oluþturduðum kodu bulamýyorsam,obj exp'dan Programm -- Stored Proc --Saðtýk Modify


--Stored Proc Silme:
--2 yolu var.
--1.yol :Obj.Exp'dan sp'yi bulup,sað týk ve delete.
--2.YOL : DROP PROC spadý

DROP PROC spColorProduct



-- ### STORED PROCEDURES BASÝC BÝTÝÞ ### :





-- ### STORED PROCEDURES PARAMETRELERÝ BAÞLANGIÇ ### :

--Parametre Nedir?
--Basit ifadeyle dýþarýdan atayabildiðimiz deðerler gibi düþünebiliriz.

--ÖRNEK : EXECUTE spColorProduct Black

EXECUTE spColorProduct 'Black'


--TEK PARAMETRELÝ ÖRNEK :	
--Normal Sorgumuz aþaðýda:
SELECT
Color,
COUNT(*),
AVG(ListPrice)
FROM Production.Product
WHERE COLOR IS NOT NULL
group by (Color)
HAVING COLOR ='Black'


--ProC Yaratalým:

CREATE PROC DenemeRenk 
(@Color VARCHAR(30))
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR =@Color

END ;

--ProC Çalýþtýralým:
EXEC DenemeRenk Black

--BÝRDEN FAZLA PARAMETRELÝ ÖRNEK :
ALTER PROC DenemeRenk 
(@Color1 VARCHAR(30),@Color2 VARCHAR(30))
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR IN (@Color1,@Color2)

END ;

EXEC DenemeRenk Black,Red


--Parametreleri aþaðýdaki þekildeki gibi de kullanabiliriz:
EXEC DenemeRenk @Color1 ='Black',@Color2 ='Red'


--ÖRNEK : 2 PARAMETRELÝ.
--Normal Tablom:
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE GENDER = 'M' AND JobTitle LIKE '%Manager%'

--PROC OLUÞTURALIM:
CREATE PROC GENJOB
(	@GENDER VARCHAR(2),
	@JobTitle VARCHAR(MAX)
)
AS
BEGIN
	SELECT BusinessEntityID FROM HumanResources.Employee
	WHERE GENDER = @GENDER AND JobTitle LIKE '%' + @JobTitle +'%'
END;

EXEC GENJOB M,manager

EXEC GENJOB @GENDER =M, @JobTitle =manager

--Text Þeklinmde Paramaetre Yaratmak :

ALTER PROC DenemeRenk 
(@Color VARCHAR(30))
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR LIKE '%' + @Color + '%'

END ;

EXEC DenemeRenk SÝL


--Opsiyonel Paramaetre Yaratmak :
--Burada parametremize default bir deðer vermemiz gerekiyor.
--Az önceki örneklerde parametre belirttiysek,parametreyi EXEC ederken 
--girmek zorundaydýk.
--Þimdi bunu opsiyonel yapabiliriz..Yani EXEC ederken paramtre verip vermemek tercihe baðlý olur.

ALTER PROC DenemeRenk 
(
@Color1 VARCHAR(30) ='Red',
@Color2 VARCHAR(30)

)
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR IN (@Color1,@Color2)

END ;

EXEC DenemeRenk @Color1=Black,@Color2=Silver 
EXEC DenemeRenk @Color2=Silver -- Default + Silver geldi

--NULL Paramaetre Yaratmak :
ALTER PROC DenemeRenk 
(
@Color1 VARCHAR(30) = NULL,
@Color2 VARCHAR(30) 

)
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR IN (@Color1,@Color2) OR COLOR IS NULL

END ;

EXEC DenemeRenk @Color2=Silver, @Color1=Red
EXEC DenemeRenk @Color2=Silver

-- ### STORED PROCEDURES PARAMETRELERÝ BÝTÝÞ ### :




--STORED PROCEDURES OUTPUT Parametreleri ve Return Values BAÞLANGIÇ :
--Demin yaptýklarýmýz INPUT parametrelerdi.

--INPUT Parametre Örneði :
ALTER PROC DenemeRenk 
(
@Color1 VARCHAR(30) ='Red',
@Color2 VARCHAR(30)

)
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR IN (@Color1,@Color2)

END ;

EXEC DenemeRenk @Color1=Black,@Color2=Silver 

--OUTPUT Parametre Nedir :

--Biz INPUT parametrelerde dýþardan veri atýyorduk.
--Þimdi ise bize içerden bir bilgi geliyor ve onu tutmamýz lazým.
--Output parametreleri belirtirkende OUT diye belirtmemiz gerekmektedir.

--OUTPUT PARAMETRELÝ SP OLUÞTURMA:
ALTER PROC DenemeRenk 
(
@Color1 VARCHAR(30),
@Color2 VARCHAR(30),
@SatýrAdedi INT OUTPUT

)
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR IN (@Color1,@Color2)

			SET @SatýrAdedi = @@ROWCOUNT

END ;

--OUTPUT PARAMETRELÝ SP ÇALIÞTIRMA:
DECLARE @Count INT
EXEC DenemeRenk @Color1=Black,@Color2=Blue,@SatýrAdedi=@Count output
SELECT @Count AS SATIRADEDI--@SatýrAdedi 'ÝNÝ SONUÇTA GÖSTERMEK ÝÇÝN



--ÖRNEK :
--Normal Tablomuz:
(select COUNT(BusinessEntityID) from HumanResources.Employee
WHERE Gender ='M')

--SP OLUÞTURALIM:
CREATE PROC ADETBYGENDER
( @Gender CHAR(1), @Adet INT OUTPUT)
AS
BEGIN
		SELECT @Adet = (select COUNT(BusinessEntityID) from HumanResources.Employee
						WHERE Gender =@Gender)

END;
--EXECUTE EDELÝM:
--
DECLARE @ToplamAdet INT
EXEC ADETBYGENDER @Gender = F,@Adet= @ToplamAdet OUTPUT
SELECT @ToplamAdet

SP_HELP ADETBYGENDER
SP_HELPTEXT ADETBYGENDER







--OUTPUT PARAMETRELER VE Return Values:
--Biz,output parametreleri kullandýk deðer döndürmek için.
--Ýstediðimiz kadar output paramatre yaratabiliriz.
--Ancak ayný sonuca ulaþmak için bir yol daha var.
--Return oluþtururken OUT keyword'ünü belirtmemize gerek yoktur.

--RETURN VALUE OLUÞTURMAK:
ALTER PROC DenemeRenk 
(
@Color1 VARCHAR(30),
@Color2 VARCHAR(30)

)
AS
BEGIN
			SELECT
			Color,
			COUNT(*),
			AVG(ListPrice)
			FROM Production.Product
			WHERE COLOR IS NOT NULL
			group by (Color)
			HAVING COLOR IN (@Color1,@Color2)

			RETURN @@ROWCOUNT

END ;

--RETURN VALUE'LI SP'YÝ ÇALIÞTIRMAK:
--Return value'yu tutmak için yarattýðýmýz deðiþkeni
--sp'nin sonucuna eþitlememiz gerekmektedir.

 DECLARE @COUNT INT
 EXEC @COUNT = DenemeRenk @Color1=Silver,@Color2=Silver 
 --Sonrada sonucu göstermemiz lazým.
 SELECT @COUNT



 --ÖRNEK :
 --OUTPUT VERSÝONU :
--Normal Tablomuz:
(select COUNT(BusinessEntityID) from HumanResources.Employee
WHERE Gender ='M')

--SP OLUÞTURALIM:
ALTER PROC ADETBYGENDER
( @Gender CHAR(1), @Adet INT OUTPUT)
AS
BEGIN
		SELECT @Adet = (select COUNT(BusinessEntityID) from HumanResources.Employee
						WHERE Gender = @Gender)

END;


--EXECUTE EDELÝM:
DECLARE @ToplamAdet INT
EXEC ADETBYGENDER @Gender = F,@Adet= @ToplamAdet OUTPUT
SELECT @ToplamAdet


--RETURN VERSÝYONU:

ALTER PROC ADETBYGENDER
( @Gender CHAR(1))
AS
BEGIN

 RETURN 
(select COUNT(BusinessEntityID) from HumanResources.Employee WHERE Gender =@Gender)

END;

--EXECUTE ETMEK ÝÇÝN:

DECLARE @ToplamAdet INT
exec @ToplamAdet= ADETBYGENDER F
SELECT @ToplamAdet



--STORED PROCEDURES OUTPUT Parametreleri ve Return Values BÝTÝÞ :