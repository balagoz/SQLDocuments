
--- CROSS JOIN ---

--Cross join i�leminde 2 tablo aras�ndaki t�m olas� e�le�meler listelenir.
--2 tablonun Kartezyen �arp�m�n� al�r.
--Join �art� kullan�lmaz bu nedenden dolay�.
--Sa� tablodaki her bir sat�r� soldaki tablodaki her sat�rla e�le�tirir diye d���nebiliriz.
--�ki tablodaki sat�rlar� �arparsak CROSS joinden d�necek sat�r sat�y�s�n� buluruz.

--CARTESIAN PRODUCT
-- 6X4 = 24 ( YAN�, TOPLAMDA 24 SATIR D�NECEK.)

select * from Ornek.dbo.OfisCal�san -- 6 SATIR
select * from Ornek.dbo.Departmanlar -- 4 SATIR
select * from Ornek.dbo.Manager
select * from Ornek.dbo.Projeler


SELECT * FROM
Ornek.dbo.OfisCal�san
CROSS JOIN
Ornek.dbo.Departmanlar
ORDER BY Ornek.dbo.OfisCal�san.Ad





-- �rnek:


select * from Ornek.dbo.ADRES

--Adres tablosunda ortak bir kolonumuz yok.


-- SORU : �al��an ad�,departman ad� ve �irket ad�,�irket lokasyonu'nu getirin
--(4 * 1 = 4 sat�r d�necek. 4 sat�r JOIN'den d�nen sat�r adedi,1 sat�rda CROSS JOIN yapt���m�z tablo)


select * from Ornek.dbo.OfisCal�san
select * from Ornek.dbo.Departmanlar 
SELECT * FROM Ornek.dbo.ADRES


--1.ADIM : �al��an ad�,departman ad� istendi�i i�in �lk ba�ta inner join yap�yoruz.(left jo�n de yapabilirdik)
--sonra �irket ad�,�irket lokasyonu da istendi�i i�in CROSS JOIN yapaca��z.




SELECT A.Ad,B.DepartmantAd�,C.S�rketAd�,C.Lokasyon FROM
Ornek.dbo.OfisCal�san A
INNER JOIN
Ornek.dbo.Departmanlar B
ON A.DeptID = B.DeptID
CROSS JOIN
Ornek.dbo.ADRES C




--BA�KA B�R �RNEK--

SELECT * FROM Ornek.dbo.Urun


SELECT * FROM Ornek.dbo.Bedenler



--�RNEK :
SELECT * FROM
Ornek.dbo.Urun
CROSS JOIN
Ornek.dbo.Bedenler














