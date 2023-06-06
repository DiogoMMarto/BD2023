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

	INSERT INTO CrewHasAstronaut(Crew_ID,Ast_ID,[Role])
		VALUES (@CrewID,@Ast_ID,'')

END
GO
