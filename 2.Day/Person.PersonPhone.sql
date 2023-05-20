
-- 740-555-0182 formatinda olan telefonlar gelsin.

select *
from Person.PersonPhone
where PhoneNumber like '___-___-____';

-- kaç farklı renk mevcut

select distinct Color
from Production.Product;

-- Renk ve Bedenler birlikte tekilleştirelim.

select distinct Color,Size
from Production.Product;

/*
Fiyatı
0-1000 --> Ucuz ürünler
1000 - 2000 --> Orta ürünler
2000'den büyükse --> Pahalı
*/

select Name,Color,ListPrice,
	case 
		when ListPrice between 0 and 1000 then 'Ucuz'
		when ListPrice between 1000 and 2000 then 'Orta'
		when ListPrice > 2000 then 'Pahalı' 
		else 'Diğer'
	end
from Production.Product;

-- Alias(Kolon isimlerini degistirme)

select Name,Color,ListPrice,
	case 
		when ListPrice between 0 and 1000 then 'Ucuz'
		when ListPrice between 1000 and 2000 then 'Orta'
		when ListPrice > 2000 then 'Pahalı' 
		else 'Diğer'
	end as Segment
from Production.Product

-- Collation (dil alfabesi ayarı)
-- N (national unique character)


select Name,Color,ListPrice,
	case 
		when ListPrice between 0 and 1000 then 'Ucuz'
		when ListPrice between 1000 and 2000 then 'Orta'
		when ListPrice > 2000 then N'Pahalı' 
		else 'Diğer'
	end as Segment
from Production.Product;


-- Urunleri fiyata gore kucukten buyuge dogru sıralı getirelim.

select Name, Color, ListPrice
from Production.Product
order by ListPrice asc;

-- Urunleri fiyata gore buyukten küçüğe dogru sıralı getirelim.

select Name, Color, ListPrice
from Production.Product
order by ListPrice desc;

-- çoklu sıralama

select Name, Color, ListPrice
from Production.Product
order by ListPrice,Name;

-- Fiyati en pahali olan ilk 10 urun gelsin

select TOP 10 Name, Color, ListPrice
from Production.Product
order by ListPrice desc;

-- Fiyati en pahali olan ilk yuzde 10 luk urun dilimi

select TOP 10 percent Name, Color, ListPrice
from Production.Product
order by ListPrice desc;

-- Fiyati en pahali olan ilk 10 ürünü bul aynı olanları da döndür.

select TOP 10 with ties Name, Color, ListPrice
from Production.Product
order by ListPrice desc;

-- Fiyatı en pahalı olan 2. 20 adet ürün gelsin.(21 - 40 arasında gelsin.)

select Name, Color, ListPrice
from Production.Product
order by ListPrice desc
offset 20 rows fetch next 20 rows only;
