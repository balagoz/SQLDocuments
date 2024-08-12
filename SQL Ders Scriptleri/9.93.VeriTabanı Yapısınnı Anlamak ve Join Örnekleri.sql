
-- ### JOIN GENEL ### -




--2 veya daha fazla tablodan bilgi al�p tablolar�m�z� birle�tirebiliriz.
--Join i�lemine ihtiya� duyulmas�n�n bilgilerimiz kategorize edilmi� bir �ekilde farkl� tablolarda durmaktad�r.
--�rne�in Bi yazar�n yazd��� kitapID'si tablomuzda olabilir ancak Kitab�n Ad� ve di�er bilgileri ba�ka bir tabloda olabilir.
--Tablolar�m�z birbirlerine ba�lant�l� oldu�u i�in ki genelde bu ba�lant� PK ve FK ili�kisi ile kurulur,arad���m�z 
--bilgiyi tablolar aras�nda k�pr� i�levi g�ren s�tunlar �zerinden ilgili tablolara ula�arak bulabiliriz. 
--Unutulmama�ld�r ki tablolar�m�z� joinlemek i�in resmi bir PK VE FK ili�kisine ihtiyac�m�z yoktur.
--Genelde PK ve FK ili�kis s�rekli kar��m�za ��kar ancak onlars�z join i�lemi yapamy�z gibi bir d���nce yanl�� olacakt�r. 
--PK ve �zellikle FK k�s�tlar� veri b�t�nl��� i�in olmazsa olmazd�r,Join yaparken de tablolar aras�nda k�pr� g�revi g�recek 
--kolonlar�m�z �o�u kez PF ve FK ili�kisyle birbirlerine ba�lanm��t�r.Ancak demin de bahsetti�imiz
--gibi bu durum join yapabilmemiz i�in zaruri de�ildir.
--Tabi ki resmi olarak PK ve FK kolonlar�n�n tan�mlanm�� olmas� daha iyi olacakt�r.


------------------JOIN GENEL �RNEK --------------------------

SELECT * FROM Person.PersonPhone -- PhoneNumberTypeID -- 19.972 Kay�t

SELECT * FROM Person.PhoneNumberType -- PhoneNumberTypeID



