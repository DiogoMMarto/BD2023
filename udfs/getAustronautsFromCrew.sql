USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION getAustronautsFromCrew
(	
	@CrewID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * from AstronautView as AV JOIN CrewHasAstronaut as CHA ON AV.Per_ID = CHA.Ast_ID WHERE CHA.Crew_ID = @CrewID
)
GO
