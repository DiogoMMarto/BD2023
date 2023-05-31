USE PFinal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION getNumMissions (@ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @NumMissions INT;
    
    SELECT @NumMissions = COUNT(PL.Mission_ID)
    FROM Person AS P
    JOIN CrewHasAstronaut AS CA ON P.Per_ID = CA.Ast_ID
    JOIN Crew AS C ON C.Crew_ID = CA.Crew_ID
    JOIN Payload AS PL ON PL.Crew_ID = C.Crew_ID
    WHERE P.Per_ID = @ID;
    
    RETURN @NumMissions;
END
GO

