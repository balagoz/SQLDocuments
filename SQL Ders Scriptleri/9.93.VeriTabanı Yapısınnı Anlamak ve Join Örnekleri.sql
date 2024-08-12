
-- ### JOIN GENEL ### -




--2 veya daha fazla tablodan bilgi alýp tablolarýmýzý birleþtirebiliriz.
--Join iþlemine ihtiyaç duyulmasýnýn bilgilerimiz kategorize edilmiþ bir þekilde farklý tablolarda durmaktadýr.
--Örneðin Bi yazarýn yazdýðý kitapID'si tablomuzda olabilir ancak Kitabýn Adý ve diðer bilgileri baþka bir tabloda olabilir.
--Tablolarýmýz birbirlerine baðlantýlý olduðu için ki genelde bu baðlantý PK ve FK iliþkisi ile kurulur,aradýðýmýz 
--bilgiyi tablolar arasýnda köprü iþlevi gören sütunlar üzerinden ilgili tablolara ulaþarak bulabiliriz. 
--Unutulmamaýldýr ki tablolarýmýzý joinlemek için resmi bir PK VE FK iliþkisine ihtiyacýmýz yoktur.
--Genelde PK ve FK iliþkis sürekli karþýmýza çýkar ancak onlarsýz join iþlemi yapamyýz gibi bir düþünce yanlýþ olacaktýr. 
--PK ve özellikle FK kýsýtlarý veri bütünlüðü için olmazsa olmazdýr,Join yaparken de tablolar arasýnda köprü görevi görecek 
--kolonlarýmýz çoðu kez PF ve FK iliþkisyle birbirlerine baðlanmýþtýr.Ancak demin de bahsettiðimiz
--gibi bu durum join yapabilmemiz için zaruri deðildir.
--Tabi ki resmi olarak PK ve FK kolonlarýnýn tanýmlanmýþ olmasý daha iyi olacaktýr.


------------------JOIN GENEL ÖRNEK --------------------------

SELECT * FROM Person.PersonPhone -- PhoneNumberTypeID -- 19.972 Kayýt

SELECT * FROM Person.PhoneNumberType -- PhoneNumberTypeID



