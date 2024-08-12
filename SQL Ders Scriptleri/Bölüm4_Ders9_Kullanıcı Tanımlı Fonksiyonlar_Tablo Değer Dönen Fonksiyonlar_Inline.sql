--- ### INLINE TABLE VALUED FONKSÝYONLAR ### ---

--Kullanýcý Tanýmlý Scaler fonksiyonlar bize tek bir deðer dönmekteydi.
--Peki Table Valued Fonk. Nedir?
--Tablo cinsinden deðer dönen fonskiyonlardýr.
--Normal tablo kullandýðýmýz gibi ,bu fonk'uda ayný amaçlý kullanabiliriz.
--Aþaðýdaki gibi basit bir sorgumuz olsun.

SELECT
BusinessEntityID,
FirstName
FROM Person.Person
where FirstName LIKE '%Ken%'

--Biz bir tablo deðer dönen fonk.yaratarak aynýsýn dönemsini saðlayabilriz.
--Parametre alan view lar ile benzerlik göstermektedirler.
--Tablo deðerli bu sorgularmýzý, normal bir tablo gibi kullanabiliriz.
--Üzerinde koþul,gruplama ve order by ifadelerini de kullanabiliriz.
--Fakat join iþmelerini yapamamaktayýz.Onun yerine CROSS APPLY ve Outer Apply uygulamamýz gerekmektedir.
--Burada CROSS APPLY'ýn Inner JOIN, Outer Apply'ýn ise Left JOIN yerine geçtiðini düþünebiliriz. 
--BEGIN ve END ifadeleri kullanmamaktayýz. 


--ÖRNEK:
--Normal Tablom:
SELECT
BusinessEntityID,
FirstName
FROM Person.Person
where FirstName LIKE '%Ken%'


--Inlýne Table Fonk.Yaratma:
create FUNCTION Ken
(
@FirstNameLýke varchar(max)
)
returns table
as
return
SELECT
BusinessEntityID,
FirstName
FROM Person.Person
where FirstName LIKE @FirstNameLýke

--Inlýne Table Fonk.sorguda Kullanma:

--Ayný Sonucu Dönerler

SELECT
BusinessEntityID,
FirstName
FROM DBO.Ken('%Ken%')
--


--Baþka Örnek:


--Normal Tablomuz:

--1.YOL

--2.YOL

SELECT
Gender,COUNT(BusinessEntityID)
FROM HumanResources.Employee
GROUP BY Gender
HAVING Gender ='M'

--Fonksiyon OLuþturalým :

CREATE FUNCTION DenemeCinsiyet
(
@Cinsiyet varchar(max)
)
returns table
as
return
SELECT
Gender,COUNT(BusinessEntityID) AS Adet
FROM HumanResources.Employee
GROUP BY Gender
HAVING Gender =@Cinsiyet

--Fonksiyondan Dönen Sonuç :
SELECT
*FROM DBO.DenemeCinsiyet('M')


--Inlýne Table Fonk.sorguda kullnma: Örnek
--NOIRMAL SORGUM:
SELECT
A.BirthDate AS BirthDate ,
B.FirstName AS FirstName ,
B.LastName AS LastName ,
A.Gender AS Gender
FROM 
HumanResources.Employee A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID
WHERE A.Gender ='M'

--INLINE FONK.YARATALIM:

CREATE FUNCTION JOINGENDER (@EmpGender CHAR(1))
RETURNS TABLE
AS
RETURN
SELECT
A.BirthDate AS BirthDate ,
B.FirstName AS FirstName ,
B.LastName AS LastName ,
A.Gender AS Gender
FROM 
HumanResources.Employee A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID
WHERE A.Gender =@EmpGender

SELECT * FROM [dbo].[JOINGENDER]('M')
SELECT * FROM [dbo].[JOINGENDER]('F')
-----

--MODFIYING INLINE TABLE FUNCTIONS :

--1.YOL :CREATE ifadesini alter yaparýz.

--2.YOL : Fonksiyonu bul ve modify de.

--ÖRNEK :

CREATE FUNCTION JOINGENDER1 (@Tarihbir INT,@Tarihiki INT)
RETURNS TABLE
AS
RETURN

SELECT
A.BirthDate AS BirthDate ,
B.FirstName AS FirstName ,
B.LastName AS LastName ,
A.Gender AS Gender
FROM 
HumanResources.Employee A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID
WHERE YEAR(A.BirthDate) BETWEEN (@Tarihbir) AND (@Tarihiki)

SELECT * FROM JOINGENDER1 (1975,1976)

SELECT BirthDate,LastName FROM JOINGENDER1 (1975,1980)
-------------------------------------

