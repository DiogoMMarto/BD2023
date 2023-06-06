USE PFinal
GO

CREATE PROCEDURE addLaunchToSpacecraft 
	@Veh_ID INTEGER,
	@Launch_ID INTEGER	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO LaunchHasSpacecraft( Craft_ID , Launch_ID)
					VALUES
						(@Veh_ID , @Launch_ID)
			
			DECLARE @Mission_ID INTEGER;
			Select @Mission_ID = Mission_ID from Launch 

			IF NOT EXISTS ( SELECT * FROM Payload where Craft_ID=@Veh_ID and Mission_ID = @Mission_ID)
			BEGIN
				INSERT INTO Payload ( Mission_ID , Craft_ID )
					VALUES ( @Mission_ID , @Veh_ID)
			END
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