/*
Join Türlerimize geçmeden önce join iþlemiyle ilgili bir alýþtýrma yapalým.
Ýki tablomuzdaki ortak kolonda PhoneNumberTypeID.
Þimdi bu kolonu yani köprüyü kullanarak 2 tablomuzu joinleyeceðiz.

Peki Neden bu iþleme ihtiyaç duyuyoruz? 
Dikkat ederseniz,Person.PhoneNumberType  tablosunda PhoneNumberTypeID kolonunun yanýnda Name yani isim bilgiside 
belrtilmiþ.
Ancak gördüðümüz gibi Person.PersonPhone tablosunda ise sadece PhoneNumberTypeID bilgisi belirtilmiþ.
Örneðin biz, þu anda BusinessEntityID = 1 olan kiþinin ilgili telefon numarasýnýn PhoneNumberTypeID'sinin 1 olduðunu
görüyoruz. Ancak tablomuzun yanýnda yazmasýný istiyoruz bu bilginin.
Yani aradýðýmýz bilgi olan "Name" bilgisi baþka bir tabloda bulunuyor.Person.PhoneNumberType tablosunda.
Dolayýsýyla tablolarýmýz birleþtirmemiz gerekmekte.

Peki biz neye dayanarak veya bir baþka deyiþle hangi köprüyü kullanarak ( hangi ortak kolon ) 
tablolarýmýzý birleþtireceðiz ?


Person.PersonPhone tablomuzda BusinessEntityID 'lerin yanlarýnda PhoneNumberTypeID sütünu var.
Ve bu sütundaki bilgilerimiz Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan gelmekte.
2 Tablodaki baðlantýnýn PhoneNumberTypeID kolonu üzerinden gerçekleþtiðini ve veri bütünlüðünün saðlanmasý 
adýna FK iliþkisinin de yaratýldýðýný kanýtlamýþtýk.

Þimdi gelin tekrar kontrol edelim.

Görüldüðü gibi Person.PersonPhone tablosundaki PhoneNumberTypeID kolonumuz FK olarak belirlenmiþ.
Peki hangi tablodaki sütuna referans gösterilmiþ?
Person.PhoneNumberType tablosundaki PhoneNumberTypeID'nuna referans gösterilmiþ.
Yani,Person.PersonPhone tablosundaki PhoneNumberTypeID kolonu verilerini 
Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan alýyor.


FK kýsýtý da tanýmlanarak PK tablosundaki PhoneNumberTypeID kolonunda bulunan veriler
haricinde bir veri girmeye kalktýðýmýzda SQL bize FK kýsýt ihlali hatasý verecektir.
Böylelikle Person.PhoneNumberType tablosunda bulunan PhoneNumberTypeID kolonundaki veriler haricinde
Person.PersonPhone tablosundaki PhoneNumberTypeID kolonuna yanlýþ veri giremeyeceðiz.

Ancak þu anda bizi asýl ilgilendiren konu,tablolarýmýzý nasýl birleþtirceðimizdi ve Neden Join iþlemine
gerek duyduðumuzdu?

Tablolarýmýzý birleþtirebilmemiz için Ortak kolona ihtiyacýmýz bulunmaktaydý.
Aslýnda aradýðýmýz þeyi zaten bulmuþ olduk.
Ortak kolonumuz PhoneNumberTypeID kolonudur.
Joinleme iþlemini yaparken Köprü olarak PhoneNumberTypeID kolonunu kullanacaðýz.



Gelin,þimdi JOIN yapýmýzý inceleyelim.

Bu örnekte,soldaki tablomuz olan Person.PersonPhone tablosundaki tüm satýrlarýn eksiksiz
bir þekilde gelmesini istiyoruz.
Dolayýsyla bu tip durumlarda join türü olarak LEFT JOIN'i kullanmamýz gerekmektedir.
LEFT JOIN'de Soldaki tablonun tamamý geliyor.

Ortak kolonumuz olan PhoneNumberTypeID kolonuyla kesiþen bilgileri zaten göreceðiz.
Kesiþmeyen bir PhoneNumberTypeID olduðu takdirde ise ilgili satýrý NULL olarak göreceðiz.
Ama her halükarda soldaki tablomuzun tamamý sonuç setinde karþýmýza çýkacaktýr.

Soldaki tablomuz olarak Person.PersonPhone tablosunu,saðdaki tablomuz olarak da Person.PhoneNumberType tablosunu
syntaxýmýza yerleþtiriyoruz.

Join þartý veya bir baþka deyiþle kullandýðýmýz köprü olarak da PhoneNumberTypeID kolonunu belirlemiþtik.
Çünkü bu kolon saysesin iki tabloyu birleþtirebiliriz.
Dolayýsyla bu ortak kolonu aþaðýdaki JOIN syntax yapýsýnda görüldüðü gibi belrtiyoruz.

Person.PersonPhone tablosundaki PhoneNumberTypeID kolonu ile Person.PhoneNumberType tablosundaki 
PhoneNumberTypeID kolonunun eþit olduðunu belrtiyoruz.

*/

SELECT * FROM Person.PersonPhone -- PhoneNumberTypeID -- 19.972 Kayýt

SELECT * FROM Person.PhoneNumberType -- PhoneNumberTypeID


--ORÝJÝNAL YAPI :
SELECT * FROM
Person.PersonPhone
LEFT JOIN
Person.PhoneNumberType
ON Person.PersonPhone.PhoneNumberTypeID = Person.PhoneNumberType.PhoneNumberTypeID

--ALÝAS KULLANIRSAK :
SELECT * FROM
Person.PersonPhone A
LEFT JOIN
Person.PhoneNumberType B
ON A.PhoneNumberTypeID = B.PhoneNumberTypeID


--Görüldüðü gibi soldaki tablomuzuzn yanýna saðdaki tablomuzu getirmiþ olduk.
--Artýk Person.PersonPhone tablosundali PhoneNumberTypeID'lerin yanýna Person.PhoneNumberType tablosundaki tüm eþleþen
--PhoneNumberTypeID'ler geldi.Bir sonraki aþamada tablomuzu istediðimiz kolonlarý seçerek getirebiliriz.


