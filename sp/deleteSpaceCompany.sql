USE PFinal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE deleteSpaceCompany
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from SpaceCompany where Comp_ID = @id))
				RAISERROR('No such company.', 16, 1);

			delete from SpaceCompany where Comp_ID = @id

			delete from PrivateSpaceCompany where Comp_ID = @id

			delete from PrivateSpaceCompany where Comp_ID = @id

			UPDATE Vehicle
			SET [Owner] = null
			where [Owner] = @id

			DECLARE @pid as int , @comp as int;

			DECLARE C CURSOR FAST_FORWARD
			FOR select Prog_ID,Company from Program

			OPEN C

			FETCH C into @pid , @comp

			WHILE @@FETCH_STATUS = 0
			BEGIN
				if @comp = @id
					EXEC deleteProgram @pid;
				FETCH C into @pid , @comp;
			END

			CLOSE C;
			DEALLOCATE C;	

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
