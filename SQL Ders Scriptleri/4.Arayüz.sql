


-- ### SSMS ARAY�Z� TANIYALIM - UYGULAMA DERS� - BA�LANGI� ###



/*
YAZI FONTU B�Y�TME :
TEXT GRID VE RESULT GRID B�Y�TME : Tools>>Options>> 
"Fonts and Colors"'dan sorgu ekran�na yazd���m�z yaz�n�n boyutunu ayarlayabiliriz.
*/




/*
SE��M RENG� DE���T�RME : 
TEXT GRID VE RESULT GRID B�Y�TME : Tools>>Options>> 
"Fonts and Colors" >> "Selected Text"
*/


/*
LINE NUMBER RENG�N� DE���T�RME:
TEXT GRID VE RESULT GRID B�Y�TME : Tools>>Options>> 
"Fonts and Colors" >> LINE NUMBER
*/



/*
LINE NUMBER �IKMIYORSA:
TOOLS>> OPTIONS >>> TEXT EDITOR >>> TRANSACT SQL >>> GENERAL >>> DISPLAY >>> LINE NUMBERS
*/


/*
GRID RESULT FONTUNU B�Y�TME :
Tools>>Options>> "Fonts and Colors" >>SHOW SETTINGS FOR'da >>> "Gr�d Result " se�ilmeli.
Oradan istedi�imiz font b�y�kl���n� ayarlayabiliriz.

*/



/*
CTRL + G ile istedi�imiz sat�ra gidebiliriz...

*/



/* KONU 1:

Database'in �st�ndeki LAPTOP - AIRBRICT ba�land���m�z server.
Alttada databaseler var.
Databse'lerin alt�nda ise tablolar�m�z var.

*/


/* KONU 2:
Object Explorer server ve serverin i�indeki t�m objeleri g�rd���m�z yer.
Fi�ten yap�yoruz.
Server typata ba�ka yerlere ba�lanabiliriz.
Objecy exploererda di�er ba�l�klarda var. 
Bizim i�in �nemli olan databaseler k�sm�.
Object exp kapatt�m yanl��l�kla diyelim ki,viewden>>Object Explorerdan geri getiririz.
*/






/*
KONU 4:
SQL DOSYASI Y�KLEME
*/




/* KONU 5:

Database Diagram. Hata Varsa Adventureworks2019 sa�t�k,properties,files,Owner'a
sa diyece�iz.
sa yazmak yerine ...'ya t�klay�p, Browse'dan da sa'y� se�ebiliriz.

*/


/* KONU 6:

Herhangibir tablo se�ip.Sa�t�k Design'dan tablomuzdaki kolonlarla ilgili bilgileri g�rebiliriz.
Kolonla ilgili "Describtion"dan bilgileri alabiliriz.

*/


/* KONU 7:

Herhangibir tablo se�ip.Sa�t�k Design'dan "Select Top 1000 rows" ve "Edit Top 200 rows" se�enekleri...

*/



/* KONU 8:

Database'in i�inde >>> "Programmability" >>> "Functions" >>> System Functions

*/



/* KONU 9:

Ok tan farkl� bir database se�ebiliriz.
Sa� en altta hangi database e ba�l� oldu�umuz bilgisi var.
*/





/* KONU 10:

New Query

*/



/* KONU 11:
Exexuting query.
F5
Sorgu ilkba�ta servera gitti sonra database e gitti sonra execute etti.
Results ve messages.
*/




/* KONU 12:
Object Explorerdaki Pin tu�u.
*/




/* KONU 13:
Tabloyu sorguyla manuel yazma veya direk tutup �ekerek te tablo ad�n� veya s�tunlar�n� getirebiliriz.
*/




/* KONU 14:
SQL inttelisense. Tablo ad�n� yazarken yard�m ediyor.
*/



/* KONU 15 : 
�ema veya dbo ayr�m�...

�rne�in �rnek veritaban�nda Select * from Dept'te diyebiliriz veya Select * from dbo.Dept'te diyebiliriz.

�ema = Kategori gibi d���nebiliriz.

�ema'dan sonra gelen as�l tablo ad�m�zd�r.


*/



/* KONU 16 : 
Tablo sa� t�k >> Script Table As >> Create To....

*/



/* KONU 17:
2 query ayn� anda da �al��t�rabiliriz.
*/


/* KONU 18:
En altta sa�da row count var.
*/



/* KONU 19:
2 tane new query window a�abilirim.
2 sindede farkl� veritabnalar�na ba�lanabilirim.
*/





/* KONU 21:
Query ad�nda y�ld�z i�areti varsa, bu savelenmemi� demektir.
File--SAVE SAVE AS... Ayn� zamanda disk tu�u olarak normal save tu�umuz var.
*/



/* KONU 22:
Opening a File:
File-Open- File
*/




/* KONU 23:
�ki query window a��ksa yan yana koyabilriz.
*/



