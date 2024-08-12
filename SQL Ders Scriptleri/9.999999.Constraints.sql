----### CONSTRAINTS #### ----









------#### CONSTRAINTS GENEL ##### -----------------
/*

Tablo vey a tablodaki sütunlar için yaratýlmýþ kurallardýr.
CREATE TABLE ifadesi ile veya tablo yaratýldýktan sonra ALTER TABLE ifadesi ile yaratýlabilirler.
Kolona girilecek verileri eðer ihtiyacýmýz varsa kýsýtlamak için kullanýlýr.

Kýsýtlar tablo bazýnda olabileceði gibi, kolon bazýnda da olabilir.
Tablo için yaratýlan kýsýtlar tüm tablo için geçerli olurken, kolon için yaratýlan kýsýtlar sadece kolon için geçerlidir.



---Her bir kolonun bir data type 'ý vardýr.Ancak kolonlarýn birden fazla kolon constrainti olacabilir.
--Örneðin NOT NULL ve UNIQUE GÝBÝ.


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


----- #### PRIMARY KEY BAÞLANGIÇ #### -----

/*
PK, veritabanýmýzdaki data entegrasyonunun düzgün çalýþmasýný saðlar.
PK seçilen sütun veya sütunlardaki deðerler null olamazlar ve tekrar edemezler.
Yani çoklayan verileri biz PK'da göremeyiz.
Tabloda sadece bir PK anahtarý vardýr ancak PK'nýn içerisinde birden fazla kolon bulunabilir.
PK Anahtarýnda birden fazla sütun kullanýþmýþsa bu tür PK'lara composite primary key denir.
Sütundaki deðerlerin tekil - benzersiz yani unique olmasý sayesinde SQL verilere daha çabuk ulaþýr.

Eðer PK anahtarýnda sadece bir kolon varsa tablo yaratýrken kolon adýndan sonra PRIMARY key kullanarak PK yaratabiliriz.

SQL Server,tüm PK kolonlarý için NOT NULL kýsýtýný verir.
Ama biz gene de belirtelim.

Ancak PK'de birden fazla kolon varsa,o zaman PK'yý tablo constraint'i olarak belirtmemiz gerekmektedir.
Tek sütun olsada olmasa da PK'yý tablo constraint'i olarak tanýmlayabiliriz.

PK'yý tablo constraint'i olarak tanýmlamanýn avantajý constraint ismini de ayný anda verebiliyor olmamýzdýr.
Yoksa tek kolonlu PK'de tablo yaratýrken kolonun yanýnda PRIMARY KEY yazmasý ile ilgili tek kolonun tablo constraint'i
olarak yaratýlmasýnýn anlamsal olarak bir farký yoktur.


PK aþaðýdaki gibi de olabilir.
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


PK Kýsýtýný birden fazla kolon için tanýmlamamýz gerekirse, tablo constraint'i olarak tanýmlayacaðýz.


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)-- BU TEK kolonluda olabilir.
);


Note: Yukarýdaki örnekte, tek bir PK vardýr. O da,(PK_Person).
Ancak, PK iki kolondan oluþur.(ID + LastName)




ÖRNEK :

CREATE TABLE sales.activities (
    activity_id INT PRIMARY KEY IDENTITY,
    activity_name VARCHAR (255) NOT NULL,
    activity_date DATE NOT NULL
);


--Veya : 2 kolonlu bir PK yaratacaksak,Tablo kýsýtý olarak tanýmlamamýz lazým.



CREATE TABLE table_name (
    pk_column_1 data_type,
    pk_column_2 data type,
    ...
    PRIMARY KEY (pk_column_1, pk_column_2)
);


ÖRNEK:
CREATE TABLE sales.participants(
    activity_id int,
    customer_id int,
    PRIMARY KEY(activity_id, customer_id)
);

Yukarýdaki örnekte,activity_id kolonu veya customer_id kolonu kendi içinde çoklayablir ancak
her ikisinin kombinasyonu tekil olmalýdýr.




Pk anahtarý yaratýldýðý anda SQL otomatik olarak NOT NULL kýsýtýný kolona atar.
Çünkü PK'lar null olamazlar.
Ayný zamanda PK yaratýldýðý anda,unique clustered index yaratýlýr.




Örneðin,activity_id ve customer_id kolonlarýný PK yaptýk.
Bu durumda bu iki kolonun komnbinasyonu unique olmalýdýr.
Tek tek iki kolondan bir tekrarlayan deðer alabilir.

PRIMARY KEY(activity_id, customer_id) 





SQL PRIMARY KEY on ALTER TABLE:


Normalde PK'lar tablo yaratým aþamasýnda oluþturulur.
Ancak bazen,tablo yaratýrken PK yaratmamýþ olabiliriz.
Bu durmda ALTER ile Tablomuza PK atayabiliriz.
ALTER ile PK atamasý yaparken dikkatli olmamýz gereklidir.Eðer tablomuzda data varsa,
PK atayacaðýmýz kolondaki deðerlerin unique olmasý gereklidir.
Ayný zamanda ALTER ile PK atamasý yapýlýrken tablo yaratým aþamasýnda tablodaki ilgili
kolon veya kolonlarýn NOT null kýsýtý almasý gerekmektedir.


ALTER TABLE Persons
ADD PRIMARY KEY (ID);

veya

To allow naming of a PRIMARY KEY constraint, 
and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);--TEK kolonluda olabilir.



ÖRNEK :
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

Eðer 

Note: If you use ALTER TABLE to add a primary key, the primary key column(s) 
must have been declared to not contain NULL values (when the table was first created).

DROP a PRIMARY KEY Constraint:

ALTER TABLE Persons
DROP CONSTRAINT PK_Person;



Disable Primary Key:
ALTER INDEX constraint_name ON table_name
DISABLE;

ÖRNEK:
ALTER INDEX employees_pk ON employees
DISABLE;

Enable Primary Key
You can enable a primary key using the ALTER INDEX statement in SQL Server (Transact-SQL).

ALTER INDEX constraint_name ON table_name
REBUILD;

ALTER INDEX employees_pk ON employees
REBUILD;



*/





