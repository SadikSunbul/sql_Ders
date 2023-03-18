--Union | Union All

--Union 
--bırden fazla verının select sorgusu sonucu tek seferde alt alta gostermemzı sagalar

select Adi,SoyAdi from Personeller
SELECT MusteriAdi,MusteriUnvani from Musteriler


select Adi,SoyAdi from Personeller
UNION
select MusteriAdi,MusteriUnvani from Musteriler
union 
select SevkAdi,SevkAdresi from Satislar

--kolan ısımlerı ustekı tablonun kolon ısımlerındendır 
--ustekı sorguda kac adet colon varsa o kadar kolonda verı cekıle bılır 
--kolonların tıplerı uyusmalıdır 
--tekrarlı kayıtları getırmez 
--unıon'da kullanılan tablolara kolon eklenbılır dıkkat etmemız gerekekn nokta yukarıdakı kurallar cercevesınde asagıyada yulkarıyada aynı sayıda colonların ekklenmesıdır

--Unıon all komutu  --> TEKRARLI KODLARI GOSTERIR  alt alta bırlestırır tabloları  unıon lar

select Adi,SoyAdi from Personeller
union all
SELECT Adi,SoyAdi from Personeller

--with rollup
--group by ıle guruplanmıs veri kümesinde ara toplam alınmasını sağlar

select SatisID,UrunID,SUM(Miktar) from [Satis Detaylari]
GROUP by SatisID,UrunID WITH ROLLUP   --ara toplam alır aynı ıd de dıyelım 1 ıd sınde 4 kısı var 1 2 3 4 adet urun satmıs bunlar toplamını verır bıze 10 yanı 


SELECT KategoriID,UrunID,SUM(TedarikciID) from Urunler
GROUP by KategoriID,UrunID With ROLLUP

SELECT SatisID,UrunID,SUM(Miktar) from [Satis Detaylari]
group by SatisID,UrunID with ROLLUP having SUM([Miktar])>100

--With Cube 
-- group by ıle guruplanmıs verı kumesinden teker teker toplam alınmasını saglar

SELECT SatisID,UrunID,SUM(Miktar) from [Satis Detaylari]
GROUP by SatisID,UrunID with cube

select KategoriID,UrunID,SUM(TedarikciID) from Urunler
GROUP by KategoriID,UrunID WITH cube

-- Havıng kullanımı 

SELECT SatisID,UrunID,SUM(Miktar) from [Satis Detaylari]
GROUP by SatisID,UrunID WITH cube HAVING SUM(Miktar)>100

--Case -When - else -end 

--personellerın ısım ve soyısımlerının yanında ; 'Mr.' ise Erkek Ms. Kadın yazsın

select Adi,SoyAdi,UnvanEki from Personeller

SELECT
Adi,SoyAdi,
CASE
when UnvanEki='Mrs.' or UnvanEki='Ms.' then 'Kadın'  -- unvan ekı UnvanEki='Mrs.' or UnvanEki='Ms.' bu veya buysa kadın yaz deddık
when UnvanEki='Mr.' then 'Erkek'
else UnvanEki  --hıcbırı degılse kendını yaz dedık burada
END
from Personeller

-- 0-50 arası cın 50-100 ucuz 100-200 arası normal 200 den fazla pahalı yazsın 
 SELECT UrunAdi,BirimFiyati FROM Urunler



SELECT 
UrunAdi,BirimFiyati, 
CASE
WHEN BirimFiyati BETWEEN 0 and 50 THEN 'Çin malı'  -- 0 50 arasında ıse
when BirimFiyati BETWEEN 50 and 100 then 'Ucuz'
when BirimFiyati BETWEEN 100 and 200 then 'Orta'
when BirimFiyati>200 then 'Pahalı'
else 
'Belirsiz'
END
FROM Urunler


--With Ties komutu

select top 6 with ties * from [Satis Detaylari] ORDER by SatisID
--son verıye gore devamlılık varsa onlarıda getırır bıze soyle dusun
-- ılk 6 ya odul verllıcek ama 6. 7. 8. lerın puanları aynı haksızlık olmasın dıyerek te onlarıda aldık 

--With komutu  parametrık hale getırır 
--komleks sorguları ıcıne alır ve sankı baska bır tablodaymıs gıbı onları tutar onu cagırınca ordakı degerlerı getırı 
--ama bunu kaydetmez anlık tutuar
WITH PersonleSatıs(id,adi,soyadi,satısid)
 AS
 (
select p.PersonelID,Adi,SoyAdi,SatisID from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID
 )
SELECT * from 
PersonleSatıs ps INNER JOIN [Satis Detaylari] sd 
on sd.SatisID =ps.satısid