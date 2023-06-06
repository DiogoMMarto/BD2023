USE PFinal

CREATE TRIGGER EmailOrPhone ON [Person]
INSTEAD OF INSERT,UPDATE
AS
BEGIN
	IF (SELECT count(*) FROM inserted) = 1
		BEGIN
			DECLARE @email as varchar(100);
			DECLARE @phone as INTEGER;
		
			SELECT @email = Email , @phone = Phone FROM inserted;

			IF (@email) is null and (@phone) is null
				RAISERROR('Person needs to have at least a phone number or an email.',16,1)
			ELSE
				BEGIN
					INSERT INTO [Person] (Per_ID, Fname, Lname, Birth, Email, Phone, Nationality)
					SELECT Per_ID, Fname, Lname, Birth, Email, Phone, Nationality
					FROM inserted;
				END
		END
END
GO