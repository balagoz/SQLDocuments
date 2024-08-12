----### CONSTRAINTS #### ----









------#### CONSTRAINTS GENEL ##### -----------------
/*

Tablo vey a tablodaki s�tunlar i�in yarat�lm�� kurallard�r.
CREATE TABLE ifadesi ile veya tablo yarat�ld�ktan sonra ALTER TABLE ifadesi ile yarat�labilirler.
Kolona girilecek verileri e�er ihtiyac�m�z varsa k�s�tlamak i�in kullan�l�r.

K�s�tlar tablo baz�nda olabilece�i gibi, kolon baz�nda da olabilir.
Tablo i�in yarat�lan k�s�tlar t�m tablo i�in ge�erli olurken, kolon i�in yarat�lan k�s�tlar sadece kolon i�in ge�erlidir.



---Her bir kolonun bir data type '� vard�r.Ancak kolonlar�n birden fazla kolon constrainti olacabilir.
--�rne�in NOT NULL ve UNIQUE G�B�.


Syntax:
CREATE TABLE table_name
(
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
);



--

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified.
IDENTITY -

*/


----- #### PRIMARY KEY BA�LANGI� #### -----

/*
PK, veritaban�m�zdaki data entegrasyonunun d�zg�n �al��mas�n� sa�lar.
PK se�ilen s�tun veya s�tunlardaki de�erler null olamazlar ve tekrar edemezler.
Yani �oklayan verileri biz PK'da g�remeyiz.
Tabloda sadece bir PK anahtar� vard�r ancak PK'n�n i�erisinde birden fazla kolon bulunabilir.
PK Anahtar�nda birden fazla s�tun kullan��m��sa bu t�r PK'lara composite primary key denir.
S�tundaki de�erlerin tekil - benzersiz yani unique olmas� sayesinde SQL verilere daha �abuk ula��r.

E�er PK anahtar�nda sadece bir kolon varsa tablo yarat�rken kolon ad�ndan sonra PRIMARY key kullanarak PK yaratabiliriz.

SQL Server,t�m PK kolonlar� i�in NOT NULL k�s�t�n� verir.
Ama biz gene de belirtelim.

Ancak PK'de birden fazla kolon varsa,o zaman PK'y� tablo constraint'i olarak belirtmemiz gerekmektedir.
Tek s�tun olsada olmasa da PK'y� tablo constraint'i olarak tan�mlayabiliriz.

PK'y� tablo constraint'i olarak tan�mlaman�n avantaj� constraint ismini de ayn� anda verebiliyor olmam�zd�r.
Yoksa tek kolonlu PK'de tablo yarat�rken kolonun yan�nda PRIMARY KEY yazmas� ile ilgili tek kolonun tablo constraint'i
olarak yarat�lmas�n�n anlamsal olarak bir fark� yoktur.


PK a�a��daki gibi de olabilir.
/*
PRIMARY KEY(kolon1,kolon2)

*/




SYNTAX:
The following SQL creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:


CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);


PK K�s�t�n� birden fazla kolon i�in tan�mlamam�z gerekirse, tablo constraint'i olarak tan�mlayaca��z.


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)-- BU TEK kolonluda olabilir.
);


Note: Yukar�daki �rnekte, tek bir PK vard�r. O da,(PK_Person).
Ancak, PK iki kolondan olu�ur.(ID + LastName)




�RNEK :

CREATE TABLE sales.activities (
    activity_id INT PRIMARY KEY IDENTITY,
    activity_name VARCHAR (255) NOT NULL,
    activity_date DATE NOT NULL
);


--Veya : 2 kolonlu bir PK yaratacaksak,Tablo k�s�t� olarak tan�mlamam�z laz�m.



CREATE TABLE table_name (
    pk_column_1 data_type,
    pk_column_2 data type,
    ...
    PRIMARY KEY (pk_column_1, pk_column_2)
);


