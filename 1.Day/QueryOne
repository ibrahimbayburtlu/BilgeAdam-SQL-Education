
-- Production şemasında yer alan Product tablosunun tamamı dönsün.
select *
from Production.Product;


-- -- Production şemasında yer alan Product tablosun da Name,ProductNumber,SafetyStockLevel sutünleri dönsün.

select Name,ProductNumber,SafetyStockLevel 
from Production.Product;


-- Fiyatı 0 olan ürünler gelsin!

select Name,ProductNumber,SafetyStockLevel 
from Production.Product
where ListPrice = 0;


-- Fiyatı 0'dan farkli olan ürünler gelsin.

select Name,ProductNumber,SafetyStockLevel 
from Production.Product
where ListPrice != 0;


-- Fiyati 1000-2000 arasinda olan urunler gelsin

select Name,ProductNumber,SafetyStockLevel 
from Production.Product
where ListPrice > 1000 AND ListPrice < 2000;


-- 2.Yöntem - Fiyati 1000-2000 arasinda olan urunler gelsin

select Name,ProductNumber,SafetyStockLevel 
from Production.Product
where ListPrice between 1000 and 2000;

-- Between kullanılırsa başlangıç/bitiş değerleri dahildir.

-- Rengi Siyah yada Kırmızı olup aynı zamandan 1000'den büyük ürünler

select Name,Color,ListPrice 
from Production.Product
where ListPrice > 1000 and (Color='black' or Color='Red');


-- Rengi Siyah ya da Kırmızı yada Mavi ya da Sarı olan ürünler gelsin.

select Name,Color,ListPrice 
from Production.Product
where Color='black' or Color='Red' or Color='blue' or color='yellow';


-- in yöntemi kullanarak yapalım

select Name,Color,ListPrice 
from Production.Product
where Color in ('black','Red','blue','yellow');


-- Rengi Siyah ya da Kırmızı yada Mavi ya da Sarı olmayan ürünler gelsin olmayan

select Name,Color,ListPrice 
from Production.Product
where Color NOT in ('black','Red','blue','yellow') or Color is NULL;


-- Rengi NULL olan ürunler gelsin.

select Name,Color,ListPrice 
from Production.Product
where Color is NULL;


-- Rengi NULL olmayan ürunler gelsin.

select Name,Color,ListPrice 
from Production.Product
where Color is not NULL;

