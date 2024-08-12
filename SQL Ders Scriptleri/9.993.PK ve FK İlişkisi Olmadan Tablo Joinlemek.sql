

---PK VE FK ÝLÝÞKÝSÝ OLMADAN TABLO JOÝNLENEBÝLÝR MÝ?
--EVET.
--Veri tipleri match ettiði veya birbirlerinin yerine dönüþtürülebildiði sürece olur.


--ÖRNEK:
CREATE TABLE Dept
(
ID INT not null,
Ad varchar(10),
Lokasyon varchar(30)
);

INSERT INTO Dept VALUES
(1,'IT','Ýstanbul'),
(2,'IK','New York'),
(3,'Bordro','Sydney');


--ÖRNEK:
CREATE TABLE Emp
(
ID INT NOT NULL,
Ad VARCHAR(50),
Cinsiyet VARCHAR(1),
Maas INT,
DeptID INT
);

INSERT INTO Emp VALUES
(1,'Onur','E',10000,1),
(2,'Murat','E',20000,3),
(3,'Kemal','E',30000,1),
(4,'Mehmet','E',40000,2),
(5,'Aslý','K',50000,2),
(6,'Mert','E',60000,3),
(7,'Ýlknur','K',70000,1);


SELECT * FROM Emp
SELECT * FROM Dept


SELECT * FROM 
EMP
JOIN
Dept
ON EMP.DeptID = Dept.ID

---BAÞKA ÖRNEK---
CREATE TABLE T1
(
ID INT,
AD1 NVARCHAR(20)

);

CREATE TABLE T2
(
ID NVARCHAR,
AD2 NVARCHAR(20)

);

INSERT INTO T1 VALUES
(1,'ONUR')

INSERT INTO T2 VALUES
(1,'OKAY')

SELECT * FROM T1

SELECT * FROM T2

SELECT * FROM
T1
JOIN
T2
ON T1.ID=T2.ID;

--BURADA INT ÝLE NVARCHAR I JOIN YAPTI MESELA. AMA NVARCHAR DA BÝR METÝN GÝRSEK OLMAZDI.

--Peki bu iliþki gerekli deðilse biz neden PK VE FK'yý kullanalým ?
/*
PK kolonun unique olmasýný saðlar.
ID kolonu PK olmazsa ayný ID'yi birden fazla girebiliriz.
FK ise data entegrasyonun saðlar.
EMP tablosundaki DEPTID mesela,fk olmazsa bu kolona DepartmanT tablsounda olmayan bir ID girebiliriz.
Mesela emp tablosunda DEPTID'ye 100 girdim.Bunun Departmand Adý ne?
*

SELECT * FROM Emp
SELECT * FROM Dept


ALTER TABLE Dept
ADD PRIMARY KEY(ID)


ALTER TABLE Emp
ADD FOREIGN KEY(DeptID) REFERENCES Dept(ID)

INSERT INTO Emp VALUES (8,'Aslý','K',8000,99);--FK HATASI VERDÝ.

INSERT INTO Emp VALUES (8,'Aslý','K',8000,1);--FK HATA vermedi.