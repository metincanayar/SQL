CREATE TRIGGER [dbo].[tr_Fatura_Insert] ON [dbo].[Satis]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @SatisId INT;
	DECLARE @BolgeId INT;
	DECLARE @BolgeUcreti INT;
	DECLARE @HizmetId INT;
	DECLARE @HizmetUcreti INT;
    DECLARE @MusteriId INT;
    DECLARE @FaturaId VARCHAR(20);
    DECLARE @FaturaToplam FLOAT;
	
    SELECT @SatisId = SatisId, @MusteriId = MusteriId, @BolgeId=BolgeId, @HizmetId=HizmetId FROM inserted;
	SELECT @HizmetUcreti=HizmetUcreti,@BolgeUcreti=BolgeUcreti FROM dbo.Bolge WHERE BolgeId= @BolgeId
    SELECT @FaturaId = 'FTR' + CONVERT(VARCHAR(20), GETDATE(), 112) + RIGHT('000' + CONVERT(VARCHAR(3), (SELECT COUNT(*) + 1 FROM dbo.Fatura)), 3)
    
	INSERT INTO dbo.Fatura (FaturaId, SatisId, MusteriId,FaturaTarihi,FaturaToplam)
    VALUES (@FaturaId, @SatisId, @MusteriId,GETDATE(),(@HizmetUcreti + @BolgeUcreti));
END
