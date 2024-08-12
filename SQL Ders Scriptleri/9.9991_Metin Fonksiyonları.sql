
--- FONKSÝYONLAR GENEL---
/*
Fonksiyonlarla ilgili birden çok sýnýflama yapmak mümkündür.

Fonksyionlar temel olarak 2'ye ayrýlýr.

1.TÜR : Sistem Tanýmlý Fonksyionlar :
2.TÜR :User Defined Function (Kullanýcý tanýmlý , Kullanýcý Tarafýndan Oluþturulan Fonksiyonlar)


Kullanýcý Tanýmlý Fonksiyonlarda temel olarak 3'e ayrýlýr :

Kullanýcý Tanýmlý Fonksiyonlar adýndan da anlaþýlacaðý gibi, Kullanýcý tarafýndan oluþturulan fonksiyonlardýr.

Kullanýcý Tanýmlý Fonksiyonlar 1 : Scalar Functions : 

Kulanýcýnýn belirlediði iþleve göre geriye tek 
bir deðer döndüren kullanýcý tanýmlý fonksiyonlardýr.
Örneðin parametre olarak adi ve soyadi alan ve geriye ikisini birleþtirerek 
tek bir isim soyisim stringi dönen bir fonksiyon.

Kullanýcý Tanýmlý Fonksiyonlar 2 : Inline Table-Valued Function : 
Geriye bir tablo deðiþkeni döndürmeye ihtiyacýmýz olduðunda kullanýlýr.
Fakat bu tablo deðiþkeni tek bir sql sorgusundan elde edilebilir.


Kullanýcý Tanýmlý Fonksiyonlar 3 : Multi-Statement Table-Valued Function : 

Bu fonksiyon türü yine Inline Table-Valued Function gibi bir tablo deðiþkeni döndürür 
fakat bu iþlemi birden fazla sql ifadesi ile yapabilmesi ,ikisini birbirinden ayýran özelliktir.




1.TÜR : Sistem Tanýmlý Fonksyionlar :

Sistem tanýmlý fonksiyonlar Sql Server tarafýndan önceden hazýrlanmýþ ,tanýmlanmýþ fonksiyonlardýr. 
Bunlarda kendi içinde Scalar Functions (Skaler Fonksiyonlar) ve Aggregate Functions olarak ikiye ayrýlýr.


Single Row Function - Scaler (Tek Satýr Fonksiyonlar), Multiple Row Function (Grup Function) Çok Satýr Fonksiyonlarý.

Single Row Function (Tek Satýr Fonksiyonlar) ve Multiple Row Function (Grup Function)'lar 
Tanýmlanmýþ Sistem fonksiyonlarý içerisnde yer almaktadýr.

Single Row Function (Tek Satýr Fonksiyonlar)' a örnek olarak :
SQL scalar fonksiyonlarý, giriþ deðerine baðlý olarak tek bir deðer döndürür.
Karakter fonksyionlarý,numerik fonskyionlar ... saymak mümkündür.
Yanlýzca tek bir deðer üzerinde çalýþýr 
ve geriye tek bir deðer döndüren fonksiyonlardýr , örneði rand(5) , upper('code.replyfeed') 


Multiple Row Function (Grup Function)'da ise,daha önce gördüðümüz aggregate fonk'lar örnek gösterilebilir.

Skaler fonksiyonlarýn aksine bir koleksiyon üzerinde çalýþýr 
fakat yine ayný þekilde geriye bir deðer döndürür , min() ,max() , count() .. fonksiyonlarý örnek verilebilir.
AVG,SUM,MIN,MAX,COUNT...
Toplama (Aggregate) iþlevleri, SQL Veritabaný’ndaki bir tablonun sütununun veri kümelerinde 
çalýþmak ve bir sonuç döndürmek için kullanýlýr.


*/


--- ### METÝN FONKSÝYONLARI ### ---

--------### ASCII BAÞLANGIÇ ### ---

