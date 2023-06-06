USE PFinal
GO

CREATE PROCEDURE addSpaceProbe
	@Veh_ID INTEGER ,
	@Comm_Type VARCHAR(32) ,
	@Scope VARCHAR(16)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SpaceProbe( Craft_ID , Comm_Type , Scope )
	VALUES
		(@Veh_ID, @Comm_Type , @Scope)

END
GO
