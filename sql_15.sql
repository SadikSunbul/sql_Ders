--Temporal Tables (system versioned Table - Zamansal Tablolar)

--Temporal tabes ozellıgını kullanırken nelere dıkat etmeliyiz!!

--Temporal Tables İle raporlama ve takip mekanızması olusturacagımız tablolarda prımary key tanımlanmıs bır kolon olması gerekmektedir . Bu şekilde yaşam döngüsünde hangi verinin değişime uğradığını bu primary key  aracılığıyla ayırt edebileceğiz
--Takibi sağlaacağımız ve kaydın tutacağımız tablomuzun içerisinden bir başkangıç (start date ) birde bitiş (end date) niteliğinde iki adet "Datetime2" tipinde kolonların bulunması gerekir
--Linked server uzerınden   temporal tables kullanılmaktadır
--History tablomuzda constraint yapılarının hiçbirini uygulayamayız
--Eğer bir tablosunda temporal tables  aktifse o tabloda Truncate işlemi gerçekleştiremiyoruz
--History tablosunda direkt olarak DML işlemleri gerçekleştiremiyoruz
--Temporal tables özelliği bulundugu bır tabloda computed column(Hesaplanmıs kolon ) tanımlayamıyoruz 


-- ==Temporal Tables olusturma 

CREATE TABLE DersKayıtları
(
    -----1.kısım-----
    DersId int PRIMARY key IDENTITY(1,1),
    Ders NVARCHAR(max),
    Onay bit,
    -----1.kısım-----

    -----2.kısım-----
    StartDate DATETIME2 generated always as row START not NULL,
    enddate DATETIME2 generated always as row END not null,
    -----2.kısım-----

    -----3.kısım-----
PERIOD for SYSTEM_TIME(StartDate,enddate)
    -----3.kısım-----
)
  -----4.kısım-----
WITH(system_versioning = on (History_Table =dbo.DersKayıtlarıLog)) -- eger History_Table özelliği ile hıstory tablosına isim vermezsek rastgele isimde oluşturulur

        -----4.kısım-----



--Var olan bır tablonun sonradan Temporal Tables Olarak Ayarlanamsı

CREATE TABLE Derskayıtalrı
(
    DesrId Int PRIMARY key IDENTITY(1,1),
    ders NVARCHAR(max),
    onay BIT
)

INSERT Derskayıtalrı VALUES('Matematik',1),
                            ('Fizik',1),
                            ('Kimya',1),
                            ('Türkçe',0),
                            ('Coğrafya',0),
                            ('Vatandaşlık',0)

--Eğer Bu tabloyu temporal yapmak ıstıyorsak dıkat !!
--Tablo ıcerısınde verı var mı? yok mu? eger varsa yenı eklenecek olan "startdate" ve "end date" kolonları bos kalmıyacakları ıcın varsayılan degerlerın belırlenmesı gerekmektedır .Yok eger verı yoksa bu ıslemi dusunmemıze gerek olmıyacaktır

--eger veri yoksa 
ALTER table Derskayıtalrı
ADD
startdate DATETIME2 GENERATed always as row START not null,
enddate DATETIME2 GENERATed always as row END not null,
PERIOD for SYSTEM_TIME(startdate,enddate)


--Eger verı varsa 
ALTER table Derskayıtalrı
ADD
startdate DATETIME2 GENERATed always as row START not null
DEFAULT CAST('1900-01-01 00:00:00.0000000' as Datetime2),
enddate DATETIME2 GENERATed always as row END not null
DEFAULT CAST('9999-12-31 23:59:59.9999999' as Datetime2),
PERIOD for SYSTEM_TIME(startdate,enddate)

--şeklinde periyodik kayıt komutalrınmızı eklıyebılırız 

--Kolonlar eklendıkden sonra ılgılı tablo asagıdakı gıbı temporal hale getırılır
ALTER TABLE Derskayıtalrı
set (system_versioning=on (History_Table=dbo.DersKayıtlarıLog))  -- burayı yazmayınca hıstory tablosu olusmaz 


--==History Tablosuna ozel temporal tabloyu sorgulama ==

--select * from Derskayıtalrı dk INNER JOIN Derskayıtalrılog dkl on dk.DesrId=dkl.DersId where day (dkl.startdate)>=DAY(CAST('Tarih' as datetime2)) or day (dkl.enddate)<=DAY(CAST('2016-09-26 06:23:45.8195851'as datetime2))

--Bu sekılde ılıskısel tablolar ıle sorgulama yapabılırız lakın tablomuzu hıstory tablosunun perıyoduna ozael bır sekılde de rahatca sorgulayabılmekteyız

--==As Of <datetime>==
--mantıksal sorgusu : 'startdate >=datetime and enddate<datetime ' seklındedır 

select * from Derskayıtalrı
for SYSTEM_TIME as of '2016-09-26 06:22:53.5432528'
where DesrId=3

--=From <start_datetime> to <end_datetime> ==
--Mantıksal sorgu 'start_datetime>=datetine and end_datetime<datetime seklınde

SELECT * from DersKayıtları
for SYSTEM_TIME from '325153246' to '13466654537'
WHERE DersId=3

--tEMPORAL tabloları lıstelemek ıstıyorsanız

