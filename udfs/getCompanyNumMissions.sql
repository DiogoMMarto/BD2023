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
CREATE FUNCTION getCompanyNumMissions (@ID INT)
RETURNS INT
AS
BEGIN
    DECLARE @NumMissions INT;
    
    SELECT @NumMissions = COUNT(*)
    FROM Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID  
    WHERE Company = @ID;
    
    RETURN @NumMissions;
END
GO