--1	:ASCII--Karakterin ASCII kodunu bize gösterir.
--2	:SYNTAX:ASCII ( character_expression ) 
--3	:Birden fazla karakter girildiyese,bize metnin ilk karakterinin ASCII kodunu döner.
--4	:ASCII :American Standard Code For Information Interchange.(Bilgi Alýþveriþi Ýçin Standard Amerikan Kodu)
/*--5	:
Bilgisayarda metin iþlemlerinin yapýlabilmesi için sayýlarýn belli karakterlerle eþleþtrilmesi gerekmektedir.
ASCII tablosu hangi sayýnýn hangi karaktere karþýlýk geleceðini gösteren tablodur.
Birtakým sayýlarýn bir takým karakterlerle eþleþtirildiði basit bir tablo olarak düþünebiliriz.
Toplam 255 karakter sayýlarla eþleþtirilmiþtir bu tabloda.
Ýlk 32 karakter anlamsýzdýr.
Geri kalan sayýlar ise doðrudan karakterlere,sayýlara ve noktalama iþaretlerine tahsis edilmiþtir.
Bu eþleþtrime tablosu sayesinde bilgisayarýn sayýlarla birlikte karakterleri de iþleyebilmesini saðlanmaktadýr.
Özetle hangi sayýlar hangi karakterlere denk geliyor sorusunun cevabý bulunmaktadýr.
Her bir karakter 0 ile 255 arasýnda bir deðere baðlanmýþtýr.

*/
--6	:Eðer metin girilmemiþse NULL döner.

--ÖRNEKLER:
SELECT ASCII('');--NULL
SELECT ASCII(NULL);--NULL
SELECT ASCII('t');--116
SELECT ASCII('T');--84
SELECT ASCII('Tebeþir');--84
SELECT ASCII('+');--43
SELECT ASCII(',');--43
SELECT ASCII(0);--48
SELECT ASCII('%');--37
SELECT ASCII('=');--61
SELECT ASCII('@');--64
SELECT ASCII('A');--65
SELECT ASCII('K')
--------### ASCII BÝTÝÞ ### ---



--- ### CHAR BAÞLANGIÇ ### ---
--Fonksiyona yazýlan kodun karakterini bize döner.
--ASCII fon'nun tam tersidir.
--SYNTAX: CHAR ( integer_expression ) 
--0 ÝLE 255 arasýnda bir deðer girebilirim.


--ÖRNEKLER :
SELECT ASCII('A');--65
SELECT CHAR(65);--A
SELECT ASCII('=');--61
SELECT CHAR(61);-- =
SELECT CHAR(256);-- NULL
SELECT CHAR(116);-- t
SELECT CHAR(35);
SELECT CHAR(64);
SELECT CHAR(94);
SELECT CHAR(49);--1
SELECT CHAR(10);
SELECT CHAR(9);



--char(9) --Tab
SELECT 'Merhaba,' + CHAR(9) + CHAR(9) + CHAR(9) + CHAR(9) + CHAR(9) + 'Dünya' as Result

SELECT 'Merhaba,' + CHAR(9) + 'Dünya' as Result

--ONUR YAZALIM:
SELECT CHAR(79)+CHAR(78)+CHAR(85)+CHAR(82)




--- ### CHAR BÝTÝÞ ### ---



--- ### CHARINDEX BAÞLANGIÇ ### ---
--Aranan kelimenin bize metin içindeki pozisyonunu getirir.
--syntax :CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] ) 
--Eðer arana kelime bulunamzsa 0 döner.
--Büyük harf küçük harf duyarlý deðildir.
--ÖRNEK :


SELECT CHARINDEX ('bul','Ýstanbul Üniversitesi')--6
SELECT CHARINDEX ('Üniversitesi','Ýstanbul Üniversitesi')--10
SELECT CHARINDEX('u','Onur')--3
SELECT CHARINDEX('r','Onur')--4
SELECT CHARINDEX('r','Melis')--0
SELECT CHARINDEX('r','Onur')
SELECT CHARINDEX('R','Onur')--4
SELECT CHARINDEX('r','Onur')--4
SELECT CHARINDEX('a','Asansör')--1
SELECT CHARINDEX('A','Asansör')--1
SELECT CHARINDEX('A','Asansör',1)--1
SELECT CHARINDEX('A','Asansör',2)--3
SELECT CHARINDEX('A','ABA',2)--3
SELECT CHARINDEX('is','This is my sister')--13
SELECT CHARINDEX('is','This is my sister',10)--13

--Büyük harf küçük harf duyarlý çalýþmak için :
--COLLATE Latin 1_General_CS_AS

--- ### CHARINDEX BÝTÝÞ ### ---


---###CONCAT BAÞLANGIÇ ###

--SYNTAX : CONCAT ( string_value1, string_value2 [, string_valueN ] ) 
--Metinleri birleþtirmeye yarar.
--255 tane metin girebiliriz.
--En az iki veri girmemiz gerekmetedir.



--ÖRNEK :
SELECT CONCAT('SQL','EÐLENCELÝDÝR')
SELECT CONCAT('SQL',' ','EÐLENCELÝDÝR')

SELECT CONCAT('SQL',' ','Kursumuza',' ','Hoþgeldiniz',' ',':)')


--Bu özellik Sql server 2012 ile geldi.SQL SERVER 2008 veya 2005 ile nasýl yapýcaðýz ?

