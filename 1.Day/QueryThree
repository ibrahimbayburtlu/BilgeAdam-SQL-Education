
--  Person Schema da yer alan Person tablosu dönsün!

select *
from Person.Person;


/* LIKE 
------------

%  --> 0 veya daha fazla karakteri temsil eder.
_  --> Sadece tek 1 adet karakteri temsil eder.

*/

-- Soyadı K ile başlayan kişiler gelsin.

select *
from Person.Person
where LastName like 'K%';


-- Soyadı K ile biten kişiler gelsin.

select *
from Person.Person
where LastName like '%K';


-- Soyadının içinde K harfi geçen kişiler

select *
from Person.Person
where LastName like '%K%';

-- Soyadının sondan 3. harfi K olan kisiler gelsin
select *
from Person.Person
where LastName like '%K__';
