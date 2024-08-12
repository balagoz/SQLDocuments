
-- �LER� JO�NLER --
--Soldaki tablodan e�le�meyenleri getirin?
--Sa�daki tablodan e�le�meyenleri getirin?
--Hem Sa�daki tablodan e�le�meyenleri Hem de soldaki tablodan e�le�meyenleri getirin?



--�RNEK:
SELECT * FROM Ornek.dbo.Cal�san
SELECT * FROM Ornek.dbo.Departmant


--�lk ba�ta Normal LEFT Join Yapal�m :

SELECT * FROM
Ornek.dbo.Cal�san A
LEFT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID


--Soldaki tablodan e�le�meyenleri getirin :
--Yani, sadece soldaki tabloda olanlar� getirice�iz.

SELECT * FROM
Ornek.dbo.Cal�san A
LEFT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID
WHERE B.DepartmantAd� IS NULL;



--Sa�daki tablodan e�le�meyenleri getirin :
--Yani, sadece sa�daki tabloda olanlar� getirice�iz.

SELECT * FROM Ornek.dbo.Cal�san
SELECT * FROM Ornek.dbo.Departmant


SELECT * FROM
Ornek.dbo.Cal�san A
RIGHT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID
WHERE A.DepartmantID IS NULL;


--Her �ki tablodan e�le�meyenleri getir :
--Yani,kesi�im harici olanlar� getirece�iz.
--Yani,sadecesoldaki tabloda ve sa�daki tabloda olanlar� alaca��z.



SELECT
A.Ad,
A.Cinsiyet,
A.Maas,
B.DepartmantAd�
FROM
Ornek.dbo.Cal�san A
FULL JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID
WHERE A.Ad IS NULL OR B.DepartmantAd� IS NULL;