�RNEK:
CREATE TABLE sales.participants(
    activity_id int,
    customer_id int,
    PRIMARY KEY(activity_id, customer_id)
);

Yukar�daki �rnekte,activity_id kolonu veya customer_id kolonu kendi i�inde �oklayablir ancak
her ikisinin kombinasyonu tekil olmal�d�r.




Pk anahtar� yarat�ld��� anda SQL otomatik olarak NOT NULL k�s�t�n� kolona atar.
��nk� PK'lar null olamazlar.
Ayn� zamanda PK yarat�ld��� anda,unique clustered index yarat�l�r.




�rne�in,activity_id ve customer_id kolonlar�n� PK yapt�k.
Bu durumda bu iki kolonun komnbinasyonu unique olmal�d�r.
Tek tek iki kolondan bir tekrarlayan de�er alabilir.

PRIMARY KEY(activity_id, customer_id) 





SQL PRIMARY KEY on ALTER TABLE:


Normalde PK'lar tablo yarat�m a�amas�nda olu�turulur.
Ancak bazen,tablo yarat�rken PK yaratmam�� olabiliriz.
Bu durmda ALTER ile Tablomuza PK atayabiliriz.
ALTER ile PK atamas� yaparken dikkatli olmam�z gereklidir.E�er tablomuzda data varsa,
PK atayaca��m�z kolondaki de�erlerin unique olmas� gereklidir.
Ayn� zamanda ALTER ile PK atamas� yap�l�rken tablo yarat�m a�amas�nda tablodaki ilgili
kolon veya kolonlar�n NOT null k�s�t� almas� gerekmektedir.


ALTER TABLE Persons
ADD PRIMARY KEY (ID);

veya

To allow naming of a PRIMARY KEY constraint, 
and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);--TEK kolonluda olabilir.



�RNEK :
Typically, a table always has a primary key defined at the 
time of creation. However, sometimes, an existing table may not have a primary key defined. 
In this case, you can add a primary key to the table by using the ALTER TABLE statement. 
Consider the following example:

The following statement creates a table without a primary key:
CREATE TABLE sales.events(
    event_id INT NOT NULL,
    event_name VARCHAR(255),
    start_date DATE NOT NULL,
    duration DEC(5,2)
);

To make the event_id column as the primary key, you use the following ALTER TABLE statement:
ALTER TABLE sales.events 
ADD PRIMARY KEY(event_id);

Note that if the sales.events table already has data, before promoting the event_id column as the primary key,
you must ensure that the values in the event_id are unique.

E�er 

Note: If you use ALTER TABLE to add a primary key, the primary key column(s) 
must have been declared to not contain NULL values (when the table was first created).

DROP a PRIMARY KEY Constraint:

ALTER TABLE Persons
DROP CONSTRAINT PK_Person;



Disable Primary Key:
ALTER INDEX constraint_name ON table_name
DISABLE;

�RNEK:
ALTER INDEX employees_pk ON employees
DISABLE;

Enable Primary Key
You can enable a primary key using the ALTER INDEX statement in SQL Server (Transact-SQL).

ALTER INDEX constraint_name ON table_name
REBUILD;

ALTER INDEX employees_pk ON employees
REBUILD;



*/





----- #### PRIMARY KEY B�T�� #### -----




---- #### SQL FOREIGN KEY Constraint BA�LANGI� ####----

