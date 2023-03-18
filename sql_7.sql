--Bir tablonun Primary Key olup olmadıgını kontrol etmek ıcın 

select OBJECTPROPERTY(OBJECT_ID('Personeller'),'TableHasPrimaryKey') --1. parametre hengı tablo 
--1 donerse pk var der 0 donerse bu tabloda pk yo der

--*********************************************************
--DDL (Data Defination Language)
--Tsql de veritabanı nesnelerı yaratmamızı saglayan ve bu nesneler uzerınden değişiklikler yapmamızı ve sılmemızı saglayan yapılar bu baslık altında sımgelemektedir

--Create ,Alter ,Drop

-- ===Create===
--veri tabanı nesnesı yaratmamızı saglar (Database,Table,View,Storedproc,trigger vs.)

--Prototipi
--Creatae [Nesne] [Nesne Adi]

--=Create ile database olusturma 
Create DATABASE ornekverıtabanı
--bu sekılde kullanım varsayılan ayarlarda verı tabanı olusturucaktır

Create DATABASE ornekverıtabanı1
on(
    name='GG',
    FILENAME='d:\gg.mdf',
    SIZE=5,
    filegrowth=3
)
-->Name: Olustruulacak verı tabann fızıksel ısmını belırtıyoruz 
-->Filename:olusturulacak verıtabanının dosyasının fızıksel dızınını belırtıyoruz 
-->size:Veri tabnının baslangıc boyutunu mb cınsınden ayarlıyoruz 
-->Filegrowth :Veritabını bouyutunun baslangıc boyutunu gectıgı durumda boyutunu ne kadar artması gerektıgını mb cınsınden belırtıyoruz

-- =Create log dosyaysıyla bırlıkte database olusturma 

CREATE DATABASE ornekverıtabanı
on(
    NAME='GG',
    FILENAME='D:\GG.mdf',
    SIZE=5,
    Filegrowth=3
)
log
on
(
NAME='GG_LOG',
FILENAME='D:\GG.ldf',
SIZE=5,
filegrowth=3
)

--Create ile tablo olusturma 
use ornekverıtabanı   -- bu verı tabanını ustunden calısalım dedık olu8san tablolar bunun uzerınde olusacaktır
CREATE Table ornektablo
(
    kolon1 int Primary Key IDENTITY(1,1), --burada otomatık bır sekılde ıd ozellıgı 1 den baslıyarak 1 1 artıcak 
    [kolon 2] NVARCHAR(50),
    kolon3 money
)
 
 -- =Alter=
 --Create ile yaratılan verıtabanı nesnelerınde degısıklık yapmamızı saglar

 --=Alter ile databse guncelleme

 --Prototıp
 --Alter [Nesne] [Nesne Adi]
 --(Yapıya gore ıslemeler)

 ALTER DATABASE ornekverıtabanı
 MODIFY FILE
 (
     NAME='GG',  --ismi GG olnda sizesini 20 byt yap dedık 
     SIZE=20
 )
--tabloya kolon ekleme
 Alter table ornektablo
 ADD kolon4 NVARCHAR(max)
--kolonu guncelleme
ALTER table ornektablo
ALTER COLUMN kolon4 INT
--tablodakı kolonu sılme
Alter TABLE ornektablo
DROP COLUMN kolon4

--Alter ile consraint ekleme
ALTER TABLE ornektablo
add CONSTRAINT ornekconsraınt default 'bos' for kolon2
--Alter ile consraint silme
ALTER TABLE ornektablo
drop CONSTRAINT ornekconsraınt 

-- Sp_Rename komutu , tablo adı guncelleme
Sp_Rename 'ornektablo','OrnekTabloYeni'  --1. parametredekı adı 2. parametre ıle degıstırıcektır
-- Sp_Rename komutu , colon adı guncelleme
Sp_Rename 'ornektablo.colon1','colon1453','Colum'  --burada 3. paremetreye bunlar bır colon calısaması dıyoruz

--==Drop==

--crete ile olustrurlan verıtabanı nesnelerını sılmemıze yarar

--Prototıp
--Drop [Nesne] [Nesne Adi]

DROP TABLE ornektablo
DROP DATABASE ornekveritabanı


