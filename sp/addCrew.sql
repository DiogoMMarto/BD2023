USE PFinal
GO

CREATE PROCEDURE addCrew
	@SupervisorID INTEGER,
	@id INTEGER output

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION
			INSERT INTO Crew(Supervisor)
			VALUES
				(@SupervisorID)
			SET @id=SCOPE_IDENTITY()
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
