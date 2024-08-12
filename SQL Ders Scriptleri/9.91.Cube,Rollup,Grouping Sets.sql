-- GROUPING SETS - CUBE - ROLLUP --


-- ### GROUPING SETS BAÞLANGIÇ ### --
--GROUP BY ifadesi ile yapabilceðimiz tüm olasý gruplamalarý tek bir iþlemde yapabilmemizi saðlayan sorgu yapýsýdýr.

-- ÖRNEK 1 :
 
 --Aþaðýdaki gibi örnek bir tablomuz olsun :

SELECT * FROM Ornek.dbo.KurumsalCalýsanlar

--KAÇ FARKLI GROUP BY YAPABÝLÝRÝZ :
--1 :(Ulke,Cinsiyet)
--2 :(Ulke)
--3 :(Cinsiyet)
--4 :()


--1.DURUM--
--(Ulke,Cinsiyet)

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke,Cinsiyet




--2.DURUM--
--(Ulke)

SELECT Ulke,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke



--3.DURUM--

--(Cinsiyet)

SELECT Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Cinsiyet



--4.DURUM--

--()
SELECT SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2



-----------------------------------


--BÝZ BU 4 DURUMUDA SONUCUMUZDA GÖRMEK ÝSTÝYORUZ.
--ÝLK YOL UNION ALL  ÝLE YAPABÝLÝRÝZ.
--NULL KOYUYORUz ÇÜNKÜ UNION ALL YAPARKEN KOLON SAYILARIMIZ EÞÝT OLMASINI ÝSTÝYORUZ.


--1.DURUM : (Ulke,Cinsiyet)

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke,Cinsiyet


--2.DURUM : (Ulke)

SELECT Ulke,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke



--3.DURUM : (Cinsiyet)


SELECT Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Cinsiyet



--4.DURUM : ()

SELECT SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2




-----UNION ALL uyguluyoruz :
--(Ulke,Cinsiyet)
--(Ulke)
--(Cinsiyet)
--()

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke,Cinsiyet


UNION ALL


SELECT Ulke,NULL,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke



UNION ALL

SELECT NULL,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Cinsiyet


UNION ALL

SELECT NULL,NULL,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2




--SONUÇ :
--Ýstediðimizi elde ettik ancak sorgumuz çok uzun oldu.
--Ancak GROUPING SETS yapýsýný uygulayarak istediðimize çok daha kolay elde edebiliriz.

--SYNTAX :

SELECT
    Kolon1,
    Kolon2,
    aggregate_function (Kolon3)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (Kolon1, Kolon2),
        (Kolon1),
        (Kolon2),
        ()
);


--UNION ALL ile ulaþtýðýmýz sonucun aynýsýna ulaþýrýz:



SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY
	GROUPING SETS
	(

			(Ulke,Cinsiyet),
			(Ulke),
			(Cinsiyet),
			()
	);





-- ORDER BY DA uygulayabiliriz:


SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY
	GROUPING SETS
	(

			(Ulke,Cinsiyet),
			(Ulke),
			(Cinsiyet),
			()
	)

ORDER BY GROUPING(Ulke),GROUPING(Cinsiyet);




-----GROUPING SETS DATABASE ÖRNEK-------
Use AdventureWorks2019
SELECT * FROM HumanResources.Employee

SELECT 
MaritalStatus,
Gender,
COUNT(BusinessEntityID)
FROM HumanResources.Employee
GROUP BY 
	GROUPING SETS(
		(MaritalStatus,Gender),
		(MaritalStatus),
		(Gender),
		()
		)
		ORDER BY GROUPING(MaritalStatus),GROUPING(Gender);




--KONTROL EDELÝM :


SELECT COUNT(*) FROM HumanResources.Employee


-- ### GROUPING SETS BÝTÝÞ ### --








-- ### ROLLUP BAÞLANGIÇ ### --

--Birden çok grouping sets yaratmak için kullanýlýr.
--Group by ifadesinin bir bileþenidir.
--Cube'in aksine Rollup tüm olasý grouping sets'leri yaratmaz.
--Belirtilen kolonlar için bir hiyerarþiyi takip eder.
--Genellikle alttoplamlar yaratmak için raporlama amaçlý kullanýýlýr.
--D1>D2>D3 gibi hareket eder.
--ROLLUP(D1,D2,D3)

--(D1,D2,D3)
--(D1,D2)
--(D1)
--()

--SYNTAX :
SELECT
    d1,
    d2,
    d3,
    aggregate_function(c4)
FROM
    table_name
GROUP BY
    ROLLUP (d1, d2, d3);

--Bu durumda ROLLUP aþaðýdaki gibi grouping sets ler yaratýr.
-- d1 > d2 > d3.

--(d1, d2, d3)
--(d1, d2)
--(d1)
--()

--Eðer sadece 2 kolon olursa:
SELECT
    d1,
    d2,
    aggregate_function(c4)
FROM
    table_name
GROUP BY
    ROLLUP (d1, d2);

