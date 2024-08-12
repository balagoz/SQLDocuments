

----- UNION VE UNION ALL----




----- ### UNION BAÞLANGIÇ ### ------

--Ýki veya daha fazla SELECT ifadesinden çýkan kümeyi alt altta birleþtirmek için kullanýlýr.
--Sorgularýmýzdaki Kolon sayýsýnýn ayný olmasý gereklidir.
--Kolonlarýmýzdaki veri tiplerinin benzer olmasý gereklidir.
--Alt alta birleþtirmek istediðimiz kolonlarýn sýralarý ayný olmak zorundadýr.
--SYNTAX:

SELECT Kolon1,Kolon2 FROM Tablo Adý
UNION
SELECT Kolon1,Kolon2 FROM Tablo Adý

--Dublicate'ler silinir.
--Dublicate'lerin kalmasý isteniyorsa UNION ALL kullanýcaz.

--INNER JOIN VEYA LEFT joýn kolon bazýnda birleþtirme yapar.Yatay olarak.
--UNION ise satýr bazýnda alt alta birleþtirme yapar.



SELECT * FROM Ornek.dbo.TABLO1


SELECT * FROM Ornek.dbo.TABLO2


--UNION ÝÞLEMÝ :
SELECT ID FROM Ornek.dbo.TABLO1
UNION 
SELECT ID FROM Ornek.dbo.TABLO2



--INNER JOIN

SELECT * FROM
Ornek.dbo.TABLO1 A
INNER JOIN
Ornek.dbo.TABLO2 B
ON A.ID = B.ID



--ÖRNEK :
SELECT * FROM HumanResources.Employee

SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'M'--206 satýr

SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'F' --84 satýr


--290 SATIR DÖNDÜ
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'M'
UNION
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'F'




--ÖRNEK: Unýon sonucundan 290 satýr geri döner.
SELECT BusinessEntityID FROM HumanResources.Employee--290 SATIR
UNION
SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory --316 




--ÖRNEK: Unýon all sonucundan 606 satýr geri döner.
SELECT 290 + 316;

SELECT BusinessEntityID FROM HumanResources.Employee --290 SATIR
UNION all
SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory --316 satýr


--UNION VE ORDER BY

--ORDER BY'I EN SONDA KULLANMAMIZ GEREKLÝDÝR.

SELECT BusinessEntityID FROM HumanResources.Employee --290 SATIR
UNION ALL
SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory
ORDER BY BusinessEntityID

----- ### UNION BÝTÝÞ ### ------






--- ### UNION ALL BAÞLANGIÇ ### ---

SELECT * FROM Ornek.dbo.TABLO1
UNION ALL
SELECT * FROM Ornek.dbo.TABLO2
ORDER BY ID
--- ### UNION ALL BÝTÝÞ ### ---





---### UNION VE UNION ALL GENEL ÖRNEK ###
--GENEL ÖRNEK :

SELECT * FROM Ornek.dbo.TurkiyeMust
SELECT * FROM Ornek.dbo.IngýltereMust


--UNION :
--Tekrarlanan veriler silinir.

SELECT * FROM Ornek.dbo.TurkiyeMust
UNION
SELECT * FROM Ornek.dbo.IngýltereMust

--UNION ALL :
--Tekrarlanan veriler silinmez.

SELECT * FROM Ornek.dbo.TurkiyeMust
UNION ALL
SELECT * FROM Ornek.dbo.IngýltereMust


