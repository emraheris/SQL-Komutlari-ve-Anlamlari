/* *** EN ÇOK KULLANILAN TEMEL SQL KOMUTLARI VE ANLAMLARI *** */

=> SELECT KOMUTU (Bir veritabanındaki tablolardan veri seçmek ve listelemek için kullanılan en temel sorgu komutudur)
SELECT * FROM Musteriler /* Müşteriler tablosundaki tüm verileri gösterir */
SELECT MusteriAdi FROM Musteriler /* Müşteriler tablosundaki MusteriAdi sütunundaki verileri gösterir */
----------------------------------------------------------------------------------
=> DISTINCT KOMUTU (Bir sorgu sonucunda tekrar eden (yinelenen) satırları ortadan kaldırarak yalnızca benzersiz (farklı) değerleri listelemek için kullanılır)
SELECT DISTINCT Sehir FROM Musteriler /* Müşteriler tablosunda Sehir sütunundaki aynı tekrarlanan verileri göstermez, sadece farklı olanlar listelenir. */
----------------------------------------------------------------------------------
=> TOP KOMUTU (Bir sorgudan döndürülen satır sayısını veya yüzde oranını sınırlamak için kullanılır)
SELECT TOP 5 * FROM Musteriler /* Müşteriler tablosundaki ilk 5 kaydı gösterir */
----------------------------------------------------------------------------------
=> ORDER BY KOMUTU (Bir sorgudan dönen sonuç kümesini bir veya birden fazla sütuna göre artan veya azalan sırada sıralamak için kullanılır)
SELECT * FROM Musteriler ORDER BY MusteriAdi /* Müşteriler tablosundaki MusteriAdi sütununu A'dan Z'ye sıralar */
SELECT MusteriAdi FROM Musteriler ORDER BY MusteriAdi /* Müşteriler tablosundan sadece MusteriAdi sütununu gösterir ve o sütunu A'dan Z'ye sıralar */
----------------------------------------------------------------------------------
=> ORDER BY DESC KOMUTU (Bir sorgu sonucundaki verileri büyükten küçüğe (sayılarda en büyükten en küçüğe, harflerde Z'den A'ya) sıralamak için kullanılır)
SELECT * FROM Satislar ORDER BY NakliyeUcreti DESC /* Satislar tablosundaki NakliyeUcreti sütunundaki verileri büyükten küçüğe doğru sıralar */
----------------------------------------------------------------------------------
=> ORDER BY ASC KOMUTU (Bir sorgu sonucundaki verileri küçükten büyüğe (sayılarda en küçükten en büyüğe, harflerde A'den Z'ye) sıralamak için kullanılır)
SELECT * FROM Satislar ORDER BY NakliyeUcreti ASC /* Satislar tablosundaki NakliyeUcreti sütunundaki verileri küçükten büyüğe doğru sıralar */
----------------------------------------------------------------------------------
=> WHERE KOMUTU (Veritabanından veri çekerken, güncellerken veya silerken belirli bir koşula uyan satırları filtrelemek için kullanılır.)
SELECT * FROM Personeller WHERE Sehir = 'Ankara' /* Personeller tablosundan şehri Ankara olan kişileri getirir.*/
SELECT * FROM Satislar WHERE BirimFiyati > 100 /* Satislar tablosundan Birim Fiyati 100'den büyük olan verileri getirir.*/
SELECT * FROM Satislar WHERE BETWEEN 150 AND 250 /* Satislar tablosundan Birim Fiyati 150 ile 250 arasındaki verileri getirir.*/
----------------------------------------------------------------------------------
=> AND ve OR KOMUTU (Veritabanından veri çekerken veya güncellerken birden fazla koşulu bir araya getirmek için kullanılan komutlardır. AND olunca tüm şartların sağlanması gerekir. OR olunca iki şarttan birinin sağlanması yeterlidir) 
SELECT * FROM Satislar WHERE (NakliyeUcreti > 300 AND NakliyeUcreti < 400) OR (NakliyeUcreti > 700 AND NakliyeUcreti < 800) /* Satislar tablosundan NakliyeUcreti sütunundaki 300 ile 400 ve 700 ile 800 arasındaki tüm verileri gösterir */
----------------------------------------------------------------------------------
=> IN ve NOT IN KOMUTU (IN: Bir sütundaki değerin girilen değerle eşleşmesini kontrol edip filtreleme yapar. IN NOT: Bir sütundaki değerlerin belirtilen bir liste veya alt sorgu içindeki değerlerden hiçbirine eşit olmadığını kontrol ederek sonuçları filtrelemek için kullanılır)
SELECT * FROM Satislar WHERE MusteriID IN('APPLE','SAMSUNG','HUAWEI') /* Belirtilen sütundaki sadece bu verileri listeler*/
SELECT * FROM Satislar WHERE MusteriID NOT IN('APPLE','SAMSUNG','HUAWEI') /* Belirtilen sütundaki bu veriler hariç kalan tüm verileri listeler*/
----------------------------------------------------------------------------------
=> CONCAT KOMUTU (İki veya daha fazla metin (string) ifadesini tek bir metin halinde birleştirmek için kullanılır)
SELECT (MusteriAdi,' ',Sehir) From Müsteriler /* Musteriler tablosundaki bu iki sütun tek bir tabloda gözükür*/
----------------------------------------------------------------------------------
=> AS KOMUTU (Sorgularda sütunlara veya tablolara geçici bir takma ad (Başlık) vermek için kullanılır)
SELECT (MusteriAdi,' ',Sehir) as [Müşteri Adı ve Yaşadığı Şehir] From Müsteriler /* Musteriler tablosundaki birleştirilen bu iki sütuna başlık formunda yazı yazmak için kullanılır*/
----------------------------------------------------------------------------------
*** SORGULARLA ARİTMETİK İŞLEMLER ÖRNEK ***
SELECT CONCAT(MusteriID,' ',NakliyeUcreti) AS [Müşteri ve Toplam Fiyat], NakliyeUcreti/10 AS [İndirim Miktarı], NakliyeUcreti - NakliyeUcreti / 10 AS [İndirimli Fiyat] FROM Satislar
Where NakliyeUcreti > 200
ORDER BY NakliyeUcreti DESC
----------------------------------------------------------------------------------
=> UPPER KOMUTU (Bir metin ifadesindeki veya sütundaki tüm küçük harfleri büyük harfe dönüştürmek için kullanılır)
SELECT MusteriAdi,UPPER(MusteriUnvani) as [Müşteri Ünvanı] FROM Musteriler
----------------------------------------------------------------------------------
=> LOWER KOMUTU (Bir metin ifadesindeki veya sütundaki tüm büyük harfleri küçük harfe dönüştürmek için kullanılır)
SELECT MusteriAdi,LOWER(MusteriUnvani) as [Müşteri Ünvanı] FROM Musteriler
----------------------------------------------------------------------------------
=> SQRT KOMUTU (Verilen pozitif bir sayının veya sayısal ifadenin karekökünü bulmak için kullanılan matematiksel bir işlevdir)
SELECT UrunAdi, SQRT(Fiyat) AS [Karekök Fiyat] FROM Urunler;
----------------------------------------------------------------------------------
=> AVG KOMUTU (Bir tablodaki sayısal bir sütunun aritmetik ortalamasını hesaplamak için kullanılan bir toplama fonksiyonudur)
SELECT AVG(NakliyeUcreti) AS [Ortalama Nakliye Ücreti] FROM Satislar
----------------------------------------------------------------------------------
=> SUM KOMUTU (Bir tablodaki sayısal sütuna ait değerlerin toplamını hesaplamak için kullanılan bir fonksiyondur)
SELECT SUM(GiderMiktari) FROM Satislar; /* Satışlar tablosundaki Gider Miktarı sütununun toplamını hesaplar */
----------------------------------------------------------------------------------
=> COUNT KOMUTU (Bir veritabanı tablosundaki satır veya kayıt sayısını bulmak için kullanılan bir toplama fonksiyonudur)
SELECT COUNT(*) FROM Personel; /* Personel tablosundaki toplam çalışan sayısını verir */
----------------------------------------------------------------------------------
=> MIN KOMUTU (Bir tablodaki seçilen sütunun en küçük (minimum) değerini bulmak için kullanılan bir fonksiyondur)
SELECT MIN(fiyat) AS [En Dusuk Fiyat] FROM Urunler;  /* Satışlar tablosundaki fiyat sütununun en minimum değerini verir */

