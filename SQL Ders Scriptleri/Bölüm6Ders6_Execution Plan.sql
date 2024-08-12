--- EXECUTION PLAN ----

--Bu k�s�mda sorgu performans problemleriyle ilgilenece�iz.
--Execution Plan ile ilgili olarak biribirine benzyeyen bir �ok tan�m yapmak m�mk�nd�r.
--Exec.plan bir sorgu yazd���m�zda nas�l �al��aca��n� ve hangi yollar�n izlenece�ini g�sterir.
--EXECUTION PLAN,Bizim talep etti�imiz sorgu sonucunu,SQL'in nas�l datay� �ekmek i�in ve hangi yollar� izledi�ini g�sterir.
--Query optimizer ile hesaplanan ve sorgunun en ideal �elilde �al��mas� i�in bize sunulan en iyi yoldur.
--Sorgu yaz�ld�ktan sonra SQL QUERY optimizer asl�nda datay� bize d�nd�rmek i�in bir s�r� y�ntem bulur ve bu 
--planlardan bir tanesini bzlere sunmaktad�r.
--SQL bize en iyi plan� getirmeye �al���r.
--�rne�in �ok a��r �al��an bir sorgunun exec.plan�na bak�l�p sorun tespit edilmeye �al���labilinir.
--Sorguyu yaz�p SQL'e g�nderdi�imizdeki ad�mlar ba�l�ca �unlard�r:

--1.ad�m : SQL sorgunun do�ru yazl�p yazl�mad���na bakar. Buna Parse i�lemi denir.
--2.Ad�m : �lk a�ama bittikten sonra Query Optimizer taraf�ndan  bir exec.plan olu�turur.
--3.Ad�m : Bu plan Store Engine'a g�ndeirlir ve exec.plan�na g�re  sorgu i�letilir ve bize g�sterir.


--2 FARKLI EXEC PLAN VARDIR :

--1 : ESTIMATED EXEC.PLAN
--2	: ACTUAL EXEC.PLAN:

--Estimated plan bize,query optimizer taraf�ndan olu�turalabilecek tahmini plan� g�sterir.
--Actual execution ise sorgu �al��t�rt�rd�ktan sonraki ger�ek plan� temsil eder.
--Bu iki plan birbirlerinden farkl� olabilir.
--SQL'de bulunan PLAN cache b�legsinde daha �nce �al���t�rlan ACTUAL Planlar bulunmaktad�r.
--Her defas�nda yeni bir exec.plan yaratmak yerine bir kere olu�uturlan bir actual plan varsa, 
--bu sorgu �al��t�r�ld���nda yeniden kullan�l�r.
--Bu da performans� �nemli �l��de h�zland�r�r.
--Grafik olarak planlar� g�rebilmemiz m�mk�nd�r.




--�RNEK :


--GRAF�KSEL PLAN :

--Estimated Plan i�in ctrl + l
--Actual i�in ctrl + m k�sayollar�n� kullanabilriz.
--Ya da sorguyu yazd�ktan sonra sa� t�k yap�p istedi�imiz bir plan� se�ebiliriz. 


----�RNEK:
SELECT * FROM [HumanResources].[Employee]

--�RNEK:
--Yeni bir tablo yaratal�m.

USE [INDEX]

CREATE TABLE PLANLARDENEME 
(
ID INT,
AD VARCHAR(50),
C�NS�YET  VARCHAR(50)
);

INSERT INTO PLANLARDENEME VALUES
(1,'ONUR','E'),
(2,'FATMA','K');

SELECT * FROM PLANLARDENEME
--Est.Exec plan�n� g�relim.


TABLE SCAN GELD�.
--EST.EXEC plan ile actual plan birbirlerinden farkl� olabilir.
--

SELECT * FROM PLANLARDENEME
--actual plan� g�rellim
--�stten yapabiliriz veya sa�t�ktan yapabiliriz.
--Yukar�dakinden farkl� olarak 1 tane daha tab geliyor.O da Result.
--Grafikte mouse ile bir grafi�er geldi�imizde orada sar� bir liste kar��m�za ��kar.
--Orada Actual number of rows gibi bilgiler kar��m�za ��kar.
--



