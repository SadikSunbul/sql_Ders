-- T-SQL - Triggers (Tetikleyiciler)
--=== DML Trigger
-- Bir tabloda Insert, Update ve Delete işlemleri gerçekleştirildiğinde devreye giren yapılardır
--Bu işlemler sonucunda veya sürecinde devreye girerler.
-- === DDL Trigger
-- Create, Alter ve Drop işlemleri sonucunda veya sürecinde devreye girecek olan yapılardır.

--T-SQL - Triggers (Tetikleyiciler)
--=== DML Trigger ===
-- Bir tabloda Insert, Update ve Delete işlemleri gerçekleştirildiğinde devreye giren yapılardır
--Bu işlemler sonucunda veya sürecinde devreye girerler.

--*Inserted Table
--Eğer bir tabloda Insert işlemi yapılıyorsa arka planda işlemler ilk önce RAM'de oluşturulan
--inserted isimli bir tablo üzerinde yapılır. Eğer işlemde bir problem yoksa inserted tablosundaki
--veriler fiziksel tabloya insert edilir. İşlem bittiğinde RAM'de oluşturulan bu inserted tablosu
--silinir.

-- *Deleted Table.
-- Eğer bir tabloda delete işlemi yapılıyorsa arka planda işlemler ilk önce RAM'de oluşturulan
--deleted isimli bir tablo üzerinde yapılır. Eğer işlemlerde bir problem yoksa deleted tablosundaki
--veriler fiziksel tablodan silinir. İşlem bittiğinde RAM'den bu deleted tablosuda silinecektir
--Eğer bir tabloda update işlemi yapılıyorsa RAM'de updated isimli bir tablo OLUŞTURULMAZ! ! !
-- SQL Server'da ki Update mantığı önce silme (delete), sonra eklemedir (insert).

-- Eğer bir tabloda update işlemi yapılıyorsa arka planda RAM'de hem deleted hemde inserted
---tabloları oluşturulur ve işlemler bunlar üzerinde yapılır.

-- NOT : Update yaparken güncellenen kaydın orjinali deleted tablosunda, güncellendikten sonraki
--hali ise inserted tablosunda bulunmaktadır. Çünkü güncelleme demek kaydı önce silmek sonra
--eklemek demektir.

-- Deleted ve inserted tabloları, ilgili sorgu sonucu oluştukları için o sorgunun kullandığı
--kolonlara da sahip olur. Böylece deleted ve inserted tablolarından select sorgusu yapmak
--mümkündür.
