USE PFinal
GO

CREATE PROCEDURE addEvent
	@Mission_ID INT,
	@Name varchar(100),
	@Date date,
	@Status varchar(400)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [Event]( [Name], [Date], [Status], Mission_ID)
		VALUES (@Name,@Date,@Status,@Mission_ID)
END
GO
