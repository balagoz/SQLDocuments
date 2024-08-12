--- ### INLINE TABLE VALUED FONKS�YONLAR ### ---

--Kullan�c� Tan�ml� Scaler fonksiyonlar bize tek bir de�er d�nmekteydi.
--Peki Table Valued Fonk. Nedir?
--Tablo cinsinden de�er d�nen fonskiyonlard�r.
--Normal tablo kulland���m�z gibi ,bu fonk'uda ayn� ama�l� kullanabiliriz.
--A�a��daki gibi basit bir sorgumuz olsun.

SELECT
BusinessEntityID,
FirstName
FROM Person.Person
where FirstName LIKE '%Ken%'

--Biz bir tablo de�er d�nen fonk.yaratarak ayn�s�n d�nemsini sa�layabilriz.
--Parametre alan view lar ile benzerlik g�stermektedirler.
--Tablo de�erli bu sorgularm�z�, normal bir tablo gibi kullanabiliriz.
--�zerinde ko�ul,gruplama ve order by ifadelerini de kullanabiliriz.
--Fakat join i�melerini yapamamaktay�z.Onun yerine CROSS APPLY ve Outer Apply uygulamam�z gerekmektedir.
--Burada CROSS APPLY'�n Inner JOIN, Outer Apply'�n ise Left JOIN yerine ge�ti�ini d���nebiliriz. 
--BEGIN ve END ifadeleri kullanmamaktay�z. 


--�RNEK:
--Normal Tablom:
SELECT
BusinessEntityID,
FirstName
FROM Person.Person
where FirstName LIKE '%Ken%'


--Inl�ne Table Fonk.Yaratma:
create FUNCTION Ken
(
@FirstNameL�ke varchar(max)
)
returns table
as
return
SELECT
BusinessEntityID,
FirstName
FROM Person.Person
where FirstName LIKE @FirstNameL�ke

--Inl�ne Table Fonk.sorguda Kullanma:

--Ayn� Sonucu D�nerler

SELECT
BusinessEntityID,
FirstName
FROM DBO.Ken('%Ken%')
--


--Ba�ka �rnek:


--Normal Tablomuz:

--1.YOL

--2.YOL

SELECT
Gender,COUNT(BusinessEntityID)
FROM HumanResources.Employee
GROUP BY Gender
HAVING Gender ='M'

--Fonksiyon OLu�tural�m :

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

--Fonksiyondan D�nen Sonu� :
SELECT
*FROM DBO.DenemeCinsiyet('M')


--Inl�ne Table Fonk.sorguda kullnma: �rnek
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

--1.YOL :CREATE ifadesini alter yapar�z.

--2.YOL : Fonksiyonu bul ve modify de.

--�RNEK :

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

