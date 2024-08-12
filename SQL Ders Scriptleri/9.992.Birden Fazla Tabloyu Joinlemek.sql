

----BÝRDEN FAZLA TABLO JOIÝNLEME ---

--Soru : Tüm çalýþanlar,onlarýn managerlarý,departmanlarý,ve projeleri gelsin.


select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler

--Bizden tüm çalýþanlarýn bilgisi isteniyor.Dolayýsýyla veri kaybý olmamasý için LEFT join yapacaðýz.
--Böylece soldaki tablomdaki tüm veriler gelmiþ oalcak.






select
O.Ad,
D.DepartmantAdý,
M.ManagerAdý,
P.ProjeAdý
from 
Ornek.dbo.OfisCalýsan O
LEFT JOIN -- inner join dersek veri kaybý olur
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID
LEFT JOIN
Ornek.dbo.Projeler P
ON O.CalýsanID = P.ProjedeCalýsanlar


--Ýlk baþta OfisCalýsan ile Departmanlar tablosunu joinleyelim:

SELECT * FROM 
Ornek.dbo.OfisCalýsan O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID


--Þimdi ise bu joinlenmiþ sonucumun yanýna managerlerle ilgili tabloyu joinleyeceðim:
SELECT * FROM 
Ornek.dbo.OfisCalýsan O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID


--Þimdi ise son joinimizi yapýyoruz:

SELECT * FROM 
Ornek.dbo.OfisCalýsan O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID
LEFT JOIN
Ornek.dbo.Projeler P
ON O.CalýsanID = P.ProjedeCalýsanlar


--Artýk tüm tablolarým yan yana.Ýstediðim tablodan istediðim sütunu getirebilirim.

SELECT 
O.Ad,
D.DepartmantAdý,
M.ManagerAdý,
P.ProjeAdý
FROM 
Ornek.dbo.OfisCalýsan O
LEFT JOIN
Ornek.dbo.Departmanlar D
ON O.DeptID = D.DeptID
LEFT JOIN
Ornek.dbo.Manager M
ON O.ManagerID = M.ManagerID
LEFT JOIN
Ornek.dbo.Projeler P
ON O.CalýsanID = P.ProjedeCalýsanlar