/*
Tablolar�m�z aras�ndaki linki korunmak ve veri b�t�nl���n sa�lamak i�in FK olu�turulmas� gereklidir.
�li�kisel ver taban� tasar�m�nda ilk �nce yap�lan �ey, tablolar� ve tablolar�n aras�ndaki ili�kileri
belirlemektir.
�rne�in tekil bir �ekilde Y�netmenlerin ID'lerinin ve Ad Soyad bilgilerinin yer ald��� bir tablomuz olsun.
Bu tabloda Y�netmen ID kolonu PK olsun.
Bir de Y�netmenlerin filmlerinin oldu�u ayr� bir tablomuz olsun.
Bu tablomuzda ise FilmID,Y�netmenID  ve Film Ad� bilgileri yer als�n.
2.olu�turdu�umuz tablodaki Y�netmenID kolonumuz asl�nda verilerini ilk tablodaki Y�netmenlerin ID'lerinin
oldu�u kolondan almaktad�r.
Dolay�syla biz 2 tabloda ilk tabloda olmayan bir Y�netmen ID bilgisi giremeyiz.
B�yle bir durumda veri b�t�nl���m�z bozulmu� olur.Bunun olmamas� i�in ilgili kolona FK atamas� yapmak zorunday�z.
Yani FK'lar asl�nda ba�ka tablolar�n PK'lar�d�r diyebiliriz.
Di�er bir deyi�le, FK s�tunu ba�ka bir tablonun PK alan�n� referans alarak olu�turulmu�lard�r.Dolay�s�yla,
FK'lar PK'y� referans alarak olu�turuldu�u i�in PK d���ndaki bir de�erin FK kolonunda olmas� veri 
b�t�nl���m�z� zedeleyecektir.
Bunu �nlemek i�in ,ilgili tablolar aras�ndaki ili�kiyi belirten FK tan�mlamas�n� yapmak zorunday�z.

PK ve FK ili�kisinin oldu�u tablolarda PK kolonun bulundu�a tabloya PK tablosu veya Parent Table
FK kolonun bulundu�u tabloya ise FK tablosu veya child table'da denmektedir.


The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.

A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

The table with the foreign key is called the child table, 
and the table with the primary key is called the referenced or parent table.

Persons Table
PersonID	LastName	FirstName	Age
1	        Hansen		Ola			30
2	        Svendson	Tove		23
3	        Pettersen	Kari		20


Orders Table

OrderID	OrderNumber	PersonID
1			77895	3
2			44678	3
3			22456	2
4			24562	1

Notice that the "PersonID" column in the "Orders" table points to the "PersonID" column in the "Persons" table.

The "PersonID" column in the "Persons" table is the PRIMARY KEY in the "Persons" table.

The "PersonID" column in the "Orders" table is a FOREIGN KEY in the "Orders" table.

The FOREIGN KEY constraint prevents invalid data from being inserted into the foreign key column, 
because it has to be one of the values contained in the parent table.

SQL FOREIGN KEY on CREATE TABLE:

CREATE TABLE Orders (
    OrderID int NOT NULL PRIMARY KEY,
    OrderNumber int NOT NULL,
    PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

To allow naming of a FOREIGN KEY constraint, and for defining 
a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

SQL FOREIGN KEY on ALTER TABLE:

To create a FOREIGN KEY constraint 
on the "PersonID" column when the "Orders" table is already created, use the following SQL:

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);


To allow naming of a FOREIGN KEY constraint, and for defining 
a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE child_table
ADD CONSTRAINT fk_name
    FOREIGN KEY (child_col1, child_col2, ... child_col_n)
    REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n);


ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);


DROP a FOREIGN KEY Constraint

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

ALTER TABLE Orders
DROP CONSTRAINT FK_ConstraintAd�;

�RNEK:

CREATE TABLE procurement.vendor_groups (
    group_id INT IDENTITY PRIMARY KEY,
    group_name VARCHAR (100) NOT NULL
);

CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT NOT NULL,
);

Each vendor belongs to a vendor group and each vendor group may have zero or more vendors. The relationship between the vendor_groups and vendors tables is one-to-many.

For each row in the  vendors table, you can always find a corresponding row in the vendor_groups table.

However, with the current tables setup, you can insert a row into the  vendors table without a corresponding row in the vendor_groups table. Similarly, you can also delete a row in the vendor_groups table without updating or deleting the corresponding rows in the  vendors table that results in orphaned rows in the  vendors table.

To enforce the link between data in the vendor_groups and vendors tables, you need to establish a foreign key in the vendors table.

A foreign key is a column or a group of columns in one table that uniquely identifies a row of another table (or the same table in case of self-reference).

To create a foreign key, you use the FOREIGN KEY constraint.

The following statements drop the  vendors table and recreate it with a FOREIGN KEY constraint:

DROP TABLE vendors;

CREATE TABLE procurement.vendors (
        vendor_id INT IDENTITY PRIMARY KEY,
        vendor_name VARCHAR(100) NOT NULL,
        group_id INT NOT NULL,
        CONSTRAINT fk_group FOREIGN KEY (group_id) 
        REFERENCES procurement.vendor_groups(group_id)
);

The vendor_groups table now is called the parent table that is the table to which the foreign key constraint references. 
The vendors table is called the child table that is the table to which the foreign key constraint is applied.

In the statement above, the following clause creates a FOREIGN KEY constraint named fk_group that links the group_id in the  vendors table to the group_id in the vendor_groups table:


SQL Server FOREIGN KEY constraint syntax:

CONSTRAINT fk_constraint_name 
FOREIGN KEY (column_1, column2,...)
REFERENCES parent_table_name(column1,column2,..)

Referential actions:

The foreign key constraint ensures referential integrity. 
It means that you can only insert a row into the child table if there is a corresponding row in the parent table.

Besides, the foreign key constraint allows you to define the referential actions 
when the row in the parent table is updated or deleted as follows:

FK K�s�t� i�erisinde, PK kolonu i�erisinde bir veri silinirse veya update olursa hangi referansal i�lemleri
yapabilece�imizi belirleyebiliriz.
Bu i�lemlerden en s�kl�kla kullan�lan� CASCADE i�lemidir.

FOREIGN KEY (foreign_key_columns)
    REFERENCES parent_table(parent_key_columns)
    ON UPDATE action 
    ON DELETE action;

	The ON UPDATE and ON DELETE specify which action will execute when a row in the parent table is updated and deleted. 
	The following are permitted actions : NO ACTION, CASCADE, SET NULL, and SET DEFAULT

	Delete actions of rows in the parent table
If you delete one or more rows in the parent table, you can set one of the following actions:

ON DELETE NO ACTION: SQL Server raises an error and rolls back the delete action on the row in the parent table.
ON DELETE CASCADE: SQL Server deletes the rows in the child table that is corresponding to the row deleted from the parent table.
ON DELETE SET NULL: SQL Server sets the rows in the child table to NULL if the corresponding rows in the parent table are deleted. 
To execute this action, the foreign key columns must be nullable.
ON DELETE SET DEFAULT SQL Server sets the rows in the child table to their default values 
if the corresponding rows in the parent table are deleted. 
To execute this action, the foreign key columns must have default definitions. 
Note that a nullable column has a default value of NULL if no default value specified.
*/




