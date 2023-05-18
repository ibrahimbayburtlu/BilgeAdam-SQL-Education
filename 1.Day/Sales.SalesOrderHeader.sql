-- Sadece 2012 yılında verilen siparişler gelsin.
select *
from Sales.SalesOrderHeader
where YEAR(OrderDate) = 2012;

-- Sadece 2012 yılında verilen siparişler gelsin.(HATALI)
select *
from Sales.SalesOrderHeader
WHERE OrderDate between  '2012-01-01' and '2012-12-31 23:59:59';

-- Sadece 2012 yılında verilen siparişler gelsin.
select *
from Sales.SalesOrderHeader
WHERE OrderDate >= '2012-01-01' and OrderDate < '2013-01-01';
