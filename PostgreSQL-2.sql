CREATE TABLE Görevler2 (
    id INT,
    Sicil_NO SERIAL PRIMARY KEY,
    Ad VARCHAR(100),
    Görev_Tamamlandı_mı BOOLEAN
);

INSERT INTO Görevler2 (id, Ad, Görev_Tamamlandı_mı) VALUES
(1, 'Ahmet', TRUE),
(1, 'Ayşe', TRUE),
(1, 'Mehmet', FALSE),
(2, 'Fatma', TRUE),
(2, 'Ali', TRUE),
(2, 'Veli', TRUE),
(3, 'Ahmet', TRUE),
(3, 'Ayşe', TRUE),
(3, 'Fatma', TRUE);


SELECT * FROM "görevler2"

---------------------------------------

SELECT id, BOOL_AND(Görev_Tamamlandı_mı) AS bütün_görevler_tamamlandımı FROM Görevler2
GROUP BY id
HAVING BOOL_AND(Görev_Tamamlandı_mı) = True

---------------------------------------

SELECT
    Ulke,
    STRING_AGG  (Ad || ' ' || Maas,', ' Order By Maas Desc) 
FROM
    KurumsalCalısanlar

GROUP BY
    Ulke
ORDER BY
    Ulke;

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


















