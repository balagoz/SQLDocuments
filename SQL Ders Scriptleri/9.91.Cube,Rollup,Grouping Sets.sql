-- GROUPING SETS - CUBE - ROLLUP --


-- ### GROUPING SETS BA�LANGI� ### --
--GROUP BY ifadesi ile yapabilce�imiz t�m olas� gruplamalar� tek bir i�lemde yapabilmemizi sa�layan sorgu yap�s�d�r.

-- �RNEK 1 :
 
 --A�a��daki gibi �rnek bir tablomuz olsun :

SELECT * FROM Ornek.dbo.KurumsalCal�sanlar

--KA� FARKLI GROUP BY YAPAB�L�R�Z :
--1 :(Ulke,Cinsiyet)
--2 :(Ulke)
--3 :(Cinsiyet)
--4 :()


--1.DURUM--
--(Ulke,Cinsiyet)

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke,Cinsiyet




--2.DURUM--
--(Ulke)

SELECT Ulke,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke



--3.DURUM--

--(Cinsiyet)

SELECT Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Cinsiyet



--4.DURUM--

--()
SELECT SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2



-----------------------------------


--B�Z BU 4 DURUMUDA SONUCUMUZDA G�RMEK �ST�YORUZ.
--�LK YOL UNION ALL  �LE YAPAB�L�R�Z.
--NULL KOYUYORUz ��NK� UNION ALL YAPARKEN KOLON SAYILARIMIZ E��T OLMASINI �ST�YORUZ.


--1.DURUM : (Ulke,Cinsiyet)

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke,Cinsiyet


--2.DURUM : (Ulke)

SELECT Ulke,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke



--3.DURUM : (Cinsiyet)


SELECT Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Cinsiyet



--4.DURUM : ()

SELECT SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2




-----UNION ALL uyguluyoruz :
--(Ulke,Cinsiyet)
--(Ulke)
--(Cinsiyet)
--()

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke,Cinsiyet


UNION ALL


SELECT Ulke,NULL,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke



UNION ALL

SELECT NULL,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Cinsiyet


UNION ALL

SELECT NULL,NULL,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2




--SONU� :
--�stedi�imizi elde ettik ancak sorgumuz �ok uzun oldu.
--Ancak GROUPING SETS yap�s�n� uygulayarak istedi�imize �ok daha kolay elde edebiliriz.

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


--UNION ALL ile ula�t���m�z sonucun ayn�s�na ula��r�z:



SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY
	GROUPING SETS
	(

			(Ulke,Cinsiyet),
			(Ulke),
			(Cinsiyet),
			()
	);





-- ORDER BY DA uygulayabiliriz:


SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY
	GROUPING SETS
	(

			(Ulke,Cinsiyet),
			(Ulke),
			(Cinsiyet),
			()
	)

ORDER BY GROUPING(Ulke),GROUPING(Cinsiyet);




-----GROUPING SETS DATABASE �RNEK-------
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




--KONTROL EDEL�M :


SELECT COUNT(*) FROM HumanResources.Employee


-- ### GROUPING SETS B�T�� ### --








-- ### ROLLUP BA�LANGI� ### --

--Birden �ok grouping sets yaratmak i�in kullan�l�r.
--Group by ifadesinin bir bile�enidir.
--Cube'in aksine Rollup t�m olas� grouping sets'leri yaratmaz.
--Belirtilen kolonlar i�in bir hiyerar�iyi takip eder.
--Genellikle alttoplamlar yaratmak i�in raporlama ama�l� kullan��l�r.
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

--Bu durumda ROLLUP a�a��daki gibi grouping sets ler yarat�r.
-- d1 > d2 > d3.

--(d1, d2, d3)
--(d1, d2)
--(d1)
--()

--E�er sadece 2 kolon olursa:
SELECT
    d1,
    d2,
    aggregate_function(c4)
FROM
    table_name
GROUP BY
    ROLLUP (d1, d2);

--Bu durumda ROLLUP a�a��daki gibi grouping sets ler yarat�r.
-- d1 > d2.
--(d1,d2)
--(d1)
--()



--�RNEK:

SELECT * FROM OrneK.DBO.KurumsalCal�sanlar2

