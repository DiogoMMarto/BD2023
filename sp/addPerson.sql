USE PFinal
GO

CREATE PROCEDURE addPerson
	@Type varchar(16) ,
	@Fname varchar(100) ,
	@Lname varchar(10) ,
	@Birth varchar(16) ,
	@Email varchar(100) ,
	@Phone varchar(30),
	@Nationality varchar(100),
	@Networth money = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO [Person] (Fname,Lname,Birth,Email,Phone,Nationality)
			VALUES
				(@Fname,@Lname,@Birth,@Email,@Phone,@Nationality)

			DECLARE @ID INT =  SCOPE_IDENTITY() 

			IF @Type = 'CEO'
			INSERT INTO CEO (Per_ID,Networth)
			VALUES
				(@ID,@Networth)
			ELSE IF @Type = 'Austronaut'
			INSERT INTO Astronaut(Per_ID)
			VALUES
				(@ID)
			ELSE IF @Type != 'None'
				RAISERROR('Not a valid Person type.', 16, 1);
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
