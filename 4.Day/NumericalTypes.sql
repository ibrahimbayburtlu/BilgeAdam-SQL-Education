/*
Sayısal Veri Tipleri
---------------------
tinyint: 256 - 1 byte
smallint:  65,536 - 2 byte
int: 2,147,483,647 - 4 byte
bigint: 9,223,372,036,854,775,807 (2^63-1) - 8 byte
----------------------
decimal (US standard) decimal(precisian: sayı toplam kaç hane, scale: ondalıklı kısım, virgülden sonra kaç hane)
numeric (MS'nin kendi geliştirdiği)
float (ondalıklı sayıda kullanılmaz!, bilim dünyası+, iş dünyası-)
real (ondalıklı sayıda kullanılmaz!, bilim dünyası+, iş dünyası-)
money (ondalıklı sayıda kullanılmaz!)
smallmoney (ondalıklı sayıda kullanılmaz!)
-----------------------
bit, boolean'in SQL dilindeki karşılığı (T-F)
*/

/* DATA TYPE CONVERSION
------------------------------------
CAST(kolonadi as veritipi)
CONVERT(veritipi, kolonadi)
*/

-- Adi ve Soyadi kolonlari birlestirilip AdSoyad olacak sekilde tek bir kolonda gelsin
select FirstName, LastName, FirstName + ' ' + LastName as AdSoyad
from Person.Person

-- SicilNO ile Soyadi birlestirip tek kolonda gösterelim
select BusinessEntityID, LastName, CAST(BusinessEntityID as nvarchar) + LastName
from Person.Person


-- CONVERT kullanarak
select BusinessEntityID, LastName, CONVERT(nvarchar, BusinessEntityID) + LastName
from Person.Person


-- Sadece tarih kısmını gösterme
select OrderDate, CAST(OrderDate as date)
from Sales.SalesOrderHeader


select OrderDate, CONVERT(nvarchar, OrderDate, 104),
                CONVERT(nvarchar, OrderDate, 105),
                CONVERT(nvarchar, OrderDate, 112),
                CONVERT(nvarchar, OrderDate, 130),
                CONVERT(nvarchar, OrderDate, 131)
from Sales.SalesOrderHeader

-- tablo olusturma
create table Siparis
(
SiparisID bigint not null primary key identity(1,1),
SiparisTarihi datetime2 not null,
Tutar decimal(15,2),
MusteriID int not null foreign key references dbo.Musteri(MusteriID)
)


-- veri ekleme
insert into dbo.Siparis(SiparisTarihi, Tutar, MusteriID)
values (GETDATE(), 333.33, 1)

 

-- toplu veri ekleme
insert into dbo.Siparis(SiparisTarihi, Tutar, MusteriID)
values (GETDATE(), 1500, 1),
        (GETDATE(), 777.77, 1),
        (GETDATE(), 2500.99, 1),
        (GETDATE(), 250, 1),
        (GETDATE(), 6666.99, 1)



-- veri guncelleme
update dbo.Siparis
set Tutar = Tutar * 1.1
where Tutar < 1000



-- veri silme
delete from dbo.Siparis
where SiparisID = 3
