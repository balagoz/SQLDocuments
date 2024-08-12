--- EXECUTION PLAN ----

--Bu kýsýmda sorgu performans problemleriyle ilgileneceðiz.
--Execution Plan ile ilgili olarak biribirine benzyeyen bir çok taným yapmak mümkündür.
--Exec.plan bir sorgu yazdýðýmýzda nasýl çalýþacaðýný ve hangi yollarýn izleneceðini gösterir.
--EXECUTION PLAN,Bizim talep ettiðimiz sorgu sonucunu,SQL'in nasýl datayý çekmek için ve hangi yollarý izlediðini gösterir.
--Query optimizer ile hesaplanan ve sorgunun en ideal þelilde çalýþmasý için bize sunulan en iyi yoldur.
--Sorgu yazýldýktan sonra SQL QUERY optimizer aslýnda datayý bize döndürmek için bir sürü yöntem bulur ve bu 
--planlardan bir tanesini bzlere sunmaktadýr.
--SQL bize en iyi planý getirmeye çalýþýr.
--Örneðin çok aðýr çalýþan bir sorgunun exec.planýna bakýlýp sorun tespit edilmeye çalýþýlabilinir.
--Sorguyu yazýp SQL'e gönderdiðimizdeki adýmlar baþlýca þunlardýr:

--1.adým : SQL sorgunun doðru yazlýp yazlýmadýðýna bakar. Buna Parse iþlemi denir.
--2.Adým : Ýlk aþama bittikten sonra Query Optimizer tarafýndan  bir exec.plan oluþturur.
--3.Adým : Bu plan Store Engine'a göndeirlir ve exec.planýna göre  sorgu iþletilir ve bize gösterir.


--2 FARKLI EXEC PLAN VARDIR :

--1 : ESTIMATED EXEC.PLAN
--2	: ACTUAL EXEC.PLAN:

--Estimated plan bize,query optimizer tarafýndan oluþturalabilecek tahmini planý gösterir.
--Actual execution ise sorgu çalýþtýrtýrdýktan sonraki gerçek planý temsil eder.
--Bu iki plan birbirlerinden farklý olabilir.
--SQL'de bulunan PLAN cache bölegsinde daha önce çalýþýtýrlan ACTUAL Planlar bulunmaktadýr.
--Her defasýnda yeni bir exec.plan yaratmak yerine bir kere oluþuturlan bir actual plan varsa, 
--bu sorgu çalýþtýrýldýðýnda yeniden kullanýlýr.
--Bu da performansý önemli ölçüde hýzlandýrýr.
--Grafik olarak planlarý görebilmemiz mümkündür.




--ÖRNEK :


--GRAFÝKSEL PLAN :

--Estimated Plan için ctrl + l
--Actual için ctrl + m kýsayollarýný kullanabilriz.
--Ya da sorguyu yazdýktan sonra sað týk yapýp istediðimiz bir planý seçebiliriz. 


----ÖRNEK:
SELECT * FROM [HumanResources].[Employee]

--ÖRNEK:
--Yeni bir tablo yaratalým.

USE [INDEX]

CREATE TABLE PLANLARDENEME 
(
ID INT,
AD VARCHAR(50),
CÝNSÝYET  VARCHAR(50)
);

INSERT INTO PLANLARDENEME VALUES
(1,'ONUR','E'),
(2,'FATMA','K');

SELECT * FROM PLANLARDENEME
--Est.Exec planýný görelim.


TABLE SCAN GELDÝ.
--EST.EXEC plan ile actual plan birbirlerinden farklý olabilir.
--

SELECT * FROM PLANLARDENEME
--actual planý görellim
--üstten yapabiliriz veya saðtýktan yapabiliriz.
--Yukarýdakinden farklý olarak 1 tane daha tab geliyor.O da Result.
--Grafikte mouse ile bir grafiðer geldiðimizde orada sarý bir liste karþýmýza çýkar.
--Orada Actual number of rows gibi bilgiler karþýmýza çýkar.
--



