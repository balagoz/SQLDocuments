--- ### INDEX ### ---

--Index'ler tablolardan verileri daha kolay bulabilmek i�in sorgular taraf�ndan kullan�lan birimlerdir.
--Bir tablodaki veya view'daki indeks aynen kitaplardaki index'lere benzer.
--�rne�in e�er indeksiniz yoksa, kitapta hangi b�l�mde oldu�unuzu bilemezsiniz.
--Ancak indeksiniz varsa,indeksteki b�l�m�n sayfa say�s�na bakar ve direk sayfaya giderek istedi�iniz b�l�me gidebilirsiniz.
--Kitaplardaki indeksler sizin hangi b�l�mde oldu�unuzu bulman�z� olduk�a kolayla�t�r�r.
--Ayn� �ekilde tablo ve view indeksleride datay� bulmay� kolayla�t�r�r.
--Do�ru indeks kullan�m� sorgunun h�z�n� olduk�a y�kseltir.
--Sorguya yard�m ediecek bir indeks yoksa,sorgu her sat�r� tek tek kontrol etmek zorunda kalacakt�r.
--Buna tablo scan'i denir ve perf.i�in olduk�a k�t�d�r.


---- INDEX'LER G�R�� DERS� - BA�LANGI� ---- 
--�RNEK :
CREATE DATABASE [INDEX]

CREATE TABLE ABC
(
ID INT,
AD VARCHAR(50),
MAAS INT,
Cinsiyet CHAR(1)

);

INSERT INTO ABC VALUES
(1,'Onur',3500,'E'),
(2,'Murat',3500,'E'),
(3,'Kemal',6500,'E'),
(4,'Cem',4500,'E'),
(5,'Can',7500,'E');

SELECT * FROM ABC

--Bu tabloda, maa�� 5000 �LE 7000 aras�nda olan �al��anlar� bulal�m.
--1.YOL:
SELECT * FROM ABC
WHERE MAAS >5000 AND MAAS<7000

--2.YOL:
--Tek fark �u, between'in inclusive olmas�d�r.
SELECT * FROM ABC
WHERE MAAS BETWEEN 5000 AND 7000


--Bize t�m tablodaki sat�rlar� tek tek taray�p sonu� getirilir.
--Indeks olmad��� i�in sorgu sonucunu bu y�ntemi izlenerek getirildi.
--Yani Table Scan yap�ld�.
--Table Scan, b�y�k tablolarda performans ve h�z a��s�ndan olduk�a sorun yaratabilecek bir y�ntemdir.
--Bu problemi ��zelim.

--INDEKS YARATALIM:
--SYNTAX : CREATE INDEX �ndeks ad� ON TabloAd� (KolonAd�)

-- YARATILAN INDEX
CREATE INDEX deneme�ndeks ON ABC(MAAS ASC)

--ANA TABLOMUZ

--Indeksin yarat�l�p yarat�lmad���n� obj.explorer'da ilgili tablonun i�indeki indeks klas�r�nden g�rebiliriz. 
-- Burada sorguya yard�mc� olmas� i�in Maas kololunda indeks yaratt�k.
--ASC olarak s�rald���m�z i�in 5000 ile 7000 a�a��da olacakt�r.
--SQL Burada t�m tabloyu taramak yerine, arad��� �art� direk bulabildi.
--Nas�l ki kitaplar�n sayfalar� varsa,ayn� �ekilde sat�rlar�n da sat�r adresleri oldu�unu d���nebiliriz.
--Arad���m�z de�erler indekste (maas asc) altta oldu�u i�in oradaki sat�r adresleri daha h�zl� bulunur ve sonra 
--ana tabloya gidip istedi�im�z di�er bilgilerle bize sonu� getirilir.
--B�ylelikle t�m tabloyu taranmam�� olur.
--Buna Index SEEK denir.
--Bizim �u anda yaratt���m�z bu indeks non-unique and non clustured indeks t�r�ne �rnektir.

--sp_helpindex Tablo Ad�--Tabloda yarat�lan t�m indeksleri g�rebiliriz.
	sp_helpindex ABC

