USE PFinal
GO

CREATE PROCEDURE addRover
	@Veh_ID INT,
	@Purpose VARCHAR(64),
	@Autonomy INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Rover ( Veh_ID,Purpose,Autonomy )
	VALUES ( @Veh_ID,@Purpose,@Autonomy)  

END
GO
