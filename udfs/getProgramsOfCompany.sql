USE PFinal

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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