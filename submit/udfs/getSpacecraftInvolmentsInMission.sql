USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
