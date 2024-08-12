--- ### PIVOT BAÞLANGIÇ ### ---

--Tabloyu döndürmek.Satýrlarý kolonlara veya sütunlara dönüþtürmek için kullanýlýr.



--Aþaðýdaki gibi bir tablomuz olsun :
SELECT * FROM Ornek.dbo.SATISSS


--Normal GROUP BY ifadesi Uygulayalým :


SELECT SatýsYapýlanUlke,Satýscý,SUM(SatýsTutarý) FROM Ornek.dbo.SATISSS
GROUP BY SatýsYapýlanUlke,Satýscý



---PIVOT---
--1.YAZIM : Ancak 2.yazým daha çok tercih edilir.
SELECT Satýscý,EN,FR,TR FROM SATISSS
PIVOT
(

SUM(SatýsTutarý)
FOR SatýsYapýlanUlke IN ([EN],[FR],[TR])

)AS PIVOTTABLO



--2.YAZIM :

--PIVOT ÖRNEÐÝ :
--Derived tablo oluþturacaðýz ve Select ifadesinde görmek istediðimiz kolon adlarýný
--ve Agg.iþlem yapacaðýmýz sütunu belirteceðiz.Agg.Ýþlem PVOT ifadesinden sonraki tabloda yapýlmaktadýr.


----1.KISIM
SELECT * FROM
(
SELECT Satýscý,SatýsYapýlanUlke,SatýsTutarý from Ornek.dbo.SATISSS
)AS KaynakTablo
--1.KISIM BÝTÝÞ

PIVOT

--2.KISIM
(
SUM(SatýsTutarý)
FOR SatýsYapýlanUlke IN([EN],[FR],[FR])

) AS PIVOTTABLO

--2.KISIM BÝTÝÞ





--PÝVOT ÝLE BANKA ÖRNEÐÝ----


SELECT * FROM
(

SELECT MusteriID,Urun,Tutar FROM Ornek.dbo.Banka

)AS SOURCE

PIVOT
(
SUM(Tutar) FOR Urun IN([Mevduat],[Kredi],[KMH])


)AS PIVOTTABLO

---------------------------------




---PIVOT BAÞKA ÖRNEK ----


--Aþaðýdaki gibi bir tablomuz olsun :
select * from Ornek.dbo.CATEG


--Pývot için Yapýlacaklar :
--1.adým : Select ifadesini oluþtur.
--2.adým :Derived Table kullan
--3.Adým :Pivotu uygula.

--Select ifadesini agg.fonk.uygulamýycaz.
--Onu pivot'ta uyguluycaz.


SELECT * FROM 
(
SELECT KategoriAdý,UrunAdedi FROM Ornek.dbo.CATEG
)A

PIVOT

(

SUM(UrunAdedi) FOR KategoriAdý IN ([Ayakkabý],[Gomlek],[Canta],[Cuzdan])

)B;












--DATABASE ÖRNEÐÝ--
--Burada hem join yapacaðýz hem de ddaha sonra pivot yapacaðýz.
--1.ADIM : TABLOLARIMIZI TANIYORUZ :


SELECT * FROM Person.Address

SELECT * FROM Person.StateProvince 


SELECT StateProvinceID,AddressID FROM Person.Address A

SELECT StateProvinceID,StateProvinceCode,Name FROM Person.StateProvince B


--2.ADIM : JOIN YAPALIM :
--YIL BAZINDA EYALETLERDEKÝ HANE SAYISINA ULAÞMAYA ÇALIÞIYORUZ.
--JOIN YAPMAMIZIN NEDENÝ ÝSE EYALET ADININ BAÞKA TABLOD OLMASI :
--JOIN 1.HALÝ:
SELECT A.StateProvinceID,B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID

--JOIN 2.HALÝ:
--YIL Bilgisinide alalým Person.Address'tablosundan ve agg.uygulayalým group by ile beraber.


SELECT B.Name,YEAR(A.ModifiedDate),COUNT(A.AddressID) FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY B.Name,YEAR(A.ModifiedDate)

--JOIN 3.HALÝ:Eyalaet isimleri çok uzun olduðu için sadece A ile baþlayanlarý  alýyoruz.

SELECT B.Name,YEAR(A.ModifiedDate),COUNT(A.AddressID) FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
GROUP BY B.Name,YEAR(A.ModifiedDate)
HAVING B.Name LIKE 'A%'


--3.ADIM :Derived Tablo içine alýyorum

SELECT * FROM 
(
SELECT 
B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
WHERE B.Name LIKE 'A%'
)AS KAYNAK

PIVOT
(

COUNT(AddressID) FOR Name IN ([Alabama],[Alberta],[Arizona])

)AS PIVOTTABLO



-----------------------





--Pývot'a yýl bilgisi eklersek :

SELECT * FROM 
(
SELECT 
YEAR(A.ModifiedDate) as Yýl,
B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
WHERE B.Name LIKE 'A%'
)AS K

PIVOT
(

COUNT(AddressID) FOR Name IN ([Alabama],[Alberta],[Arizona])

)AS PIVOTTABLO




--ORDER BY ifadesinide aþaðýdaki gibi kullanabiliriz:

SELECT * FROM 
(
SELECT 
YEAR(A.ModifiedDate) as Yýl,
B.Name,A.AddressID FROM 
Person.Address A
LEFT JOIN 
Person.StateProvince B
ON A.StateProvinceID = B.StateProvinceID
WHERE B.Name LIKE 'A%'
)AS K

PIVOT
(

COUNT(AddressID) FOR Name IN ([Alabama],[Alberta],[Arizona])

)AS PIVOTTABLO

ORDER BY Yýl ASC




--- ### PIVOT BÝTÝÞ ### ---







--- ### UNPIVOT BAÞLANGIÇ ### ---

--Unpivot yapabilemizin þartý þu :
--Eðer Pivot iþleminde herhangibir aggretaed iþlem yoksa yapabiliriz.
--Yani pivot yapmadan önceki orjinal tablomda ne varsa,pivot yaptýktan sonra da bir agg. iþlem görmemiþse yapabiliriz.

--TABLOMUZUN ORÝJÝNAL HALÝ :
SELECT * FROM Ornek.dbo.SATIS1;

--PÝVOT YAPALIM

SELECT * FROM
(
SELECT Temsilci,Ulke,Tutar from Ornek.dbo.SATIS1
) as kaynak

PIVOT
(
SUM(Tutar) FOR Ulke IN ([Turkiye],[Ingiltere])
)AS PIVOTTABLO

-----





--UNPIVOT YAPALIM


--Bu örnekte unpivot yapabiliyorum çünkü aggr.yok.
--Pivot tablosunun tamamýna bir alias veriyorum

SELECT Temsilci,Ulke,Tutar FROM

(
SELECT * FROM
(
SELECT Temsilci,Ulke,Tutar from Ornek.dbo.SATIS1
) as kaynak

PIVOT
(
SUM(Tutar) FOR Ulke IN ([Turkiye],[Ingiltere])
)AS PIVOTTABLO
)p

UNPIVOT
(
Tutar FOR Ulke IN([Turkiye],[Ingiltere])
) AS UNPIVOTTABLE;

------------------------------


--Ama aþaðýdaki tabloda yapamayýz,çünkü data PIVOT yapýlýnca agg.iþlemine maruz kalýcak.


SELECT * FROM Ornek.dbo.SATISSS
--- ### UNPIVOT BÝTÝÞ ### ---


