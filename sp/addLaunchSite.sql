USE PFinal
GO

CREATE PROCEDURE addLaunchSite
	@Location varchar(150),
	@Comp_ID INT,
	@Name varchar(100),
	@id INTEGER output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO LaunchSite( [Location] , [Comp_ID] ,[Name] )
		VALUES ( @Location , @Comp_ID , @Name)

	SET @id=SCOPE_IDENTITY()
END
GO