select 'SQL' + 'EÐLENCELÝDÝR'
SELECT 'Onur' + ' ' + 'Okay'
select 'SQL' + ' ' + 'EÐLENCELÝDÝR'
select 'Bugün' + ' ' + 'Özge''nin' + ' ' + 'DoðumGünü'



---###CONCAT BÝTÝÞ ###



---### + ile Birleþtirme Baþlangýç ### ---
-- + OPEARTÖRÜ metinleri birleþtirmeye yarar.

SELECT 'Haydi' + ' ' + 'SQL' + ' Öðrenelim'
SELECT 'Onur' + ' ' +'Okay'

---### + ile Birleþtirme Bitiþ ### ---



---### concat_ws ### ---
--Bir ayraç kullanarak metinleri birleþtirmeye yarar.
--SYNTAX :CONCAT_WS ( separator, argument1, argument2 [, argumentN]... )
--En az 2 metinsel ifade girilmesi gereklidir.

--ÖRNEK :
SELECT CONCAT_WS(' ','Galatasaray','Spor','Klubü')

SELECT CONCAT_WS('-','Galatasaray','Spor','Klubü')

SELECT CONCAT_WS('.','www','turkiye','gov','tr')--www.turkiye.gov.tr

SELECT CONCAT_WS(' ','Onur','Okay')--Onur Okay

SELECT CONCAT_WS('-','Onur','Okay')--Onur-Okay

SELECT CONCAT_WS(',',1,2,3,NULL,NULL,4,5)--1,2,3,4,5

---### concat_ws BÝTÝÞ ### ---



---###DATALENGTH###---
--Byte cinsinden girilen metnin uzunluðunu verir.
--SYNTAX :DATALENGTH ( expression ) 
--Hem en baþtaki hem de varsa en sondaki tüm boþluklarý sayar.
--Len fonksiyonu ise en sondaki boþluklarý saymaz.

--ÖRNEK :

SELECT DATALENGTH('Ýstanbul')--8
SELECT DATALENGTH('Ýstanbul   ')--11
SELECT DATALENGTH('  Ýstanbul   ')--13
SELECT DATALENGTH ('2022-01-01')--10
SELECT DATALENGTH ('')--0
SELECT DATALENGTH (' ')--1
SELECT DATALENGTH ('A')--1
SELECT DATALENGTH (NULL)--NULL

---###DATALENGTH BÝTTÝ ###---



---###SOUNDEX BAÞLANGIÇ ###---

--syntax :SOUNDEX ( character_expression )  
--SOUNDEX,  dizenin Ýngilizce konuþulduðunda 
--nasýl ses çýkardýðýna baðlý olarak dört karakterli bir koda dönüþtürür.
--Metni alýr ve onu 4 karakterli bir koda dönüþtürür.
--Soundex kodunun ilk karakteri daima girilen metnin ilk harfidir.
--Diðer 3 sayýsal deðerde harfleri simgeleyen sayýlarýdýr.
--4 karakterli kodu oluþturabilmek için gerekirse sonlarýna 0 koyar.
--A,E,I,O,U,H,W harfleri metnin ilk harfleri deðllerse dikkate alýnmazlar.
--Kelimeleri konuþurken ki çýkan seslere göre kýyaslamak ve benzeyip benzemediðini 
--bulmak amacýyla kullanýlýr.
--Soundex kodlarýnýn benzerliklerini kontrol etmek için DIFFERENCE fonk.kullanýlýr.

SELECT SOUNDEX('Juice')--J200
SELECT SOUNDEX('Jucy')--J200
SELECT SOUNDEX('Onur')--O560
SELECT SOUNDEX('Honour')--H560
SELECT SOUNDEX('See')--s000
SELECT SOUNDEX('Sea')--s000
SELECT SOUNDEX('Cofee')--C100
SELECT SOUNDEX('Tea')--T000

---###SOUNDEX BÝTÝÞ ###---



---###DIFFERENCE BAÞLANGIÇ ###---
--syntax :DIFFERENCE ( character_expression , character_expression ) 
--2 SOUNDEX deðerini kýyaslar ve int deðerinde döner.
-- 0 >>> Zayýf Benzerlik
-- 4 >>> Güçlü Benzerlik

SELECT DIFFERENCE ('Onur','Honour')--3
SELECT DIFFERENCE ('Juice','Jucy')--4
SELECT DIFFERENCE ('Too','Two')--4
SELECT SOUNDEX('Two')--T000
SELECT SOUNDEX('Too')--T000
SELECT DIFFERENCE ('Johnny','John')--4



---###DIFFERENCE BÝTÝÞ ###---


