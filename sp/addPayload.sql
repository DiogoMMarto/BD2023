USE PFinal
GO

CREATE PROCEDURE addPayload
	@CraftID INTEGER,
	@MissionID INTEGER,
	@CrewID INTEGER=-1,
	@RoverID INTEGER=-1

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 

		IF (@CrewID!=-1 AND @RoverID!=-1)
				INSERT INTO Payload(Craft_ID,Mission_ID,Crew_ID,Rover_ID)
				VALUES
					(@CraftID,@MissionID,@CrewID,@RoverID)
		IF (@CrewID!=-1 AND @RoverID=-1)
				INSERT INTO Payload(Craft_ID,Mission_ID,Crew_ID)
				VALUES
					(@CraftID,@MissionID,@CrewID)
			COMMIT 
		IF (@CrewID=-1 AND @RoverID!=-1)
				INSERT INTO Payload(Craft_ID,Mission_ID,Rover_ID)
				VALUES
					(@CraftID,@MissionID,@RoverID)
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