--DROP ETMEK ���N :DROP INDEX Tablo Ad�.Indeks Ad�

DROP INDEX ABC.deneme�ndeks

--Biz indexi query yayzarak yaratt�k.Anacak GU�'den de yaratabilridir.
--Obj.EXP'da indeks folder-sa� t�k -new indeks-indeks ad�n� gir.--�ndeks t�r�n� gir--Unique olup olmayaca��n� se�--Sonra ADD'den kolonlar� se�.

CREATE TABLE INDEKSGOSTERIM
(
MAAS INT,
SATIRDARES� VARCHAR(20)
);

--INDEX �ALI�MA MANTI�I :
INSERT INTO INDEKSGOSTERIM VALUES
(3500,'Sat�r Adresi'),
(3500,'Sat�r Adresi'),
(4500,'Sat�r Adresi'),
(6500,'Sat�r Adresi'),
(7500,'Sat�r Adresi');

SELECT * FROM INDEKSGOSTERIM
---- INDEX'LER G�R�� DERS� - B�T�� ----




---- INDEKS �E��TLER� : CLUSTERED VE NON - CLUSTERED INDEKSLER ----

-- Ba�l�ca �ndeks �e�itleri :
	--Clustered
	--Non Clustered
	--Unique

	--Filtered
	--XML
	--FULL TEXT ...


--CLustered INDEX :
--Clustered index tabldaki datan�n fiziksel s�ras�n� belirler.
--Bu y�zden tablolarda sadece 1 adet Clustered index olabilir.

--�RNEK :

CREATE TABLE TABLOB�R
(

ID INT PRIMARY KEY,
AD VARCHAR(50),
MAAS INT,
Cinsiyet VARCHAR(50),
Sehir VARCHAR(50)
);

select * from TABLOB�R

--Burada PK kolonu otomatik olarak clustered indeks yarat�r 
--ilgili PK kolonu �zerinde.(e�er ba�ka bir clustered indeks yoksa)

--Peki nas�l check edicez?
--1. YOL :
EXEC sp_helpindex TABLOB�R -- Burada ID kolonunun �NDEX oldu�unu g�r�r�r�z.


--Index'in yarat�l�p yarat�lmad���n� kontrol etmenin 2.yolu :
--OBJ.EXP'DAN Tablodan �ndeks Klas�r�nden g�rebiliriz.

--�imdi veri girelim:
--A�a��da g�rd���m�z gibi veriler s�ra ile girilmemi�tir.
--Ama ID kolonu clustered �ndex oldu�u i�in 
--ve clustured indeksler fiziksel s�ray� belirledi�i i�in
--SELECT * FROM TABLOB�R dedi�imiz de ID'lerin s�ral� geldi�ini g�rmekteyiz.


SELECT * FROM TABLOB�R

INSERT INTO TABLOB�R VALUES
(5,'Onur',1000,'E','�stanbul'),
(2,'Murat',2000,'E','�stanbul'),
(4,'Kemal',3000,'E','�zmir'),
(3,'Cem',4000,'E','Ankara'),
(1,'Can',1000,'E','�stanbul'),
(8,'Cansu',3000,'K','�zmir'),
(6,'Pelin',4000,'K','Ankara'),
(7,'Seda',1000,'K','�stanbul');


--CLUSTERED INDEKS oldu�u i�in tablomuz ID kolonuna g�re s�ralan�p sonu� g�sterilmi�tir.

