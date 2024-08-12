--- ### VIEW BAÞLANGIÇ ### ---
--SQL ifadelerinin sonuçlarýný saklayan sanal tablolarýdr.
--View'in tablolar gibi satýr ve sütnlarý vardýr.
--Birden fazla tablodan sonuç taþýyabilirler.
--View'lara istedðimiz kadar sql sorgularý ve hatta fonk.ekelyebiliriz ve çaðýrdýðýmýz zaman sanki tek bir tablodan 
--veri geliyormuþ gibi olur.
--CREATE view ifadesi ile yaratýlýr.
--Viewlarý database in altýnda view sekmesinde görebiliriz.
--vÝEWLAR ASLINDA DATA TUTMAZ.Sadece kaydedilmiþ sql sorgukarýdýr.Sanal tablolardýr.
--sp_helptext view adý yazarak view'ýn textini görebiliriz.


--VÝEW avantajlarý :
--Karmaþýklýðý azaltýr.
--Örneðin joinlemeyi bilmeyen birisi hazýr joinlenmiþ tabloya kavuþur.
--Satýr ve sütun bazýnda güvenlik saðlar.
--Mesela IT müdürü sadece IT çalýþanlarýn maaþlrýný görsün.Sadece o yetkiyi verebiliriz.Örmneðin Where DeptName = 'ýt'
--Veya maaþ kolonunu çýkartabiliriz.
--Diðer bir özellik ise,örneðin detay bilgileri deðilde sadece gruplanmýþ bilgileri gösterebiliriz.

--Update etmek için  CREATE OR REPLACE VIEW ya da ALTER VIEW kullanabiliriz.
--DROP etmek için de DROP VIEW viewname
--View'ýn adýný deðiþtirmek için obj.exp'dan viewý bul sað týk rename veya sp_rename stored proc'unda yararlanabiliriz.
--ÖRNEK : EXEC sp_rename SON,YENISON
--Viewlarý listelemek için : sys.views ya da sys.objects
--sp_helptext ile view'in text bilgiseine eriþebiliriz.

--VÝEW NEDÝR?
--View'lar aslýnda kayedilmiþ SQL sorgularýdýr.Ayný zamanda sanal tablo olarak da kabul edilirler.

--ÖRNEK : 2 tane tablo joinleyelim.
select A.BusinessEntityID,B.FirstName,B.LastName from 
[HumanResources].[Employee] A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID




--ÖRNEK : VÝEW YARATALIM :
CREATE VIEW HREMP
AS

select A.BusinessEntityID,B.FirstName,B.LastName from 
[HumanResources].[Employee] A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID

--ÖRNEK : VÝEW çalýþtýrma :
--Aynen tablo gibi çaðýrýyoruz.

SELECT * FROM HREMP

--ÖRNEK : VÝEW Bilgilerini Görelim :

sp_helptext HREMP


--Modifiye etmek için : Alter VIEW ifadesini kullancaðýz.

ALTER VIEW HREMP
AS
select B.FirstName,B.LastName from 
[HumanResources].[Employee] A
LEFT JOIN
Person.Person B
ON A.BusinessEntityID =B.BusinessEntityID



--Drop etmek için : Drop VIEW view_adý ifadesini kullancaðýz.

DROP VIEW HREMP


--Update Edilebilir Viewler:

--Vielwar verilerini view içinde belirtilen tablo veya tablolardan alýýr.
--View'ýn Kendisi veri tutmaz veya saklamaz.
--Peki biz view'ý update edersek,veri alýnan orjinal tabloda update olur mu?
--Bu sorunun cevabý,evet'tir.
--Update,Insert,Delete iþlemlerini VIEW'a uygulayabiliriz.

--ÖRNEK:


SELECT * FROM Ornek.dbo.Calýsanlara
SELECT * FROM Ornek.dbo.Dept


--VÝEW YARATALIM

CREATE VIEW Calýsan1
AS
SELECT ID,AD,Cinsiyet,DeptID FROM Ornek.dbo.Calýsanlara

