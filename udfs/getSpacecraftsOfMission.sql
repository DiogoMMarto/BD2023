USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
