USE PFinal
GO

CREATE PROCEDURE addSatelite
	@Veh_ID INTEGER ,
	@Norad_ID INTEGER ,
	@Orbit_Type VARCHAR(8) ,
	@Perigee INTEGER ,
	@Apogee INTEGER,
	@Inclination DECIMAL(8,5),
	@Period TIME,
	@Latitude DECIMAL(8,5),
	@Longitude DECIMAL(8,5),
	@Altitude DECIMAL(8,2),
	@Speed DECIMAL(16,4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Satelite( Craft_ID , Norad_ID , Orbit_Type , Perigee , Apogee , Inclination , [Period] , Latitude , Longitude , Altitude ,Speed )
	VALUES
		(@Veh_ID, @Norad_ID , @Orbit_Type , @Perigee,@Apogee,@Inclination,@Period,@Latitude,@Longitude,@Altitude,@Speed)

END
GO
