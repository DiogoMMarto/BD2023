USE PFinal
GO

CREATE PROCEDURE addPayload
	@CraftID INTEGER,
	@MissionID INTEGER,
	@CrewID INTEGER=NULL,
	@RoverID INTEGER=NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO Payload(Craft_ID,Mission_ID,Crew_ID,Rover_ID)
			VALUES
				(@CraftID,@MissionID,@CrewID,@RoverID)
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