---- ### SQL NOT NULL Constraint #### ------
/*

NOT NULL k�s�t her zaman kolonun yan�nda kolon constainti  olarak kullan�l�r.
E�er NOT NULL diye belirtmezsek SQL otomatik olarak kolona NULL de�erlerin kabul edilmesini sa�lar.
�rne�in a�a��daki tabloda Telefon kolonu null de�er kabul eder.
NOT NULL k�s�t� ilgili kolona null de�er kabul edilmemesini sa�lar.
Bu demek oluyor ki ilgili kolonda her zaman bir veri olmak zorundad�r.

CREATE TABLE veya ALTER  ifadesi ile NOT NULL constraint ekleyebiliriz.

A�a��daki �rnekte ID,Soyad,Ad kolonlar� null de�er kabul etmezler.


CREATE TABLE Ki�iler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255) NOT NULL,
    Ya� int
);



CREATE TABLE hr.persons(
    kisi_id INT IDENTITY PRIMARY KEY,
    Ad VARCHAR(255) NOT NULL,
    Soyad VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    Telefon VARCHAR(20)
);

Note that the NOT NULL constraints are always written as column constraints.
By default, if you don�t specify the NOT NULL constraint, 
SQL Server will allow the column to accepts NULL. In this example, the phone column can accept NULL.
CREATE TABLE hr.persons(
    person_id INT IDENTITY PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20)
);



By default, a column can hold NULL values.

The NOT NULL constraint enforces a column to NOT accept NULL values.

This enforces a field to always contain a value, 
which means that you cannot insert a new record, or update a record without adding a value to this field.

SQL NOT NULL on CREATE TABLE:
The following SQL ensures that the "ID", "LastName", and "FirstName" 
columns will NOT accept NULL values when the "Persons" table is created:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

SQL NOT NULL on ALTER TABLE
To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:
ALTER TABLE Persons
MODIFY Age int NOT NULL;

Add NOT NULL constraint to an existing column:
To add the NOT NULL constraint to an existing column, you follow these steps:

First, update the table so there is no NULL in the column:

UPDATE table_name
SET column_name = <value>
WHERE column_name IS NULL;


Second, alter the table to change the property of the column:
ALTER TABLE table_name
ALTER COLUMN column_name data_type NOT NULL;

Removing NOT NULL constraint:
To remove the NOT NULL constraint from a column, you use the ALTER TABLE ALTER COLUMN statement as follows:

ALTER TABLE TabloAd�
ALTER COLUMN KolonAd� data_type NULL;

�RNEK:
For example, to remove the NOT NULL constraint from the phone column, you use the following statement:

�RNEK:
ALTER TABLE hr.pesons
ALTER COLUMN phone VARCHAR(20) NULL;



*/




