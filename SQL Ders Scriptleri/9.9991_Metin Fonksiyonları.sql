
--- FONKS�YONLAR GENEL---
/*
Fonksiyonlarla ilgili birden �ok s�n�flama yapmak m�mk�nd�r.

Fonksyionlar temel olarak 2'ye ayr�l�r.

1.T�R : Sistem Tan�ml� Fonksyionlar :
2.T�R :User Defined Function (Kullan�c� tan�ml� , Kullan�c� Taraf�ndan Olu�turulan Fonksiyonlar)


Kullan�c� Tan�ml� Fonksiyonlarda temel olarak 3'e ayr�l�r :

Kullan�c� Tan�ml� Fonksiyonlar ad�ndan da anla��laca�� gibi, Kullan�c� taraf�ndan olu�turulan fonksiyonlard�r.

Kullan�c� Tan�ml� Fonksiyonlar 1 : Scalar Functions : 

Kulan�c�n�n belirledi�i i�leve g�re geriye tek 
bir de�er d�nd�ren kullan�c� tan�ml� fonksiyonlard�r.
�rne�in parametre olarak adi ve soyadi alan ve geriye ikisini birle�tirerek 
tek bir isim soyisim stringi d�nen bir fonksiyon.

Kullan�c� Tan�ml� Fonksiyonlar 2 : Inline Table-Valued Function : 
Geriye bir tablo de�i�keni d�nd�rmeye ihtiyac�m�z oldu�unda kullan�l�r.
Fakat bu tablo de�i�keni tek bir sql sorgusundan elde edilebilir.


Kullan�c� Tan�ml� Fonksiyonlar 3 : Multi-Statement Table-Valued Function : 

Bu fonksiyon t�r� yine Inline Table-Valued Function gibi bir tablo de�i�keni d�nd�r�r 
fakat bu i�lemi birden fazla sql ifadesi ile yapabilmesi ,ikisini birbirinden ay�ran �zelliktir.




1.T�R : Sistem Tan�ml� Fonksyionlar :

Sistem tan�ml� fonksiyonlar Sql Server taraf�ndan �nceden haz�rlanm�� ,tan�mlanm�� fonksiyonlard�r. 
Bunlarda kendi i�inde Scalar Functions (Skaler Fonksiyonlar) ve Aggregate Functions olarak ikiye ayr�l�r.


Single Row Function - Scaler (Tek Sat�r Fonksiyonlar), Multiple Row Function (Grup Function) �ok Sat�r Fonksiyonlar�.

Single Row Function (Tek Sat�r Fonksiyonlar) ve Multiple Row Function (Grup Function)'lar 
Tan�mlanm�� Sistem fonksiyonlar� i�erisnde yer almaktad�r.

Single Row Function (Tek Sat�r Fonksiyonlar)' a �rnek olarak :
SQL scalar fonksiyonlar�, giri� de�erine ba�l� olarak tek bir de�er d�nd�r�r.
Karakter fonksyionlar�,numerik fonskyionlar ... saymak m�mk�nd�r.
Yanl�zca tek bir de�er �zerinde �al���r 
ve geriye tek bir de�er d�nd�ren fonksiyonlard�r , �rne�i rand(5) , upper('code.replyfeed') 


Multiple Row Function (Grup Function)'da ise,daha �nce g�rd���m�z aggregate fonk'lar �rnek g�sterilebilir.

Skaler fonksiyonlar�n aksine bir koleksiyon �zerinde �al���r 
fakat yine ayn� �ekilde geriye bir de�er d�nd�r�r , min() ,max() , count() .. fonksiyonlar� �rnek verilebilir.
AVG,SUM,MIN,MAX,COUNT...
Toplama (Aggregate) i�levleri, SQL Veritaban��ndaki bir tablonun s�tununun veri k�melerinde 
�al��mak ve bir sonu� d�nd�rmek i�in kullan�l�r.


*/


--- ### MET�N FONKS�YONLARI ### ---

--------### ASCII BA�LANGI� ### ---

