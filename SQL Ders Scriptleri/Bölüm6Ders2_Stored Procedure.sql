--- ### STORED PROCEDURE ### ---

--Daha �nceden haz�rlad���m�z ve tekrar tekrar kullanabilici�imiz haz�r SQL kodlar�d�r.
--E�er tekrar tekrar yazd���mz� bir SQL sorgumuz varsa onu stored proc olarak saveleyip,�a��r�p tekrar kullanabiliriz.
--Ayn� zamanda parametrede g�nderip �al��t�rabiliriz.
--Bize h�z ve verimililik sa�lar.
--SP'yi �al��t�r�rken girdi�imiz parametrelerin s�ras� �nemli.�al��t�r�rken s�ralamaya dikkat etmeli.
--D��ar�dan parametre alabilen tekli yada �oklude�er d�nebilen ,i�inde SQL sorgular�m�z� yazabildi�imiz programlama birimleridir.
--VER� TABANI SERVER'INDA SAKLANDI�I ���N �OK DAHA h�zl� �al���rlar.
--H�z,g�venlik,performans,i�lem y�k�n� d��mesini...sa�lar.
--Haz�r sistem sp'leri vard�r.
--Bunlar bize sqlserverdaki objelerler ilgili bilgi verirler.
--SP_HELP ADETBYGENDER(SP �LE �LG�L� B�LG� VER�R.)
--SP_HELPTEXT ADETBYGENDER(SP N�N TEXT�N� VER�R.)
--SP_HELPCONSTRAINT 'tblPersonel' ---constraintlerle ilgili bikgi verir.

--STORED PROCEDURES BAS�C :
--STORED PROCEDURES PARAMETRELER :
--STORED PROCEDURES OUTPUT Parametreleri ve Return Values :



-- ### STORED PROCEDURES BAS�C BA�LANGI� ### :

--A�a��daki gibi bir sorgumuz olsun:

SELECT
Color,
COUNT(*),
AVG(ListPrice)
FROM Production.Product
WHERE COLOR IS NOT NULL
group by ROLLUP (Color)


--Bunu tekrar tekrar kullan�yoruz.

--Stored Proc Yaratma :

CREATE PROC spColorProduct--Stored Proc.Ad�
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

--�RNEK2 :
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
--2 yolu vard�r.
--1.YOL : SP ismini mouse ile higlight edip execute etmek.
--2.YOL : EXEC veya EXECUTE sp_ad�

EXEC spColorProduct


--Stored Proc Modify Etme :
--Her�ey ayn� kal�r.Sadece Create yerine Alter diyecce�iz.
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

--E�er sp olu�turdu�um kodu bulam�yorsam,obj exp'dan Programm -- Stored Proc --Sa�t�k Modify


--Stored Proc Silme:
--2 yolu var.
--1.yol :Obj.Exp'dan sp'yi bulup,sa� t�k ve delete.
--2.YOL : DROP PROC spad�

DROP PROC spColorProduct



-- ### STORED PROCEDURES BAS�C B�T�� ### :





-- ### STORED PROCEDURES PARAMETRELER� BA�LANGI� ### :

--Parametre Nedir?
--Basit ifadeyle d��ar�dan atayabildi�imiz de�erler gibi d���nebiliriz.

--�RNEK : EXECUTE spColorProduct Black

EXECUTE spColorProduct 'Black'


--TEK PARAMETREL� �RNEK :	
--Normal Sorgumuz a�a��da:
SELECT
Color,
COUNT(*),
AVG(ListPrice)
FROM Production.Product
WHERE COLOR IS NOT NULL
group by (Color)
HAVING COLOR ='Black'


--ProC Yaratal�m:

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

--ProC �al��t�ral�m:
EXEC DenemeRenk Black

--B�RDEN FAZLA PARAMETREL� �RNEK :
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


--Parametreleri a�a��daki �ekildeki gibi de kullanabiliriz:
EXEC DenemeRenk @Color1 ='Black',@Color2 ='Red'


--�RNEK : 2 PARAMETREL�.
--Normal Tablom:
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE GENDER = 'M' AND JobTitle LIKE '%Manager%'

--PROC OLU�TURALIM:
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

--Text �eklinmde Paramaetre Yaratmak :

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

EXEC DenemeRenk S�L