--- ### SQL UNIQUE Constraint ### ----
/*

The UNIQUE constraint ensures that all values in a column are different.

Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.

A PRIMARY KEY constraint automatically has a UNIQUE constraint.

However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

UNIQUE constraint vs. PRIMARY KEY constraint

Although both UNIQUE and PRIMARY KEY constraints enforce the uniqueness of data,
you should use the UNIQUE constraint instead of PRIMARY KEY constraint 
when you want to enforce the uniqueness of a column, or a group of columns, that are not the primary key columns.

Different from PRIMARY KEY constraints, UNIQUE constraints allow NULL. 
Moreover, UNIQUE constraints treat the NULL as a regular value, therefore, it only allows one NULL per column.

SQL UNIQUE Constraint on CREATE TABLE:

The following SQL creates a UNIQUE constraint on the "ID" column when the "Persons" table is created:

CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);


SQL UNIQUE Constraint on ALTER TABLE:

To create a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL:

--1.YOL :
ALTER TABLE Persons
ADD UNIQUE (ID);


To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

--2.YOL :
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

DROP a UNIQUE Constraint:
To drop a UNIQUE constraint, use the following SQL

ALTER TABLE Persons
DROP CONSTRAINT UC_Person;




*/


--- ### SQL CHECK Constraint ### ----
/*

CHECK Constraint ile kolonlara girilecek de�erleri k�s�tlayabiliriz.
CREATE TABLE veya ALTER ifadesi ile yarat�labilir.

A�a��dkai tabloda ya� kolonunu k�s�tlad�k �rne�in.

CREATE TABLE Ki�iler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Ya� int CHECK (Age>=18)
);

--Birden Fazla Kolon i�inde verebiliriz :

CREATE TABLE Ki�iler1 (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Ya� int,
    �ehir varchar(255),
    CONSTRAINT CHK_Person CHECK (Ya�>=18 AND �ehir='�zmir')
);

--Tablo yarat�rken yaratmad�ysak, ALTER ile daha sonra da yaratabiliriz.
--1.yol:
ALTER TABLE Ki�iler
ADD CHECK (Age>=18);

--2.Yol:
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Ya�>=18 AND �ehir='Sandnes');



The CHECK constraint is used to limit the value range that can be placed in a column.

If you define a CHECK constraint on a column it will allow only certain values for this column.

If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.

SQL CHECK on CREATE TABLE:
The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. 
The CHECK constraint ensures that the age of a person must be 18, or older:


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18)
);

To allow naming of a CHECK constraint, 
and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

SQL CHECK on ALTER TABLE:
To create a CHECK constraint on the "Age" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD CHECK (Age>=18);

To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:


ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Ya�>=18 AND �ehir='Sandnes');

DROP a CHECK Constraint:

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;





*/


