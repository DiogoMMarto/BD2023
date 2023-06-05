USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