SELECT MusteriID, NakliyeUcreti FROM Satislar
WHERE NakliyeUcreti = (SELECT MIN(NakliyeUcreti) from Satislar) /*Hem en düşük veriyi hem de o verinin kime ait olduğunu getirir*/
----------------------------------------------------------------------------------
=> MAX KOMUTU (Bir tablodaki seçilen sütunun en büyük (maksimum) değerini bulmak için kullanılan bir fonksiyondur)
SELECT MAX(fiyat) AS [En Yüksek Fiyat] FROM Urunler;  /* Satışlar tablosundaki fiyat sütununun en maksimum değerini verir */
----------------------------------------------------------------------------------
=> LIKE KOMUTU (Veritabanındaki tablolarda metin benzerliği veya kısmi arama yapmak için kullanılan bir WHERE koşulu operatörüdür)
Kullanım Örnekleri
LIKE 'a%': 'a' harfi ile başlayan kelimeleri bulur.
LIKE '%a': 'a' harfi ile biten kelimeleri bulur.
LIKE '%a%': İçinde 'a' harfi geçen kelimeleri bulur.
LIKE '_r%': İkinci harfi 'r' olan kelimeleri bulur.

SELECT MusteriAdi FROM Musteriler
WHERE MusteriAdi LIKE 'Maria Anderson'  /* Direkt aranan kaydı getirir. Birebir aynı yazılması gerekmektedir */

