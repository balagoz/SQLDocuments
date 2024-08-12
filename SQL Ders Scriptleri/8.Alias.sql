-- AL�AS--

/*
Tablo veya kolona ge�ici bir isim vermektir.

Kolon adlar�n�n daha anla��l�r ve kolay okunabilmesi i�indir.
Yarat�lan sorgunun �mr� kadar �m�rleri vard�r.
"AS" keywordu kullan�labilinir yarat�l�rken,e�er takma isimde bo�luk varsa [] veya " " ,' ',i�erisnde kullan�lmas� gereklidir.
Joinlerde kolay okunabilirlik a��s�ndan olduk�a �nemlidir.

UYARI !!!

Alias Kullan�m�nda en �ok dikkat edilmesi gereken, Order By ifadesinde referans verebilriz.
�rne�in WHERE ifadesi i�inde referans etti�imizde ilgili ALIAS'� tan�mayacakt�r.
Bunun nedeni SQL'in sorguyu i�leme s�ras� farkl�l�klar�d�r.

*/

--�RNEKLER:

--�RNEK1:
SELECT
ProductID AS UrunID,
LocationID AS Lokasyon
FROM Production.ProductInventory




--�RNEK2:
SELECT
ProductSubcategoryID AS AltUrun,
Name AS [�sim],
Name [�sim],
Name [Alt kategori �smi],
Name AS [Alt kategori �smi],
Name AS 'Alt kategori �smi',
Name AS "Alt kategori �smi",
Name "Alt kategori �smi",
Name Alt_kategori_�smi
FROM Production.ProductSubcategory



--�RNEK3:
--Middlename'de null de�er oldu�u i�in Birle�tirme i�lemini ger�ekle�tiremiyor.
--O y�zden ISNULL ifadesiniz kullanmam�z laz�m.
SELECT
FirstName,
MiddleName,
LastName,
FirstName + ' ' + MiddleName + ' ' + LastName AS [Birle�tirme]
FROM Person.Person


Select
FirstName,
MiddleName,
LastName,
FirstName + ' ' + ISNULL(MiddleName,'') + ' ' + LastName AS Birle�tirme
from Person.Person 





--�RNEK 7 :Tablo Alias :

SELECT * FROM Production.Product AS �r�n
--VEYA
SELECT * FROM Production.Product �r�n
--VEYA
SELECT A.BusinessEntityID FROM Person.Person A






--�RNEK4:JOINLEME KULLANIMI :


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




--�RNEK5:ORDER BY :

--�rne�in a�a��da hata al�r�z.��nk� SQL, WHERE ifadesini �nce execute ediyor veya ba�ka bir deyi�le Select ifadesini daha 
--sonra execute ediyor. Dolay�s�yla, Select'te verilen takma ismi tan�m�yor. Ama Order by en sonlarda execut etti�i i�in,
--Select ifadesinde verilen takma ad� tan�yor.
SELECT FirstName as �sim FROM Person.Person
WHERE �sim LIKE '%yed%'

select FirstName AS �sim from Person.Person
ORDER BY �sim







--�RNEK6:

-- �RNEK : MATEMAT�KSEL ��LEM :
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





--�RNEK 7: Alias Referans S�ras� :

--A�a��daki hata verir.��nk� from>where>select �eklinde i�ler sistem. Yani ilk ba�ta where ifadesi i�leme al�n�r.
--Bu y�zden database'in alias'tan haberi olmaz.
--Ama order by da kullanabiliriz. ��nk� from>Select>Order By. O y�zden database'in select ifadesindeki alias'tan haberi vard�r.
--
--
SELECT
Name,
ListPrice,
ListPrice *1.1 as YeniListPrice
FROM Production.Product
where YeniListPrice <>0




