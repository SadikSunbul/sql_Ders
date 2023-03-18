--View Yapısı

--****Kullanım Amacı
--Genelde Karmasık sorguların tek bır sorgu uzerınden calıstırılabılmesı 
--bu amacla raporlama ıslemlerı kullanılabılır
--Aynı zamanda guvenlık ıhtıyacı oldugu durumlarda herhangı bır sorgunun 2.-3. sahıslardan gızlenmesı amacı ıle de kullanıla bılırler

-- == Genel Ozellıklerı ==
--Herhangı bır sorgunun sonucunu tablo olarak ele alıp ondan sorgu ceke bılmesını saglar
--INSERT update delete yapılabılır bu ıslemler fızıksel tabloya yansıtılır ***onemlıı
--ViewYapıları fızıksel olarak olusturulan yapılardır 
--Wiev yapıları normal sorgulardan daha yavas calısırlar

--Dikkat!!
--DataBase elemanlarını create komutu ıle olusturuluyorduk . View yapısı bir database yapısı oldugu ıcın create komutu ile olusturacagız


/*
CREATE View vw_Gotur
AS
SELECT p.Adi+' '+p.SoyAdi,k.KategoriAdi [Adı Soyadı],COUNT(s.SatisID) [Toplam Satıs] 
from Personeller p INNER JOIN Satislar s 
on p.PersonelID=s.PersonelID
            INNER JOIN [Satis Detaylari] sd on s.SatisID=sd.SatisID 
            INNER join Urunler u on sd.UrunID=u.UrunID
            INNER JOIN Kategoriler k on k.KategoriID=u.KategoriID
GROUP by p.Adi+' '+p.SoyAdi,k.KategoriAdi            

SELECT * from vw_Gotur
SELECT * from vw_Gotur WHERE [Adı Soyadı] LIKE '%Robert%'
*/


--order by kullanmak ıstıyorsak top komuut kullanılmalıdır

-- ==With Encryption komutu =  --> kaynak koduna ulasılamaz
--Eğer yazdıgımız vıev ın kaynak kodlarını object Expolorer penceresınde "Views" kategorısıne sağ tıklıyarak desıgn modda acıp goruntulenmesını ıstemıyorsak "With Encreptıon" koomutu ıle vıew olusturmalıyız
--Dikatt!!
--With Encreyption ıslemınden sonra view ı olusturan kısıde dahıl kımse goremmez Geri donus yoktur Ancak View i olusturan Sahsın komutların yedegını bulundurması gerekmektedır Ya da with encryptıon olmaksızın view yapısını yenıden alter lamalıyız
--Dikkat !!
--Bir dıkat etmemız gereken nokta da With Encryptıon ıfadesı  as keyvordunden once yazmalıyız

create VIEW ornekViewPersoneller
WITH encryption
As
SELECT Adi,SoyAdi,Unvan  from Personeller
--Bu işlemi yaptıktan sonra desıgn modu kapatılmıstır

-- == With Schemabinding Komutu
--Eğer View ın kullandıgı esas fızıksel tabloların kolon ısımlerı bır sekılde degıstırılır , kolonları sılınır ya da tablo yapısı bır sekılde degısıklıge ugrarssa vıew ın calısması artık mumkun olmıycaktır 
--view ın kullanıldıgı tablolar ve komutlar bu tarz ıslemler yapabılmesı ıhtımalıne karsı koruma altına alınabılır 
--Bu koruma With Schemabinding komutu ıle yapılabılır
--With Schemabinding ile view create ya da alter edılırken viewşn kullandıgı tablo schema adıyla bırlıkte verılmelıdır ornegın dbo(Database owner) bir sema adıdır Şemalar C# dakı namespaceler gıbı dusunule bılır
--With Schemabinding Komutu As keyvordunden once yazılmalıdır 

CREATE Table OrnekTablo
(
    Id int PRIMARY key IDENTITY,
    kolon1 NVARCHAR(max)
)

CREATE View OrnekView
With Schemabinding 
AS
SELECT Id,kolon1 from OrnekTablo
alter TABLE OrnekTablo
ALTER COLUMN Kolon1 int

-- ==With Check Option Komutu==
--Viewin icerisindeki sorguda bulunan sarta uygun kayıtların ınsert edılmesı musade edılıp uymayan kayıtların musade edılmesını saglayan bır komuttur 

CREATE view ornekview2
as
SELECT Adi,SoyAdi from Personeller WHERE Adi LIKE 'a%'

Insert ornekview2 VALUES('Ahmet','Bılmemne')
Insert ornekview2 VALUES('Sadık','Sunbul')

select * from ornekview2

--With Encrypion ve with schemabındıng komutları as keyvordunden once belırtılırken With Check Option Komutu where sartından sonra belıtılır

CREATE VIEW ornekview2
as
select Adi,SoyAdi from Personeller where adi LIKE 'A%'
WITH CHECK OPTION