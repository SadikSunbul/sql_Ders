

--select 
select 3  --3 verır 

select 'Sadık'  --sadık yazar
PRINT 'sadık' --buda metın olarak getırır tablo olmaz burada

select 'Sadık','Sünbül',25

SELECT * from Personeller --personeller tablosunuu getırı * tum colonları getırı

--Alias Atama

select 3 as Değer

SELECT Adi as İsim,SoyAdi soyisim from Personeller  --colon ısımlerını degıstırırz 

SELECT 1453 [İstanbulun Fethi]  --Isımlerı yzarken bosluk kulancaksak koselı parantez kullanılcak

--kolonları bırlestırme

select Adi+' '+SoyAdi from Personeller

--farklı tıpte kolonları bırlestırme 

SELECT Adi+' '+convert(nvarchar,IseBaslamaTarihi) from Personeller  --tarıhı strınge cevırdık  farklı turlerı bırlestıremezsın 

SELECT Adi+' '+cast(IseBaslamaTarihi as nvarchar) from Personeller 


--Where komutu sart koymamızı saglar 

SELECT * from Personeller WHERE Sehir='London'  --sehrı london olanları getır dedık 

SELECT * from Personeller where Sehir='London' and Ulke='UK'  -- ve 

SELECT * from Personeller WHERE UnvanEki='Mr.' or Sehir='Seattle'    --veya dedık burada 

SELECT * from Personeller WHERE DAY(DogumTarihi) <>29 --dogum gunu ayın 29 olmayan personellerı getır dedık 

--Betwen komutu   arasında demek

select * from Personeller where YEAR(DogumTarihi) BETWEEN 1950 and 1965   --dogum yılı 1950 ıl3 1960 arasında olanalrı getırır


--in komutu

 SELECT * from Personeller where Sehir in('London','Tacoma')   --parantez ıcerısındekılere or yapmıs gıbı olur burası 

--Like sorguları 

select * from Personeller where Adi like '%j'  --sonu j olan 

select * from Personeller where Adi like 'a%'  --bas harfı a olanları getırır

SELECT * from Personeller where Adi like '%a%'  --icerisinde a ıcerenlerı getırır

SELECT * from Personeller where Adi like 'a_b%' --bası a_b olan 2. harf onemlı degıl 1. harf a 3. harfı b olanı getır dedık sonuda onemsız 

select * from Personeller WHERE Adi like 'a%an%' -- bası a olup ıcerısnde an gecen ler 


--[] yada mantıgı getırr bıze 

select * from Personeller where Adi LIKE '[abc]%'  -- bas harfı a veya b veya c olarak getır sonrası onemlı degıl 

--[a-k] a ile k arasında alfabetık sıraya gore olan tum harflerı belırtır 

select * from Personeller where Adi like '%[a-k]%' --icerısınde a ıle k arasındakı harflerı olanları lıstele dedık 


select * from Personeller WHERE Adi LIKE '[^a]%'  -- bas harfı a olmayan sonuda onemlı olmayanları getır dedık 

select * from Personeller WHERE Adi LIKE '[^an]%' -- bası  an olmayan sonuda onemlı olmayanları getır dedık 

--escape kaçıs
-- verılerımızın ıcerısınde %,_,[], gıbı ozel ısaretler var ıse sorgualama esnasında hata ıle karsılasmamak ıcın escape karakterlerı kullanırızı 

--mesela adı _sadık aratırken ılk harfı _ olan kısıyı getı r dedık 

select * from Personeller WHERE Adi LIKE '[_]%'  -- bas harfı _ olanı getırı burası

SELECT * from Personeller where Adi like 'ü_%' Escape 'ü'  -- burada ü kacıs karakterı 