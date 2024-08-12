
--Window Fonksiyonlarý Genel - OVER Ýfadesi -- FirstValue -- LastValue -- Lead -- Lag -- Kümülatif Toplam--


-- ### Window Fonk ve OVER Clause BAÞLANGIÇ ### --

--SYNTAX : Function()OVER(Partition By Kolon1,Kolon2...)

--Partition By ifadesi ile birlikte kullanýldýðýnda data'yý sýnýflara bölmeye yarar.
--COUNT,SUM,MIN,MAX,ROWNUMBER,RANK,DENSERANK VS...gibi ifadelerle kullanýlabilir.

--Tablonun orijinal hali bozulmadan ve group by ifadesi kullanmadan istediðimiz agg.fonk ve sýnýf ile birlikte çalýþabiliriz.
--OVER ifadesi kullandýðýmýz için ve yanýnda agg.fonk'da kullanýrsak örneðin MAX fonksiyonu gibi,
--SQL MAX fonksiyonuna agg.fonk.muamelesi yapmýyor.Max'a window fonk.muamelesi yapýyor.


--Eðer over()'da parantez içerisinde bir þey belirtmezsek,SQL Tüm satýrlar için bir window yani pencere yaratýr.
--Eðer bir sýnýflama yaratmak istiyorsam, ve örneðin her departmanýn MAX maas'ýný bulmak istiyorsak
--o zaman Partition By ifadesi kullanmak zorundayýz.



--ÖRNEK:

SELECT * FROM [HumanResources].[Employee]



--Orijinal Tablomuz :
SELECT
[BusinessEntityID],
[Gender]
FROM [HumanResources].[Employee]

--GROUP BY Ýle:
SELECT
[Gender],
COUNT([BusinessEntityID])
FROM [HumanResources].[Employee]
GROUP BY[Gender] 

--ÖRNEK :
--GROUP BY KULLANMIYORUZ DÝKKAT EDERSEK:
SELECT
DISTINCT(Gender),
COUNT([BusinessEntityID])OVER(PARTITION BY [Gender])
FROM [HumanResources].[Employee]

--PARTITION BY ifadesi kullanmadan :
SELECT
[BusinessEntityID],
Gender,
COUNT([BusinessEntityID])OVER()
FROM [HumanResources].[Employee]

/*

SELECT
[BusinessEntityID],
Gender,
COUNT([BusinessEntityID])OVER()
FROM [HumanResources].[Employee]


SELECT
[BusinessEntityID],
Gender,
COUNT([BusinessEntityID])OVER(PARTITION BY [Gender])
FROM [HumanResources].[Employee]

Over ifadesi kullanýldýðý için artýk count için group by istenmedi 
ve sql bize sanki group by ifadesi uygulanýyormuþ gibi
over la birlikte açýtðý pencerede gruop by 'dan çýkan sonuçlarý yazdýrabilmesini saðladý.
Amaç non.agg.datanýn yapýsýný bozmadan, agg.fonk'ýn ve groupy by ifadesinin yapabildiklerini yapmak.

*/





--ÖRNEK :

--Orijinal Tablomuz:
Select * from Ornek.dbo.SýralamaRank

Select
Cinsiyet,
COUNT(*) AS ADET,
AVG(Maas)AS ORT,
MIN(Maas)AS MIN,
MAX(Maas)AS MAX
from Ornek.dbo.SýralamaRank
GROUP BY Cinsiyet

--Yukarda group by kullandýk ama ben group by kullanmadan 
--non aggregared datayýda görmek istiyorum ve cinsiyet 
--ile ilgili min max vs gibi deðerleri de görmek istiyorum.
--O zaman Ne yapacaðýz?




