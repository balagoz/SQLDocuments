--- ### ABS BA�LANGI� ### ---
--SYNTAX :ABS ( numeric_expression ) 
--De�erin mutlak de�erini d�ner.
--�RNEK :
SELECT ABS(-12) -- 12
SELECT ABS(-1) --1
SELECT ABS(0)--0
SELECT ABS(12)--12
SELECT ABS(-1.0), ABS(0.0), ABS(1.0); --1 0 1
SELECT ABS(100-200)--100
SELECT ABS(100*-1)--100


--- ### ABS B�T�� ### ---

--- ### CEILING BA�LANGI� ### ---
--SYNTAX :CEILING ( numeric_expression ) 
--belirtilen say�sal ifadeden b�y�k 
--veya ona e�it en k���k tamsay�y� d�nd�r�r.
--�RNEK :

SELECT CEILING(25.80) -- 26
SELECT CEILING(25) -- 25
SELECT CEILING(25.1) -- 26
SELECT CEILING(32.68) -- 33
SELECT CEILING(-12) -- -12
SELECT CEILING(-12.5) -- -12
SELECT CEILING(-13.5) -- -13
SELECT CEILING(-33.78) -- -33
SELECT CEILING(100.55) -- 101


--- ### CEILING B�T�� ### ---



--- ### EXP BA�LANGI� ### ---
--SYNTAX :EXP ( float_expression )
--Belirtilen ifadesinin �stel de�erini d�nd�r�r.
--e = 2.718281
--�RNEK :

SELECT EXP(2)--7.38905609893065
SELECT 2.718281 * 2.718281 --7.389051594961
SELECT POWER(2.718281,2)--7.389052

--- ### EXP B�T�� ### ---

--- ### LOG10 BA�LANGI� ### ---
--SYNATX :LOG10 ( float_expression )
--ifadenin 10 tabanl� logaritmas�n� d�nd�r�r.

SELECT LOG10(10)--1
SELECT LOG10(100)--2
SELECT LOG10(4.5)--0.653212513775344


--- ### LOG10 B�T�� ### ---

--- ### PI BA�LANGI� ### ---
--SYNATX :PI ( ) 
--PI say�s�n�n de�erini d�ner.

SELECT PI()--3.14159265358979


--- ### PI B�T�� ### ---

--- ### FLOOR BA�LANGI� ### ---


--SYNTAX :FLOOR ( numeric_expression )
--CEILING fonk.tam tersidir.
--Belirtilen say�sal ifadeden k���k veya ona e�it en b�y�k tamsay�y� d�nd�r�r.
--�RNEKLER:
SELECT FLOOR(25.75) -- 25

SELECT FLOOR(25) -- 25

SELECT FLOOR(-13.5) -- -14
SELECT CEILING(-13.5) -- -13

SELECT FLOOR(5.8) -- 5
SELECT FLOOR(-5.8) -- -6
SELECT FLOOR(34.89) -- 34
SELECT CEILING(34.89) -- 35

--- ### FLOOR B�T�� ### ---

--- ### POWER BA�LANGI� ### ---
--SYNTAX :POWER ( float_expression , y )
--�RNEK :Belirtilen say�n�n istedi�imiz say�daki �ss�n� getirir.

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

--- ### POWER B�T�� ### ---

--- ### RAND BA�LANGI� ### ---

--SYNTAX :RAND ( [ seed ] )
--0 �LE 1 ARASINDA B�ZE RASTGELE SAYI D�NER.
--�stedi�imiz rakamlar aras�nda rastgele say� d�nmesini istiyorsak,a�a��daki, formul� kullanaca��z.
--rand()*(b-a)+a;
--b = B�y�k Say�
--a = K���k Say�
--�rnek :

SELECT RAND()
SELECT RAND()*100 -- BU 1 �LE 100 ARASINDA RASTGELE SAYI D�NER.
SELECT RAND()*(10-5)+5
SELECT RAND()*(100-99)+99