--1	:ASCII--Karakterin ASCII kodunu bize g�sterir.
--2	:SYNTAX:ASCII ( character_expression ) 
--3	:Birden fazla karakter girildiyese,bize metnin ilk karakterinin ASCII kodunu d�ner.
--4	:ASCII :American Standard Code For Information Interchange.(Bilgi Al��veri�i ��in Standard Amerikan Kodu)
/*--5	:
Bilgisayarda metin i�lemlerinin yap�labilmesi i�in say�lar�n belli karakterlerle e�le�trilmesi gerekmektedir.
ASCII tablosu hangi say�n�n hangi karaktere kar��l�k gelece�ini g�steren tablodur.
Birtak�m say�lar�n bir tak�m karakterlerle e�le�tirildi�i basit bir tablo olarak d���nebiliriz.
Toplam 255 karakter say�larla e�le�tirilmi�tir bu tabloda.
�lk 32 karakter anlams�zd�r.
Geri kalan say�lar ise do�rudan karakterlere,say�lara ve noktalama i�aretlerine tahsis edilmi�tir.
Bu e�le�trime tablosu sayesinde bilgisayar�n say�larla birlikte karakterleri de i�leyebilmesini sa�lanmaktad�r.
�zetle hangi say�lar hangi karakterlere denk geliyor sorusunun cevab� bulunmaktad�r.
Her bir karakter 0 ile 255 aras�nda bir de�ere ba�lanm��t�r.

*/
--6	:E�er metin girilmemi�se NULL d�ner.

--�RNEKLER:
SELECT ASCII('');--NULL
SELECT ASCII(NULL);--NULL
SELECT ASCII('t');--116
SELECT ASCII('T');--84
SELECT ASCII('Tebe�ir');--84
SELECT ASCII('+');--43
SELECT ASCII(',');--43
SELECT ASCII(0);--48
SELECT ASCII('%');--37
SELECT ASCII('=');--61
SELECT ASCII('@');--64
SELECT ASCII('A');--65
SELECT ASCII('K')
--------### ASCII B�T�� ### ---



--- ### CHAR BA�LANGI� ### ---
--Fonksiyona yaz�lan kodun karakterini bize d�ner.
--ASCII fon'nun tam tersidir.
--SYNTAX: CHAR ( integer_expression ) 
--0 �LE 255 aras�nda bir de�er girebilirim.


--�RNEKLER :
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
SELECT 'Merhaba,' + CHAR(9) + CHAR(9) + CHAR(9) + CHAR(9) + CHAR(9) + 'D�nya' as Result

SELECT 'Merhaba,' + CHAR(9) + 'D�nya' as Result

--ONUR YAZALIM:
SELECT CHAR(79)+CHAR(78)+CHAR(85)+CHAR(82)




--- ### CHAR B�T�� ### ---



--- ### CHARINDEX BA�LANGI� ### ---
--Aranan kelimenin bize metin i�indeki pozisyonunu getirir.
--syntax :CHARINDEX ( expressionToFind , expressionToSearch [ , start_location ] ) 
--E�er arana kelime bulunamzsa 0 d�ner.
--B�y�k harf k���k harf duyarl� de�ildir.
--�RNEK :


SELECT CHARINDEX ('bul','�stanbul �niversitesi')--6
SELECT CHARINDEX ('�niversitesi','�stanbul �niversitesi')--10
SELECT CHARINDEX('u','Onur')--3
SELECT CHARINDEX('r','Onur')--4
SELECT CHARINDEX('r','Melis')--0
SELECT CHARINDEX('r','Onur')
SELECT CHARINDEX('R','Onur')--4
SELECT CHARINDEX('r','Onur')--4
SELECT CHARINDEX('a','Asans�r')--1
SELECT CHARINDEX('A','Asans�r')--1
SELECT CHARINDEX('A','Asans�r',1)--1
SELECT CHARINDEX('A','Asans�r',2)--3
SELECT CHARINDEX('A','ABA',2)--3
SELECT CHARINDEX('is','This is my sister')--13
SELECT CHARINDEX('is','This is my sister',10)--13

--B�y�k harf k���k harf duyarl� �al��mak i�in :
--COLLATE Latin 1_General_CS_AS

--- ### CHARINDEX B�T�� ### ---