/*
Join T�rlerimize ge�meden �nce join i�lemiyle ilgili bir al��t�rma yapal�m.
�ki tablomuzdaki ortak kolonda PhoneNumberTypeID.
�imdi bu kolonu yani k�pr�y� kullanarak 2 tablomuzu joinleyece�iz.

Peki Neden bu i�leme ihtiya� duyuyoruz? 
Dikkat ederseniz,Person.PhoneNumberType  tablosunda PhoneNumberTypeID kolonunun yan�nda Name yani isim bilgiside 
belrtilmi�.
Ancak g�rd���m�z gibi Person.PersonPhone tablosunda ise sadece PhoneNumberTypeID bilgisi belirtilmi�.
�rne�in biz, �u anda BusinessEntityID = 1 olan ki�inin ilgili telefon numaras�n�n PhoneNumberTypeID'sinin 1 oldu�unu
g�r�yoruz. Ancak tablomuzun yan�nda yazmas�n� istiyoruz bu bilginin.
Yani arad���m�z bilgi olan "Name" bilgisi ba�ka bir tabloda bulunuyor.Person.PhoneNumberType tablosunda.
Dolay�s�yla tablolar�m�z birle�tirmemiz gerekmekte.

Peki biz neye dayanarak veya bir ba�ka deyi�le hangi k�pr�y� kullanarak ( hangi ortak kolon ) 
tablolar�m�z� birle�tirece�iz ?


Person.PersonPhone tablomuzda BusinessEntityID 'lerin yanlar�nda PhoneNumberTypeID s�t�nu var.
Ve bu s�tundaki bilgilerimiz Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan gelmekte.
2 Tablodaki ba�lant�n�n PhoneNumberTypeID kolonu �zerinden ger�ekle�ti�ini ve veri b�t�nl���n�n sa�lanmas� 
ad�na FK ili�kisinin de yarat�ld���n� kan�tlam��t�k.

�imdi gelin tekrar kontrol edelim.

G�r�ld��� gibi Person.PersonPhone tablosundaki PhoneNumberTypeID kolonumuz FK olarak belirlenmi�.
Peki hangi tablodaki s�tuna referans g�sterilmi�?
Person.PhoneNumberType tablosundaki PhoneNumberTypeID'nuna referans g�sterilmi�.
Yani,Person.PersonPhone tablosundaki PhoneNumberTypeID kolonu verilerini 
Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan al�yor.


FK k�s�t� da tan�mlanarak PK tablosundaki PhoneNumberTypeID kolonunda bulunan veriler
haricinde bir veri girmeye kalkt���m�zda SQL bize FK k�s�t ihlali hatas� verecektir.
B�ylelikle Person.PhoneNumberType tablosunda bulunan PhoneNumberTypeID kolonundaki veriler haricinde
Person.PersonPhone tablosundaki PhoneNumberTypeID kolonuna yanl�� veri giremeyece�iz.

Ancak �u anda bizi as�l ilgilendiren konu,tablolar�m�z� nas�l birle�tirce�imizdi ve Neden Join i�lemine
gerek duydu�umuzdu?

Tablolar�m�z� birle�tirebilmemiz i�in Ortak kolona ihtiyac�m�z bulunmaktayd�.
Asl�nda arad���m�z �eyi zaten bulmu� olduk.
Ortak kolonumuz PhoneNumberTypeID kolonudur.
Joinleme i�lemini yaparken K�pr� olarak PhoneNumberTypeID kolonunu kullanaca��z.



Gelin,�imdi JOIN yap�m�z� inceleyelim.

Bu �rnekte,soldaki tablomuz olan Person.PersonPhone tablosundaki t�m sat�rlar�n eksiksiz
bir �ekilde gelmesini istiyoruz.
Dolay�syla bu tip durumlarda join t�r� olarak LEFT JOIN'i kullanmam�z gerekmektedir.
LEFT JOIN'de Soldaki tablonun tamam� geliyor.

Ortak kolonumuz olan PhoneNumberTypeID kolonuyla kesi�en bilgileri zaten g�rece�iz.
Kesi�meyen bir PhoneNumberTypeID oldu�u takdirde ise ilgili sat�r� NULL olarak g�rece�iz.
Ama her hal�karda soldaki tablomuzun tamam� sonu� setinde kar��m�za ��kacakt�r.

Soldaki tablomuz olarak Person.PersonPhone tablosunu,sa�daki tablomuz olarak da Person.PhoneNumberType tablosunu
syntax�m�za yerle�tiriyoruz.

Join �art� veya bir ba�ka deyi�le kulland���m�z k�pr� olarak da PhoneNumberTypeID kolonunu belirlemi�tik.
��nk� bu kolon saysesin iki tabloyu birle�tirebiliriz.
Dolay�syla bu ortak kolonu a�a��daki JOIN syntax yap�s�nda g�r�ld��� gibi belrtiyoruz.

Person.PersonPhone tablosundaki PhoneNumberTypeID kolonu ile Person.PhoneNumberType tablosundaki 
PhoneNumberTypeID kolonunun e�it oldu�unu belrtiyoruz.

*/

SELECT * FROM Person.PersonPhone -- PhoneNumberTypeID -- 19.972 Kay�t

SELECT * FROM Person.PhoneNumberType -- PhoneNumberTypeID


--OR�J�NAL YAPI :
SELECT * FROM
Person.PersonPhone
LEFT JOIN
Person.PhoneNumberType
ON Person.PersonPhone.PhoneNumberTypeID = Person.PhoneNumberType.PhoneNumberTypeID

--AL�AS KULLANIRSAK :
SELECT * FROM
Person.PersonPhone A
LEFT JOIN
Person.PhoneNumberType B
ON A.PhoneNumberTypeID = B.PhoneNumberTypeID


--G�r�ld��� gibi soldaki tablomuzuzn yan�na sa�daki tablomuzu getirmi� olduk.
--Art�k Person.PersonPhone tablosundali PhoneNumberTypeID'lerin yan�na Person.PhoneNumberType tablosundaki t�m e�le�en
--PhoneNumberTypeID'ler geldi.Bir sonraki a�amada tablomuzu istedi�imiz kolonlar� se�erek getirebiliriz.


SELECT * FROM Person.PersonPhone -- PhoneNumberTypeID -- 19.972 Kay�t

SELECT * FROM Person.PhoneNumberType -- PhoneNumberTypeID


