-- WÝLDCARDS

/*



Temel olarak 3 adet var.


% _ *

Ama ek olarak 

[Karakter Listeleri]
[Karakter - Karakter]

[^] 



*/



/*


WHERE CustomerName LIKE 'a%'		Ýlgili kolondaki "a" ile baþlayan tüm satýrlarý getirir.
WHERE CustomerName LIKE '%a'		Ýlgili kolondaki "a" ile biten tüm satýrlarý getirir.
WHERE CustomerName LIKE '%or%'		Ýlgili kolonda içinde "or" olan tüm satýrlarý getirir.
WHERE CustomerName LIKE '_r%'		Ýlgili kolondaki 2.karakteri "r" olan tüm satýrlarý getirir.
WHERE CustomerName LIKE 'a_%'		Ýlgili kolondaki 1.karakteri "a" olan ve en az 2 karakterli tüm satýrlarý getirir.
WHERE CustomerName LIKE 'a__%'		Ýlgili kolondaki 1.karakteri "a" olan ve en az 3 karakterli tüm satýrlarý getirir.
WHERE ContactName LIKE 'a%o'		Ýlgili kolondaki "a" ile baþlayan ve o ile biten tüm satýrlarý getirir.
WHERE ContactName LIKE 'a%o'		Ýlgili kolondaki "a" ile baþlayan ve o ile biten tüm satýrlarý getirir.
WHERE ContactName LIKE '[YZ]%'		Ýlgili kolonda Ýlk harfi Y veya Z ile baþlayan tüm satýrlarý getirir.
WHERE ContactName LIKE '[YZ]%'		Ýlgili kolonda Ýlk harfi Y veya Z ile baþlayan tüm satýrlarý getirir.
WHERE ContactName LIKE '[A-C]%'		Ýlgili kolonda Ýlk harfi  A ile C arasýdan olan tüm harfler ile baþlayan tüm satýrlarý getirir.
WHERE ContactName LIKE '[^A-C]%'	Ýlgili kolonda Ýlk harfi  A ile C ile baþlamayan tüm satýrlarý getirir.



*/





--ÖRNEKLER:

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



-- First Name'i A veya B ile baþlayanlarý getirir.
SELECT * FROM Person.Person
where FirstName LIKE '[AB]%'
ORDER BY FirstName




-- First Name'i A ile D arasýnda olanlar gelir.
SELECT * FROM Person.Person
where FirstName LIKE '[A-D]%'
ORDER BY FirstName



-- First Name'iN ilk harfi A ile D olmayanlar gelir.
SELECT * FROM Person.Person
where FirstName LIKE '[^A-D]%'
ORDER BY FirstName --14.051 SATIR

