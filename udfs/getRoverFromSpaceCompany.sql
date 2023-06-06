USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