SELECT * FROM Person.PersonPhone -- PhoneNumberTypeID -- 19.972 Kayýt

SELECT * FROM Person.PhoneNumberType -- PhoneNumberTypeID


--ALÝAS KULLANIRSAK :
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





--Yukarýdaki ifade ile aþaðýdaki ifade aynýdýr.
--Sadece JOIN TYPE'tan sonra ENTER tuþuna basýp "SAÐDAKÝ TABLO"muzu
--bir aþaðýya alabiliriz.
--Soldaki tablo denmesinin nedeni 
--tablonun Join türünün(join type)solunda kalmasýdýr.
SELECT Kolon Listesi 
FROM SOLDAKÝ TABLO JOIN TYPE SAÐDAKÝ TABLO
ON JOIN CONDITION


------------------------------------------




--### JOÝN'Ý ANLAMAK ÖRNEK 1 BAÞLANGIÇ ###


--ÖRNEK :

SELECT * FROM Ornek.dbo.Ulke

SELECT * FROM Ornek.dbo.Sehýr


--Türkiyeden 2 kayýt var.
--Almanyadan 1 kayýt var.
--Ýngiltereden kayýt Yok.
--New Yorkunda Ülke tablosunda kaydý Yok.

--### INNER JOIN BAÞLANGIÇ ###


--INNER JOÝN :
--Sadece Kesiþenler

SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Sehýr --1,2


SELECT * FROM 
Ornek.dbo.Ulke 
INNER JOIN
Ornek.dbo.Sehýr
ON Ornek.dbo.Ulke.UlkeID = Ornek.dbo.Sehýr.UlkeID


--ALÝAS ile Yazýmý daha kolay :

SELECT * FROM
Ornek.dbo.Ulke A
INNER JOIN
Ornek.dbo.Sehýr B
ON A.UlkeID = B.UlkeID


--### INNER JOIN BÝTÝÞ ###






--### LEFT JOIN BAÞLANGIÇ ###

--LEFT JOIN:
--Soldaki tablonun tamamý geliyor.(kesiþen olsun olmasýn)


SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Sehýr --1,2

SELECT * FROM
Ornek.dbo.Ulke
LEFT JOIN
Ornek.dbo.Sehýr
ON Ornek.dbo.Ulke.UlkeID=Ornek.dbo.Sehýr.UlkeID

--ALIAS ÝLE YAZIM :

SELECT * FROM
Ornek.dbo.Ulke A
LEFT JOIN
Ornek.dbo.Sehýr B
ON A.UlkeID = B.UlkeID


--### LEFT JOIN BÝTÝÞ ###






--### RIGHT JOIN BAÞLANGIÇ ###

--RIGHT JOIN :
--Saðdaki tablonun tamamý geliyor.(kesiþen olsun olmasýn)


SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Sehýr --1,2



SELECT * FROM
Ornek.dbo.Ulke
RIGHT JOIN
Ornek.dbo.Sehýr
ON Ornek.dbo.Ulke.UlkeID = Ornek.dbo.Sehýr.UlkeID


--ALÝAS ÝLE YAZIM :

SELECT * FROM
Ornek.dbo.Ulke A
RIGHT JOIN
Ornek.dbo.Sehýr B
ON A.UlkeID = B.UlkeID


--### RIGHT JOIN BÝTÝÞ ###



--### FULL JOIN BAÞLANGIÇ ###
--FULL JOIN : Tüm tablomuz geliyor gibi de düþünebiliriz.
-- INNER JOIN + LEFT JOIN + RIGHT JOIN
--TÜM KESÝÞENLER + SOLDAKÝ TABLODAN KESÝÞMEYENLER + SAÐDAKÝ TABLODAN KESÝÞMEYENLER


SELECT * FROM Ornek.dbo.Ulke --1,2,4

SELECT * FROM Ornek.dbo.Sehýr --1,2


SELECT * FROM
Ornek.dbo.Ulke
FULL JOIN
Ornek.dbo.Sehýr
ON Ornek.dbo.Ulke.UlkeID = Ornek.dbo.Sehýr.UlkeID

