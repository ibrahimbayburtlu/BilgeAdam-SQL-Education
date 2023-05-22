
SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.SalesTerritory;


-- Sipariş Tarihi, Tutarı ve Bölge adı gelsin.

SELECT soh.OrderDate,soh.SubTotal,st.Name
FROM Sales.SalesOrderHeader as soh
INNER JOIN Sales.SalesTerritory as st
on soh.TerritoryID = st.TerritoryID;


select * from Production.Product
select * from Production.ProductModel

-- Ürün adı, Renk, Fiyatı ve Model adı gelsin.

SELECT pp.Name as "Ürün Adı",pp.Color,pp.ListPrice,pm.Name as "Model Adi"
FROM Production.Product as pp
INNER JOIN  Production.ProductModel as pm
on pp.ProductModelID = pm.ProductModelID;


select p.FirstName, p.LastName, ea.EmailAddress
from Person.Person as p inner join Person.EmailAddress as ea
on p.BusinessEntityID = ea.BusinessEntityID


select * from Person.Person
select * from Person.EmailAddress
select * from Person.PersonPhone

-- Adi, Soyadi, Mailadresi ve TelefonNo gelsin
select p.FirstName, p.LastName, ea.EmailAddress, pp.PhoneNumber
from Person.Person as p inner join Person.EmailAddress as ea
on p.BusinessEntityID = ea.BusinessEntityID
inner join Person.PersonPhone as pp
on pp.BusinessEntityID = p.BusinessEntityID

select * from Production.Product        -- 504 rows
select * from Production.ProductModel    -- 128 rows

 -- INNER JOIN -- 295 rows -- (sadece modeli olan urunler)
select p.Name as Urunadi, p.Color, p.ListPrice, pm.Name as Modeladi
from Production.Product as p inner join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID


-- LEFT JOIN -- 504 rows -- (modeli olsun ya da olmasin BUTUN URUNLER)

select p.Name as Urunadi, p.Color, p.ListPrice, pm.Name as Modeladi

from Production.Product as p left join Production.ProductModel as pm

on p.ProductModelID = pm.ProductModelID


-- RIGHT JOIN -- 304 rows -- (urunu olsun ya da olmasin BUTUN MODELLER)

select p.Name as Urunadi, p.Color, p.ListPrice, pm.Name as Modeladi

from Production.Product as p right join Production.ProductModel as pm

on p.ProductModelID = pm.ProductModelID

-- FULL JOIN -- 513 rows -- (hem BUTUN URUNLER hem de BUTUN MODELLER)
select p.Name as Urunadi, p.Color, p.ListPrice, pm.Name as Modeladi
from Production.Product as p full join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID


-- CROSS JOIN -- 64512 rows -- (kartezyen carpim)
select p.Name as Urunadi, p.Color, p.ListPrice, pm.Name as Modeladi
from Production.Product as p cross join Production.ProductModel as pm

SELECT  p.FirstName AS Adı, p.LastName AS Soyadı, ea.EmailAddress AS [Mail Adresi], pp.PhoneNumber AS [Telefon No]
FROM      Person.Person AS p INNER JOIN
                   Person.PersonPhone AS pp ON p.BusinessEntityID = pp.BusinessEntityID INNER JOIN
                   Person.EmailAddress AS ea ON p.BusinessEntityID = ea.BusinessEntityID
WHERE   (p.LastName = N'Kim')
ORDER BY Soyadı, Adı
