--Subquery (iç-içe sorgular)

SELECT * from Personeller p 
inner join Satislar s on p.PersonelID=s.PersonelID 
WHERE Adi='Nancy'

SELECT SatisID,SatisTarihi from Satislar 
where PersonelID=(select PersonelID from Personeller where Adi='Nancy')  --inner join ile aynı 


SELECT Adi from Personeller 
where adi=(SELECT Adi from Personeller where UnvanEki='Dr.')
--iceride kullanmıs oldugumuz sorgularda tek bır satır dnusun olması gerekır tek bır Dr oldugu ıcın burası calısır ama Mr. olsaydı hata verıcektı orası bıze

--Bulk Insert 

BULK Insert Kisiler   -- buradakı kısıler tablosunu bızım olusturmamız gerekır 
from 'D:\\kısılerıwklw.txt'  --dosya uzantısı olmaı
WITH(
    fieldterminator ='\t',  --kolonları ayıracak burası   koonları 1 tab yanı -->\t ıle ayırt eder
    ROWTerminator='\n'    ---satırları belırler   burada her bır satırı \n ıle ayırt eder 1 enter
)

--TRuncate table komuut

--bır tablonun tum verılerını sılerız ve ıdentıty kolonunu sıfırlar 


DELETE from Personellerx   -- tum verıelr sılınır ama ıdentıty ler sıfırlanmaz

TRUNCATE TABLE personelx   --test asamasından sonra temızlenmıs seklınde gonderılır 

--@@Identity komutu

INSERT Kategoriler (KategoriAdi,Tanimi)VALUES('X','X kategory')

SELECT @@IDENTITY   --son ıdentıty ıslemını sogterır 
INSERT Personellerx(Adi,Soyadi) values('x','y')

--@@Rowcount Komutu
--herhangı bır ıslemde kac elemanın etkılendıgını gosterır
select * from Personellerx WHERE soyadı='gencay'
select @@ROWCOUNT

SELECT * from Personeller
SELECT @@ROWCOUNT

Insert Personellerx(Adi,Soyadi)values ('Gencay','Yıldız'),
                                    ('Sadık','Sunbul'),
                                    ('Aslı','Enver')
 SELECT @@ROWCOUNT

--Identıty Kolonuna MUdahale etme  pek tavsıye edılmezz*****

DBCC Checkident(personelx,reset,27)  --hangı tablo en son hangı degerden baslamasını ıstıyoruz

--T-Sql NULL Kontrolü

--Case -When -Then -Else -End ile null kontorlu

SELECT MusteriAdi,Bolge from Musteriler

SELECT MusteriAdi,
CASE
when Bolge is null then 'Bölge Bilinmiyor'
else Bolge
end 
from Musteriler

--coalesce fonksıyonu ıle null kontrolu 
--null  yerlere deger atar 
SELECT MusteriAdi,coalesce(Bolge,'Bölge Bilinmiyor') from Musteriler

--Is null fonkıle null kontrolıu 
--null  yerlere deger atar 
SELECT MusteriAdi,ISNULL(Bolge,'Bölge Bilinmiyor') from Musteriler

--NullIf Fonksoyonu ıle null komtrolu 
--fonksıyona verılen kolın , ikinci parametre verilen degere esıt ıse o kolonu null olarak getırır

SELECT NULLIF(0,0)

SELECT HedefStokDuzeyi from Urunler

SELECT AVG(HedefStokDuzeyi) from Urunler

--Hedef stok duzeyı 0 olan urunlerın ortalaması nedır?
SELECT AVG(HedefStokDuzeyi) from Urunler WHERE HedefStokDuzeyi<>0
SELECT AVG(nullIf(HedefStokDuzeyi,0)) from Urunler  --degerı 0 olanları null getırır 

--veri tabnındakı tabloları lısteleme 

SELECT * from sys.tables
--ya da
select * from sysobjects WHERE xtype='u'