SELECT MusteriAdi FROM Musteriler
WHERE MusteriAdi LIKE 'Maria%'  /* Sonuna % koyulması Maria ile başlayan tüm kayıtları getirir */
----------------------------------------------------------------------------------
=> INNER JOIN KOMUTU (İki veya daha fazla tablodaki verileri aralarındaki ortak bir sütuna (genellikle bir ID alanına) göre birleştirerek sadece her iki tabloda da eşleşen satırları getiren bir komuttur)

ÖRNEK:
ogrenciler:
id	ad
1	Ahmet
2	Ayşe

notlar:
ogrenci_id	not
1		85
3		90

SELECT ogrenciler.ad, notlar.not FROM ogrenciler
INNER JOIN notlar
    ON ogrenciler.id = notlar.ogrenci_id;

Sonuç:
ad	not
Ahmet	85	(Çünkü Ahmet'in iki tabloda da eşleşen kaydı var. Ayşe'nin notu olmadığı için, notlar tablosundaki 3 numaralı kayıt da öğrencisi olmadığı için sonuçta görünmez.)

Kısaca:
Tablo A ─── INNER JOIN ─── Tablo B
              ↓
        Sadece kesişim

ON kısmı, tabloların hangi sütun üzerinden eşleştirileceğini belirtir.
----------------------------------------------------------------------------------
=> LEFT OUTER JOIN (Sol taraftaki tablonun tüm kayıtlarını getirir. Sağ tarafta eşleşen kayıt varsa onu da getirir; eşleşme yoksa sağ tablonun sütunları NULL olur.)
Örneğin:

ogrenciler
id	ad
1	Ahmet
2	Ayşe
3	Mehmet

notlar
ogrenci_id	not
1		85
3		70

Sorgu:

SELECT ogrenciler.ad, notlar.not FROM ogrenciler
LEFT OUTER JOIN notlar
    ON ogrenciler.id = notlar.ogrenci_id;

Sonuç:

ad	not
Ahmet	85
Ayşe	NULL
Mehmet	70

