--Functioms -Scalar Function -Inline Function 

--T-SQL de iki tip fonksıyon varsır
--Scalar fonklar = gerıye ıstedıgımızı bır tıpete deger gonderen fonksıyon
--Inline Fonksiyonlar =gerıye tablo gonderen fonksıyon

--Bu her ıkı fonksıyonda fızıksel olarak verıtabanında olusturulmalıdırlar 
--Create komutu ıle olusturulmaktadır
--Üzerinde  calısılan database ın Programmability -> functıons kombınasyonundan olusturulan fonksıyonlara erısebılmekteyız

--== 1. Scalar Function =
--= Fonksiyon Tanimlama ==
--Scalar fonksiyonlara tanamlanda kt an sonra Programmabi l ity -> Functions > Scalar-
--valued Functions kombinasyonundan erişilebilir.
Create Function Topla(@Sayi1 int, @Sayi2 int) Returns int
As
Begin
return @Sayil+@sayi2
End

--=Fonksiyon Kullanım1
--Fonksiyonu kullanirken semaslyla beraber çağrılImalidir.
Select dbo. Topla (2, 5)
print dbo. Topla (10, 20)
--örnek
--"Northwind" veritabanında; herhangi bir ürünün %18 KDV dahil olmak üzere toplam
--maliyetini getiren fonksiyonu yazalım.
Create Function Maliyet (@BirimFiyati int, @StokMiktari int) Returns nvarchar (MAx)
As
    Begin
        Declare @Sonuc int @BirimFiyati * @StokMiktari *1.18
        return@Sonuc
    End
Select dbo. Maliyet (10, 20)

---= 2. Inline Function=
--Geriye bir değer değil, tablo gönderen fonksiyonl ardır .
-- Geriye tablo göndereceği için bu fonks iyon lar caliştirılırken sanki bir tablodan
--sorgu çalıştırılir gibi çalıștirllirlar. Bu yönleriyle viewlara benzerler. View ile
--yap1lan işlevler Inline Functions 'larla yap1labilir.
-- Genellikle viewle benzer işlevler için View kullanılmas ın1 öneririm.
--Fonksiyon Tanımlama -
--Inline fonksiyonlara tanımlandıktan sonra Programmability -> Functions -Table-
--valued Functions kombinasyonundan erişilebilir.
-- Dikkat!!!
-- Inline Function oluşturulurken Begin End yapis1 kullan1 Imaz .
Create Function fc_Gonder (@Ad nvarchar (20),@Soyad nvarchar(20)) Returns Table
As
return Select Adi, Soyadi from Personeller Where Adi=@Ad and SoyAdi=@Soyad


-- == Fonksiyon Kullanım-
-- Fonksiyonu semasıyla birlikte çağırmak gerekmektedir .
Select from dbo.fc_Gonder ( 'Nancy', 'Davolio')


--== Fonksiyon larda With Encryption Komutu ==
-- Eğer ki yazmış olduğumuz fonksiyon ların kodlarına 2. 3. sahısların erişimini
--engellemek istiyorsak "with Encryption" komutunu kullanmally1z.
--With Encryption" işleminden sonra fonksiyonu oluşturan kişide dahil kimse
--komutlar1 göremez. Geri dönüş yoktur. Ancak fonksiyonu oluşturan şsahsin komutların
--yedeğini bulundurmas gerekmektedir . Ya da "with Encryption " olmaks1zın fonksiyonu
--yeniden alterl amal ly1z.
--"with Encryption" "As" keywordünden önce kullanı lmal 1dır.
Create Function OrnekFonksiyon() Returns int
With Encryption
As
    Begin
        return 3
    End
Create Function OrnekFonksiyon2() Returns Table
With Encryption
As
return Select * from Personeller


--= omatik Hesaplanabilir Kolonlar
--Herhangi bir kolonda fonksiyon kullan1larak otomatik hesaplanabilir kolonlar
--(Computed Column) oluşturmak mümkündür.

Create Function Topla(@Sayi1 int,@Sayi2 int) Returns int
 As
    Begin
        return @sayil+@Sayi2
    End
Select UrunAdi, dbo. Topla (BirimFiyati, HedefStokDuzeyi) HesaplanmisKolon from Urunler

--Computed Column ==
--örnek
--kategorisindeki
--Cikti olarak"
--seklinde bir çıktı veren fonks iyonu yazalım.
Create Function Rapor (@Kategori nvarchar(MAX) , @UrunAdi nvarchar(MAX) , @BirinFiyati
int@Stok int) Returns nvarchar(MAX)
As
    Begin
        Declare @cikti nvarchar (MAx) = @Kategori + 'kategorisindeki' +@UrunAdi +'
        ürününün toplam fiyatı :' + CAST (@BirinFiyati * @stok As nvarchar (MAX) ) +'
        dır. '
        return @cikti
    End
Select dbo. Rapor (k. KategoriAdi, u.UrunAdi, u.BirimFiyati , u.HedefstokDuzeyi ) from
Urunler u Inner Join Kategoriler k on u.KategoriID=k.KategoriID


