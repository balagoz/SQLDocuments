--- ### VIEW BA�LANGI� ### ---
--SQL ifadelerinin sonu�lar�n� saklayan sanal tablolar�dr.
--View'in tablolar gibi sat�r ve s�tnlar� vard�r.
--Birden fazla tablodan sonu� ta��yabilirler.
--View'lara isted�imiz kadar sql sorgular� ve hatta fonk.ekelyebiliriz ve �a��rd���m�z zaman sanki tek bir tablodan 
--veri geliyormu� gibi olur.
--CREATE view ifadesi ile yarat�l�r.
--Viewlar� database in alt�nda view sekmesinde g�rebiliriz.
--v�EWLAR ASLINDA DATA TUTMAZ.Sadece kaydedilmi� sql sorgukar�d�r.Sanal tablolard�r.
--sp_helptext view ad� yazarak view'�n textini g�rebiliriz.


--V�EW avantajlar� :
--Karma��kl��� azalt�r.
--�rne�in joinlemeyi bilmeyen birisi haz�r joinlenmi� tabloya kavu�ur.
--Sat�r ve s�tun baz�nda g�venlik sa�lar.
--Mesela IT m�d�r� sadece IT �al��anlar�n maa�lr�n� g�rs�n.Sadece o yetkiyi verebiliriz.�rmne�in Where DeptName = '�t'
--Veya maa� kolonunu ��kartabiliriz.
--Di�er bir �zellik ise,�rne�in detay bilgileri de�ilde sadece gruplanm�� bilgileri g�sterebiliriz.

--Update etmek i�in  CREATE OR REPLACE VIEW ya da ALTER VIEW kullanabiliriz.
--DROP etmek i�in de DROP VIEW viewname
--View'�n ad�n� de�i�tirmek i�in obj.exp'dan view� bul sa� t�k rename veya sp_rename stored proc'unda yararlanabiliriz.
--�RNEK : EXEC sp_rename SON,YENISON
--Viewlar� listelemek i�in : sys.views ya da sys.objects
--sp_helptext ile view'in text bilgiseine eri�ebiliriz.

--V�EW NED�R?
--View'lar asl�nda kayedilmi� SQL sorgular�d�r.Ayn� zamanda sanal tablo olarak da kabul edilirler.

--�RNEK : 2 tane tablo joinleyelim.
select A.BusinessEntityID,B.FirstName,B.LastName from 
[HumanResources].[Employee] A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID




--�RNEK : V�EW YARATALIM :
CREATE VIEW HREMP
AS

select A.BusinessEntityID,B.FirstName,B.LastName from 
[HumanResources].[Employee] A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID

--�RNEK : V�EW �al��t�rma :
--Aynen tablo gibi �a��r�yoruz.

SELECT * FROM HREMP

--�RNEK : V�EW Bilgilerini G�relim :

sp_helptext HREMP


--Modifiye etmek i�in : Alter VIEW ifadesini kullanca��z.

ALTER VIEW HREMP
AS
select B.FirstName,B.LastName from 
[HumanResources].[Employee] A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID



--Drop etmek i�in : Drop VIEW view_ad� ifadesini kullanca��z.

DROP VIEW HREMP


--Update Edilebilir Viewler:

--Vielwar verilerini view i�inde belirtilen tablo veya tablolardan al��r.
--View'�n Kendisi veri tutmaz veya saklamaz.
--Peki biz view'� update edersek,veri al�nan orjinal tabloda update olur mu?
--Bu sorunun cevab�,evet'tir.
--Update,Insert,Delete i�lemlerini VIEW'a uygulayabiliriz.

--�RNEK:


SELECT * FROM Ornek.dbo.Cal�sanlara
SELECT * FROM Ornek.dbo.Dept


--V�EW YARATALIM

CREATE VIEW Cal�san1
AS
SELECT ID,AD,Cinsiyet,DeptID FROM Ornek.dbo.Cal�sanlara

select * from Cal�san1

