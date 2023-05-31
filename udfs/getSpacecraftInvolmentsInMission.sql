USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION getSpacecraftInvolmentsInMission
(	
	@MissionID INTEGER
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT v.Veh_ID as SpacecraftID, v.[Name] as SpacecraftName , 
		pl.Mission_ID as MissionID , pl.Crew_ID as CrewID , pl.Rover_ID as RoverID , 
		l.Launch_ID as LaunchID, 
		v2.Veh_ID as LaunchVehicleID , v2.[Name] as LaunchVehicleName , 
		ls.[Name] as LaunchSiteName , ls.[Location] as LaunchSiteLocation  from
			SpaceCraft as sc JOIN
			Payload as pl ON sc.Veh_ID = pl.Craft_ID JOIN
			Vehicle as v ON v.Veh_ID = sc.Veh_ID JOIN
			LaunchHasSpacecraft as lsc ON lsc.Craft_ID = sc.Veh_ID JOIN
			Launch as l ON lsc.Launch_ID = l.Launch_ID JOIN
			LaunchVehicle as lv ON lv.Veh_ID = l.LaunchV_ID JOIN
			Vehicle as v2 ON v2.Veh_ID = lv.Veh_ID JOIN
			LaunchSite as ls ON ls.LaunchS_ID = l.LaunchS_ID
				WHERE pl.Mission_ID = @MissionID and l.Mission_ID = @MissionID
)
GO
