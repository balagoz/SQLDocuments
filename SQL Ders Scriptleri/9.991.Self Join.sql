

-- SELF JOIN --
--Þu ana kadar hep 2 farklý tabloyu joinledik.
--Þimdi tabloyu kendisiyle joinleyeceðiz.
--Aradýðýmýz kolonla ilgili tablomuzun içerisinde de olabilir.



select * from Ornek.dbo.Aile


select Kucuk.Ad,Kucuk.YAS,Buyuk.Ad,Buyuk.YAS from 
Ornek.dbo.Aile Kucuk
INNER JOIN
Ornek.dbo.Aile Buyuk
ON Kucuk.ANNEBABA = Buyuk.AileUyeID




----------------------------------------

---BAÞKA ÖRNEK---
--Sadece INNER SELF JOIN yapmak zorunda deðiliz.Diðer Join türlerini de uygulayabiliriz.
--INNER SELF JOIN,LEFT SELF JOIN,CROSS SELF JOIN,

SELECT * FROM Ornek.dbo.Sirket

SELECT A.Ad as "Çalýþan",B.Ad AS "Mudur" FROM
Ornek.dbo.Sirket A
LEFT JOIN
Ornek.dbo.Sirket B
ON A.ManagerID = B.CalýsanID



SELECT A.Ad as "Çalýþan",B.Ad AS "Mudur" FROM
Ornek.dbo.Sirket A
INNER JOIN
Ornek.dbo.Sirket B
ON A.ManagerID = B.CalýsanID