----- #### PRIMARY KEY BÝTÝÞ #### -----




---- #### SQL FOREIGN KEY Constraint BAÞLANGIÇ ####----

/*
Tablolarýmýz arasýndaki linki korunmak ve veri bütünlüðün saðlamak için FK oluþturulmasý gereklidir.
Ýliþkisel ver tabaný tasarýmýnda ilk önce yapýlan þey, tablolarý ve tablolarýn arasýndaki iliþkileri
belirlemektir.
Örneðin tekil bir þekilde Yönetmenlerin ID'lerinin ve Ad Soyad bilgilerinin yer aldýðý bir tablomuz olsun.
Bu tabloda Yönetmen ID kolonu PK olsun.
Bir de Yönetmenlerin filmlerinin olduðu ayrý bir tablomuz olsun.
Bu tablomuzda ise FilmID,YönetmenID  ve Film Adý bilgileri yer alsýn.
2.oluþturduðumuz tablodaki YönetmenID kolonumuz aslýnda verilerini ilk tablodaki Yönetmenlerin ID'lerinin
olduðu kolondan almaktadýr.
Dolayýsyla biz 2 tabloda ilk tabloda olmayan bir Yönetmen ID bilgisi giremeyiz.
Böyle bir durumda veri bütünlüðümüz bozulmuþ olur.Bunun olmamasý için ilgili kolona FK atamasý yapmak zorundayýz.
Yani FK'lar aslýnda baþka tablolarýn PK'larýdýr diyebiliriz.
Diðer bir deyiþle, FK sütunu baþka bir tablonun PK alanýný referans alarak oluþturulmuþlardýr.Dolayýsýyla,
FK'lar PK'yý referans alarak oluþturulduðu için PK dýþýndaki bir deðerin FK kolonunda olmasý veri 
bütünlüðümüzü zedeleyecektir.
Bunu önlemek için ,ilgili tablolar arasýndaki iliþkiyi belirten FK tanýmlamasýný yapmak zorundayýz.

PK ve FK iliþkisinin olduðu tablolarda PK kolonun bulunduða tabloya PK tablosu veya Parent Table
FK kolonun bulunduðu tabloya ise FK tablosu veya child table'da denmektedir.


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
DROP CONSTRAINT FK_ConstraintAdý;

ÖRNEK:

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

FK Kýsýtý içerisinde, PK kolonu içerisinde bir veri silinirse veya update olursa hangi referansal iþlemleri
yapabileceðimizi belirleyebiliriz.
Bu iþlemlerden en sýklýkla kullanýlaný CASCADE iþlemidir.

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

NOT NULL kýsýt her zaman kolonun yanýnda kolon constainti  olarak kullanýlýr.
Eðer NOT NULL diye belirtmezsek SQL otomatik olarak kolona NULL deðerlerin kabul edilmesini saðlar.
Örneðin aþaðýdaki tabloda Telefon kolonu null deðer kabul eder.
NOT NULL kýsýtý ilgili kolona null deðer kabul edilmemesini saðlar.
Bu demek oluyor ki ilgili kolonda her zaman bir veri olmak zorundadýr.

CREATE TABLE veya ALTER  ifadesi ile NOT NULL constraint ekleyebiliriz.

Aþaðýdaki örnekte ID,Soyad,Ad kolonlarý null deðer kabul etmezler.


CREATE TABLE Kiþiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255) NOT NULL,
    Yaþ int
);



CREATE TABLE hr.persons(
    kisi_id INT IDENTITY PRIMARY KEY,
    Ad VARCHAR(255) NOT NULL,
    Soyad VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    Telefon VARCHAR(20)
);

Note that the NOT NULL constraints are always written as column constraints.
By default, if you don’t specify the NOT NULL constraint, 
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

ALTER TABLE TabloAdý
ALTER COLUMN KolonAdý data_type NULL;

ÖRNEK:
For example, to remove the NOT NULL constraint from the phone column, you use the following statement:

ÖRNEK:
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

CHECK Constraint ile kolonlara girilecek deðerleri kýsýtlayabiliriz.
CREATE TABLE veya ALTER ifadesi ile yaratýlabilir.

Aþaðýdkai tabloda yaþ kolonunu kýsýtladýk örneðin.

CREATE TABLE Kiþiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yaþ int CHECK (Age>=18)
);

--Birden Fazla Kolon içinde verebiliriz :

CREATE TABLE Kiþiler1 (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yaþ int,
    Þehir varchar(255),
    CONSTRAINT CHK_Person CHECK (Yaþ>=18 AND Þehir='Ýzmir')
);

--Tablo yaratýrken yaratmadýysak, ALTER ile daha sonra da yaratabiliriz.
--1.yol:
ALTER TABLE Kiþiler
ADD CHECK (Age>=18);

--2.Yol:
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Yaþ>=18 AND Þehir='Sandnes');



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
ADD CONSTRAINT CHK_PersonAge CHECK (Yaþ>=18 AND Þehir='Sandnes');

DROP a CHECK Constraint:

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;





*/