---###CONCAT BA�LANGI� ###

--SYNTAX : CONCAT ( string_value1, string_value2 [, string_valueN ] ) 
--Metinleri birle�tirmeye yarar.
--255 tane metin girebiliriz.
--En az iki veri girmemiz gerekmetedir.



--�RNEK :
SELECT CONCAT('SQL','E�LENCEL�D�R')
SELECT CONCAT('SQL',' ','E�LENCEL�D�R')

SELECT CONCAT('SQL',' ','Kursumuza',' ','Ho�geldiniz',' ',':)')


--Bu �zellik Sql server 2012 ile geldi.SQL SERVER 2008 veya 2005 ile nas�l yap�ca��z ?

select 'SQL' + 'E�LENCEL�D�R'
SELECT 'Onur' + ' ' + 'Okay'
select 'SQL' + ' ' + 'E�LENCEL�D�R'
select 'Bug�n' + ' ' + '�zge''nin' + ' ' + 'Do�umG�n�'



---###CONCAT B�T�� ###



---### + ile Birle�tirme Ba�lang�� ### ---
-- + OPEART�R� metinleri birle�tirmeye yarar.

SELECT 'Haydi' + ' ' + 'SQL' + ' ��renelim'
SELECT 'Onur' + ' ' +'Okay'

---### + ile Birle�tirme Biti� ### ---



---### concat_ws ### ---
--Bir ayra� kullanarak metinleri birle�tirmeye yarar.
--SYNTAX :CONCAT_WS ( separator, argument1, argument2 [, argumentN]... )
--En az 2 metinsel ifade girilmesi gereklidir.

--�RNEK :
SELECT CONCAT_WS(' ','Galatasaray','Spor','Klub�')

SELECT CONCAT_WS('-','Galatasaray','Spor','Klub�')

SELECT CONCAT_WS('.','www','turkiye','gov','tr')--www.turkiye.gov.tr

SELECT CONCAT_WS(' ','Onur','Okay')--Onur Okay

SELECT CONCAT_WS('-','Onur','Okay')--Onur-Okay

SELECT CONCAT_WS(',',1,2,3,NULL,NULL,4,5)--1,2,3,4,5

---### concat_ws B�T�� ### ---



---###DATALENGTH###---
--Byte cinsinden girilen metnin uzunlu�unu verir.
--SYNTAX :DATALENGTH ( expression ) 
--Hem en ba�taki hem de varsa en sondaki t�m bo�luklar� sayar.
--Len fonksiyonu ise en sondaki bo�luklar� saymaz.

--�RNEK :

SELECT DATALENGTH('�stanbul')--8
SELECT DATALENGTH('�stanbul   ')--11
SELECT DATALENGTH('  �stanbul   ')--13
SELECT DATALENGTH ('2022-01-01')--10
SELECT DATALENGTH ('')--0
SELECT DATALENGTH (' ')--1
SELECT DATALENGTH ('A')--1
SELECT DATALENGTH (NULL)--NULL

---###DATALENGTH B�TT� ###---



---###SOUNDEX BA�LANGI� ###---

--syntax :SOUNDEX ( character_expression )  
--SOUNDEX,  dizenin �ngilizce konu�uldu�unda 
--nas�l ses ��kard���na ba�l� olarak d�rt karakterli bir koda d�n��t�r�r.
--Metni al�r ve onu 4 karakterli bir koda d�n��t�r�r.
--Soundex kodunun ilk karakteri daima girilen metnin ilk harfidir.
--Di�er 3 say�sal de�erde harfleri simgeleyen say�lar�d�r.
--4 karakterli kodu olu�turabilmek i�in gerekirse sonlar�na 0 koyar.
--A,E,I,O,U,H,W harfleri metnin ilk harfleri de�llerse dikkate al�nmazlar.
--Kelimeleri konu�urken ki ��kan seslere g�re k�yaslamak ve benzeyip benzemedi�ini 
--bulmak amac�yla kullan�l�r.
--Soundex kodlar�n�n benzerliklerini kontrol etmek i�in DIFFERENCE fonk.kullan�l�r.