Burada ogrenciler sol tablo olduğu için bütün öğrenciler geldi. Ayşe'nin notlar tablosunda karşılığı olmadığı için notu NULL.
NOT: LEFT JOIN ile LEFT OUTER JOIN pratikte aynı şeydir. OUTER kelimesini yazmak zorunda değilsin.
----------------------------------------------------------------------------------
=> RIGHT OUTER JOIN (Sağ taraftaki tablonun tüm kayıtlarını getirir. Sol tarafta eşleşen kayıt yoksa sol tablonun sütunları NULL olur.)
Örneğin:

SELECT ogrenciler.ad, notlar.not FROM ogrenciler
RIGHT OUTER JOIN notlar
    ON ogrenciler.id = notlar.ogrenci_id;

Sonuçta notlar tablosundaki bütün kayıtlar garanti edilir.

RIGHT JOIN ve RIGHT OUTER JOIN de aynı anlama gelir.

!!! INNER JOIN ile farkı !!!
Üç JOIN'i şöyle düşünebilirsin:

-JOIN-		-Ne getirir?-
INNER JOIN	Sadece iki tabloda da eşleşenler
LEFT JOIN	Sol tablonun tamamı + sağdaki eşleşmeler
RIGHT JOIN	Sağ tablonun tamamı + soldaki eşleşmeler
----------------------------------------------------------------------------------
=> UNION KOMUTU (İki sorgunun sonuçlarını birleştirir ve tekrarlanan kayıtları kaldırır.)
Örneğin:

ogrenciler_2024
ad	bölüm
Ahmet	Bilgisayar
Ayşe	Elektrik

ogrenciler_2025
ad	bölüm
Mehmet	Bilgisayar
Ahmet	Bilgisayar

SELECT ad, bölüm FROM ogrenciler_2024

UNION

SELECT ad, bölüm FROM ogrenciler_2025;

Sonuç:

ad	bölüm
Ahmet	Bilgisayar
Ayşe	Elektrik
Mehmet	Bilgisayar

Ahmet iki tabloda da olmasına rağmen bir kez geldi.
----------------------------------------------------------------------------------
=> UNION ALL KOMUTU (Sonuçları birleştirirken tekrarları kaldırmaz.)

SELECT ad, bölüm FROM ogrenciler_2024

UNION ALL

SELECT ad, bölüm FROM ogrenciler_2025;

Sonuç:

ad	bölüm
Ahmet	Bilgisayar
Ayşe	Elektrik
Mehmet	Bilgisayar
Ahmet	Bilgisayar

