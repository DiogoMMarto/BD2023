USE PFinal
GO

CREATE PROCEDURE addProgram
	@Name varchar(50),
	@Company INT,
	@id INT output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Program ( [Name] , Company )
	VALUES ( @Name , @Company) 

	SET @id=SCOPE_IDENTITY()
END
GO