--- ### SQL DEFAULT Constraint ### ---
/*
Kolon i�in default bir de�er belirlememizi sa�lar.
E�er kolona herhangi bir veri insert edilmezse,default olarak verdi�imiz de�er insert edilir.
CREATE TABLE veya ALTER TABLE ile yarat�labilinir.
�rne�in;A�a��da yer alan �ehir kolonuna veri girilmezse otomatik olarak �zmir yazacak ilgili sat�rda

CREATE TABLE Ki�iler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    �sim varchar(255),
    Ya� int,
    �ehir varchar(255) DEFAULT 'Sandnes'
);


ALTER TABLE Ki�iler
ADD CONSTRAINT df_�ehir
DEFAULT '�zmir' FOR �ehir;

ALTER TABLE Ki�iler
ALTER COLUMN �ehir DROP DEFAULT;

*/

/*


SQL DEFAULT Constraint
The DEFAULT constraint is used to set a default value for a column.

The default value will be added to all new records, if no other value is specified.

SQL DEFAULT on CREATE TABLE:

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE():

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

SQL DEFAULT on ALTER TABLE:
To create a DEFAULT constraint on the "City" column when the table is already created, use the following SQL:
ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Sandnes' FOR City;

DROP a DEFAULT Constraint
To drop a DEFAULT constraint, use the following SQL:
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;


*/


--- ### AUTO INCREMENT Field ### ---

/*

IDENTITY keyword'� sayesinde istenilen kolonla ilgili, kolona de�er girmesek bile
kolonla ilgili otomatik artan de�erle veri girilmesini sa�layabiliriz.
�rne�in,a�a��daki tabloda, ilgili kolona veri girmesek bile,SQL bizim i�in 1'den ba�lay�p artan de�erde
say�lar �retip ilgili s�tuna veri olarak girecektir.
Biz bu k�k de�erini yani ilk ba�ta �retilen 1 rakam�n� ve artan de�eri yani gene 1'i de�i�tirebiliriz.

CREATE TABLE Ki�iler (
    KisiID int IDENTITY(1,1) PRIMARY KEY,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Ya� int
);


Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

CREATE TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.

In the example above, the starting value for IDENTITY is 1, and it will increment by 1 for each new record.

To insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column (a unique value will be added automatically):


INSERT INTO Persons (FirstName,LastName)
VALUES ('Lars','Monsen');


*/








------------------PK Yaratma Yollar� Ba�lang��------------------------------------------------
-- �rnek bir database yaratal�m:
CREATE DATABASE Deneme;
USE DENEME


---1.yol: Kolon Constraint ile Yaratma.
CREATE TABLE Kisiler 
(
    ID int NOT NULL PRIMARY KEY,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int
);

--Hata Verdi.��nk� iki kez ayn� vermeye �al��t�m.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ABC','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);

--Hata Vermedi.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(2,'ABC','MURAT',37),
(3,'DEF','FATMA',38),
(4,'XYZ','CEM',39);

SELECT * FROM Kisiler

TRUNCATE TABLE Kisiler


--Hata Verdi,NULL de�erden dolay�.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(NULL,'ABC','MURAT',37),
(3,'DEF','FATMA',38),
(4,'XYZ','CEM',39);


