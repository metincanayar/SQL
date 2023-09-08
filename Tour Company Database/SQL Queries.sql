--En �ok gezilen yer/yerler neresidir?
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


--A�ustos ay�nda en �ok �al��an rehber/rehberler kimdir/kimlerdir?

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

/*Kad�n turistlerin gezdi�i yerleri, toplam ziyaret edilme say�lar�yla 
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


--�ngiltere�den gelip de K�z Kulesi�ni gezen turistler kimlerdir?

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
WHERE U.UlkeId=3 AND B.BolgeAdi='K�z Kulesi' 

--Gezilen yerler hangi y�lda ka� defa gezilmi�tir?

SELECT DISTINCT YEAR(S.TurTarihi) AS Yil,
       B.BolgeAdi,
       SUM(S.TurId) AS ZiyaretSayisi	  
FROM Satis S
JOIN Tur T
ON S.TurId=T.TurId
JOIN Bolge B
ON T.BolgeId = B.BolgeId
GROUP BY S.TurTarihi, B.BolgeAdi


/*2�den fazla tura rehberlik eden rehberlerin en �ok tan�tt�klar� 
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
     
--�talyan turistler en �ok nereyi gezmi�tir?

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
WHERE U.UlkeId=1 /* UlkeId 1 ise Italya'dan gelmi� demektir */


--Kapal� �ar���y� gezen en ya�l� turist kimdir?

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
WHERE B.BolgeAdi ='Kapal� �ar��'
ORDER BY M.DogumTarihi ASC

--Yunanistan�dan gelen Finlandiyal� turistin gezdi�i yerler nerelerdir?

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
WHERE Uy.UyrukId=3 AND U.UlkeId=2 /* UyrukId 3 ise Finlandiyal�, UlkeId 2 ise Yunanistan'dan geliyor */

--Dolmabah�e Saray��na en son giden turistler ve rehberi listeleyin.

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
WHERE B.BolgeAdi='Dolmabah�e Saray�'
ORDER BY S.TurTarihi DESC