--ALÝAS ÝLE YAZIM :

SELECT * FROM
Ornek.dbo.Ulke A
FULL JOIN
Ornek.dbo.Sehýr B
ON A.UlkeID = B.UlkeID


--### FULL JOIN BÝTÝÞ ###


--### JOÝN'Ý ANLAMAK ÖRNEK 1 BÝTÝÞ ###





--### JOÝN'Ý ANLAMAK ÖRNEK 2 BAÞLANGIÇ ###



--ÖRNEK 2 :
SELECT * FROM Ornek.dbo.Calýsan

SELECT * FROM Ornek.dbo.Departmant

--Þöyle bir tablo yaratmamýz istense;
--Calýsan Tablosundan Ad,Cinsiyet,Maas,DepartmanAdý bilgilerini getirin.
--Calýsan tablosunda sadece DepartmantID var. Departmant adý yok...
--Dolayýsýyla Departmant tablosundaki "Departmant Adý" bilgisine ihtiyacýmýz var....


-- INNER JOIN --




SELECT * FROM Ornek.dbo.Calýsan --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4







--1.adým:

SELECT * FROM 
Ornek.dbo.Calýsan
INNER JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Calýsan.DepartmantID=Ornek.dbo.Departmant.ID


--2.adýmda Tablomuzu sadeleþtirebiliriz:

SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAdý FROM 
Ornek.dbo.Calýsan A 
INNER JOIN
Ornek.dbo.Departmant B 
ON A.DepartmantID=B.ID




-- LEFT JOIN --



SELECT * FROM Ornek.dbo.Calýsan --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4




--1.adým:


SELECT * FROM 
Ornek.dbo.Calýsan
LEFT JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Calýsan.DepartmantID = Ornek.dbo.Departmant.ID


--2.adýmda Tablomuzu sadeleþtirebiliriz:


SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAdý FROM 
Ornek.dbo.Calýsan A
LEFT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID






-- RIGHT JOIN --

SELECT * FROM Ornek.dbo.Calýsan --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4


--1.adým:


SELECT * FROM 
Ornek.dbo.Calýsan
RIGHT JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Calýsan.DepartmantID = Ornek.dbo.Departmant.ID






--2.adýmda Tablomuzu sadeleþtirebiliriz:




SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAdý FROM 
Ornek.dbo.Calýsan A 
RIGHT JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID





-- FULL JOIN --
--Tüm tablomuz geliyor gibi de düþünebiliriz.
--INNER JOIN + LEFT JOIN + RIGHT JOIN
--TÜM KESÝÞENLER + SOLDAKÝ TABLODAN KESÝÞMEYENLER + SAÐDAKÝ TABLODAN KESÝÞMEYENLER

SELECT * FROM Ornek.dbo.Calýsan --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4





--1.adým:


SELECT * FROM
Ornek.dbo.Calýsan
FULL JOIN
Ornek.dbo.Departmant
ON Ornek.dbo.Calýsan.DepartmantID = Ornek.dbo.Departmant.ID


--2.adýmda Tablomuzu sadeleþtirebiliriz:


SELECT A.Ad,A.Cinsiyet,A.Maas,B.DepartmantAdý FROM
Ornek.dbo.Calýsan A
FULL JOIN
Ornek.dbo.Departmant B
ON A.DepartmantID = B.ID




-- CROSS JOIN --
--ON Ýfadesi kullanýlmaz.

--10*4 = 40 SATIR DÖNER.

--CARTESIAN PRODUCT OF THE 2 TABLES.

--SAÐDAKÝ TABLODAKÝ HER satýr ile SOLDAKÝ tablodaki her satýrý eþleþtirdi.



SELECT * FROM Ornek.dbo.Calýsan --1,2,3,Null

SELECT * FROM Ornek.dbo.Departmant--1,2,3,4




SELECT A.Ad AS Ýsim ,A.Cinsiyet,A.Maas,B.DepartmantAdý FROM
Ornek.dbo.Calýsan A
CROSS JOIN
Ornek.dbo.Departmant B
ORDER BY Ýsim




--### JOÝN'Ý ANLAMAK ÖRNEK 2 BÝTÝÞ ###



