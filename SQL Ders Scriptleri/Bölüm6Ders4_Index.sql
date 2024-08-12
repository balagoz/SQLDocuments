--- ### INDEX ### ---

--Index'ler tablolardan verileri daha kolay bulabilmek için sorgular tarafýndan kullanýlan birimlerdir.
--Bir tablodaki veya view'daki indeks aynen kitaplardaki index'lere benzer.
--Örneðin eðer indeksiniz yoksa, kitapta hangi bölümde olduðunuzu bilemezsiniz.
--Ancak indeksiniz varsa,indeksteki bölümün sayfa sayýsýna bakar ve direk sayfaya giderek istediðiniz bölüme gidebilirsiniz.
--Kitaplardaki indeksler sizin hangi bölümde olduðunuzu bulmanýzý oldukça kolaylaþtýrýr.
--Ayný þekilde tablo ve view indeksleride datayý bulmayý kolaylaþtýrýr.
--Doðru indeks kullanýmý sorgunun hýzýný oldukça yükseltir.
--Sorguya yardým ediecek bir indeks yoksa,sorgu her satýrý tek tek kontrol etmek zorunda kalacaktýr.
--Buna tablo scan'i denir ve perf.için oldukça kötüdür.


---- INDEX'LER GÝRÝÞ DERSÝ - BAÞLANGIÇ ---- 
--ÖRNEK :
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

--Bu tabloda, maaþý 5000 ÝLE 7000 arasýnda olan çalýþanlarý bulalým.
--1.YOL:
SELECT * FROM ABC
WHERE MAAS >5000 AND MAAS<7000

--2.YOL:
--Tek fark þu, between'in inclusive olmasýdýr.
SELECT * FROM ABC
WHERE MAAS BETWEEN 5000 AND 7000


--Bize tüm tablodaki satýrlarý tek tek tarayýp sonuç getirilir.
--Indeks olmadýðý için sorgu sonucunu bu yöntemi izlenerek getirildi.
--Yani Table Scan yapýldý.
--Table Scan, büyük tablolarda performans ve hýz açýsýndan oldukça sorun yaratabilecek bir yöntemdir.
--Bu problemi çözelim.

--INDEKS YARATALIM:
--SYNTAX : CREATE INDEX ýndeks adý ON TabloAdý (KolonAdý)

-- YARATILAN INDEX
CREATE INDEX denemeýndeks ON ABC(MAAS ASC)

--ANA TABLOMUZ

--Indeksin yaratýlýp yaratýlmadýðýný obj.explorer'da ilgili tablonun içindeki indeks klasöründen görebiliriz. 
-- Burada sorguya yardýmcý olmasý için Maas kololunda indeks yarattýk.
--ASC olarak sýraldýðýmýz için 5000 ile 7000 aþaðýda olacaktýr.
--SQL Burada tüm tabloyu taramak yerine, aradýðý þartý direk bulabildi.
--Nasýl ki kitaplarýn sayfalarý varsa,ayný þekilde satýrlarýn da satýr adresleri olduðunu düþünebiliriz.
--Aradýðýmýz deðerler indekste (maas asc) altta olduðu için oradaki satýr adresleri daha hýzlý bulunur ve sonra 
--ana tabloya gidip istediðimþz diðer bilgilerle bize sonuç getirilir.
--Böylelikle tüm tabloyu taranmamýþ olur.
--Buna Index SEEK denir.
--Bizim þu anda yarattýðýmýz bu indeks non-unique and non clustured indeks türüne örnektir.

--sp_helpindex Tablo Adý--Tabloda yaratýlan tüm indeksleri görebiliriz.
	sp_helpindex ABC

--DROP ETMEK ÝÇÝN :DROP INDEX Tablo Adý.Indeks Adý

DROP INDEX ABC.denemeýndeks

--Biz indexi query yayzarak yarattýk.Anacak GUÝ'den de yaratabilridir.
--Obj.EXP'da indeks folder-sað týk -new indeks-indeks adýný gir.--Ýndeks türünü gir--Unique olup olmayacaðýný seç--Sonra ADD'den kolonlarý seç.

