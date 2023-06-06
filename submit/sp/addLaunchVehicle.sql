USE PFinal
GO

CREATE PROCEDURE addLaunchVehicle
	@LaunchCost money,
	@DevCost money,
	@Fuel varchar(30),
	@Type varchar(30),
	@Range INT,
	@Load varchar(100),
	@Veh_ID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO LaunchVehicle( Veh_ID , LaunchCost , DevCost , Fuel , [Type] , [Range] , [Load] )
		VALUES ( @Veh_ID , @LaunchCost , @DevCost , @Fuel ,@Type , @Range , @Load )

END
GO
