USE PFinal
GO

CREATE PROCEDURE updateModule
	@Module_ID INTEGER,
    @Type VARCHAR(16),
    @Description VARCHAR(256) ,
    @Status VARCHAR(8),
    @Craft_ID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Module SET [Type] = @Type , [Description] = @Description , [Status] = @Status , Craft_ID = @Craft_ID
	WHERE [Module_ID] = @Module_ID

END
GO
