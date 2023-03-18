--Constraintler (Kısıtlamaar)
--Constraıntler sayesınde uzerınde ıstedıgımız sartlar ve durumlara gore kısıltlamalar yapabılıyoruz

--1.Default Constraınt
--2.Check constraint
--3.PrimaryKey Constraınt
--4.Unique Constraınt
--5.ForeignKey Constraınt

-- =Default Constraınt =

--Default constraınt sayesınde kolona bır deger ırılmeıdgı takdırde varsayılan olarak ne gırılmesı gerektıgını belırtırız

--Genel Yapısı;
--Add constraınt [constraınt adı] default 'varsayılan deger ' for [kollon adı]

CREATE TABLE ornektablo
(
    Id int PRIMARY key IDENTITY(1,1),
    kolon1 NVARCHAR(max),
    kolon2 INT
)
ALTER TABLE ornektablo
add CONSTRAINT kolon1constraınt DEFAULT 'Boş' for kolon1  --ornek tablodakı kolon 1 ın default degerıne bosu ata dedık burada 

alter table ornektablo
add CONSTRAINT kolon2constraınt DEFAULT -1 kolon2

Insert ornektablo(kolon2) VALUES(0)
insert ornektablo(kolon1) VALUES('Ornek bır deger')


--==Chack constraint
--bır kolona gırılecek olan verılerın belırlı bır sarta uymasını zorunlu tutar

--Genel yapısı ;
--Add Constraint [constreınt adi] Check (şart)

alter TABLE ornektablo
ADD CONSTRAINT kolon2kontrol Check ((kolon2-5)%2=0)

--Dikkat!!
--check control olusturulmadan  once ılgılı tabloda sarta aykırı degerler varsa eger constraınt olusturulmıycaktır 
--Ancak oncekı kayıtları gormezdedn gelıp genede check constraıntı uygulamak ıstıyorsak " With Nocheck "komutu kullanılmalıdır

--with nocheck komutu
--suana kadar olan kayıtları gormezden gelıp, check constraınti uygulatır
ALTER TABLE ornektablo
WITH NOCHECK add CONSTRAINT kolon2kontrol CHECK((kolon2-5)%2=0)
--burdan sonra gelıcek verılerde hata verır oncekılere bakmaz

--===Primary Key Constraint 
--Primary key constraınt ıle; o kolona eklenen primary key ile , başka tablolarda feroıgn key ılıskısı kurammısız mumkun olur.
--Bunun yanında o kolonun tasıdıgı verılerın tekıl olacagı da garantı edılmıs olur . Prımary Key constraınt ıle oyrıca clustered ındex olusturmus da olu8ruz

--Genel Yapısı:
--Add constraınt [Constraınt adi] Primary kEY (KOLON ADI)

--Dikkat !!!
--primary key constraınt kullanulan kolon primary key odelllıgıne sahıp olmalıdır

ALTER TABLE ornektablo
ADD CONSTRAINT primaryID PRIMARY key (Id)

--Unıque constraınt 
--Tek amacı belırtıgımız kolondakı degerlerı tekıl olmasını sagalmaktır tekrar eden degerlerı almaz 

--genel Yapısı:
--Add Constraınt [Constraınt adi] Unique (kOLON aDİ)
ALTER TABLE ornektablo
ADD CONSTRAINT ornektabloconstraınt UNIQUE (kolon2)

--"Kolon2" kolonua unıque constraınt verılerek tekıl gale getırılmıstır bundan sonra ikitane aynı verdıden kayıt yapılmamaktadır

--==Foreign key constraınt 

--Tabloların kolonları arasında ılıskı kurmamızı saglar bu ılıskı netıcesınde foreıgn key olan kolondakı karsılıgını bosa dusmemesı ıcın peımary key kolonu olan tablodan verı sılinmesini guncellenmesını engeller

--Geel yapsıı;
--Add Constraınt [constraınt adı] Foreign Key (Kolon Adı) referances [2.Tablo adı](2.tablodakı kolon adı)

CREATE TABLE ogrencıler
(
    ogrenciId INT PRIMARY KEY  IDENTITY(1,1),
    DersId int,
    adi NVARCHAR(max),
    soyadi NVARCHAR(max)
)

CREATE TABLE Dersler
(
    DersId int PRIMARY Key IDENTITY(1,1),
    dersAdi NVARCHAR(max)
)

ALTER TABLe ogrencıler
add CONSTRAINT foreıgnkeyogrencıders FOREIGN key (DersId) REFERENCES Dersler(DersId)

--==foreign key constraınt 
--==Cascade
--Ana tablodakı kayıt sılındıgınde ya da guncellendıgınde ılısklı kolondakı karsılıgında otomatık olarak sılınır ya da guncellenır 

Alter TABLE ogrencıler
Add CONSTRAINT foreıgnKeyOgrencıDers FOREIGN key (DersId) REFERENCES Dersler(DersId)
on delete CASCADE
on UPDATE CASCADE

--set null komutu 

Alter TABLE ogrencıler
Add CONSTRAINT foreıgnKeyOgrencıDers FOREIGN key (DersId) REFERENCES Dersler(DersId)
on delete SET null
on UPDATE SET null


--set default komutu

Alter TABLE ogrencıler
Add CONSTRAINT foreıgnKeyOgrencıDers FOREIGN key (DersId) REFERENCES Dersler(DersId)
on delete SET DEFAULT
on UPDATE SET DEFAULT  --ılgılı kolonın defaltunu verır  default deger verıde tutulmalıdır olmıyan bıseyı verezsınız