--- ### SQL DEFAULT Constraint ### ---
/*
Kolon için default bir deðer belirlememizi saðlar.
Eðer kolona herhangi bir veri insert edilmezse,default olarak verdiðimiz deðer insert edilir.
CREATE TABLE veya ALTER TABLE ile yaratýlabilinir.
Örneðin;Aþaðýda yer alan þehir kolonuna veri girilmezse otomatik olarak Ýzmir yazacak ilgili satýrda

CREATE TABLE Kiþiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ýsim varchar(255),
    Yaþ int,
    Þehir varchar(255) DEFAULT 'Sandnes'
);


ALTER TABLE Kiþiler
ADD CONSTRAINT df_Þehir
DEFAULT 'Ýzmir' FOR Þehir;

ALTER TABLE Kiþiler
ALTER COLUMN Þehir DROP DEFAULT;

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

IDENTITY keyword'ü sayesinde istenilen kolonla ilgili, kolona deðer girmesek bile
kolonla ilgili otomatik artan deðerle veri girilmesini saðlayabiliriz.
Örneðin,aþaðýdaki tabloda, ilgili kolona veri girmesek bile,SQL bizim için 1'den baþlayýp artan deðerde
sayýlar üretip ilgili sütuna veri olarak girecektir.
Biz bu kök deðerini yani ilk baþta üretilen 1 rakamýný ve artan deðeri yani gene 1'i deðiþtirebiliriz.

CREATE TABLE Kiþiler (
    KisiID int IDENTITY(1,1) PRIMARY KEY,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yaþ int
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








------------------PK Yaratma Yollarý Baþlangýç------------------------------------------------
-- Örnek bir database yaratalým:
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

--Hata Verdi.Çünkü iki kez ayný vermeye çalýþtým.
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


--Hata Verdi,NULL deðerden dolayý.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(NULL,'ABC','MURAT',37),
(3,'DEF','FATMA',38),
(4,'XYZ','CEM',39);


---2.yol:Tablo Constraint yolu ile yaratma
.
--Ýlk baþta drop ediyoruz PK'yý.
ALTER TABLE Kisiler
DROP CONSTRAINT PK__Kisiler__3214EC27C70164F8;


--Artýk tekrarlayan veri de girsem hata vermez çünkü PK kýsýtýný sildim.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ABC','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);

SELECT * FROM Kisiler
TRUNCATE TABLE Kisiler


--Tabloyu Drop edelim.

DROP TABLE Kisiler

--Yeni tablo oluþturduk.
CREATE TABLE Kisiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int,
    CONSTRAINT PK_Kisiler_ID PRIMARY KEY (ID)-- Burasý tek kolonluda olabilir, görüldüðü gibi.
);


--Hata Verdi.Çünkü iki kez ayný vermeye çalýþtým.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ABC','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);



---3.yol:
--Tabloyu Drop edelim.
DROP TABLE Kisiler

--Yeni tablo oluþturduk.
CREATE TABLE Kisiler (
    ID int NOT NULL,
    Soyad varchar(255) NOT NULL,
    Ad varchar(255),
    Yas int,
    CONSTRAINT PK_Kisiler_ID_Soyad PRIMARY KEY (ID,Soyad)-- Birden Fazla Kolon Var Burada.
);


SELECT * FROM Kisiler

--Hata Vermez.Çünkü 1-OKAY ile  1 - ASLAN farklý kiþilerdir.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'ASLAN','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);

TRUNCATE TABLE Kisiler

SELECT * FROM Kisiler

--Hata Verdi. Çünkü 1-OKAY'ý 2 kez girmeye çalýþtýk.
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

--Hata Verdi. Çünkü 1-OKAY'ý 2 kez girmeye çalýþtýk.
INSERT INTO Kisiler VALUES
(1,'OKAY','ONUR',36),
(1,'OKAY','MURAT',37),
(2,'DEF','FATMA',38),
(3,'XYZ','CEM',39);



--ALTER TABLE ÝLE PK YARATMA:
--Önce Drop edelim.

ALTER TABLE Kisiler
DROP CONSTRAINT PK__Kisiler__B717BDD02A28612A

--1.YOL:
ALTER TABLE Kisiler
ADD PRIMARY KEY (ID);

--2.YOL:
ALTER TABLE Kisiler
ADD CONSTRAINT PK_Kisiler_Ad_Soyad PRIMARY KEY (ID,Soyad);

SELECT * FROM Kisiler

--PK olmasýný istediðimiz kolonda sað týk yapýp 'Set Primary Key' seçeneü,ni týklayabiliriz.

------------------PK Yaratma Yollarý Bitiþ------------------------------------------------


-----------------FK OLUÞTURMA BAÞLANGIÇ --------------------------------------------------

--1.YOL:
--Mevutta Kisiler diye bir tablomuz var.
--Þimdi ikinci bir tablo oluþturuyoruz.
--Bu tabloda kiþilerin ID'leri,EVID'leri ve adresleri yer alacak
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

--Yeni Tablo oluþturoruz(FK tanýmlayacaðýz)
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



--3:YOL : ALTER ÝLE:
DROP TABLE KisiEvAdedi

CREATE TABLE KisiEvAdedi
(
	EVID INT NOT NULL PRIMARY KEY,
	ID INT,
	ADRES VARCHAR(50) 
);


ALTER TABLE KisiEvAdedi
ADD FOREIGN KEY (ID) REFERENCES Kisiler(ID);

--2 No'lu sütuna Pk tablosunda olmayan 5'i insert etmeye çalýþtýk.
--Ýlgili ID no PK tablosunda olmadýðý için bize hata verdi.
INSERT INTO KisiEvAdedi VALUES
(4,5,'DEF SOKAK');


--FK DROP :
ALTER TABLE KisiEvAdedi
DROP CONSTRAINT FK__KisiEvAdedi__ID__412EB0B6;

--Artýk FK'ýmýzý drop ettiðimiz için,PK kolonunda olmayan veri girebiliriz:
SELECT * FROM Kisiler
SELECT * FROM KisiEvAdedi

INSERT INTO KisiEvAdedi VALUES
(4,5,'DEF SOKAK');


--4:YOL : ALTER ÝLE:
ALTER TABLE child_table
ADD CONSTRAINT fk_name
    FOREIGN KEY (child_col1, child_col2, ... child_col_n)
    REFERENCES parent_table (parent_col1, parent_col2, ... parent_col_n);

--ÖRNEK:
--Burada da constraint adý vererek oluþturuyoruz.
--Ýlk baþta tablomuzu truncate edelim.

TRUNCATE TABLE KisiEvAdedi

SELECT * FROM KisiEvAdedi
select * from Kisiler

ALTER TABLE KisiEvAdedi
ADD CONSTRAINT FK_ID
FOREIGN KEY (ID) REFERENCES Kisiler(ID);

--Gene Kisiler tablosuna olmayan bir ID girmeye çalýþalým. Gene hata alýrýz.

INSERT INTO KisiEvAdedi VALUES
(4,5,'DEF SOKAK');


--FK'yý drop edelim:
ALTER TABLE KisiEvAdedi
DROP CONSTRAINT FK_ID;



--Örneðin FK kolonunu aþaðýdaki gibi belirtirsek,
--DELETE iþleminde CASCADE'i uygulayacaktýr.
--ON DELETE CASCADE:

--ON DELETE CASCADE: SQL Server deletes the rows in the child table that is corresponding to the row deleted from the parent table.
--Syntax :
FOREIGN KEY (foreign_key_columns)
REFERENCES Kisiler(ID) ON DELETE CASCADE;

SELECT * FROM Kisiler

SELECT * FROM KisiEvAdedi
--KisiEvAdedi tablosuna Kisiler tablosunda olan bir ýd verelim:
INSERT INTO KisiEvAdedi VALUES
(4,1,'DEF SOKAK');


--ÖRNEK :
ALTER TABLE KisiEvAdedi
ADD FOREIGN KEY (ID) REFERENCES Kisiler(ID) ON DELETE CASCADE;


--2.YOL :
--Önce constrainti drop edelim:
ALTER TABLE KisiEvAdedi
DROP CONSTRAINT FK__KisiEvAdedi__ID__440B1D61;


ALTER TABLE KisiEvAdedi
ADD CONSTRAINT FK_ID
FOREIGN KEY (ID) REFERENCES Kisiler(ID) ON DELETE CASCADE ;



--Biz eðer, Kisiler tablosundaki ID = 1'i silersek, ilgili ID FK tablosundan da silinecektir.
DELETE FROM Kisiler
WHERE ID =1


SELECT * FROM Kisiler

SELECT * FROM KisiEvAdedi

-----------------FK OLUÞTURMA BÝTÝÞ --------------------------------------------------
