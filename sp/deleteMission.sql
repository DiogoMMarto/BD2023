USE PFinal
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE deleteMission
	@id INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		BEGIN TRANSACTION 
			
			if(not exists(select * from Mission where Mission_ID = @id))
				RAISERROR('No such company.', 16, 1);

			delete from Mission where Mission_ID = @id

			delete from Payload where Mission_ID = @id

			delete from ProgramHasMission where Mission_ID = @id

			delete from [Event] where Mission_ID = @id

			UPDATE Launch
			SET Mission_ID = null
			where Mission_ID = @id

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
