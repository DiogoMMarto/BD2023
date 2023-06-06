CREATE PROCEDURE updateMission
    @MissionID INT,
    @Budget MONEY,
    @Description VARCHAR(400),
    @BegDate DATE,
    @ConcDate DATE
AS
BEGIN
    UPDATE Mission
    SET
        Budget = @Budget,
        [Description] = @Description,
        Beg_Date = @BegDate,
        Conc_Date = @ConcDate
    WHERE
        Mission_ID = @MissionID;
END;
GO