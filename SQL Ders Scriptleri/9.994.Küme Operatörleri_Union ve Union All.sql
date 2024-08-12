

----- UNION VE UNION ALL----




----- ### UNION BA�LANGI� ### ------

--�ki veya daha fazla SELECT ifadesinden ��kan k�meyi alt altta birle�tirmek i�in kullan�l�r.
--Sorgular�m�zdaki Kolon say�s�n�n ayn� olmas� gereklidir.
--Kolonlar�m�zdaki veri tiplerinin benzer olmas� gereklidir.
--Alt alta birle�tirmek istedi�imiz kolonlar�n s�ralar� ayn� olmak zorundad�r.
--SYNTAX:

SELECT Kolon1,Kolon2 FROM Tablo Ad�
UNION
SELECT Kolon1,Kolon2 FROM Tablo Ad�

--Dublicate'ler silinir.
--Dublicate'lerin kalmas� isteniyorsa UNION ALL kullan�caz.

--INNER JOIN VEYA LEFT jo�n kolon baz�nda birle�tirme yapar.Yatay olarak.
--UNION ise sat�r baz�nda alt alta birle�tirme yapar.



SELECT * FROM Ornek.dbo.TABLO1


SELECT * FROM Ornek.dbo.TABLO2


--UNION ��LEM� :
SELECT ID FROM Ornek.dbo.TABLO1
UNION 
SELECT ID FROM Ornek.dbo.TABLO2



--INNER JOIN

SELECT * FROM
Ornek.dbo.TABLO1 A
INNER JOIN
Ornek.dbo.TABLO2 B
ON A.ID = B.ID



--�RNEK :
SELECT * FROM HumanResources.Employee

SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'M'--206 sat�r

SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'F' --84 sat�r


--290 SATIR D�ND�
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'M'
UNION
SELECT BusinessEntityID FROM HumanResources.Employee
WHERE Gender = 'F'




--�RNEK: Un�on sonucundan 290 sat�r geri d�ner.
SELECT BusinessEntityID FROM HumanResources.Employee--290 SATIR
UNION
SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory --316 




--�RNEK: Un�on all sonucundan 606 sat�r geri d�ner.
SELECT 290 + 316;

SELECT BusinessEntityID FROM HumanResources.Employee --290 SATIR
UNION all
SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory --316 sat�r


--UNION VE ORDER BY

--ORDER BY'I EN SONDA KULLANMAMIZ GEREKL�D�R.

SELECT BusinessEntityID FROM HumanResources.Employee --290 SATIR
UNION ALL
SELECT BusinessEntityID FROM HumanResources.EmployeePayHistory
ORDER BY BusinessEntityID

----- ### UNION B�T�� ### ------






--- ### UNION ALL BA�LANGI� ### ---

SELECT * FROM Ornek.dbo.TABLO1
UNION ALL
SELECT * FROM Ornek.dbo.TABLO2
ORDER BY ID
--- ### UNION ALL B�T�� ### ---





---### UNION VE UNION ALL GENEL �RNEK ###
--GENEL �RNEK :

SELECT * FROM Ornek.dbo.TurkiyeMust
SELECT * FROM Ornek.dbo.Ing�ltereMust


--UNION :
--Tekrarlanan veriler silinir.

SELECT * FROM Ornek.dbo.TurkiyeMust
UNION
SELECT * FROM Ornek.dbo.Ing�ltereMust

--UNION ALL :
--Tekrarlanan veriler silinmez.

SELECT * FROM Ornek.dbo.TurkiyeMust
UNION ALL
SELECT * FROM Ornek.dbo.Ing�ltereMust


