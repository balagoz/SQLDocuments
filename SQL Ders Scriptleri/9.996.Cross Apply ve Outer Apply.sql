


--- ### CROSS APPLY VE OUTER APPLY ### ---

--Inner join'i tablo de�eri d�nen bir fonksiyonla yapamay�z.
--Bu gibi durumlarda Cross Apply ve Outer Apply kullanmak zorunday�z.
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




--Diyelim ki, bizim emppp tablosuna ula��m�m�z yok.Onun yerine bize ayn� sonucu veren bir
--tablo de�er d�nen bir fonk.verdiler.
--Biz dept ID'yi girelim ve bize o departmanda �al��anlar�n sonucunu getirsin.
--Fonk.Yaratl�m:

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

--Diyelim ki biz,DEPPTTT Tablosyuyla bu tablo de�er d�nen fonk. joinliyece�iz.
--Bu durumda inner veya left join kullanamay�z.Hata al�r�z.
--Cross apply ve outer apply kavramlar� burada ortaya ��kmaktad�r.


---CROSS APPLY--
--cross apply, inner join gibi,
--outer apply ise left join gibi davranacak.

SELECT * FROM Ornek.dbo.DEPTTT
SELECT * FROM Ornek.dbo.EMPPP


---A�a��daki gibi join condition (ON) yazmayaca��z.��nk� zaten Department ID'yi DEPPTTT tablosundan alacak.
SELECT * FROM
Ornek.dbo.DEPTTT A
CROSS APPLY
fn_deneme(A.ID) B
ON A.ID=B.DepartmandID;
-----




---DO�RU HAL�: INNER JOIN G�B� DAVRANDI
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


---DO�RU HAL�: LEFT JOIN G�B� DAVRANDI
SELECT * FROM
Ornek.dbo.DEPTTT A
OUTER APPLY
fn_deneme(A.ID) B;


-- G�r�ld��� gibi normal iki tablyu joinlemi�iz gibi Ayn� Sonucu �retti.