--- ### FORMAT BAÞLANGIÇ #### ---

--Belirttiðimiz biçimde deðeri formatlar.
--Genellikle DATE/TÝME ve numeric deðerlerin formatlanmasýnda kullanýlýr.
--Veri Tiplerini dönüþtürmek için CAST ve CONVERT'Ý kullanýrýz.
--SYNTAX :FORMAT( value, format [, culture ] ) 

--ÝNGÝLÝZCE :
--d –	It shows the day of the month from 1 through 31.
--D –	It gives a detailed output in Weekday, Month, Date, Year format.
--f-	It adds timestamp as well in the output of D parameter.it does not include seconds information.
--F-	It adds seconds (ss) information also in the output generated from f parameter.
--g:-	It gives output in MM/DD/YYYY hh: mm AM/PM.
--G:	Output format MM/DD/YYYY hh:mm: ss AM/PM.
--M/m:	Output format-Month date
--O –	Output format yyyy-mm-ddThh:mm:ss.nnnnnnn
--R –	Output format Day, dd Mon yyyy hh:mm:ss GMT
--s :	Output format yyyy-mm-ddThh:mm:ss
--U :	Output format yyyy-mm-dd hh:mm:ssz
--T :	Output format hh:mm:ss AM/PM
--t :	Output format hhLmm AM/PM
--Y:	Output format Mon yyyy

--Diðer Formatlar :
--Output format – MM/dd/yy
--Output format – MMdd/yyyy
--Output format -yy.MM.dd
--Output format yyyy.MM.dd
--Output format -dd/MM/yy
--Output format -dd/MM/yy
--dd-MM-yyyy
--dd MMM yy
--dd MMM yyyy
--MMM dd yyyy
--HH:mm:ss
--MMM d yyyy h:mm:ss
--Dd MMM yyyy HH:mm:ss
--yyyy-MM-dd HH:mm:ss
--MM/dd/yy h:mm:ss tt
--yy-M-d
--M-d-yyyy
--d-M-yyyy
--d-M-yy
--MMMM dd,yyyy

--TÜRKÇE -:

--FORMAT :
--d –	1'den 31'e kadar ayýn gününü gösterir..
--D –	Hafta içi Günleri, Ay, Tarih, Yýl formatýnda detaylý çýktý verir.
--f -   D formatýna ek olarak TIMESTAMP ekler.Ancak saniye bilgisine göstermez.
--F-	f parametresine saniyeleride ekler.
--g:-	MM/DD/YYYY hh: mm AM/PM.
--G:	Output format MM/DD/YYYY hh:mm: ss AM/PM.
--M/m:	Output format-Month date
--O –	Output format yyyy-mm-ddThh:mm:ss.nnnnnnn
--R –	Output format Day, dd Mon yyyy hh:mm:ss GMT
--s :	Output format yyyy-mm-ddThh:mm:ss
--U :	Output format yyyy-mm-dd hh:mm:ssz
--T :	Output format hh:mm:ss AM/PM
--t :	Output format hhLmm AM/PM
--Y:	Output format Mon yyyy

--Kültür Kodlarý :
/*
'tr-TR'
'en-US' AS 'US English format', 
'en-gb' AS 'Great Britain English format', 
'de-de' AS 'German format', 
'zh-cn' AS 'Simplified Chinese (PRC) format', 
'ru-RU' AS 'Russian  format', 
*/


--ÖRNEKLER :
SELECT getdate()

---TARÝH FORMATLAMA ---
--Burada bir deðiþken tanýmlýyoruz.
--deðiþken bir isim verdik,ismimiz : @d
--deðiþken Veri tipini tanýmladýk.
--Ve Getdate fon'nuna eþitledik.
--UYARI !!!: Deðiþken tanýmnladýysak,sorgumuzu deðiþken tanýmlarýyla birlikte çalýþtýrmamýz lazým.
--Yani sadece SELECT FORMAT(@d,'d','en-US')'ý çalýþtýrýrsak hata alýrýz.

DECLARE @d DATE = GETDATE();

SELECT FORMAT(@d,'d','en-US')

SELECT FORMAT(GETDATE(),'d','en-US')



--ÖRNEK:
DECLARE @d DATE = GETDATE();
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'd', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'd', 'de-de' ) 'German'  
	  ,FORMAT( @d, 'd', 'tr-Tr' ) 'Türkiye' 

	
