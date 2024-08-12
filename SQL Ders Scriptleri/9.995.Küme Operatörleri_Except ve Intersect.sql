


--- ### EXCEPT BA�LANGI� ### ---




--Sorgular�m�zdaki kolon say�s�,s�ras� ve veri tipi ayn� olmal�d�r.
--Soldaki tabloda olup da sa�daki tabloda veya sorguda olmayan unique de�erleri d�ner.
--Order By'� gene en sonda kullanmak zorunday�z.


--SYNTAX :

--�lk tabloda olup, 2.tabloda olmayan de�erleri d�ner..
--�RNEK1:
SELECT * FROM Ornek.dbo.TABLO1
EXCEPT
SELECT * FROM Ornek.dbo.TABLO2

--�RNEK2:
SELECT * FROM Ornek.dbo.TABLO2
EXCEPT
SELECT * FROM Ornek.dbo.TABLO1



--�RNEK :

SELECT * FROM Ornek.dbo.TABLOA

SELECT * FROM Ornek.dbo.TABLOB


--Soldaki tabloda olup,sa�daki tabloda olmayan unique de�erleri d�ner :
SELECT * FROM Ornek.dbo.TABLOA --1,2,3,4,5
EXCEPT
SELECT * FROM Ornek.dbo.TABLOB --4,5,6,7,8




--�imdi tablolar�m�z�n yerini de�i�tirip,�yle uygulayal�m.
--Soldaki tabloda olup,sa�daki tabloda olmayan unique de�erleri d�ner :
SELECT * FROM Ornek.dbo.TABLOB --4,5,6,7,8
EXCEPT
SELECT * FROM Ornek.dbo.TABLOA--1,2,3,4,5



--A��a�daki gibi bir tablomuz olsun.
--�u ana kadar 2 farkl� tablo kulland�k.
--Peki tek bir kullansak yapabilir miyiz?

SELECT * FROM Ornek.dbo.KurumsalCal�sanlar
ORDER BY Maas DESC



--Maa�� 7000 ile 8000 aras�nda olanlar gelir.


SELECT * FROM Ornek.dbo.KurumsalCal�sanlar
WHERE Maas >=7000
except
SELECT * FROM Ornek.dbo.KurumsalCal�sanlar
WHERE Maas >=8000;


--- ### EXCEPT B�T�� ### ---





--- ### INTERSECT BA�LANGI� ### ---
--2 SELECT ifadesindeki ortak datalar� d�ner.
--Sadece kesi�im k�mesini d�ner diye de d���nebiliriz.
--Order By'� gene en sonunda kullanmal�y�z.
--Intersect kesi�imi al�r ama UNIQUE de�er d�ner.�oklama varsa onu siler.
--Inner join ise dublicate de�erleri korur.
--Inner joinin Intersect gibi davranmas� i�in DISTINCT uygulamal�y�z e�er tekrarlanan bir de�er varsa tabloda.



--A�a��daki gibi 2 tablomuz olsun :


SELECT * FROM Ornek.dbo.TABLOX  -- 1,2,3


SELECT * FROM Ornek.dbo.TABLOY -- 2,3,4,2



--Intersect Ugulayal�m:
SELECT * FROM Ornek.dbo.TABLOX 
INTERSECT
SELECT * FROM Ornek.dbo.TABLOY 



--Sadece Inner Join Yapsayd�k :
--BURADA �OKLU OLARAK GEL�YOR.O Y�ZDEN ALLTAK� G�B� DISTINCT kullanmal�y�z.
SELECT A.ID FROM
Ornek.dbo.TABLOX A
INNER JOIN
Ornek.dbo.TABLOY B
ON A.ID =B.ID


---INNER JOIN DISTINCT �RNE��
SELECT * FROM Ornek.dbo.TABLOX A
SELECT * FROM Ornek.dbo.TABLOY B




SELECT * FROM Ornek.dbo.TABLOX A
INTERSECT
SELECT * FROM Ornek.dbo.TABLOY B


--Distinct ile Beraber Uygularsak Intersect ile Ayn� sonuca Ula��r�z.
SELECT DISTINCT(A.ID) FROM
Ornek.dbo.TABLOX A
JOIN
Ornek.dbo.TABLOY B
ON A.ID=B.ID;

--- ### INTERSECT B�T�� ### ---






----UNION - EXCEPT - INTERSECT �ZET ----
--UNION birle�tirken tekrarlananlar� almad�.


SELECT * FROM Ornek.dbo.TABLOA
UNION
SELECT * FROM Ornek.dbo.TABLOB


--UNION ALL ile birle�tirken tekrarlananlar� ald�.


SELECT * FROM Ornek.dbo.TABLOA
UNION ALL
SELECT * FROM Ornek.dbo.TABLOB




--EXCEPT :

SELECT * FROM Ornek.dbo.TABLOA
EXCEPT
SELECT * FROM Ornek.dbo.TABLOB



--INTERSECT :


SELECT * FROM Ornek.dbo.TABLOA
INTERSECT
SELECT * FROM Ornek.dbo.TABLOB



--- ### INTERSECT B�T�� ### ---