--AL�AS KULLANIRSAK :
SELECT 
A.BusinessEntityID,
A.PhoneNumber,
A.PhoneNumberTypeID,
B.Name
FROM
Person.PersonPhone A
LEFT JOIN
Person.PhoneNumberType B
ON A.PhoneNumberTypeID = B.PhoneNumberTypeID




--INNER JOIN,OUTER(LEFT,RIGHT,FULL),CROSS JOIN,SELF JOIN


--SYNTAX:
--GENEL SYNTAX:
SELECT Kolon Listesi FROM 
LEFT TABLE
JOIN TYPE 
RIGHT TABLE
ON JOIN CONDITION







--INNER JOIN
SELECT Kolon Listesi FROM 
LEFT TABLE
INNER JOIN
RIGHT TABLE
ON JOIN CONDITION


--LEFT JOIN
SELECT Kolon Listesi FROM 
LEFT TABLE
LEFT JOIN
RIGHT TABLE
ON JOIN CONDITION

--RIGHT JOIN
SELECT Kolon Listesi FROM 
LEFT TABLE
RIGHT JOIN
RIGHT TABLE
ON JOIN CONDITION



--FULL JOIN
SELECT Kolon Listesi FROM 
LEFT TABLE
FULL JOIN
RIGHT TABLE
ON JOIN CONDITION





--Yukar�daki ifade ile a�a��daki ifade ayn�d�r.
--Sadece JOIN TYPE'tan sonra ENTER tu�una bas�p "SA�DAK� TABLO"muzu
--bir a�a��ya alabiliriz.
--Soldaki tablo denmesinin nedeni 
--tablonun Join t�r�n�n(join type)solunda kalmas�d�r.
SELECT Kolon Listesi 
FROM SOLDAK� TABLO JOIN TYPE SA�DAK� TABLO
ON JOIN CONDITION


------------------------------------------




--### JO�N'� ANLAMAK �RNEK 1 BA�LANGI� ###


--�RNEK :

SELECT * FROM Ornek.dbo.Ulke

SELECT * FROM Ornek.dbo.Seh�r


--T�rkiyeden 2 kay�t var.
--Almanyadan 1 kay�t var.
--�ngiltereden kay�t Yok.
--New Yorkunda �lke tablosunda kayd� Yok.

--### INNER JOIN BA�LANGI� ###


--INNER JO�N :
--Sadece Kesi�enler

SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Seh�r --1,2


SELECT * FROM 
Ornek.dbo.Ulke 
INNER JOIN
Ornek.dbo.Seh�r
ON Ornek.dbo.Ulke.UlkeID = Ornek.dbo.Seh�r.UlkeID


--AL�AS ile Yaz�m� daha kolay :

SELECT * FROM
Ornek.dbo.Ulke A
INNER JOIN
Ornek.dbo.Seh�r B
ON A.UlkeID = B.UlkeID


--### INNER JOIN B�T�� ###






--### LEFT JOIN BA�LANGI� ###

--LEFT JOIN:
--Soldaki tablonun tamam� geliyor.(kesi�en olsun olmas�n)


SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Seh�r --1,2

SELECT * FROM
Ornek.dbo.Ulke
LEFT JOIN
Ornek.dbo.Seh�r
ON Ornek.dbo.Ulke.UlkeID=Ornek.dbo.Seh�r.UlkeID

--ALIAS �LE YAZIM :

SELECT * FROM
Ornek.dbo.Ulke A
LEFT JOIN
Ornek.dbo.Seh�r B
ON A.UlkeID = B.UlkeID


--### LEFT JOIN B�T�� ###






--### RIGHT JOIN BA�LANGI� ###

--RIGHT JOIN :
--Sa�daki tablonun tamam� geliyor.(kesi�en olsun olmas�n)


SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Seh�r --1,2



SELECT * FROM
Ornek.dbo.Ulke
RIGHT JOIN
Ornek.dbo.Seh�r
ON Ornek.dbo.Ulke.UlkeID = Ornek.dbo.Seh�r.UlkeID


--AL�AS �LE YAZIM :

SELECT * FROM
Ornek.dbo.Ulke A
RIGHT JOIN
Ornek.dbo.Seh�r B
ON A.UlkeID = B.UlkeID


--### RIGHT JOIN B�T�� ###