SELECT SOUNDEX('Juice')--J200
SELECT SOUNDEX('Jucy')--J200
SELECT SOUNDEX('Onur')--O560
SELECT SOUNDEX('Honour')--H560
SELECT SOUNDEX('See')--s000
SELECT SOUNDEX('Sea')--s000
SELECT SOUNDEX('Cofee')--C100
SELECT SOUNDEX('Tea')--T000

---###SOUNDEX B�T�� ###---



---###DIFFERENCE BA�LANGI� ###---
--syntax :DIFFERENCE ( character_expression , character_expression ) 
--2 SOUNDEX de�erini k�yaslar ve int de�erinde d�ner.
-- 0 >>> Zay�f Benzerlik
-- 4 >>> G��l� Benzerlik

SELECT DIFFERENCE ('Onur','Honour')--3
SELECT DIFFERENCE ('Juice','Jucy')--4
SELECT DIFFERENCE ('Too','Two')--4
SELECT SOUNDEX('Two')--T000
SELECT SOUNDEX('Too')--T000
SELECT DIFFERENCE ('Johnny','John')--4



---###DIFFERENCE B�T�� ###---


--- ### FORMAT BA�LANGI� #### ---

--Belirtti�imiz bi�imde de�eri formatlar.
--Genellikle DATE/T�ME ve numeric de�erlerin formatlanmas�nda kullan�l�r.
--Veri Tiplerini d�n��t�rmek i�in CAST ve CONVERT'� kullan�r�z.
--SYNTAX :FORMAT( value, format [, culture ] ) 

--�NG�L�ZCE :
--d �	It shows the day of the month from 1 through 31.
--D �	It gives a detailed output in Weekday, Month, Date, Year format.
--f-	It adds timestamp as well in the output of D parameter.it does not include seconds information.
--F-	It adds seconds (ss) information also in the output generated from f parameter.
--g:-	It gives output in MM/DD/YYYY hh: mm AM/PM.
--G:	Output format MM/DD/YYYY hh:mm: ss AM/PM.
--M/m:	Output format-Month date
--O �	Output format yyyy-mm-ddThh:mm:ss.nnnnnnn
--R �	Output format Day, dd Mon yyyy hh:mm:ss GMT
--s :	Output format yyyy-mm-ddThh:mm:ss
--U :	Output format yyyy-mm-dd hh:mm:ssz
--T :	Output format hh:mm:ss AM/PM
--t :	Output format hhLmm AM/PM
--Y:	Output format Mon yyyy

--Di�er Formatlar :
--Output format � MM/dd/yy
--Output format � MMdd/yyyy
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

--T�RK�E -:

--FORMAT :
--d �	1'den 31'e kadar ay�n g�n�n� g�sterir..
--D �	Hafta i�i G�nleri, Ay, Tarih, Y�l format�nda detayl� ��kt� verir.
--f -   D format�na ek olarak TIMESTAMP ekler.Ancak saniye bilgisine g�stermez.
--F-	f parametresine saniyeleride ekler.
--g:-	MM/DD/YYYY hh: mm AM/PM.
--G:	Output format MM/DD/YYYY hh:mm: ss AM/PM.
--M/m:	Output format-Month date
--O �	Output format yyyy-mm-ddThh:mm:ss.nnnnnnn
--R �	Output format Day, dd Mon yyyy hh:mm:ss GMT
--s :	Output format yyyy-mm-ddThh:mm:ss
--U :	Output format yyyy-mm-dd hh:mm:ssz
--T :	Output format hh:mm:ss AM/PM
--t :	Output format hhLmm AM/PM
--Y:	Output format Mon yyyy

--K�lt�r Kodlar� :
/*
'tr-TR'
'en-US' AS 'US English format', 
'en-gb' AS 'Great Britain English format', 
'de-de' AS 'German format', 
'zh-cn' AS 'Simplified Chinese (PRC) format', 
'ru-RU' AS 'Russian  format', 
*/


--�RNEKLER :
SELECT getdate()

