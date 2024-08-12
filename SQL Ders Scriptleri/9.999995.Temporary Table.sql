---TEMPORARY TABLE---
--Geçici olarak veritabanýnda tutulan tablolardýr.
--Örnek olarak 10 tablo var.3 tanesini beðendim ve yakýnda incelemek istiyorum.Onlarý geçici olarak tablolarda tutabiliriz.
--Veya full bir tablo var. Oradan bir subset alabilir ve geçici bir yerde tutmak istiyoruz gibi düþünebiliriz.
/*


Veritabaný üzerinde geçici bir süre için ek tablolara ihtiyaç duyulduðunda
T-SQL ile geçici tablolar oluþturulup, kullanýlýr. 
Geçici tablolar, gerçek tablolar üzerinde iþlemler yapmak yerine, farklý sorgulamalarýn yapýlabileceði 
bir deneme tahtasý gibi kullanýlýr. 
Yani önemli tablolar üzerinde kritik sorgular çalýþtýrmak zorunda kalýndýðýnda ve 
sonuçlar tahmin edilemeyecek gibiyse, geçici bir tablo oluþturulur ve 
kodlar bu geçici tablo üzerinde test edilir; daha sonra istenilen kodlar gerçek tabloya uygulanýr.
Ayný zamanda geçici tablolar, karmaþýk ve çok fazla bilgi olan tablolardan 
sadece belirli bir kýsmý alarak üzerinde çalýþmak için de kullanýlabilir.


*/

--Kalýcý normal tablolara benzerlik gösterirler.
--2 Çeþidi vardýr :Local ve Global.
--Kalýcý tablolar belirlediðimiz veritabaný içerisinde yaratýlýrlar. Ve orada biz onlar silene kadar kalýrlar.
--Ancak,Temporary tablolar, System Databaseleri içindeki TempDB 'de yaratýlýrlar.
--Temp.Tablolar sadece yaratýldýklarý ilgili connection'da görünürler.
--Local Temp Table >>>Yaratýldýklarý Session veya connection kapatýlýnca otomatik olarak drop edilirler.
--Eðer kendiniz drop etmek istiyorsanýz DROP TABLE #TempTablo Adý diyebiliriz.
--Yarattýðýmýz connection dýþýnda baþka bir query window'u açarsak ve orada temp.tablosunu Select ile seçmeye kalkarsak
--hata alýrýz.
--Temp.table Yarrattýðýmýz connection'ý kapatýrsak ve (refresh edersek görürüz)temp.tablosu otomatik olarak silinir.
--Ayný tablo adý ve içerikleriyle farklý connectionlarda 2 tane Temp tablo yaratýrsak SQL onlarý ayýrt edebilmek için 2 ayrý numara atar.


--Global Temp.Tablolarý ise unique'dirler.Local Temp.tablosu gibi random bir numara almazlar.
--1.Connectionda yarattýðýmýz ayný Global Temp tablosunu 2.connectipnda yaratamayýz.
--Birden çok kullancý ve birden farklý connectionlarda ayný isimlerde
--LocalTemp.Tablolara sahip olabilirler.(Farklý numara atanýr tabiki onlara)
--Local Temp tablolarý sadece yaratýldýklarý session'da görünürler ama Global Temp tablolarý tüm sessionlarda görülürler.
--Global Temp tablolarý ise Global Temp'tablosuna referans eden ona iþaret eden son connection kapatýlýnca silinir. 
--Local Temp Tablolarýnýn farklý ID'ler almasýnýn nedeni,ayný bir çok kiþi ayný isimli temp.tablo yaratabilirler.
--Local Temp Table'lar baðlantýya özeldir.

--Local Temp Tablosu Yaratalým 1.method:
CREATE TABLE #Deneme (

ID INT,
Name Varchar(50)

);

INSERT INTO #Deneme VALUES
(1,'Onur'),
(2,'Murat'),
(3,'Kemal');

SELECT * FROM #Deneme


--Global Temp Tablosu Yaratlým :

CREATE TABLE ##Deneme (

ID INT,
Name Varchar(50)

);

INSERT INTO ##Deneme VALUES
(1,'Onur'),
(2,'Murat'),
(3,'Kemal');


DROP TABLE ##Deneme

--Local Temp Tablosu Yaratalým 2.method:

SELECT * FROM [HumanResources].[Employee]

SELECT [BusinessEntityID],[JobTitle] FROM [HumanResources].[Employee]


--Where koþulundaki Kriterlere uyan sonuç bizim geçici tablomuza eklenecek.

SELECT
[BusinessEntityID],
[JobTitle]
INTO #Temphr
FROM 
[HumanResources].[Employee]
WHERE JobTitle LIKE '%President%';

select * from #Temphr;


--Local Temp Tablosu Yaratlým 3.method:

CREATE TABLE #HR
(
ID INT,
Cinsiyet CHAR(1),
ÝseAlým DATE
);

INSERT INTO #HR
SELECT
BusinessEntityID,
Gender,
HireDate
FROM [HumanResources].[Employee]
where Gender = 'F';

SELECT * FROM #HR;