--### FULL JOIN BA�LANGI� ###
--FULL JOIN : T�m tablomuz geliyor gibi de d���nebiliriz.
-- INNER JOIN + LEFT JOIN + RIGHT JOIN
--T�M KES��ENLER + SOLDAK� TABLODAN KES��MEYENLER + SA�DAK� TABLODAN KES��MEYENLER


SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Seh�r --1,2


SELECT * FROM
Ornek.dbo.Ulke
FULL JOIN
Ornek.dbo.Seh�r
ON Ornek.dbo.Ulke.UlkeID = Ornek.dbo.Seh�r.UlkeID

--AL�AS �LE YAZIM :

SELECT * FROM
Ornek.dbo.Ulke A
FULL JOIN
Ornek.dbo.Seh�r B
ON A.UlkeID = B.UlkeID


--### FULL JOIN B�T�� ###


--### JO�N'� ANLAMAK �RNEK 1 B�T�� ###





--### JO�N'� ANLAMAK �RNEK 2 BA�LANGI� ###



--�RNEK 2 :
SELECT * FROM Ornek.dbo.Cal�san

SELECT * FROM Ornek.dbo.Departmant

--��yle bir tablo yaratmam�z istense;
--Cal�san Tablosundan Ad,Cinsiyet,Maas,DepartmanAd� bilgilerini getirin.
--Cal�san tablosunda sadece DepartmantID var. Departmant ad� yok...
--Dolay�s�yla Departmant tablosundaki "Departmant Ad�" bilgisine ihtiyac�m�z var....


-- INNER JOIN --




SELECT * FROM Ornek.dbo.Cal�san --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4







--1.ad�m:

SELECT * FROM 
Ornek.dbo.Cal�san
INNER JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Cal�san.DepartmantID=Ornek.dbo.Departmant.ID


--2.ad�mda Tablomuzu sadele�tirebiliriz:

SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAd� FROM 
Ornek.dbo.Cal�san A 
INNER JOIN
Ornek.dbo.Departmant B 
ON A.DepartmantID=B.ID




-- LEFT JOIN --



SELECT * FROM Ornek.dbo.Cal�san --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4




--1.ad�m:


SELECT * FROM 
Ornek.dbo.Cal�san
LEFT JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Cal�san.DepartmantID = Ornek.dbo.Departmant.ID


--2.ad�mda Tablomuzu sadele�tirebiliriz:


SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAd� FROM 
Ornek.dbo.Cal�san A
LEFT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID






-- RIGHT JOIN --

SELECT * FROM Ornek.dbo.Cal�san --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4


--1.ad�m:


SELECT * FROM 
Ornek.dbo.Cal�san
RIGHT JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Cal�san.DepartmantID = Ornek.dbo.Departmant.ID






--2.ad�mda Tablomuzu sadele�tirebiliriz:




SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAd� FROM 
Ornek.dbo.Cal�san A 
RIGHT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID





-- FULL JOIN --
--T�m tablomuz geliyor gibi de d���nebiliriz.
--INNER JOIN + LEFT JOIN + RIGHT JOIN
--T�M KES��ENLER + SOLDAK� TABLODAN KES��MEYENLER + SA�DAK� TABLODAN KES��MEYENLER

SELECT * FROM Ornek.dbo.Cal�san --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4





--1.ad�m:


SELECT * FROM
Ornek.dbo.Cal�san
FULL JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Cal�san.DepartmantID = Ornek.dbo.Departmant.ID


--2.ad�mda Tablomuzu sadele�tirebiliriz:


SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAd� FROM
Ornek.dbo.Cal�san A
FULL JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID




-- CROSS JOIN --
--ON �fadesi kullan�lmaz.

--10*4 = 40 SATIR D�NER.

--CARTESIAN PRODUCT OF THE 2 TABLES.

--SA�DAK� TABLODAK� HER sat�r ile SOLDAK� tablodaki her sat�r� e�le�tirdi.



SELECT * FROM Ornek.dbo.Cal�san --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4




SELECT A.Ad AS �sim ,A.Cinsiyet,A.Maas,B.DepartmantAd� FROM
Ornek.dbo.Cal�san A
CROSS JOIN
Ornek.dbo.Departmant B
ORDER BY �sim




