USE PFinal
GO

CREATE PROCEDURE addSpacecraft
	@Veh_ID INT,
	@Purpose varchar(32),
	@Propulsion varchar(64),
	@COSPAR_ID varchar(16)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO SpaceCraft ( Veh_ID , Purpose ,Propulsion, COSPAR_ID )
		VALUES ( @Veh_ID , @Purpose , @Propulsion,@COSPAR_ID)

END
GO