----------------------------------------------------------------------------------





-- ### Veritabaný Yapýsýný Anlamak Baþlangýç ###
--Database Diagram,Ýliþki Türkeri ve PK,FK







-----------DATABASE DIAGRAMI ANLAMAK PPT ----------------------------------------------
--Database diagramý açarken 2 tür hata alabiliriz.
--1.HATA : Veritabaný sahipliði boþ olduðundan dolayý olabilir.Adventure Works 2019 saðtýk >> Properties 
--FILES >> Owner kýsmýna "sa" diyeceðiz.

--2.HATA: Ýndex out of...Burada da bir adet boþ bir tablo yaratýp diagramda. Sonra SQL server'ý kapatýp açacaðýz.


SELECT * FROM Person.PhoneNumberType


SELECT * FROM Person.PersonPhone

--Ýki tablo arasýndaki iliþkiye bakmadan,iki tabloyuda seçtiðimizde 
--2 tabloda da ortak bir kolon olduðunu hemen fark ettik.
--Sütun adlarý ve veri tipleri ayný olan bu iki kolon arasýnda bir baðlantý olmasý kuvvetle muhtemel.
--Daha database diagramýndaki iliþkiye bakmadan bu tablolardaki 
--Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonun PK olarak tanýmlandýðýný düþünüyoruz.
--Bunun en büyük nedeni,teknik olarak deðerlerin tekrarlanmayan deðerler olmasý ve deðerlerin null olmamasý yaný sýra,
--tablonun PhoneNumberTypeID üzerine kurulmuþ olmasý.
--Tabi her tabloda bu anlamsal durum geçerli olmayabilir ancak bizlere en azýndan bir ipucu verebilir bu durum.
--Ancak bizim için en önemli olan þey, teknik olarak deðerlerin unique ve null olmamasý.
--PhoneNumberType tablosundaki PhoneNumberTypeID kolonunun PK olduðunu þimdilik düþünüyoruz.


--Birde diðer tablomuza bakalým,yani Person.PersonPhone tablomuza.
--Bu tabloda da BusinessEntityID kolonun PK olmasý teknik açýdan mümkün gözüküyor.
--Deðerlerimiz null deðil ve hepsi birbirinden farklý.
--PK'neden önemli peki ? Örneðin bu tabloda da kiþilerle ilgili bilgiler yer alýyor.
--Örneðin bizimle ayný ad ve soyada sahip belki insanlar olabilir ancak hepimizin TCKN'leri farklý deðil mi?
--Böyle olmasaydý, yani TCKN'ler tekrarlanabilen deðerler alsaydý ve hatta null deðerler alsaydý, günlük iþleyiþi
--ne kadar da aksardý deðil mi?
--Bu yüzden PK kavramý oldukça önemli bir vazife görüyor.
--Bizleri tekil ve benzersiz kýlýyor.Tablolardaki ilgili PK sütunu için böyle düþünebiliriz.

--Bunun haricinde dikkatimizi Person.PersonPhone tablosundaki diðer bir kolon daha çekiyor. O da PhoneNumberTypeID kolonu.
--Bu kolon bizim daha önce karþýmýza çýkmýþtý. Person.PhoneNumberType tablosunda PK olduðunu düþündüðümüz kolonu
--þu anda baþka bir tabloda daha görüyoruz.
--Daha resmi olarak kanýtlamasak da bu iki tablo arasýndaki iliþki bu kolon üzerinden saðlanmýþ gibi gözüküyor.
--Bu kolonunda yani,PhoneNumberTypeID kolonunun ilgili tabloda FK kolonu olduðunu düþünmememiz için bir sebep bulunmuyor.
--Sanki buradaki kolonlar verilerini Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan alýyor gibi.
--Bu iki ayný kolon üzerinden iki farklý tablodaki iliþkiyi henüz kanýtlamadýk,þimdi gelin kanýtlayalým.

--Database Diagram'da ilgili tablolarý seçiyoruz.

--Mouse'ýmýzla ilgili okun üzerine geldiðimizde FK Constraint adýyla karþýlaþýyoruz.
--Ýlgili FK constraint adý,Person.PersonPhone tablosundaki KEY folder'ýnýn altýndaki,
--bir adet FK Constraint'i ile eþleþiyor.

