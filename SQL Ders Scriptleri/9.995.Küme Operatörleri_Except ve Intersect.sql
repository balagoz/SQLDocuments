


--- ### EXCEPT BAÞLANGIÇ ### ---




--Sorgularýmýzdaki kolon sayýsý,sýrasý ve veri tipi ayný olmalýdýr.
--Soldaki tabloda olup da saðdaki tabloda veya sorguda olmayan unique deðerleri döner.
--Order By'ý gene en sonda kullanmak zorundayýz.


--SYNTAX :

--Ýlk tabloda olup, 2.tabloda olmayan deðerleri döner..
--ÖRNEK1:
SELECT * FROM Ornek.dbo.TABLO1
EXCEPT
SELECT * FROM Ornek.dbo.TABLO2

--ÖRNEK2:
SELECT * FROM Ornek.dbo.TABLO2
EXCEPT
SELECT * FROM Ornek.dbo.TABLO1



--ÖRNEK :

SELECT * FROM Ornek.dbo.TABLOA

SELECT * FROM Ornek.dbo.TABLOB


--Soldaki tabloda olup,saðdaki tabloda olmayan unique deðerleri döner :
SELECT * FROM Ornek.dbo.TABLOA --1,2,3,4,5
EXCEPT
SELECT * FROM Ornek.dbo.TABLOB --4,5,6,7,8




--Þimdi tablolarýmýzýn yerini deðiþtirip,öyle uygulayalým.
--Soldaki tabloda olup,saðdaki tabloda olmayan unique deðerleri döner :
SELECT * FROM Ornek.dbo.TABLOB --4,5,6,7,8
EXCEPT
SELECT * FROM Ornek.dbo.TABLOA--1,2,3,4,5



--Aþðaýdaki gibi bir tablomuz olsun.
--Þu ana kadar 2 farklý tablo kullandýk.
--Peki tek bir kullansak yapabilir miyiz?

SELECT * FROM Ornek.dbo.KurumsalCalýsanlar
ORDER BY Maas DESC



--Maaþý 7000 ile 8000 arasýnda olanlar gelir.


SELECT * FROM Ornek.dbo.KurumsalCalýsanlar
WHERE Maas >=7000
except
SELECT * FROM Ornek.dbo.KurumsalCalýsanlar
WHERE Maas >=8000;


--- ### EXCEPT BÝTÝÞ ### ---





--- ### INTERSECT BAÞLANGIÇ ### ---
--2 SELECT ifadesindeki ortak datalarý döner.
--Sadece kesiþim kümesini döner diye de düþünebiliriz.
--Order By'ý gene en sonunda kullanmalýyýz.
--Intersect kesiþimi alýr ama UNIQUE deðer döner.Çoklama varsa onu siler.
--Inner join ise dublicate deðerleri korur.
--Inner joinin Intersect gibi davranmasý için DISTINCT uygulamalýyýz eðer tekrarlanan bir deðer varsa tabloda.



--Aþaðýdaki gibi 2 tablomuz olsun :


SELECT * FROM Ornek.dbo.TABLOX  -- 1,2,3


SELECT * FROM Ornek.dbo.TABLOY -- 2,3,4,2



--Intersect Ugulayalým:
SELECT * FROM Ornek.dbo.TABLOX 
INTERSECT
SELECT * FROM Ornek.dbo.TABLOY 



--Sadece Inner Join Yapsaydýk :
--BURADA ÇOKLU OLARAK GELÝYOR.O YÜZDEN ALLTAKÝ GÝBÝ DISTINCT kullanmalýyýz.
SELECT A.ID FROM
Ornek.dbo.TABLOX A
INNER JOIN
Ornek.dbo.TABLOY B
ON A.ID =B.ID


---INNER JOIN DISTINCT ÖRNEÐÝ
SELECT * FROM Ornek.dbo.TABLOX A
SELECT * FROM Ornek.dbo.TABLOY B




SELECT * FROM Ornek.dbo.TABLOX A
INTERSECT
SELECT * FROM Ornek.dbo.TABLOY B


--Distinct ile Beraber Uygularsak Intersect ile Ayný sonuca Ulaþýrýz.
SELECT DISTINCT(A.ID) FROM
Ornek.dbo.TABLOX A
JOIN
Ornek.dbo.TABLOY B
ON A.ID=B.ID;

--- ### INTERSECT BÝTÝÞ ### ---






----UNION - EXCEPT - INTERSECT ÖZET ----
--UNION birleþtirken tekrarlananlarý almadý.


SELECT * FROM Ornek.dbo.TABLOA
UNION
SELECT * FROM Ornek.dbo.TABLOB


--UNION ALL ile birleþtirken tekrarlananlarý aldý.


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



--- ### INTERSECT BÝTÝÞ ### ---
