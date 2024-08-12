


-- ### SSMS ARAYÜZÜ TANIYALIM - UYGULAMA DERSÝ - BAÞLANGIÇ ###



/*
YAZI FONTU BÜYÜTME :
TEXT GRID VE RESULT GRID BÜYÜTME : Tools>>Options>> 
"Fonts and Colors"'dan sorgu ekranýna yazdýðýmýz yazýnýn boyutunu ayarlayabiliriz.
*/




/*
SEÇÝM RENGÝ DEÐÝÞTÝRME : 
TEXT GRID VE RESULT GRID BÜYÜTME : Tools>>Options>> 
"Fonts and Colors" >> "Selected Text"
*/


/*
LINE NUMBER RENGÝNÝ DEÐÝÞTÝRME:
TEXT GRID VE RESULT GRID BÜYÜTME : Tools>>Options>> 
"Fonts and Colors" >> LINE NUMBER
*/



/*
LINE NUMBER ÇIKMIYORSA:
TOOLS>> OPTIONS >>> TEXT EDITOR >>> TRANSACT SQL >>> GENERAL >>> DISPLAY >>> LINE NUMBERS
*/


/*
GRID RESULT FONTUNU BÜYÜTME :
Tools>>Options>> "Fonts and Colors" >>SHOW SETTINGS FOR'da >>> "Grýd Result " seçilmeli.
Oradan istediðimiz font büyüklüðünü ayarlayabiliriz.

*/



/*
CTRL + G ile istediðimiz satýra gidebiliriz...

*/



/* KONU 1:

Database'in üstündeki LAPTOP - AIRBRICT baðlandýðýmýz server.
Alttada databaseler var.
Databse'lerin altýnda ise tablolarýmýz var.

*/


/* KONU 2:
Object Explorer server ve serverin içindeki tüm objeleri gördüðümüz yer.
Fiþten yapýyoruz.
Server typata baþka yerlere baðlanabiliriz.
Objecy exploererda diðer baþlýklarda var. 
Bizim için önemli olan databaseler kýsmý.
Object exp kapattým yanlýþlýkla diyelim ki,viewden>>Object Explorerdan geri getiririz.
*/






/*
KONU 4:
SQL DOSYASI YÜKLEME
*/




/* KONU 5:

Database Diagram. Hata Varsa Adventureworks2019 saðtýk,properties,files,Owner'a
sa diyeceðiz.
sa yazmak yerine ...'ya týklayýp, Browse'dan da sa'yý seçebiliriz.

*/


/* KONU 6:

Herhangibir tablo seçip.Saðtýk Design'dan tablomuzdaki kolonlarla ilgili bilgileri görebiliriz.
Kolonla ilgili "Describtion"dan bilgileri alabiliriz.

*/


/* KONU 7:

Herhangibir tablo seçip.Saðtýk Design'dan "Select Top 1000 rows" ve "Edit Top 200 rows" seçenekleri...

*/



/* KONU 8:

Database'in içinde >>> "Programmability" >>> "Functions" >>> System Functions

*/



/* KONU 9:

Ok tan farklý bir database seçebiliriz.
Sað en altta hangi database e baðlý olduðumuz bilgisi var.
*/





/* KONU 10:

New Query

*/



/* KONU 11:
Exexuting query.
F5
Sorgu ilkbaþta servera gitti sonra database e gitti sonra execute etti.
Results ve messages.
*/




/* KONU 12:
Object Explorerdaki Pin tuþu.
*/




/* KONU 13:
Tabloyu sorguyla manuel yazma veya direk tutup çekerek te tablo adýný veya sütunlarýný getirebiliriz.
*/




/* KONU 14:
SQL inttelisense. Tablo adýný yazarken yardým ediyor.
*/



/* KONU 15 : 
Þema veya dbo ayrýmý...

Örneðin Örnek veritabanýnda Select * from Dept'te diyebiliriz veya Select * from dbo.Dept'te diyebiliriz.

Þema = Kategori gibi düþünebiliriz.

Þema'dan sonra gelen asýl tablo adýmýzdýr.


*/



/* KONU 16 : 
Tablo sað týk >> Script Table As >> Create To....

*/



/* KONU 17:
2 query ayný anda da çalýþtýrabiliriz.
*/


/* KONU 18:
En altta saðda row count var.
*/



/* KONU 19:
2 tane new query window açabilirim.
2 sindede farklý veritabnalarýna baðlanabilirim.
*/





/* KONU 21:
Query adýnda yýldýz iþareti varsa, bu savelenmemiþ demektir.
File--SAVE SAVE AS... Ayný zamanda disk tuþu olarak normal save tuþumuz var.
*/



/* KONU 22:
Opening a File:
File-Open- File
*/




/* KONU 23:
Ýki query window açýksa yan yana koyabilriz.
*/



/* KONU 24:
Table sað týk--new table
*/



