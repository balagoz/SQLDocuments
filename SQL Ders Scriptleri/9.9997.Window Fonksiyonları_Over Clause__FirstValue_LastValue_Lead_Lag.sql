
--Window Fonksiyonlar� Genel - OVER �fadesi -- FirstValue -- LastValue -- Lead -- Lag -- K�m�latif Toplam--


-- ### Window Fonk ve OVER Clause BA�LANGI� ### --

--SYNTAX : Function()OVER(Partition By Kolon1,Kolon2...)

--Partition By ifadesi ile birlikte kullan�ld���nda data'y� s�n�flara b�lmeye yarar.
--COUNT,SUM,MIN,MAX,ROWNUMBER,RANK,DENSERANK VS...gibi ifadelerle kullan�labilir.

--Tablonun orijinal hali bozulmadan ve group by ifadesi kullanmadan istedi�imiz agg.fonk ve s�n�f ile birlikte �al��abiliriz.
--OVER ifadesi kulland���m�z i�in ve yan�nda agg.fonk'da kullan�rsak �rne�in MAX fonksiyonu gibi,
--SQL MAX fonksiyonuna agg.fonk.muamelesi yapm�yor.Max'a window fonk.muamelesi yap�yor.


--E�er over()'da parantez i�erisinde bir �ey belirtmezsek,SQL T�m sat�rlar i�in bir window yani pencere yarat�r.
--E�er bir s�n�flama yaratmak istiyorsam, ve �rne�in her departman�n MAX maas'�n� bulmak istiyorsak
--o zaman Partition By ifadesi kullanmak zorunday�z.



--�RNEK:

SELECT * FROM [HumanResources].[Employee]



--Orijinal Tablomuz :
SELECT
[BusinessEntityID],
[Gender]
FROM [HumanResources].[Employee]

--GROUP BY �le:
SELECT
[Gender],
COUNT([BusinessEntityID])
FROM [HumanResources].[Employee]
GROUP BY[Gender] 

--�RNEK :
--GROUP BY KULLANMIYORUZ D�KKAT EDERSEK:
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

Over ifadesi kullan�ld��� i�in art�k count i�in group by istenmedi 
ve sql bize sanki group by ifadesi uygulan�yormu� gibi
over la birlikte a��t�� pencerede gruop by 'dan ��kan sonu�lar� yazd�rabilmesini sa�lad�.
Ama� non.agg.datan�n yap�s�n� bozmadan, agg.fonk'�n ve groupy by ifadesinin yapabildiklerini yapmak.

*/





--�RNEK :

--Orijinal Tablomuz:
Select * from Ornek.dbo.S�ralamaRank

Select
Cinsiyet,
COUNT(*) AS ADET,
AVG(Maas)AS ORT,
MIN(Maas)AS MIN,
MAX(Maas)AS MAX
from Ornek.dbo.S�ralamaRank
GROUP BY Cinsiyet

--Yukarda group by kulland�k ama ben group by kullanmadan 
--non aggregared datay�da g�rmek istiyorum ve cinsiyet 
--ile ilgili min max vs gibi de�erleri de g�rmek istiyorum.
--O zaman Ne yapaca��z?




