---TEMPORARY TABLE---
--Ge�ici olarak veritaban�nda tutulan tablolard�r.
--�rnek olarak 10 tablo var.3 tanesini be�endim ve yak�nda incelemek istiyorum.Onlar� ge�ici olarak tablolarda tutabiliriz.
--Veya full bir tablo var. Oradan bir subset alabilir ve ge�ici bir yerde tutmak istiyoruz gibi d���nebiliriz.
/*


Veritaban� �zerinde ge�ici bir s�re i�in ek tablolara ihtiya� duyuldu�unda
T-SQL ile ge�ici tablolar olu�turulup, kullan�l�r. 
Ge�ici tablolar, ger�ek tablolar �zerinde i�lemler yapmak yerine, farkl� sorgulamalar�n yap�labilece�i 
bir deneme tahtas� gibi kullan�l�r. 
Yani �nemli tablolar �zerinde kritik sorgular �al��t�rmak zorunda kal�nd���nda ve 
sonu�lar tahmin edilemeyecek gibiyse, ge�ici bir tablo olu�turulur ve 
kodlar bu ge�ici tablo �zerinde test edilir; daha sonra istenilen kodlar ger�ek tabloya uygulan�r.
Ayn� zamanda ge�ici tablolar, karma��k ve �ok fazla bilgi olan tablolardan 
sadece belirli bir k�sm� alarak �zerinde �al��mak i�in de kullan�labilir.


*/

--Kal�c� normal tablolara benzerlik g�sterirler.
--2 �e�idi vard�r :Local ve Global.
--Kal�c� tablolar belirledi�imiz veritaban� i�erisinde yarat�l�rlar. Ve orada biz onlar silene kadar kal�rlar.
--Ancak,Temporary tablolar, System Databaseleri i�indeki TempDB 'de yarat�l�rlar.
--Temp.Tablolar sadece yarat�ld�klar� ilgili connection'da g�r�n�rler.
--Local Temp Table >>>Yarat�ld�klar� Session veya connection kapat�l�nca otomatik olarak drop edilirler.
--E�er kendiniz drop etmek istiyorsan�z DROP TABLE #TempTablo Ad� diyebiliriz.
--Yaratt���m�z connection d���nda ba�ka bir query window'u a�arsak ve orada temp.tablosunu Select ile se�meye kalkarsak
--hata al�r�z.
--Temp.table Yarratt���m�z connection'� kapat�rsak ve (refresh edersek g�r�r�z)temp.tablosu otomatik olarak silinir.
--Ayn� tablo ad� ve i�erikleriyle farkl� connectionlarda 2 tane Temp tablo yarat�rsak SQL onlar� ay�rt edebilmek i�in 2 ayr� numara atar.


--Global Temp.Tablolar� ise unique'dirler.Local Temp.tablosu gibi random bir numara almazlar.
--1.Connectionda yaratt���m�z ayn� Global Temp tablosunu 2.connectipnda yaratamay�z.
--Birden �ok kullanc� ve birden farkl� connectionlarda ayn� isimlerde
--LocalTemp.Tablolara sahip olabilirler.(Farkl� numara atan�r tabiki onlara)
--Local Temp tablolar� sadece yarat�ld�klar� session'da g�r�n�rler ama Global Temp tablolar� t�m sessionlarda g�r�l�rler.
--Global Temp tablolar� ise Global Temp'tablosuna referans eden ona i�aret eden son connection kapat�l�nca silinir. 
--Local Temp Tablolar�n�n farkl� ID'ler almas�n�n nedeni,ayn� bir �ok ki�i ayn� isimli temp.tablo yaratabilirler.
--Local Temp Table'lar ba�lant�ya �zeldir.

--Local Temp Tablosu Yaratal�m 1.method:
CREATE TABLE #Deneme (

ID INT,
Name Varchar(50)

);

INSERT INTO #Deneme VALUES
(1,'Onur'),
(2,'Murat'),
(3,'Kemal');

SELECT * FROM #Deneme


--Global Temp Tablosu Yaratl�m :

CREATE TABLE ##Deneme (

ID INT,
Name Varchar(50)

);

INSERT INTO ##Deneme VALUES
(1,'Onur'),
(2,'Murat'),
(3,'Kemal');


DROP TABLE ##Deneme

--Local Temp Tablosu Yaratal�m 2.method:

SELECT * FROM [HumanResources].[Employee]

SELECT [BusinessEntityID],[JobTitle] FROM [HumanResources].[Employee]


--Where ko�ulundaki Kriterlere uyan sonu� bizim ge�ici tablomuza eklenecek.

SELECT
[BusinessEntityID],
[JobTitle]
INTO #Temphr
FROM 
[HumanResources].[Employee]
WHERE JobTitle LIKE '%President%';

select * from #Temphr;


--Local Temp Tablosu Yaratl�m 3.method:

CREATE TABLE #HR
(
ID INT,
Cinsiyet CHAR(1),
�seAl�m DATE
);

INSERT INTO #HR
SELECT
BusinessEntityID,
Gender,
HireDate
FROM [HumanResources].[Employee]
where Gender = 'F';

SELECT * FROM #HR;


