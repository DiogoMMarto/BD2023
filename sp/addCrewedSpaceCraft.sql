USE PFinal
GO

CREATE PROCEDURE addCrewedSpaceCraft
	@Veh_ID INTEGER ,
	@Min_Capacity INTEGER ,
	@Max_Capacity INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO CrewedSpaceCraft ( Craft_ID , Max_Capacity , Min_Capacity )
	VALUES
		(@Veh_ID, @Max_Capacity , @Min_Capacity)

END
GO