--�RNEK:

SELECT * FROM [HumanResources].[Employee]
WHERE Gender ='M';--Sorguyu Highkight edip,CTRL + L'yede basabiliriz.

--TEXT PLAN :
SELECT * FROM [HumanResources].[Employee]
WHERE Gender ='M';

--SHOWPLAN_ALL : Burada sorgu i�in estimated exec.plan text format�nda g�sterilir.
GO
SET SHOWPLAN_ALL ON;
--Sonra bunu off da yapabiliriz.


--GRAF�KSEL YORUMLAMA:
--Grafikleri yorumlamaya sa� en �stten ba�lamam�z gerekmektedir.Sonra sola do�ru devam edilir.
--E�er bir join veya connection g�r�rsek tekrar sa�a do�ru gitmemiz gerekir.
--�zetle;sa�dan sola ve yukar�dan a�a��ya do�ru okumam�z laz�m.

--�RNEK :
SELECT * FROM PLANLARDENEME
--Burada 'table scan' yap�lm��t�r : Buda sorguya sat�r sat�r bak�ld���n� g�sterir.
--E�er b�y�k bir tablo varsa bu �ok b�y�k bir problemdir.
--Bunu g�rmemizin nedeini sorgumuzda indexler yok.
--Bu �rnekte ilk ba�ta table scan ile tablo tarand� sonra select ile g�sterildi.
--Grafikte g�rd���m�z say�lar ise bize toplam sorgu s�resinin y�zde ka��n�n nereye harcand���n� g�sterir.
--Bu �rnekte t�m s�re table scan i�in kullan�ld�.
--Select %0 demesi buna hi� zaman ayr�ld��� anlam�na gelmemektedir.
--Sadece i�lem ad�mlar� birbirine oranland���nda table scan'e g�re neredeyse s�f�r zaman harcand���n� g�sterir.


--�RNEK :
--CLUSTERED INDEX:
USE AdventureWorks2019
SELECT * FROM Person.PersonPhone
--Burada table scan de�ilde clustered scan yap�lm��t�r.
--��nk� burada PK anahtar� var mevcuttur.
--Ancak burada �zel bir durum bulunmaktad�r.
--Tablonun tamam�n� se�ti�imiz i�in Clustered scan i�lemi table scan ile bu �rnekte hemen hemen ayn� �eyi temsil etmektedir.
--Burada clustered index olmas�na ra�men,kay�tlar gene sat�r sat�r okunmaktad�r.
--��nk� burada SQL ��yle bir karar vermektedir.k
--Kay�tlara table scan i�lemindeki gibi sat�r sat�r eri�mek daha kolay oldu�u i�in b�yle davranmaktad�r.
--Bu anlamda clustered scan table scan ile ayn� �ekilde �al��maktad�r.
--Burada index kelimesi olsa bile,veriye eri�irken index kullan�lmamas� durumu vard�r.
--Bizim asl�nda zaten burada bir clustered indeksimiz var,
--dolay�syla biz burada kay�t say�s�n� azaltmak i�in where �art�n� kullanabiliriz.

--CLUSTERED INDEX SEEK:
SELECT * FROM Person.PersonPhone
WHERE BusinessEntityID<35
--Bu sefer index seek g�rmekteyiz.
--Index scan ve index seek i�lemleri birbirinden farkl�d�r.
--Index scan tablodaki sat�rlar� tek tek okumaktad�r
--Ancak Index seek ise,veriye eri�irken clustered veya non clustered bir indexin kullan�ld���n� g�sterir.
--Dolay�syla,T�m tabloyu tek tek taramay�p,istenilen bilgilere eri�ti�imiz g�sterir.
--Indeks seek i�lemi index scan'e g�re daha h�zl� �al���r.
--Bu �rnekte PK_PersonPhone Business entity clustered indeksini kullan�lm��t�r.


