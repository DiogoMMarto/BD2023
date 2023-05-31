USE PFinal
GO

CREATE PROCEDURE addMissionToProgram
	@MissionID INTEGER,
	@ProgramID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO ProgramHasMission(Prog_ID,Mission_ID)
			VALUES
				(@ProgramID,@MissionID)
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
