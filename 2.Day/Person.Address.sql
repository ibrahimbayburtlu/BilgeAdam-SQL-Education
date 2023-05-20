
--Her bir şehirde kaç adet adres var. Çıkan sonuçları sıralayıp en çok hangi şehirde adres var bulalım.

select City,COUNT(*) as Adet
from Person.Address
group by City
HAVING COUNT(*) > 100
order by Adet desc;



