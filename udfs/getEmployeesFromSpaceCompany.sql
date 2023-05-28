USE PFinal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION getEmployeesFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Company as Comp_ID , Fname,Lname,Birth,Email,Phone,Nationality, 'Astronaut' as [Role] FROM 
	Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID JOIN 
	Mission as M ON M.Mission_ID=PRM.Mission_ID JOIN
	Payload as PL ON PL.Mission_ID=M.Mission_ID JOIN
	Crew as C ON C.Crew_ID=PL.Crew_ID JOIN
	CrewHasAstronaut as CA ON CA.Crew_ID=C.Crew_ID JOIN
	Astronaut as A ON A.Per_ID=CA.Ast_ID JOIN
	Person as P ON P.Per_ID = A.Per_ID
	WHERE Company = @SpaceCompanyID
	GROUP BY Company  , Fname,Lname,Birth,Email,Phone,Nationality
UNION
SELECT SC.Comp_ID , Fname,Lname,Birth,Email,Phone,Nationality, 'CEO' as [Role]  FROM
	SpaceCompany as SC JOIN
	PrivateSpaceCompany as PSC ON PSC.Comp_ID = SC.Comp_ID JOIN
	CEO ON CEO.Per_ID=PSC.CEO JOIN
	Person as P ON P.Per_ID=CEO.Per_ID
	WHERE SC.Comp_ID= @SpaceCompanyID
)
GO
