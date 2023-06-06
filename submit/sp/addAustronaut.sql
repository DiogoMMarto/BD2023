USE PFinal
GO

CREATE PROCEDURE addAustronaut
	@Per_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Astronaut( [Per_ID] )
	VALUES ( @Per_ID) 

END
GO
