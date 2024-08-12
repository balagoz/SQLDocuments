


--- ### CROSS APPLY VE OUTER APPLY ### ---

--Inner join'i tablo deðeri dönen bir fonksiyonla yapamayýz.
--Bu gibi durumlarda Cross Apply ve Outer Apply kullanmak zorundayýz.
--

SELECT * FROM Ornek.dbo.EMPPP

SELECT * FROM Ornek.dbo.DEPTTT




----BU iki tabloyu kullanarak INNER JOIN yapabiliriz ----

SELECT * FROM 
Ornek.dbo.EMPPP A
INNER JOIN
Ornek.dbo.DEPTTT B
ON A.DepartmandID = B.ID

----------------------------------




--Diyelim ki, bizim emppp tablosuna ulaþýmýmýz yok.Onun yerine bize ayný sonucu veren bir
--tablo deðer dönen bir fonk.verdiler.
--Biz dept ID'yi girelim ve bize o departmanda çalýþanlarýn sonucunu getirsin.
--Fonk.Yaratlým:

CREATE FUNCTION fn_deneme
(@DepartmandID INT)
RETURNS TABLE
AS
RETURN


(
SELECT * FROM Ornek.dbo.EMPPP
WHERE DepartmandID = @DepartmandID

);



SELECT * FROM fn_deneme (1);

--Diyelim ki biz,DEPPTTT Tablosyuyla bu tablo deðer dönen fonk. joinliyeceðiz.
--Bu durumda inner veya left join kullanamayýz.Hata alýrýz.
--Cross apply ve outer apply kavramlarý burada ortaya çýkmaktadýr.


---CROSS APPLY--
--cross apply, inner join gibi,
--outer apply ise left join gibi davranacak.

SELECT * FROM Ornek.dbo.DEPTTT
SELECT * FROM Ornek.dbo.EMPPP


---Aþaðýdaki gibi join condition (ON) yazmayacaðýz.Çünkü zaten Department ID'yi DEPPTTT tablosundan alacak.
SELECT * FROM
Ornek.dbo.DEPTTT A
CROSS APPLY
fn_deneme(A.ID) B
ON A.ID=B.DepartmandID;
-----




---DOÐRU HALÝ: INNER JOIN GÝBÝ DAVRANDI
SELECT * FROM
Ornek.dbo.DEPTTT A
CROSS APPLY
fn_deneme(A.ID) B;


--NORMAL JOIN :
SELECT * FROM 
Ornek.dbo.EMPPP A
INNER JOIN
Ornek.dbo.DEPTTT B
ON A.DepartmandID = B.ID
----------------------------------------------


---DOÐRU HALÝ: LEFT JOIN GÝBÝ DAVRANDI
SELECT * FROM
Ornek.dbo.DEPTTT A
OUTER APPLY
fn_deneme(A.ID) B;


-- Görüldüðü gibi normal iki tablyu joinlemiþiz gibi Ayný Sonucu Üretti.