--NON CLUSTERED INDEX SEEK:
--Burada da non clustered index seek bulunmaktad�r.
--Bunun nedeni grafikte te belli oldu�u gibi,isimlerle ilgili olan bir non clustered indeks kullan�lm�� olmas�d�r.
--Non clustered index seek'te ayn� �ekilde clustred index seek gibi tablodaki t�m verileri scan etmeyip
--sadece indeks kullan�larak organize edilmi� veriye kolay eri�memizi sa�lar.
SELECT FirstName,LastName FROM Person.Person
WHERE LastName LIKE 'Ken%'

--KEY LOOKUP::
SELECT FirstName,LastName,Title FROM Person.Person
WHERE LastName LIKE 'Ken%'

--Yorumlamay� �nce yukar�dan a�a��ya sonra sa�dan sola yapmam�z gerekiyor:
--�lk ba�ta non clustered bir indeks uygulanm��t�r.
--Burada isim non clustered indeksinin i�erisinde yer almayan,bir de title gelsin istedik.
--Bu gibi durumlarda SQL,TABLODAK� KEY DE�ERLER�N� TESP�T EDER.Bu �rnekte meselsa bizim Kye'imiz pk'�m�zd�r.
--PK'�m�z da ne oluyordu? Clustered index oluyor.��te bu key de�erelere ula�arak bize Title verisini bizlere getiriyor.
--Bu i�leme keylookup denir.
--Burada first name ve last name indeksin i�inde ama Title de�il.Dolay�syla Key lookupa mouse �m�zla gelirsek,
--buarada title'� arad���n� g�r�r�z.
--First name ve last name'e indeks ile ula�t� ama title'a keylookup ile ula�t�.

--�RNEK :

---SCAN VS SEEK BA�LANGI�  ---
--Temel anlamda Scan k�t�,seek iyidir.
--T�m tabloyu mu scan ediyorum yoksa index �zerinden mi sonuca ula��yorum karar� verilmektedir.
--�rne�in bir kelime arayal�m kitapta:Onur kelimesi
--Her bir sayfay� tek tek mi arayaca��m yoksa,kitaptaki index'e bak�p,onur kelimesinin hangi sayfalarda ge�ti�ine mi bakaca��m.

--�RNEK :
USE [INDEX]

--TABLO YARATALIM:
CREATE TABLE EXECPLAN 
(
ID INT,
AD VARCHAR(50),
SOYAD VARCHAR(50),
C�NS�YET VARCHAR(50)
);

INSERT INTO EXECPLAN VALUES
(1,'ONUR','OKAY','E'),
(2,'MURAT','ABC','E'),
(3,'KEMAL','XYZ','E'),
(4,'CEM','ABC','E'),
(5,'CAN','XYZ','E'),
(6,'YAS�N','ABC','E'),
(7,'FATMA','XYZ','K'),
(8,'YE��M','ABC','K'),
(9,'�ZGE','XYZ','K'),
(10,'D�DEM','ABC','K'),
(1,'ONUR','OKAY','E'),
(2,'MURAT','ABC','E'),
(3,'KEMAL','XYZ','E'),
(4,'CEM','ABC','E'),
(5,'CAN','XYZ','E'),
(6,'YAS�N','ABC','E'),
(7,'FATMA','XYZ','K'),
(8,'YE��M','ABC','K'),
(9,'�ZGE','XYZ','K'),
(10,'D�DEM','ABC','K');


SELECT * FROM EXECPLAN

--SCAN
--Burada sp_helpindex sayesinde tabloda index olup olmad���na bakabiliriz.
EXEC sp_helpindex EXECPLAN

--Table Scan:
SELECT SOYAD FROM EXECPLAN
WHERE SOYAD ='Okay'


--SEEK:
--�imdi soyad i�in bir NONCLUSTERED INDEX yaratal�m.
CREATE NONCLUSTERED INDEX DENEME ON dbo.EXECPLAN(SOYAD)
--Index yarat�ld�ktan sonra sp_helpindex sayesinde tabloda index olup olmad���na bakabiliriz.
EXEC sp_helpindex EXECPLAN