--Mouse'ýmýzla ilgili FK kýsýtýnda sað týk yapýpý modify diyoruz. Ve Tables And Column Spec.kýsmýndaki ... alana
--týklayarak iki tablo arasýndaki iliþkiyi görebiliriz.

--Burdan görüyoruz ki Person.PersonPhone tablosundaki PhoneNumberTypeID kolonu FK olarak tanýmlanmýþ ve 
--Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonuna baðlanmýþ. Yani ilgili kolon verilerini
--Person.PhoneNumberType tablosundaki PhoneNumberTypeID kolonundan alýyor.
--Ýlgili PK tablosundaki PK kolonunda olmayan bir deðeri biz þu anda FK kolonuna insert edemeyiz.
--Çünkü bu iliþki resmi olarak tanýmlanmýþ.Veri insert ettiðimiz düþünelim.
--Bu seferde açýklayamadýðýmýz ve hangi tip telefon adýna sahip olduðu belli olmayan bir veri üretmiþ oluruz.
--Dolayýsyla FK'nýn da önemi burada çýkýyor.FK kolonu veri bütünselliðinin korunmasý açýsýndan oldukça önemli bir
--görev üstleniyor.


-------------ÝLÝÞKÝLER--------------------
/*
Bir Yazar,

birden ÇOK kitap yazabilir.

ancak her kitabýn yalnýzca BÝR Yazarý vardýr.

*/