---TAR�H FORMATLAMA ---
--Burada bir de�i�ken tan�ml�yoruz.
--de�i�ken bir isim verdik,ismimiz : @d
--de�i�ken Veri tipini tan�mlad�k.
--Ve Getdate fon'nuna e�itledik.
--UYARI !!!: De�i�ken tan�mnlad�ysak,sorgumuzu de�i�ken tan�mlar�yla birlikte �al��t�rmam�z laz�m.
--Yani sadece SELECT FORMAT(@d,'d','en-US')'� �al��t�r�rsak hata al�r�z.

DECLARE @d DATE = GETDATE();

SELECT FORMAT(@d,'d','en-US')

SELECT FORMAT(GETDATE(),'d','en-US')



--�RNEK:
DECLARE @d DATE = GETDATE();
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'd', 'en-gb' ) 'Great Britain English'  
      ,FORMAT( @d, 'd', 'de-de' ) 'German'  
	  ,FORMAT( @d, 'd', 'tr-Tr' ) 'T�rkiye' 

	
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



---SAYISAL DE�ER FORMATLAMA --

DECLARE @Maliyet INT= 12345; 
SELECT FORMAT(@Maliyet, 'N', 'en-US') AS 'USA Number format', 
       FORMAT(@Maliyet, 'N', 'ru-RU') AS 'Russian Number format', 
       FORMAT(@Maliyet, 'N', 'hi-IN') AS 'Indian Number format', 
       FORMAT(@Maliyet, 'N', 'de-DE') AS 'Euro Number format', 
       FORMAT(@Maliyet, 'N', 'en-gb') AS 'Britain Number format',
	   FORMAT(@Maliyet, 'N', 'tr-TR') AS 'T�rkiye Number format';


SELECT  FORMAT(123456789,'###-##-####')
SELECT FORMAT(1234559,'#,###','tr-TR')--1.234.559
SELECT FORMAT(1234559,'#,###')--1,234,559
SELECT FORMAT(12345598,'#,###')--12,345,598
SELECT FORMAT(12345,'#,###','tr-TR')--12.345

---PARASAL DE�ER FORMATLAMA ---
DECLARE @Maliyet INT= 12345; 
SELECT FORMAT(@Maliyet, 'c', 'en-US') AS 'USA Currency', 
       FORMAT(@Maliyet, 'c', 'ru-RU') AS 'Russian Currency', 
       FORMAT(@Maliyet, 'c', 'hi-IN') AS 'Indian Currency', 
       FORMAT(@Maliyet, 'c', 'de-DE') AS 'Euro Currency', 
       FORMAT(@Maliyet, 'c', 'en-gb') AS 'Britain Currency',
	   FORMAT(@Maliyet, 'c', 'tr-TR') AS 'T�rkLiras�';


SELECT FORMAT(12345,'#.###')
SELECT FORMAT(12345,'#,###','tr-TR')
SELECT FORMAT(12345,'#,###')
SELECT FORMAT(12345,'#,###')
SELECT FORMAT(12345,'#,###','tr-TR')

--Normalde Formatlanm�� datada toplama i�lemi yapmaya kalksak bize hata verir.
--Dolay�s�yla ilk ba�ta integer'a �evirip �yle topluyorum.

select FORMAT((CAST(12345 AS INT) + 100),'#,###','tr-TR')

-------


DECLARE @SAYI INT = 10000 
SELECT
	  FORMAT(@SAYI, 'N', 'tr-TR') AS 'Numeric Format'  
      ,FORMAT(@SAYI, 'G', 'tr-TR') AS 'General Format'  
      ,FORMAT(@SAYI, 'C', 'tr-TR') AS 'Currency Format'  


--- ### FORMAT B�T�� #### ---







--- ### LEFT ### ---
--Soldan ba�layarak metinden belirtti�imiz kadar par�a al�r.
--SYNTAX :LEFT ( character_expression , integer_expression )  
--�RNEK :
select LEFT('Onur',2)
select LEFT('Onur',100)
select LEFT('Onur Okay',5)


SELECT NAME,
LEFT(NAME,2)
FROM Production.Product

--- ### LEFT B�T�� ### ---


