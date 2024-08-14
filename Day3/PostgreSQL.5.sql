CREATE VIEW CalısanMaaslar AS
SELECT
    ad,
    maas
    CASE
        WHEN maas BETWEEN 0 AND 3000 THEN 'düşük'
        WHEN maas BETWEEN 30001 AND 5000 THEN 'orta'
        ELSE 'yüksek'
    END AS maas_kategori
FROM
    "kurumsalcalısanlar"
    
CREATE VIEW TURKCELL
AS
SELECT 
*,
CASE
    WHEN maas < 3000 then 'düşük'
    when maas between 3000 and 5000 then 'orta'
    else 'yüksek'

END
FROM KurumsalCalısanlar

SELECT * FROM TURKCELL

---------------------------------------

CREATE TABLE Kurs (
    id SERIAL PRIMARY KEY,
    ogrenci_ad VARCHAR(100),
    ders VARCHAR(100),
    puan NUMERIC,
    kayit_tarihi DATE
);

--Veri Giriyoruz :

INSERT INTO Kurs (ogrenci_ad, ders, puan, kayit_tarihi)
VALUES
    ('Ahmet Yılmaz', 'Matematik', 85, '2024-01-10'),
    ('Ayşe Demir', 'Fizik', 90, '2024-01-12'),
    ('Mehmet Öz', 'Kimya', 78, '2024-01-15'),
    ('Fatma Yıldız', 'Matematik', 92, '2024-01-20'),
    ('Can Kaya', 'Fizik', 88, '2024-01-25');

SELECT * FROM Kurs

---------------------------------------

--Updatable View Yaratma
CREATE VIEW PuanGuncelleme AS
SELECT id, ogrenci_ad, puan FROM Kurs;

SELECT * FROM PuanGuncelleme

--Bu view üzerinden öğrencilerin puanlarını güncelleyebiliriz:
UPDATE PuanGuncelleme
SET puan = puan + 5 WHERE ogrenci_ad = 'Ahmet Yılmaz';

--Ana tablomuzu kontrol ediyoruz:
SELECT * FROM Kurs

---------------------------------------

CREATE MATERIALIZED VIEW OrtalamaPuanlar AS
SELECT ders, AVG(puan) AS ortalama_puan
FROM Kurs
GROUP BY ders;

SELECT * FROM OrtalamaPuanlar;

--Kurs tablosunda uPDATE İŞLEMİ YAPALIM ve view'ın değişmediğini gördük:
SELECT * FROM Kurs;

UPDATE Kurs
SET puan = 1 where id =3

SELECT * FROM OrtalamaPuanlar;

--Şimdi view'ı update edelim yani refrehleyelim :

REFRESH MATERIALIZED VIEW OrtalamaPuanlar;

---------------------------------------

SELECT table_name 
FROM information_schema.views
WHERE table_schema = 'public';

---------------------------------------

CREATE TABLE Calisanlar (
    id SERIAL PRIMARY KEY,
    ad VARCHAR(100),
    soyad VARCHAR(100),
    pozisyon VARCHAR(100),
    maas NUMERIC,
    ise_giris_tarihi DATE
    
);

INSERT INTO Calisanlar (ad, soyad, pozisyon, maas, ise_giris_tarihi)
VALUES
    ('Ahmet', 'Yılmaz', 'Yazılım Geliştirici', 8000, '2022-01-10'),
    ('Ayşe', 'Demir', 'Veri Analisti', 7500, '2021-03-15'),
    ('Mehmet', 'Öz', 'Proje Yöneticisi', 9500, '2020-06-20'),
    ('Fatma', 'Kaya', 'Sistem Yöneticisi', 7000, '2019-10-01');

---------------------------------------

CREATE TABLE Calisanlar2 (
    id SERIAL PRIMARY KEY ,                    -- Birincil Anahtar (Primary Key)
    ad VARCHAR(100) NOT NULL,                 -- Boş Geçilemez (Not Null)
    soyad VARCHAR(100) NOT NULL,              -- Boş Geçilemez (Not Null)
    email VARCHAR(100) UNIQUE,                -- Eşsiz (Unique)
    maas NUMERIC CHECK (maas > 0),            -- Kontrol Kısıtlaması (Check Constraint)
    pozisyon VARCHAR(100) DEFAULT 'Çalışan',  -- Varsayılan Değer (Default Constraint)
    departman_id INT                        -- Yabancı Anahtar İçin Sütun (Foreign Key)
    --CONSTRAINT fk_departman FOREIGN KEY (departman_id)
    --REFERENCES Departmanlar (id)          -- Yabancı Anahtar (Foreign Key)
);