--NORMAL GROUP BY
SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCal�sanlar2
GROUP BY Ulke;


-- ROLLUP'LI GROUP BY :


SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCal�sanlar2
GROUP BY ROLLUP(Ulke);


--(Ulke)
--()





--A�a��daki de ayn� sonucu verir.


SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCal�sanlar2
GROUP BY Ulke WITH ROLLUP;

--(Ulke)
--()






--AYNI SONUCU VEREN D��ER YOLLAR:

--1.Y�NTEM :UNION ALL:

SELECT Ulke,SUM(Maas)FROM OrneK.DBO.KurumsalCal�sanlar2
GROUP BY Ulke

UNION ALL

--2.DURUM:
SELECT NULL,SUM(Maas)
FROM OrneK.DBO.KurumsalCal�sanlar2







--2.Y�NTEM :GROUPING SETS:


SELECT Ulke,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY 
	GROUPING SETS
	(
		(Ulke),
		()

	);







--�RNEK 2:

--Bu sefer �lkenin yan�na birde Cinsiyet kolonu geliyor :

-- Normal Group By:
SELECT Ulke,Cinsiyet,SUM(Maas)FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke,Cinsiyet



-- ROLLUP �LE :

SELECT Ulke,Cinsiyet,SUM(Maas)FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY ROLLUP(Ulke,Cinsiyet)
ORDER BY Cinsiyet DESC
--(Ulke,Cinsiyet)
--(Ulke)
--()





--GROUPING SETS �LE Yap�l��� :

SELECT Ulke,Cinsiyet,SUM(Maas)FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY
	GROUPING SETS
	(
			(Ulke,Cinsiyet),
			(Ulke),
			()
	)

ORDER BY GROUPING (Ulke),GROUPING (Cinsiyet);






-- ### ROLLUP B�T�� ### --







-- ### CUBE BA�LANGI� ### --

--Group by ile beraber kullan�l�r.
-- T�m olas� group�ng sets'leri yarat�r.
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



-- CUBE B�T�N OLASI GROUPING SETSLER� YARATIR.
--2^N
--N=Kolon veya boyut say�s�.
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

--AYNI SONUCA GROUPING SETS �LE A�A�IDAK� G�B� ULA�AB�L�R�Z:

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
--�RNEK :

--Normal bir group by yapal�m :

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY Ulke,Cinsiyet





--CUBE �LE YAPALIM :


SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY CUBE (Ulke,Cinsiyet);

--(Ulke,Cinsiyet)
--(Ulke)
--(Cinsiyet)
--()



--CUBE D��ER YAZILI� B���M�:
SELECT
Ulke,
Cinsiyet,
SUM(Maas)
FROM Ornek.dbo.KurumsalCal�sanlar2
group by Ulke,Cinsiyet WITH CUBE;




--AYNI SONUCU VEREN D��ER YOL:

--GROUPING SETS �LE YAPILI�I:

SELECT Ulke,Cinsiyet,SUM(Maas) FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY
	GROUPING SETS
	(

		(Ulke,Cinsiyet),
		(Ulke),
		(Cinsiyet),
		()
	);











--- CUBE VE ROLLUP FARKLILIKLARI ---
--CUBE b�t�n kombinasyonlar� yapar.
--Rollup ise hiyerar�i takip eder.

--ROLLUP(K�ta,Ulke,Sehir)
	--K�ta>Ulke>Sehir	
	--(K�ta,Ulke,Sehir)
	--(K�ta,Ulke)
	--(K�ta)
	--()

--CUBE(K�ta,Ulke,Sehir)--2^3
	--(K�ta,Ulke,Sehir)
	--(K�ta,Ulke)
	--(K�ta,Sehir)
	--(K�ta)
	--(Ulke,Sehir)
	--(Ulke)
	--(Sehir)
	--()



--E�ER TEK B�R KOLON VARSA �K�S�DE AYNI SONUCU VER�R.


SELECT
Ulke,
SUM(Maas)
FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY ROLLUP (Ulke);


SELECT
Ulke,
SUM(Maas)
FROM Ornek.dbo.KurumsalCal�sanlar2
GROUP BY CUBE (Ulke);

























-- ### ROLLUP BA�LANGI� B�T�� ### --