SELECT FORMAT (getdate(), 'd')--4/29/2022
SELECT FORMAT (getdate(), 'D')--Friday, April 29, 2022
SELECT FORMAT (getdate(), 'D','tr-TR')--29 Nisan 2022 Cuma
SELECT FORMAT (getdate(), 'g','tr-TR')--29.04.2022 17:09
SELECT FORMAT (getdate(), 'g')--4/29/2022 5:10 PM
SELECT FORMAT (getdate(), 's')--2022-04-29T17:11:41
SELECT FORMAT (getdate(), 'r')--Fri, 29 Apr 2022 17:12:34 GMT



SELECT FORMAT(GETDATE(), 'yyyy.MM.dd')
SELECT FORMAT(GETDATE(), 'dd.MM.yyyy')--29.04.2022
SELECT FORMAT (getdate(), 'T','tr-Tr')
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy')--29/04/2022
SELECT FORMAT(GETDATE(), 'dd.MM.yy')
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd HH:mm:ss')
SELECT FORMAT(GETDATE(), 'HH:mm:ss')--17:14:46



---SAYISAL DEÐER FORMATLAMA --

DECLARE @Maliyet INT= 12345; 
SELECT FORMAT(@Maliyet, 'N', 'en-US') AS 'USA Number format', 
       FORMAT(@Maliyet, 'N', 'ru-RU') AS 'Russian Number format', 
       FORMAT(@Maliyet, 'N', 'hi-IN') AS 'Indian Number format', 
       FORMAT(@Maliyet, 'N', 'de-DE') AS 'Euro Number format', 
       FORMAT(@Maliyet, 'N', 'en-gb') AS 'Britain Number format',
	   FORMAT(@Maliyet, 'N', 'tr-TR') AS 'Türkiye Number format';


SELECT  FORMAT(123456789,'###-##-####')
SELECT FORMAT(1234559,'#,###','tr-TR')--1.234.559
SELECT FORMAT(1234559,'#,###')--1,234,559
SELECT FORMAT(12345598,'#,###')--12,345,598
SELECT FORMAT(12345,'#,###','tr-TR')--12.345

---PARASAL DEÐER FORMATLAMA ---
DECLARE @Maliyet INT= 12345; 
SELECT FORMAT(@Maliyet, 'c', 'en-US') AS 'USA Currency', 
       FORMAT(@Maliyet, 'c', 'ru-RU') AS 'Russian Currency', 
       FORMAT(@Maliyet, 'c', 'hi-IN') AS 'Indian Currency', 
       FORMAT(@Maliyet, 'c', 'de-DE') AS 'Euro Currency', 
       FORMAT(@Maliyet, 'c', 'en-gb') AS 'Britain Currency',
	   FORMAT(@Maliyet, 'c', 'tr-TR') AS 'TürkLirasý';


SELECT FORMAT(12345,'#.###')
SELECT FORMAT(12345,'#,###','tr-TR')
SELECT FORMAT(12345,'#,###')
SELECT FORMAT(12345,'#,###')
SELECT FORMAT(12345,'#,###','tr-TR')

--Normalde Formatlanmýþ datada toplama iþlemi yapmaya kalksak bize hata verir.
--Dolayýsýyla ilk baþta integer'a çevirip öyle topluyorum.

select FORMAT((CAST(12345 AS INT) + 100),'#,###','tr-TR')

-------


DECLARE @SAYI INT = 10000 
SELECT
	  FORMAT(@SAYI, 'N', 'tr-TR') AS 'Numeric Format'  
      ,FORMAT(@SAYI, 'G', 'tr-TR') AS 'General Format'  
      ,FORMAT(@SAYI, 'C', 'tr-TR') AS 'Currency Format'  


--- ### FORMAT BÝTÝÞ #### ---







--- ### LEFT ### ---
--Soldan baþlayarak metinden belirttiðimiz kadar parça alýr.
--SYNTAX :LEFT ( character_expression , integer_expression )  
--ÖRNEK :
select LEFT('Onur',2)
select LEFT('Onur',100)
select LEFT('Onur Okay',5)


SELECT NAME,
LEFT(NAME,2)
FROM Production.Product

--- ### LEFT BÝTÝÞ ### ---


--- ### LEN BAÞLANGIÇ ### ---
--Metnin uzunluðunu verir.
--Metnin sonundaki boþluklar uzunluk hesaplanýrken sayýlmaz.
--LEN ( string_expression ) 
--ÖRNEK:

SELECT LEN('  Ýstanbul')--10
SELECT LEN('Sakarya     ')--7
SELECT LEN(NULL)--NULL
SELECT LEN (' ')--0
SELECT LEN ('')--0
SELECT LEN('  Antalya   ')--9


--- ### LEN BÝTÝÞ ### ---




--- ### LOWER BAÞLANGIÇ. ### ---
-- Metni küçükharfe çevirir.
--SYNTAX :LOWER ( character_expression )
--ÖRNEKLER :

