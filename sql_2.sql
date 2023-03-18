--Aggregate fonkları

--AVG :portalama alır 
SELECT AVG(PersonelID) from Personeller

--Max:en buyuk degerı getırı 
SELECT MAX(PersonelID) from Personeller

--Min: min getırır
SELECT MIN(PersonelID) from Personeller

--Count :Toplam sayısını getırır 
SELECT COUNT(*) from Personeller
SELECT COUNT(Adi) from Personeller

--Sum toplamını getır 
SELECT SUM(NakliyeUcreti) from Satislar

--string fonkları 

--left fonk bastan karakter getırı 
SELECT LEFT(Adi,3) from Personeller  -- personlelerın adı dıyelımkı sadık   --->    sad   olarak getırır 
SELECT right(Adi,3) from Personeller  -- sondan getırı
SELECT upper(Adi) from Personeller  -- tum harklerı buyutur 
SELECT lower(Adi) from Personeller  -- tum harflerı kucutur 


--substrıng belırtılen ındexten ııtbaren belırtılen kadarını getırı 

SELECT substring(Adi,2,2) from Personeller  -- 2 den basla 2 harf gıt goster dedık  sadık ---> ad olarak gosukur

--RTRIM sagdakı boslukları keser

SELECT 'yıldız             '
SELECT RTRIM('yıldız             ')

--REVERSE tersıne cevırı 
SELECT REVERSE(Adi) from Personeller   --sadık ---> kıdas yapar


--REPLACE
SELECT REPLACE('Benım adım sadık','sadık','ali')  -- burada 1. parametredekı 2. parametredekı degerı bulur ve 3. parametredekı deger ıle degıstırır

--charındex 

SELECT Adi,CHARINDEX('r',Adi) from Personeller  -- r harfı kacıncı sırada oldugunu gosterır 
SELECT MusteriAdi,CHARINDEX(' ',MusteriAdi) from Musteriler   -- burada boslugu gosterır 


SELECT SUBSTRING(MusteriAdi,0,CHARINDEX(' ',MusteriAdi)) from Musteriler  --burada saddece ısımlerı getır dedık 

-- burada musterı adına 0. karakterden basla ve (mustreı adında ılk bosluga kadar ) gıt ve al dedık 

select SUBSTRING(MusteriAdi,CHARINDEX(' ',MusteriAdi),LEN(MusteriAdi)-(CHARINDEX(' ',MusteriAdi)-1)) from Musteriler   --burasıda soy adı bulur ındex 0 dan baslar 


--sayısal ıslem degrelerı 

select 3+2

SELECT PI()

SELECT Sin(90)

SELECT POWER(2,3)  --ustunu alır 2 uzerı 3 der 

SELECT ABS(-12) --mutlakdegerını alır

SELECT RAND()  -- random sayı uretır 0-1 arasında 

SELECT FLOOR(RAND()*100)  --FLOOR yuvarlar 

--Tarih fonkları

--GETDATE :bugunun tarıhını verır 

SELECT GETDATE()

--DATEADD :verılen tarıhe verıldıgı kadar gun , ay , yılı kapsart

SELECT DATEADD(DAY,999,GETDATE())   --su anın tarıhıne 999 tane gun ekle demısız
SELECT DATEADD(MONTH,999,GETDATE()) 
SELECT DATEADD(YEAR,999,GETDATE()) 

--Datedıff : ıkı tarıh arasında gunu ayı yılı hesaplar

SELECT DATEDIFF(DAY,'05.09.1992',GETDATE())  -- ıkı tarıh arasındakı gun farkı
SELECT DATEDIFF(MONTH,'05.09.1992',GETDATE())
SELECT DATEDIFF(YEAR,'05.09.1992',GETDATE())


--Datepart :verılen tarıhın haftanın aynı yahut yılın kacıncı gunu oldugunu hesapalr

SELECT DATEPART(DW,GETDATE())    -- haftanın kacıncı gunu 
SELECT DATEPART(MONTH,GETDATE())  --3. aya ımıs
SELECT DATEPART(DAY,GETDATE())--bugunun tarıhı haftanın kacıncı gunu 

--top komutu 

select top 10 * from Personeller  -- 10 kısıyı cek dedık 


--distinc benzer seylerı teke ındırır

SELECT Distinct Sehir  from Personeller  --aynı sehırlerı teke ındırdı 

--Group By

select * from Urunler

select KategoriID,COUNT(*) from Urunler
GROUP by KategoriID
 --kategory ıd sını grupluyup kactane degerı varsa onu karsısına yazar

 SELECT KategoriID,TedarikciID,COUNT(*) from Urunler
 GROUP by KategoriID,TedarikciID

 --eger select sorgusunda normal bır kolon ve egret kolonu varsa normal olan kolonu guruplamak gerekır 

SELECT PersonelID,COUNT(*) from Satislar GROUP by PersonelID

SELECT PersonelID,SUM(NakliyeUcreti) from Satislar GROUP by PersonelID   -- burada satıcının ne kadar naklıye ucretı verdıgınıhesapladık

--group by where ekleme 

select KategoriID,COUNT(*) from Urunler
WHERE KategoriID>5  -- kategorı ıd sı 5 den buyuk olanları getır dedık 
GROUP by KategoriID 

--group by ıle havin komutu kullanma  egrate kolonu ustunde uygulanır 

SELECT * from Urunler

SELECT KategoriID,COUNT(*) from Urunler WHERE KategoriID>5 GROUP By KategoriID HAVING COUNT(*)>6  --havıng sonra kullanır 

SELECT KategoriID,COUNT(*) from Urunler WHERE KategoriID<4 GROUP By KategoriID HAVING COUNT(*)>6

SELECT PersonelID,SUM(NakliyeUcreti) from Satislar GROUP by PersonelID HAVING SUM(NakliyeUcreti)>1000