--�RNEK : 0 �LE 100 aras�nda 10 tane random say� �retin
DECLARE @say� INT
SET @say� =0

WHILE (@say� < 10)
	BEGIN
		PRINT FLOOR(RAND()*100)
		SET @say� = @say� + 1
	END

--- ### RAND B�T�� ### ---

--- ### SIGN BA�LANGI� ### ---
--SYNTAX :SIGN ( float_expression )
--Say�n�n pozitif mi, negatif mi oldu�unu g�sterir.
--SAYI = 0 >>>> 0
--SAYI > 0 >>>> 1
--SAYI < 0 >>>> -1

SELECT SIGN(0)--0

SELECT SIGN(1)--1

SELECT SIGN(13)--1

SELECT SIGN(-234)-- -1

SELECT SIGN(-12)-- -1


--- ### SIGN B�T�� ### ---


--- ### SQRT BA�LANGI� ### --

--SYNTAX :SQRT ( float_expression )
--Say�n� karek�k�n� d�nd�r�r.
--�RNEK :
SELECT SQRT(4)--2
SELECT SQRT(64)--8
SELECT SQRT(16)--4
SELECT SQRT(144)--12
SELECT SQRT(100)--10

--- ### SQRT B�T�� ### --


--- ### ROUND BA�LANGI� ### --

--SYNTAX: ROUND ( numeric_expression , length [ ,function ] )
--numeric_expression :Yuvarlamak istedi�imiz say�.
--length :Noktadan sonra ka� basama��n yuvarlanmas�n� istiyoruz.
--[ ,function ] ise say�y�y� roundalamak m� yoksa truncate mi etmek istiyoruz.
--Default de�er = 0. 0 �se round'dur.
--0 haricindekiler ise truncate yapar.

--�RNEK :
--Noktadan sonraki iki basama�a yuvarlad�.
SELECT ROUND(876.556,2)--876.560--Burada sadece roundluyor.Truncate yapm�yor.(.556'da 5'in yan�nda 6 oldu�u i�in,56 yapt�)
SELECT ROUND(876.556,2,0)--876.560--Burada sadece roundluyor.Truncate yapm�yor.

SELECT ROUND(876.558,2)--round--876.560
SELECT ROUND(876.558,2,0)--round--876.560
SELECT ROUND(876.554,2)--round--876.550 (.554'da 5'in yan�nda 4 oldu�u i�in,ayn� b�rakt�)
SELECT ROUND(876.554,2,0)--round--876.550

--Noktadan sonraki iki basama�a yuvarlad�.Ancak ben 3.parametreye 1 dedi�im i�in truncate edecek.
--Truncate �u demek ;noktadan sonraki 2 basamaktan sonrakini dikkate alma.

SELECT ROUND(876.558,2,1)--truncate--876.550
SELECT ROUND(876.553,2,1)--truncate--876.550
SELECT ROUND(876.559,2,1)--truncate--876.550
SELECT ROUND(876.559,2,0)--round--876.560

SELECT ROUND(876.559,1)--876.600
SELECT ROUND(876.549,1)--876.500

--Truncate ediyor.Noktadan sonraki sadece 1 basamak �nemli.gerisini, dikkate alma deniyor.
SELECT ROUND(876.559,1,1)--876.500

--'-' DE�ER VER�RSEK,noktan�n soluna ge�er konu. 876'n�n 76 s�n� yuvarla demek.
SELECT ROUND(876.559,-2)--900.000
SELECT ROUND(876.559,-1)--880.000
SELECT ROUND(875.559,-1)--880.000
SELECT ROUND(874.559,-1)--870.000

--�rnekler:

SELECT ROUND(135.415,2)--135.420
SELECT ROUND(135.415,-1)--140.000
SELECT ROUND(134.415,-1)--130.000
SELECT ROUND(135.415,2,0)--135.420
SELECT ROUND(135.415,2,1)--135.410
SELECT ROUND(135.415,0)--135.000
SELECT ROUND(135.515,0)--136.000







--- ### ROUND B�T�� ### --