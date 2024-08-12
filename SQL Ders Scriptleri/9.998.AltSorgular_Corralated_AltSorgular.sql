--- ### ALT SORGULAR BA�LANGI� ### 


--�� i�e ge�mi� sorgulard�r.
--Genellikle Select,From ve Where ifadeleri i�inde kullan�l�r.
--Alt sorgular,tek bir de�er (Veya bazen Daha fazla) d�nen tek bir select statement't�r.
--Select,update,insert,delete'in i�erisinmde i� i�e kullanabiliriz.
--Alt sorgular�n i�inde alt sorgular da yazmam�z m�mk�nd�r.
--Toplamda 32 level'a kadar alt sorgu yaz�labilinir.
--Inner sorgular olarak da bilinir.
--Daima parantez i�erisinde yer al�rlar.
--�� sorguda parantez ile yaz�lan sorgudaki ,from'dan sonraki tablodaki s�tunlar� d�� sorguda kullanamay�z.



--�RNEK :
--Liste fiyat� en y�ksek olan �r�nle ilgili bilgileri getirdik :

SELECT * FROM Production.Product
WHERE ListPrice =
(SELECT MAX(ListPrice) FROM Production.Product)





--�rnek :
--Liste fiyat� ort.fiyat�n �zerinde olan �r�nlerle ilgili bilgileri getirdik:


SELECT * FROM Production.Product
WHERE ListPrice >
(SELECT AVG(ListPrice) FROM Production.Product) -- 438.6662





--Hi� satmad���m�z �r�nlerin ID ve A��klamas�n� getirin:

--2 TANE TABLOMUZ OLSUN :


SELECT * FROM Ornek.dbo.Urunler

SELECT * FROM Ornek.dbo.UrunlerSat�s


--Left jo�n ile de ayn� sonuca ula�abilridik:

SELECT * FROM
Ornek.dbo.Urunler A
LEFT JOIN
Ornek.dbo.UrunlerSat�s B
ON A.ID =B.UrunID
WHERE B.UrunID IS NULL



--Hi� satmad���m�z �r�nlerin ID ve A��klamas�n� getirin:
-- ALT SORGUYLA ��Z�M :

select ID,UrunAd�,Ac�klama FROM Ornek.dbo.Urunler
WHERE ID NOT IN (SELECT UrunID FROM Ornek.dbo.UrunlerSat�s)



--�rnek :
---Urun ADI ve toplam adedini getirin 


SELECT * FROM Ornek.dbo.Urunler -- �r�n Ad� bu tabloda var.

SELECT * FROM Ornek.dbo.UrunlerSat�s 


--LEFT JOIN �LE YAZALIM


SELECT 
A.UrunAd�,
SUM(B.Sat�lanAdet)
FROM Ornek.dbo.Urunler A
LEFT JOIN
Ornek.dbo.UrunlerSat�s B
ON A.ID = B.UrunID
GROUP BY A.UrunAd�;


-- ALT SORGUYLA YAZIM :
--��te �imdi yazd���m�z alt sorgu kendi kendine �al��amayan bir alt sorgu.Yani corralated alt sorgu.
--�al��mas� i�in d��ar�daki sorguya ihtiyac� var.
--D�� sorgudan gelen her bir de�er i�in �al���r.


SELECT * FROM Ornek.dbo.Urunler -- �r�n Ad� bu tabloda var.

SELECT * FROM Ornek.dbo.UrunlerSat�s 


SELECT
ID,
UrunAd�,
(SELECT SUM(Sat�lanAdet) from Ornek.dbo.UrunlerSat�s WHERE UrunID = Ornek.dbo.Urunler.ID ) AS ADET
from
Ornek.dbo.Urunler








--Alt Sorgular Di�er �rnekler :

--�rnek 1:
--Max listprice dedi�imde ad�n� veya di�er bilgileri g�remiyorum.
--Ama alt sorgu �eklinde kullan�rsak MAX(listPrice)'e sahip �r�n�n bilgilerini g�rebiliriz. 

SELECT * FROM Production.Product
WHERE listPrice =(SELECT MAX(listPrice) FROM Production.Product)



--�rnek 2:
SELECT * FROM Production.Product
WHERE listPrice > (SELECT AVG(listPrice) FROM Production.Product)


--�rnek 3: select'i�inde Subquery Kullanmak:


