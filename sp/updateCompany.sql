USE PFinal
GO

CREATE PROCEDURE updateCompany 
	@ID INTEGER,
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
			
			UPDATE SpaceCompany 
			SET [Name] = @Name , [Country] = @Country , Acronym = @Acronym
			WHERE Comp_ID = @ID


			IF @Type like 'Public'
				BEGIN
					IF NOT EXISTS ( Select * from PublicSpaceCompany where Comp_ID = @ID)
					BEGIN
					INSERT INTO PublicSpaceCompany( Comp_ID ,Gov )
					VALUES
						(@ID,@Owner)
					DELETE from PrivateSpaceCompany where Comp_ID = @ID
					END
				END
			ELSE IF @Type like 'Private'
				BEGIN
					IF NOT EXISTS (select * from PrivateSpaceCompany where Comp_ID = @ID)
					BEGIN
						IF EXISTS ( SELECT * from CEO where Per_ID = @Owner )
							INSERT INTO PrivateSpaceCompany( Comp_ID ,CEO )
								VALUES
									(@ID,@Owner);
						ELSE
							RAISERROR('No such ceo',16,1);
						DELETE from PublicSpaceCompany where Comp_ID = @ID
					END
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
