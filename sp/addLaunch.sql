USE PFinal
GO

CREATE PROCEDURE addLaunch
	@Mission_ID INT ,
	@LaunchS_ID INT ,
	@LaunchV_ID INT ,
	@id INT output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO Launch( Mission_ID , LaunchS_ID , LaunchV_ID )
		VALUES ( @Mission_ID , @LaunchS_ID , @LaunchV_ID )

	SET @id=SCOPE_IDENTITY()
END
GO