--- ### LEN BA�LANGI� ### ---
--Metnin uzunlu�unu verir.
--Metnin sonundaki bo�luklar uzunluk hesaplan�rken say�lmaz.
--LEN ( string_expression ) 
--�RNEK:

SELECT LEN('  �stanbul')--10
SELECT LEN('Sakarya     ')--7
SELECT LEN(NULL)--NULL
SELECT LEN (' ')--0
SELECT LEN ('')--0
SELECT LEN('  Antalya   ')--9


--- ### LEN B�T�� ### ---




--- ### LOWER BA�LANGI�. ### ---
-- Metni k���kharfe �evirir.
--SYNTAX :LOWER ( character_expression )
--�RNEKLER :

SELECT LOWER('�STANBUL')
SELECT LOWER('ANTALYA')


SELECT
FirstName,
LastName,
CONCAT_WS(' ',LOWER(FirstName),LOWER(LastName))
FROM Person.Person

--- UYARI !!!!!
select * from Person.Person
WHERE FirstName = 'ken'--Bu da getirir ancak a�a��daki y�ntem daha sa�l�kl�d�r.

select * from Person.Person
WHERE lower(FirstName) = 'ken'


--- ### LOWER B�T�� ### ---





--- ### LTRIM BA�LANGI� ### ---
--Metnin ba��ndaki bo�luklar� siler.
--SYNTAX LTRIM ( character_expression ) 
--�rnek
select LTRIM('   �stanbul')--�stanbul
select LTRIM('   �stanbul           ')--�stanbul           
select LTRIM('�stanbul')



--- ### LTRIM B�T�� ### ---



--- ### PATINDEX BA�LANGI� ### ---
--SYNTAX :PATINDEX ( '%pattern%' , expression )  
--Pattren'in metindeki pozisyonunu bulur.
--Patern bulunmazsa 0 d�ner.
/*
% Y�zdenin i�indeki h
_ Tek bir karakterle e�le�.
[xyz] K��eli parantezin i�indeki herhangi bir karakterle e�le�.x,y,z herhangibiryle e�le�ir
[^xyz]K��eli parantezin i�inde olmayan herhangi bir karakterle e�le�.x,y,z olmayanlarla e�le�ir.
*/
--�RNEK:

SELECT PATINDEX('%ur%','Onur')--3
SELECT PATINDEX('%ist%','�stanbul')--1
SELECT PATINDEX('%u%','�stanbul')--7
SELECT PATINDEX('%[nb]%','�stanbul')--5
SELECT PATINDEX('%l%','�stanbul')--8
SELECT PATINDEX('%F%','SQL Metin Fonksiyonlar�')--11



--- ### PATINDEX B�T�� ### ---


--- ### QUOTENAME BA�LANGI� ### ---

--SYNTAX :QUOTENAME ( 'character_string' [ , 'quote_character' ] ) 
--Default olarak k��eli parantez d�ner.
--Ama ba�ka bir �ey belirtmek istersek de �al���r.

--�RNEKLER:

SELECT QUOTENAME('Onur')
SELECT QUOTENAME('Onur','()')
SELECT QUOTENAME('Onur','{}')

--- ### QUOTENAME B�T�� ### ---



--- ### REPLACE BA�LANGI� ### ---

--SYNTAX :REPLACE ( string_expression , string_pattern , string_replacement )  
--Herhangi bir arg�man null ise null d�ner.
--Belirtilen bir dize de�erinin t�m olu�umlar�n� ba�ka bir dize de�eriyle de�i�tirir.

--�RNEK :

SELECT REPLACE('SQL Dersleri','SQL','Excel')
SELECT REPLACE('SQL Dersleri','sql','Excel')
SELECT REPLACE('ABC ABC ABC','A','Z')
SELECT REPLACE('Onur','r',3)
SELECT REPLACE('Crz','z',7)
SELECT REPLACE('Bug�n d��ar�ya ��kt�m ve s�cak bir kahve i�tim.','kahve','�ay')


--- ### REPLACE B�T�� ### ---


--- ### REPLICATE BA�LANGI� ### ---

--REPLICATE ( string_expression , integer_expression )   
--Belirtilen metini istedi�imiz say�da tekrar edilmesini sa�lar.
--�RNEK:

