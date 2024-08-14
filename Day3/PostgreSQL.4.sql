SELECT * FROM "kurumsalcalısanlar"

create or replace FUNCTION YILLAR(YILL DATE)
RETURNS INT
AS
$$
BEGIN
	RETURN EXTRACT(MONTH FROM YILL);
END;
$$
LANGUAGE plpgsql;

SELECT *,YILLAR(dt), YILLAR("İşe_giriş_tarihi") FROM "kurumsalcalısanlar"

---------------------------------------

SELECT 
*,
SUM(MAAS)over(),
SUM(MAAS)over(PARTITION BY Cinsiyet),
avg(MAAS)over(PARTITION BY Cinsiyet),
count(id)over(PARTITION BY Cinsiyet),
avg(MAAS)over(PARTITION BY Ulke),
avg(MAAS)over(PARTITION BY Ulke) - maas AS FARK
FROM "kurumsalcalısanlar"

---------------------------------------

SELECT
*,
FIRST_VALUE(AD)OVER(PARTITION BY Cinsiyet ORDER BY MAAS DESC),--En yüksek Maaşı alan Kişi
FIRST_VALUE(AD)OVER(PARTITION BY Ulke ORDER BY MAAS desc)--En Düşük Maaşı alan Kişi
FROM "kurumsalcalısanlar";

---------------------------------------

SELECT
*,
LEAD(Maas)over(ORDER BY Maas DESC),
LEAD(Maas,1)over(ORDER BY Maas DESC),
LEAD(Maas,2)over(ORDER BY Maas DESC)

FROM "kurumsalcalısanlar";

---------------------------------------

select
*,
ROW_NUMBER()over(ORDER BY Maas DESC) ROWNUMBER,
RANK()over(ORDER BY Maas DESC) RANK,
DENSE_RANK()over(ORDER BY Maas DESC)DENSERANK
from KurumsalCalısanlar

---------------------------------------

--Türkiyeninin maaş toplamı ?

SELECT Ulke,SUM(MAAS) FROM "kurumsalcalısanlar"
where Ulke = 'Türkiye'
GROUP By Ulke


SELECT Ulke,SUM(MAAS) FROM "kurumsalcalısanlar"
GROUP By Ulke
HAVING   Ulke = 'Türkiye'


--MAAŞ TOPLAMI 10.000 tlk'DEN BÜYÜK ÜLKELER HANGİLERİ
SELECT Ulke,SUM(MAAS) FROM "kurumsalcalısanlar"
GROUP By Ulke
HAVING   SUM(MAAS) > 10000

SELECT * FROM
(SELECT Ulke,SUM(MAAS) AS TOPLAM FROM "kurumsalcalısanlar"
GROUP By Ulke)ONUR
WHERE TOPLAM > 10000

---------------------------------------

CREATE TABLE Ogrenciler (
    id SERIAL PRIMARY KEY,
    ad VARCHAR(100),
    soyad VARCHAR(100),
    ders VARCHAR(100),
    puan NUMERIC,
    kayit_tarihi DATE
);

INSERT INTO Ogrenciler (ad, soyad, ders, puan, kayit_tarihi)
VALUES
    ('Ahmet', 'Yılmaz', 'Matematik', 85, '2024-01-10'),
    ('Ayşe', 'Demir', 'Fizik', 90, '2024-01-12'),
    ('Mehmet', 'Öz', 'Kimya', 78, '2024-01-15'),
    ('Fatma', 'Yıldız', 'Matematik', 92, '2024-01-20'),
    ('Can', 'Kaya', 'Fizik', 88, '2024-01-25');

SELECT
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename = 'ogrenciler';

CREATE INDEX idx_ogrenciler_ad ON Ogrenciler(ad);

CREATE INDEX idx_ogrenciler_puan_hash ON Ogrenciler USING HASH (puan);

CREATE INDEX idx_ogrenciler_kayit_tarihi_brin ON Ogrenciler USING BRIN (kayit_tarihi);

---------------------------------------
