
--- CROSS JOIN ---

--Cross join iþleminde 2 tablo arasýndaki tüm olasý eþleþmeler listelenir.
--2 tablonun Kartezyen Çarpýmýný alýr.
--Join þartý kullanýlmaz bu nedenden dolayý.
--Sað tablodaki her bir satýrý soldaki tablodaki her satýrla eþleþtirir diye düþünebiliriz.
--Ýki tablodaki satýrlarý çarparsak CROSS joinden dönecek satýr satýyýsýný buluruz.

--CARTESIAN PRODUCT
-- 6X4 = 24 ( YANÝ, TOPLAMDA 24 SATIR DÖNECEK.)

select * from Ornek.dbo.OfisCalýsan -- 6 SATIR
select * from Ornek.dbo.Departmanlar -- 4 SATIR
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler


SELECT * FROM
Ornek.dbo.OfisCalýsan
CROSS JOIN
Ornek.dbo.Departmanlar
ORDER BY Ornek.dbo.OfisCalýsan.Ad





-- Örnek:


select * from Ornek.dbo.ADRES

--Adres tablosunda ortak bir kolonumuz yok.


-- SORU : Çalýþan adý,departman adý ve þirket adý,þirket lokasyonu'nu getirin
--(4 * 1 = 4 satýr dönecek. 4 satýr JOIN'den dönen satýr adedi,1 satýrda CROSS JOIN yaptýðýmýz tablo)


select * from Ornek.dbo.OfisCalýsan
select * from Ornek.dbo.Departmanlar 
SELECT * FROM Ornek.dbo.ADRES


--1.ADIM : Çalýþan adý,departman adý istendiði için Ýlk baþta inner join yapýyoruz.(left joýn de yapabilirdik)
--sonra þirket adý,þirket lokasyonu da istendiði için CROSS JOIN yapacaðýz.




SELECT A.Ad,B.DepartmantAdý,C.SýrketAdý,C.Lokasyon FROM
Ornek.dbo.OfisCalýsan A
INNER JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID
CROSS JOIN
Ornek.dbo.ADRES C




--BAÞKA BÝR ÖRNEK--

SELECT * FROM Ornek.dbo.Urun


SELECT * FROM Ornek.dbo.Bedenler



--ÖRNEK :
SELECT * FROM
Ornek.dbo.Urun
CROSS JOIN
Ornek.dbo.Bedenler














