--- ### MULTISTATEMENT TABLE VALUED FONKSÝYONLAR ### ---

--Tek bir select ifadesinden deðilde,birden çok select ifadesini kullanarak 
--ve gerekirse farklý kaynakalardan oluþturulan tablonun dönmesi olarak düþünebiliriz.
--Inline Table Valued Fonk'dan farký,sadece bir sorgu sonucu döndürmek yerine,
--daha kompleks iþlemler yapýp ,sonucu tablo çýktýsý olarak görebiliriz.
--Daha önce öðrendiðimiz Tablo Variables'larý kullanýrýz bu fonksiyon türünde.
--Return sözcüðünden sonra,tablo deðiþkenini belirtiriz ve sonra fonksiyonun içinde ,Begin ve End bloklarý arasýnda
--istediðimiz çýktýyý tablo tipi deðiþkene insert edreiz.Ve yaratýlan tablo deðiþkeninini fonksiyonun çýktýsý
--olarak görürüz.
--Begin ve End ifadeleri'nin kullanýldýðýný hatýrlatalým.
--Deðiþken ismi atamak zorundayýz.
--MultiStatement tablo yaratýrken mutalaka tablonun hangi kolonlardan ve data tiplerinden oluþtuðunu belirtmemiz gerek.
--Özetle,burada bir yapý ile tablo dönüyoruz ve bunu belirtmemiz gerekmektedir.
--Tabloya veri insert etmeye benzetebiliriz.
--Inline Table Fonk.'e göre daha yavaþtýr.
--SQL,inline table fonk'a view muamelesi yaparken,multistatementlara stored.Proc.Muamelesi yapar.
--

--ÖRNEK:

--TABLO OLUÞTURALIM:

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
('Özpetek','1995-12-23'),
('Zeki','2005-12-23'),
('Demir','2007-12-23');

select * from ACTORS
select * from DIRECTORS


--Fonk Sonucu aþaðýdaki tablodan dönen deðer gibi olmasýný istiyorum :

select ACTORADI,ACTORADIDT from ACTORS
WHERE YEAR(ACTORADIDT) BETWEEN 1965 AND 1985
UNION ALL
select DIRECTORADI,DIRECTORDT from DIRECTORS
WHERE YEAR(DIRECTORDT) BETWEEN 1965 AND 1985


--MULTISTATEMENT TABLO YARATALIM :

CREATE FUNCTION Hepsi()
RETURNS @T TABLE
(
ÝsiM varchar(max),
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

--DROP ETMEK ÝÇÝN :
DROP FUNCTION [dbo].[Hepsi]


--AYNI ÖRNEÐÝN PARAMETRELÝSÝ:

CREATE FUNCTION Hepsia (@Tarih1 INT,@Tarih2 INT)
RETURNS @m TABLE
(
ÝsiM varchar(max),
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