INSERT INTO Calisanlar2 (ad, soyad, email, maas, departman_id)
VALUES ('Ali', 'Veli', 'ali.veli@example.com', 7000, 1);

---------------------------------------

--POSTGRE SQL VERSİYONU :
CREATE OR REPLACE FUNCTION Deneme(SAYI INT)
RETURNS TEXT AS 

$$
DECLARE
    ortalama_maas NUMERIC;
    BEGIN
            SELECT AVG(maas) INTO ortalama_maas FROM KurumsalCalısanlar;
            
            RETURN 
            CASE
                WHEN SAYI > ortalama_maas THEN 'Ort.Üstü Maaş'
                WHEN SAYI < ortalama_maas THEN 'Ort.Altı Maaş'
                ELSE 'Hata'
            END;            
    END;

$$ 
LANGUAGE plpgsql;

---------------------------------------

CREATE OR REPLACE FUNCTION Ulkeler(Country TEXT)
RETURNS TABLE(id INT, ad VARCHAR(30), maaslar integer) AS 
$$
BEGIN
    RETURN QUERY
    SELECT
        c.id as id,
        c.Ulke AS ad,  -- "ad" sütunu olarak "Ulke"yi belirtiyoruz
        c.Maas AS maaslar  -- "maaslar" sütunu olarak "Maas"ı belirtiyoruz
    FROM
        "kurumsalcalısanlar" c
    WHERE
        c.Ulke = Country;
END;
$$ LANGUAGE plpgsql;


SELECT
   *
FROM
    Ulkeler ('Amerika')

---------------------------------------

CREATE TABLE KurumsalCalısanlar2
(
ID INT,
Ad varchar(30),
Cinsiyet varchar(30),
Maas INT,
Ulke varchar(50),
DT DATE,
İşe_Giriş_Tarihi DATE
);

INSERT INTO KurumsalCalısanlar2 VALUES
(1,'Onur','Erkek',3000,'Türkiye','1985-04-16','2012-04-20'),
(2,'Murat','Erkek',4000,'Fransa','1990-09-16','2004-04-20'),
(3,'Kemal','Erkek',5000,'Türkiye','2000-04-25','2008-04-20'),
(4,'Mehmet','Erkek',6000,'Rusya','2002-09-16','2012-04-20'),
(5,'Ezgi','Kadın',7000,'Rusya','1985-08-16','2012-04-20'),
(6,'Ayşe','Kadın',8000,'Estonya','1985-07-16','2012-04-20'),
(7,'Sema','Kadın',9000,'Türkiye','1996-12-16','2020-04-20'),
(8,'Buket','Kadın',3000,'Amerika','1985-12-16','2012-04-20'),
(9,'Fatma','Kadın',3000,'Fransa','1995-03-16','2024-04-20'),
(10,'Esin','Kadın',3000,'Amerika','1985-04-16','2012-04-20'),
(11,'Onur','Erkek',5000,'Türkiye','1985-09-16','2012-04-20'),
(12,'Onur','Erkek',5000,'Fransa','1985-04-16','2021-04-20'),
(13,'Onur','Erkek',5000,'Fransa','1993-08-16','2012-04-20'),
(14,'Onur','Erkek',5000,'Amerika','1985-04-16','2012-04-20'),
(15,'Mehmet','Erkek',5000,'Rusya','1985-04-16','2012-04-20');

SELECT * FROM "kurumsalcalısanlar2"

---------------------------------------

CREATE OR REPLACE PROCEDURE MaasArtir(calisan_id INT, artış_oranı NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
    eski_maas NUMERIC;
    yeni_maas NUMERIC;
BEGIN
    -- Çalışanın mevcut maaşını al
    SELECT maas INTO eski_maas 
    FROM "kurumsalcalısanlar2"
    WHERE id = calisan_id;
    
    -- Yeni maaşı hesapla
    yeni_maas := eski_maas * (1 + artış_oranı / 100);
    
    -- Çalışanın maaşını güncelle
    UPDATE "kurumsalcalısanlar2"
    SET maas = yeni_maas
    WHERE id = calisan_id;
    
    -- İşlemi onayla
    COMMIT;
   
END;
$$;
CALL MaasArtir(3, 100);

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