--Opsiyonel Paramaetre Yaratmak :
--Burada parametremize default bir de�er vermemiz gerekiyor.
--Az �nceki �rneklerde parametre belirttiysek,parametreyi EXEC ederken 
--girmek zorundayd�k.
--�imdi bunu opsiyonel yapabiliriz..Yani EXEC ederken paramtre verip vermemek tercihe ba�l� olur.

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

-- ### STORED PROCEDURES PARAMETRELER� B�T�� ### :




--STORED PROCEDURES OUTPUT Parametreleri ve Return Values BA�LANGI� :
--Demin yapt�klar�m�z INPUT parametrelerdi.

--INPUT Parametre �rne�i :
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

--Biz INPUT parametrelerde d��ardan veri at�yorduk.
--�imdi ise bize i�erden bir bilgi geliyor ve onu tutmam�z laz�m.
--Output parametreleri belirtirkende OUT diye belirtmemiz gerekmektedir.

--OUTPUT PARAMETREL� SP OLU�TURMA:
ALTER PROC DenemeRenk 
(
@Color1 VARCHAR(30),
@Color2 VARCHAR(30),
@Sat�rAdedi INT OUTPUT

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

			SET @Sat�rAdedi = @@ROWCOUNT

END ;

--OUTPUT PARAMETREL� SP �ALI�TIRMA:
DECLARE @Count INT
EXEC DenemeRenk @Color1=Black,@Color2=Blue,@Sat�rAdedi=@Count output
SELECT @Count AS SATIRADEDI--@Sat�rAdedi '�N� SONU�TA G�STERMEK ���N



--�RNEK :
--Normal Tablomuz:
(select COUNT(BusinessEntityID) from HumanResources.Employee
WHERE Gender ='M')

--SP OLU�TURALIM:
CREATE PROC ADETBYGENDER
( @Gender CHAR(1), @Adet INT OUTPUT)
AS
BEGIN
		SELECT @Adet = (select COUNT(BusinessEntityID) from HumanResources.Employee
						WHERE Gender =@Gender)

END;
--EXECUTE EDEL�M:
--
DECLARE @ToplamAdet INT
EXEC ADETBYGENDER @Gender = F,@Adet= @ToplamAdet OUTPUT
SELECT @ToplamAdet

SP_HELP ADETBYGENDER
SP_HELPTEXT ADETBYGENDER







--OUTPUT PARAMETRELER VE Return Values:
--Biz,output parametreleri kulland�k de�er d�nd�rmek i�in.
--�stedi�imiz kadar output paramatre yaratabiliriz.
--Ancak ayn� sonuca ula�mak i�in bir yol daha var.
--Return olu�tururken OUT keyword'�n� belirtmemize gerek yoktur.

--RETURN VALUE OLU�TURMAK:
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

--RETURN VALUE'LI SP'Y� �ALI�TIRMAK:
--Return value'yu tutmak i�in yaratt���m�z de�i�keni
--sp'nin sonucuna e�itlememiz gerekmektedir.

 DECLARE @COUNT INT
 EXEC @COUNT = DenemeRenk @Color1=Silver,@Color2=Silver 
 --Sonrada sonucu g�stermemiz laz�m.
 SELECT @COUNT



 --�RNEK :
 --OUTPUT VERS�ONU :
--Normal Tablomuz:
(select COUNT(BusinessEntityID) from HumanResources.Employee
WHERE Gender ='M')

--SP OLU�TURALIM:
ALTER PROC ADETBYGENDER
( @Gender CHAR(1), @Adet INT OUTPUT)
AS
BEGIN
		SELECT @Adet = (select COUNT(BusinessEntityID) from HumanResources.Employee
						WHERE Gender = @Gender)

END;


--EXECUTE EDEL�M:
DECLARE @ToplamAdet INT
EXEC ADETBYGENDER @Gender = F,@Adet= @ToplamAdet OUTPUT
SELECT @ToplamAdet


--RETURN VERS�YONU:

ALTER PROC ADETBYGENDER
( @Gender CHAR(1))
AS
BEGIN

 RETURN 
(select COUNT(BusinessEntityID) from HumanResources.Employee WHERE Gender =@Gender)

END;

--EXECUTE ETMEK ���N:

DECLARE @ToplamAdet INT
exec @ToplamAdet= ADETBYGENDER F
SELECT @ToplamAdet



--STORED PROCEDURES OUTPUT Parametreleri ve Return Values B�T�� :