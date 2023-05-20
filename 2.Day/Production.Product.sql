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

-- Urunleri fiyata gore kucukten buyuge dogru sıralı getirelim.

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

/* SORGU KOMUTLARININ YAZILMA VE ÇALIŞTIRILMA SIRASI 
----------------------------------------------------
						ÇALIŞTIRMA SIRASI
SELECT  ..................(5)
FROM  ....................(1)
WHERE ....................(2)
GROUP BY .................(3)
HAVING ...................(4)
ORDER BY .................(6)

*/

-- Ürün Adı, Renk, Liste Fiyatı colon isimleri oluşturma 

select Name as "Ürün Adı" ,Color as Renk ,ListPrice as [Liste Fiyatı]
from Production.Product
where Color = 'Black'
order by ListPrice desc;


/* AGGREGATE FUNCTIONS
----------------------
SUM()	--> toplam
MIN()	--> minimum, en kucuk
MAX()	--> maksimum,en büyük
COUNT() -->	satir sayısı,adet
AVG()   --> aritmetik ortalama

*/

-- Her bir renkten kaç adet ürün var.

select Color, COUNT(*) as Adet
from Production.Product
group by Color;

-- Her rengin en pahali fiyati, en ucuz fiyati, ortalama fiyati gelsin.
select Color, 
	MAX(ListPrice) as pahalı,
	MIN(ListPrice) as ucuz,
	AVG(ListPrice) as ortalama
from Production.Product
group by Color;
