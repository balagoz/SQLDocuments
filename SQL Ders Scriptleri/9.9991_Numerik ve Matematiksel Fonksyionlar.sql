--- ### ABS BAÞLANGIÇ ### ---
--SYNTAX :ABS ( numeric_expression ) 
--Deðerin mutlak deðerini döner.
--ÖRNEK :
SELECT ABS(-12) -- 12
SELECT ABS(-1) --1
SELECT ABS(0)--0
SELECT ABS(12)--12
SELECT ABS(-1.0), ABS(0.0), ABS(1.0); --1 0 1
SELECT ABS(100-200)--100
SELECT ABS(100*-1)--100


--- ### ABS BÝTÝÞ ### ---

--- ### CEILING BAÞLANGIÇ ### ---
--SYNTAX :CEILING ( numeric_expression ) 
--belirtilen sayýsal ifadeden büyük 
--veya ona eþit en küçük tamsayýyý döndürür.
--ÖRNEK :

SELECT CEILING(25.80) -- 26
SELECT CEILING(25) -- 25
SELECT CEILING(25.1) -- 26
SELECT CEILING(32.68) -- 33
SELECT CEILING(-12) -- -12
SELECT CEILING(-12.5) -- -12
SELECT CEILING(-13.5) -- -13
SELECT CEILING(-33.78) -- -33
SELECT CEILING(100.55) -- 101


--- ### CEILING BÝTÝÞ ### ---



--- ### EXP BAÞLANGIÇ ### ---
--SYNTAX :EXP ( float_expression )
--Belirtilen ifadesinin üstel deðerini döndürür.
--e = 2.718281
--ÖRNEK :

SELECT EXP(2)--7.38905609893065
SELECT 2.718281 * 2.718281 --7.389051594961
SELECT POWER(2.718281,2)--7.389052

--- ### EXP BÝTÝÞ ### ---

--- ### LOG10 BAÞLANGIÇ ### ---
--SYNATX :LOG10 ( float_expression )
--ifadenin 10 tabanlý logaritmasýný döndürür.

SELECT LOG10(10)--1
SELECT LOG10(100)--2
SELECT LOG10(4.5)--0.653212513775344


--- ### LOG10 BÝTÝÞ ### ---

--- ### PI BAÞLANGIÇ ### ---
--SYNATX :PI ( ) 
--PI sayýsýnýn deðerini döner.

SELECT PI()--3.14159265358979


--- ### PI BÝTÝÞ ### ---

--- ### FLOOR BAÞLANGIÇ ### ---


--SYNTAX :FLOOR ( numeric_expression )
--CEILING fonk.tam tersidir.
--Belirtilen sayýsal ifadeden küçük veya ona eþit en büyük tamsayýyý döndürür.
--ÖRNEKLER:
SELECT FLOOR(25.75) -- 25

SELECT FLOOR(25) -- 25

SELECT FLOOR(-13.5) -- -14
SELECT CEILING(-13.5) -- -13

SELECT FLOOR(5.8) -- 5
SELECT FLOOR(-5.8) -- -6
SELECT FLOOR(34.89) -- 34
SELECT CEILING(34.89) -- 35

--- ### FLOOR BÝTÝÞ ### ---

--- ### POWER BAÞLANGIÇ ### ---
--SYNTAX :POWER ( float_expression , y )
--ÖRNEK :Belirtilen sayýnýn istediðimiz sayýdaki üssünü getirir.

SELECT POWER(2,3)--8
SELECT POWER(2,2)--4
SELECT POWER(2,1)--2
SELECT POWER(2,0)--1
SELECT POWER(8,1)--8
SELECT POWER(8,2)--64
SELECT POWER(4,4)--256
SELECT POWER(4,2)--16
SELECT POWER(4,1)--4
SELECT POWER(4,0)--1
SELECT POWER(0,0)--1
SELECT POWER(10,2)--100

--- ### POWER BÝTÝÞ ### ---

--- ### RAND BAÞLANGIÇ ### ---

--SYNTAX :RAND ( [ seed ] )
--0 ÝLE 1 ARASINDA BÝZE RASTGELE SAYI DÖNER.
--Ýstediðimiz rakamlar arasýnda rastgele sayý dönmesini istiyorsak,aþaðýdaki, formulü kullanacaðýz.
--rand()*(b-a)+a;
--b = Büyük Sayý
--a = Küçük Sayý
--örnek :

