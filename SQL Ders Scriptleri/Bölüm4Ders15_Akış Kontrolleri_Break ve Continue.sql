---- BREAK VE CONTINUE ----

-- ### BREAK ### ---
--While LOOP'ta d�ng�n�n do�al olarak bitmesine m�sade etmeden d�ng�den ��kmak i�in kullan�l�r.
--SYNTAX :
	WHILE �fade
	BEGIN
		�fadeler
		IF �art
			BREAK
		Di�er �fadeler

	END

--If'te belirtilen ko�ul ger�ekle�ti�i anda d�g�den ��k�l�r.
--Break ile END aras�ndaki t�m ifadeler atlan�r.
--Break sadece While loop'lar ile kullan�l�r.
-- �RNEK :
--A�a��da say� 4'e gelince LOOP sonladnd� ve Pr�nt ifadeside atland�.

DECLARE @say� INT = 0
WHILE @say� <= 10
	BEGIN
		SET @say� = @say� + 1
			IF @say� = 4
			BREAK
		PRINT @say�
	END

-- ### CONTINUE ### ---

--Sadece IF'TE BELR�T�LEN KO�UL GER�EKLE��RSE ONU ATLAR ANCAK LOOP'A kald��� yerden devam eder.

--�RNEK
DECLARE @say� INT = 0
WHILE @say� <= 10
	BEGIN
		SET @say� = @say� + 1
			IF @say� = 4
			CONTINUE
		PRINT @say�

	END

--�RNEK

DECLARE @Say� INT 
SET @Say� = 0
WHILE @say� < 10
	BEGIN
		SET @say� = @say� + 1
		IF @say� = 5
		CONTINUE
		PRINT @say�
	END