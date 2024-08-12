-- BÖLÜM ALIÞTIRMASI - SYNTAX VE EXECUTION ORDER--


--SYNTAX VE EXECUTION ORDER--
1. Getting Data (From, Join)
2. Row Filter (Where)
3. Grouping (Group by)
4. Group Filter (Having)
5. Return Expressions (Select)
6. Order & Paging (Order by & Limit / Offset)

--EXECUTION SIRALAMA :
1. FROM

2. ON

3. JOIN

4. WHERE

5. GROUP BY

6. CUBE | ROLLUP

7. HAVING

8. SELECT

9. DISTINCT

10. ORDER BY

11. TOP

---


FROM, including JOINs
WHERE
GROUP BY
HAVING
WINDOW functions
SELECT
DISTINCT
UNION
ORDER BY
LIMIT and OFFSET





--SYNTAX SIRASI :
SELECT
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
ORDER BY
-------------------








-- ÖRNEK
--TABLOLAR--------------------
SELECT * FROM Person.Address

SELECT * FROM Person.StateProvince
-----------------------------

SELECT AddressID,StateProvinceID,City FROM Person.Address
WHERE StateProvinceID =57
--FROM WHERE SELECT
--1.ADIM	:ÝLK BAÞTA FROM'dan tüm tabloyu getirdi.
--2.ADIM	:WHERE
--3.ADIM	:SELECT AddressID,StateProvinceID,City UYGULADI.



SELECT AddressID,StateProvinceID,City FROM Person.Address
WHERE StateProvinceID =57
ORDER BY AddressID;

--FROM WHERE SELECT ORDER BY
--1.ADIM	:ÝLK BAÞTA FROM'dan tüm tabloyu getirdi.
--2.ADIM	:WHERE
--3.ADIM	:SELECT AddressID,StateProvinceID,City UYGULADI
--4.ADIM	:ORDER BY


Select BusinessEntityID,Sum(SalesQuota) AS Kota from Sales.SalesPersonQuotaHistory
WHERE BusinessEntityID > 280
GROUP BY BusinessEntityID
ORDER BY Kota DESC

--FROM WHERE GROUP BY SELECT ORDER BY
--1.ADIM	:ÝLK BAÞTA FROM'dan tüm tabloyu getirdi.
--2.ADIM	:WHERE
--3.ADIM	:Grupladý
--4.ADIM	:SELECT
--5.ADIM	:ORDER BY



Select
BusinessEntityID,Sum(SalesQuota) AS Kotafrom Sales.SalesPersonQuotaHistory
WHERE BusinessEntityID > 280
GROUP BY BusinessEntityID
HAVING Sum(SalesQuota) >205000


--FROM WHERE GROUP BY HAVING SELECT
--1.ADIM	:ÝLK BAÞTA FROM'dan tüm tabloyu getirdi.
--2.ADIM	:WHERE
--3.ADIM	:Grupladý
--4.ADIM	:HAVING
--5.ADIM	:SELECT
----------------------------------------
--JOIN YAPARSAK NE OLUR?

SELECT * FROM Person.Address --19614 SATIR
SELECT * FROM Person.StateProvince --181 SATIR


--JOIN YAPARSAK NE OLUR?
SELECT
A.AddressID,
A.City,
A.StateProvinceID,
B.StateProvinceCode,
B.Name
FROM 
Person.Address A
LEFT JOIN
Person.StateProvince B
ON A.StateProvinceID=B.StateProvinceID
WHERE A.City = 'Ottawa';



--FROM - JOIN -  WHERE - GROUP BY - HAVING - SELECT

--1.ADIM	:ÝLK BAÞTA FROM'dan tüm tabloyu getirdi.
--2.ADIM	:JOIN
--3.ADIM	:WHERE
--4.ADIM	:SELECT


SELECT A.AddressID,A.City,A.StateProvinceID,B.StateProvinceCode 
FROM Person.Address A
LEFT JOIN Person.StateProvince B
ON A.StateProvinceID=B.StateProvinceID
WHERE A.City = 'Ottawa'