SELECT REPLICATE('�stanbul',4)
SELECT REPLICATE('-',100)


--Kod yaratmada kullan�labilir.
SELECT * FROM HumanResources.Employee

SELECT
NationalIDNumber,
REPLICATE('0',4),
REPLICATE('0',4) + NationalIDNumber
FROM HumanResources.Employee

--- ### REPLICATE B�T�� ### ----


--- ### REVERSE BA�LANGI� ### ---
-- SYNTAX : REVERSE ( string_expression )  
--Metin'i ters �evirir.
--�RNEK :

SELECT REVERSE('SQL Dersleri')
SELECT REVERSE('Onur')
SELECT REVERSE('runo')


--De�i�ken Yartama 1.Yol:
DECLARE @myvar VARCHAR(10) = 'runo'
SELECT REVERSE(@myvar);


--De�i�ken Yartama 2.Yol:
DECLARE @myvar VARCHAR(10);  
SET @myvar = 'runo';  
SELECT REVERSE(@myvar) AS Reversed ;  



--- ### REVERSE B�T�� ### ---


--- ### R�ght BA�LANGI� ### ---
--SYNTAX: RIGHT ( character_expression , integer_expression )  
--S�adan ba�layarak belirtilen rakam kadar harf al�r.
--�RNEK :
SELECT RIGHT('Onur',2)
SELECT RIGHT('Onur',100)
SELECT RIGHT('www.SQLSQLSQL.COM',4)


--- ### RIGHT B�T�� ### ---




--- ### RTRIM BA�LANGI� ### ---

--Metnin sonundaki yani sa��ndaki bo�luklar� siler
--SYNTAX : RTRIM ( character_expression )  

--�RNEK :

SELECT RTRIM(' ONUR   ')-- ONUR
SELECT RTRIM('           ONUR   ')--           ONUR


-- TRIM Yparsak hem sa� hem sol gider.
SELECT TRIM('           ONUR   ')--ONUR

--- ### RTRIM B�T�� ### ---


--- ### SPACE BA�LANGI� ### ---


--��erisinde pozitif bir de�er almal�.
--Negatif de�erde null gelir.
--SPACE ( integer_expression )  
--Belirtilen rakam kadar bo�luk b�rak�r.
--�RNEK :
SELECT ('Onur') + SPACE(1) + ('Okay')
SELECT ('Onur') + SPACE(10) + ('Okay')

--- ### SPACE B�T�� ### ---

--- ### STR BA�LANGI� ### ---

--SYNTAX :STR ( float_expression [ , length [ , decimal ] ] )
--Say�sal de�eri metin olarak geri d�ner. 
--length :D�necek metnin uzunlu�u.(virg�l,nokta dahildir.)Default de�er 10'dur.
--Decimal : D�necek metindeki ondal�k basamaklar�n say�s�.16'ya e�it veya daha k���k olmal�.
--E�er girilen uzunluk say�dan fazla veya az ise bize * d�ner.


--�RNEK :
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

--- ### STR B�T�� ### ---



--- ### STUFF BA�LANGI� ### ---

--SYNTAX :STUFF ( character_expression , start , length , replaceWith_expression )
--STUFF i�levi, ba�ka bir dizeye bir dize ekler.
--Ba�lang�� konumundaki ilk dizede belirtilen uzunluktaki karakterleri siler ve 
--ard�ndan ikinci dizeyi ba�lang�� konumundaki ilk dizeye ekler.
--start :Karakterleri silmeye ba�layaca�� pozsiyon.
--length:Ka� karakter silece�i.Negatifse Null d�ner.
--E�er girilen uzunluk metinden uzunsa metin silinir ve NULL d�ner.
--replaceWith_expression :Silinen metnin yerine yaz�lacak yeni metin.

SELECT STUFF('�stanbul',1,3,'***')
SELECT STUFF('Onur',1,4,'Okay')
SELECT STUFF('Onur',1,2,'Ok')
SELECT STUFF('Onur',8,2,'Ok')
SELECT STUFF(1234,1,3,321)
SELECT STUFF(1230,3,0,':')
SELECT STUFF(STUFF(31122022,3,0,'.'),6,0,'.')