SELECT RAND()
SELECT RAND()*100 -- BU 1 ÝLE 100 ARASINDA RASTGELE SAYI DÖNER.
SELECT RAND()*(10-5)+5
SELECT RAND()*(100-99)+99



--ÖRNEK : 0 ÝLE 100 arasýnda 10 tane random sayý üretin
DECLARE @sayý INT
SET @sayý =0

WHILE (@sayý < 10)
	BEGIN
		PRINT FLOOR(RAND()*100)
		SET @sayý = @sayý + 1
	END

--- ### RAND BÝTÝÞ ### ---

--- ### SIGN BAÞLANGIÇ ### ---
--SYNTAX :SIGN ( float_expression )
--Sayýnýn pozitif mi, negatif mi olduðunu gösterir.
--SAYI = 0 >>>> 0
--SAYI > 0 >>>> 1
--SAYI < 0 >>>> -1

SELECT SIGN(0)--0

SELECT SIGN(1)--1

SELECT SIGN(13)--1

SELECT SIGN(-234)-- -1

SELECT SIGN(-12)-- -1


--- ### SIGN BÝTÝÞ ### ---


--- ### SQRT BAÞLANGIÇ ### --

--SYNTAX :SQRT ( float_expression )
--Sayýný karekökünü döndürür.
--ÖRNEK :
SELECT SQRT(4)--2
SELECT SQRT(64)--8
SELECT SQRT(16)--4
SELECT SQRT(144)--12
SELECT SQRT(100)--10

--- ### SQRT BÝTÝÞ ### --


--- ### ROUND BAÞLANGIÇ ### --

--SYNTAX: ROUND ( numeric_expression , length [ ,function ] )
--numeric_expression :Yuvarlamak istediðimiz sayý.
--length :Noktadan sonra kaç basamaðýn yuvarlanmasýný istiyoruz.
--[ ,function ] ise sayýyýyý roundalamak mý yoksa truncate mi etmek istiyoruz.
--Default deðer = 0. 0 Ýse round'dur.
--0 haricindekiler ise truncate yapar.

--ÖRNEK :
--Noktadan sonraki iki basamaða yuvarladý.
SELECT ROUND(876.556,2)--876.560--Burada sadece roundluyor.Truncate yapmýyor.(.556'da 5'in yanýnda 6 olduðu için,56 yaptý)
SELECT ROUND(876.556,2,0)--876.560--Burada sadece roundluyor.Truncate yapmýyor.

SELECT ROUND(876.558,2)--round--876.560
SELECT ROUND(876.558,2,0)--round--876.560
SELECT ROUND(876.554,2)--round--876.550 (.554'da 5'in yanýnda 4 olduðu için,ayný býraktý)
SELECT ROUND(876.554,2,0)--round--876.550

--Noktadan sonraki iki basamaða yuvarladý.Ancak ben 3.parametreye 1 dediðim için truncate edecek.
--Truncate þu demek ;noktadan sonraki 2 basamaktan sonrakini dikkate alma.

SELECT ROUND(876.558,2,1)--truncate--876.550
SELECT ROUND(876.553,2,1)--truncate--876.550
SELECT ROUND(876.559,2,1)--truncate--876.550
SELECT ROUND(876.559,2,0)--round--876.560

SELECT ROUND(876.559,1)--876.600
SELECT ROUND(876.549,1)--876.500

--Truncate ediyor.Noktadan sonraki sadece 1 basamak önemli.gerisini, dikkate alma deniyor.
SELECT ROUND(876.559,1,1)--876.500

--'-' DEÐER VERÝRSEK,noktanýn soluna geçer konu. 876'nýn 76 sýný yuvarla demek.
SELECT ROUND(876.559,-2)--900.000
SELECT ROUND(876.559,-1)--880.000
SELECT ROUND(875.559,-1)--880.000
SELECT ROUND(874.559,-1)--870.000

--örnekler:

SELECT ROUND(135.415,2)--135.420
SELECT ROUND(135.415,-1)--140.000
SELECT ROUND(134.415,-1)--130.000
SELECT ROUND(135.415,2,0)--135.420
SELECT ROUND(135.415,2,1)--135.410
SELECT ROUND(135.415,0)--135.000
SELECT ROUND(135.515,0)--136.000







--- ### ROUND BÝTÝÞ ### --