--Bu durumda ROLLUP aþaðýdaki gibi grouping sets ler yaratýr.
-- d1 > d2.
--(d1,d2)
--(d1)
--()



--ÖRNEK:

SELECT * FROM OrneK.DBO.KurumsalCalýsanlar2

--NORMAL GROUP BY
SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCalýsanlar2
GROUP BY Ulke;


-- ROLLUP'LI GROUP BY :


SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCalýsanlar2
GROUP BY ROLLUP(Ulke);


--(Ulke)
--()





--Aþaðýdaki de ayný sonucu verir.


SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCalýsanlar2
GROUP BY Ulke WITH ROLLUP;

--(Ulke)
--()






--AYNI SONUCU VEREN DÝÐER YOLLAR:

--1.YÖNTEM :UNION ALL:

SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCalýsanlar2
GROUP BY Ulke

UNION ALL

--2.DURUM:
SELECT NULL,SUM(Maas)
FROM OrneK.DBO.KurumsalCalýsanlar2







--2.YÖNTEM :GROUPING SETS:


SELECT Ulke,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY 
	GROUPING SETS
	(
		(Ulke),
		()

	);







--ÖRNEK 2:

--Bu sefer Ülkenin yanýna birde Cinsiyet kolonu geliyor :

-- Normal Group By:
SELECT Ulke,Cinsiyet,SUM(Maas)FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke,Cinsiyet



-- ROLLUP ÝLE :

SELECT Ulke,Cinsiyet,SUM(Maas)FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY ROLLUP(Ulke,Cinsiyet)
ORDER BY Cinsiyet DESC
--(Ulke,Cinsiyet)
--(Ulke)
--()





--GROUPING SETS ÝLE Yapýlýþý :

SELECT Ulke,Cinsiyet,SUM(Maas)FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY
	GROUPING SETS
	(
			(Ulke,Cinsiyet),
			(Ulke),
			()
	)

ORDER BY GROUPING (Ulke),GROUPING (Cinsiyet);






-- ### ROLLUP BÝTÝÞ ### --







-- ### CUBE BAÞLANGIÇ ### --

--Group by ile beraber kullanýlýr.
-- Tüm olasý groupýng sets'leri yaratýr.
--SYNTAX:
SELECT
    d1,
    d2,
    d3,
    aggregate_function (c4)
FROM
    table_name
GROUP BY
    CUBE (d1, d2, d3);



-- CUBE BÜTÜN OLASI GROUPING SETSLERÝ YARATIR.
--2^N
--N=Kolon veya boyut sayýsý.
--2^3
--
(d1, d2, d3)
(d1, d2)
(d2, d3)
(d1, d3)
(d1)
(d2)
(d3)
()
--

--AYNI SONUCA GROUPING SETS ÝLE AÞAÐIDAKÝ GÝBÝ ULAÞABÝLÝRÝZ:

SELECT
    d1,
    d2,
    d3,
    aggregate_function (c4)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (d1,d2,d3), 
        (d1,d2),
        (d1,d3),
        (d2,d3),
        (d1),
        (d2),
        (d3), 
        ()
     );

--
--ÖRNEK :

--Normal bir group by yapalým :

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY Ulke,Cinsiyet





--CUBE ÝLE YAPALIM :


SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY CUBE (Ulke,Cinsiyet);

--(Ulke,Cinsiyet)
--(Ulke)
--(Cinsiyet)
--()



--CUBE DÝÐER YAZILIÞ BÝÇÝMÝ:
SELECT
Ulke,
Cinsiyet,
SUM(Maas)
FROM Ornek.dbo.KurumsalCalýsanlar2
group by Ulke,Cinsiyet WITH CUBE;




--AYNI SONUCU VEREN DÝÐER YOL:

--GROUPING SETS ÝLE YAPILIÞI:

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY
	GROUPING SETS
	(

		(Ulke,Cinsiyet),
		(Ulke),
		(Cinsiyet),
		()
	);











--- CUBE VE ROLLUP FARKLILIKLARI ---
--CUBE bütün kombinasyonlarý yapar.
--Rollup ise hiyerarþi takip eder.

--ROLLUP(Kýta,Ulke,Sehir)
	--Kýta>Ulke>Sehir	
	--(Kýta,Ulke,Sehir)
	--(Kýta,Ulke)
	--(Kýta)
	--()

--CUBE(Kýta,Ulke,Sehir)--2^3
	--(Kýta,Ulke,Sehir)
	--(Kýta,Ulke)
	--(Kýta,Sehir)
	--(Kýta)
	--(Ulke,Sehir)
	--(Ulke)
	--(Sehir)
	--()



--EÐER TEK BÝR KOLON VARSA ÝKÝSÝDE AYNI SONUCU VERÝR.


SELECT
Ulke,
SUM(Maas)
FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY ROLLUP (Ulke);


SELECT
Ulke,
SUM(Maas)
FROM Ornek.dbo.KurumsalCalýsanlar2
GROUP BY CUBE (Ulke);

























-- ### ROLLUP BAÞLANGIÇ BÝTÝÞ ### --



