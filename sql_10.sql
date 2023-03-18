--Geçici Tablolar - Temporal Tables

--Genellıkle bır sql server uzerınden farklı lokasyonlarda bırden faazla kısının calıstıgı durumlarda ya da verılerın test amaclı gecıcı bır yerde tutulması ıslenmesı amacı ıle  kullanılan  yapılardır
--bılınen tablo yapısının aynısını saglar Tek farkı fızıksel olarak olusmazlar sadece bellekte gecıcı olarak olusurlar

--select ınsert uodate ve delete ıslemlerı yapılabılır ılıskı kurula bılır

--Sunucu kapatıldıgında ya da oturum sahıbı oturumu kapattıgında bellekten sılınırler

--#bır tabloyu fiziksel olarak kopyalama

select * Into gecıcıpersoneller from Personeller
--Bu şekilde bir kullanımda sadece primary key ve foreign key constraıntler olusturmazlar geri kalan hersey bıre bır fızıksel olarak olusturulur

--#bır tabloyu #ıfadesi ıle bellege gecıcı olarak kopyalama

select * Into #gecıcıpersoneller from Personeller

SELECT * from #gecıcıpersoneller

insert #gecıcıpersoneller(Adi,SoyAdi) VALUES('Sadık','Sünbül')

delete from #gecıcıpersoneller where PersonelID=3

UPDATE #gecıcıpersoneller set Adi='Taha',SoyAdi='Boyraz' where PersonelID=5

--Gecıcı tablo uzerınden her turlu ıslemı yapabılıyoruz
--# ıle olusturulan tablo , o an sql serverda oturum acmıs kısının sunucu bellegınde olusur
--sadece oturumacan sahıs kullana bılır
--eger oturum acan sahıs sql serverdan dısconnet olursa bu tablo bellekten sılınır


--#bır tabloyu ## ıfadesı ıle bellege gecıcı olarak kopyalamak

SELECT * Into ##geciciPersoneller2 from Personeller

SELECT * from ##geciciPersoneller2

insert ##geciciPersoneller2(Adi,SoyAdi) VALUES('Sadık','Sünbül')

delete from ##geciciPersoneller2 where PersonelID=3

UPDATE ##geciciPersoneller2 set Adi='Taha',SoyAdi='Boyraz' where PersonelID=5

--## le olusturulan tablo . o an sql serverda oturum acmıs kısının sunucu bellegınde olusur
--Bu tabloyu oturum acan sahıs ve onun sql serverına dısarıdan ulasan 3. sahıslar kullana bılır
--eger oturum acan sahıs sql serverdan dısconnet olursa bu tablo bellekten sılınır 
--Diger butun ozellıklerı # ile olusturulan tablo ıle aynıdır


--Uniqueidentifiler vei tipi
--int nvarchar vs. gibi bır verı tıpı
--aldıgı deger rakamlar ve harflerden olusan cok buyuk bır sayıdır
--bundan dolayı bu kolona aynı degerı bırden fazla gelmesı nerdeyse ımkansızdır
-- o yuzden tekıl bır verı olusturmak ıcın kullanılır

CREATE TABLE OrnekTablo
(
    Id int PRIMARY KEY IDENTITY(1,1),
    kolon1 NVARCHAR(max),
    kolon2 NVARCHAR(max),
    kolon3 UNIQUEIDENTIFIER
)
--NewId Fonksıyonu
SELECT NEWID()   --genelde maıl onayında kullanırız 
insert OrnekTablo VALUEs('x','y',NEWID())





