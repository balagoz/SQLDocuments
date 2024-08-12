--- ### PIVOT BA�LANGI� ### ---

--Tabloyu d�nd�rmek.Sat�rlar� kolonlara veya s�tunlara d�n��t�rmek i�in kullan�l�r.



--A�a��daki gibi bir tablomuz olsun :
SELECT * FROM Ornek.dbo.SATISSS


--Normal GROUP BY ifadesi Uygulayal�m :


SELECT Sat�sYap�lanUlke,Sat�sc�,SUM(Sat�sTutar�) FROM Ornek.dbo.SATISSS
GROUP BY Sat�sYap�lanUlke,Sat�sc�



---PIVOT---
--1.YAZIM : Ancak 2.yaz�m daha �ok tercih edilir.
SELECT Sat�sc�,EN,FR,TR FROM SATISSS
PIVOT
(

SUM(Sat�sTutar�)
FOR Sat�sYap�lanUlke IN ([EN],[FR],[TR])

)AS PIVOTTABLO



--2.YAZIM :

--PIVOT �RNE�� :
--Derived tablo olu�turaca��z ve Select ifadesinde g�rmek istedi�imiz kolon adlar�n�
--ve Agg.i�lem yapaca��m�z s�tunu belirtece�iz.Agg.��lem PVOT ifadesinden sonraki tabloda yap�lmaktad�r.


----1.KISIM
SELECT * FROM
(
SELECT Sat�sc�,Sat�sYap�lanUlke,Sat�sTutar� from Ornek.dbo.SATISSS
)AS KaynakTablo
--1.KISIM B�T��

PIVOT

--2.KISIM
(
SUM(Sat�sTutar�)
FOR Sat�sYap�lanUlke IN([EN],[FR],[FR])

) AS PIVOTTABLO

--2.KISIM B�T��





--P�VOT �LE BANKA �RNE��----


SELECT * FROM
(

SELECT MusteriID,Urun,Tutar FROM Ornek.dbo.Banka

)AS SOURCE

PIVOT
(
SUM(Tutar) FOR Urun IN([Mevduat],[Kredi],[KMH])


)AS PIVOTTABLO

---------------------------------




---PIVOT BA�KA �RNEK ----


--A�a��daki gibi bir tablomuz olsun :
select * from Ornek.dbo.CATEG


--P�vot i�in Yap�lacaklar :
--1.ad�m : Select ifadesini olu�tur.
--2.ad�m :Derived Table kullan
--3.Ad�m :Pivotu uygula.

--Select ifadesini agg.fonk.uygulam�ycaz.
--Onu pivot'ta uyguluycaz.


SELECT * FROM 
(
SELECT KategoriAd�,UrunAdedi FROM Ornek.dbo.CATEG
)A

PIVOT

(

SUM(UrunAdedi) FOR KategoriAd� IN ([Ayakkab�],[Gomlek],[Canta],[Cuzdan])

)B;












--DATABASE �RNE��--
--Burada hem join yapaca��z hem de ddaha sonra pivot yapaca��z.
--1.ADIM : TABLOLARIMIZI TANIYORUZ :


SELECT * FROM Person.Address

SELECT * FROM Person.StateProvince 


SELECT StateProvinceID,AddressID FROM Person.Address A

SELECT StateProvinceID,StateProvinceCode,Name FROM Person.StateProvince B


--2.ADIM : JOIN YAPALIM :
--YIL BAZINDA EYALETLERDEK� HANE SAYISINA ULA�MAYA �ALI�IYORUZ.
--JOIN YAPMAMIZIN NEDEN� �SE EYALET ADININ BA�KA TABLOD OLMASI :
--JOIN 1.HAL�:
SELECT A.StateProvinceID,B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID

--JOIN 2.HAL�:
--YIL Bilgisinide alal�m Person.Address'tablosundan ve agg.uygulayal�m group by ile beraber.


SELECT B.Name,YEAR(A.ModifiedDate),COUNT(A.AddressID) FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY B.Name,YEAR(A.ModifiedDate)

--JOIN 3.HAL�:Eyalaet isimleri �ok uzun oldu�u i�in sadece A ile ba�layanlar�  al�yoruz.

SELECT B.Name,YEAR(A.ModifiedDate),COUNT(A.AddressID) FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY B.Name,YEAR(A.ModifiedDate)
HAVING B.Name LIKE 'A%'


--3.ADIM :Derived Tablo i�ine al�yorum

SELECT * FROM 
(
SELECT 
B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
WHERE B.Name LIKE 'A%'
)AS KAYNAK

PIVOT
(

COUNT(AddressID) FOR Name IN ([Alabama],[Alberta],[Arizona])

)AS PIVOTTABLO



-----------------------





--P�vot'a y�l bilgisi eklersek :

SELECT * FROM 
(
SELECT 
YEAR(A.ModifiedDate) as Y�l,
B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
WHERE B.Name LIKE 'A%'
)AS K

PIVOT
(

COUNT(AddressID) FOR Name IN ([Alabama],[Alberta],[Arizona])

)AS PIVOTTABLO




--ORDER BY ifadesinide a�a��daki gibi kullanabiliriz:

SELECT * FROM 
(
SELECT 
YEAR(A.ModifiedDate) as Y�l,
B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
WHERE B.Name LIKE 'A%'
)AS K

PIVOT
(

COUNT(AddressID) FOR Name IN ([Alabama],[Alberta],[Arizona])

)AS PIVOTTABLO

ORDER BY Y�l ASC




--- ### PIVOT B�T�� ### ---







--- ### UNPIVOT BA�LANGI� ### ---

--Unpivot yapabilemizin �art� �u :
--E�er Pivot i�leminde herhangibir aggretaed i�lem yoksa yapabiliriz.
--Yani pivot yapmadan �nceki orjinal tablomda ne varsa,pivot yapt�ktan sonra da bir agg. i�lem g�rmemi�se yapabiliriz.

--TABLOMUZUN OR�J�NAL HAL� :
SELECT * FROM Ornek.dbo.SATIS1;

--P�VOT YAPALIM

SELECT * FROM
(
SELECT Temsilci,Ulke,Tutar from Ornek.dbo.SATIS1
) as kaynak

PIVOT
(
SUM(Tutar) FOR Ulke IN ([Turkiye],[Ingiltere])
)AS PIVOTTABLO

-----





--UNPIVOT YAPALIM


--Bu �rnekte unpivot yapabiliyorum ��nk� aggr.yok.
--Pivot tablosunun tamam�na bir alias veriyorum

SELECT Temsilci,Ulke,Tutar FROM

(
SELECT * FROM
(
SELECT Temsilci,Ulke,Tutar from Ornek.dbo.SATIS1
) as kaynak

PIVOT
(
SUM(Tutar) FOR Ulke IN ([Turkiye],[Ingiltere])
)AS PIVOTTABLO
)p

UNPIVOT
(
Tutar FOR Ulke IN([Turkiye],[Ingiltere])
) AS UNPIVOTTABLE;

------------------------------


--Ama a�a��daki tabloda yapamay�z,��nk� data PIVOT yap�l�nca agg.i�lemine maruz kal�cak.


SELECT * FROM Ornek.dbo.SATISSS
--- ### UNPIVOT B�T�� ### ---


