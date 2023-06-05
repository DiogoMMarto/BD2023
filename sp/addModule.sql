USE PFinal
GO

CREATE PROCEDURE addModule
    @Type VARCHAR(16),
    @Description VARCHAR(256) ,
    @Status VARCHAR(8),
    @Craft_ID INTEGER,
	@id INTEGER output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Module( [Type] , [Description] , [Status] , Craft_ID )
	VALUES
		(@Type, @Description , @Status ,@Craft_ID)
	SET @id=SCOPE_IDENTITY()
END
GO