CREATE TABLE INDEKSGOSTERIM
(
MAAS INT,
SATIRDARESÝ VARCHAR(20)
);

--INDEX ÇALIÞMA MANTIÐI :
INSERT INTO INDEKSGOSTERIM VALUES
(3500,'Satýr Adresi'),
(3500,'Satýr Adresi'),
(4500,'Satýr Adresi'),
(6500,'Satýr Adresi'),
(7500,'Satýr Adresi');

SELECT * FROM INDEKSGOSTERIM
---- INDEX'LER GÝRÝÞ DERSÝ - BÝTÝÞ ----




---- INDEKS ÇEÞÝTLERÝ : CLUSTERED VE NON - CLUSTERED INDEKSLER ----

-- Baþlýca Ýndeks Çeþitleri :
	--Clustered
	--Non Clustered
	--Unique

	--Filtered
	--XML
	--FULL TEXT ...


--CLustered INDEX :
--Clustered index tabldaki datanýn fiziksel sýrasýný belirler.
--Bu yüzden tablolarda sadece 1 adet Clustered index olabilir.

--ÖRNEK :

CREATE TABLE TABLOBÝR
(

ID INT PRIMARY KEY,
AD VARCHAR(50),
MAAS INT,
Cinsiyet VARCHAR(50),
Sehir VARCHAR(50)
);

select * from TABLOBÝR

--Burada PK kolonu otomatik olarak clustered indeks yaratýr 
--ilgili PK kolonu üzerinde.(eðer baþka bir clustered indeks yoksa)

--Peki nasýl check edicez?
--1. YOL :
EXEC sp_helpindex TABLOBÝR -- Burada ID kolonunun ÝNDEX olduðunu görürürüz.


--Index'in yaratýlýp yaratýlmadýðýný kontrol etmenin 2.yolu :
--OBJ.EXP'DAN Tablodan Ýndeks Klasöründen görebiliriz.

--Þimdi veri girelim:
--Aþaðýda gördüðümüz gibi veriler sýra ile girilmemiþtir.
--Ama ID kolonu clustered ýndex olduðu için 
--ve clustured indeksler fiziksel sýrayý belirlediði için
--SELECT * FROM TABLOBÝR dediðimiz de ID'lerin sýralý geldiðini görmekteyiz.


SELECT * FROM TABLOBÝR

INSERT INTO TABLOBÝR VALUES
(5,'Onur',1000,'E','Ýstanbul'),
(2,'Murat',2000,'E','Ýstanbul'),
(4,'Kemal',3000,'E','Ýzmir'),
(3,'Cem',4000,'E','Ankara'),
(1,'Can',1000,'E','Ýstanbul'),
(8,'Cansu',3000,'K','Ýzmir'),
(6,'Pelin',4000,'K','Ankara'),
(7,'Seda',1000,'K','Ýstanbul');


--CLUSTERED INDEKS olduðu için tablomuz ID kolonuna göre sýralanýp sonuç gösterilmiþtir.

