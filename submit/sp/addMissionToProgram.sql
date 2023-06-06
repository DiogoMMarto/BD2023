USE PFinal
GO

CREATE PROCEDURE addMissionToProgram
	@Program INTEGER,
	@MissionID INTEGER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO ProgramHasMission(Prog_ID,Mission_ID)
		VALUES (@Program,@MissionID)
END
GO
