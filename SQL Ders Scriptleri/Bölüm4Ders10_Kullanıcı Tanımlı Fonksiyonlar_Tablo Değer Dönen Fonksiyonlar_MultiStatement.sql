--- ### MULTISTATEMENT TABLE VALUED FONKS�YONLAR ### ---

--Tek bir select ifadesinden de�ilde,birden �ok select ifadesini kullanarak 
--ve gerekirse farkl� kaynakalardan olu�turulan tablonun d�nmesi olarak d���nebiliriz.
--Inline Table Valued Fonk'dan fark�,sadece bir sorgu sonucu d�nd�rmek yerine,
--daha kompleks i�lemler yap�p ,sonucu tablo ��kt�s� olarak g�rebiliriz.
--Daha �nce ��rendi�imiz Tablo Variables'lar� kullan�r�z bu fonksiyon t�r�nde.
--Return s�zc���nden sonra,tablo de�i�kenini belirtiriz ve sonra fonksiyonun i�inde ,Begin ve End bloklar� aras�nda
--istedi�imiz ��kt�y� tablo tipi de�i�kene insert edreiz.Ve yarat�lan tablo de�i�keninini fonksiyonun ��kt�s�
--olarak g�r�r�z.
--Begin ve End ifadeleri'nin kullan�ld���n� hat�rlatal�m.
--De�i�ken ismi atamak zorunday�z.
--MultiStatement tablo yarat�rken mutalaka tablonun hangi kolonlardan ve data tiplerinden olu�tu�unu belirtmemiz gerek.
--�zetle,burada bir yap� ile tablo d�n�yoruz ve bunu belirtmemiz gerekmektedir.
--Tabloya veri insert etmeye benzetebiliriz.
--Inline Table Fonk.'e g�re daha yava�t�r.
--SQL,inline table fonk'a view muamelesi yaparken,multistatementlara stored.Proc.Muamelesi yapar.
--

--�RNEK:

--TABLO OLU�TURALIM:

CREATE TABLE ACTORS
(
ACTORADI VARCHAR(50),
ACTORADIDT DATE
);


CREATE TABLE DIRECTORS
(
DIRECTORADI VARCHAR(50),
DIRECTORDT DATE
);

INSERT INTO ACTORS VALUES
('Onur','1960-12-23'),
('Murat','1970-12-23'),
('Kemal','1980-12-23'),
('Fatma','1990-12-23'),
('Ezgi','2000-12-23'),
('Cem','2010-12-23'),
('Yasin','1960-12-23');



INSERT INTO DIRECTORS VALUES
('Nuri','1965-12-23'),
('Bilge','1975-12-23'),
('Ferzan','1985-12-23'),
('�zpetek','1995-12-23'),
('Zeki','2005-12-23'),
('Demir','2007-12-23');

select * from ACTORS
select * from DIRECTORS


--Fonk Sonucu a�a��daki tablodan d�nen de�er gibi olmas�n� istiyorum :

select ACTORADI,ACTORADIDT from ACTORS
WHERE YEAR(ACTORADIDT) BETWEEN 1965 AND 1985
UNION ALL
select DIRECTORADI,DIRECTORDT from DIRECTORS
WHERE YEAR(DIRECTORDT) BETWEEN 1965 AND 1985


--MULTISTATEMENT TABLO YARATALIM :

CREATE FUNCTION Hepsi()
RETURNS @T TABLE
(
�siM varchar(max),
DogumTarihi DATE

)
AS 
BEGIN
		INSERT INTO @T
		select ACTORADI,ACTORADIDT from ACTORS
		WHERE YEAR(ACTORADIDT) BETWEEN 1965 AND 1985

		INSERT INTO @T
		select DIRECTORADI,DIRECTORDT from DIRECTORS
		WHERE YEAR(DIRECTORDT) BETWEEN 1965 AND 1985

		RETURN
END

SELECT * FROM Hepsi()

--DROP ETMEK ���N :
DROP FUNCTION [dbo].[Hepsi]


--AYNI �RNE��N PARAMETREL�S�:

CREATE FUNCTION Hepsia (@Tarih1 INT,@Tarih2 INT)
RETURNS @m TABLE
(
�siM varchar(max),
DogumTarihi DATE
)

AS 
BEGIN
		INSERT INTO @m
		select ACTORADI,ACTORADIDT from ACTORS
		WHERE YEAR(ACTORADIDT) BETWEEN @Tarih1 AND @Tarih2

		INSERT INTO @m
		select DIRECTORADI,DIRECTORDT from DIRECTORS
		WHERE YEAR(DIRECTORDT) BETWEEN @Tarih1 AND @Tarih2

		RETURN
END

SELECT * FROM Hepsia(1965,1975)