--CLUSTERED INDEX TELEFON REHBERÝNE BENZER.
--Örneðin telefon rehberinde genellikle soyadýna göre sýralama vardýr.
--Örneðimizde de clustered indeks key'ine göre sýralama yapýlmýþtýr.
--Tablolarda sadece bir clustered indeks olabilir.
--Ancak bir clustered index birden fazla kolon içerebilir.
--Bu tür indekslere composit indeks veya composit clustered index denmektedir.
--Nasýl ki telefon reberinde Önce soyada sonrada soyad'ýn içinde ad'a göre bir sýralma vardýr.
--Bu tür clustured index'lerde bu tip bir yapý vardýr.
--Non - Clustered indeks'lerde içerisnde birden çok kolon barýndýrabilir.
--Bunlarada composit non - clustered index denir
--Telefon rehberi bir composite indextir.(Last name sonra first name'e göre organize edilmiþ.)


--Composite Clustered Index Yaratalým :
--Cinsiyet ve Maas kolonlarý için yaratmak istiyoruz.

SELECT * FROM TABLOBÝR
--Þu anda ID'y e göre sýralý.

--Pk clustered index olduðu için indeksimiz oluþtutrurken hata alýrýz.
CREATE Clustered Index Deneme 
ON TABLOBÝR(Cinsiyet DESC,Maas ASC)

--O yüzden ilk baþta drop edicez.
--Aþaðýdakini drop ederesem de hata alýrým. O yüzden OBJECT EXP'TEN BU ÝNDEXÝ SÝLECEÐÝZ.
DROP INDEX PK__TABLOBÝR__3214EC2797C3811A;--PK index adýný kopyaladým

--ÞÝmdi tekrar creat etmeye çalýþalým clustered indexi.
--Aþaðýda yarattýðýmýz bir composite clustered index.B
--Birden falza kolon için yaratabildik ama unutmamalýyýz ki bir tabloda
--tek bir clustered index yaratabilirim.
CREATE Clustered Index Deneme 
ON TABLOBÝR(Cinsiyet DESC,Maas ASC)

--Id sýrasýnýn deðiþtiðini görürüz.
SELECT * FROM TABLOBÝR



----NON CLUSTERED INDEX : ----

SELECT * FROM TABLOBÝR

--SYNTAX:
CREATE NonClustered Index IndexAdý
ON TabloAdý(KolonAdý)

--Clustered indexte data Clustered indexte belritilen Kolon'a göre sýralanmaktadýr.
--Ancak Non Clustered indexte data baþka bir yerde, index baþka bir yerde tutuluyor gibi düþünebiliriz.
--Kitaplardaki indeksler gibi düþünebiliriz.
--Örneðin Bölüm 5' e gitmemiz söylenmiþ,ne yapacaðýz ?
--Kitabýn baþýndaki index ksýmýna gidiceðiz ve ilgili sayfanýn hangi bölümde yer aldýðýný rahatlýkla bulabiliriz.
--Yani non clus.index gerçek datadan ayrý olarak tutulmaktadýr.Index ve data ayrý burada diye düþünebiliriz.
--Kitaptaki index ile telefon rehberi (ORDER BY ) farklý þeyler.
--Tel.Rehberinde veya sözlükte veri alfabetik sýraya göre sýralanmýþtýr.
--Tel.Rehberinde veya sözlükte ayrý ve baðýmsýz bir indeks yoktur.
--Ama kitapta ayrý bir indeks sayfasý var ve datalarýn yani sayfalarýn ayrý yerlerde olduðunu görmekteyiz.
--Dolayýsyla Non clustured index'i kitap'a benzetebiliriz.

--ÖRNEK:

CREATE NonClustered Index DenemeNonclus
ON TABLOBÝR(Ad ASC)

--Bunu yarattýktan sonra þöyle düþünebiliriz.
--Tablomuz bir yerde ve indekseimiz ayrý bir yerde gibi düþünebilriz.
--Ayrý yerde olan indeksimde AD kolonu A-Z'ye göre sýralý ve yanlarýn rowadressler var.

SELECT * FROM TABLOBÝR
WHERE AD='Onur'

--Onur'u bu indeksten bulacak sonra Onurun yanýndaki row adrresi bulup hemen ana tablya gidip istenilen
--diðer bilgileri getirecek.
--Tabloda birden fazla non clustured indeks olabilir.
--Kitap gibi düþünebiliriz.BÖLÜMLER var birde KELÝMELER indeksi var gibi.
--Non clustured indeks, gördüðümüðz tablonun nasýl sýralandýðýný etkilemez.Clutered indeks ise bu þekilde davranýr.
--Clustered indeks yoksa, datanýn nasýl sýrlanacaðý belli deðildir.



--Cluster - Non - Cluster INDEX Farklýlýlarý :
--Bir tabloda sadece bir adet clustured indeks olurken,non clustered indekste sýnýr yoktur.
--Clustered indeks daha hýzlýdýr.Çünkü herþey ana tabloda gerçekleþmektedir
--Non Clustered ise tablodan ayrý tutulduðu için clustered index'e göre biraz daha yavaþ kalabilir.
--Ayrýca Non clustured indeksler tablodan ayrý bir yerde tutulduðu için, ekstra disk space'e ihtiyaç duyarlar.



----- #### UNIQUE VE NON UNIQUE INDEX #### ------
--Örneðin aþaðýda pk kýsýtý ile otomatik olarak unique clustered index yaratýlýr.

CREATE TABLE XYZ
(

ID INT PRIMARY KEY,
AD VARCHAR(50),
MAAS INT,
Cinsiyet VARCHAR(50),
Sehir VARCHAR(50)
);

SELECT * FROM XYZ

--SP_HELPÝNDEX'ten kontrol ederek UNÝQUE CLUSTURED ÝNDEX yaratýldýðýný görebiliriz.
EXEC sp_helpindex XYZ



--SP_HELPÝNDEX'ten kontrol edebilriz.uNÝQUE CLUSTURED ÝNDEX YARATTIÐINI GÖREBELÝRÝZ.


--Bu örnekte perde arkasýnda PK, unquiqe index'i kullanýr deðerlerin unique olabilmesi için.
--Burada index'i silersek PK anahtarýda silinir.
--Artýk dataya dublicate veri girebileceðim anlamýna gelir.
--Clustured ve Non clusrtured indexlerde unique olabilir.



EXEC sp_helpindex XYZ

INSERT INTO XYZ VALUES
(5,'Onur',1000,'E','Ýstanbul'),
(2,'Murat',2000,'E','Adana'),
(4,'Kemal',3000,'E','Ýzmir'),
(3,'Cem',4000,'E','Ankara'),
(1,'Can',1000,'E','Edirne');


--UNIQUE NON CLUSTURED INDEX YARATALIM :

SELECT * FROM XYZ

--UNIQUE NON CLUSTURED INDEX index yaratmanýn temelde 2 yolu vardýr :

--1.YOL:
--Örneðin aþaðýdaki gibi bir UNIQUE NONCLUSTERED INDEX yaratýrsak
--hiçbir çalýþan ayný ad ve maaþý alamazlar.
	CREATE UNIQUE NONCLUSTERED INDEX XYZDENEME
	ON CINDEKS(AD,MAAS)

--2 .YOL:
--UNIQUE CONSTRAINT VE UNIQEU INDEX Farklýlýðý :
--Temelde farklýlýký bulunmamaktadýr.
--Aslýnda unique constraint yarattýðýnýzda arka planda unique index yaratýlýr.
--Örneðin Tablomda tüm þehirlerin unique olmasýný istiyorum.

--Aþaðýdaki ifadeyi yazýnca tablomuza hem constraint  hemde unique index eklendiðini görebiliriz.
ALTER TABLE XYZ
ADD CONSTRAINT UQ_CÝTY
UNIQUE(Sehir);
--Burada UNIQUE index'in clustured olarak da belirtebiliriz.
ALTER TABLE XYZ
ADD CONSTRAINT UQ_CÝTYY
UNIQUE CLUSTERED (Sehir);

--Özetle unique indeks yaratmanýn 2 yolu var.
--1.yol :Unique constraint ekleyebilrisin.
--2.yol :Uniqe index yaratmak.

--PK kýsýtý ,default olarak unque clustured indeks yaratýr.
--UNIQUE kýsýtý ise,unique non clustured indeks yaratýr.



--1:Index'ler sorgular tarafýndan veriyi daha kolay bulabilmek için kullanýlýr.
--2:Clustured index'ler ekstra disk space kullanmaz ancak,ama 
--her non clustured index artý disk space kullanýr.
--Çünkü tablodan ayrý olarak tutulmaktadýrlar.
--3:INSERT ,UPDATE DELETE iþlemleri yavaþ çalýþabilir.
--Çünkü tablo güncellenirken indekslerinde güncellenmesi gerekir.