--ÖRNEK:

SELECT * FROM [HumanResources].[Employee]
WHERE Gender ='M';--Sorguyu Highkight edip,CTRL + L'yede basabiliriz.

--TEXT PLAN :
SELECT * FROM [HumanResources].[Employee]
WHERE Gender ='M';

--SHOWPLAN_ALL : Burada sorgu için estimated exec.plan text formatýnda gösterilir.
GO
SET SHOWPLAN_ALL ON;
--Sonra bunu off da yapabiliriz.


--GRAFÝKSEL YORUMLAMA:
--Grafikleri yorumlamaya sað en üstten baþlamamýz gerekmektedir.Sonra sola doðru devam edilir.
--Eðer bir join veya connection görürsek tekrar saða doðru gitmemiz gerekir.
--Özetle;saðdan sola ve yukarýdan aþaðýya doðru okumamýz lazým.

--ÖRNEK :
SELECT * FROM PLANLARDENEME
--Burada 'table scan' yapýlmýþtýr : Buda sorguya satýr satýr bakýldýðýný gösterir.
--Eðer büyük bir tablo varsa bu çok büyük bir problemdir.
--Bunu görmemizin nedeini sorgumuzda indexler yok.
--Bu örnekte ilk baþta table scan ile tablo tarandý sonra select ile gösterildi.
--Grafikte gördüðümüz sayýlar ise bize toplam sorgu süresinin yüzde kaçýnýn nereye harcandýðýný gösterir.
--Bu örnekte tüm süre table scan için kullanýldý.
--Select %0 demesi buna hiç zaman ayrýldýðý anlamýna gelmemektedir.
--Sadece iþlem adýmlarý birbirine oranlandýðýnda table scan'e göre neredeyse sýfýr zaman harcandýðýný gösterir.


--ÖRNEK :
--CLUSTERED INDEX:
USE AdventureWorks2019
SELECT * FROM Person.PersonPhone
--Burada table scan deðilde clustered scan yapýlmýþtýr.
--Çünkü burada PK anahtarý var mevcuttur.
--Ancak burada özel bir durum bulunmaktadýr.
--Tablonun tamamýný seçtiðimiz için Clustered scan iþlemi table scan ile bu örnekte hemen hemen ayný þeyi temsil etmektedir.
--Burada clustered index olmasýna raðmen,kayýtlar gene satýr satýr okunmaktadýr.
--Çünkü burada SQL þöyle bir karar vermektedir.k
--Kayýtlara table scan iþlemindeki gibi satýr satýr eriþmek daha kolay olduðu için böyle davranmaktadýr.
--Bu anlamda clustered scan table scan ile ayný þekilde çalýþmaktadýr.
--Burada index kelimesi olsa bile,veriye eriþirken index kullanýlmamasý durumu vardýr.
--Bizim aslýnda zaten burada bir clustered indeksimiz var,
--dolayýsyla biz burada kayýt sayýsýný azaltmak için where þartýný kullanabiliriz.

--CLUSTERED INDEX SEEK:
SELECT * FROM Person.PersonPhone
WHERE BusinessEntityID<35
--Bu sefer index seek görmekteyiz.
--Index scan ve index seek iþlemleri birbirinden farklýdýr.
--Index scan tablodaki satýrlarý tek tek okumaktadýr
--Ancak Index seek ise,veriye eriþirken clustered veya non clustered bir indexin kullanýldýðýný gösterir.
--Dolayýsyla,Tüm tabloyu tek tek taramayýp,istenilen bilgilere eriþtiðimiz gösterir.
--Indeks seek iþlemi index scan'e göre daha hýzlý çalýþýr.
--Bu örnekte PK_PersonPhone Business entity clustered indeksini kullanýlmýþtýr.