Select
DISTINCT(Cinsiyet),
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
AVG(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetOrtMaas,
MIN(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetM�nMaas,
MAX(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetMaxMaas,
SUM(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetToplam
from Ornek.dbo.S�ralamaRank;

-- WINDOW FONKS�YON YARDIMIYLA YAZALIM :

/*

Select
Ad,
Cinsiyet,
Maas,
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
COUNT(Cinsiyet)over() AS ToplamCinsiyetAdet
from S�ralama;


Select Cinsiyet,count(Ad)from S�ralama
group by Cinsiyet

*/



--BA�KA �RNEK :
Select
Ad,
Cinsiyet,
Maas,
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
COUNT(Cinsiyet)over() AS ToplamCinsiyetAdet
from Ornek.dbo.S�ralamaRank;




--BA�KA �RNEK :
Select
Ad,
Cinsiyet,
Maas,
COUNT(Cinsiyet)over(PARTITION BY Cinsiyet) AS CinsiyetAdet,
AVG(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetOrtMaas,
MIN(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetM�nMaas,
MAX(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetMaxMaas,
SUM(Maas)over(PARTITION BY Cinsiyet) AS CinsiyetToplam
from Ornek.dbo.S�ralamaRank;



--OVER ��erisinde Partiton By Kullanmadan :
-- SQL al�nda bize ��yle diyor :
--Ben sana over kulland���n i�in group by kullanmadan ve over�n i�inde hi� bir �ey kullanmad���n 
--i�in t�m data i�in ayr� bir pencere a��yorum i�lemlerini orada yap.

Select
*,
MAX(Maas)OVER(),
MIN(Maas)OVER()
from Ornek.dbo.S�ralamaRank;

--OVER ��erisinde Partiton By Kullanarak :
Select
*,
MAX(Maas)OVER(),
MIN(Maas)OVER(),
MAX(Maas)OVER(PARTITION BY Cinsiyet)
from Ornek.dbo.S�ralamaRank;



-- ### Window Functions Genel ###--
/*

Window Fonksiyonlar� Temel olarak 3'e ay�rabiliriz.
1 - Aggregata Fonk.ile kullanabiliriz. SUM,AVG,MIN,MAX vs..
2 - S�ralama ��in kullanabiliriz.
3 - Analitik Fonk ile beraber kullanabiliriz (FisrtValue,Lead,Lag vs gibi)
OVER clause'in i�inde Partitioning ve Order by ile s�ralama yapabiliriz.
Rows ve Range Clause'lar� var.Bunlar partiton i�ersindeki sat�rlar� s�n�rlamak ba�lang�� 
ve biti� sat�r�n� belirlemek i�in kulland���m�z ifadeler.
DEFAULT olarak : RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW kullan�l�r.

*/


--AGG.FONK �LE BERABER PARTITON BY KULLANMADAN,ORDER BY 
Select
*,
AVG(Maas)OVER(ORDER BY Maas),
SUM(Maas)OVER(ORDER BY Maas)
-- Biz burada her sat�rda asl�nda gelen ort.y� bekliyoruz ancak Defaultu kulland��� i�in b�yle geliyor.
--Yani kendisi ve �ncekindeki SATIRLARIN ortalamas�n� al�yor.
from Ornek.dbo.S�ralamaRank;



SELECT (600 + 3000 + 3500) / 3;

--Bunun d�zelmesini istiyorsak 1.YOL:
--ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ifadesini koymam�z laz�m.
Select
*,
AVG(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING), --Sa�dakinin ayn� haline geliyor.--AVG(Maas)OVER()
SUM(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
from Ornek.dbo.S�ralamaRank;


--Bunun d�zelmesini istiyorsak 2.YOL:
--Over()i�erisinde herhangibir order by kullanmayaca��z.Bu y�ntem bize zaten ayn� sonucu zaten getiriyor.
Select
*,
AVG(Maas)OVER(),
AVG(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
SUM(Maas)OVER(),
SUM(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
COUNT(Maas)OVER(),
COUNT(Maas)OVER(ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
from Ornek.dbo.S�ralamaRank;
;


--PARTITION �LE Birlikte Kullan�m� 1.YOL:
Select
*,
AVG(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
COUNT(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
from Ornek.dbo.S�ralamaRank;




--PARTITION �LE Birlikte Kullan�m� 2.YOL:
--Ayn� sonucu verir sadece tek ba��na Partition by kullan�yoruz.
Select
*,
AVG(Maas)OVER(PARTITION BY Cinsiyet),
SUM(Maas)OVER(PARTITION BY Cinsiyet),
COUNT(Maas)OVER(PARTITION BY Cinsiyet)
from Ornek.dbo.S�ralamaRank;

--�STED���M�Z G�B� ROWS BETWEEN FOLLOWING VE PRECEDING YAZAB�L�R�Z:



Select
*,
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
from Ornek.dbo.S�ralamaRank;


-- ### Window Fonk ve OVER Clause B�T�� ### --




-- ### FirstValue Ba�lang�� ### --

--Belirtilen ko�ullardaki ilk sat�rdaki de�eri getirir.Sonu� order by ifadesine g�re de�i�ir.
--Order By ifadesi zorunludur.
--Partition By ifadesi opsiyoneldir.
--FIRST_VALUE()--Parantez i�ine bir arg�man al�r.

--�RNEK :

--ORJ�NAL TABLOMUZ :
SELECT * FROM Ornek.dbo.S�ralamaRank;

SELECT
*,
FIRST_VALUE(AD)OVER(ORDER BY MAAS DESC),--En y�ksek Maa�� alan Ki�i
FIRST_VALUE(AD)OVER(ORDER BY MAAS ASC)--En D���k Maa�� alan Ki�i
FROM Ornek.dbo.S�ralamaRank;

--�RNEK : Partition By �le

SELECT
*,
FIRST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS DESC),--En y�ksek Maa�� alan Ki�i
FIRST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS ASC)--En D���k Maa�� alan Ki�i
FROM Ornek.dbo.S�ralamaRank;



--�rnek :


Select
[ProductID],
[Name],
[Color],
[ListPrice],
FIRST_VALUE(Name)OVER(PARTITION BY Color ORDER BY ListPrice Desc) AS MAXF�YATURUN,
FIRST_VALUE(Name)OVER(PARTITION BY Color ORDER BY ListPrice ASC) AS MINF�YATURUN
from Production.Product
WHERE Color IS NOT NULL AND ListPrice <>0


-- ### FirstValue Biti� ### ---



-- ### LastValue Ba�lang�� ### --


--Belirtilen ko�ullardaki son sat�rdaki de�eri getirir.Sonu� order by ifadesine g�re de�i�ir
--Order By ifadesi zorunludur.
--Partition By ifadesi opsiyoneldir.
--LAST_VALUE()--Parantez i�ine bir arg�man al�r.
--Sorgunun do�ru �al��mas� i�in 'ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING' kullanmam�z gerek.

--�rnek :
SELECT
*,
LAST_VALUE(AD)OVER(ORDER BY MAAS DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM Ornek.dbo.S�ralamaRank;



--�rnek : --AYNI SONUCA FIRST VALUE �FADES� �LE DE ULA�AB�L�R�Z.


SELECT
*,
LAST_VALUE(AD)OVER(ORDER BY MAAS DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),
FIRST_VALUE(AD)OVER(ORDER BY MAAS ASC)
FROM Ornek.dbo.S�ralamaRank;



--�rnek : PARITITON BY �LE 

SELECT
*,
LAST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM Ornek.dbo.S�ralamaRank;

-- ### LastValue Biti� ### --




--- ### LEAD - LAG BA�LANGI� ### ---
--Lead fonk.kendisinden sonraki veriyi g�rmek i�in kullan�r�z.
--Lag fonk.kendisinden �nceki veriyi g�rmek i�in kullan�r�z.
--Order By gereklidir.
--Partition kullan�m� opsiyoneldir.

--SYNTAX : LEAD (Kolon Ad�,Offset,Default De�er)OVER (ORDER BY kolon1,kolon2....)
		-- LAG (Kolon Ad�,Offset,Default De�er)OVER (ORDER BY kolon1,kolon2....)

--Offset : Offset'in defaut de�eri 1'dir.LEAD(maas) = LEAD(maas,1)
--Default De�er: Herhangibir de�er belirtilmemi�se NULL gelir.Ofset, b�l�m�n kapsam� d���nda oldu�unda 
--d�nd�r�lecek de�er. Varsay�lan bir de�er belirtilmezse, NULL d�nd�r�l�r.

SELECT * FROM Ornek.dbo.S�ralamaRank;

--�RNEK :

SELECT
*,
LEAD(Maas)over(ORDER BY Maas DESC),
LEAD(Maas,1)over(ORDER BY Maas DESC),
LEAD(Maas,2,-1)over(ORDER BY Maas DESC),
LEAD(Maas,2,1)over(ORDER BY Maas DESC),
LEAD(Maas,1,-1)over(ORDER BY Maas DESC)
FROM Ornek.dbo.S�ralamaRank;




SELECT
*,
LAG(Maas)over(ORDER BY Maas DESC),
LAG(Maas,1)over(ORDER BY Maas DESC),
LAG(Maas,2)over(ORDER BY Maas DESC),
LAG(Maas,2,-1)over(ORDER BY Maas DESC)
FROM Ornek.dbo.S�ralamaRank;;


--PARTITON BY �LE:
SELECT
*,
LEAD(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LEAD(Maas,1,-1)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LEAD(Maas,2)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc)
FROM Ornek.dbo.S�ralamaRank


--PARTITON BY �LE:
SELECT
*,
LAG(Maas)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LAG(Maas,1,-1)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc),
LAG(Maas,2)OVER(PARTITION BY Cinsiyet ORDER BY Maas Desc)
FROM Ornek.dbo.S�ralamaRank;


---CASE WHEN �LE BERABER :

--�al��an maa��,kendinden bir �nceki maa�tan, b�y�k m�,k���k m� veya e�it mi diye yazs�n.
SELECT
*,
LAG(Maas)OVER(ORDER BY Maas Desc) AS [AYNI SONUC LAG],
LAG(Maas,1,0)OVER(ORDER BY Maas Desc)AS [AYNI SONUC LAG],
CASE
	WHEN MAAS > (LAG(Maas,1,0)OVER(ORDER BY Maas Desc)) THEN '�nceki �al��andan Maa�� Daha B�y�k'
	WHEN MAAS < (LAG(Maas,1,0)OVER(ORDER BY Maas Desc)) THEN '�nceki �al��andan Maa�� Daha K���k'
	ELSE 'E�it'
END AS Durum
FROM Ornek.dbo.S�ralamaRank;



--- ### LEAD - LAG B�T�� ### ---



--K�M�LAT�F TOPLAM ALMA---

--Normalde toplamas� laz�m ancak maas s�tununda dublicate de�er oldu�u i�in hata veriyor gibi d���nelim.
Select
*,
SUM(Maas)OVER(ORDER BY Maas)
from Ornek.dbo.S�ralamaRank;;

--O y�zden ORDER BY Maas yerine Order by AD diyelim,AD kolonu unique oldu�u i�in koyabiliriz.
--Bize do�ru sonucu verecektir.
Select
*,
SUM(Maas)OVER(ORDER BY AD)
from Ornek.dbo.S�ralamaRank;



--PARTITION BY �LE DE YAPAB�L�R�Z
Select
*,
SUM(Maas)OVER(PARTITION BY Cinsiyet ORDER BY AD)
from Ornek.dbo.S�ralamaRank;;

----------------


