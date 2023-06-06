CREATE PROCEDURE updatePerson
    @PersonID INT,
    @FirstName VARCHAR(32),
    @LastName VARCHAR(32),
    @BirthDate DATE,
    @Email VARCHAR(100),
    @Phone VARCHAR(30),
    @Nationality VARCHAR(100)
AS
BEGIN
    UPDATE Person
    SET
        Fname = @FirstName,
        Lname = @LastName,
        Birth = @BirthDate,
        Email = @Email,
        Phone = @Phone,
        Nationality = @Nationality
    WHERE
        Per_ID = @PersonID;
END;
GO