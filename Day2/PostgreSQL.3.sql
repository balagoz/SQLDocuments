
DECLARE @yıl INT = 2022
SELECT @yıl

DO $$
DECLARE yıl INT;
BEGIN
    -- Değişkene değer atama
    yıl := 2024;

    -- Değişkeni konsolda yazdırma --Print yerine kullanırız.
    RAISE NOTICE 'Yıl: %', yıl; --PRINT

    -- Değişkeni SELECT ile kullanma
    PERFORM yıl; --Perform burada Select'in yerini alır.
END
$$;


---------------------------------------

CREATE OR REPLACE FUNCTION ZAMORANI(
    SAYI INT,
    ZamOranı NUMERIC(10,2)
)
RETURNS NUMERIC(10,2) AS $$
BEGIN
    RETURN SAYI + SAYI*ZamOranı/100;
END;
$$ LANGUAGE plpgsql;


SELECT *,ZAMORANI(maas,50) FROM "kurumsalcalısanlar"

---------------------------------------

CREATE OR REPLACE FUNCTION AYADI(AY DATE)
RETURNS TEXT 
AS 
$$
BEGIN
    RETURN TO_CHAR(AY, 'TMMonth');
END;
$$ 
LANGUAGE plpgsql;


SELECT *,AYADI(İşe_giriş_tarihi) from "kurumsalcalısanlar"

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