--NON CLUSTERED INDEX SEEK:
--Burada da non clustered index seek bulunmaktadýr.
--Bunun nedeni grafikte te belli olduðu gibi,isimlerle ilgili olan bir non clustered indeks kullanýlmýþ olmasýdýr.
--Non clustered index seek'te ayný þekilde clustred index seek gibi tablodaki tüm verileri scan etmeyip
--sadece indeks kullanýlarak organize edilmiþ veriye kolay eriþmemizi saðlar.
SELECT FirstName,LastName FROM Person.Person
WHERE LastName LIKE 'Ken%'

--KEY LOOKUP::
SELECT FirstName,LastName,Title FROM Person.Person
WHERE LastName LIKE 'Ken%'

--Yorumlamayý önce yukarýdan aþaðýya sonra saðdan sola yapmamýz gerekiyor:
--Ýlk baþta non clustered bir indeks uygulanmýþtýr.
--Burada isim non clustered indeksinin içerisinde yer almayan,bir de title gelsin istedik.
--Bu gibi durumlarda SQL,TABLODAKÝ KEY DEÐERLERÝNÝ TESPÝT EDER.Bu örnekte meselsa bizim Kye'imiz pk'ýmýzdýr.
--PK'ýmýz da ne oluyordu? Clustered index oluyor.Ýþte bu key deðerelere ulaþarak bize Title verisini bizlere getiriyor.
--Bu iþleme keylookup denir.
--Burada first name ve last name indeksin içinde ama Title deðil.Dolayýsyla Key lookupa mouse ýmýzla gelirsek,
--buarada title'ý aradýðýný görürüz.
--First name ve last name'e indeks ile ulaþtý ama title'a keylookup ile ulaþtý.

--ÖRNEK :

---SCAN VS SEEK BAÞLANGIÇ  ---
--Temel anlamda Scan kötü,seek iyidir.
--Tüm tabloyu mu scan ediyorum yoksa index üzerinden mi sonuca ulaþýyorum kararý verilmektedir.
--Örneðin bir kelime arayalým kitapta:Onur kelimesi
--Her bir sayfayý tek tek mi arayacaðým yoksa,kitaptaki index'e bakýp,onur kelimesinin hangi sayfalarda geçtiðine mi bakacaðým.

--ÖRNEK :
USE [INDEX]

--TABLO YARATALIM:
CREATE TABLE EXECPLAN 
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50),
CÝNSÝYET VARCHAR(50)
);

INSERT INTO EXECPLAN VALUES
(1,'ONUR','OKAY','E'),
(2,'MURAT','ABC','E'),
(3,'KEMAL','XYZ','E'),
(4,'CEM','ABC','E'),
(5,'CAN','XYZ','E'),
(6,'YASÝN','ABC','E'),
(7,'FATMA','XYZ','K'),
(8,'YEÞÝM','ABC','K'),
(9,'ÖZGE','XYZ','K'),
(10,'DÝDEM','ABC','K'),
(1,'ONUR','OKAY','E'),
(2,'MURAT','ABC','E'),
(3,'KEMAL','XYZ','E'),
(4,'CEM','ABC','E'),
(5,'CAN','XYZ','E'),
(6,'YASÝN','ABC','E'),
(7,'FATMA','XYZ','K'),
(8,'YEÞÝM','ABC','K'),
(9,'ÖZGE','XYZ','K'),
(10,'DÝDEM','ABC','K');


SELECT * FROM EXECPLAN

--SCAN
--Burada sp_helpindex sayesinde tabloda index olup olmadýðýna bakabiliriz.
EXEC sp_helpindex EXECPLAN

--Table Scan:
SELECT SOYAD FROM EXECPLAN
WHERE SOYAD ='Okay'


--SEEK:
--Þimdi soyad için bir NONCLUSTERED INDEX yaratalým.
CREATE NONCLUSTERED INDEX DENEME ON dbo.EXECPLAN(SOYAD)
--Index yaratýldýktan sonra sp_helpindex sayesinde tabloda index olup olmadýðýna bakabiliriz.
EXEC sp_helpindex EXECPLAN

