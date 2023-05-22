/*
1.Subquery’lerde dışarıdaki sorgunun filtrelenen kolonu ile içerdeki sorgunun selectinden dönen kolon aynı veri tipinde olmalıdır. (sayı ile sayı, tarih ile tarih karşılaştırılmalı)

2.Subquery’lerde içerdeki sorguda parantez içerisindeki sorguda birden fazla sonuç dönüyor ise dışardaki sorguda “=” yerine “in” kullanılır.  (“=”  Skalerdir. Tek bir değeri karşılaştırır.)

*/

-- En pahali urunun rengiyle ayni renge sahip olan butun urunler gelsin
select *
from Production.Product
where Color = (select top 1 Color
from Production.Product
order by ListPrice desc )

-- En son verilen siparisle ayni gunde verilen butun siparisler gelsin
select *
from Sales.SalesOrderHeader

select *
from Sales.SalesOrderHeader
where OrderDate = (select MAX(OrderDate)
                    from Sales.SalesOrderHeader
                    )
                    
 -- Fiyati ortalama fiyattan daha yuksek olan urunler gelsin
 select *
from Production.Product
where ListPrice > (select AVG(ListPrice)
                    from Production.Product
                    )
select *

from Person.PersonPhone

where PhoneNumber like '%-%-%'

 

select *

from Person.PersonPhone

where PhoneNumber like '___-___-____'

select *

from Person.PersonPhone

where PhoneNumber like '%-%-%'

EXCEPT

select *

from Person.PersonPhone

where PhoneNumber like '___-___-____'

select *

from Person.PersonPhone

where PhoneNumber like '%-%-%'

INTERSECT

select *

from Person.PersonPhone

where PhoneNumber like '___-___-____'

select *

from Person.PersonPhone

where PhoneNumber like '%-%-%'

UNION ALL

select *

from Person.PersonPhone

where PhoneNumber like '___-___-____'

select *
from Person.PersonPhone
where PhoneNumber like '%-%-%'
UNION 
select *
from Person.PersonPhone
where PhoneNumber like '___-___-____'





 

