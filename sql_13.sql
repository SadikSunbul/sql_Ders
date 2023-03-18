--Stored Procedures (Saklı Yordamlar )
--= Genel özellikleri ==

--Normal sorgulardan daha hızl1 çal15irlar.
-- Çünkü normal sorgular Execute edilirken "Execute Plan" işlemi yapllir. Bu işlem
--sirasinda hangi tablodan veri çekilecek, hangi kolonl ardan gelecek, bunlar nerede
--v.s gibi işlemler yapılir. Bir sorgu her çalıştırıldiğında bu işlemler aynen tekrar
--tekrar yapılir. Fakat sorgu Stored Procedure olarak çalıştirılırsa bu işlem sadece
--bir kere yapılır ve o da ilk çaliştirma esnasındadır. Diğer çalıştırmalarda bu
--işlemler yapllmaz. Bundan dolay1 hiz ve performansta artiş sağlaniar.
--fçerisinde Select, Insert, Update ve Delete işlemleri yap1labilir.
--ic içe kullanl labilir.
--içlerinde fonksiyon olutsrulabilir.
--Sorgularm1zın dişar1dan alacağı değerler paramet re olarak Stored Procedure 'lere
--geçirilebildiğinden dolay1, sorgularımızın "sQL Injection" yemelerinide önlemiş
--oluruz. Bu yönleriyle de daha güvenlidirler.
--Stored Procedure fiziksel bir veritabanı nesnesidir. Haliyle Create komutu ile
--oluşturulur.
-- Fiziksel olarak ilgili veritabanının "Programmability" -> "Stored Procedures"
--kombinasyonundan erişilebilirler.

--=Prototip =
-- Create Proc ya da Procedure [isim]
--(
--varsa parametreler
--)
--As
-- yazılacak sorgular, kodlar, şartlar, fonksiyonl ar, komutlar


--Stored Procedures (Sakli Yordamlar)
--==Stored Procedure Tanımlama ==
Create Proc sp_Ornek
@Id int -- Aksi söylenmedigi taktirde bu parametrenin yap1s inputtur.
As
Select *from Personeller Where PersonelID = @Id
-- DikkatII
--Prosedürün parametrelerini tanımlarken parantez kullanmak zorunlu değildir ama
--okunabilirliği arttırmak için kullanmakta fayda vardır.
Create Proc sp_Ornek2
@Id int,
@Parametre2 int,
@Parametre3 nvarchar(MAX)
As
Select * from Personeller Where PersonelID=@Id


--Stored Procedures (Saklı Yordamlar)
--Stpred Procedure Kullan1-=
--Stored Procedure yap1ların "Exec" komutu eşliginde çal1ştırabi lmekteyiz .
Exec sp Ornek 3
Exec sp Ornek2 3, 4, 'asd'


--Stored Procedures (Sakli Yordamlar)
--== Geriye Deger Döndüren Stored Procedure Yapis1 ==
Create Proc UrunGetir
(
@Fiyat Money
)As
Select from Urunler Where BirimFiyati @Fiyat
Return @ROwcount
--= Kullan ım1 -
Exec UrunGetir 40
--Bu sekilde geriye dönülen değeri elde etmeks izin kullan1labilir. Sıkınt1 olmaz.
Declare @Sonuc int
Exec@Sonuc UrunGetir 40
print CAST (@Sonuc as nvarchar (MAX) )+ 'adet ürün bu işlemden etkilenmiştir'



--Stored Procedures (Sakl1 Yordamlar)
--= Output fle Değer Döndürme
Create Proc sp_Ornek3
(
@Id int,
GAdi nvarchar (MAX) Output,  --dısarıya deger gondere bılırler
@SoyAdi nvarchar (MAX) Output
)As
select@Adi = Adi, @SoyAdi = SoyAdi from Personeller Where PersonelID=@Id
--== Kullanimi
Declare @Adi nvarchar (MAX), @SoyAdi nvarchar (MAx)
Exec sp Ornek3 3, BAdi Output, @soyAdi Output   --outputalra boyle deger gonderılır
Select @Adi+
+@SoyAdi


-- Stored Procedures (Sakli Yordamlar)
--= Genel örnek ==
--D1saridan aldig isim, soyisim ve sehir bilgilerini Personeller tablosunda ilgili
--kolonlara ekleyen Stored Procedure'ü yazın1z.
Create Proc sp _PersonelEkle
(
@Ad nvarchar (MAX),
@SoyAd nvarchar (MAx),
@sehir nvarchar (MAX)
)As
Insert Personeller (Adi, SoyAdi, Sehir) Values (@Ad, @SoyAd, @sehir)
Exec sp_PersonelEkle 'Gençay', 'Yildiz ', 'Artvin'
Select * from Personeller


--Stored Procedures (Sakli Yordamlar)
-- == Parametrelere Varsay1lan Değer --
Create Proc sp_PersonelEkle2
@Ad varchar (50) = 'isimsiz ',
@SoyAd varchar (50) ='Soyads 1z',
@Sehir varchar (50) ='Sehir girimemiş'
as
Insert Personeller (Adi, SoyAdi, Sehir) values (@Ad, @SoyAd, @sehir)
Exec sp_PersonelEkle2 "Gökhan', 'Aşker", 'Hatay'
-- Burada varsayllan değerler devreye girmemektedir.
Select from Personeller
Exec sp_PersonelEkle2
-- Normalde bu sekilde parametrelere değer göndermeks izin çalişmamas1 lazım ama
--varsayllan degerler tanımda belirtildiği için devreye girmektedirler.
Exec sp_PersonelEkle2 'tbrahim'
--@Adi parametresi "Ibrahim" değerini alacaktır. Diğer parametreler varsay1lan degerleri.


-- Exec Komutu
Exec('Select from Personeller')
Select * from Personeller

--Yanlis Kullanım 
--2 exec bırbırınden farklıdır
Exec('Declare @Sayac int = 0')
Exec('print @Sayac ')

-- Doğru Kullanım
Exec( 'Declare @Sayac int 0 print @Sayac')


--Stored Procedures (Saklı Yordamlar)
--=qtored Procedure Içerisinde Nesne 0Olusturma ==
Create Proc sp_Tablo0lustur
(
@TabloAdi nvarchar (MAX),
@Kolon1Adi nvarchar (MAX)
@Kolon10zellikleri nvarchar(MAX),
@Kolon2Adi nvarchar (MAX),
@Kolon20zellikleri nvarchar (MAX)
)As
Exec
( '
 Create table '+ @TabloAdi + '
(
    '+@Kolon1Adi'+' '+ @kolon1ozelıklerı',
    '+@kolon2adi'+' '+'+kolon2ozellıklerı'
)
'')
Exec sp_Tablo0lustur 'OrnekTablo', 'Id', 'int primary key identity (1, 1)', 'Kolon2','nvarchar (MAX)'


