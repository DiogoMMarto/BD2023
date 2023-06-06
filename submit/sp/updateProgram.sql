CREATE PROCEDURE updateProgram
    @ProgramID INT,
    @Name VARCHAR(50),
    @CompanyID INT
AS
BEGIN
    UPDATE Program
    SET
        [Name] = @Name,
        Company = @CompanyID
    WHERE
        Prog_ID = @ProgramID;
END;
GO