--V�EW'� UPDATE EDEL�M :
UPDATE Cal�san1
SET AD = 'Yeliz' where ID = 4;
--Hem view hemde orj.tablo update oldu.

SELECT * FROM Ornek.dbo.Cal�sanlara

--V�EW'dan veri Silelim :

DELETE FROM Cal�san1
WHERE ID =4;

--V�EW'A veri �nsert Edelim :

INSERT INTO Cal�san1 VALUES
(4,'Fatma','K',4)


--V�EW'da birden Fazla Tabloyu UPDATE edelim.
--E�er view'in i�inde birden fazla tablo varsa ve gidip update i�lemi uygularsak,
--View baz tabloyu do�ru update etmeyebilir.
--View'lar� do�ru update edebilmek JOIN'lenmi� tablolar i�in m�mk�n olmamaktad�r.

--View'LARI DO�RU UPDATE EDEB�LMEK i,�in INSTEAD OF triggerlar� kullan�l�r.



--�RNEK :
SELECT * FROM Ornek.dbo.Cal�sanlara

SELECT * FROM Ornek.dbo.Dept

--Nomal Tablolar�m�za JO�N i�lemi uygulayal�m:


SELECT * FROM 
Ornek.dbo.Cal�sanlara A
LEFT JOIN
Ornek.dbo.Dept B
ON A.DeptID =B.DeptID


--V�EW YARATALIM :
CREATE VIEW JOINSCALISAN
AS
SELECT
A.Ad,A.Cinsiyet,A.ID,A.Maas,B.DeptName
FROM 
Ornek.dbo.Cal�sanlara A
LEFT JOIN
Ornek.dbo.Dept B
ON A.DeptID =B.DeptID


SELECT * FROM JOINSCALISAN



--UPDAET EDEL�M:
UPDATE JOINSCALISAN
SET DeptName ='IT' WHERE AD='Onur';
--Burada amac�m�z Onur'u UPDAT ETMEK iken IT'de �al��an Yasin de update oldu.
--View burada yanl��l�kla DEPT tablosundaki DeptName'i de update etti.

select * from JOINSCALISAN
select * from Ornek.dbo.Cal�sanlara


--##INDEXED VIEWS---
--INDEXED VIEW NED�R?
--Normal standart veya non-indexed viewlar sadece kaydedilmi� veya depolanm�� SQL sorgular�d�r.
--View'� �al��t�rd���m�zda asl�nda olan �ey,view'�n ana tablodan sadece veri almas�d�r.
--Yani viewlar sanal tablolard�r ve data ta��mazlar.
--Ancak view'da index yarat�rsak, art�k view maddile�ir yani ger�ejkten veri ta��maya ba�lar.
--Bu tip viewlara indexed view denir.


--2 �rnek tablo yaratl�m.


select * from Ornek.dbo.URUNFIYAT
select * from Ornek.dbo.ADETSATIS

--jo�nleyelim:
SELECT
A.UrunAd�,
SUM(A.BirimFiyat *B.ADET),
COUNT(B.UrunID)
FROM
Ornek.dbo.URUNFIYAT A
LEFT JOIN
Ornek.dbo.ADETSATIS B
ON A.UrunID = B.UrunID
GROUP BY A.UrunAd�

--BUNU V�EW'E ALALIM:
--Normal View �fademiz :
CREATE VIEW SON
AS
SELECT
A.UrunAd�,
SUM(A.BirimFiyat *B.ADET) AS TOPLAMSATIS,
COUNT(B.UrunID)AS ADET
FROM
Ornek.dbo.URUNFIYAT A
LEFT JOIN
Ornek.dbo.ADETSATIS B
ON A.UrunID = B.UrunID
GROUP BY A.UrunAd�



SELECT * FROM SON

