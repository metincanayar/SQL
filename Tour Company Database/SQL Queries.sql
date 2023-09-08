--En çok gezilen yer/yerler neresidir?
SELECT       
       B.BolgeAdi,
       COUNT(S.TurId) AS ZiyaretSayisi      
FROM Satis S
JOIN Tur T
ON S.TurId = T.TurId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
GROUP BY S.TurId,B.BolgeAdi
ORDER BY S.TurId DESC


--Aðustos ayýnda en çok çalýþan rehber/rehberler kimdir/kimlerdir?

SELECT 
       R.RehberAd,
	   R.RehberSoyad,
       COUNT(*) AS KayitSayisi
FROM Satis S
JOIN Rehber R
ON S.RehberId = R.RehberId
WHERE MONTH(S.TurTarihi)=08
GROUP BY R.RehberAd,R.RehberSoyad 
ORDER BY KayitSayisi DESC

/*Kadýn turistlerin gezdiði yerleri, toplam ziyaret edilme sayýlarýyla 
beraber listeleyin */

SELECT M.MusteriAdi,
       M.MusteriSoyadi,
	   M.Cinsiyet,
	   B.BolgeAdi,
	   SUM(B.BolgeId) AS ToplamZiyaretSayisi
FROM Satis S
JOIN Musteri M
ON S.MusteriId = M.MusteriId
JOIN Tur T
ON S.TurId = T.TurId
JOIN Bolge B
ON B.BolgeId = T.BolgeId
WHERE M.Cinsiyet='K'
GROUP BY M.MusteriAdi, M.MusteriSoyadi,M.Cinsiyet,B.BolgeAdi


--Ýngiltere’den gelip de Kýz Kulesi’ni gezen turistler kimlerdir?

SELECT 
       M.MusteriAdi,
       M.MusteriSoyadi,
       U.Ulke,
       B.BolgeAdi   
FROM Satis S
JOIN Tur T
ON T.TurId = S.TurId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
JOIN Musteri M
ON S.MusteriId = M.MusteriId
JOIN Ulke U
ON M.UlkeId = U.UlkeId
WHERE U.UlkeId=3 AND B.BolgeAdi='Kýz Kulesi' 

--Gezilen yerler hangi yýlda kaç defa gezilmiþtir?

SELECT DISTINCT YEAR(S.TurTarihi) AS Yil,
       B.BolgeAdi,
       SUM(S.TurId) AS ZiyaretSayisi	  
FROM Satis S
JOIN Tur T
ON S.TurId=T.TurId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
GROUP BY S.TurTarihi, B.BolgeAdi


/*2’den fazla tura rehberlik eden rehberlerin en çok tanýttýklarý 
yerler nelerdir? */

SELECT 
     R.RehberAd,
	 R.RehberSoyad,
     COUNT(*) AS TurSayisi,
	 B.BolgeAdi
FROM Satis S
JOIN Tur T
ON S.TurId = T.TurId
JOIN Bolge B
ON T.BolgeId =B.BolgeId
JOIN Rehber R
ON S.RehberId = R.RehberId
GROUP BY R.RehberAd, R.RehberSoyad, B.BolgeAdi
HAVING COUNT(*)>2
ORDER BY B.BolgeAdi ASC
     
--Ýtalyan turistler en çok nereyi gezmiþtir?

SELECT B.BolgeAdi	  
FROM Satis S
JOIN Tur T
ON S.TurId = T.TurId
JOIN Musteri M
ON S.MusteriId = M.MusteriId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
JOIN Ulke U
ON M.UlkeId = U.UlkeId
WHERE U.UlkeId=1 /* UlkeId 1 ise Italya'dan gelmiþ demektir */


--Kapalý Çarþý’yý gezen en yaþlý turist kimdir?

SELECT TOP 1 M.MusteriId, 
             M.MusteriAdi,
			 M.MusteriSoyadi,
			 M.DogumTarihi,
			 M.Cinsiyet
FROM Tur T
JOIN Bolge B
ON T.BolgeId = B.BolgeId
JOIN Satis S
ON S.TurId = T.TurId
JOIN Musteri M
ON M.MusteriId = S.MusteriId
WHERE B.BolgeAdi ='Kapalý Çarþý'
ORDER BY M.DogumTarihi ASC

--Yunanistan’dan gelen Finlandiyalý turistin gezdiði yerler nerelerdir?

SELECT M.MusteriAdi,
       M.MusteriSoyadi,
	   Uy.Uyruk,
	   U.Ulke,
       B.BolgeAdi
FROM Musteri M
JOIN Uyruk Uy
ON M.UyrukId = Uy.UyrukId
JOIN Ulke U
ON M.UlkeId = U.UlkeId
JOIN Satis S
ON M.MusteriId = S.MusteriId
JOIN Tur T
ON T.TurId = S.TurId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
WHERE Uy.UyrukId=3 AND U.UlkeId=2 /* UyrukId 3 ise Finlandiyalý, UlkeId 2 ise Yunanistan'dan geliyor */

--Dolmabahçe Sarayý’na en son giden turistler ve rehberi listeleyin.

SELECT M.MusteriAdi,
       M.MusteriSoyadi,
	   M.DogumTarihi,
	   M.Cinsiyet,
	   R.RehberAd,
	   R.RehberSoyad
FROM Musteri M
JOIN Satis S
ON M.MusteriId = S.MusteriId
JOIN Tur T
ON T.TurId = S.TurId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
JOIN Rehber R
ON S.RehberId = R.RehberId
WHERE B.BolgeAdi='Dolmabahçe Sarayý'
ORDER BY S.TurTarihi DESC