---2.yol:Tablo Constraint yolu ile yaratma
.
--�lk ba�ta drop ediyoruz PK'y�.
ALTER TABLE Kisiler
DROP CONSTRAINT PK__Kisiler__3214EC27C70164F8;


--Art�k tekrarlayan veri de girsem hata vermez ��nk� PK k�s�t�n� sildim.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ABC','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);

SELECT * FROM Kisiler
TRUNCATE TABLE Kisiler


--Tabloyu Drop edelim.

DROP TABLE Kisiler

--Yeni tablo olu�turduk.
CREATE TABLE Kisiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int,
    CONSTRAINT PK_Kisiler_ID PRIMARY KEY (ID)-- Buras� tek kolonluda olabilir, g�r�ld��� gibi.
);


--Hata Verdi.��nk� iki kez ayn� vermeye �al��t�m.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ABC','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);



---3.yol:
--Tabloyu Drop edelim.
DROP TABLE Kisiler

--Yeni tablo olu�turduk.
CREATE TABLE Kisiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int,
    CONSTRAINT PK_Kisiler_ID_Soyad PRIMARY KEY (ID,Soyad)-- Birden Fazla Kolon Var Burada.
);


SELECT * FROM Kisiler

--Hata Vermez.��nk� 1-OKAY ile  1 - ASLAN farkl� ki�ilerdir.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ASLAN','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);

TRUNCATE TABLE Kisiler

SELECT * FROM Kisiler

--Hata Verdi. ��nk� 1-OKAY'� 2 kez girmeye �al��t�k.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'OKAY','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);



--4.Yol : 

--Tablo Constrainti olarak Yaratma:
--Tabloyu Drop edelim.
DROP TABLE Kisiler

CREATE TABLE Kisiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int,
    PRIMARY KEY(ID,Soyad)
);

--Hata Verdi. ��nk� 1-OKAY'� 2 kez girmeye �al��t�k.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'OKAY','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);



--ALTER TABLE �LE PK YARATMA:
--�nce Drop edelim.

ALTER TABLE Kisiler
DROP CONSTRAINT PK__Kisiler__B717BDD02A28612A

--1.YOL:
ALTER TABLE Kisiler
ADD PRIMARY KEY (ID);

--2.YOL:
ALTER TABLE Kisiler
ADD CONSTRAINT PK_Kisiler_Ad_Soyad PRIMARY KEY (ID,Soyad);

SELECT * FROM Kisiler

--PK olmas�n� istedi�imiz kolonda sa� t�k yap�p 'Set Primary Key' se�ene�,ni t�klayabiliriz.

------------------PK Yaratma Yollar� Biti�------------------------------------------------


-----------------FK OLU�TURMA BA�LANGI� --------------------------------------------------

--1.YOL:
--Mevutta Kisiler diye bir tablomuz var.
--�imdi ikinci bir tablo olu�turuyoruz.
--Bu tabloda ki�ilerin ID'leri,EVID'leri ve adresleri yer alacak
SELECT * FROM Kisiler
SELECT * FROM KisiEvAdedi


--Kisiler Tablosu :
CREATE TABLE Kisiler 
(
    ID int NOT NULL PRIMARY KEY,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int
);

--Kisiler Tablosuna Veri Girelim:

INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(2,'ABC','MURAT',37),
(3,'DEF','FATMA',38),
(4,'XYZ','CEM',39);

SELECT * FROM Kisiler

--Yeni Tablo olu�turoruz(FK tan�mlayaca��z)
--1.YOL:
CREATE TABLE KisiEvAdedi
(
	EVID INT NOT NULL PRIMARY KEY,
	ID INT,
	ADRES VARCHAR(50)
	CONSTRAINT FK_KisiEvAdedi_ID FOREIGN KEY (ID) REFERENCES Kisiler(ID)
);


--2.YOL:

CREATE TABLE KisiEvAdedi
(
	EVID INT NOT NULL PRIMARY KEY,
	ID INT FOREIGN KEY REFERENCES Kisiler(ID),
	ADRES VARCHAR(50)
);


