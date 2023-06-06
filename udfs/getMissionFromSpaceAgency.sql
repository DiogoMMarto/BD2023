USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION getMissionsFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Company as Comp_ID , M.Mission_ID , Budget , [Description] , Beg_Date, Conc_Date FROM 
	Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID JOIN 
	Mission as M ON M.Mission_ID=PRM.Mission_ID 
	WHERE PR.Company=@SpaceCompanyID
)
GO
