
CREATE TABLE Calisanlarr (
    id SERIAL PRIMARY KEY,
    ad VARCHAR(50),
    soyad VARCHAR(50),
    maas NUMERIC(10, 2),
    departman VARCHAR(50)
);


--maaş değeri 10,000'den büyük olan çalışanların eklenmesi durumunda bir uyarı mesajı yazdıracak:
--TRIGGER NETİCESİNDE TETİKLENECEK İŞLEM İÇİN YAPILAN FONKSİYON .
CREATE OR REPLACE FUNCTION maas_kontrolu()
RETURNS TRIGGER AS 
$$
BEGIN
    IF NEW.maas > 10000 THEN
        RAISE NOTICE 'Maaşı 10,000 TL üzerinde olan bir çalışan eklendi: %', NEW.ad;
    END IF;
    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;


CREATE TRIGGER maas_tetikleyici--BUNU KULŞLNAMADIM.
BEFORE INSERT ON Calisanlarr
FOR EACH ROW
EXECUTE FUNCTION maas_kontrolu();


INSERT INTO Calisanlarr (ad, soyad, maas, departman)
VALUES ('Ahmet', 'Yılmaz', 9500, 'Muhasebe');

INSERT INTO Calisanlarr (ad, soyad, maas, departman)
VALUES ('Ayşe', 'Demir', 12000, 'IT');

SELECT * from calisanlarr

---------------------------------------

SELECT 
*,
Ad||' '|| Ulke,
Ad||' '|| Maas,
--Ad + Cast(Maas as Varchar)
Ad||' '||Cast(Maas As Varchar),
Ad||' '|| Maas ::Varchar,
Concat(Ad,' ',Ulke,' ',Cast(Maas As Varchar)),
Concat_WS('--',Ad,Ulke,Maas)
FROM "kurumsalcalısanlar"

SELECT FORMAT('Merhaba %s', 'Dünya');  -- 'Hello World'

SELECT *,INITCAP(LOWER(ad)) FROM Kurumsalcalısanlar
SELECT *,upper(LEFT(ad,1)) FROM Kurumsalcalısanlar
select *,LENGTH(ad) from kurumsalcalısanlar
SELECT LPAD('abc', 10, 'x');
SELECT POSITION('bc' IN 'abcdef'); 
SELECT REPEAT('abc', 3);  -- 'abcabcabc'
SELECT REPLACE('abcdef', 'cd', 'XX');  -- 'abXXef'
SELECT SPLIT_PART('abc,def,ghi', ',', 2);  -- 'def'
SELECT SPLIT_PART('ONUR-OKAY', '-', 1);  -- 'ONUR',
SELECT LEFT('ONUR-OKAY',POSITION('-'IN 'ONUR-OKAY')-1)
SELECT 
*,
SPLIT_PART(dt ::varchar, '-', 1) AS Yıl
FROM Kurumsalcalısanlar

SELECT SUBSTRING('abcdef', 2, 3);  -- 'bcd'

SELECT  
*,
SUBSTRING(ad,1,1),
SUBSTRING(ad,LENGTH(AD),1)
from kurumsalcalısanlar

---------------------------------------

SELECT *,INITCAP(LOWER(ad)) FROM Kurumsalcalısanlar
SELECT *,upper(LEFT(ad,1)) FROM Kurumsalcalısanlar
select *,LENGTH(ad) from kurumsalcalısanlar
SELECT LPAD('abc', 10, 'x');
SELECT POSITION('bc' IN 'abcdef'); 
SELECT REPEAT('abc', 3);  -- 'abcabcabc'
SELECT REPLACE('abcdef', 'cd', 'XX');  -- 'abXXef'
SELECT SPLIT_PART('abc,def,ghi', ',', 2);  -- 'def'
SELECT SPLIT_PART('ONUR-OKAY', '-', 1);  -- 'ONUR',
SELECT LEFT('ONUR-OKAY',POSITION('-'IN 'ONUR-OKAY')-1)

SELECT 
*,
SPLIT_PART(dt ::varchar, '-', 1) AS Yıl
FROM Kurumsalcalısanlar

SELECT SUBSTRING('abcdef', 2, 3);  -- 'bcd'

SELECT  
*,
SUBSTRING(ad,1,1),
SUBSTRING(ad,LENGTH(AD),1)
from kurumsalcalısanlar

---------------------------------------

SELECT 
CURRENT_DATE,
CURRENT_TIME,
CURRENT_TIMESTAMP,
DATE_PART('year',NOW()),
EXTRACT(year from NOW()),
EXTRACT(second FROM now());


SELECT TO_CHAR(dt::DATE, 'TMMonth') AS Ay from KurumsalCalısanlar 
SELECT MAKE_DATE(2024, 8, 11);
SELECT TO_CHAR(dt::DATE, 'FMDay') AS Gün from KurumsalCalısanlar 
SELECT TO_CHAR(dt, 'FMDay') AS Gün from KurumsalCalısanlar

SELECT
*,
AGE(dt,İşe_giriş_tarihi)
FROM "kurumsalcalısanlar"


SELECT
*,
AGE(dt :: DATE,İşe_giriş_tarihi :: DATE),
AGE(dt :: DATE),
EXTRACT(MONTH FROM(AGE(dt :: DATE))),

EXTRACT(YEAR FROM AGE(dt::DATE)) * 12 + EXTRACT(MONTH FROM AGE(dt::DATE)) AS toplam_ay 
FROM "kurumsalcalısanlar"


SELECT MAKE_INTERVAL(years := 2, months := 3, days := 15);


SELECT DATE_TRUNC('month', CURRENT_TIMESTAMP); --Ay Başlangıcı

---------------------------------------



---------------------------------------