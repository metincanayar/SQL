CREATE PROCEDURE sp_Yas

   @SatisId AS INT,
   @MusteriId AS INT,
   @TurId AS INT,
   @Yas AS INT
)
AS
BEGIN
	
    SET @SatisId = (SELECT SatisId FROM Satis WHERE SatisId=@SatisId)
    SET @MusteriId = (SELECT MusteriId  FROM Satis WHERE SatisId=@SatisId)
	SET @TurId = (SELECT TurId FROM Satis WHERE SatisId=@SatisId)
	SET @Yas = (SELECT DATEDIFF(YEAR,M.DogumTarihi,GETDATE()) AS Yas
	            FROM Satis S
	            JOIN Musteri M
	            ON S.MusteriId = M.MusteriId
	            JOIN Tur T
	            ON S.TurId = T.TurId
	            WHERE S.MusteriId = @MusteriId )

       IF(@Yas)>60
	     BEGIN
	     UPDATE Fatura
	     SET FaturaToplam = FaturaToplam * 0.85
	     WHERE SatisId = @SatisId
	     END	
	   ELSE
	     BEGIN
	     UPDATE Fatura
	     SET FaturaToplam = FaturaToplam
	     WHERE SatisId = @SatisId
	     END
END