select * from Calýsan1

--VÝEW'ý UPDATE EDELÝM :
UPDATE Calýsan1
SET AD = 'Yeliz' where ID = 4;
--Hem view hemde orj.tablo update oldu.

SELECT * FROM Ornek.dbo.Calýsanlara

--VÝEW'dan veri Silelim :

DELETE FROM Calýsan1
WHERE ID =4;

--VÝEW'A veri ýnsert Edelim :

INSERT INTO Calýsan1 VALUES
(4,'Fatma','K',4)


--VÝEW'da birden Fazla Tabloyu UPDATE edelim.
--Eðer view'in içinde birden fazla tablo varsa ve gidip update iþlemi uygularsak,
--View baz tabloyu doðru update etmeyebilir.
--View'larý doðru update edebilmek JOIN'lenmiþ tablolar için mümkün olmamaktadýr.

--View'LARI DOÐRU UPDATE EDEBÝLMEK i,çin INSTEAD OF triggerlarý kullanýlýr.



--ÖRNEK :
SELECT * FROM Ornek.dbo.Calýsanlara

SELECT * FROM Ornek.dbo.Dept

--Nomal Tablolarýmýza JOÝN iþlemi uygulayalým:


SELECT * FROM 
Ornek.dbo.Calýsanlara A
LEFT JOIN
Ornek.dbo.Dept B
ON A.DeptID =B.DeptID


--VÝEW YARATALIM :
CREATE VIEW JOINSCALISAN
AS
SELECT
A.Ad,A.Cinsiyet,A.ID,A.Maas,B.DeptName
FROM 
Ornek.dbo.Calýsanlara A
LEFT JOIN
Ornek.dbo.Dept B
ON A.DeptID =B.DeptID


SELECT * FROM JOINSCALISAN



--UPDAET EDELÝM:
UPDATE JOINSCALISAN
SET DeptName ='IT' WHERE AD='Onur';
--Burada amacýmýz Onur'u UPDAT ETMEK iken IT'de çalýþan Yasin de update oldu.
--View burada yanlýþlýkla DEPT tablosundaki DeptName'i de update etti.

select * from JOINSCALISAN
select * from Ornek.dbo.Calýsanlara


--##INDEXED VIEWS---
--INDEXED VIEW NEDÝR?
--Normal standart veya non-indexed viewlar sadece kaydedilmiþ veya depolanmýþ SQL sorgularýdýr.
--View'ý çalýþtýrdýðýmýzda aslýnda olan þey,view'ýn ana tablodan sadece veri almasýdýr.
--Yani viewlar sanal tablolardýr ve data taþýmazlar.
--Ancak view'da index yaratýrsak, artýk view maddileþir yani gerçejkten veri taþýmaya baþlar.
--Bu tip viewlara indexed view denir.


--2 örnek tablo yaratlým.


select * from Ornek.dbo.URUNFIYAT
select * from Ornek.dbo.ADETSATIS

--joýnleyelim:
SELECT
A.UrunAdý,
SUM(A.BirimFiyat *B.ADET),
COUNT(B.UrunID)
FROM
Ornek.dbo.URUNFIYAT A
LEFT JOIN
Ornek.dbo.ADETSATIS B
ON A.UrunID = B.UrunID
GROUP BY A.UrunAdý

--BUNU VÝEW'E ALALIM:
--Normal View Ýfademiz :
CREATE VIEW SON
AS
SELECT
A.UrunAdý,
SUM(A.BirimFiyat *B.ADET) AS TOPLAMSATIS,
COUNT(B.UrunID)AS ADET
FROM
Ornek.dbo.URUNFIYAT A
LEFT JOIN
Ornek.dbo.ADETSATIS B
ON A.UrunID = B.UrunID
GROUP BY A.UrunAdý



SELECT * FROM SON

