USE PFinal
GO

CREATE PROCEDURE addVehicle
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

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO Vehicle( [Name], [Owner], Size, Mass, Manufacturer, [Description], [Status], [Location])
			VALUES
				( @Name, @Owner, @Size, @Mass, @Manufacturer, @Description, @Status, @Location)
			
		COMMIT 
	END TRY
	BEGIN CATCH 
		IF (@@TRANCOUNT > 0)
			BEGIN
				ROLLBACK TRANSACTION 
				PRINT 'Error detected, all changes reversed'
			END 
	END CATCH
END
GO
