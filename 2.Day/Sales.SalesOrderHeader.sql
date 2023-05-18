

select OrderDate
from Sales.SalesOrderHeader
group by OrderDate;


-- Her bir yilda toplam ne kadar ciro elde edildi

select YEAR(OrderDate) as YEAR,SUM(SubTotal) as TOTAL
from Sales.SalesOrderHeader
group by YEAR(OrderDate)
order by YEAR(OrderDate) desc;

-- Toplam ciro 5 milyondan daha fazla olan aylar gelsin
select YEAR(OrderDate) as Yil, MONTH(OrderDate) as Ay, SUM(SubTotal) as Ciro
from Sales.SalesOrderHeader
group by YEAR(OrderDate), MONTH(OrderDate)
having SUM(SubTotal) > 5000000
order by Yil asc, Ay asc;



