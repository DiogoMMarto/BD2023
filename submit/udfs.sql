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

CREATE FUNCTION getEmployeesFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Company as Comp_ID ,P.Per_ID as Per_ID, Fname,Lname,Birth,Email,Phone,Nationality, 'Astronaut' as [Role] FROM 
	Program as PR JOIN 
	ProgramHasMission as PRM ON PRM.Prog_ID=PR.Prog_ID JOIN 
	Mission as M ON M.Mission_ID=PRM.Mission_ID JOIN
	Payload as PL ON PL.Mission_ID=M.Mission_ID JOIN
	Crew as C ON C.Crew_ID=PL.Crew_ID JOIN
	CrewHasAstronaut as CA ON CA.Crew_ID=C.Crew_ID JOIN
	Astronaut as A ON A.Per_ID=CA.Ast_ID JOIN
	Person as P ON P.Per_ID = A.Per_ID
	WHERE Company = @SpaceCompanyID
	GROUP BY Company,P.Per_ID , Fname,Lname,Birth,Email,Phone,Nationality
UNION
SELECT SC.Comp_ID , P.Per_ID as Per_ID, Fname,Lname,Birth,Email,Phone,Nationality, 'CEO' as [Role]  FROM
	SpaceCompany as SC JOIN
	PrivateSpaceCompany as PSC ON PSC.Comp_ID = SC.Comp_ID JOIN
	CEO ON CEO.Per_ID=PSC.CEO JOIN
	Person as P ON P.Per_ID=CEO.Per_ID
	WHERE SC.Comp_ID= @SpaceCompanyID
)
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

CREATE FUNCTION getPerson
(	
	@id INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM Person WHERE Per_ID=@id
)
GO


CREATE FUNCTION getProgramsOfCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT * FROM Program 
	WHERE Company=@SpaceCompanyID
)
GO

CREATE FUNCTION getRoverFromSpaceCompany 
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SP.Comp_ID,V.Veh_ID,V.[Name],[Size],[Manufacturer],[Description],[Status],[Location],R.Autonomy,R.Purpose from 
	SpaceCompany as SP JOIN
	Vehicle as V ON V.[Owner]=SP.Comp_ID JOIN
	ROVER as R ON R.Veh_ID = V.Veh_ID
	WHERE SP.Comp_ID = @SpaceCompanyID
)
GO

CREATE FUNCTION getSpaceAgency(
	@Private BIT = 1 , 
	@Public BIT = 1,
	@Country varchar(100) = '%',
	@Name varchar(100) = '%')
RETURNS TABLE 
AS
RETURN 
(
	SELECT C.Name , C.Comp_ID, C.Acronym , C.Country , P.Gov as [Owner] , 'Public' as Type from	
		SpaceCompany as C JOIN PublicSpaceCompany as P ON P.Comp_ID=C.Comp_ID
			where C.Country like @Country and C.Name like @Name and @Public*C.Comp_ID > 0
	UNION
	SELECT C.Name , C.Comp_ID, C.Acronym , C.Country , concat(Person.Fname,' ',Person.Lname) as [Owner] , 'Private' as Type from	
		SpaceCompany as C JOIN 
		PrivateSpaceCompany as P ON P.Comp_ID=C.Comp_ID JOIN
		CEO ON CEO.Per_ID = P.CEO JOIN
		Person ON CEO.Per_ID = Person.Per_ID
			where C.Country like @Country and C.Name like @Name and @Private*C.Comp_ID > 0
)
GO

CREATE FUNCTION getSpacecraftFromSpaceCompany
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SP.Comp_ID,V.Veh_ID,V.[Name],[Size],[Manufacturer],[Description],[Status],[Location],S.Propulsion,S.Purpose from 
	SpaceCompany as SP JOIN
	Vehicle as V ON V.[Owner]=SP.Comp_ID JOIN
	SpaceCraft as S ON S.Veh_ID = V.Veh_ID
	WHERE SP.Comp_ID = @SpaceCompanyID
)
GO

CREATE FUNCTION getSpacecraftInvolmentsInMission
(	
	@MissionID INTEGER,
	@CraftID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT v.Veh_ID as SpacecraftID, v.[Name] as SpacecraftName , 
		pl.Mission_ID as MissionID , pl.Crew_ID as CrewID , pl.Rover_ID as RoverID , R.[Name] , L.LaunchID as LaunchID, 
		L.LaunchVehicleID as LaunchVehicleID , L.LaunchVehicleName as LaunchVehicleName , 
		L.LaunchSiteName as LaunchSiteName , L.LaunchSiteLocation as LaunchSiteLocation  from
			SpaceCraft as sc JOIN
			Payload as pl ON sc.Veh_ID = pl.Craft_ID LEFT OUTER JOIN
			Vehicle as R ON R.Veh_ID = pl.Rover_ID JOIN
			Vehicle as v ON v.Veh_ID = sc.Veh_ID LEFT OUTER JOIN
			( SELECT l.Launch_ID as LaunchID, l.Mission_ID as Mission_ID,
					v2.Veh_ID as LaunchVehicleID , v2.[Name] as LaunchVehicleName , 
					ls.[Name] as LaunchSiteName , ls.[Location] as LaunchSiteLocation from Launch as l JOIN
					LaunchVehicle as lv ON lv.Veh_ID = l.LaunchV_ID JOIN
					Vehicle as v2 ON v2.Veh_ID = lv.Veh_ID JOIN
					LaunchSite as ls ON ls.LaunchS_ID = l.LaunchS_ID 
			) as L ON L.Mission_ID = pl.Mission_ID
				WHERE pl.Mission_ID = @MissionID and ( pl.Craft_ID = @CraftID or @CraftID = -1 )
)
GO

CREATE FUNCTION getSpacecraftsOfMission 
(	
	@MissionID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT v.Veh_ID , v.Name , pl.Mission_ID from
		SpaceCraft as sc JOIN
		Payload as pl ON sc.Veh_ID = pl.Craft_ID JOIN
		Vehicle as v ON v.Veh_ID = sc.Veh_ID
		WHERE pl.Mission_ID = @MissionID
)
GO

CREATE FUNCTION getVehiclesFromSpaceCompany 
(	
	@SpaceCompanyID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT SP.Comp_ID,V.Veh_ID,V.[Name],[Size],[Manufacturer],[Description],[Status],[Location] from 
	SpaceCompany as SP JOIN
	Vehicle as V ON V.[Owner]=SP.Comp_ID
	WHERE SP.Comp_ID = @SpaceCompanyID
)
GO

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