SELECT LOWER('ÝSTANBUL')
SELECT LOWER('ANTALYA')


SELECT
FirstName,
LastName,
CONCAT_WS(' ',LOWER(FirstName),LOWER(LastName))
FROM Person.Person

--- UYARI !!!!!
select * from Person.Person
WHERE FirstName = 'ken'--Bu da getirir ancak aþaðýdaki yöntem daha saðlýklýdýr.

select * from Person.Person
WHERE lower(FirstName) = 'ken'


--- ### LOWER BÝTÝÞ ### ---





--- ### LTRIM BAÞLANGIÇ ### ---
--Metnin baþýndaki boþluklarý siler.
--SYNTAX LTRIM ( character_expression ) 
--örnek
select LTRIM('   Ýstanbul')--Ýstanbul
select LTRIM('   Ýstanbul           ')--Ýstanbul           
select LTRIM('Ýstanbul')



--- ### LTRIM BÝTÝÞ ### ---



--- ### PATINDEX BAÞLANGIÇ ### ---
--SYNTAX :PATINDEX ( '%pattern%' , expression )  
--Pattren'in metindeki pozisyonunu bulur.
--Patern bulunmazsa 0 döner.
/*
% Yüzdenin içindeki h
_ Tek bir karakterle eþleþ.
[xyz] Köþeli parantezin içindeki herhangi bir karakterle eþleþ.x,y,z herhangibiryle eþleþir
[^xyz]Köþeli parantezin içinde olmayan herhangi bir karakterle eþleþ.x,y,z olmayanlarla eþleþir.
*/
--öRNEK:

SELECT PATINDEX('%ur%','Onur')--3
SELECT PATINDEX('%ist%','Ýstanbul')--1
SELECT PATINDEX('%u%','Ýstanbul')--7
SELECT PATINDEX('%[nb]%','Ýstanbul')--5
SELECT PATINDEX('%l%','Ýstanbul')--8
SELECT PATINDEX('%F%','SQL Metin Fonksiyonlarý')--11



--- ### PATINDEX BÝTÝÞ ### ---


--- ### QUOTENAME BAÞLANGIÇ ### ---

--SYNTAX :QUOTENAME ( 'character_string' [ , 'quote_character' ] ) 
--Default olarak köþeli parantez döner.
--Ama baþka bir þey belirtmek istersek de çalýþýr.

--ÖRNEKLER:

SELECT QUOTENAME('Onur')
SELECT QUOTENAME('Onur','()')
SELECT QUOTENAME('Onur','{}')

--- ### QUOTENAME BÝTÝÞ ### ---



--- ### REPLACE BAÞLANGIÇ ### ---

--SYNTAX :REPLACE ( string_expression , string_pattern , string_replacement )  
--Herhangi bir argüman null ise null döner.
--Belirtilen bir dize deðerinin tüm oluþumlarýný baþka bir dize deðeriyle deðiþtirir.

--ÖRNEK :

SELECT REPLACE('SQL Dersleri','SQL','Excel')
SELECT REPLACE('SQL Dersleri','sql','Excel')
SELECT REPLACE('ABC ABC ABC','A','Z')
SELECT REPLACE('Onur','r',3)
SELECT REPLACE('Crz','z',7)
SELECT REPLACE('Bugün dýþarýya çýktým ve sýcak bir kahve içtim.','kahve','Çay')


--- ### REPLACE BÝTÝÞ ### ---


--- ### REPLICATE BAÞLANGIÇ ### ---

--REPLICATE ( string_expression , integer_expression )   
--Belirtilen metini istediðimiz sayýda tekrar edilmesini saðlar.
--ÖRNEK:

SELECT REPLICATE('Ýstanbul',4)
SELECT REPLICATE('-',100)


--Kod yaratmada kullanýlabilir.
SELECT * FROM HumanResources.Employee

SELECT
NationalIDNumber,
REPLICATE('0',4),
REPLICATE('0',4) + NationalIDNumber
FROM HumanResources.Employee

--- ### REPLICATE BÝTÝÞ ### ----


--- ### REVERSE BAÞLANGIÇ ### ---
-- SYNTAX : REVERSE ( string_expression )  
--Metin'i ters çevirir.
--ÖRNEK :

SELECT REVERSE('SQL Dersleri')
SELECT REVERSE('Onur')
SELECT REVERSE('runo')


--Deðiþken Yartama 1.Yol:
DECLARE @myvar VARCHAR(10) = 'runo'
SELECT REVERSE(@myvar);