/* KONU 24:
Table sa� t�k--new table
*/



/* KONU 25:
Tablo sq�t�k--delete'ten tablomuzu silebiliriz.
*/



/* KONU 26:

Select * from dedik, tablolardaki kolonlar�da ta��yabiliyoruz.

*/




/* KONU 28:

Execute �n yan�nda execution planlar var.hem actual hemde estimated.

*/


/* KONU 29:
Edit--intellisense--refresh local cache

*/



/* KONU 30:
Parse query--tick--query hatal�ysa bize s�yl�yor.

SELECT * FORM DADHXDF

*/




/* KONU 31:
Result to text,result to grid

*/



/* KONU 32 :
QUERY window'un yerini ayarlama...

*/




/* KONU 33:


EXCELDEN VER� ALMA:
Excel dosyam�z� koyabilece�imiz �rnek bir veritaban� yaratal�m. Ve bu veritaban�n ad� "EXCEL" olsun.

Veritaban�na sa� t�k >> Tasks >> Import Data >>
Ad�mlar :
1: Veri Kayna�� olarak Excel se�iyoruz.
2: Browsedan excel dosyam�z� se�iyoruz.
3: Bu ad�mda bize hata verir.
4 : Hatay� bertaraf edebilmek i�in,

exceli 97-2003 workbook olarak kaydetmemiz laz�m.

sonra database sa�t�k--tasks--
import--devam--Destination olarak :SQL Server Natrive Client se�ece�iz.
Database olarakta istedi�imiz bir veri taban�n� se�ece�iz.Biz "Excel"i se�ece�iz
dbo.sheet1-- burada sheet1 i de�i�tirip excel tablosuna isim verebiliriz.
Edit mappings k�sm�ndan ise veri tiplerini ayarlayabiliriz.

*/

SELECT * FROM HumanResources.Department


/* KONU 34: SQL TO EXCEL

EXCEL 1.YOL ile kopyalama.Direk tabloyu se�ip ve copy with headers diyerek tabloyu excelimize alabiliriz.

*/


SELECT * FROM HumanResources.Department


/* KONU 35: SQL TO EXCEL : Tabloyu oldu�u gibi almak istiyoruz.


EXCEL 2.YOL ile kopyalama : tasks-export

SQL'deki tabloyu oldu�u gibi Excel'e atmak istiyoruz.

Ad�mlar :
1 : SQL tablosunun bulundu�u veritaban� sa� t�k >> Tasks >>> Export Data
2 : Data Source : SQL Native Client
3 : Kay�t yapaca��m�z excel'in gene 97-2003 olmas� laz�m
4 : �stedi�imiz tabloyu se�iyoruz.

*/




/* KONU 36:
QUERY NASIL EXPORT ED�L�R?
Sorguyu kopyala.
gene excel 97-2003 olmas� laz�m.
data source : sql serve native client.
Bu sefer write a querry to specify the data k�sm�n� se�iyoruz
ve sorguyu kopyala yap��t�r.parse
excel sheetine name verebiliriz.Query yazan yere.

*/


/* KONU 37:
Bo�ta sa�t�k--�nsert snippet,
bize kod �ablonlar�n� getiriyor.

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
Sp Help ne yap�yor?
Tabloyla ilgili t�m bilgileri veiroyr.
Sadece tabloyu higlight edip ve alt f1 e basarakda yapabiliriz.
Veya sp_help Person.Person da ayn� �eyi yap�yor.
sp_help 'Person.Person'
*/
SELECT * FROM Person.Person

sp_help 'Person.Person'



/* KONU 42:
Alt tu�una basarak dikey olarak tabo adlar�n� de�i�tirebiliriz.


SELECT
A.KOLON
B.KOLON
C.KOLON
FROM

*/


/* KONU 43:

YARDIM : f1
�rne�in case statement�n nas�l yaz�ld���n� unuttuk.
Case dedikten sonra higlight edip F1 e basabiliriz.
*/



/* KONU 44:
View---Object explorer--Object exp.details var.
Mesela Adworks databaseinde tables'a t�klad�m.tablo detaylar�n� g�rebiliyoruz.
Mesela bo� bi yerde sa�t�k yap�p row count diyebiliriz.
*/




/* KONU 20:
--�ok �nemmli de�il...
View sa�t�k.Script view as -- alter

*/



/* KONU 27:
--�ok �enmli de�il
Script stored pro: sa�t�k--modfiy veya
script stor proc.alter to dersem bana gene ayn�s�n� getirir.

*/


/* KONU 38:
SQL SERVER PROF�LER:
--�ok �enmli de�il
D�nen SQL sorgular�n� g�rebiliriz.
Tools -- sql profiler--new trace- server a ba�lan--
*/


-- ### SSMS ARAY�Z� TANIYALIM - UYGULAMA DERS� - B�T�� ###

