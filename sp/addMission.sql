USE PFinal
GO

CREATE PROCEDURE addMission
	@Budget money,
	@Description varchar(400),
	@beg_date date,
	@Conc_date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO Mission(Budget,[Description],Beg_Date,Conc_date)
			VALUES
				(@Budget,@Description,@beg_date,@Conc_date)
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
			END 
	END CATCH
END
GO