SELECT
ProductID,
ListPrice,
(Select AVG(ListPrice) FROM Production.Product) as "AVG F�YAT"
FROM Production.Product







--�RNEK 5:--Birden fazla de�er d�nen subquery'ler.
--Bu tip durumlarda IN kullan�r�z.

SELECT LocationID FROM Production.ProductInventory
WHERE ProductID IN

(SELECT ProductID FROM Production.ProductInventory
where Quantity > 400 )



--�RNEK 5:--Birden fazla de�er d�nen subquery'ler.
--Bu tip durumlarda IN kullan�r�z.
SELECT * FROM Person.Address
WHERE StateProvinceID 
IN
(
SELECT StateProvinceID FROM Person.StateProvince
WHERE TerritoryID BETWEEN 1 AND 3
)



--�� ��E 2 �� SORGU YAZALIM--
  
SELECT DISTINCT(YEAR(BirthDate)) FROM HumanResources.Employee
WHERE BirthDate IN
(SELECT BirthDate FROM HumanResources.Employee
WHERE BusinessEntityID IN
	(SELECT BusinessEntityID FROM HumanResources.Employee
	WHERE YEAR(HireDate) BETWEEN 2007 AND 2009))





-- FROM Clause i�inde Kullan�lan :
SELECT AVG(PersonelAdet)FROM

(
SELECT Gender,Count(BusinessEntityID) AS PersonelAdet FROM HumanResources.Employee
GROUP BY Gender
)A



--- ### ALT SORGULAR B�T�� ### 









--- ### CORRALATED ALT SORGULAR BA�LANGI� ###

--Subquery kendi kendine �al��an bir subquery de�ilse,bir ba�ka deyi�le
--�al��mas� i�in d��ardaki sorguya ihtiyac� varsa buna denir.
--D�� sorgudan gelen her bir de�er i�in �al���r.




---Mesela a�a��daki altsorgu kendi kendine �al��abiliyor.--


SELECT * FROM HumanResources.Employee
WHERE BusinessEntityID IN
(SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle LIKE ('Research%'))




--A��a��daki alt sorgu kendi kendine �al��am�yor.
--�al��mas� i�in outer query'e ihtiyac� var,veriye oradan al�yor ��nk�---


SELECT * FROM Ornek.dbo.Urunler -- �r�n Ad� bu tabloda var.

SELECT * FROM Ornek.dbo.UrunlerSat�s 

SELECT
UrunAd�,
(SELECT SUM(Sat�lanAdet) from Ornek.dbo.UrunlerSat�s  WHERE UrunID = Urunler.ID )
from
Ornek.dbo.Urunler



--Di�er �rnek :

SELECT * FROM Person.Address;

Select * from Person.StateProvince;



SELECT City FROM Person.Address
WHERE StateProvinceID IN

(
Select StateProvinceID from Person.StateProvince Where StateProvinceID =Person.Address.StateProvinceID
AND Person.Address.StateProvinceID BETWEEN 1 AND 5
)


--- ### CORRALATED ALT SORGULAR B�T�� ### 








--- ### DER�VED TABLE ### ----
--Asl�nda tabloya alias vermedir.
--T�retilmi� tablolar�dr.
--�rnek:

--�rnek iki tablomuz olsun:

select * from [Person].[BusinessEntityAddress]
SELECT * FROM Person.AddressType

--JOINLIYORUZ:

SELECT
ISNULL(B.Name,'Toplam') AS AdresTipi,
COUNT(A.BusinessEntityID) AS M��teriAdedi
FROM
[Person].[BusinessEntityAddress] A
LEFT JOIN
Person.AddressType B
ON A.AddressTypeID = B.AddressTypeID
GROUP BY ROLLUP (B.Name)




--derived table yarat�yoruz:
--T�remi� tablo ( derived tablo )'da sadece tablomuza isim veriyoruz ve yukar�ya bir select ifadesi koyuyoruz.


SELECT * FROM 

(
SELECT
ISNULL(B.Name,'Toplam') AS AdresTipi,
COUNT(A.BusinessEntityID) AS M��teriAdedi
FROM
[Person].[BusinessEntityAddress] A
LEFT JOIN
Person.AddressType B
ON A.AddressTypeID = B.AddressTypeID
GROUP BY ROLLUP (B.Name)

)M
WHERE M��teriAdedi<800




