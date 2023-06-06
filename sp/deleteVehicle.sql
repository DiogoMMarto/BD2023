USE PFinal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE deleteVehicle
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from Vehicle where Veh_ID = @id))
				RAISERROR('No such Vehicle.', 16, 1);

			delete from Vehicle where Veh_ID = @id

			delete from Rover where Veh_ID = @id

			delete from LaunchVehicle where Veh_ID = @id

			delete from SpaceCraft where Veh_ID = @id

			delete from SpaceProbe where Craft_ID = @id

			delete from CrewedSpaceCraft where Craft_ID = @id

			delete from Satelite where Craft_ID = @id

			delete from SpaceStation where Craft_ID = @id

			delete from Payload where Craft_ID = @id

			delete from LaunchHasSpacecraft where Craft_ID = @id

			UPDATE Module
			SET Craft_ID = null
			where Craft_ID = @id

			UPDATE Launch
			SET LaunchV_ID = null
			where LaunchV_ID = @id

		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
				PRINT ERROR_MESSAGE()
			END 
	END CATCH
END
GO