/* KONU 25:
Tablo sqðtýk--delete'ten tablomuzu silebiliriz.
*/



/* KONU 26:

Select * from dedik, tablolardaki kolonlarýda taþýyabiliyoruz.

*/




/* KONU 28:

Execute ýn yanýnda execution planlar var.hem actual hemde estimated.

*/


/* KONU 29:
Edit--intellisense--refresh local cache

*/



/* KONU 30:
Parse query--tick--query hatalýysa bize söylüyor.

SELECT * FORM DADHXDF

*/




/* KONU 31:
Result to text,result to grid

*/



/* KONU 32 :
QUERY window'un yerini ayarlama...

*/




/* KONU 33:


EXCELDEN VERÝ ALMA:
Excel dosyamýzý koyabileceðimiz örnek bir veritabaný yaratalým. Ve bu veritabanýn adý "EXCEL" olsun.

Veritabanýna sað týk >> Tasks >> Import Data >>
Adýmlar :
1: Veri Kaynaðý olarak Excel seçiyoruz.
2: Browsedan excel dosyamýzý seçiyoruz.
3: Bu adýmda bize hata verir.
4 : Hatayý bertaraf edebilmek için,

exceli 97-2003 workbook olarak kaydetmemiz lazým.

sonra database saðtýk--tasks--
import--devam--Destination olarak :SQL Server Natrive Client seçeceðiz.
Database olarakta istediðimiz bir veri tabanýný seçeceðiz.Biz "Excel"i seçeceðiz
dbo.sheet1-- burada sheet1 i deðiþtirip excel tablosuna isim verebiliriz.
Edit mappings kýsmýndan ise veri tiplerini ayarlayabiliriz.

*/

SELECT * FROM HumanResources.Department


/* KONU 34: SQL TO EXCEL

EXCEL 1.YOL ile kopyalama.Direk tabloyu seçip ve copy with headers diyerek tabloyu excelimize alabiliriz.

*/


SELECT * FROM HumanResources.Department


/* KONU 35: SQL TO EXCEL : Tabloyu olduðu gibi almak istiyoruz.


EXCEL 2.YOL ile kopyalama : tasks-export

SQL'deki tabloyu olduðu gibi Excel'e atmak istiyoruz.

Adýmlar :
1 : SQL tablosunun bulunduðu veritabaný sað týk >> Tasks >>> Export Data
2 : Data Source : SQL Native Client
3 : Kayýt yapacaðýmýz excel'in gene 97-2003 olmasý lazým
4 : Ýstediðimiz tabloyu seçiyoruz.

*/




/* KONU 36:
QUERY NASIL EXPORT EDÝLÝR?
Sorguyu kopyala.
gene excel 97-2003 olmasý lazým.
data source : sql serve native client.
Bu sefer write a querry to specify the data kýsmýný seçiyoruz
ve sorguyu kopyala yapýþtýr.parse
excel sheetine name verebiliriz.Query yazan yere.

*/


/* KONU 37:
Boþta saðtýk--ýnsert snippet,
bize kod þablonlarýný getiriyor.

*/






/* KONU 39:
Commetns
--
/*
*/
--
*/



/* KONU 40:
Tools- options--Environment-keyboard-Query shortcuts
Sp Help (Alt + F1)
Sp Help ne yapýyor?
Tabloyla ilgili tüm bilgileri veiroyr.
Sadece tabloyu higlight edip ve alt f1 e basarakda yapabiliriz.
Veya sp_help Person.Person da ayný þeyi yapýyor.
sp_help 'Person.Person'
*/
SELECT * FROM Person.Person

sp_help 'Person.Person'



/* KONU 42:
Alt tuþuna basarak dikey olarak tabo adlarýný deðiþtirebiliriz.


SELECT
A.KOLON
B.KOLON
C.KOLON
FROM

*/


/* KONU 43:

YARDIM : f1
Örneðin case statementýn nasýl yazýldýðýný unuttuk.
Case dedikten sonra higlight edip F1 e basabiliriz.
*/



/* KONU 44:
View---Object explorer--Object exp.details var.
Mesela Adworks databaseinde tables'a týkladým.tablo detaylarýný görebiliyoruz.
Mesela boþ bi yerde saðtýk yapýp row count diyebiliriz.
*/




/* KONU 20:
--Çok önemmli deðil...
View saðtýk.Script view as -- alter

*/



/* KONU 27:
--Çok öenmli deðil
Script stored pro: saðtýk--modfiy veya
script stor proc.alter to dersem bana gene aynýsýný getirir.

*/


/* KONU 38:
SQL SERVER PROFÝLER:
--Çok öenmli deðil
Dönen SQL sorgularýný görebiliriz.
Tools -- sql profiler--new trace- server a baðlan--
*/


-- ### SSMS ARAYÜZÜ TANIYALIM - UYGULAMA DERSÝ - BÝTÝÞ ###

