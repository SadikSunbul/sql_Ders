--Tabloları bırlestırme 
SELECT * from Personeller
select * from Satislar


--Joinler 
SELECT * from Personeller p 
inner JOIN Satislar s on p.PersonelID=s.PersonelID


SELECT p.Adi,s.SatisTarihi from Personeller p 
inner JOIN Satislar s on p.PersonelID=s.PersonelID


select u.UrunAdi,k.KategoriAdi from Kategoriler k 
inner JOIN Urunler u on k.KategoriID=u.KategoriID
WHERE k.KategoriAdi='Beverages'


select k.KategoriAdi,COUNT(*) from Kategoriler k 
inner JOIN Urunler u on k.KategoriID=u.KategoriID
WHERE k.KategoriAdi='Beverages' 
GROUP BY K.KategoriAdi


SELECT s.SatisID,p.Adi+' '+p.SoyAdi FROM Satislar s 
inner join Personeller p on s.PersonelID=p.PersonelID

SELECT * from Urunler u 
inner join Tedarikciler t on t.TedarikciID=u.TedarikciID
WHERE t.Faks <> 'Null'  --fax ı null olmayanları getır 


--ikiden fazla tabloyu bırlestırme
select * from Personeller p 
INNER join Satislar s on p.PersonelID=s.PersonelID
INNER JOIN Musteriler m on m.MusteriID=s.MusteriID
where p.Adi='Nancy' and YEAR(s.SatisTarihi)>1997

--aynı tabloda ılıskısel verı 

SELECT * from Personeller p INNER join Personeller pk on p.PersonelID=pk.BagliCalistigiKisi

--ınner joınde group by yama

SELECT p.Adi+' '+p.SoyAdi ,COUNT(s.SatisID) from Personeller p 
inner JOIN Satislar s on p.PersonelID=s.PersonelID
WHERE p.Adi LIKE 'm%' --bas harfı m ıle baslıya-nları cektık 
GROUP by p.Adi+' '+p.SoyAdi --group ladık burada 
HAVING COUNT(s.SatisID)>100    --satıs ıd sının sayısı 100 den fazla oldugu yerlerı aldık --> buda bıze kac satıs yaptıgını soyler


--left right fulll joinler

SELECT * from Satislar s LEFT JOIN Musteriler m on s.MusteriID=m.MusteriID  -- soltarafdakınlerı full alır eslesmeyeneşre null verıcek
SELECT * from Satislar s RIGHT JOIN Musteriler m on s.MusteriID=m.MusteriID  --sag tarafdakınlerı full alır eslesmeyeneşre null verıcek
SELECT * from Satislar s FULL JOIN Musteriler m on s.MusteriID=m.MusteriID  --ıkı tabloyuda ful getırır boslukları null ıle doldurur

--crose joın  kartezyen carpım ıle bırlestırır
--buraya where ile sart veremeyız 
SELECT p.Adi,b.BolgeID from Personeller p CROSS JOIN Bolge b