--### JO�N'� ANLAMAK �RNEK 2 B�T�� ###



----------------------------------------------------------------------------------





-- ### Veritaban� Yap�s�n� Anlamak Ba�lang�� ###
--Database Diagram,�li�ki T�rkeri ve PK,FK







-----------DATABASE DIAGRAMI ANLAMAK PPT ----------------------------------------------
--Database diagram� a�arken 2 t�r hata alabiliriz.
--1.HATA : Veritaban� sahipli�i bo� oldu�undan dolay� olabilir.Adventure Works 2019 sa�t�k >> Properties 
--FILES >> Owner k�sm�na "sa" diyece�iz.

--2.HATA: �ndex out of...Burada da bir adet bo� bir tablo yarat�p diagramda. Sonra SQL server'� kapat�p a�aca��z.


SELECT * FROM Person.PhoneNumberType


SELECT * FROM Person.PersonPhone

--�ki tablo aras�ndaki ili�kiye bakmadan,iki tabloyuda se�ti�imizde 
--2 tabloda da ortak bir kolon oldu�unu hemen fark ettik.
--S�tun adlar� ve veri tipleri ayn� olan bu iki kolon aras�nda bir ba�lant� olmas� kuvvetle muhtemel.
--Daha database diagram�ndaki ili�kiye bakmadan bu tablolardaki 
--Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonun PK olarak tan�mland���n� d���n�yoruz.
--Bunun en b�y�k nedeni,teknik olarak de�erlerin tekrarlanmayan de�erler olmas� ve de�erlerin null olmamas� yan� s�ra,
--tablonun PhoneNumberTypeID �zerine kurulmu� olmas�.
--Tabi her tabloda bu anlamsal durum ge�erli olmayabilir ancak bizlere en az�ndan bir ipucu verebilir bu durum.
--Ancak bizim i�in en �nemli olan �ey, teknik olarak de�erlerin unique ve null olmamas�.
--PhoneNumberType tablosundaki PhoneNumberTypeID kolonunun PK oldu�unu �imdilik d���n�yoruz.


--Birde di�er tablomuza bakal�m,yani Person.PersonPhone tablomuza.
--Bu tabloda da BusinessEntityID kolonun PK olmas� teknik a��dan m�mk�n g�z�k�yor.
--De�erlerimiz null de�il ve hepsi birbirinden farkl�.
--PK'neden �nemli peki ? �rne�in bu tabloda da ki�ilerle ilgili bilgiler yer al�yor.
--�rne�in bizimle ayn� ad ve soyada sahip belki insanlar olabilir ancak hepimizin TCKN'leri farkl� de�il mi?
--B�yle olmasayd�, yani TCKN'ler tekrarlanabilen de�erler alsayd� ve hatta null de�erler alsayd�, g�nl�k i�leyi�i
--ne kadar da aksard� de�il mi?
--Bu y�zden PK kavram� olduk�a �nemli bir vazife g�r�yor.
--Bizleri tekil ve benzersiz k�l�yor.Tablolardaki ilgili PK s�tunu i�in b�yle d���nebiliriz.

--Bunun haricinde dikkatimizi Person.PersonPhone tablosundaki di�er bir kolon daha �ekiyor. O da PhoneNumberTypeID kolonu.
--Bu kolon bizim daha �nce kar��m�za ��km��t�. Person.PhoneNumberType tablosunda PK oldu�unu d���nd���m�z kolonu
--�u anda ba�ka bir tabloda daha g�r�yoruz.
--Daha resmi olarak kan�tlamasak da bu iki tablo aras�ndaki ili�ki bu kolon �zerinden sa�lanm�� gibi g�z�k�yor.
--Bu kolonunda yani,PhoneNumberTypeID kolonunun ilgili tabloda FK kolonu oldu�unu d���nmememiz i�in bir sebep bulunmuyor.
--Sanki buradaki kolonlar verilerini Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan al�yor gibi.
--Bu iki ayn� kolon �zerinden iki farkl� tablodaki ili�kiyi hen�z kan�tlamad�k,�imdi gelin kan�tlayal�m.

--Database Diagram'da ilgili tablolar� se�iyoruz.

--Mouse'�m�zla ilgili okun �zerine geldi�imizde FK Constraint ad�yla kar��la��yoruz.
--�lgili FK constraint ad�,Person.PersonPhone tablosundaki KEY folder'�n�n alt�ndaki,
--bir adet FK Constraint'i ile e�le�iyor.

