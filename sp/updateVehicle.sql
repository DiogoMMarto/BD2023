CREATE PROCEDURE updateVehicle
	@Veh_ID INT,
	@Name varchar(50),
	@Owner INT,
	@Size varchar(30),
	@Mass INT,
	@Manufacturer varchar(50),
	@Description varchar(100),
	@Status varchar(50),
	@Location varchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Vehicle 
	SET [Name] = @Name, [Owner] =  @Owner, [Size] =  @Size, Mass =  @Mass, Manufacturer= @Manufacturer,[Description] =  @Description,[Status] =  @Status, [Location] =  @Location
	where [Veh_ID] = @Veh_ID
END
GO