--INDEXED VIEW OLABÝLMESÝ ÝÇÝN:
--1.KURAL : 'WITH SCHEMABINDING' cümleciðinin kullanýlmasý gerekmektedir.
--2.KURAL :Bir agg.fonk.uyguladýysak, ve sonucun NULL gelme olasýlýðý varsa,
--NUll deðerin yerine bir deðer belirtmemiz gerekmektedir.
--O yüzden ISNULL kullanabiliriz.
--Düz Count() kullanmak yerine COUNT_BIG() ifadesinin yer almasý lazým
--Tablo adlarýný schema adlarýyla birlikte vermemiz gerek.(Sadece 2 part name kullanýcaz,3 te deðil.)

--INDEXED VIEW'ý yeni baþtan yaratalým:

select * from Ornek.dbo.URUNFIYAT
select * from Ornek.dbo.ADETSATIS


--Önceden Yarattýðýmýz View Ýfademiz :
ALTER VIEW SON
WITH SchemaBinding -- Tablo adlarýnýn deðiþtilrmemesi gerekir.Bize bunu söylüyor.Çünkü indeks yaratcaðýz.
AS
SELECT
UrunAdý,
SUM(ISNULL((BirimFiyat *ADET),0)) AS TOPLAMSATIS,
COUNT_BIG(*)AS ADET
FROM
Ornek.dbo.URUNFIYAT
INNER JOIN
Ornek.dbo.ADETSATIS
ON Ornek.dbo.URUNFIYAT.UrunID = Ornek.dbo.ADETSATIS.UrunID
GROUP BY UrunAdý


--Þimdi View da index oluþturcaðýz :
--Az önceki view'ýn içindeki sorguda group by ifadesi kullandýk.
--View oluþturduðumuz için sürekli ana tabloya gdip iþlemlerin yapýlmasý gerekmektedir.
--Eðer tablomuz çok büyükse ve her gün milyonlarca iþlem oluyorsa her defasýnda tabloya gidip,
--sum ve group by iþlemlerini tekrarlamasý gerekmektedir.
--Bu view da index yaratmadýðýmýz için process bu þekilde gerçekleþir.
--Bu durumu view da index yaratarak deðiþtirebiliriz.

CREATE UNIQUE CLUSTERED INDEX satýsýndex
ON SON(UrunAdý)
--INDEX'in yaratýlýp yaratýlmadýðýný viewlarýn altýndaki indekslerden bakabiliriz.
--View da ilk yarattýðýmýz indeks, unique clustered indeks olmalýdýr.
--Çünkü view'in ilk hali zaten data tutmuyor.
--Dolayýsyla non - clustered indeks yaratamyýz.
--Bu indexi yaratarak view çaðrýldýðýnda iþlemlerin daha hýzlý olmasýný saðlamýþ olduk. 
--Indexed views datanýn çok sýk deðiþmediði yerlerde kullanýlmasý daha doðru olacaktýr.
--Indexed view'i yaratýnca artýk her defasýnda ana tabloya gidip veri alýnmayacak.
--Yaratýlan Index'ten veri alýnabilecektir.

SELECT * FROM SON

--VÝEWLARDAKÝ KISITLAMALAR:

--Viewlere parametre atayamayýz.
--Viewlar temporary tablo'lara dayanarak oluþturulamazlar.
--Order by ifadesini Top ifadesi ile birlikte kullanabiliriz.Tek baþýna kullanamayýz.
--Eðer bir parametre atamak istiyorsak WHERE koþulundan sorgulama yapmamýz gerekir.

--Örneðin aþaðýdakini yapamayýz :
CREATE VIEW Detay
@Cinsiyet varchar(20)
AS
Select * from Projeler
Where Gender = @Cinsiyet

--Parametize viewlar için alternatif ÝNLÝNE TABLE value fonksiyonlardýr.
--ÖRNEK:
CREATE FUNCTION Details (@Gender varchar(20))
RETURNS TABLE
AS
RETURN
(
SELECT * FROM [HumanResources].[Employee]
WHERE Gender = @Gender
)

select * from dbo.Details ('M')
--- ### VIEW BÝTÝÞ ### ---