--Deðiþken Yartama 2.Yol:
DECLARE @myvar VARCHAR(10);  
SET @myvar = 'runo';  
SELECT REVERSE(@myvar) AS Reversed ;  



--- ### REVERSE BÝTÝÞ ### ---


--- ### Rýght BAÞLANGIÇ ### ---
--SYNTAX: RIGHT ( character_expression , integer_expression )  
--Sðadan baþlayarak belirtilen rakam kadar harf alýr.
--ÖRNEK :
SELECT RIGHT('Onur',2)
SELECT RIGHT('Onur',100)
SELECT RIGHT('www.SQLSQLSQL.COM',4)


--- ### RIGHT BÝTÝÞ ### ---




--- ### RTRIM BAÞLANGIÇ ### ---

--Metnin sonundaki yani saðýndaki boþluklarý siler
--SYNTAX : RTRIM ( character_expression )  

--ÖRNEK :

SELECT RTRIM(' ONUR   ')-- ONUR
SELECT RTRIM('           ONUR   ')--           ONUR


-- TRIM Yparsak hem sað hem sol gider.
SELECT TRIM('           ONUR   ')--ONUR

--- ### RTRIM BÝTÝÞ ### ---


--- ### SPACE BAÞLANGIÇ ### ---


--Ýçerisinde pozitif bir deðer almalý.
--Negatif deðerde null gelir.
--SPACE ( integer_expression )  
--Belirtilen rakam kadar boþluk býrakýr.
--ÖRNEK :
SELECT ('Onur') + SPACE(1) + ('Okay')
SELECT ('Onur') + SPACE(10) + ('Okay')

--- ### SPACE BÝTÝÞ ### ---

--- ### STR BAÞLANGIÇ ### ---

--SYNTAX :STR ( float_expression [ , length [ , decimal ] ] )
--Sayýsal deðeri metin olarak geri döner. 
--length :Dönecek metnin uzunluðu.(virgül,nokta dahildir.)Default deðer 10'dur.
--Decimal : Dönecek metindeki ondalýk basamaklarýn sayýsý.16'ya eþit veya daha küçük olmalý.
--Eðer girilen uzunluk sayýdan fazla veya az ise bize * döner.


--ÖRNEK :
SELECT 'ONUR' + 1; --HATA

SELECT 'ONUR' + STR(1); --HATA VERMEZ
--VEYA
SELECT 'ONUR' + CAST(1 AS VARCHAR); --HATA


select STR(123)
select STR(123.6)
select STR(534.523,7,3)
select STR(534.523,7,2)
select STR(534.523,7,1)
select STR(534.523,2,1)
select STR(534.523,8,2)

--- ### STR BÝTÝÞ ### ---



--- ### STUFF BAÞLANGIÇ ### ---

--SYNTAX :STUFF ( character_expression , start , length , replaceWith_expression )
--STUFF iþlevi, baþka bir dizeye bir dize ekler.
--Baþlangýç konumundaki ilk dizede belirtilen uzunluktaki karakterleri siler ve 
--ardýndan ikinci dizeyi baþlangýç konumundaki ilk dizeye ekler.
--start :Karakterleri silmeye baþlayacaðý pozsiyon.
--length:Kaç karakter sileceði.Negatifse Null döner.
--Eðer girilen uzunluk metinden uzunsa metin silinir ve NULL döner.
--replaceWith_expression :Silinen metnin yerine yazýlacak yeni metin.

SELECT STUFF('Ýstanbul',1,3,'***')
SELECT STUFF('Onur',1,4,'Okay')
SELECT STUFF('Onur',1,2,'Ok')
SELECT STUFF('Onur',8,2,'Ok')
SELECT STUFF(1234,1,3,321)
SELECT STUFF(1230,3,0,':')
SELECT STUFF(STUFF(31122022,3,0,'.'),6,0,'.')


--- ### STUFF BÝTÝÞ ### ---

--- ### SUBSTRING BAÞLANGIÇ ### ---

--SUBSTRING ( expression ,start , length ) 
--Metinden karakter almaya,çýkarmaya benzer.
--start :Karakter alýnmaya baþlanacak pozisyon.
--length:Kaç karakter alýnacaðý.Negatif olamaz.
--ÖRNEK :

SELECT SUBSTRING('ÝSTANBUL',1,3)
SELECT SUBSTRING('Onur',1,1)
SELECT SUBSTRING('Onur',1,2)
SELECT SUBSTRING('ÝSTANBUL',1,30)


SELECT 
FirstName,
SUBSTRING(FirstName,1,1)
FROM Person.Person


--- ### SUBSTRING BÝTÝÞ ### ---

