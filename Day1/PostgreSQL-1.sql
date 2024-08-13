SELECT * FROM "kurumsalcalısanlar"

SELECT * , maas+maas*50/100 as yeni_maas from "kurumsalcalısanlar"

SELECT * , maas+maas*50/100 as yeni_maas FROM "kurumsalcalısanlar" WHERE maas+maas*0.50>10000

SELECT *, Ad || ' ' || maas AS "isim+maas" FROM "kurumsalcalısanlar"


--------------------------------------

SELECT * FROM INFORMATION_SCHEMA.COLUMNS

--------------------------------------

SELECT
dt AS DoğumTarihi,
dt AS "Doğum Tarihi",
--dt AS 'Doğum Tarihi',-- Çalışmaz,
--dt AS [Doğum Tarihi]--Çalışmaz,
dt AS Doğum_Tarihi
FROM KurumsalCalısanlar

---------------------------------------------

SELECT 
    *,
    format(maas,'N','TR-TR'), --NUMBER
    format(maas,'C','TR-TR'), --CURRENCY
    format(dt,'D','TR-TR'),
    format(dt,'dddd','TR-TR'),
    format(dt,'dddd','de-de'),
    format(dt,'MMMM','TR-TR'),
    format(dt,'dd//MM//yyyy'),
    format(Maas,'#,###.00')
    FROM kurumsalcalısanlar

----------------------------------------

 SELECT 
    Maas, 
    TO_CHAR(Maas, 'FM999,999,999.00') AS Ondalıklı,
    TO_CHAR(Maas, 'FM999,999,999') AS Ondalıksız
    FROM "kurumsalcalısanlar"
    ORDER BY MAAS DESC;

--------------------------------------


 SELECT Maas, TO_CHAR(Maas, 'FM999,999,999.00 ₺') AS TL_SEMBOLÜ
    FROM "kurumsalcalısanlar"
    ORDER BY Maas DESC;

------------------------------------


SELECT *, extract(year FROM dt),DATE_PART('year',dt)  FROM "kurumsalcalısanlar"
WHERE EXTRACT(YEAR FROM dt) < 1990;

--2.yöntem :
    
    SELECT * 
    FROM "kurumsalcalısanlar"
    WHERE DATE_PART('year', dt) < 1990;

-------------------------------------

--dt 1985 ile 1996 arasında olanlar
SELECT * FROM "kurumsalcalısanlar" WHERE EXTRACT(YEAR FROM dt) BETWEEN 1985 AND 1996

-------------------------------------

SELECT * FROM "kurumsalcalısanlar"
where Ad != 'Onur'

-------------------------------------

SELECT * FROM "kurumsalcalısanlar" WHERE ad LIKE 'O%' OR ad LIKE 'M%';

-------------------------------------

SELECT * 
FROM "kurumsalcalısanlar"
WHERE Ad SIMILAR TO '[OM]%';

-------------------------------------

SELECT 
    id,
    Maas,
    dt,
    TO_CHAR(Maas, 'FM999,999,999') AS formatted_sales,  -- Sayı formatlama
    TO_CHAR(dt, 'DD.MM.YYYY') AS formatted_date_tr,  -- Tarih formatlama (gün/ay/yıl)
    TO_CHAR(dt, 'FMDay, DD Month YYYY') AS formatted_long_date,  -- Uzun tarih formatlama
    TO_CHAR(dt, 'Mon DD YYYY') AS formatted_date_mmm_dd_yyyy,  -- Kısa tarih formatı
    TO_CHAR(dt, 'DD Mon YYYY') AS formatted_date_dd_mmm_yyyy,  -- Kısa tarih formatı
    TO_CHAR(dt, 'DD/MM/YYYY') AS formatted_date_dd_mm_yyyy,  -- Kısa tarih formatı
    TO_CHAR(dt, 'DD.MM.YYYY') AS SonTarih  -- Kısa tarih formatı
FROM 
    "kurumsalcalısanlar"

--Gün Adı Getirme:
SELECT DT,TO_CHAR(dt, 'FMDay') AS day_name
FROM "kurumsalcalısanlar";

--Gün Adı Türkçe Getirme:
SELECT TO_CHAR(dt, 'TMDay') AS day_name
FROM "kurumsalcalısanlar";

--Ay Adını Türkçe Getirme :
SELECT *,TO_CHAR(dt, 'TMMonth') AS month_name
FROM "kurumsalcalısanlar";

--Gün Adını Küçük Harflerle Getirme
SELECT LOWER(TO_CHAR(dt, 'FMDay')) AS Gün_Adı
FROM "kurumsalcalısanlar

---------------------------------------

SELECT TO_CHAR(dt, 'TMMonth') 
AS Ay, 
AVG(maas) AS Ortalama_Maas 
FROM "kurumsalcalısanlar" 
GROUP BY TO_CHAR(dt, 'TMMonth')

---------------------------------------

SELECT TO_CHAR(dt, 'YYYY') AS Yıl, 
       TO_CHAR(dt, 'TMMonth') AS Ay, 
       AVG(maas) AS Ortalama_Maas 
FROM "kurumsalcalısanlar"
GROUP BY TO_CHAR(dt, 'YYYY'), TO_CHAR(dt, 'TMMonth')

---------------------------------------

SELECT cinsiyet, avg(maas) from "kurumsalcalısanlar" GROUP by Cinsiyet

---------------------------------------

SELECT ulke,cinsiyet, avg(maas) from "kurumsalcalısanlar" GROUP by ulke,cinsiyet

---------------------------------------

SELECT *, TO_CHAR(dt, 'TMMonth') AS Ay FROM "kurumsalcalısanlar"

---------------------------------------

--LIKE :
SELECT * FROM "kurumsalcalısanlar"
WHERE Ad ~~ 'O%';

--ILIKE
SELECT * FROM "kurumsalcalısanlar"
WHERE Ad ~~* '%T';

--NOT LIKE İÇİN :
SELECT * FROM "kurumsalcalısanlar"
WHERE Ad !~~ 'M%';

---------------------------------------

SELECT 
TOP 1 Ad
FROM kurumsalcalısanlar
ORDER BY Maas DESC

---------------------------------------

SELECT * FROM "kurumsalcalısanlar"
ORDER BY MAAS DESC
LIMIT 1

---------------------------------------

SELECT 
    * , ROUND((SELECT AVG(maas) FROM "kurumsalcalısanlar"),0)-maas AS Maas_Farki
FROM 
    "kurumsalcalısanlar";

---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------



---------------------------------------