Burada Ahmet iki kere görünüyor çünkü UNION ALL tekrar eden kayıtları da koruyor.
----------------------------------------------------------------------------------
=> INSERT INTO (SQL'de veritabanına yeni veri eklemek için kullanılır)

INSERT INTO ogrenciler (ad, soyad, yas)
VALUES ('Ayşe', 'Kaya', 21);

Bunun sonucunda:

id	ad	soyad	yas
1	Ahmet	Yılmaz	20
2	Ayşe	Kaya	21

NOT:Burada id sütununu belirtmedik çünkü id genellikle AUTO_INCREMENT / IDENTITY olarak otomatik oluşturulabilir.
----------------------------------------------------------------------------------
=> UPDATE (SQL'de mevcut verileri güncellemek/değiştirmek için UPDATE komutu kullanılır)

id	ad	soyad	yas
1	Ahmet	Yılmaz	20
2	Ayşe	Kaya	21
3	Mehmet	Demir	22

1 id'li kaydı değiştirelim;

UPDATE ogrenciler
SET ad="Orkun", soyad="Kökcü" yas = 25
WHERE id = 1;

Sonuç:
id	ad	soyad	yas
1	Orkun	Kökcü	25
2	Ayşe	Kaya	21
3	Mehmet	Demir	22
----------------------------------------------------------------------------------
=> DELETE (SQL'de veri silmek için DELETE komutu kullanılır.)

DELETE FROM Ogrenciler
WHERE OgrenciID = 5; (Bu komut, Ogrenciler tablosunda OgrenciID'si 5 olan kaydı siler.)

DELETE FROM Ogrenciler; (Tablodaki tüm kayıtları siler)

DELETE Urunler
WHERE UrunID BETWEEN 4 and 9; (Ürünler tablosundan 4 ile 9 arasındaki tüm kayıtları siler)
----------------------------------------------------------------------------------
=> CREATE TABLE (SQL'de sorgu ile tablo oluşturmak için CREATE TABLE komutu kullanılır)

CREATE TABLE Ogrenciler (
    OgrenciID INT PRIMARY KEY,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    Yas INT
);
----------------------------------------------------------------------------------
=> SORGU İLE TABLOYA SÜTUN EKLEME, ÇIKARMA / TABLO ADI DEĞİŞTİRME / TABLO DATABASE SİLME

-- Tabloya sütun ekleme --
ALTER TABLE Ogrenciler ADD Sinif nvarchar(10)

-- Tablodan sütun çıkartma --
ALTER TABLE Ogrenciler Drop Column Sinif 

-- Tablo sütun ismini değiştirme --
ALTER TABLE Ogrenciler RENAME COLUMN Ad TO Isim;

-- Tablo Silme --
DROP TABLE Ogrenciler;

-- Database Silme --
DROP DATABASE Okul;
----------------------------------------------------------------------------------
=> VIEW OLUŞTURMA (Sık kullanılan veya karmaşık sorguları sanki bir tabloymuş gibi kolayca kullanabilmek için)
Örnek
Ogrenciler tablosundan sadece 18 yaşından büyük öğrencileri gösteren bir View oluşturalım:

CREATE VIEW YetiskinOgrenciler AS SELECT OgrenciID, Ad, Soyad, Yas FROM Ogrenciler
WHERE Yas >= 18;

Daha sonra View'i normal bir tablo gibi sorgulayabiliriz:

SELECT * FROM YetiskinOgrenciler;

-- NOT: --
CREATE VIEW → View oluşturur.

AS → View'in hangi sorgudan oluşacağını belirtir.

View, verileri genellikle kendisi saklamaz; oluşturduğun sorgunun sonucunu gösterir.
----------------------------------------------------------------------------------
=> VIEW SİLME

DROP VIEW YetiskinOgrenciler;
----------------------------------------------------------------------------------
=> DECLARE KOMUTU (SQL'de bir değişken tanımlamak için kullanılır)

DECLARE @yas INT; (Burada @yas adında, INT türünde bir değişken oluşturulur.)

DECLARE @yas INT;
SET @yas = 20;

SELECT @yas; (Değişkene değer vermek için)

-- Neden kullanılır? --
DECLARE ile oluşturulan değişkenler, sorgu içerisinde geçici olarak değer tutmak için kullanılır.
----------------------------------------------------------------------------------
=> IF / ELSE IF YAPISI (Koşullara göre farklı işlemler yapmak için kullanılır.)

DECLARE @Ad nvarchar(20), @Soyad nvarchar(40), @Yas int, @Role nvarchar(10)
SET @Ad = 'İlhan'
SET @Soyad = 'Mansız'
SET @Yas = 25
SET @Role = 'admin'

if Role='Admin' and @Yas>=18
	printf @Ad + ' ' + @Soyad + ' ' + 'isimli yönetici sisteme giriş yaptı'
else if @Yas>=18
	printf @Ad + ' ' + @Soyad + ' ' + 'isimli kullanıcı sisteme giriş yaptı' 
else
	printf 'Sisteme giriş yapmaya uygun değilsiniz'
----------------------------------------------------------------------------------
=> CASE - WHEN - THEN - END

SELECT NakliyeUcreti,
(CASE
WHEN NakliyeUcreti>(SELECT AVG(NakliyeUcreti) FROM Satislar) THEN 'Ortalamanın Üstünde'
ELSE ' Ortalamanın altında'
END
)
FROM Satislar
ORDER BY NakliyeUcreti DESC
----------------------------------------------------------------------------------