--Mouse'�m�zla ilgili FK k�s�t�nda sa� t�k yap�p� modify diyoruz. Ve Tables And Column Spec.k�sm�ndaki ... alana
--t�klayarak iki tablo aras�ndaki ili�kiyi g�rebiliriz.

--Burdan g�r�yoruz ki Person.PersonPhone tablosundaki PhoneNumberTypeID kolonu FK olarak tan�mlanm�� ve 
--Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonuna ba�lanm��. Yani ilgili kolon verilerini
--Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan al�yor.
--�lgili PK tablosundaki PK kolonunda olmayan bir de�eri biz �u anda FK kolonuna insert edemeyiz.
--��nk� bu ili�ki resmi olarak tan�mlanm��.Veri insert etti�imiz d���nelim.
--Bu seferde a��klayamad���m�z ve hangi tip telefon ad�na sahip oldu�u belli olmayan bir veri �retmi� oluruz.
--Dolay�syla FK'n�n da �nemi burada ��k�yor.FK kolonu veri b�t�nselli�inin korunmas� a��s�ndan olduk�a �nemli bir
--g�rev �stleniyor.


-------------�L��K�LER--------------------
/*
Bir Yazar,

birden �OK kitap yazabilir.

ancak her kitab�n yaln�zca B�R Yazar� vard�r.

*/


