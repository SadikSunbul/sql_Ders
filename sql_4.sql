--DML Giriş

--select Insert .Update .Delete


--Select

select * from Personeller

--Insert [Tablo adı] (kodlar) Values(Degerler)

Insert Personeller(Adi,SoyAdi) VALUES('Sadık','Sünbül')

INSERT Personeller VALUES (tum degerler buraya sırası ıle yazılmalı)


--[Dikat edılmesı gerekenler]
--Into komutu ıle yazılabılır  ---> bı ıse yaramaz 

Insert Into Personeller(Adi,SoyAdi) VALUES ('sadık','sünbül')   --verı eklerız burada

--pratık kullanım 
Insert Into Personeller(Adi,SoyAdi) VALUES ('sadık','sünbül') ,
                                            ('Taha','Hamıdıoglu'),
                                            ('Osman','Byraz')

--Insert komutu ıle select sorgusu sonucu gelen verılerı farklı tabloya kaydetme

insert verıeklenecektabloadı  SELECT Adi,SoyAdi from Personeller  --uyusmazlık olammalı 

select Adi,SoyAdi,Ulke INTO ornekpersoneller2 FROM Personeller   --burada ornekpersoneller2 adında bır tablo olusturup verılerı orada tutar


--Update [tablo adı] set [kolon adı]=değer

UPDATE Personeller set Adi ='Mehmet'  --herkesın adını mehmet yapar

UPDATE Personeller SET Adi='Mehmet' where Adi='Nancy'  --adı Nancy olanlar mehmet olur 

--bırden fazla tabloda aynı anda guncelleme yapma 
UPDATE Urunler SET UrunAdi=k.KategoriAdi from Urunler u 
INNER JOIN Kategoriler k on u.KategoriID=k.KategoriID

UPDATE Urunler set UrunAdi=(select Adi from Personeller where PersonelID=3 )

UPDATE top(30) Urunler SET UrunAdi='x'  --ılk 30 unun adını x yap dedık 


--DELETE from [Tablo adı]

DELETE from Urunler

DELETE from Urunler  where KategoriID<3  --KategoriID 3 ten kucuklerı sıl dedık
 