--CLUSTERED INDEX TELEFON REHBER�NE BENZER.
--�rne�in telefon rehberinde genellikle soyad�na g�re s�ralama vard�r.
--�rne�imizde de clustered indeks key'ine g�re s�ralama yap�lm��t�r.
--Tablolarda sadece bir clustered indeks olabilir.
--Ancak bir clustered index birden fazla kolon i�erebilir.
--Bu t�r indekslere composit indeks veya composit clustered index denmektedir.
--Nas�l ki telefon reberinde �nce soyada sonrada soyad'�n i�inde ad'a g�re bir s�ralma vard�r.
--Bu t�r clustured index'lerde bu tip bir yap� vard�r.
--Non - Clustered indeks'lerde i�erisnde birden �ok kolon bar�nd�rabilir.
--Bunlarada composit non - clustered index denir
--Telefon rehberi bir composite indextir.(Last name sonra first name'e g�re organize edilmi�.)


--Composite Clustered Index Yaratal�m :
--Cinsiyet ve Maas kolonlar� i�in yaratmak istiyoruz.

SELECT * FROM TABLOB�R
--�u anda ID'y e g�re s�ral�.

--Pk clustered index oldu�u i�in indeksimiz olu�tutrurken hata al�r�z.
CREATE Clustered Index Deneme 
ON TABLOB�R(Cinsiyet DESC,Maas ASC)

--O y�zden ilk ba�ta drop edicez.
--A�a��dakini drop ederesem de hata al�r�m. O y�zden OBJECT EXP'TEN BU �NDEX� S�LECE��Z.
DROP INDEX PK__TABLOB�R__3214EC2797C3811A;--PK index ad�n� kopyalad�m

--��mdi tekrar creat etmeye �al��al�m clustered indexi.
--A�a��da yaratt���m�z bir composite clustered index.B
--Birden falza kolon i�in yaratabildik ama unutmamal�y�z ki bir tabloda
--tek bir clustered index yaratabilirim.
CREATE Clustered Index Deneme 
ON TABLOB�R(Cinsiyet DESC,Maas ASC)

--Id s�ras�n�n de�i�ti�ini g�r�r�z.
SELECT * FROM TABLOB�R



----NON CLUSTERED INDEX : ----

SELECT * FROM TABLOB�R

--SYNTAX:
CREATE NonClustered Index IndexAd�
ON TabloAd�(KolonAd�)

--Clustered indexte data Clustered indexte belritilen Kolon'a g�re s�ralanmaktad�r.
--Ancak Non Clustered indexte data ba�ka bir yerde, index ba�ka bir yerde tutuluyor gibi d���nebiliriz.
--Kitaplardaki indeksler gibi d���nebiliriz.
--�rne�in B�l�m 5' e gitmemiz s�ylenmi�,ne yapaca��z ?
--Kitab�n ba��ndaki index ks�m�na gidice�iz ve ilgili sayfan�n hangi b�l�mde yer ald���n� rahatl�kla bulabiliriz.
--Yani non clus.index ger�ek datadan ayr� olarak tutulmaktad�r.Index ve data ayr� burada diye d���nebiliriz.
--Kitaptaki index ile telefon rehberi (ORDER BY ) farkl� �eyler.
--Tel.Rehberinde veya s�zl�kte veri alfabetik s�raya g�re s�ralanm��t�r.
--Tel.Rehberinde veya s�zl�kte ayr� ve ba��ms�z bir indeks yoktur.
--Ama kitapta ayr� bir indeks sayfas� var ve datalar�n yani sayfalar�n ayr� yerlerde oldu�unu g�rmekteyiz.
--Dolay�syla Non clustured index'i kitap'a benzetebiliriz.

--�RNEK:

CREATE NonClustered Index DenemeNonclus
ON TABLOB�R(Ad ASC)

--Bunu yaratt�ktan sonra ��yle d���nebiliriz.
--Tablomuz bir yerde ve indekseimiz ayr� bir yerde gibi d���nebilriz.
--Ayr� yerde olan indeksimde AD kolonu A-Z'ye g�re s�ral� ve yanlar�n rowadressler var.

SELECT * FROM TABLOB�R
WHERE AD='Onur'

--Onur'u bu indeksten bulacak sonra Onurun yan�ndaki row adrresi bulup hemen ana tablya gidip istenilen
--di�er bilgileri getirecek.
--Tabloda birden fazla non clustured indeks olabilir.
--Kitap gibi d���nebiliriz.B�L�MLER var birde KEL�MELER indeksi var gibi.
--Non clustured indeks, g�rd���m��z tablonun nas�l s�raland���n� etkilemez.Clutered indeks ise bu �ekilde davran�r.
--Clustered indeks yoksa, datan�n nas�l s�rlanaca�� belli de�ildir.



--Cluster - Non - Cluster INDEX Farkl�l�lar� :
--Bir tabloda sadece bir adet clustured indeks olurken,non clustered indekste s�n�r yoktur.
--Clustered indeks daha h�zl�d�r.��nk� her�ey ana tabloda ger�ekle�mektedir
--Non Clustered ise tablodan ayr� tutuldu�u i�in clustered index'e g�re biraz daha yava� kalabilir.
--Ayr�ca Non clustured indeksler tablodan ayr� bir yerde tutuldu�u i�in, ekstra disk space'e ihtiya� duyarlar.



----- #### UNIQUE VE NON UNIQUE INDEX #### ------
--�rne�in a�a��da pk k�s�t� ile otomatik olarak unique clustered index yarat�l�r.

CREATE TABLE XYZ
(

ID INT PRIMARY KEY,
AD VARCHAR(50),
MAAS INT,
Cinsiyet VARCHAR(50),
Sehir VARCHAR(50)
);

SELECT * FROM XYZ

--SP_HELP�NDEX'ten kontrol ederek UN�QUE CLUSTURED �NDEX yarat�ld���n� g�rebiliriz.
EXEC sp_helpindex XYZ



--SP_HELP�NDEX'ten kontrol edebilriz.uN�QUE CLUSTURED �NDEX YARATTI�INI G�REBEL�R�Z.


--Bu �rnekte perde arkas�nda PK, unquiqe index'i kullan�r de�erlerin unique olabilmesi i�in.
--Burada index'i silersek PK anahtar�da silinir.
--Art�k dataya dublicate veri girebilece�im anlam�na gelir.
--Clustured ve Non clusrtured indexlerde unique olabilir.



EXEC sp_helpindex XYZ

INSERT INTO XYZ VALUES
(5,'Onur',1000,'E','�stanbul'),
(2,'Murat',2000,'E','Adana'),
(4,'Kemal',3000,'E','�zmir'),
(3,'Cem',4000,'E','Ankara'),
(1,'Can',1000,'E','Edirne');


--UNIQUE NON CLUSTURED INDEX YARATALIM :

SELECT * FROM XYZ

--UNIQUE NON CLUSTURED INDEX index yaratman�n temelde 2 yolu vard�r :

--1.YOL:
--�rne�in a�a��daki gibi bir UNIQUE NONCLUSTERED INDEX yarat�rsak
--hi�bir �al��an ayn� ad ve maa�� alamazlar.
	CREATE UNIQUE NONCLUSTERED INDEX XYZDENEME
	ON CINDEKS(AD,MAAS)

--2 .YOL:
--UNIQUE CONSTRAINT VE UNIQEU INDEX Farkl�l��� :
--Temelde farkl�l�k� bulunmamaktad�r.
--Asl�nda unique constraint yaratt���n�zda arka planda unique index yarat�l�r.
--�rne�in Tablomda t�m �ehirlerin unique olmas�n� istiyorum.

--A�a��daki ifadeyi yaz�nca tablomuza hem constraint  hemde unique index eklendi�ini g�rebiliriz.
ALTER TABLE XYZ
ADD CONSTRAINT UQ_C�TY
UNIQUE(Sehir);
--Burada UNIQUE index'in clustured olarak da belirtebiliriz.
ALTER TABLE XYZ
ADD CONSTRAINT UQ_C�TYY
UNIQUE CLUSTERED (Sehir);

--�zetle unique indeks yaratman�n 2 yolu var.
--1.yol :Unique constraint ekleyebilrisin.
--2.yol :Uniqe index yaratmak.

--PK k�s�t� ,default olarak unque clustured indeks yarat�r.
--UNIQUE k�s�t� ise,unique non clustured indeks yarat�r.



--1:Index'ler sorgular taraf�ndan veriyi daha kolay bulabilmek i�in kullan�l�r.
--2:Clustured index'ler ekstra disk space kullanmaz ancak,ama 
--her non clustured index art� disk space kullan�r.
--��nk� tablodan ayr� olarak tutulmaktad�rlar.
--3:INSERT ,UPDATE DELETE i�lemleri yava� �al��abilir.
--��nk� tablo g�ncellenirken indekslerinde g�ncellenmesi gerekir.