Select
DISTINCT(Cinsiyet),
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
AVG(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetOrtMaas,
MIN(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetMýnMaas,
MAX(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetMaxMaas,
SUM(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetToplam
from Ornek.dbo.SýralamaRank;

-- WINDOW FONKSÝYON YARDIMIYLA YAZALIM :

/*

Select
Ad,
Cinsiyet,
Maas,
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
COUNT(Cinsiyet)over() AS ToplamCinsiyetAdet
from Sýralama;


Select Cinsiyet,count(Ad)from Sýralama
group by Cinsiyet

*/



--BAÞKA ÖRNEK :
Select
Ad,
Cinsiyet,
Maas,
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
COUNT(Cinsiyet)over() AS ToplamCinsiyetAdet
from Ornek.dbo.SýralamaRank;




--BAÞKA ÖRNEK :
Select
Ad,
Cinsiyet,
Maas,
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
AVG(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetOrtMaas,
MIN(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetMýnMaas,
MAX(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetMaxMaas,
SUM(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetToplam
from Ornek.dbo.SýralamaRank;



--OVER Ýçerisinde Partiton By Kullanmadan :
-- SQL alýnda bize þöyle diyor :
--Ben sana over kullandýðýn için group by kullanmadan ve overýn içinde hiç bir þey kullanmadýðýn 
--için tüm data için ayrý bir pencere açýyorum iþlemlerini orada yap.

Select
*,
MAX(Maas)OVER(),
MIN(Maas)OVER()
from Ornek.dbo.SýralamaRank;

--OVER Ýçerisinde Partiton By Kullanarak :
Select
*,
MAX(Maas)OVER(),
MIN(Maas)OVER(),
MAX(Maas)OVER(PARTITION BY Cinsiyet)
from Ornek.dbo.SýralamaRank;



-- ### Window Functions Genel ###--
/*

Window Fonksiyonlarý Temel olarak 3'e ayýrabiliriz.
1 - Aggregata Fonk.ile kullanabiliriz. SUM,AVG,MIN,MAX vs..
2 - Sýralama Ýçin kullanabiliriz.
3 - Analitik Fonk ile beraber kullanabiliriz (FisrtValue,Lead,Lag vs gibi)
OVER clause'in içinde Partitioning ve Order by ile sýralama yapabiliriz.
Rows ve Range Clause'larý var.Bunlar partiton içersindeki satýrlarý sýnýrlamak baþlangýç 
ve bitiþ satýrýný belirlemek için kullandýðýmýz ifadeler.
DEFAULT olarak : RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW kullanýlýr.

*/


--AGG.FONK ÝLE BERABER PARTITON BY KULLANMADAN,ORDER BY 
Select
*,
AVG(Maas)OVER(ORDER BY Maas),
SUM(Maas)OVER(ORDER BY Maas)
-- Biz burada her satýrda aslýnda gelen ort.yý bekliyoruz ancak Defaultu kullandýðý için böyle geliyor.
--Yani kendisi ve öncekindeki SATIRLARIN ortalamasýný alýyor.
from Ornek.dbo.SýralamaRank;



SELECT (600 + 3000 + 3500) / 3;

--Bunun düzelmesini istiyorsak 1.YOL:
--ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ifadesini koymamýz lazým.
Select
*,
AVG(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), --Saðdakinin ayný haline geliyor.--AVG(Maas)OVER()
SUM(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
from Ornek.dbo.SýralamaRank;


--Bunun düzelmesini istiyorsak 2.YOL:
--Over()içerisinde herhangibir order by kullanmayacaðýz.Bu yöntem bize zaten ayný sonucu zaten getiriyor.
Select
*,
AVG(Maas)OVER(),
AVG(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
SUM(Maas)OVER(),
SUM(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
COUNT(Maas)OVER(),
COUNT(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
from Ornek.dbo.SýralamaRank;
;


--PARTITION ÝLE Birlikte Kullanýmý 1.YOL:
Select
*,
AVG(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
COUNT(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
from Ornek.dbo.SýralamaRank;




--PARTITION ÝLE Birlikte Kullanýmý 2.YOL:
--Ayný sonucu verir sadece tek baþýna Partition by kullanýyoruz.
Select
*,
AVG(Maas)OVER(PARTITION BY Cinsiyet),
SUM(Maas)OVER(PARTITION BY Cinsiyet),
COUNT(Maas)OVER(PARTITION BY Cinsiyet)
from Ornek.dbo.SýralamaRank;

--ÝSTEDÝÐÝMÝZ GÝBÝ ROWS BETWEEN FOLLOWING VE PRECEDING YAZABÝLÝRÝZ:



Select
*,
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
from Ornek.dbo.SýralamaRank;


-- ### Window Fonk ve OVER Clause BÝTÝÞ ### --




-- ### FirstValue Baþlangýç ### --

--Belirtilen koþullardaki ilk satýrdaki deðeri getirir.Sonuç order by ifadesine göre deðiþir.
--Order By ifadesi zorunludur.
--Partition By ifadesi opsiyoneldir.
--FIRST_VALUE()--Parantez içine bir argüman alýr.

--ÖRNEK :

--ORJÝNAL TABLOMUZ :
SELECT * FROM Ornek.dbo.SýralamaRank;

SELECT
*,
FIRST_VALUE(AD)OVER(ORDER BY MAAS DESC),--En yüksek Maaþý alan Kiþi
FIRST_VALUE(AD)OVER(ORDER BY MAAS ASC)--En Düþük Maaþý alan Kiþi
FROM Ornek.dbo.SýralamaRank;

--ÖRNEK : Partition By Ýle

SELECT
*,
FIRST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS DESC),--En yüksek Maaþý alan Kiþi
FIRST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS ASC)--En Düþük Maaþý alan Kiþi
FROM Ornek.dbo.SýralamaRank;



--Örnek :


Select
[ProductID],
[Name],
[Color],
[ListPrice],
FIRST_VALUE(Name)OVER(PARTITION BY Color ORDER BY ListPrice Desc) AS MAXFÝYATURUN,
FIRST_VALUE(Name)OVER(PARTITION BY Color ORDER BY ListPrice ASC) AS MINFÝYATURUN
from Production.Product
WHERE Color IS NOT NULL AND ListPrice <>0


-- ### FirstValue Bitiþ ### ---



-- ### LastValue Baþlangýç ### --


--Belirtilen koþullardaki son satýrdaki deðeri getirir.Sonuç order by ifadesine göre deðiþir
--Order By ifadesi zorunludur.
--Partition By ifadesi opsiyoneldir.
--LAST_VALUE()--Parantez içine bir argüman alýr.
--Sorgunun doðru çalýþmasý için 'ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING' kullanmamýz gerek.

--Örnek :
SELECT
*,
LAST_VALUE(AD)OVER(ORDER BY MAAS DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM Ornek.dbo.SýralamaRank;



--Örnek : --AYNI SONUCA FIRST VALUE ÝFADESÝ ÝLE DE ULAÞABÝLÝRÝZ.


SELECT
*,
LAST_VALUE(AD)OVER(ORDER BY MAAS DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
FIRST_VALUE(AD)OVER(ORDER BY MAAS ASC)
FROM Ornek.dbo.SýralamaRank;



--Örnek : PARITITON BY ÝLE 

SELECT
*,
LAST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM Ornek.dbo.SýralamaRank;

-- ### LastValue Bitiþ ### --




--- ### LEAD - LAG BAÞLANGIÇ ### ---
--Lead fonk.kendisinden sonraki veriyi görmek için kullanýrýz.
--Lag fonk.kendisinden önceki veriyi görmek için kullanýrýz.
--Order By gereklidir.
--Partition kullanýmý opsiyoneldir.

--SYNTAX : LEAD (Kolon Adý,Offset,Default Deðer)OVER (ORDER BY kolon1,kolon2....)
		-- LAG (Kolon Adý,Offset,Default Deðer)OVER (ORDER BY kolon1,kolon2....)

--Offset : Offset'in defaut deðeri 1'dir.LEAD(maas) = LEAD(maas,1)
--Default Deðer: Herhangibir deðer belirtilmemiþse NULL gelir.Ofset, bölümün kapsamý dýþýnda olduðunda 
--döndürülecek deðer. Varsayýlan bir deðer belirtilmezse, NULL döndürülür.

SELECT * FROM Ornek.dbo.SýralamaRank;

--ÖRNEK :

SELECT
*,
LEAD(Maas)over(ORDER BY Maas DESC),
LEAD(Maas,1)over(ORDER BY Maas DESC),
LEAD(Maas,2,-1)over(ORDER BY Maas DESC),
LEAD(Maas,2,1)over(ORDER BY Maas DESC),
LEAD(Maas,1,-1)over(ORDER BY Maas DESC)
FROM Ornek.dbo.SýralamaRank;




SELECT
*,
LAG(Maas)over(ORDER BY Maas DESC),
LAG(Maas,1)over(ORDER BY Maas DESC),
LAG(Maas,2)over(ORDER BY Maas DESC),
LAG(Maas,2,-1)over(ORDER BY Maas DESC)
FROM Ornek.dbo.SýralamaRank;;


--PARTITON BY ÝLE:
SELECT
*,
LEAD(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LEAD(Maas,1,-1)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LEAD(Maas,2)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc)
FROM Ornek.dbo.SýralamaRank


--PARTITON BY ÝLE:
SELECT
*,
LAG(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LAG(Maas,1,-1)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LAG(Maas,2)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc)
FROM Ornek.dbo.SýralamaRank;


---CASE WHEN ÝLE BERABER :

--Çalýþan maaþý,kendinden bir önceki maaþtan, büyük mü,küçük mü veya eþit mi diye yazsýn.
SELECT
*,
LAG(Maas)OVER(ORDER BY Maas Desc) AS [AYNI SONUC LAG],
LAG(Maas,1,0)OVER(ORDER BY Maas Desc)AS [AYNI SONUC LAG],
CASE
	WHEN MAAS > (LAG(Maas,1,0)OVER(ORDER BY Maas Desc)) THEN 'Önceki Çalýþandan Maaþý Daha Büyük'
	WHEN MAAS < (LAG(Maas,1,0)OVER(ORDER BY Maas Desc)) THEN 'Önceki Çalýþandan Maaþý Daha Küçük'
	ELSE 'Eþit'
END AS Durum
FROM Ornek.dbo.SýralamaRank;



--- ### LEAD - LAG BÝTÝÞ ### ---



--KÜMÜLATÝF TOPLAM ALMA---

--Normalde toplamasý lazým ancak maas sütununda dublicate deðer olduðu için hata veriyor gibi düþünelim.
Select
*,
SUM(Maas)OVER(ORDER BY Maas)
from Ornek.dbo.SýralamaRank;;

--O yüzden ORDER BY Maas yerine Order by AD diyelim,AD kolonu unique olduðu için koyabiliriz.
--Bize doðru sonucu verecektir.
Select
*,
SUM(Maas)OVER(ORDER BY AD)
from Ornek.dbo.SýralamaRank;



--PARTITION BY ÝLE DE YAPABÝLÝRÝZ
Select
*,
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY AD)
from Ornek.dbo.SýralamaRank;;

----------------