--- ### STUFF B�T�� ### ---

--- ### SUBSTRING BA�LANGI� ### ---

--SUBSTRING ( expression ,start , length ) 
--Metinden karakter almaya,��karmaya benzer.
--start :Karakter al�nmaya ba�lanacak pozisyon.
--length:Ka� karakter al�naca��.Negatif olamaz.
--�RNEK :

SELECT SUBSTRING('�STANBUL',1,3)
SELECT SUBSTRING('Onur',1,1)
SELECT SUBSTRING('Onur',1,2)
SELECT SUBSTRING('�STANBUL',1,30)


SELECT 
FirstName,
SUBSTRING(FirstName,1,1)
FROM Person.Person


--- ### SUBSTRING B�T�� ### ---

--- ### TRANSLATE BA�LANGI� ### ---
--SYNTAX :TRANSLATE ( inputString, characters, translations)
--Metinde baz� kararkterlerin ba�ka karakterlerle de�i�tirmek isteyebiliriz.O zaman kullan�r�z.
--characters: YER DE���T�RECEK KARAKTERLER.
--translations :Yerine koyaca��m�z metin.
--E�er karakterler ve Yerine koyaca��m�z metin'in uzunluklar� ayn� de�ilse Hata verir.
--�rnek :

SELECT TRANSLATE('[0216] 444 ****','[]','()')
SELECT TRANSLATE('Pazartesi','Pazartesi','Cumartesi')
SELECT TRANSLATE('Onur','O','S')

--- ### TRANSLATE B�T�� ### ---

        
--- ### TRIM BA�LANGI� ### ---

--SYNTAX : TRIM ( [ characters FROM ] string )
--En ba�taki ve en sondaki bo�luklar� siler.
--Ayn� zamanda silinmesini isted�imiz karakterleride ayr� olarak belirtebiliriz.

SELECT TRIM('!' FROM 'SQL DERSLER�!')
SELECT TRIM('       �STANBUL         ')

--
--�RNEK :

SELECT TRIM('       �STANBUL         ')
SELECT TRIM('       SAK ARYA         ')
SELECT TRIM('       SAK      ARYA         ')
SELECT TRIM('!' FROM 'SQL DERSLER�!')

SELECT TRIM('!' FROM '!!!Onur..') 
SELECT TRIM('!.' FROM '!!!Onur..') 
SELECT TRIM('!. ' FROM '   !!!Onur..   ') 

SELECT TRIM('J' FROM 'J2000')
SELECT TRIM(' J' FROM '   J2000  ')--Hem bo�lu�� sildi hemde gitti,harfi sildi.
SELECT TRIM(' J ' FROM '   J2000  ')
SELECT TRIM('Onu' from 'Onur')

--- ### TRIM B�T�� ### ---

--- ### UPPER BA�LANGI� ### ---
--SYNTAX :UPPER ( character_expression )  
--Metinin i�erisindeki b�t�n harfleri b�y�k harfe �evirir.
--�rnekler:

SELECT UPPER('istanbul')
SELECT UPPER('�stanbul')
SELECT UPPER('�stanBUl')

SELECT
JobTitle,
UPPER(JobTitle)
FROM HumanResources.Employee

--- ### UPPER B�T�� ### ---


---### TEXT CALCULATIONS BA�LANGI� ### ----
--MET�NLER� B�RLE�T�RME
SELECT
FirstName,
MiddleName,
LastName,
FirstName + MiddleName + LastName,
FirstName + ' ' + MiddleName + ' ' + LastName
FROM Person.Person


--MET�NLER� �LE SAYI B�RLE�T�RME:
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
3 AS Kazan�m,
FirstName + ' ' + CAST(3 AS VARCHAR(5)),--First name ile 3 '� toplamaya �al���yor.Dolay�s�yla say�sy� metine �evirmemiz gerekiyor.
FirstName + ' ' + CONVERT(VARCHAR(5),3)
FROM Person.Person



--AD SOYAD AYIRMA : ---UZUN YOL:A�A�IDA KISA YOLU VAR:
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



