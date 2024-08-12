-- W�LDCARDS

/*



Temel olarak 3 adet var.


% _ *

Ama ek olarak 

[Karakter Listeleri]
[Karakter - Karakter]

[^] 



*/



/*


WHERE CustomerName LIKE 'a%'		�lgili kolondaki "a" ile ba�layan t�m sat�rlar� getirir.
WHERE CustomerName LIKE '%a'		�lgili kolondaki "a" ile biten t�m sat�rlar� getirir.
WHERE CustomerName LIKE '%or%'		�lgili kolonda i�inde "or" olan t�m sat�rlar� getirir.
WHERE CustomerName LIKE '_r%'		�lgili kolondaki 2.karakteri "r" olan t�m sat�rlar� getirir.
WHERE CustomerName LIKE 'a_%'		�lgili kolondaki 1.karakteri "a" olan ve en az 2 karakterli t�m sat�rlar� getirir.
WHERE CustomerName LIKE 'a__%'		�lgili kolondaki 1.karakteri "a" olan ve en az 3 karakterli t�m sat�rlar� getirir.
WHERE ContactName LIKE 'a%o'		�lgili kolondaki "a" ile ba�layan ve o ile biten t�m sat�rlar� getirir.
WHERE ContactName LIKE 'a%o'		�lgili kolondaki "a" ile ba�layan ve o ile biten t�m sat�rlar� getirir.
WHERE ContactName LIKE '[YZ]%'		�lgili kolonda �lk harfi Y veya Z ile ba�layan t�m sat�rlar� getirir.
WHERE ContactName LIKE '[YZ]%'		�lgili kolonda �lk harfi Y veya Z ile ba�layan t�m sat�rlar� getirir.
WHERE ContactName LIKE '[A-C]%'		�lgili kolonda �lk harfi  A ile C aras�dan olan t�m harfler ile ba�layan t�m sat�rlar� getirir.
WHERE ContactName LIKE '[^A-C]%'	�lgili kolonda �lk harfi  A ile C ile ba�lamayan t�m sat�rlar� getirir.



*/





--�RNEKLER:

SELECT * FROM Person.Person
WHERE FirstName LIKE 'T%'


SELECT * FROM Person.Person
WHERE FirstName LIKE '%t'


SELECT * FROM Person.Person
WHERE FirstName LIKE '%ert%'

SELECT * FROM Person.Person
WHERE FirstName LIKE '_r%'


SELECT * FROM Person.Person
WHERE FirstName LIKE 'j_'



SELECT * FROM Person.Person
WHERE FirstName LIKE 'a%o'



-- First Name'i A veya B ile ba�layanlar� getirir.
SELECT * FROM Person.Person
where FirstName LIKE '[AB]%'
ORDER BY FirstName




-- First Name'i A ile D aras�nda olanlar gelir.
SELECT * FROM Person.Person
where FirstName LIKE '[A-D]%'
ORDER BY FirstName



-- First Name'iN ilk harfi A ile D olmayanlar gelir.
SELECT * FROM Person.Person
where FirstName LIKE '[^A-D]%'
ORDER BY FirstName --14.051 SATIR

