

----B�RDEN FAZLA TABLO JOI�NLEME ---

--Soru : T�m �al��anlar,onlar�n managerlar�,departmanlar�,ve projeleri gelsin.


select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler

--Bizden t�m �al��anlar�n bilgisi isteniyor.Dolay�s�yla veri kayb� olmamas� i�in LEFT join yapaca��z.
--B�ylece soldaki tablomdaki t�m veriler gelmi� oalcak.






select
O.Ad,
D.DepartmantAd�,
M.ManagerAd�,
P.ProjeAd�
from 
Ornek.dbo.OfisCal�san O
LEFT JOIN -- inner join dersek veri kayb� olur
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID
LEFT JOIN
Ornek.dbo.Projeler P
ON O.Cal�sanID = P.ProjedeCal�sanlar


--�lk ba�ta OfisCal�san ile Departmanlar tablosunu joinleyelim:

SELECT * FROM 
Ornek.dbo.OfisCal�san O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID


--�imdi ise bu joinlenmi� sonucumun yan�na managerlerle ilgili tabloyu joinleyece�im:
SELECT * FROM 
Ornek.dbo.OfisCal�san O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID


--�imdi ise son joinimizi yap�yoruz:

SELECT * FROM 
Ornek.dbo.OfisCal�san O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID
LEFT JOIN
Ornek.dbo.Projeler P
ON O.Cal�sanID = P.ProjedeCal�sanlar


--Art�k t�m tablolar�m yan yana.�stedi�im tablodan istedi�im s�tunu getirebilirim.

SELECT 
O.Ad,
D.DepartmantAd�,
M.ManagerAd�,
P.ProjeAd�
FROM 
Ornek.dbo.OfisCal�san O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID
LEFT JOIN
Ornek.dbo.Projeler P
ON O.Cal�sanID = P.ProjedeCal�sanlar




