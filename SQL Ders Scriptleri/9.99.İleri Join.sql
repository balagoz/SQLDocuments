
-- ÝLERÝ JOÝNLER --
--Soldaki tablodan eþleþmeyenleri getirin?
--Saðdaki tablodan eþleþmeyenleri getirin?
--Hem Saðdaki tablodan eþleþmeyenleri Hem de soldaki tablodan eþleþmeyenleri getirin?



--ÖRNEK:
SELECT * FROM Ornek.dbo.Calýsan
SELECT * FROM Ornek.dbo.Departmant


--Ýlk baþta Normal LEFT Join Yapalým :

SELECT * FROM
Ornek.dbo.Calýsan A
LEFT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID


--Soldaki tablodan eþleþmeyenleri getirin :
--Yani, sadece soldaki tabloda olanlarý getiriceðiz.

SELECT * FROM
Ornek.dbo.Calýsan A
LEFT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID
WHERE B.DepartmantAdý IS NULL;



--Saðdaki tablodan eþleþmeyenleri getirin :
--Yani, sadece saðdaki tabloda olanlarý getiriceðiz.

SELECT * FROM Ornek.dbo.Calýsan
SELECT * FROM Ornek.dbo.Departmant


SELECT * FROM
Ornek.dbo.Calýsan A
RIGHT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID
WHERE A.DepartmantID IS NULL;


--Her Ýki tablodan eþleþmeyenleri getir :
--Yani,kesiþim harici olanlarý getireceðiz.
--Yani,sadecesoldaki tabloda ve saðdaki tabloda olanlarý alacaðýz.



SELECT
A.Ad,
A.Cinsiyet,
A.Maas,
B.DepartmantAdý
FROM
Ornek.dbo.Calýsan A
FULL JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID
WHERE A.Ad IS NULL OR B.DepartmantAdý IS NULL;