SELECT * FROM KisiEvAdedi




--KisiEvAdedi Tablosuna Veri Girelim :
INSERT INTO KisiEvAdedi VALUES
(3,4,'DEF SOKAK');



--3:YOL : ALTER �LE:
DROP TABLE KisiEvAdedi

CREATE TABLE KisiEvAdedi
(
	EVID INT NOT NULL PRIMARY KEY,
	ID INT,
	ADRES VARCHAR(50) 
);


ALTER TABLE KisiEvAdedi
ADD FOREIGN KEY (ID) REFERENCES Kisiler(ID);

--2 No'lu s�tuna Pk tablosunda olmayan 5'i insert etmeye �al��t�k.
--�lgili ID no PK tablosunda olmad��� i�in bize hata verdi.
INSERT INTO KisiEvAdedi VALUES
(4,5,'DEF SOKAK');


--FK DROP :
ALTER TABLE KisiEvAdedi
DROP CONSTRAINT FK__KisiEvAdedi__ID__412EB0B6;

--Art�k FK'�m�z� drop etti�imiz i�in,PK kolonunda olmayan veri girebiliriz:
SELECT * FROM Kisiler
SELECT * FROM KisiEvAdedi

INSERT INTO KisiEvAdedi VALUES
(4,5,'DEF SOKAK');


--4:YOL : ALTER �LE:
ALTER TABLE child_table
ADD CONSTRAINT fk_name
    FOREIGN KEY (child_col1, child_col2, ... child_col_n)
    REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n);

--�RNEK:
--Burada da constraint ad� vererek olu�turuyoruz.
--�lk ba�ta tablomuzu truncate edelim.

TRUNCATE TABLE KisiEvAdedi

SELECT * FROM KisiEvAdedi
select * from Kisiler

ALTER TABLE KisiEvAdedi
ADD CONSTRAINT FK_ID
FOREIGN KEY (ID) REFERENCES Kisiler(ID);

--Gene Kisiler tablosuna olmayan bir ID girmeye �al��al�m. Gene hata al�r�z.

INSERT INTO KisiEvAdedi VALUES
(4,5,'DEF SOKAK');


--FK'y� drop edelim:
ALTER TABLE KisiEvAdedi
DROP CONSTRAINT FK_ID;



--�rne�in FK kolonunu a�a��daki gibi belirtirsek,
--DELETE i�leminde CASCADE'i uygulayacakt�r.
--ON DELETE CASCADE:

--ON DELETE CASCADE: SQL Server deletes the rows in the child table that is corresponding to the row deleted from the parent table.
--Syntax :
FOREIGN KEY (foreign_key_columns)
REFERENCES Kisiler(ID) ON DELETE CASCADE;

SELECT * FROM Kisiler

SELECT * FROM KisiEvAdedi
--KisiEvAdedi tablosuna Kisiler tablosunda olan bir �d verelim:
INSERT INTO KisiEvAdedi VALUES
(4,1,'DEF SOKAK');


--�RNEK :
ALTER TABLE KisiEvAdedi
ADD FOREIGN KEY (ID) REFERENCES Kisiler(ID) ON DELETE CASCADE;


--2.YOL :
--�nce constrainti drop edelim:
ALTER TABLE KisiEvAdedi
DROP CONSTRAINT FK__KisiEvAdedi__ID__440B1D61;


ALTER TABLE KisiEvAdedi
ADD CONSTRAINT FK_ID
FOREIGN KEY (ID) REFERENCES Kisiler(ID) ON DELETE CASCADE ;



--Biz e�er, Kisiler tablosundaki ID = 1'i silersek, ilgili ID FK tablosundan da silinecektir.
DELETE FROM Kisiler
WHERE ID =1


SELECT * FROM Kisiler

SELECT * FROM KisiEvAdedi

-----------------FK OLU�TURMA B�T�� --------------------------------------------------
