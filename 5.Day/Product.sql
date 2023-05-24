select Name, Color, ListPrice, 
        case when ListPrice between 0 and 1000 then 'Ucuz' 
             when ListPrice between 1000 and 2000 then 'Orta'
             when ListPrice > 2000 then N'Pahalı'
             else N'Diğer'
        end as Segment
from Production.Product

-- Derived Table (Subquery)
-- Kac adet Ucuz, kac adet Orta, kac adet Pahalı urun var
select tbl.Segment, COUNT(*)
from
    (
    select Name, Color, ListPrice, 
            case when ListPrice between 0 and 1000 then 'Ucuz' 
                 when ListPrice between 1000 and 2000 then 'Orta'
                 when ListPrice > 2000 then N'Pahalı'
                 else N'Diğer'
            end as Segment
    from Production.Product
    ) as tbl
group by tbl.Segment


-- Common Table Expression (CTE - With Clause)
-- Kac adet Ucuz, kac adet Orta, kac adet Pahalı urun var
;with tbldeneme
as
    (
    select Name, Color, ListPrice, 
                case when ListPrice between 0 and 1000 then 'Ucuz' 
                     when ListPrice between 1000 and 2000 then 'Orta'
                     when ListPrice > 2000 then N'Pahalı'
                     else N'Diğer'
                end as Segment
    from Production.Product
    )
select tbldeneme.Segment, COUNT(*)
from tbldeneme
group by tbldeneme.Segment

-- VIEW olusturma
create view vwUrunSegmentBilgileri
as
    select Name, Color, ListPrice, 
            case when ListPrice between 0 and 1000 then 'Ucuz' 
                 when ListPrice between 1000 and 2000 then 'Orta'
                 when ListPrice > 2000 then N'Pahalı'
                 else N'Diğer'
            end as Segment
    from Production.Product
-- view kullanma
select *
from vwUrunSegmentBilgileri




    Query Execution Phases
    ---------------------------------
    1- Syntax Check
    2- Name Resolution (Binding)
    3- Compile
    4- Execution Plan
    5- Execute
    
 -- stored procedure calistirma
exec uspGetEmployeeManagers 3


-- Drop the function if it already exists
IF OBJECT_ID('dbo.InitCap') IS NOT NULL
DROP FUNCTION dbo.InitCap;
GO
 
-- Implementing Oracle INITCAP function
CREATE FUNCTION dbo.InitCap (@inStr VARCHAR(8000))
RETURNS VARCHAR(8000)
AS
BEGIN
DECLARE @outStr VARCHAR(8000) = LOWER(@inStr),
@char CHAR(1),
@alphanum BIT = 0,
@len INT = LEN(@inStr),
@pos INT = 1;
 
-- Iterate through all characters in the input string
WHILE @pos <= @len BEGIN
 
-- Get the next character
SET @char = SUBSTRING(@inStr, @pos, 1);
 
-- If the position is first, or the previous characater is not alphanumeric
-- convert the current character to upper case
IF @pos = 1 OR @alphanum = 0
SET @outStr = STUFF(@outStr, @pos, 1, UPPER(@char));
 
SET @pos = @pos + 1;
 
-- Define if the current character is non-alphanumeric
IF ASCII(@char) <= 47 OR (ASCII(@char) BETWEEN 58 AND 64) OR
(ASCII(@char) BETWEEN 91 AND 96) OR (ASCII(@char) BETWEEN 123 AND 126)
SET @alphanum = 0;
ELSE
SET @alphanum = 1;
 
END
 
RETURN @outStr;
END
GO

-- sıra numarası uretme
select Name, Color, ListPrice, 
    RANK() OVER(order by listprice desc) as SiraNo,
    DENSE_RANK() OVER(order by listprice desc) as SiraNo2,
    ROW_NUMBER() OVER(order by listprice desc) as SiraNo3
from Production.Product


-- Her rengin en pahali ilk 3 farkli fiyata sahip urunleri gelsin
select *
from
    (
    select Name, Color, ListPrice, 
        RANK() OVER(partition by color order by listprice desc) as SiraNo,
        DENSE_RANK() OVER(partition by color order by listprice desc) as SiraNo2,
        ROW_NUMBER() OVER(partition by color order by listprice desc) as SiraNo3
    from Production.Product
    ) as tbl
where tbl.SiraNo2 <= 3


select SubTotal, ROUND(SubTotal, 2), FLOOR(SubTotal), CEILING(SubTotal)
from Sales.SalesOrderHeader

select AddressLine1, REPLACE(AddressLine1, 'Street', 'SOKAK')
from Person.Address

select PhoneNumber, LEFT(PhoneNumber, 6), RIGHT(PhoneNumber, 4), SUBSTRING(PhoneNumber, 7, 9)
from Person.PersonPhone

select OrderDate, DATEADD(YEAR, 2, OrderDate)
from Sales.SalesOrderHeader

select OrderDate, DATENAME(WEEKDAY, OrderDate)
from Sales.SalesOrderHeader

-- siparis tarihinden bugune kadar ne kadar ay gecti
select OrderDate, DATEDIFF(MONTH, OrderDate, GETDATE())
from Sales.SalesOrderHeader