--INDEXED VIEW OLAB�LMES� ���N:
--1.KURAL : 'WITH SCHEMABINDING' c�mleci�inin kullan�lmas� gerekmektedir.
--2.KURAL :Bir agg.fonk.uygulad�ysak, ve sonucun NULL gelme olas�l��� varsa,
--NUll de�erin yerine bir de�er belirtmemiz gerekmektedir.
--O y�zden ISNULL kullanabiliriz.
--D�z Count() kullanmak yerine COUNT_BIG() ifadesinin yer almas� laz�m
--Tablo adlar�n� schema adlar�yla birlikte vermemiz gerek.(Sadece 2 part name kullan�caz,3 te de�il.)

--INDEXED VIEW'� yeni ba�tan yaratal�m:

select * from Ornek.dbo.URUNFIYAT
select * from Ornek.dbo.ADETSATIS


--�nceden Yaratt���m�z View �fademiz :
ALTER VIEW SON
WITH SchemaBinding -- Tablo adlar�n�n de�i�tilrmemesi gerekir.Bize bunu s�yl�yor.��nk� indeks yaratca��z.
AS
SELECT
UrunAd�,
SUM(ISNULL((BirimFiyat *ADET),0)) AS TOPLAMSATIS,
COUNT_BIG(*)AS ADET
FROM
Ornek.dbo.URUNFIYAT
INNER JOIN
Ornek.dbo.ADETSATIS
ON Ornek.dbo.URUNFIYAT.UrunID = Ornek.dbo.ADETSATIS.UrunID
GROUP BY UrunAd�


--�imdi View da index olu�turca��z :
--Az �nceki view'�n i�indeki sorguda group by ifadesi kulland�k.
--View olu�turdu�umuz i�in s�rekli ana tabloya gdip i�lemlerin yap�lmas� gerekmektedir.
--E�er tablomuz �ok b�y�kse ve her g�n milyonlarca i�lem oluyorsa her defas�nda tabloya gidip,
--sum ve group by i�lemlerini tekrarlamas� gerekmektedir.
--Bu view da index yaratmad���m�z i�in process bu �ekilde ger�ekle�ir.
--Bu durumu view da index yaratarak de�i�tirebiliriz.

CREATE UNIQUE CLUSTERED INDEX sat�s�ndex
ON SON(UrunAd�)
--INDEX'in yarat�l�p yarat�lmad���n� viewlar�n alt�ndaki indekslerden bakabiliriz.
--View da ilk yaratt���m�z indeks, unique clustered indeks olmal�d�r.
--��nk� view'in ilk hali zaten data tutmuyor.
--Dolay�syla non - clustered indeks yaratamy�z.
--Bu indexi yaratarak view �a�r�ld���nda i�lemlerin daha h�zl� olmas�n� sa�lam�� olduk. 
--Indexed views datan�n �ok s�k de�i�medi�i yerlerde kullan�lmas� daha do�ru olacakt�r.
--Indexed view'i yarat�nca art�k her defas�nda ana tabloya gidip veri al�nmayacak.
--Yarat�lan Index'ten veri al�nabilecektir.

SELECT * FROM SON

--V�EWLARDAK� KISITLAMALAR:

--Viewlere parametre atayamay�z.
--Viewlar temporary tablo'lara dayanarak olu�turulamazlar.
--Order by ifadesini Top ifadesi ile birlikte kullanabiliriz.Tek ba��na kullanamay�z.
--E�er bir parametre atamak istiyorsak WHERE ko�ulundan sorgulama yapmam�z gerekir.

--�rne�in a�a��dakini yapamay�z :
CREATE VIEW Detay
@Cinsiyet varchar(20)
AS
Select * from Projeler
Where Gender = @Cinsiyet

--Parametize viewlar i�in alternatif �NL�NE TABLE value fonksiyonlard�r.
--�RNEK:
CREATE FUNCTION Details (@Gender varchar(20))
RETURNS TABLE
AS
RETURN
(
SELECT * FROM [HumanResources].[Employee]
WHERE Gender = @Gender
)

select * from dbo.Details ('M')
--- ### VIEW B�T�� ### ---