USE PFinal
GO

CREATE PROCEDURE addToCrew
	@CrewID INTEGER,
	@Ast_ID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			INSERT INTO CrewHasAstronaut(Crew_ID,Ast_ID,[Role])
			VALUES
				(@CrewID,@Ast_ID,'')
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
