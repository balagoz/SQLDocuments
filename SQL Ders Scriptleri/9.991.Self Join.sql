

-- SELF JOIN --
--�u ana kadar hep 2 farkl� tabloyu joinledik.
--�imdi tabloyu kendisiyle joinleyece�iz.
--Arad���m�z kolonla ilgili tablomuzun i�erisinde de olabilir.



select * from Ornek.dbo.Aile


select Kucuk.Ad,Kucuk.YAS,Buyuk.Ad,Buyuk.YAS from 
Ornek.dbo.Aile Kucuk
INNER JOIN
Ornek.dbo.Aile Buyuk
ON Kucuk.ANNEBABA = Buyuk.AileUyeID




----------------------------------------

---BA�KA �RNEK---
--Sadece INNER SELF JOIN yapmak zorunda de�iliz.Di�er Join t�rlerini de uygulayabiliriz.
--INNER SELF JOIN,LEFT SELF JOIN,CROSS SELF JOIN,

SELECT * FROM Ornek.dbo.Sirket

SELECT A.Ad as "�al��an",B.Ad AS "Mudur" FROM
Ornek.dbo.Sirket A
LEFT JOIN
Ornek.dbo.Sirket B
ON A.ManagerID = B.Cal�sanID



SELECT A.Ad as "�al��an",B.Ad AS "Mudur" FROM
Ornek.dbo.Sirket A
INNER JOIN
Ornek.dbo.Sirket B
ON A.ManagerID = B.Cal�sanID



