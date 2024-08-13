
CREATE TABLE OfisCalısan
(
    CalısanID VARCHAR(50),
    Ad VARCHAR(50),
    Maas INT,
    DeptID VARCHAR(5),
    ManagerID VARCHAR(5)
);

CREATE TABLE "Departmanlar"
(
    DeptID VARCHAR(5),
    DepartmanAdı VARCHAR(20)
);

CREATE TABLE "Manager"
(
    ManagerID VARCHAR(5),
    ManagerAdı VARCHAR(30),
    DeptID VARCHAR(5)
);

CREATE TABLE "Projeler"
(
    ProjeID VARCHAR(30),
    ProjeAdı VARCHAR(30),
    ProjedeCalısanlar VARCHAR(50)
);

INSERT INTO OfisCalısan
VALUES
('C1','Onur',1500,'D1','M1'),
('C2','Fatma',1500,'D1','M1'),
('C3','Ayşe',5500,'D2','M2'),
('C4','Murat',2500,'D2','M2'),
('C5','Kemal',3500,'D10','M3'),
('C6','Mehmet',4500,'D10','M3');

INSERT INTO "Manager"
VALUES
('M1','Micheal','D3'),
('M2','James','D4'),
('M3','Fuat','D1'),
('M4','Cindy','D1');

INSERT INTO "Projeler"
VALUES
('P1','SQL Projesi','C1'),
('P1','Excel Projesi','C2'),
('P1','PowerPoint Projesi','M3'),
('P2','Python Projesi','C1'),
('P2','Power BI Projesi','M4');

INSERT INTO "Departmanlar" VALUES
('D1','IT'),
('D2','HR'),
('D3','Finance'),
('D4','DBA');

SELECT * FROM "ofiscalısan"
SELECT * FROM "Departmanlar"
SELECT * FROM "Projeler"
SELECT * FROM "Manager"

---------------------------------------

SELECT * FROM 
"ofiscalısan" x 
LEFT JOIN 
"Departmanlar" y 
ON x.DeptID = y.DeptID

---------------------------------------
--https://www.postgresqltutorial.com/postgresql-plpgsql/

--1.adım :
SELECT * FROM
OfisCalısan A 
LEFT JOIN 
"Departmanlar" B
ON A.deptid=B.deptid


--2.adım :
SELECT B.departmantadı as departmantadı,A.calısanid as sicil_no FROM
OfisCalısan A 
LEFT JOIN 
"Departmanlar" B
ON A.deptid=B.deptid


--3.adım :
SELECT departmanadı,COUNT(sicil_no) FROM
(SELECT B.departmanadı as departmanadı,A.calısanid as sicil_no FROM
OfisCalısan A 
LEFT JOIN 
"Departmanlar" B
ON A.deptid=B.deptid)AHMET

GROUP BY ROLLUP(departmantadı)

---------------------------------------

--1.yöntem :
SELECT x.Ad,y.departmanadı FROM
OfisCalısan x 
LEFT JOIN
"Departmanlar" y
--ON x.deptid = y.deptid
USING (deptid)

--2YÖNTEM :
SELECT x.Ad,y.departmanadı FROM
OfisCalısan x
NATURAL JOIN
"Departmanlar" y

SELECT x.ad,y.departmanadı FROM
OfisCalısan x
NATURAL LEFT JOIN
"Departmanlar" y


---------------------------------------

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    hire_date DATE
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (employee_id, name, department_id, hire_date) VALUES
(1, 'Ahmet', 10, '2020-01-15'),
(2, 'Ayşe', 20, '2019-05-23'),
(3, 'Mehmet', 10, '2018-07-12'),
(4, 'Fatma', 30, '2021-02-10');

INSERT INTO departments (department_id, department_name, manager_id) VALUES
(10, 'IT', 1),
(20, 'HR', 2),
(30, 'Finance', 4),
(40, 'Sales', 3);

SELECT * from employees E
SELECT * from departments D

---------------------------------------

SELECT E.employee_id, E.name, D.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id=D.department_id AND E.hire_date<'2020.01.01'

---------------------------------------

SELECT 
    CASE 
        WHEN Maas BETWEEN 0 AND 3000 THEN 'Düşük Maaş'
        WHEN Maas BETWEEN 3001 AND 5000 THEN 'Orta Maaş'
        WHEN Maas > 5000 THEN 'Yüksek Maaş'
    END AS MaasKategori,
    COUNT(*) AS KisiSayisi
FROM 
    "kurumsalcalısanlar"
GROUP BY 
    MaasKategori

---------------------------------------

CREATE TABLE Urunler
(
    ID SERIAL PRIMARY KEY,
    UrunAdi VARCHAR(40),
    Aciklama VARCHAR(40)
);

CREATE TABLE UrunlerSatis
(
    ID SERIAL PRIMARY KEY,
    UrunID INT REFERENCES Urunler(ID),
    BirimFiyat INT,
    SatilanAdet INT
);

INSERT INTO Urunler (UrunAdi, Aciklama) VALUES
('TV', '105 inc'),
('Telefon', 'Iphone'),
('Laptop', 'HP');

INSERT INTO UrunlerSatis VALUES
(1,3,400,5),
(2,2,500,5),
(3,3,600,5),
(4,3,200,5);

SELECT * FROM urunler
SELECT * FROM urunlersatis

---------------------------------------

SELECT 
    u.ID, 
    u.Aciklama
FROM 
    urunler u
LEFT JOIN 
    urunlersatis us 
ON 
    u.ID = us.UrunID
WHERE 
    us.ID IS NULL;


SELECT id, Aciklama FROM urunler WHERE ID NOT IN (SELECT UrunID FROM urunlersatis);

---------------------------------------

SELECT
ID,
(SELECT SUM(SatilanAdet) from UrunlerSatis WHERE UrunID = Urunler.ID ) AS ADET
from
Urunler






