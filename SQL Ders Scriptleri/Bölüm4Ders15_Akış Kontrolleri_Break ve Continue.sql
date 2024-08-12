---- BREAK VE CONTINUE ----

-- ### BREAK ### ---
--While LOOP'ta döngünün doðal olarak bitmesine müsade etmeden döngüden çýkmak için kullanýlýr.
--SYNTAX :
	WHILE Ýfade
	BEGIN
		Ýfadeler
		IF þart
			BREAK
		Diðer Ýfadeler

	END

--If'te belirtilen koþul gerçekleþtiði anda dögüden çýkýlýr.
--Break ile END arasýndaki tüm ifadeler atlanýr.
--Break sadece While loop'lar ile kullanýlýr.
-- ÖRNEK :
--Aþaðýda sayý 4'e gelince LOOP sonladndý ve Prýnt ifadeside atlandý.

DECLARE @sayý INT = 0
WHILE @sayý <= 10
	BEGIN
		SET @sayý = @sayý + 1
			IF @sayý = 4
			BREAK
		PRINT @sayý
	END

-- ### CONTINUE ### ---

--Sadece IF'TE BELRÝTÝLEN KOÞUL GERÇEKLEÞÝRSE ONU ATLAR ANCAK LOOP'A kaldýðý yerden devam eder.

--ÖRNEK
DECLARE @sayý INT = 0
WHILE @sayý <= 10
	BEGIN
		SET @sayý = @sayý + 1
			IF @sayý = 4
			CONTINUE
		PRINT @sayý

	END

--ÖRNEK

DECLARE @Sayý INT 
SET @Sayý = 0
WHILE @sayý < 10
	BEGIN
		SET @sayý = @sayý + 1
		IF @sayý = 5
		CONTINUE
		PRINT @sayý
	END