/*

BÝRE - ÇOK :

Bir yazarýn birden fazla kitabý,bir yönetmenin birden fazla filmi olabilir.
Bu tip durumlarda tablolar arasýnda bire - çok iliþki kurulur.
Yani bir tablodaki iliþkili tablodan birden çok deðer alma durumudur.
Ya da bir merkezden çýkarak, o merkeze ait birden fazla kayýt olmasý durumudur.
Tablodaki PK ile, diðer tablodaki tekrarlý alan arasýnda kurulan iliþkidir.
Ýliþkisel Veri Tabanlarýnda en çok kullanýlan iliþki türüdür.
“A” Tablosundaki bir kayýt, “B” tablosunda pek ÇOK eþleþen kayda sahiptir. 
Ancak “B” Tablosundaki kayýt, “A” Tablosunda yalnýzca BÝR eþleþen kayda sahiptir.
Yazar örneðinden yola çýkarsak,bir yazarýn birden çok kitabý olabilir. 
Ancak her kitabýn bir yazarý vardýr kabullenmesini yaptýðýmýz zaman bu tip iliþki kurulmuþ olur                                                                          .
Birden çoða iliþkide bir tablodaki anahtar, iliþkili olduðu tabloda birden çok kez olabilir.
Ýki tablo arasýndaki iliþkiyi saðlamak için kullanacaðýmýz alanlardan birisi birincil anahtar (primary key) 
diðeri yabancý anahtar (foreign key) ise bire çok iliþki olur.

BÝRE - ÇOK DÝÐER ÖRNEK:







Bir-Bir Ýliþkisi (Ýliþkisel Veritabaný Tasarýmý):

Bir tablodaki bir satýr, diðer tablodaki bir satýr ile iliþkili olabilir.
Tablo A'da Tablo B'deki her kayýtla eþleþen yalnýzca BÝR kayýt 
ve Tablo B'de Tablo A'daki her kayýtla eþleþen sadece BÝR kayýt olabilir.
Yani her iki tablodaki alanlar her iki tabloda da benzersiz olacak.
Bu þekilde iliþkili olan çoðu bilgi tek bir tabloda olabilir. 
Ana tablonun yalnýzca bir alt kümesiyle ilgili bilgileri saklamak üzere
veya birçok alan içeren bir tabloyu bölmek için Bir-Bir Ýliþkisi kullanabilirsiniz.
Örneðin;her Ürünün bir detayý vardýr ve her detayýnda sadece bir ürün için olacaðýný
düþündüðümüzde Bire-Bir iliþkiyle karþý karþýyayýz demektir. 

Aþaðýdaki örnekte,ürünün en temel özellikleri Ürünler Tablosunda,ekstra diðer bilgiler
ise ÜrünDetay  tablosunda gösterilmiþtir.Aslýnda iki ayrý tablodaki bilgiler tek bir
tabloda tutulabilirdi.Ancak detay bilgiler farklý tabloda gösterilmek istenildiði için
ayrý bir tabloda da görebiliriz bu tür bilgileri.



Çoka Çok Ýliþki :

Bu iliþki türü eðer birinci tablodaki bir verinin ikinci tabloda iliþkili olduðu birden çok veri varsa 
ve ayný þekilde ikinci tablodaki bir verinin de birinci tabloda iliþkili olduðu birden çok veri varsa ortaya çýkar.
Çoka-çok veritabanýnda bir tablodaki bir satýr, karþý tablodaki birden fazla satýr ile iliþkili iken, 
karþý tablo için de aynýsý geçerlidir.Bu veri tabanlarýnda istenmeyen bir durumdur.
Çözümünü gene 2 adet bire çok iliþki yaratarak buluruz.


  Yazarlar				     Kitaplar			
------------            ---------------------							
ID	YazarAdý			ID	KitapÝsmi	YazarID	
84	Ali					1	ABC			84	
85	Murat				2	DEF			85	
86	Kemal				3	XYZ			84			


Burada basit bir bire çok iliþkisi var gibi gözükmekte.							
Yani bir yazarýn birden fazla kitabý var dolayýsýyla							
Düz bir bire çok iliþki olduðunu düþünürsek Kitaplar kolonun yanýna yukarýdaki gibi bir YazarID kolonu 
yani FK kolonu eklerdik ve sorun olmazdý.							
										
  Yazarlar				     Kitaplar			
------------            ---------------------							
ID	YazarAdý			ID	KitapÝsmi	YazarID	
84	Ali					1	ABC			84	
85	Murat				2	DEF			85	
86	Kemal				3	XYZ			84	

Peki ya bir kitap birden fazla yazar tarafýndan yazýlmýþsa?							
Bu durumda bir yazarýn birden fazla kitabý,bir kitabýn da birden fazla yazarý olabilir.							
Peki bu durumda Kitaplar tablosunda bir kolon daha açýp orayada YazarID 2 mi diyeceðiz?							

  Yazarlar				           Kitaplar			
------------            ---------------------------------							
ID	YazarAdý			ID	KitapÝsmi	YazarID	 YazarID2
84	Ali					1	ABC			84			
85	Murat				2	DEF			86			
86	Kemal				3	XYZ			84		   86


Böyle bir durum iliþkisel veritabanlarýnda kabul edilemez.
Ýliþkisel veri tabanlarýnda direk çoka çok iliþkisi kuramýyoruz.
Ancak,2 adet bire çok iliþki yaratabiliriz.
Kitaplar tablosundaki YazarID kolonundan tamamen kurtulacaðýz.
Ve 3.bir tablo yaratacaðýz.

Yarattýðýmýz bu 3.tablonun tek amacý Yazarlar ve Kitaplar tablolarýný birleþtirebilmek aslýnda.
3.tablomuzu yaratýyoruz ve adýna YazarKitap ismini veriyoruz.

  Yazarlar				   Kitaplar			
------------            --------------							
ID	YazarAdý			ID	KitapÝsmi	
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

Burada 2 tane bire çok iliþki yaratacaðýz.						
Ýlk baþta Yazarlar tablosu ile Yazarkitap tablolarý arasýnda bire çok iliþki kuracaðýz.							
Örneðin 84 nolu yazar ilgili tabloda birden fazla yer alabilir.							
Ayný zamanda Kitaplar ile YazarKitap tablolarý arasýnda da bireçok iliþki kurmuþ olacaðýz.
Örneðin KitapID 3,YazarKitapTablosunda birden fazla yer alabiliyor.

Böylelikle YazazID 84'ün hangi kitaplarý yazdýðýný rahatlýkla görebilirken,
KitapID 3'ün de hangi yazarlar tarafýndan yazýldýðýný görebiliyoruz.

*/


-- ### Veritabaný Yapýsýný Anlamak Bitiþ ###