--- ### TRANSLATE BAÞLANGIÇ ### ---
--SYNTAX :TRANSLATE ( inputString, characters, translations)
--Metinde bazý kararkterlerin baþka karakterlerle deðiþtirmek isteyebiliriz.O zaman kullanýrýz.
--characters: YER DEÐÝÞTÝRECEK KARAKTERLER.
--translations :Yerine koyacaðýmýz metin.
--Eðer karakterler ve Yerine koyacaðýmýz metin'in uzunluklarý ayný deðilse Hata verir.
--Örnek :

SELECT TRANSLATE('[0216] 444 ****','[]','()')
SELECT TRANSLATE('Pazartesi','Pazartesi','Cumartesi')
SELECT TRANSLATE('Onur','O','S')

--- ### TRANSLATE BÝTÝÞ ### ---

        
--- ### TRIM BAÞLANGIÇ ### ---

--SYNTAX : TRIM ( [ characters FROM ] string )
--En baþtaki ve en sondaki boþluklarý siler.
--Ayný zamanda silinmesini istedðimiz karakterleride ayrý olarak belirtebiliriz.

SELECT TRIM('!' FROM 'SQL DERSLERÝ!')
SELECT TRIM('       ÝSTANBUL         ')

--
--ÖRNEK :

SELECT TRIM('       ÝSTANBUL         ')
SELECT TRIM('       SAK ARYA         ')
SELECT TRIM('       SAK      ARYA         ')
SELECT TRIM('!' FROM 'SQL DERSLERÝ!')

SELECT TRIM('!' FROM '!!!Onur..') 
SELECT TRIM('!.' FROM '!!!Onur..') 
SELECT TRIM('!. ' FROM '   !!!Onur..   ') 

SELECT TRIM('J' FROM 'J2000')
SELECT TRIM(' J' FROM '   J2000  ')--Hem boþluðý sildi hemde gitti,harfi sildi.
SELECT TRIM(' J ' FROM '   J2000  ')
SELECT TRIM('Onu' from 'Onur')

--- ### TRIM BÝTÝÞ ### ---

--- ### UPPER BAÞLANGIÇ ### ---
--SYNTAX :UPPER ( character_expression )  
--Metinin içerisindeki bütün harfleri büyük harfe çevirir.
--örnekler:

SELECT UPPER('istanbul')
SELECT UPPER('Ýstanbul')
SELECT UPPER('ÝstanBUl')

SELECT
JobTitle,
UPPER(JobTitle)
FROM HumanResources.Employee

--- ### UPPER BÝTÝÞ ### ---


---### TEXT CALCULATIONS BAÞLANGIÇ ### ----
--METÝNLERÝ BÝRLEÞTÝRME
SELECT
FirstName,
MiddleName,
LastName,
FirstName + MiddleName + LastName,
FirstName + ' ' + MiddleName + ' ' + LastName
FROM Person.Person


--METÝNLERÝ ÝLE SAYI BÝRLEÞTÝRME:
SELECT
FirstName,
MiddleName,
LastName,
3
FROM Person.Person


SELECT
FirstName,
MiddleName,
LastName,
3 AS Kazaným,
FirstName + ' ' + CAST(3 AS VARCHAR(5)),--First name ile 3 'ü toplamaya çalýþýyor.Dolayýsýyla sayýsyý metine çevirmemiz gerekiyor.
FirstName + ' ' + CONVERT(VARCHAR(5),3)
FROM Person.Person



--AD SOYAD AYIRMA : ---UZUN YOL:AÞAÐIDA KISA YOLU VAR:
SELECT 
ADSOYAD,
LEFT(ADSOYAD,4),
CHARINDEX(' ',ADSOYAD),
LEFT(ADSOYAD,CHARINDEX(' ',ADSOYAD)),
LEFT(ADSOYAD,CHARINDEX(' ',ADSOYAD)-1) AS ISIM,
RIGHT(ADSOYAD,5),
LEN(ADSOYAD),
LEN(ADSOYAD) - CHARINDEX(' ',ADSOYAD) -1,
RIGHT(ADSOYAD,LEN(ADSOYAD) - CHARINDEX(' ',ADSOYAD) -1)
FROM

(
SELECT
FirstName + ' ' + ' ' + LastName AS ADSOYAD
FROM Person.Person
)A



--KISA YOL:

SELECT 
ADSOYAD,
LEFT(ADSOYAD,CHARINDEX(' ',ADSOYAD)-1) AS ISIM,
RIGHT(ADSOYAD,LEN(ADSOYAD) - CHARINDEX(' ',ADSOYAD) -1)
FROM

(
SELECT
FirstName + ' ' + ' ' + LastName AS ADSOYAD
FROM Person.Person
)A