/*

B�RE - �OK :

Bir yazar�n birden fazla kitab�,bir y�netmenin birden fazla filmi olabilir.
Bu tip durumlarda tablolar aras�nda bire - �ok ili�ki kurulur.
Yani bir tablodaki ili�kili tablodan birden �ok de�er alma durumudur.
Ya da bir merkezden ��karak, o merkeze ait birden fazla kay�t olmas� durumudur.
Tablodaki PK ile, di�er tablodaki tekrarl� alan aras�nda kurulan ili�kidir.
�li�kisel Veri Tabanlar�nda en �ok kullan�lan ili�ki t�r�d�r.
�A� Tablosundaki bir kay�t, �B� tablosunda pek �OK e�le�en kayda sahiptir. 
Ancak �B� Tablosundaki kay�t, �A� Tablosunda yaln�zca B�R e�le�en kayda sahiptir.
Yazar �rne�inden yola ��karsak,bir yazar�n birden �ok kitab� olabilir. 
Ancak her kitab�n bir yazar� vard�r kabullenmesini yapt���m�z zaman bu tip ili�ki kurulmu� olur                                                                          .
Birden �o�a ili�kide bir tablodaki anahtar, ili�kili oldu�u tabloda birden �ok kez olabilir.
�ki tablo aras�ndaki ili�kiyi sa�lamak i�in kullanaca��m�z alanlardan birisi birincil anahtar (primary key) 
di�eri yabanc� anahtar (foreign key) ise bire �ok ili�ki olur.

B�RE - �OK D��ER �RNEK:







Bir-Bir �li�kisi (�li�kisel Veritaban� Tasar�m�):

Bir tablodaki bir sat�r, di�er tablodaki bir sat�r ile ili�kili olabilir.
Tablo A'da Tablo B'deki her kay�tla e�le�en yaln�zca B�R kay�t 
ve Tablo B'de Tablo A'daki her kay�tla e�le�en sadece B�R kay�t olabilir.
Yani her iki tablodaki alanlar her iki tabloda da benzersiz olacak.
Bu �ekilde ili�kili olan �o�u bilgi tek bir tabloda olabilir. 
Ana tablonun yaln�zca bir alt k�mesiyle ilgili bilgileri saklamak �zere
veya bir�ok alan i�eren bir tabloyu b�lmek i�in Bir-Bir �li�kisi kullanabilirsiniz.
�rne�in;her �r�n�n bir detay� vard�r ve her detay�nda sadece bir �r�n i�in olaca��n�
d���nd���m�zde Bire-Bir ili�kiyle kar�� kar��yay�z demektir. 

A�a��daki �rnekte,�r�n�n en temel �zellikleri �r�nler Tablosunda,ekstra di�er bilgiler
ise �r�nDetay  tablosunda g�sterilmi�tir.Asl�nda iki ayr� tablodaki bilgiler tek bir
tabloda tutulabilirdi.Ancak detay bilgiler farkl� tabloda g�sterilmek istenildi�i i�in
ayr� bir tabloda da g�rebiliriz bu t�r bilgileri.



�oka �ok �li�ki :

Bu ili�ki t�r� e�er birinci tablodaki bir verinin ikinci tabloda ili�kili oldu�u birden �ok veri varsa 
ve ayn� �ekilde ikinci tablodaki bir verinin de birinci tabloda ili�kili oldu�u birden �ok veri varsa ortaya ��kar.
�oka-�ok veritaban�nda bir tablodaki bir sat�r, kar�� tablodaki birden fazla sat�r ile ili�kili iken, 
kar�� tablo i�in de ayn�s� ge�erlidir.Bu veri tabanlar�nda istenmeyen bir durumdur.
��z�m�n� gene 2 adet bire �ok ili�ki yaratarak buluruz.


  Yazarlar				     Kitaplar			
------------            ---------------------							
ID	YazarAd�			ID	Kitap�smi	YazarID	
84	Ali					1	ABC			84	
85	Murat				2	DEF			85	
86	Kemal				3	XYZ			84			


Burada basit bir bire �ok ili�kisi var gibi g�z�kmekte.							
Yani bir yazar�n birden fazla kitab� var dolay�s�yla							
D�z bir bire �ok ili�ki oldu�unu d���n�rsek Kitaplar kolonun yan�na yukar�daki gibi bir YazarID kolonu 
yani FK kolonu eklerdik ve sorun olmazd�.							
										
  Yazarlar				     Kitaplar			
------------            ---------------------							
ID	YazarAd�			ID	Kitap�smi	YazarID	
84	Ali					1	ABC			84	
85	Murat				2	DEF			85	
86	Kemal				3	XYZ			84	

Peki ya bir kitap birden fazla yazar taraf�ndan yaz�lm��sa?							
Bu durumda bir yazar�n birden fazla kitab�,bir kitab�n da birden fazla yazar� olabilir.							
Peki bu durumda Kitaplar tablosunda bir kolon daha a��p orayada YazarID 2 mi diyece�iz?							

  Yazarlar				           Kitaplar			
------------            ---------------------------------							
ID	YazarAd�			ID	Kitap�smi	YazarID	 YazarID2
84	Ali					1	ABC			84			
85	Murat				2	DEF			86			
86	Kemal				3	XYZ			84		   86


B�yle bir durum ili�kisel veritabanlar�nda kabul edilemez.
�li�kisel veri tabanlar�nda direk �oka �ok ili�kisi kuram�yoruz.
Ancak,2 adet bire �ok ili�ki yaratabiliriz.
Kitaplar tablosundaki YazarID kolonundan tamamen kurtulaca��z.
Ve 3.bir tablo yarataca��z.

Yaratt���m�z bu 3.tablonun tek amac� Yazarlar ve Kitaplar tablolar�n� birle�tirebilmek asl�nda.
3.tablomuzu yarat�yoruz ve ad�na YazarKitap ismini veriyoruz.

  Yazarlar				   Kitaplar			
------------            --------------							
ID	YazarAd�			ID	Kitap�smi	
84	Ali					1	ABC				
85	Murat				2	DEF			
86	Kemal				3	XYZ		

	
		   YazarKitap
	-------------------------	
	ID	 YazarID	  KitapID
	1		84			1
	2		84			3
	3		86			3
	4		85			2

Burada 2 tane bire �ok ili�ki yarataca��z.						
�lk ba�ta Yazarlar tablosu ile Yazarkitap tablolar� aras�nda bire �ok ili�ki kuraca��z.							
�rne�in 84 nolu yazar ilgili tabloda birden fazla yer alabilir.							
Ayn� zamanda Kitaplar ile YazarKitap tablolar� aras�nda da bire�ok ili�ki kurmu� olaca��z.
�rne�in KitapID 3,YazarKitapTablosunda birden fazla yer alabiliyor.

B�ylelikle YazazID 84'�n hangi kitaplar� yazd���n� rahatl�kla g�rebilirken,
KitapID 3'�n de hangi yazarlar taraf�ndan yaz�ld���n� g�rebiliyoruz.

*/


-- ### Veritaban� Yap�s�n� Anlamak Biti� ###


