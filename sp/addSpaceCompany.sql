USE PFinal
GO

CREATE PROCEDURE addCompany 
	@Name varchar(100) ,
	@Country varchar(100) ,
	@Acronym varchar(10) ,
	@Type varchar(16) ,
	@Owner varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			INSERT INTO SpaceCompany ([Name],Acronym,Country)
					VALUES
						(@Name,@Acronym,@Country)

			DECLARE @ID INT =  SCOPE_IDENTITY() 

			IF @Type like 'Public'
				BEGIN

					INSERT INTO PublicSpaceCompany( Comp_ID ,Gov )
					VALUES
						(@ID,@Owner)
				END
			ELSE IF @Type like 'Private'
				BEGIN
					IF EXISTS ( SELECT * from CEO where Per_ID = @Owner )
					INSERT INTO PrivateSpaceCompany( Comp_ID ,CEO )
					VALUES
						(@ID,@Owner);
					ELSE
						RAISERROR('No such ceo',16,1);
				END
			ELSE
				RAISERROR('Not a valid Agency type.', 16, 1);
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
