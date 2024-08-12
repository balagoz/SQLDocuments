-- ALÝAS--

/*
Tablo veya kolona geçici bir isim vermektir.

Kolon adlarýnýn daha anlaþýlýr ve kolay okunabilmesi içindir.
Yaratýlan sorgunun ömrü kadar ömürleri vardýr.
"AS" keywordu kullanýlabilinir yaratýlýrken,eðer takma isimde boþluk varsa [] veya " " ,' ',içerisnde kullanýlmasý gereklidir.
Joinlerde kolay okunabilirlik açýsýndan oldukça önemlidir.

UYARI !!!

Alias Kullanýmýnda en çok dikkat edilmesi gereken, Order By ifadesinde referans verebilriz.
Örneðin WHERE ifadesi içinde referans ettiðimizde ilgili ALIAS'ý tanýmayacaktýr.
Bunun nedeni SQL'in sorguyu iþleme sýrasý farklýlýklarýdýr.

*/

--ÖRNEKLER:

--ÖRNEK1:
SELECT
ProductID AS UrunID,
LocationID AS Lokasyon
FROM Production.ProductInventory




--ÖRNEK2:
SELECT
ProductSubcategoryID AS AltUrun,
Name AS [Ýsim],
Name [Ýsim],
Name [Alt kategori Ýsmi],
Name AS [Alt kategori Ýsmi],
Name AS 'Alt kategori Ýsmi',
Name AS "Alt kategori Ýsmi",
Name "Alt kategori Ýsmi",
Name Alt_kategori_Ýsmi
FROM Production.ProductSubcategory



--ÖRNEK3:
--Middlename'de null deðer olduðu için Birleþtirme iþlemini gerçekleþtiremiyor.
--O yüzden ISNULL ifadesiniz kullanmamýz lazým.
SELECT
FirstName,
MiddleName,
LastName,
FirstName + ' ' + MiddleName + ' ' + LastName AS [Birleþtirme]
FROM Person.Person


Select
FirstName,
MiddleName,
LastName,
FirstName + ' ' + ISNULL(MiddleName,'') + ' ' + LastName AS Birleþtirme
from Person.Person 





--ÖRNEK 7 :Tablo Alias :

SELECT * FROM Production.Product AS Ürün
--VEYA
SELECT * FROM Production.Product Ürün
--VEYA
SELECT A.BusinessEntityID FROM Person.Person A






--ÖRNEK4:JOINLEME KULLANIMI :


Select * from Sales.Customer -- PERSONID
SELECT * FROM Person.Person -- BusinessEntityID


SELECT
A.PersonID,
B.FirstName
FROM
Sales.Customer A
LEFT JOIN
Person.Person B
ON A.PersonID =B.BusinessEntityID

--VEYA



SELECT
Sales.Customer.PersonID,
Person.Person.FirstName
FROM
Sales.Customer
LEFT JOIN
Person.Person
ON Sales.Customer.PersonID = Person.Person.BusinessEntityID




--ÖRNEK5:ORDER BY :

--Örneðin aþaðýda hata alýrýz.Çünkü SQL, WHERE ifadesini önce execute ediyor veya baþka bir deyiþle Select ifadesini daha 
--sonra execute ediyor. Dolayýsýyla, Select'te verilen takma ismi tanýmýyor. Ama Order by en sonlarda execut ettiði için,
--Select ifadesinde verilen takma adý tanýyor.
SELECT FirstName as Ýsim FROM Person.Person
WHERE Ýsim LIKE '%yed%'

select FirstName AS Ýsim from Person.Person
ORDER BY Ýsim







--ÖRNEK6:

-- ÖRNEK : MATEMATÝKSEL ÝÞLEM :
SELECT
Name,
ListPrice,
ListPrice *1.1 as [Yeni List Price]
FROM Production.Product
where ListPrice <>0

--VEYA

SELECT
Name,
ListPrice,
ListPrice * (1 + 0.10) "Yeni ListPrice"
FROM Production.Product
WHERE ListPrice !=0





--ÖRNEK 7: Alias Referans Sýrasý :

--Aþaðýdaki hata verir.ÇünkÜ from>where>select þeklinde iþler sistem. Yani ilk baþta where ifadesi iþleme alýnýr.
--Bu yüzden database'in alias'tan haberi olmaz.
--Ama order by da kullanabiliriz. Çünkü from>Select>Order By. O yüzden database'in select ifadesindeki alias'tan haberi vardýr.
--
--
SELECT
Name,
ListPrice,
ListPrice *1.1 as YeniListPrice
FROM Production.Product
where YeniListPrice <>0




