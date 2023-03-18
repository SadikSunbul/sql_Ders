--Değişkenler

--Declare keywordü ile değişkenb tanımlama

--pROTOTİP;
--Declare @degosken adı degısken tıpı

--degısken tanımlama 
DECLARE @u INT

DECLARE @y NVARCHAR

DECLARE @z money

DECLARE @q int ,@t NVARCHAR

DECLARE @yas int=3 --ilk degerı verdık 

--deger atama

--set komutu dısarden verılen degrı yakalar
DECLARE @x INT
set @x =125    --ıkısını aynı anda cekıp calıstırılmalıdır degılse hata verıcektır 

declare @tarıh DATETIME


set @tarıh =GETDATE()

--degerlerı elde etme okuma

DECLARE @x INT
set @x =3
SELECT @x --degerı getırı

--degıskenlerle elde etmek verıyı
declare @adi NVARCHAR(max),@soyadı NVARCHAR(max)
select @adi=Adi,@soyadı=SoyAdi FROM Personeller where PersonelID=1

--1. sorgu sonucu satır sayısı 1 adet olmalıdır 
--2.kolonlardakı verılerın tıplerı ne ıse karsılıycak degıskenlerın tıplerı aynı olmalıdır 

SELECT @adi,@soyadı

--Batch Kavramı  -GO   parca parca boluyp calıstırıyor bagımsızlıları ayırır


CREATE DATABASE ornekDatabase
go
use ornekDatabase
go
CREATE DATABASE ornekTablo
(
    Id int PRIMARY key IDENTITY(1,1),
    kolon1 NVARCHAR(max),
    kolon2 NVARCHAR(max)
)

-- İf yapısı

--= : esıtse
--<> :esıt degılse
--< :kusuckse
--> :buyukse

--tek satırlık calısma

declare @ısım NVARCHAR(max)
set @ısım='Sadık'
If @ısım ='Sadık'
    PRINT 'Evet'
ELSE 
    PRINT 'Hayır'
-----------------------------------------------------------
    --Begin end yapısı (scope)  suslu parantez gıbı c# dakı {}
DECLARE @sayı1 int=3
declare @sayı2 int=5

If @sayı1<@sayı2
    BEGIN
        PRINT 'evet sayı 1 sayı 2 den kucuktur'
        SELECT @sayı1 [sayı 1],@sayı2 [sauı 2]
    END
ELSE
    BEGIN   
     PRINT 'evet sayı 1 sayı 2 den buyuktur'
        SELECT @sayı1 [sayı 1],@sayı2 [sauı 2]
    END


------------------------------------------
SELECT * from Musteriler WHERE Ulke='USA'

If  @@ROWCOUNT>0
    print 'Evet'
ELSE
    print 'Hayır'


--------------------------------------------
DECLARE @adi NVARCHAR(max)='Sadık',@soyadi NVARCHAR(max)='Sünbül'
SELECT * from Personeller WHERE Adi=@adi and SoyAdi=@soyadi

If @@ROWCOUNT>0
    print 'Evet Var'
ELSE    
    BEGIN
    PRINT 'Hayır Yok'
    INSERT Personeller(Adi,SoyAdi) VALUEs(@adi,@soyadi)
    END   

-- İf - Else İf - Else 

DECLARE @Ad NVARCHAR(max)='Sadık'
DECLARE @yaş INT=25

If @Ad='Mahmut'
    PRINT 'Evet Mahmut'
else IF @yaş>24
    print 'Evet Yası 24 den buyuk'    
ELSE
    print 'abc'    

--Exist fonk bosmu dolumu sorgular

If  EXISTS(select * from Personeller)
    print 'Dolu'
ELSE
    PRINT 'BOŞ'

--while dongusu 

-- while sart komut

DECLARE @sayac int=0

WHILE @sayac <100
BEGIN
PRINT @sayac
set @sayac=@sayac+1
END

--whıle dongusunde - Break komutu

declare @sayac1 int =0;
WHILE @sayac1<1000
BEGIN
PRINT @sayac1
SET @sayac1 =@sayac1+1
IF @sayac1 % 5=0  --5 e bolumundenkalan 0 ıse cık dedık 
BREAK
END

--while dongusu continue komutu

declare @sayac2 int =0

while @sayac2<1000
    BEGIN
        If  @sayac2 % 5=0
            BEGIN
                set @sayac2=@sayac2+1
                CONTINUE --bundan sonrakı komutlar ıslenmez
            end
        PRINT @sayac2
        set @sayac2=@sayac2+1
    END