--Þimdi ayný sorguyu yine çalýþtýralým:Bu sefer Index Seek yapýldýðýný görebiliriz.
SELECT SOYAD FROM EXECPLAN
WHERE SOYAD ='Okay'


-- Þimdi indeksi kaldýralým.
DROP INDEX EXECPLAN.DENEME


--Ama bazen scan yapmak seek yapmakytan daha iyidir.
--Diyelim ki,bir kelime deðilde sadece bir harf arýyorum.
--Sadece O harfini aradýðýmýzý düþünelim.
--O harfi dolayýsyla her sayfada olacaktýr.Indeks kullanmak yerine her sayfayý taramak daha iyi olabilir.
--NE aradýðýmýza baðlý olarak plan deðiþecektir.
--Ama çoðu zaman scan daha kötüdür.


---SCAN VS SEEK BÝTÝÞ  ---


---BOOKMARK LOOKUPS BAÞLANGIÇ --- :
--Diyelim ki,indeksimiz var ama aradýðýmýz her þey indeksin içinde olmayabilir.
--Bu gibi durumlarda ana tabloda key deðer bulunup, ilgili key deðere bakýp veri alýnmaktadýr.
--2 TÜRÜ VARDIR,RID LOOKUP VE KEY LOOKUP


--RID LOOKUP
--Burada gelmesini istediðimiz Ad'DA BÝR ÝNDEKS YOK AMA SOYAD'da var.
--Bu örnekte Soyadda indeks var.
--Soyadý ararken burada ana tabloya gitmemize gerek yok.
--Ama Ad'ý getirmek istiyoruz biz.

--RID lookup örneði için database'de bulunan DatabseLog Tablosuna ulaþalým:
USE AdventureWorks2019
select * from dbo.DatabaseLog
where DatabaseLogID = 2;

--RID LOOKUP,Ýçerisinde PK bulunan ancak CLUSTERED ÝNDEKS tanýmlanmamýþ 
--olan tablolarda bulunan veriler için uygulanýr.
--Burada PK üzerinden bir index seek yapmýþ sonrada RID lookup iþlemi yapýlmýþ.
--Burada tüm DatabaseLogID = 2 olanlarý bulur ama der ki,aradýðým bilgiler bu indekste deðil,
--o yüzden key'e gidip oranýn üzerinmden tabloyu getirmem denmektedir.


--key lookup:

SELECT FirstName,LastName,Title FROM Person.Person
WHERE LastName LIKE 'Ken%'


---BOOKMARK LOOKUPS BÝTÝÞ --- :


--- COVERING INDEX :
--Bookmark looukplarý azaltmak için kullanýrýz.
--Aradýðýmýz herþeyi indekse koyarýz.Dolayýsyla ana tablya gitmeden verilerimiz getirir.
--Yani index yaratýrken bir tane daha indeks ekleyeceðiz.




--- SET STATISTICS IO :
--Sorgularý sonuçlarýný karþýmýza getirirken tablolarý ne kadar okuduðu ile ilgili bilgi verir.
--
SET Statistics io on

SELECT PersonType FROM Person.Person
WHERE LastName LIKE 'Ken%'

--Burada sorguyu çalýþtýrdan sonra messages kýsmýna giersek,tablonun ne kadar scan edildiði ve logical read bilgilerini görebiliriz.
--Burada bizim için önemli olan Scan count , logical reads kýsýmlarýdýr.
--Örneðin tüm plan cache'de olabilir dolayýsyla hiç physical read yapmayabilirim.
--Bizim için önemli olan Scan count , logical reads.
--Ýndeksleri kaldýrýrsak Logical reads'in arttýðýný görürüz.


--- SET STATISTICS TIME ON :

SET Statistics time on
--Bizim için burada önemli olan elapsed time'dýr.
--Sorgu talebi alýndýktan sorgu sonucu bize gösterilen zamana kadar olan süreyi bize söyler.
--

SELECT PersonType FROM Person.Person
WHERE LastName LIKE 'Ken%'