--�imdi ayn� sorguyu yine �al��t�ral�m:Bu sefer Index Seek yap�ld���n� g�rebiliriz.
SELECT SOYAD FROM EXECPLAN
WHERE SOYAD ='Okay'


-- �imdi indeksi kald�ral�m.
DROP INDEX EXECPLAN.DENEME


--Ama bazen scan yapmak seek yapmakytan daha iyidir.
--Diyelim ki,bir kelime de�ilde sadece bir harf ar�yorum.
--Sadece O harfini arad���m�z� d���nelim.
--O harfi dolay�syla her sayfada olacakt�r.Indeks kullanmak yerine her sayfay� taramak daha iyi olabilir.
--NE arad���m�za ba�l� olarak plan de�i�ecektir.
--Ama �o�u zaman scan daha k�t�d�r.


---SCAN VS SEEK B�T��  ---


---BOOKMARK LOOKUPS BA�LANGI� --- :
--Diyelim ki,indeksimiz var ama arad���m�z her �ey indeksin i�inde olmayabilir.
--Bu gibi durumlarda ana tabloda key de�er bulunup, ilgili key de�ere bak�p veri al�nmaktad�r.
--2 T�R� VARDIR,RID LOOKUP VE KEY LOOKUP


--RID LOOKUP
--Burada gelmesini istedi�imiz Ad'DA B�R �NDEKS YOK AMA SOYAD'da var.
--Bu �rnekte Soyadda indeks var.
--Soyad� ararken burada ana tabloya gitmemize gerek yok.
--Ama Ad'� getirmek istiyoruz biz.

--RID lookup �rne�i i�in database'de bulunan DatabseLog Tablosuna ula�al�m:
USE AdventureWorks2019
select * from dbo.DatabaseLog
where DatabaseLogID = 2;

--RID LOOKUP,��erisinde PK bulunan ancak CLUSTERED �NDEKS tan�mlanmam�� 
--olan tablolarda bulunan veriler i�in uygulan�r.
--Burada PK �zerinden bir index seek yapm�� sonrada RID lookup i�lemi yap�lm��.
--Burada t�m DatabaseLogID = 2 olanlar� bulur ama der ki,arad���m bilgiler bu indekste de�il,
--o y�zden key'e gidip oran�n �zerinmden tabloyu getirmem denmektedir.


--key lookup:

SELECT FirstName,LastName,Title FROM Person.Person
WHERE LastName LIKE 'Ken%'


---BOOKMARK LOOKUPS B�T�� --- :


--- COVERING INDEX :
--Bookmark looukplar� azaltmak i�in kullan�r�z.
--Arad���m�z her�eyi indekse koyar�z.Dolay�syla ana tablya gitmeden verilerimiz getirir.
--Yani index yarat�rken bir tane daha indeks ekleyece�iz.




--- SET STATISTICS IO :
--Sorgular� sonu�lar�n� kar��m�za getirirken tablolar� ne kadar okudu�u ile ilgili bilgi verir.
--
SET Statistics io on

SELECT PersonType FROM Person.Person
WHERE LastName LIKE 'Ken%'

--Burada sorguyu �al��t�rdan sonra messages k�sm�na giersek,tablonun ne kadar scan edildi�i ve logical read bilgilerini g�rebiliriz.
--Burada bizim i�in �nemli olan Scan count , logical reads k�s�mlar�d�r.
--�rne�in t�m plan cache'de olabilir dolay�syla hi� physical read yapmayabilirim.
--Bizim i�in �nemli olan Scan count , logical reads.
--�ndeksleri kald�r�rsak Logical reads'in artt���n� g�r�r�z.


--- SET STATISTICS TIME ON :

SET Statistics time on
--Bizim i�in burada �nemli olan elapsed time'd�r.
--Sorgu talebi al�nd�ktan sorgu sonucu bize g�sterilen zamana kadar olan s�reyi bize s�yler.
--

SELECT PersonType FROM Person.Person
WHERE LastName LIKE 'Ken%'